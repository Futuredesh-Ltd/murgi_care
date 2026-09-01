import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../model/local_databank_models.dart';
import '../../../controller/local_databank_providers.dart';

class VaccinationScheduleScreen extends ConsumerStatefulWidget {
  final bool isEnglish;

  const VaccinationScheduleScreen({super.key, required this.isEnglish});

  @override
  ConsumerState<VaccinationScheduleScreen> createState() => _VaccinationScheduleScreenState();
}

class _VaccinationScheduleScreenState extends ConsumerState<VaccinationScheduleScreen> {
  bool _isCalendarView = true;

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  List<LocalVaccineSchedule> _getSchedulesForDate(List<LocalVaccineSchedule> schedules, DateTime date) {
    return schedules.where((s) => _isSameDay(s.scheduledDate, date)).toList();
  }

  @override
  Widget build(BuildContext context) {
    final isEng = widget.isEnglish;
    final state = ref.watch(vaccineScheduleProvider);
    final notifier = ref.read(vaccineScheduleProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(isEng ? "Vaccination Calendar & Schedule" : "ভ্যাকসিন ক্যালেন্ডার ও সিডিউল"),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(_isCalendarView ? Icons.view_list_rounded : Icons.calendar_month_rounded),
            tooltip: _isCalendarView
                ? (isEng ? "Switch to List View" : "তালিকা ভিউতে যান")
                : (isEng ? "Switch to Calendar View" : "ক্যালেন্ডার ভিউতে যান"),
            onPressed: () => setState(() => _isCalendarView = !_isCalendarView),
          ),
        ],
      ),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator(color: Colors.teal))
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Flock Selector Bar
                  Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            isEng ? "Select Flock" : "ফ্লক নির্বাচন করুন",
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          const SizedBox(height: 8),
                          if (state.flocks.isEmpty)
                            Text(
                              isEng
                                  ? "Please add a flock first in Flock Management."
                                  : "প্রথমে ফ্লক ম্যানেজমেন্টে ফ্লক যোগ করুন।",
                              style: TextStyle(color: Colors.grey[600]),
                            )
                          else
                            DropdownButtonFormField<LocalFlock>(
                              initialValue: state.selectedFlock,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              ),
                              items: state.flocks
                                  .map((f) => DropdownMenuItem(
                                        value: f,
                                        child: Text("${f.name} (${f.birdType})"),
                                      ))
                                  .toList(),
                              onChanged: (val) {
                                if (val != null) {
                                  notifier.selectFlock(val);
                                }
                              },
                            ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  if (state.selectedFlock != null) ...[
                    // Action Buttons Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _isCalendarView
                              ? (isEng ? "Vaccine Calendar View" : "ভ্যাকসিন ক্যালেন্ডার")
                              : (isEng ? "Full Vaccine List" : "সম্পূর্ণ ভ্যাকসিন তালিকা"),
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Row(
                          children: [
                            TextButton.icon(
                              onPressed: () => notifier.loadDemoSchedules(isEng),
                              icon: const Icon(Icons.download, size: 16),
                              label: Text(isEng ? "Demo Routine" : "ডেমো রুটিন"),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add_circle, color: Colors.teal, size: 28),
                              onPressed: () => _showAddScheduleDialog(
                                context,
                                ref,
                                state.selectedFlock!,
                                preselectedDate: state.selectedDate,
                              ),
                              tooltip: isEng ? "Add Vaccine" : "নতুন ভ্যাকসিন যোগ করুন",
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    if (_isCalendarView) ...[
                      // Calendar Grid Card
                      _buildInteractiveCalendar(context, ref, state),
                      const SizedBox(height: 16),

                      // Selected Date Vaccine Details
                      _buildSelectedDateVaccines(context, ref, state),
                    ] else ...[
                      // Full List View
                      _buildFullScheduleListView(context, ref, state),
                    ],
                  ],
                ],
              ),
            ),
    );
  }

  // --- INTERACTIVE CALENDAR WIDGET ---
  Widget _buildInteractiveCalendar(BuildContext context, WidgetRef ref, VaccineScheduleState state) {
    final isEng = widget.isEnglish;
    final notifier = ref.read(vaccineScheduleProvider.notifier);
    final focusedMonth = state.calendarFocusedMonth;
    final selectedDate = state.selectedDate;

    final firstDayOfMonth = DateTime(focusedMonth.year, focusedMonth.month, 1);
    final daysInMonth = DateTime(focusedMonth.year, focusedMonth.month + 1, 0).day;
    final startWeekday = firstDayOfMonth.weekday % 7; // 0 = Sunday

    final monthNamesEn = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    final monthNamesBn = [
      'জানুয়ারি', 'ফেব্রুয়ারি', 'মার্চ', 'এপ্রিল', 'মে', 'জুন',
      'জুলাই', 'আগস্ট', 'সেপ্টেম্বর', 'অক্টোবর', 'নভেম্বর', 'ডিসেম্বর'
    ];

    final weekDaysEn = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    final weekDaysBn = ['রবি', 'সোম', 'মঙ্গল', 'বুধ', 'বৃহঃ', 'শুক্র', 'শনি'];

    final monthLabel = isEng
        ? "${monthNamesEn[focusedMonth.month - 1]} ${focusedMonth.year}"
        : "${monthNamesBn[focusedMonth.month - 1]} ${focusedMonth.year}";

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Calendar Month Controls
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left_rounded, color: Colors.teal),
                  onPressed: () {
                    final prevMonth = DateTime(focusedMonth.year, focusedMonth.month - 1, 1);
                    notifier.setCalendarFocusedMonth(prevMonth);
                  },
                ),
                Text(
                  monthLabel,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.teal),
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right_rounded, color: Colors.teal),
                  onPressed: () {
                    final nextMonth = DateTime(focusedMonth.year, focusedMonth.month + 1, 1);
                    notifier.setCalendarFocusedMonth(nextMonth);
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Weekday Headers Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(7, (idx) {
                return Expanded(
                  child: Center(
                    child: Text(
                      isEng ? weekDaysEn[idx] : weekDaysBn[idx],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: idx == 5 ? Colors.redAccent : Colors.grey[700], // Highlight Friday
                      ),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 8),
            const Divider(height: 1),

            // Days Grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: startWeekday + daysInMonth,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                childAspectRatio: 1.0,
              ),
              itemBuilder: (context, index) {
                if (index < startWeekday) {
                  return const SizedBox.shrink();
                }

                final dayNum = index - startWeekday + 1;
                final cellDate = DateTime(focusedMonth.year, focusedMonth.month, dayNum);
                final isSelected = _isSameDay(cellDate, selectedDate);
                final isToday = _isSameDay(cellDate, DateTime.now());

                final daySchedules = _getSchedulesForDate(state.schedules, cellDate);
                final hasVaccine = daySchedules.isNotEmpty;
                final bool allCompleted = hasVaccine && daySchedules.every((s) => s.status == 'completed');

                return GestureDetector(
                  onTap: () {
                    notifier.setSelectedDate(cellDate);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Colors.teal
                          : (isToday ? Colors.teal.shade50 : Colors.white),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: isSelected
                            ? Colors.teal
                            : (isToday ? Colors.teal : Colors.grey.shade300),
                        width: isSelected || isToday ? 1.5 : 1.0,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Center(
                          child: Text(
                            "$dayNum",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: isSelected || isToday ? FontWeight.bold : FontWeight.normal,
                              color: isSelected
                                  ? Colors.white
                                  : (isToday ? Colors.teal.shade900 : Colors.black87),
                            ),
                          ),
                        ),
                        if (hasVaccine)
                          Positioned(
                            bottom: 4,
                            left: 0,
                            right: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 6,
                                  height: 6,
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? Colors.white
                                        : (allCompleted ? Colors.green : Colors.amber.shade900),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),

            // Legend
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _legendDot(Colors.amber.shade900, isEng ? "Pending Vaccine" : "পেন্ডিং ভ্যাকসিন"),
                const SizedBox(width: 16),
                _legendDot(Colors.green, isEng ? "Completed Vaccine" : "সম্পন্ন ভ্যাকসিন"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _legendDot(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(fontSize: 11, color: Colors.grey)),
      ],
    );
  }

  // --- VACCINES FOR SELECTED DATE ---
  Widget _buildSelectedDateVaccines(BuildContext context, WidgetRef ref, VaccineScheduleState state) {
    final isEng = widget.isEnglish;
    final notifier = ref.read(vaccineScheduleProvider.notifier);
    final selectedDate = state.selectedDate;
    final flock = state.selectedFlock!;

    final dateSchedules = _getSchedulesForDate(state.schedules, selectedDate);
    final ageInDays = selectedDate.difference(flock.startDate).inDays + 1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          color: Colors.teal.shade50,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.teal),
                    ),
                    Text(
                      isEng ? "Flock Age: Day $ageInDays" : "ফ্লকের বয়স: $ageInDays তম দিন",
                      style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                    ),
                  ],
                ),
                ElevatedButton.icon(
                  onPressed: () => _showAddScheduleDialog(context, ref, flock, preselectedDate: selectedDate),
                  icon: const Icon(Icons.add, size: 16),
                  label: Text(isEng ? "Add for this Date" : "এই তারিখে যোগ"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),

        if (dateSchedules.isEmpty)
          Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Text(
                isEng
                    ? "No vaccine scheduled on this date. Tap 'Add for this Date' to set one."
                    : "এই তারিখে কোনো ভ্যাকসিন নির্ধারিত নেই। 'এই তারিখে যোগ' বাটনে চাপুন।",
                style: TextStyle(color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
            ),
          )
        else
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: dateSchedules.length,
            itemBuilder: (context, index) {
              final s = dateSchedules[index];
              final bool isDone = s.status == 'completed';

              return Card(
                margin: const EdgeInsets.only(bottom: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: isDone ? Colors.green.shade300 : Colors.amber.shade300),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: isDone ? Colors.green.shade100 : Colors.amber.shade100,
                    child: Icon(
                      isDone ? Icons.check_circle : Icons.schedule,
                      color: isDone ? Colors.green.shade800 : Colors.amber.shade900,
                    ),
                  ),
                  title: Text(
                    "${s.vaccineName} (${s.diseaseName})",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    isEng
                        ? "Target Age: Day ${s.targetAgeDays} | Notes: ${s.notes}"
                        : "নির্ধারিত বয়স: ${s.targetAgeDays} দিন | নোট: ${s.notes}",
                    style: const TextStyle(fontSize: 12),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Switch(
                        value: isDone,
                        activeThumbColor: Colors.green,
                        onChanged: (val) {
                          notifier.updateStatus(s.id, val ? 'completed' : 'pending');
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.grey, size: 18),
                        onPressed: () => notifier.deleteSchedule(s.id),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
      ],
    );
  }

  // --- FULL SCHEDULE LIST VIEW ---
  Widget _buildFullScheduleListView(BuildContext context, WidgetRef ref, VaccineScheduleState state) {
    final isEng = widget.isEnglish;
    final notifier = ref.read(vaccineScheduleProvider.notifier);

    if (state.schedules.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Text(
            isEng ? "No vaccine schedule found. Tap 'Demo Routine' or '+'." : "কোনো ভ্যাকসিন সিডিউল নেই। 'ডেমো রুটিন' চাপুন।",
            style: TextStyle(color: Colors.grey[600]),
          ),
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: state.schedules.length,
      itemBuilder: (context, index) {
        final s = state.schedules[index];
        final bool isDone = s.status == 'completed';

        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: isDone ? Colors.green.shade300 : Colors.amber.shade300,
            ),
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: isDone ? Colors.green.shade100 : Colors.amber.shade100,
              child: Icon(
                isDone ? Icons.check_circle : Icons.schedule,
                color: isDone ? Colors.green.shade800 : Colors.amber.shade900,
              ),
            ),
            title: Text(
              "${s.vaccineName} (${s.diseaseName})",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              isEng
                  ? "Date: ${s.scheduledDate.day}/${s.scheduledDate.month}/${s.scheduledDate.year} (Day ${s.targetAgeDays})\nNotes: ${s.notes}"
                  : "তারিখ: ${s.scheduledDate.day}/${s.scheduledDate.month}/${s.scheduledDate.year} (${s.targetAgeDays} তম দিন)\nনোট: ${s.notes}",
              style: const TextStyle(fontSize: 12),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Switch(
                  value: isDone,
                  activeThumbColor: Colors.green,
                  onChanged: (val) {
                    notifier.updateStatus(s.id, val ? 'completed' : 'pending');
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.grey, size: 18),
                  onPressed: () => notifier.deleteSchedule(s.id),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showAddScheduleDialog(
    BuildContext context,
    WidgetRef ref,
    LocalFlock selectedFlock, {
    DateTime? preselectedDate,
  }) {
    final vNameCtrl = TextEditingController();
    final dNameCtrl = TextEditingController();
    final notesCtrl = TextEditingController();
    final isEng = widget.isEnglish;

    DateTime targetDate = preselectedDate ?? DateTime.now();
    final calculatedAge = targetDate.difference(selectedFlock.startDate).inDays + 1;
    final ageCtrl = TextEditingController(text: calculatedAge > 0 ? "$calculatedAge" : "1");

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(isEng ? "Add Vaccine Entry" : "নতুন ভ্যাকসিন যোগ করুন"),
        content: StatefulBuilder(
          builder: (context, setDlgState) => SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: vNameCtrl,
                  decoration: InputDecoration(labelText: isEng ? "Vaccine Name" : "ভ্যাকসিনের নাম"),
                ),
                TextField(
                  controller: dNameCtrl,
                  decoration: InputDecoration(labelText: isEng ? "Target Disease" : "রোগের নাম"),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    isEng
                        ? "Date: ${targetDate.day}/${targetDate.month}/${targetDate.year}"
                        : "তারিখ: ${targetDate.day}/${targetDate.month}/${targetDate.year}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: const Icon(Icons.calendar_today, color: Colors.teal),
                  onTap: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: targetDate,
                      firstDate: selectedFlock.startDate.subtract(const Duration(days: 30)),
                      lastDate: selectedFlock.startDate.add(const Duration(days: 365)),
                    );
                    if (picked != null) {
                      setDlgState(() {
                        targetDate = picked;
                        final newAge = picked.difference(selectedFlock.startDate).inDays + 1;
                        ageCtrl.text = newAge > 0 ? "$newAge" : "1";
                      });
                    }
                  },
                ),
                TextField(
                  controller: ageCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: isEng ? "Target Age (Days)" : "বয়স (দিনে)"),
                ),
                TextField(
                  controller: notesCtrl,
                  decoration: InputDecoration(labelText: isEng ? "Method / Notes" : "প্রয়োগের নিয়ম / নোট"),
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text(isEng ? "Cancel" : "বাতিল")),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
            onPressed: () {
              if (vNameCtrl.text.isNotEmpty) {
                final targetAge = int.tryParse(ageCtrl.text) ?? 1;
                final sched = LocalVaccineSchedule(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  flockId: selectedFlock.id,
                  vaccineName: vNameCtrl.text,
                  diseaseName: dNameCtrl.text,
                  targetAgeDays: targetAge,
                  scheduledDate: targetDate,
                  status: 'pending',
                  notes: notesCtrl.text,
                );
                ref.read(vaccineScheduleProvider.notifier).addSchedule(sched);
                if (ctx.mounted) Navigator.pop(ctx);
              }
            },
            child: Text(isEng ? "Save" : "সংরক্ষণ"),
          ),
        ],
      ),
    );
  }
}
