import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../model/local_databank_models.dart';
import '../../../controller/local_databank_providers.dart';

class BiosecurityAuditScreen extends ConsumerStatefulWidget {
  final bool isEnglish;

  const BiosecurityAuditScreen({super.key, required this.isEnglish});

  @override
  ConsumerState<BiosecurityAuditScreen> createState() => _BiosecurityAuditScreenState();
}

class _BiosecurityAuditScreenState extends ConsumerState<BiosecurityAuditScreen> {
  // Screen Modes: 'dashboard', 'farm_entry', 'hatchery_entry'
  String _activeView = 'dashboard';

  // Expansion panel state
  bool _isManagementExpanded = true;
  bool _isReportsExpanded = true;

  @override
  Widget build(BuildContext context) {
    final isEng = widget.isEnglish;
    final state = ref.watch(biosecurityAuditProvider);
    final notifier = ref.read(biosecurityAuditProvider.notifier);

    if (_activeView == 'farm_entry') {
      return _AuditFormScreen(
        auditType: 'farm',
        isEnglish: isEng,
        onBack: () => setState(() => _activeView = 'dashboard'),
      );
    } else if (_activeView == 'hatchery_entry') {
      return _AuditFormScreen(
        auditType: 'hatchery',
        isEnglish: isEng,
        onBack: () => setState(() => _activeView = 'dashboard'),
      );
    }

    // --- MAIN MANAGEMENT DASHBOARD (Image 1 Style) ---
    final farmAudits = state.audits.where((a) => a.auditType == 'farm').length;
    final hatcheryAudits = state.audits.where((a) => a.auditType == 'hatchery').length;
    final avgScore = state.audits.isEmpty
        ? 0.0
        : state.audits.fold<double>(0.0, (sum, a) => sum + a.overallScorePercent) / state.audits.length;

    final highRiskCount = state.audits.where((a) => a.overallScorePercent < 60).length;
    final medRiskCount = state.audits.where((a) => a.overallScorePercent >= 60 && a.overallScorePercent < 85).length;
    final lowRiskCount = state.audits.where((a) => a.overallScorePercent >= 85).length;

    return Scaffold(
      backgroundColor: const Color(0xFFF4F7F6),
      appBar: AppBar(
        title: Text(isEng ? "Bio-Security Audit" : "বায়ো-সিকিউরিটি অডিট"),
        backgroundColor: const Color(0xFF00695C),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator(color: Color(0xFF00695C)))
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
                          isEng ? "Bio-Security Audit" : "বায়ো-সিকিউরিটি অডিট",
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF00695C),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          isEng
                              ? "Farm & Hatchery Bio-Security Management System"
                              : "ফার্ম ও হ্যাচারি বায়ো-সিকিউরিটি ম্যানেজমেন্ট সিস্টেম",
                          style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Executive Dashboard Card (Image 1 style)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE0F2FE),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFFBAE6FD)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          isEng ? "Executive Dashboard" : "এক্সিকিউটিভ ড্যাশবোর্ড",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0369A1),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "${isEng ? 'Farm Audits' : 'ফার্ম অডিট'}: $farmAudits | ${isEng ? 'Hatchery Audits' : 'হ্যাচারি অডিট'}: $hatcheryAudits",
                          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "${isEng ? 'Average Score' : 'গড় স্কোর'}: ${avgScore.toStringAsFixed(1)}%",
                          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF00695C)),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "${isEng ? 'High Risk' : 'উচ্চ ঝুঁকি'}: $highRiskCount | ${isEng ? 'Medium Risk' : 'মাঝারি ঝুঁকি'}: $medRiskCount | ${isEng ? 'Low Risk' : 'কম ঝুঁকি'}: $lowRiskCount",
                          style: TextStyle(fontSize: 12, color: Colors.grey.shade800),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "${isEng ? 'Open CAPA' : 'ওপেন অ্যাকশন'}: ${highRiskCount + medRiskCount} | ${isEng ? 'Completed CAPA' : 'সম্পন্ন অ্যাকশন'}: $lowRiskCount",
                          style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Management Dashboard Card / Accordion (Blue Header - Image 1 style)
                  Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                    elevation: 2,
                    color: Colors.white,
                    child: Theme(
                      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        initiallyExpanded: _isManagementExpanded,
                        onExpansionChanged: (val) => setState(() => _isManagementExpanded = val),
                        backgroundColor: const Color(0xFF283593),
                        collapsedBackgroundColor: const Color(0xFF283593),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                        collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                        iconColor: Colors.white,
                        collapsedIconColor: Colors.white,
                        title: Text(
                          isEng ? "Management Dashboard" : "ম্যানেজমেন্ট ড্যাশবোর্ড",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        children: [
                          Container(
                            color: Colors.white,
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                // Farm Data Entry Button
                                SizedBox(
                                  width: double.infinity,
                                  height: 48,
                                  child: OutlinedButton.icon(
                                    onPressed: () => setState(() => _activeView = 'farm_entry'),
                                    icon: const Icon(Icons.home_work_rounded, color: Color(0xFF0F172A)),
                                    label: Text(
                                      isEng ? "Farm Data Entry (55 Questions)" : "ফার্ম ডেটা এন্ট্রি (৫৫ প্রশ্ন)",
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF0F172A),
                                      ),
                                    ),
                                    style: OutlinedButton.styleFrom(
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                      side: BorderSide(color: Colors.grey.shade300, width: 1.5),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 12),

                                // Hatchery Data Entry Button
                                SizedBox(
                                  width: double.infinity,
                                  height: 48,
                                  child: OutlinedButton.icon(
                                    onPressed: () => setState(() => _activeView = 'hatchery_entry'),
                                    icon: const Icon(Icons.egg_rounded, color: Color(0xFF0F172A)),
                                    label: Text(
                                      isEng ? "Hatchery Data Entry (55 Questions)" : "হ্যাচারি ডেটা এন্ট্রি (৫৫ প্রশ্ন)",
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF0F172A),
                                      ),
                                    ),
                                    style: OutlinedButton.styleFrom(
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                      side: BorderSide(color: Colors.grey.shade300, width: 1.5),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Reports & Compliance Card / Accordion (Teal Header - Image 1 style)
                  Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                    elevation: 2,
                    color: Colors.white,
                    child: Theme(
                      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        initiallyExpanded: _isReportsExpanded,
                        onExpansionChanged: (val) => setState(() => _isReportsExpanded = val),
                        backgroundColor: const Color(0xFF00695C),
                        collapsedBackgroundColor: const Color(0xFF00695C),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                        collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                        iconColor: Colors.white,
                        collapsedIconColor: Colors.white,
                        title: Text(
                          isEng ? "Reports & Compliance" : "রিপোর্ট ও কমপ্লায়েন্স ইতিহাস",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        children: [
                          Container(
                            color: Colors.white,
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (state.audits.isEmpty)
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 16),
                                    child: Center(
                                      child: Text(
                                        isEng ? "No saved audit reports found." : "কোনো অডিট রিপোর্ট সেভ করা নেই।",
                                        style: TextStyle(color: Colors.grey.shade600),
                                      ),
                                    ),
                                  )
                                else
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: state.audits.length,
                                    itemBuilder: (context, index) {
                                      final a = state.audits[index];
                                      final isFarm = a.auditType == 'farm';
                                      final scoreColor = a.overallScorePercent >= 85
                                          ? Colors.green.shade800
                                          : (a.overallScorePercent >= 60 ? Colors.orange.shade800 : Colors.red.shade800);

                                      return Card(
                                        margin: const EdgeInsets.only(bottom: 10),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                        elevation: 1.5,
                                        child: ListTile(
                                          contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (ctx) => AuditDetailReportScreen(
                                                  audit: a,
                                                  isEnglish: isEng,
                                                ),
                                              ),
                                            );
                                          },
                                          leading: CircleAvatar(
                                            backgroundColor: isFarm ? const Color(0xFFE0F2FE) : const Color(0xFFFFFBEB),
                                            child: Icon(
                                              isFarm ? Icons.home_work_rounded : Icons.egg_rounded,
                                              color: isFarm ? const Color(0xFF0284C7) : Colors.amber.shade900,
                                            ),
                                          ),
                                          title: Text(
                                            a.farmName,
                                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                                          ),
                                          subtitle: Text(
                                            "${isFarm ? (isEng ? 'Farm Audit' : 'ফার্ম অডিট') : (isEng ? 'Hatchery Audit' : 'হ্যাচারি অডিট')} • ${a.auditDate.day}/${a.auditDate.month}/${a.auditDate.year}\n${isEng ? 'Score' : 'স্কোর'}: ${a.overallScorePercent.toStringAsFixed(0)}% (${a.riskLevel})",
                                            style: const TextStyle(fontSize: 12),
                                          ),
                                          trailing: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                                decoration: BoxDecoration(
                                                  color: scoreColor.withAlpha(20),
                                                  borderRadius: BorderRadius.circular(8),
                                                ),
                                                child: Text(
                                                  "${a.overallScorePercent.toStringAsFixed(0)}%",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 13,
                                                    color: scoreColor,
                                                  ),
                                                ),
                                              ),
                                              IconButton(
                                                icon: const Icon(Icons.delete_outline_rounded, color: Colors.redAccent, size: 20),
                                                onPressed: () => notifier.deleteAudit(a.id),
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

// ============================================================================
// AUDIT DATA ENTRY FORM SCREEN (55 Questions for Farm / Hatchery)
// ============================================================================
class _AuditFormScreen extends ConsumerStatefulWidget {
  final String auditType; // 'farm' or 'hatchery'
  final bool isEnglish;
  final VoidCallback onBack;

  const _AuditFormScreen({
    required this.auditType,
    required this.isEnglish,
    required this.onBack,
  });

  @override
  ConsumerState<_AuditFormScreen> createState() => _AuditFormScreenState();
}

class _AuditFormScreenState extends ConsumerState<_AuditFormScreen> {
  final _farmNameCtrl = TextEditingController();
  final _managerCtrl = TextEditingController();
  final _locationCtrl = TextEditingController();
  final _teamCtrl = TextEditingController();

  late String _selectedFarm;
  final _auditDate = DateTime.now();

  final Map<int, String> _selectedAnswers = {};
  final Map<int, String> _remarks = {};

  late List<Map<String, dynamic>> _questionsList;

  @override
  void initState() {
    super.initState();
    _selectedFarm = widget.auditType == 'farm' ? 'Main Production Farm' : 'Main Hatchery Unit 1';
    _questionsList = widget.auditType == 'farm' ? _getFarmQuestions() : _getHatcheryQuestions();
    for (var q in _questionsList) {
      final id = q['id'] as int;
      final opts = q['options'] as List<String>;
      _selectedAnswers[id] = opts.first;
    }
  }

  @override
  void dispose() {
    _farmNameCtrl.dispose();
    _managerCtrl.dispose();
    _locationCtrl.dispose();
    _teamCtrl.dispose();
    super.dispose();
  }

  int _calculateScore() {
    int score = 0;
    _selectedAnswers.forEach((id, val) {
      if (val == 'Excellent' ||
          val == 'One gate only' ||
          val == 'Well maintained' ||
          val == 'Completed' ||
          val == 'Well working' ||
          val == 'Optimal' ||
          val == 'Complied' ||
          val == 'Regular' ||
          val == 'Yes') {
        score += 1;
      }
    });
    return score;
  }

  @override
  Widget build(BuildContext context) {
    final isEng = widget.isEnglish;
    final isFarm = widget.auditType == 'farm';
    final passedCount = _calculateScore();
    final scorePercent = (passedCount / _questionsList.length) * 100;

    String riskLevel = "Low Risk";
    Color riskColor = Colors.green.shade800;
    if (scorePercent < 60) {
      riskLevel = "High Risk";
      riskColor = Colors.red.shade800;
    } else if (scorePercent < 85) {
      riskLevel = "Medium Risk";
      riskColor = Colors.orange.shade800;
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF4F7F6),
      appBar: AppBar(
        title: Text(isFarm ? (isEng ? "Farm Bio-Security Audit" : "ফার্ম বায়ো-সিকিউরিটি অডিট") : (isEng ? "Hatchery Bio-Security Audit" : "হ্যাচারি বায়ো-সিকিউরিটি অডিট")),
        backgroundColor: const Color(0xFF00695C),
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: widget.onBack,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                isFarm ? (isEng ? "Farm Bio-Security Audit" : "ফার্ম বায়ো-সিকিউরিটি অডিট") : (isEng ? "Hatchery Bio-Security Audit" : "হ্যাচারি বায়ো-সিকিউরিটি অডিট"),
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF00695C)),
              ),
            ),
            const SizedBox(height: 14),

            // Form Header Card
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 2,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${_auditDate.day.toString().padLeft(2, '0')}-${_auditDate.month.toString().padLeft(2, '0')}-${_auditDate.year}",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey.shade600),
                    ),
                    const SizedBox(height: 10),
                    Builder(builder: (context) {
                      final farmUnitsList = [
                        isFarm ? 'Main Production Farm' : 'Main Hatchery Unit 1',
                        isFarm ? 'Breeder Unit A' : 'Hatchery Unit B',
                        isFarm ? 'Broiler Shed Facility' : 'Incubator Wing C',
                        'Main Production Facility',
                        'Custom Unit',
                      ];
                      final safeValue = farmUnitsList.contains(_selectedFarm) ? _selectedFarm : farmUnitsList.first;

                      return DropdownButtonFormField<String>(
                        initialValue: safeValue,
                        isExpanded: true,
                        decoration: InputDecoration(
                          labelText: isEng ? "Select Unit/Facility" : "ইউনিট নির্বাচন করুন",
                          border: const UnderlineInputBorder(),
                        ),
                        items: farmUnitsList.map((f) => DropdownMenuItem(value: f, child: Text(f))).toList(),
                        onChanged: (val) {
                          if (val != null) setState(() => _selectedFarm = val);
                        },
                      );
                    }),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _farmNameCtrl,
                      decoration: InputDecoration(
                        hintText: isFarm ? (isEng ? "Name of Farm" : "ফার্মের নাম") : (isEng ? "Name of Hatchery" : "হ্যাচারির নাম"),
                        labelText: isFarm ? (isEng ? "Name of Farm" : "ফার্মের নাম") : (isEng ? "Name of Hatchery" : "হ্যাচারির নাম"),
                        border: const UnderlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _managerCtrl,
                      decoration: InputDecoration(
                        hintText: isEng ? "Name of Manager / In-charge" : "ম্যানেজার / ইন-চার্জের নাম",
                        labelText: isEng ? "Name of Manager / In-charge" : "ম্যানেজার / ইন-চার্জের নাম",
                        border: const UnderlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _locationCtrl,
                      decoration: InputDecoration(
                        hintText: isEng ? "Location" : "অবস্থান / ঠিকানা",
                        labelText: isEng ? "Location" : "অবস্থান / ঠিকানা",
                        border: const UnderlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _teamCtrl,
                      decoration: InputDecoration(
                        hintText: isEng ? "Inspection Team" : "ইন্সপেকশন টিম সদস্যগণ",
                        labelText: isEng ? "Inspection Team" : "ইন্সপেকশন টিম সদস্যগণ",
                        border: const UnderlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 18),

            // 55 Questions List
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _questionsList.length,
              itemBuilder: (context, index) {
                final q = _questionsList[index];
                final id = q['id'] as int;
                final category = q['category'] as String;
                final title = q['title'] as String;
                final options = q['options'] as List<String>;

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  elevation: 1.5,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(category, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF00695C))),
                        const SizedBox(height: 4),
                        Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
                        const SizedBox(height: 10),
                        Wrap(
                          spacing: 8,
                          runSpacing: 4,
                          children: options.map((opt) {
                            final isSelected = _selectedAnswers[id] == opt;
                            return InkWell(
                              borderRadius: BorderRadius.circular(20),
                              onTap: () => setState(() => _selectedAnswers[id] = opt),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                margin: const EdgeInsets.only(bottom: 4),
                                decoration: BoxDecoration(
                                  color: isSelected ? const Color(0xFF00695C).withAlpha(20) : Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: isSelected ? const Color(0xFF00695C) : Colors.grey.shade300,
                                    width: isSelected ? 1.5 : 1,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
                                      size: 16,
                                      color: isSelected ? const Color(0xFF00695C) : Colors.grey.shade500,
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      opt,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                        color: isSelected ? const Color(0xFF00695C) : const Color(0xFF334155),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 6),
                        TextField(
                          onChanged: (val) => _remarks[id] = val,
                          decoration: InputDecoration(
                            hintText: isEng ? "Remarks" : "মন্তব্য",
                            labelText: isEng ? "Remarks" : "মন্তব্য",
                            border: const UnderlineInputBorder(),
                            contentPadding: const EdgeInsets.symmetric(vertical: 2),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),

            // Live Score Summary Banner
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: riskColor.withAlpha(20),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: riskColor),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${isEng ? 'Passed Items' : 'পাসিং স্কোর'}: $passedCount / ${_questionsList.length}",
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      Text("Status: $riskLevel", style: TextStyle(fontWeight: FontWeight.bold, color: riskColor, fontSize: 13)),
                    ],
                  ),
                  Text("${scorePercent.toStringAsFixed(0)}%", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: riskColor)),
                ],
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          width: double.infinity,
          height: 52,
          child: ElevatedButton(
            onPressed: () => _saveAuditReport(context, scorePercent, passedCount, riskLevel),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF00695C),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 4,
            ),
            child: Text(
              isEng ? "Save Audit" : "অডিট সেভ করুন",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  void _saveAuditReport(BuildContext context, double scorePct, int passed, String risk) {
    final isEng = widget.isEnglish;
    final farmName = _farmNameCtrl.text.trim().isNotEmpty ? _farmNameCtrl.text.trim() : _selectedFarm;

    final Map<String, String> ansStringMap = {};
    _selectedAnswers.forEach((k, v) => ansStringMap[k.toString()] = v);

    final Map<String, String> remStringMap = {};
    _remarks.forEach((k, v) => remStringMap[k.toString()] = v);

    final audit = LocalBiosecurityAudit(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      farmName: farmName,
      auditType: widget.auditType,
      managerName: _managerCtrl.text.trim(),
      location: _locationCtrl.text.trim(),
      inspectionTeam: _teamCtrl.text.trim(),
      auditDate: _auditDate,
      overallScorePercent: scorePct,
      passedItemsCount: passed,
      totalItemsCount: _questionsList.length,
      riskLevel: risk,
      answersMap: ansStringMap,
      remarksMap: remStringMap,
      recommendations: [
        if (risk == 'High Risk') "Immediate corrective action required across non-compliant areas.",
        if (_managerCtrl.text.isNotEmpty) "Manager: ${_managerCtrl.text.trim()}",
        if (_locationCtrl.text.isNotEmpty) "Location: ${_locationCtrl.text.trim()}",
      ],
    );

    ref.read(biosecurityAuditProvider.notifier).saveAudit(audit);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(isEng ? "Audit Report Saved Successfully!" : "অডিট রিপোর্ট সফলভাবে সেভ হয়েছে!"),
        backgroundColor: const Color(0xFF00695C),
      ),
    );

    widget.onBack();
  }

  // --- 55 FARM QUESTIONS DATA ---
  List<Map<String, dynamic>> _getFarmQuestions() {
    return List.generate(55, (index) {
      final id = index + 1;
      if (id <= 5) {
        return {
          'id': id,
          'category': 'A. ENTRY CONTROL & MAIN GATE MANAGEMENT',
          'title': '$id. ${['Gate / Entry Point Status', 'Cleanliness of Main Gate & Security Post', 'Foot Bath Water Quality at Main Gate', 'Cleanliness of Gate Shower', 'Vehicle Spray & Wheel Dip at Gate'][id - 1]}',
          'options': id == 1 ? ['One gate only', 'More than one gate', 'More than one open gate'] : (id == 3 ? ['Well maintained', 'Partially maintained', 'Not maintained'] : (id == 5 ? ['Completed', 'Construction going on', 'Construction not started'] : ['Excellent', 'Good', 'Fair', 'Not Good'])),
        };
      } else if (id <= 12) {
        return {
          'id': id,
          'category': 'B. PERSONAL HYGIENE & SHOWER MANAGEMENT',
          'title': '$id. ${['Cleanliness of Daily Labour Dress', 'Cleanliness of Main Shower Room', 'Spray System in Shower Room', 'Is Everyone Taking Shower with Soap?', 'Availability of Sufficient Towel/Lungi', 'Availability of Sufficient Slippers', 'Cleanliness of Shed Uniform'][id - 6]}',
          'options': (id == 9 || id == 10 || id == 11) ? ['Yes', 'No'] : (id == 8 ? ['Well working', 'Partially working', 'Not working properly'] : ['Excellent', 'Good', 'Fair', 'Not Good']),
        };
      } else if (id <= 18) {
        return {
          'id': id,
          'category': 'C. VEHICLE DISINFECTION & LOGISTICS',
          'title': '$id. ${['Vehicle Wheel Washing Efficiency', 'Feed Delivery Truck Spraying Protocol', 'Egg Transport Vehicle Disinfection', 'Visitor Vehicle Parking Distance (>100m)', 'Tool & Equipment Disinfection Dip', 'Outside Crates Cleaning & Sanitization'][id - 13]}',
          'options': id == 16 ? ['Yes', 'No'] : ['Excellent', 'Good', 'Fair', 'Not Good'],
        };
      } else if (id <= 25) {
        return {
          'id': id,
          'category': 'D. WATER SANITATION & SUPPLY',
          'title': '$id. ${['Water Chlorination / Sanitization Regularity', 'Overhead Tank Cleaning Frequency', 'Nipple Line Flushing System', 'Water Microbiological Test Score', 'Filtration System Maintenance', 'Water Storage Tank Coverage', 'Pipe Line Algae/Biofilm Control'][id - 19]}',
          'options': (id == 19 || id == 21 || id == 24) ? ['Regular', 'Irregular', 'Not done'] : ['Optimal', 'Moderate', 'Poor'],
        };
      } else if (id <= 32) {
        return {
          'id': id,
          'category': 'E. FEED STORAGE & HYGIENE',
          'title': '$id. ${['Feed Storage Condition & Dryness', 'Wooden Pallet Placement for Bags', 'Rodent Proofing of Feed Store', 'Feed Quality & Mold Check', 'Old Stock Clearance (FIFO System)', 'Feed Bin Sanitation & Cleaning', 'Silo Air Outlet Netting'][id - 26]}',
          'options': (id == 27 || id == 30) ? ['Yes', 'No'] : ['Optimal', 'Moderate', 'Poor'],
        };
      } else if (id <= 38) {
        return {
          'id': id,
          'category': 'F. LITTER & MOISTURE MANAGEMENT',
          'title': '$id. ${['Shed Litter Dryness & Quality', 'Litter Treatment with Lime/Acidifier', 'Caked Litter Removal Regularity', 'Shed Floor Drainage System', 'Ammonia Gas Concentration Level', 'Side Curtain Ventilation Management'][id - 33]}',
          'options': id == 37 ? ['Optimal (<10ppm)', 'Moderate (10-25ppm)', 'High (>25ppm)'] : ['Optimal', 'Moderate', 'Poor'],
        };
      } else if (id <= 45) {
        return {
          'id': id,
          'category': 'G. PEST, WILD BIRD & RODENT CONTROL',
          'title': '$id. ${['Bird Netting Integrity around Sheds', 'Bait Station Installation around Perimeter', 'Fly Control & Insecticide Spraying', 'Wild Bird Entry Prevention in Store', 'Rodent Trap Monitoring Log', 'Grass & Vegetation Cutting around Sheds', 'Stagnant Water Drainage outside Sheds'][id - 39]}',
          'options': id == 43 ? ['Yes', 'No'] : ['Optimal', 'Moderate', 'Poor'],
        };
      } else if (id <= 50) {
        return {
          'id': id,
          'category': 'H. DEAD BIRD DISPOSAL & MORTALITY',
          'title': '$id. ${['Daily Dead Bird Collection Frequency', 'Dead Bird Pit Coverage & Sealing', 'Incinerator Operation Efficiency', 'Disinfectant Spraying after Disposal', 'Mortality Record Book Accuracy'][id - 46]}',
          'options': id == 46 ? ['2+ times daily', 'Once daily', 'Irregular'] : ['Optimal', 'Moderate', 'Poor'],
        };
      } else {
        return {
          'id': id,
          'category': 'I. SHED DISINFECTION, VACCINE & EQUIPMENT',
          'title': '$id. ${['Empty Shed Downtime Period (>14 days)', 'Cold Chain Maintenance for Vaccines', 'Disinfectant Rotation Protocol', 'Footbath Refill Frequency at Shed Entry', 'Staff Hand Wash & Sanitizer Station'][id - 51]}',
          'options': (id == 51 || id == 52 || id == 53) ? ['Complied', 'Partially complied', 'Not complied'] : ['Optimal', 'Moderate', 'Poor'],
        };
      }
    });
  }

  // --- 55 HATCHERY QUESTIONS DATA ---
  List<Map<String, dynamic>> _getHatcheryQuestions() {
    return List.generate(55, (index) {
      final id = index + 1;
      if (id <= 5) {
        return {
          'id': id,
          'category': 'A. HATCHERY GATE & ENTRY HYGIENE',
          'title': '$id. ${['Hatchery Main Gate Shower System', 'Staff & Visitor Footbath at Entry', 'Vehicle Disinfection & Wheel Spray', 'Outside Shoes Removal Protocol', 'Visitor Restriction Register Log'][id - 1]}',
          'options': (id == 4 || id == 5) ? ['Complied', 'Not complied'] : ['Optimal', 'Moderate', 'Poor'],
        };
      } else if (id <= 10) {
        return {
          'id': id,
          'category': 'B. EGG RECEPTION & UNLOADING AREA',
          'title': '$id. ${['Egg Delivery Truck Sanitization', 'Hatching Egg Sorting & Washing Area', 'Dirty / Cracked Egg Rejection Rate', 'Plastic Egg Tray Sanitization Dip', 'Receiving Dock Floor Cleanliness'][id - 6]}',
          'options': ['Optimal', 'Moderate', 'Poor'],
        };
      } else if (id <= 15) {
        return {
          'id': id,
          'category': 'C. EGG FUMIGATION & PRE-STORAGE',
          'title': '$id. ${['Formalin/Ozone Fumigation Room Efficiency', 'Egg Setting Room Disinfection Status', 'Fumigation Gas Concentration & Time', 'Setting Trolley Disinfection Status', 'Operator Safety Gear during Fumigation'][id - 11]}',
          'options': ['Optimal', 'Moderate', 'Poor'],
        };
      } else if (id <= 20) {
        return {
          'id': id,
          'category': 'D. EGG HOLDING ROOM (COLD STORE)',
          'title': '$id. ${['Cold Room Temperature (16-18°C) Maintenance', 'Cold Room Humidity (75-80%) Level', 'Egg Storage Trolley Spacing', 'Cold Store Floor & Wall Disinfection', 'Air Circulation Fan Operation'][id - 16]}',
          'options': ['Optimal', 'Moderate', 'Poor'],
        };
      } else if (id <= 25) {
        return {
          'id': id,
          'category': 'E. SETTER ROOM & INCUBATOR HYGIENE',
          'title': '$id. ${['Setter Machine Interior Disinfection', 'Setter Fan & Humidity Nozzle Sanitization', 'Air Pressure Gradient (Positive Airflow)', 'Egg Turning Mechanism Inspection', 'Setter Floor Washing Schedule'][id - 21]}',
          'options': ['Optimal', 'Moderate', 'Poor'],
        };
      } else if (id <= 30) {
        return {
          'id': id,
          'category': 'F. HATCHER ROOM & BASKET WASHING',
          'title': '$id. ${['Hatcher Machine Thorough Washing & Disinfection', 'Hatcher Basket Automatic Washer Temp (60°C+)', 'Hatcher Room Floor & Drain Sanitization', 'Fluff Filter Cleaning Frequency', 'Hatcher Trolley Wheel Sanitation'][id - 26]}',
          'options': ['Optimal', 'Moderate', 'Poor'],
        };
      } else if (id <= 35) {
        return {
          'id': id,
          'category': 'G. CHICK PROCESSING & HOLDING ROOM',
          'title': '$id. ${['Chick Sexing & Grading Table Hygiene', 'Automatic Chick Counting Machine Cleanliness', 'Chick Vaccine Spraying Machine Calibration', 'Chick Holding Room Temp (24-26°C)', 'Chick Box Washing & Disinfection Dip'][id - 31]}',
          'options': ['Optimal', 'Moderate', 'Poor'],
        };
      } else if (id <= 40) {
        return {
          'id': id,
          'category': 'H. AIRFLOW, VENTILATION & FILTRATION',
          'title': '$id. ${['HVAC Filter Replacement Schedule', 'Air Pressure Differential between Rooms', 'Exhaust Air Duct Sanitization', 'Fresh Air Intake Filter Cleanliness', 'Odor & Fluff Control in Exhaust Area'][id - 36]}',
          'options': ['Optimal', 'Moderate', 'Poor'],
        };
      } else if (id <= 45) {
        return {
          'id': id,
          'category': 'I. WATER QUALITY & WASHING SYSTEM',
          'title': '$id. ${['Hatchery Water Softener & Treatment Plant', 'High Pressure Washer Operation', 'Hot Water Washing Temp (60-70°C)', 'Disinfectant Dosing System Calibration', 'Water Bacterial Test Score'][id - 41]}',
          'options': ['Optimal', 'Moderate', 'Poor'],
        };
      } else if (id <= 50) {
        return {
          'id': id,
          'category': 'J. WASTE DISPOSAL & SHELL HANDLING',
          'title': '$id. ${['Eggshell Crusher Machine Sanitization', 'Unhatched Egg Disposal Pit / Incinerator', 'Hatchery Waste Truck Sealed Container', 'Waste Room Daily Disinfection Wash', 'Chick Down / Fluff Waste Vacuum System'][id - 46]}',
          'options': ['Optimal', 'Moderate', 'Poor'],
        };
      } else {
        return {
          'id': id,
          'category': 'K. TRANSPORT VEHICLE & STAFF HYGIENE',
          'title': '$id. ${['Chick Delivery Van Internal Disinfection', 'Chick Van Temperature Controller System', 'Hatchery Uniform Daily Washing', 'Staff Bacterial Hand Swab Monitoring', 'Biosecurity Log Book Maintenance'][id - 51]}',
          'options': ['Optimal', 'Moderate', 'Poor'],
        };
      }
    });
  }
}

// ============================================================================
// SAVED AUDIT DETAILED VIEW SCREEN (View Full Audit Details & Breakdown)
// ============================================================================
class AuditDetailReportScreen extends StatelessWidget {
  final LocalBiosecurityAudit audit;
  final bool isEnglish;

  const AuditDetailReportScreen({
    super.key,
    required this.audit,
    required this.isEnglish,
  });

  @override
  Widget build(BuildContext context) {
    final isEng = isEnglish;
    final isFarm = audit.auditType == 'farm';

    Color scoreColor = Colors.green.shade800;
    if (audit.overallScorePercent < 60) {
      scoreColor = Colors.red.shade800;
    } else if (audit.overallScorePercent < 85) {
      scoreColor = Colors.orange.shade800;
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF4F7F6),
      appBar: AppBar(
        title: Text(audit.farmName),
        backgroundColor: const Color(0xFF00695C),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Executive Header Card
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 2,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            audit.farmName,
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: isFarm ? const Color(0xFFE0F2FE) : const Color(0xFFFFFBEB),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            isFarm ? "FARM AUDIT" : "HATCHERY AUDIT",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                              color: isFarm ? const Color(0xFF0284C7) : Colors.amber.shade900,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    _infoRow("Audit Date:", "${audit.auditDate.day}/${audit.auditDate.month}/${audit.auditDate.year}"),
                    if (audit.managerName.isNotEmpty) _infoRow("Manager:", audit.managerName),
                    if (audit.location.isNotEmpty) _infoRow("Location:", audit.location),
                    if (audit.inspectionTeam.isNotEmpty) _infoRow("Inspection Team:", audit.inspectionTeam),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 14),

            // Score Banner
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: scoreColor.withAlpha(20),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: scoreColor),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        isEng ? "Overall Biosecurity Score" : "সামগ্রিক বায়ো-সিকিউরিটি স্কোর",
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "${audit.passedItemsCount} / ${audit.totalItemsCount} Passed (${audit.riskLevel})",
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: scoreColor),
                      ),
                    ],
                  ),
                  Text(
                    "${audit.overallScorePercent.toStringAsFixed(0)}%",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: scoreColor),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Detailed Response Log Header
            Text(
              isEng ? "Detailed Question Responses & Remarks" : "বিস্তারিত প্রশ্নসমূহ ও ইন্সপেকশন উত্তর",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
            ),
            const SizedBox(height: 10),

            // Answers Map List
            if (audit.answersMap.isEmpty)
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    isEng ? "Standard audit checklist summary passed." : "অডিট চেকলিস্ট রিপোর্ট সফলভাবে সেভ করা হয়েছে।",
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                ),
              )
            else
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: audit.answersMap.length,
                itemBuilder: (context, index) {
                  final entry = audit.answersMap.entries.elementAt(index);
                  final qId = entry.key;
                  final answerVal = entry.value;
                  final remarkVal = audit.remarksMap[qId] ?? '';

                  final isPositive = answerVal == 'Excellent' ||
                      answerVal == 'One gate only' ||
                      answerVal == 'Well maintained' ||
                      answerVal == 'Completed' ||
                      answerVal == 'Well working' ||
                      answerVal == 'Optimal' ||
                      answerVal == 'Complied' ||
                      answerVal == 'Regular' ||
                      answerVal == 'Yes';

                  return Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Question #$qId",
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFF00695C)),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                decoration: BoxDecoration(
                                  color: (isPositive ? Colors.green : Colors.red).withAlpha(20),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  answerVal,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: isPositive ? Colors.green.shade800 : Colors.red.shade800,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          if (remarkVal.isNotEmpty) ...[
                            const SizedBox(height: 6),
                            Text(
                              "${isEng ? 'Remarks' : 'মন্তব্য'}: $remarkVal",
                              style: TextStyle(fontSize: 12, color: Colors.grey.shade800),
                            ),
                          ],
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

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(label, style: TextStyle(fontSize: 13, color: Colors.grey.shade600)),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
            ),
          ),
        ],
      ),
    );
  }
}
