import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../model/local_databank_models.dart';
import '../../../controller/local_databank_providers.dart';
import 'molting_protocol_guide_screen.dart';

class MoltingMonitorScreen extends ConsumerWidget {
  final bool isEnglish;

  const MoltingMonitorScreen({super.key, required this.isEnglish});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEng = isEnglish;
    final state = ref.watch(moltingMonitorProvider);
    final notifier = ref.read(moltingMonitorProvider.notifier);

    final activeCount = state.records.where((r) => !r.currentPhase.contains('Recovery')).length;
    final dangerCount = state.records.where((r) => r.notes.toLowerCase().contains('danger') || r.weightLossPercent > 25).length;
    final recoveryCount = state.records.where((r) => r.currentPhase.contains('Recovery')).length;

    return Scaffold(
      backgroundColor: const Color(0xFFF4F7F6),
      appBar: AppBar(
        title: Text(isEng ? "Molting Monitoring" : "মোল্টিং মনিটরিং"),
        backgroundColor: const Color(0xFF1B4F72),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator(color: Color(0xFF1B4F72)))
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title & Subtitle Banner
                  Center(
                    child: Column(
                      children: [
                        Text(
                          isEng ? "Molting Management" : "মোল্টিং ব্যবস্থাপনা",
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1E293B),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          isEng
                              ? "Manage molting flocks, monitor progress and follow the guided protocol"
                              : "মোল্টিং ফ্লক পরিচালনা করুন, অগ্রগতি দেখুন এবং গাইডেড প্রটোকল অনুসরণ করুন",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Action Button 1: Add New Molting Flock
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        if (state.flocks.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(isEng ? "Please add a flock first." : "প্রথমে একটি ফ্লক যোগ করুন।")),
                          );
                          return;
                        }
                        _showAddMoltingDialog(context, ref, state.selectedFlock ?? state.flocks.first);
                      },
                      icon: const Icon(Icons.add, color: Colors.white),
                      label: Text(
                        isEng ? "+ Add New Molting Flock" : "+ নতুন মোল্টিং ফ্লক যোগ করুন",
                        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2E7D32),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        elevation: 2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Action Button 2: Molting Protocol Guide
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => MoltingProtocolGuideScreen(isEnglish: isEng),
                          ),
                        );
                      },
                      icon: const Icon(Icons.info_outline_rounded, color: Colors.white),
                      label: Text(
                        isEng ? "ℹ Molting Protocol Guide" : "ℹ মোল্টিং প্রটোকল গাইড",
                        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00695C),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        elevation: 2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Molting Dashboard Header
                  Text(
                    isEng ? "Molting Dashboard" : "মোল্টিং ড্যাশবোর্ড",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // 2x2 Metric Grid Cards
                  Row(
                    children: [
                      Expanded(
                        child: _dashboardCard(
                          title: isEng ? "Active" : "সক্রিয়",
                          subtitle: isEng ? "Running programs" : "চলমান প্রোগ্রাম",
                          value: "$activeCount",
                          color: const Color(0xFF2E7D32),
                          bgColor: const Color(0xFFF0FDF4),
                          borderColor: Colors.green.shade200,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _dashboardCard(
                          title: isEng ? "Danger" : "বিপদ",
                          subtitle: isEng ? "Need attention" : "মনোযোগ দিন",
                          value: "$dangerCount",
                          color: Colors.red.shade700,
                          bgColor: const Color(0xFFFEF2F2),
                          borderColor: Colors.red.shade200,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: _dashboardCard(
                          title: isEng ? "Recovery" : "রিকভারি",
                          subtitle: isEng ? "Recovery stage" : "পুনরুদ্ধার ধাপ",
                          value: "$recoveryCount",
                          color: const Color(0xFF1D4ED8),
                          bgColor: const Color(0xFFEFF6FF),
                          borderColor: Colors.blue.shade200,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _dashboardCard(
                          title: isEng ? "Pending Entry" : "অপেক্ষমান এন্ট্রি",
                          subtitle: isEng ? "Daily entry due" : "দৈনিক রেকর্ড বাকি",
                          value: "0",
                          color: Colors.amber.shade900,
                          bgColor: const Color(0xFFFFFBEB),
                          borderColor: Colors.amber.shade200,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Active Molting Flocks Banner
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE0F2FE),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFFBAE6FD)),
                    ),
                    child: Text(
                      isEng ? "Active Molting Flocks" : "সক্রিয় মোল্টিং ফ্লক সমূহ",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0369A1),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Active Flocks List or Empty State
                  if (state.records.isEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: Center(
                        child: Text(
                          isEng ? "No active molting flock" : "কোন সক্রিয় মোল্টিং ফ্লক নেই",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                  else
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.records.length,
                      itemBuilder: (context, index) {
                        final r = state.records[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                          elevation: 1.5,
                          child: Padding(
                            padding: const EdgeInsets.all(14),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Chip(
                                      label: Text(
                                        r.currentPhase,
                                        style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                                      ),
                                      backgroundColor: const Color(0xFF00695C),
                                    ),
                                    Text(
                                      "${isEng ? 'Started' : 'শুরু'}: ${r.startDate.day}/${r.startDate.month}/${r.startDate.year}",
                                      style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    _infoCell(isEng ? "Fast Days" : "উপবাস দিন", "${r.feedFastDays} days"),
                                    _infoCell(isEng ? "Light Hours" : "আলো সময়", "${r.lightHours} hrs"),
                                    _infoCell(isEng ? "Target Wt Loss" : "ওজন হ্রাস টার্গেট", "${r.weightLossPercent}%"),
                                  ],
                                ),
                                if (r.notes.isNotEmpty) ...[
                                  const SizedBox(height: 8),
                                  Text(
                                    "${isEng ? 'Notes' : 'নোট'}: ${r.notes}",
                                    style: TextStyle(fontSize: 12, color: Colors.grey.shade800),
                                  ),
                                ],
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: IconButton(
                                    icon: const Icon(Icons.delete_outline_rounded, color: Colors.redAccent, size: 20),
                                    onPressed: () => notifier.deleteRecord(r.id),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                ],
              ),
            ),
    );
  }

  Widget _dashboardCard({
    required String title,
    required String subtitle,
    required String value,
    required Color color,
    required Color bgColor,
    required Color borderColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 11,
              color: color.withAlpha(180),
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoCell(String label, String value) {
    return Expanded(
      child: Column(
        children: [
          Text(label, style: TextStyle(fontSize: 10, color: Colors.grey.shade600)),
          const SizedBox(height: 2),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
        ],
      ),
    );
  }

  void _showAddMoltingDialog(BuildContext context, WidgetRef ref, LocalFlock selectedFlock) {
    final fastCtrl = TextEditingController(text: "10");
    final lightCtrl = TextEditingController(text: "8");
    final lossCtrl = TextEditingController(text: "25");
    final notesCtrl = TextEditingController();

    final phases = [
      'Transition Phase (Day 1-3)',
      'Restriction Phase (Day 4-10)',
      'Target Check Phase (Day 11-14)',
      'Recovery Feeding Phase (Day 15-28)',
      'Transition Phase',
      'Fasting Phase',
      'Light Reduction Phase',
      'High Protein Recovery',
      'Laying Resume Phase',
    ];
    String currentPhase = phases.first;
    final isEng = isEnglish;

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(isEng ? "Start Molting Monitoring" : "নতুন মোল্টিং মনিটর করুন"),
        content: StatefulBuilder(
          builder: (context, setDlgState) => SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButtonFormField<String>(
                  initialValue: phases.contains(currentPhase) ? currentPhase : phases.first,
                  isExpanded: true,
                  decoration: InputDecoration(
                    labelText: isEng ? "Molting Phase" : "মোল্টিং ধাপ",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  items: phases
                      .map((p) => DropdownMenuItem(
                            value: p,
                            child: Text(
                              p,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 13),
                            ),
                          ))
                      .toList(),
                  onChanged: (val) {
                    if (val != null) setDlgState(() => currentPhase = val);
                  },
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: fastCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: isEng ? "Feed Fasting Days" : "খাবার বন্ধের দিন",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: lightCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: isEng ? "Daily Light Duration (Hours)" : "দৈনিক আলোর সময় (ঘন্টা)",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: lossCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: isEng ? "Target Weight Loss (%)" : "টার্গেট ওজন হ্রাস (%)",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: notesCtrl,
                  decoration: InputDecoration(
                    labelText: isEng ? "Notes / Observations" : "নোট বা মন্তব্য",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text(isEng ? "Cancel" : "বাতিল")),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF2E7D32)),
            onPressed: () {
              final rec = LocalMoltingRecord(
                id: DateTime.now().millisecondsSinceEpoch.toString(),
                flockId: selectedFlock.id,
                startDate: DateTime.now(),
                targetDurationDays: 28,
                feedFastDays: int.tryParse(fastCtrl.text) ?? 10,
                lightHours: double.tryParse(lightCtrl.text) ?? 8.0,
                weightLossPercent: double.tryParse(lossCtrl.text) ?? 25.0,
                currentPhase: currentPhase,
                notes: notesCtrl.text,
              );
              ref.read(moltingMonitorProvider.notifier).addRecord(rec);
              if (ctx.mounted) Navigator.pop(ctx);
            },
            child: Text(isEng ? "Save" : "সংরক্ষণ"),
          ),
        ],
      ),
    );
  }
}
