import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../model/local_databank_models.dart';
import '../../../controller/local_databank_providers.dart';
import 'weekly_breeder_input_screen.dart';

class BreederMonitorScreen extends ConsumerStatefulWidget {
  final bool isEnglish;

  const BreederMonitorScreen({super.key, required this.isEnglish});

  @override
  ConsumerState<BreederMonitorScreen> createState() => _BreederMonitorScreenState();
}

class _BreederMonitorScreenState extends ConsumerState<BreederMonitorScreen> {
  // Expansion tile collapse states
  bool _summaryExpanded = true;
  bool _statusExpanded = true;
  bool _devExpanded = false;
  bool _managementExpanded = false;
  bool _alertExpanded = true;
  bool _historyExpanded = false;
  bool _weightGraphExpanded = true;
  bool _uniformityGraphExpanded = true;

  @override
  Widget build(BuildContext context) {
    final isEng = widget.isEnglish;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final state = ref.watch(breederMonitorProvider);
    final notifier = ref.read(breederMonitorProvider.notifier);
    final selectedFlock = state.selectedFlock;

    // Latest Log
    final LocalBreederLog? latestLog = state.logs.isNotEmpty ? state.logs.last : null;

    // Active Week & Days
    int activeWeeks = 4;
    int activeDays = 0;
    if (selectedFlock != null) {
      final totalDays = DateTime.now().difference(selectedFlock.startDate).inDays;
      activeWeeks = (totalDays / 7).floor() + 1;
      if (activeWeeks < 1) activeWeeks = 1;
      activeDays = totalDays % 7;
    }

    final femaleTarget = getBreederFemaleTargetWeight(activeWeeks);
    final maleTarget = getBreederMaleTargetWeight(activeWeeks);

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF121212) : const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        foregroundColor: isDark ? Colors.white : const Color(0xFF1E293B),
        title: Text(
          isEng ? "Breeder Development Monitor" : "ব্রিডার ডেভেলপমেন্ট মনিটর",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
        ),
      ),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator(color: Colors.teal))
          : SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Header Subtitle
                  Center(
                    child: Text(
                      isEng
                          ? "Track growth, stage, weight and uniformity with smart alerts"
                          : "ওজন, গ্রোথ স্টেজ এবং ইউনিফরমিটি স্মার্ট সতর্কতার সাথে ট্র্যাক করুন",
                      style: TextStyle(
                        fontSize: 13,
                        color: isDark ? Colors.white60 : const Color(0xFF64748B),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Select Flock Container Card
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: isDark ? const Color(0xFF1E293B) : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.04),
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                      border: Border.all(
                        color: isDark ? Colors.white12 : const Color(0xFFE2E8F0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          isEng ? "Select Flock" : "ফ্লক নির্বাচন করুন",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: isDark ? Colors.white : const Color(0xFF334155),
                          ),
                        ),
                        const SizedBox(height: 8),
                        DropdownButtonFormField<LocalFlock>(
                          initialValue: state.flocks.any((f) => f.id == selectedFlock?.id)
                              ? selectedFlock
                              : (state.flocks.isNotEmpty ? state.flocks.first : null),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: isDark ? Colors.white24 : const Color(0xFFCBD5E1),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: isDark ? Colors.white24 : const Color(0xFFCBD5E1),
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                          ),
                          hint: Text(
                            isEng ? "Choose a flock" : "একটি ফ্লক বাছাই করুন",
                            style: TextStyle(color: isDark ? Colors.white38 : const Color(0xFF94A3B8)),
                          ),
                          items: state.flocks
                              .map(
                                (f) => DropdownMenuItem(
                                  value: f,
                                  child: Text(
                                    "${f.name} (${f.birdType})",
                                    style: TextStyle(
                                      color: isDark ? Colors.white : Colors.black87,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              )
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
                  const SizedBox(height: 16),

                  // Action Buttons (+ Add Flock & + Weekly Input)
                  ElevatedButton(
                    onPressed: () => _showAddFlockDialog(context, ref),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2E7D32), // Dark Green
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      elevation: 2,
                    ),
                    child: Text(
                      isEng ? "+ Add Flock" : "+ ফ্লক যোগ করুন",
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 12),

                  ElevatedButton(
                    onPressed: () {
                      if (selectedFlock == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(isEng ? "Please add or select a flock first!" : "অনুগ্রহ করে আগে একটি ফ্লক তৈরি করুন বা নির্বাচন করুন!"),
                          ),
                        );
                        return;
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => WeeklyBreederInputScreen(
                            flock: selectedFlock,
                            isEnglish: isEng,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE65100), // Bright Orange
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      elevation: 2,
                    ),
                    child: Text(
                      isEng ? "+ Weekly Input" : "+ সাপ্তাহিক তথ্য ইনপুট",
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 18),

                  // 1. Accordion: Flock Summary
                  _buildAccordionHeader(
                    title: isEng ? "Flock Summary" : "ফ্লকের সারসংক্ষেপ",
                    isExpanded: _summaryExpanded,
                    onTap: () => setState(() => _summaryExpanded = !_summaryExpanded),
                  ),
                  if (_summaryExpanded) ...[
                    const SizedBox(height: 6),
                    _buildSummaryCard(context, selectedFlock, activeWeeks, activeDays),
                  ],
                  const SizedBox(height: 14),

                  // 2. Accordion: Male and Female Bodyweight Status
                  _buildAccordionHeader(
                    title: isEng ? "Male and Female Bodyweight Status" : "নর ও মাদী মুরগির শারীরিক ওজনের অবস্থা",
                    isExpanded: _statusExpanded,
                    onTap: () => setState(() => _statusExpanded = !_statusExpanded),
                  ),
                  if (_statusExpanded) ...[
                    const SizedBox(height: 6),
                    _buildBodyweightStatusCards(context, latestLog, femaleTarget, maleTarget),
                  ],
                  const SizedBox(height: 14),

                  // 3. Accordion: Development
                  _buildAccordionHeader(
                    title: isEng ? "Development" : "বৃদ্ধি ও শারীরিক বিকাশ",
                    isExpanded: _devExpanded,
                    onTap: () => setState(() => _devExpanded = !_devExpanded),
                  ),
                  if (_devExpanded) ...[
                    const SizedBox(height: 6),
                    _buildDevelopmentCard(context, activeWeeks),
                  ],
                  const SizedBox(height: 14),

                  // 4. Accordion: Management Action
                  _buildAccordionHeader(
                    title: isEng ? "Management Action" : "ব্যবস্থাপনা পদক্ষেপ ও পরামর্শ",
                    isExpanded: _managementExpanded,
                    onTap: () => setState(() => _managementExpanded = !_managementExpanded),
                  ),
                  if (_managementExpanded) ...[
                    const SizedBox(height: 6),
                    _buildManagementCard(context, latestLog, femaleTarget, maleTarget),
                  ],
                  const SizedBox(height: 14),

                  // 5. Accordion: Alert
                  _buildAccordionHeader(
                    title: isEng ? "Alert" : "সতর্কবার্তা ও অ্যালার্ট",
                    isExpanded: _alertExpanded,
                    onTap: () => setState(() => _alertExpanded = !_alertExpanded),
                  ),
                  if (_alertExpanded) ...[
                    const SizedBox(height: 6),
                    _buildAlertCard(context, latestLog, femaleTarget, maleTarget),
                  ],
                  const SizedBox(height: 14),

                  // 6. Accordion: Weekly History
                  _buildAccordionHeader(
                    title: isEng ? "Weekly History" : "সাপ্তাহিক হিস্ট্রি",
                    isExpanded: _historyExpanded,
                    onTap: () => setState(() => _historyExpanded = !_historyExpanded),
                  ),
                  if (_historyExpanded) ...[
                    const SizedBox(height: 6),
                    _buildWeeklyHistoryCard(context, state.logs, notifier),
                  ],
                  const SizedBox(height: 14),

                  // 7. Accordion: Weight Graph
                  _buildAccordionHeader(
                    title: isEng ? "Weight Graph" : "শারীরিক ওজনের গ্রাফ",
                    isExpanded: _weightGraphExpanded,
                    onTap: () => setState(() => _weightGraphExpanded = !_weightGraphExpanded),
                  ),
                  if (_weightGraphExpanded) ...[
                    const SizedBox(height: 6),
                    _buildWeightGraphCard(context, state.logs),
                  ],
                  const SizedBox(height: 14),

                  // 8. Accordion: Uniformity Graph
                  _buildAccordionHeader(
                    title: isEng ? "Uniformity Graph" : "ইউনিফরমিটি গ্রাফ",
                    isExpanded: _uniformityGraphExpanded,
                    onTap: () => setState(() => _uniformityGraphExpanded = !_uniformityGraphExpanded),
                  ),
                  if (_uniformityGraphExpanded) ...[
                    const SizedBox(height: 6),
                    _buildUniformityGraphCard(context, state.logs),
                  ],
                  const SizedBox(height: 24),
                ],
              ),
            ),
    );
  }

  // --- ACCORDION HEADER WIDGET ---
  Widget _buildAccordionHeader({
    required String title,
    required bool isExpanded,
    required VoidCallback onTap,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1E293B) : const Color(0xFFEBF5FB),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isDark ? Colors.white12 : const Color(0xFFD6EAF8),
          ),
        ),
        child: Row(
          children: [
            Icon(
              isExpanded ? Icons.arrow_drop_down : Icons.arrow_right,
              color: const Color(0xFF1B4F72),
              size: 24,
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF1B4F72),
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- 1. FLOCK SUMMARY CARD ---
  Widget _buildSummaryCard(BuildContext context, LocalFlock? flock, int weeks, int days) {
    final isEng = widget.isEnglish;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E293B) : Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(
          color: isDark ? Colors.white12 : const Color(0xFFE2E8F0),
        ),
      ),
      child: flock == null
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isEng ? "No flock selected." : "কোনো ফ্লক নির্বাচন করা হয়নি।",
                  style: TextStyle(
                    fontSize: 14,
                    color: isDark ? Colors.white70 : const Color(0xFF475569),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  isEng ? "Create or select a breeder flock." : "একটি নতুন ব্রিডার ফ্লক তৈরি করুন অথবা নির্বাচন করুন।",
                  style: TextStyle(
                    fontSize: 13,
                    color: isDark ? Colors.white.withValues(alpha: 0.5) : const Color(0xFF64748B),
                  ),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _summaryRow("Flock", flock.name),
                const SizedBox(height: 6),
                _summaryRow("Type", flock.birdType.isEmpty ? "LAYER_BREEDER" : flock.birdType),
                const SizedBox(height: 6),
                _summaryRow("Age", "$weeks week $days day"),
                const SizedBox(height: 6),
                _summaryRow("Female Stage", getBreederStageName(weeks, false)),
                const SizedBox(height: 6),
                _summaryRow("Male Stage", getBreederStageName(weeks, true)),
              ],
            ),
    );
  }

  Widget _summaryRow(String label, String value) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      children: [
        Text(
          "$label: ",
          style: TextStyle(
            fontSize: 14,
            color: isDark ? Colors.white70 : const Color(0xFF475569),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isDark ? Colors.white : Colors.black87,
          ),
        ),
      ],
    );
  }

  // --- 2. BODYWEIGHT STATUS CARDS (PINK FOR FEMALE, BLUE FOR MALE) ---
  Widget _buildBodyweightStatusCards(
    BuildContext context,
    LocalBreederLog? log,
    double femaleTarget,
    double maleTarget,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final femaleActual = log?.femaleWeightGrams ?? 0.0;
    final femaleUni = log?.femaleUniformityPercent ?? 0.0;

    final maleActual = log?.maleWeightGrams ?? 0.0;
    final maleUni = log?.maleUniformityPercent ?? 0.0;

    return Column(
      children: [
        // Female Box (Pinkish / Red tint container)
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF3B1E2B) : const Color(0xFFFFF0F3),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: isDark ? const Color(0xFF881337) : const Color(0xFFFFD6E0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Female",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF881337),
                ),
              ),
              const SizedBox(height: 8),
              _statusDetailRow("Target:", log == null ? "--" : "${femaleTarget.toStringAsFixed(1)} g"),
              _statusDetailRow("Actual:", log == null ? "--" : "${femaleActual.toStringAsFixed(1)} g"),
              _statusDetailRow("Status:", log == null ? "--" : _getWeightStatusString(femaleActual, femaleTarget)),
              _statusDetailRow("Uniformity:", log == null ? "--" : "${femaleUni.toStringAsFixed(1)}%"),
              _statusDetailRow("Uni Status:", log == null ? "--" : _getUniformityStatusString(femaleUni)),
            ],
          ),
        ),
        const SizedBox(height: 10),

        // Male Box (Light Blue tint container)
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF1E293B) : const Color(0xFFF0F4FF),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: isDark ? const Color(0xFF1E40AF) : const Color(0xFFDBECEF),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Male",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1D4ED8),
                ),
              ),
              const SizedBox(height: 8),
              _statusDetailRow("Target:", log == null ? "--" : "${maleTarget.toStringAsFixed(1)} g"),
              _statusDetailRow("Actual:", log == null ? "--" : "${maleActual.toStringAsFixed(1)} g"),
              _statusDetailRow("Status:", log == null ? "--" : _getWeightStatusString(maleActual, maleTarget)),
              _statusDetailRow("Uniformity:", log == null ? "--" : "${maleUni.toStringAsFixed(1)}%"),
              _statusDetailRow("Uni Status:", log == null ? "--" : _getUniformityStatusString(maleUni)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _statusDetailRow(String label, String val) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.only(bottom: 3),
      child: Row(
        children: [
          SizedBox(
            width: 90,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 13,
                color: isDark ? Colors.white70 : const Color(0xFF475569),
              ),
            ),
          ),
          Text(
            val,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: isDark ? Colors.white : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  String _getWeightStatusString(double actual, double target) {
    if (actual == 0.0) return "Critical Underweight";
    final diffRatio = (actual - target) / target;
    if (diffRatio < -0.15) return "Critical Underweight";
    if (diffRatio < -0.05) return "Underweight";
    if (diffRatio > 0.15) return "Overweight";
    return "Normal";
  }

  String _getUniformityStatusString(double uni) {
    if (uni == 0.0) return "Critical";
    if (uni < 80.0) return "Critical";
    if (uni < 85.0) return "Good";
    return "High";
  }

  // --- 3. DEVELOPMENT CARD ---
  Widget _buildDevelopmentCard(BuildContext context, int week) {
    final isEng = widget.isEnglish;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    String phaseText = isEng
        ? "Week $week: Focus on body weight uniformity and frame development. Weigh birds weekly."
        : "সপ্তাহ $week: শারীরিক অবকাঠামো ও ওজনের সামঞ্জস্যতার দিকে বিশেষ মনোযোগ দিন। প্রতি সপ্তাহে পরিমাপ করুন।";

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E293B) : Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: isDark ? Colors.white12 : const Color(0xFFE2E8F0)),
      ),
      child: Text(
        phaseText,
        style: TextStyle(
          fontSize: 13,
          height: 1.4,
          color: isDark ? Colors.white.withValues(alpha: 0.8) : const Color(0xFF334155),
        ),
      ),
    );
  }

  // --- 4. MANAGEMENT ACTION CARD ---
  Widget _buildManagementCard(
    BuildContext context,
    LocalBreederLog? log,
    double femaleTarget,
    double maleTarget,
  ) {
    final isEng = widget.isEnglish;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    List<String> actions = [];
    if (log == null) {
      actions.add(isEng ? "Log weekly data to view management recommendations." : "ব্যবস্থাপনা পরামর্শ দেখতে সাপ্তাহিক তথ্য সংরক্ষণ করুন।");
    } else {
      if (log.femaleUniformityPercent < 80) {
        actions.add(isEng ? "Grade female flock into 3 weight groups (light, medium, heavy) and adjust feeding." : "মাদী মুরগিকে ৩টি গ্রেডে ভাগ করে প্রয়োজনীয় ফিড সামঞ্জস্য করুন।");
      }
      if (log.maleUniformityPercent < 80) {
        actions.add(isEng ? "Check male feeding space and separate underweight males for target feeding." : "নর মুরগির ফিডার স্পেস নিশ্চিত করুন এবং আন্ডারওয়েটদের আলাদা করুন।");
      }
      if (log.femaleWeightGrams < femaleTarget * 0.95) {
        actions.add(isEng ? "Increase female daily feed allowance by +2g to +3g per bird." : "মাদী মুরগির দৈনিক খাবার ২-৩ গ্রাম বৃদ্ধি করুন।");
      }
      if (actions.isEmpty) {
        actions.add(isEng ? "Maintain current feeding schedule and light program." : "বর্তমান ফিডিং সিডিউল এবং লাইটিং প্রোগ্রাম বজায় রাখুন।");
      }
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E293B) : Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: isDark ? Colors.white12 : const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: actions
            .map(
              (a) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("• ", style: TextStyle(fontWeight: FontWeight.bold)),
                    Expanded(
                      child: Text(
                        a,
                        style: TextStyle(
                          fontSize: 13,
                          color: isDark ? Colors.white.withValues(alpha: 0.8) : const Color(0xFF334155),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  // --- 5. ALERT CARD (CREAM/ORANGE BACKGROUND) ---
  Widget _buildAlertCard(
    BuildContext context,
    LocalBreederLog? log,
    double femaleTarget,
    double maleTarget,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    List<String> alerts = [];

    if (log != null) {
      if (log.femaleUniformityPercent < 80) {
        alerts.add("Female uniformity low. Grade flock and adjust feeding.");
      }
      if (log.maleUniformityPercent < 80) {
        alerts.add("Male uniformity low. Check male grading and feed distribution.");
      }
      if (log.femaleWeightGrams == 0.0 || log.femaleWeightGrams < femaleTarget * 0.85) {
        alerts.add("Female weight Critical Underweight.");
      }
      if (log.maleWeightGrams == 0.0 || log.maleWeightGrams < maleTarget * 0.85) {
        alerts.add("Male weight Critical Underweight.");
      }
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF3E2723) : const Color(0xFFFFF8E1),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isDark ? const Color(0xFF795548) : const Color(0xFFFFECB3),
        ),
      ),
      child: alerts.isEmpty
          ? Text(
              "No alert yet.",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: isDark ? const Color(0xFFFFB74D) : const Color(0xFF8D6E63),
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: alerts
                  .map(
                    (msg) => Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text(
                        msg,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: isDark ? const Color(0xFFFFB74D) : const Color(0xFF795548),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
    );
  }

  // --- 6. WEEKLY HISTORY CARD ---
  Widget _buildWeeklyHistoryCard(
    BuildContext context,
    List<LocalBreederLog> logs,
    BreederMonitorNotifier notifier,
  ) {
    final isEng = widget.isEnglish;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (logs.isEmpty) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1E293B) : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: isDark ? Colors.white12 : const Color(0xFFE2E8F0)),
        ),
        child: Center(
          child: Text(
            isEng ? "No weekly logs added yet." : "এখনও কোনো তথ্য যোগ করা হয়নি।",
            style: TextStyle(color: isDark ? Colors.white.withValues(alpha: 0.5) : const Color(0xFF94A3B8)),
          ),
        ),
      );
    }

    return Column(
      children: logs.map((l) {
        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF1E293B) : Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.03),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
            border: Border.all(color: isDark ? Colors.white12 : const Color(0xFFE2E8F0)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Week #${l.weekNumber}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.teal,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    "Female: ${l.femaleWeightGrams}g (${l.femaleUniformityPercent}%) | Male: ${l.maleWeightGrams}g (${l.maleUniformityPercent}%)",
                    style: TextStyle(
                      fontSize: 12,
                      color: isDark ? Colors.white70 : const Color(0xFF475569),
                    ),
                  ),
                  if (l.remarks.isNotEmpty) ...[
                    const SizedBox(height: 2),
                    Text(
                      "Remarks: ${l.remarks}",
                      style: TextStyle(
                        fontSize: 11,
                        fontStyle: FontStyle.italic,
                        color: isDark ? Colors.white.withValues(alpha: 0.5) : const Color(0xFF64748B),
                      ),
                    ),
                  ],
                ],
              ),
              IconButton(
                icon: const Icon(Icons.delete_outline, size: 18, color: Colors.grey),
                onPressed: () => notifier.deleteLog(l.id),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  // --- 7. WEIGHT GRAPH CARD ---
  Widget _buildWeightGraphCard(BuildContext context, List<LocalBreederLog> logs) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      height: 260,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E293B) : Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: isDark ? Colors.white12 : const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.isEnglish ? "Weight Progress (g)" : "শারীরিক ওজন (গ্রাম)",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: isDark ? Colors.white70 : const Color(0xFF64748B),
                ),
              ),
              Row(
                children: [
                  _buildLegendIndicator(color: const Color(0xFFE91E63), label: widget.isEnglish ? "Female" : "মাদি"),
                  const SizedBox(width: 8),
                  _buildLegendIndicator(color: const Color(0xFF2196F3), label: widget.isEnglish ? "Male" : "মোরগ"),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Expanded(
            child: logs.isEmpty
                ? Center(
                    child: Text(
                      widget.isEnglish ? "No weight data recorded yet" : "কোন তথ্য নেই",
                      style: TextStyle(color: isDark ? Colors.white38 : Colors.black38),
                    ),
                  )
                : LineChart(
                    key: const ValueKey('weight_line_chart'),
                    LineChartData(
                      clipData: const FlClipData.all(),
                      minY: 0,
                      gridData: FlGridData(
                        show: true,
                        drawVerticalLine: false,
                        getDrawingHorizontalLine: (val) => FlLine(
                          color: isDark ? Colors.white12 : Colors.grey.shade200,
                          strokeWidth: 1,
                        ),
                      ),
                      titlesData: FlTitlesData(
                        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 28,
                            interval: 1,
                            getTitlesWidget: (val, meta) {
                              if (val % 1 != 0) return const SizedBox.shrink();
                              return SideTitleWidget(
                                axisSide: meta.axisSide,
                                child: Text(
                                  'W${val.toInt()}',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: isDark ? Colors.white54 : Colors.grey.shade600,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      borderData: FlBorderData(
                        show: true,
                        border: Border(
                          left: BorderSide(color: isDark ? Colors.white24 : Colors.grey.shade400),
                          bottom: BorderSide(color: isDark ? Colors.white24 : Colors.grey.shade400),
                        ),
                      ),
                      lineBarsData: [
                        // Female Line
                        LineChartBarData(
                          spots: logs
                              .map((l) => FlSpot(l.weekNumber.toDouble(), l.femaleWeightGrams))
                              .toList(),
                          isCurved: false,
                          color: const Color(0xFFE91E63),
                          barWidth: 2.5,
                          dotData: const FlDotData(show: true),
                        ),
                        // Male Line
                        LineChartBarData(
                          spots: logs
                              .map((l) => FlSpot(l.weekNumber.toDouble(), l.maleWeightGrams))
                              .toList(),
                          isCurved: false,
                          color: const Color(0xFF2196F3),
                          barWidth: 2.5,
                          dotData: const FlDotData(show: true),
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  // Helper for legend dots
  Widget _buildLegendIndicator({required Color color, required String label}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  // --- 8. UNIFORMITY GRAPH CARD ---
  Widget _buildUniformityGraphCard(BuildContext context, List<LocalBreederLog> logs) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      height: 260,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E293B) : Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: isDark ? Colors.white12 : const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.isEnglish ? "Uniformity %" : "ইউনিফরমিটি (মূল্যায়ন %)",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: isDark ? Colors.white70 : const Color(0xFF64748B),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: LineChart(
              key: const ValueKey('uniformity_line_chart'),
              LineChartData(
                clipData: const FlClipData.all(),
                minY: 0,
                maxY: 100,
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (val) => FlLine(
                    color: isDark ? Colors.white12 : Colors.grey.shade200,
                    strokeWidth: 1,
                  ),
                ),
                titlesData: FlTitlesData(
                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 28,
                      interval: 1,
                      getTitlesWidget: (val, meta) {
                        if (val % 1 != 0) return const SizedBox.shrink();
                        return SideTitleWidget(
                          axisSide: meta.axisSide,
                          child: Text(
                            'W${val.toInt()}',
                            style: TextStyle(
                              fontSize: 10,
                              color: isDark ? Colors.white54 : Colors.grey.shade600,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                extraLinesData: ExtraLinesData(
                  horizontalLines: [
                    HorizontalLine(
                      y: 85,
                      color: Colors.green,
                      strokeWidth: 1.5,
                      label: HorizontalLineLabel(
                        show: true,
                        alignment: Alignment.topRight,
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                        labelResolver: (line) => "Target 85%",
                      ),
                    ),
                    HorizontalLine(
                      y: 80,
                      color: Colors.red,
                      strokeWidth: 1.5,
                      label: HorizontalLineLabel(
                        show: true,
                        alignment: Alignment.bottomRight,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                        labelResolver: (line) => "Warning 80%",
                      ),
                    ),
                  ],
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border(
                    left: BorderSide(color: isDark ? Colors.white24 : Colors.grey.shade400),
                    bottom: BorderSide(color: isDark ? Colors.white24 : Colors.grey.shade400),
                  ),
                ),
                lineBarsData: logs.isEmpty
                    ? []
                    : [
                        LineChartBarData(
                          spots: logs
                              .map((l) => FlSpot(l.weekNumber.toDouble(), l.femaleUniformityPercent))
                              .toList(),
                          isCurved: false,
                          color: Colors.teal,
                          barWidth: 2.5,
                          dotData: const FlDotData(show: true),
                        ),
                      ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- ADD FLOCK DIALOG ---
  void _showAddFlockDialog(BuildContext context, WidgetRef ref) {
    final nameCtrl = TextEditingController();
    final typeCtrl = TextEditingController(text: "LAYER_BREEDER");
    final birdsCtrl = TextEditingController(text: "1000");
    final isEng = widget.isEnglish;

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(isEng ? "Add Breeder Flock" : "নতুন ব্রিডার ফ্লক যোগ করুন"),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameCtrl,
                decoration: InputDecoration(labelText: isEng ? "Flock Name" : "ফ্লকের নাম"),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                initialValue: typeCtrl.text,
                decoration: InputDecoration(labelText: isEng ? "Breeder Type" : "ব্রিডার টাইপ"),
                items: const [
                  DropdownMenuItem(value: "LAYER_BREEDER", child: Text("LAYER_BREEDER")),
                  DropdownMenuItem(value: "BROILER_BREEDER", child: Text("BROILER_BREEDER")),
                  DropdownMenuItem(value: "SONALI_BREEDER", child: Text("SONALI_BREEDER")),
                ],
                onChanged: (val) {
                  if (val != null) typeCtrl.text = val;
                },
              ),
              const SizedBox(height: 8),
              TextField(
                controller: birdsCtrl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: isEng ? "Initial Bird Count" : "প্রাথমিক সংখ্যা"),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(isEng ? "Cancel" : "বাতিল"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
            onPressed: () {
              if (nameCtrl.text.trim().isNotEmpty) {
                final newFlock = LocalFlock(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  name: nameCtrl.text.trim(),
                  birdType: typeCtrl.text,
                  initialBirds: int.tryParse(birdsCtrl.text) ?? 1000,
                  chickCost: 0.0,
                  startDate: DateTime.now().subtract(const Duration(days: 28)), // defaults to 4 weeks old
                );
                ref.read(breederMonitorProvider.notifier).addFlock(newFlock);
                Navigator.pop(ctx);
              }
            },
            child: Text(isEng ? "Save" : "সংরক্ষণ"),
          ),
        ],
      ),
    );
  }
}
