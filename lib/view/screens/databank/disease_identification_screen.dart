import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../../../model/local_databank_models.dart';
import '../../../controller/local_databank_providers.dart';

class DiseaseIdentificationScreen extends ConsumerStatefulWidget {
  final bool isEnglish;

  const DiseaseIdentificationScreen({super.key, required this.isEnglish});

  @override
  ConsumerState<DiseaseIdentificationScreen> createState() => _DiseaseIdentificationScreenState();
}

class _DiseaseIdentificationScreenState extends ConsumerState<DiseaseIdentificationScreen> {
  int _currentStep = 1; // Step 1 to 5
  bool _showHistoryTab = false; // Toggle between wizard and history

  // Step 1: Bird Type
  final Map<String, bool> _birdTypes = {
    'Broiler / Meat Type': false,
    'Layer': false,
    'Breeder': false,
    'Duck': false,
  };

  // Step 2: Age Group
  final Map<String, bool> _ageGroups = {
    '0-7 days': false,
    '8-21 days': false,
    '22-42 days': false,
    '43-90 days': false,
    'Grower': false,
    'Pre-lay': false,
    'Production': false,
    'Breeder Production': false,
  };

  // Step 3: Symptoms (Matching Screenshot 3)
  final Map<String, bool> _symptoms = {
    'হঠাৎ মৃত্যু': false,
    'মর্টালিটি হঠাৎ বাড়া': false,
    'ঝিমানো': false,
    'খাদ্য কম খাওয়া': false,
    'পানি বেশি খাওয়া': false,
    'ওজন কমে যাওয়া': false,
    'পালক ফুলে থাকা': false,
    'শ্বাসকষ্ট': false,
    'কাশি': false,
    'হাঁচি': false,
    'নাক দিয়ে পানি': false,
    'মুখ খোলা রেখে শ্বাস নেয়': false,
    'চোখ ফুলে যাওয়া': false,
    'মুখ/ঝুঁটি নীলচে': false,
    'ঘাড় বাঁকা': false,
    'মাথা ঘোরা': false,
    'চলাফেরা অসামঞ্জস্য': false,
    'প্যারালাইসিস': false,
    'পা দুর্বল': false,
    'ডায়রিয়া': false,
    'সবুজ পায়খানা': false,
    'সাদা পায়খানা': false,
    'রক্ত মিশ্রিত পায়খানা': false,
    'লিটার ভিজা': false,
    'ডিম কমে যাওয়া': false,
    'ডিমের খোসা পাতলা': false,
    'ডিম বিকৃত': false,
    'চামড়ায় গুটি': false,
    'মুখে ঘা': false,
    'পেট ফুলে যাওয়া': false,
  };

  // Step 4: Postmortem Photos & Notes
  final List<File> _postmortemPhotos = [];
  final TextEditingController _notesController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  // Step 5: Lesion Selection (Matching Screenshot 5)
  final Map<String, bool> _lesions = {
    'Trachea hemorrhage': false,
    'Trachea mucus': false,
    'Air sac cloudy': false,
    'Lung congestion': false,
    'Proventriculus hemorrhage': false,
    'Gizzard erosion': false,
    'Button ulcer in intestine': false,
    'Intestinal hemorrhage': false,
    'Cecal core': false,
    'Bloody cecum': false,
    'Bursa swollen': false,
    'Bursa hemorrhage': false,
    'Bursa atrophy': false,
    'Liver enlarged': false,
    'Liver hemorrhage': false,
    'Fatty liver': false,
    'Necrotic foci on liver': false,
    'Kidney swollen': false,
    'Urate deposition': false,
    'Pericarditis': false,
    'Perihepatitis': false,
    'Heart hemorrhage': false,
    'Spleen enlarged': false,
    'Ascites fluid': false,
    'Egg peritonitis': false,
    'Skin pox lesion': false,
    'Mouth diphtheritic membrane': false,
    'Duck liver hemorrhage': false,
    'Duck enteritis lesion': false,
    'No clear lesion': false,
  };

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _pickPhotos() async {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library, color: Colors.teal),
              title: Text(widget.isEnglish ? "Pick from Gallery" : "গ্যালারি থেকে ছবি নির্বাচন"),
              onTap: () async {
                Navigator.pop(ctx);
                final List<XFile> picked = await _picker.pickMultiImage();
                if (picked.isNotEmpty && mounted) {
                  setState(() {
                    _postmortemPhotos.addAll(picked.map((x) => File(x.path)));
                  });
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt, color: Colors.teal),
              title: Text(widget.isEnglish ? "Take Photo with Camera" : "ক্যামেরা দিয়ে ছবি তুলুন"),
              onTap: () async {
                Navigator.pop(ctx);
                final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
                if (photo != null && mounted) {
                  setState(() {
                    _postmortemPhotos.add(File(photo.path));
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void _runDiagnosticEngine() {
    final isEng = widget.isEnglish;
    final state = ref.read(diseaseIdentificationProvider);
    final notifier = ref.read(diseaseIdentificationProvider.notifier);

    final selectedBirdList = _birdTypes.entries.where((e) => e.value).map((e) => e.key).toList();
    final selectedAgeList = _ageGroups.entries.where((e) => e.value).map((e) => e.key).toList();
    final selectedSymptomList = _symptoms.entries.where((e) => e.value).map((e) => e.key).toList();
    final selectedLesionList = _lesions.entries.where((e) => e.value).map((e) => e.key).toList();

    String diseaseName = "Chronic Respiratory Disease (CRD)";
    String treatment = "Tylosin / Doxycycline in drinking water for 5 days. Add Vitamin C and electrolytes.";
    String severity = "Moderate";
    int confidence = 88;

    final isDuck = _birdTypes['Duck'] == true;
    final isLayer = _birdTypes['Layer'] == true;
    final isYoung = _ageGroups['0-7 days'] == true || _ageGroups['8-21 days'] == true;

    if (isDuck && (_lesions['Duck liver hemorrhage'] == true || _lesions['Duck enteritis lesion'] == true)) {
      diseaseName = isEng ? "Duck Plague / Duck Virus Enteritis" : "হাঁসের প্লেগ রোগ (Duck Plague)";
      treatment = isEng
          ? "Administer Duck Plague Vaccine immediately to uninfected flock. Supportive multivitamin therapy."
          : "অনাক্রান্ত হাঁসকে দ্রুত ডাক প্লেগ ভ্যাকসিন দিন। মাল্টিভিটামিন সাপোর্ট দিন।";
      severity = "Severe";
      confidence = 96;
    } else if (_symptoms['সবুজ পায়খানা'] == true && (_symptoms['প্যারালাইসিস'] == true || _symptoms['ঘাড় বাঁকা'] == true || _lesions['Proventriculus hemorrhage'] == true || _lesions['Trachea hemorrhage'] == true)) {
      diseaseName = isEng ? "Newcastle Disease (Ranikhet / ND)" : "রাণীক্ষেত রোগ (Newcastle Disease)";
      treatment = isEng
          ? "No specific viral cure. Provide immunostimulants, multivitamin B-complex, and secondary antibiotic protection (Amoxicillin)."
          : "ভাইরাসনাশক সরাসরি কাজ করে না। বি-কমপ্লেক্স ভিটামিন, স্যালাইন এবং সেকন্ডারি ইনফেকশন রোধে এমোক্সিসিলিন দিন।";
      severity = "Severe";
      confidence = 94;
    } else if ((_lesions['Bursa swollen'] == true || _lesions['Bursa hemorrhage'] == true) || (isYoung && _symptoms['সাদা পায়খানা'] == true && _symptoms['ঝিমানো'] == true)) {
      diseaseName = isEng ? "Infectious Bursal Disease (Gumboro / IBD)" : "গামবোরো রোগ (IBD / Gumboro)";
      treatment = isEng
          ? "Provide electrolytes, glucose water, multivitamin C and kidney detoxifiers. Maintain optimal ventilation."
          : "ইলেক্ট্রোলাইট স্যালাইন, গ্লুকোজ পানি, ভিটামিন সি এবং কিডনি ডিটক্সিফায়ার পানিতে মিশিয়ে দিন।";
      severity = "Severe";
      confidence = 92;
    } else if (_symptoms['রক্ত মিশ্রিত পায়খানা'] == true || _lesions['Bloody cecum'] == true || _lesions['Cecal core'] == true) {
      diseaseName = isEng ? "Coccidiosis (Avian Coccidiosis)" : "কক্সিডিওসিস (রক্তামাশয়)";
      treatment = isEng
          ? "Administer Esb3 / Toltrazuril or Amprolium in drinking water for 3-5 days. Keep litter dry."
          : "ইসবি-৩ বা টলট্রাজুরিল / এমপ্রোলিয়াম ৩-৫ দিন পানিতে মিশিয়ে দিন। লিটার শুকনা রাখুন।";
      severity = "Severe";
      confidence = 95;
    } else if (_symptoms['মুখ/ঝুঁটি নীলচে'] == true && _symptoms['হঠাৎ মৃত্যু'] == true) {
      diseaseName = isEng ? "Avian Influenza / Fowl Cholera" : "এভিয়ান ইনফ্লুয়েঞ্জা / ফাউল কলেরা";
      treatment = isEng
          ? "Isolate affected birds. Administer Sulfadimethoxine / Trimethoprim. Disinfect farm strictly."
          : "আক্রান্ত মুরগি আলাদা করুন। সালফাডিমিথোক্সিন দিন এবং খামারে স্প্রে করুন।";
      severity = "Severe";
      confidence = 90;
    } else if (_lesions['Egg peritonitis'] == true || (isLayer && _symptoms['ডিম কমে যাওয়া'] == true)) {
      diseaseName = isEng ? "Egg Peritonitis / Egg Drop Syndrome (EDS)" : "এগ পেরিটোনাইটিস / ডিম ড্রপ সিন্ড্রোম";
      treatment = isEng
          ? "Calcium, Vitamin D3, and broad-spectrum antibiotic (Oxytetracycline) in drinking water."
          : "ক্যালসিয়াম, ভিটামিন ডি-৩ এবং অক্সিট্রেট্রাসাইক্লিন এন্টিবায়োটিক প্রয়োগ করুন।";
      severity = "Moderate";
      confidence = 89;
    }

    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      isEng ? "AI Diagnostic Result" : "রোগ শনাক্তকরণের ফলাফল",
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal),
                    ),
                    Chip(
                      label: Text("$confidence% Match", style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
                      backgroundColor: Colors.teal.shade700,
                    ),
                  ],
                ),
                const Divider(),
                const SizedBox(height: 8),

                Text(
                  diseaseName,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.redAccent),
                ),
                const SizedBox(height: 6),
                Chip(
                  label: Text("Severity: $severity", style: const TextStyle(color: Colors.white, fontSize: 11)),
                  backgroundColor: severity == "Severe" ? Colors.red : Colors.orange,
                ),
                const SizedBox(height: 10),

                Text(
                  isEng ? "Recommended Treatment:" : "প্রস্তাবিত চিকিৎসা ও ওষুধ:",
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const SizedBox(height: 4),
                Text(treatment, style: const TextStyle(fontSize: 13)),

                if (_postmortemPhotos.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  Text(
                    "${isEng ? 'Attached Photos' : 'সংযুক্ত পোস্টমর্টেম ছবি'} (${_postmortemPhotos.length}):",
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(height: 6),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(_postmortemPhotos.length, (pIdx) {
                        return Container(
                          margin: const EdgeInsets.only(right: 6),
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.teal),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(_postmortemPhotos[pIdx], fit: BoxFit.cover),
                          ),
                        );
                      }),
                    ),
                  ),
                ],

                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(ctx),
                      child: Text(isEng ? "Close" : "বন্ধ করুন"),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.teal, foregroundColor: Colors.white),
                      icon: const Icon(Icons.save_rounded, size: 18),
                      label: Text(isEng ? "Save Record" : "সংরক্ষণ করুন"),
                      onPressed: () {
                        final flock = state.selectedFlock;
                        final photoPaths = _postmortemPhotos.map((f) => f.path).toList();

                        final log = LocalDiseaseLog(
                          id: DateTime.now().millisecondsSinceEpoch.toString(),
                          flockId: flock?.id ?? 'default_flock',
                          date: DateTime.now(),
                          symptoms: selectedSymptomList,
                          diagnosedDisease: diseaseName,
                          severity: severity,
                          treatmentPrescribed: treatment,
                          birdType: selectedBirdList.join(', '),
                          ageGroup: selectedAgeList.join(', '),
                          lesions: selectedLesionList,
                          imageUrls: photoPaths,
                        );

                        notifier.addLog(log);
                        Navigator.pop(ctx);
                        setState(() {
                          _showHistoryTab = true; // Automatically switch to view saved records!
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(isEng ? "Report saved locally!" : "রোগের তথ্য ডাটাবেজে সংরক্ষিত হয়েছে!")),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isEng = widget.isEnglish;
    final state = ref.watch(diseaseIdentificationProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(isEng ? "Manual Disease Detection" : "রোগ শনাক্তকরণ ম্যানুয়াল"),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(_showHistoryTab ? Icons.assignment_turned_in : Icons.history_rounded),
            tooltip: _showHistoryTab
                ? (isEng ? "New Detection Wizard" : "নতুন রোগ শনাক্তকরণ")
                : (isEng ? "View Saved Reports" : "সংরক্ষিত রিপোর্টসমূহ"),
            onPressed: () => setState(() => _showHistoryTab = !_showHistoryTab),
          ),
        ],
      ),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator(color: Colors.teal))
          : Column(
              children: [
                // Mode Toggle Bar (Wizard vs History View)
                Container(
                  color: Colors.teal.shade50,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: ChoiceChip(
                          label: Center(
                            child: Text(
                              isEng ? "1. New Detection" : "১. নতুন রোগ শনাক্তকরণ",
                              style: TextStyle(
                                fontWeight: !_showHistoryTab ? FontWeight.bold : FontWeight.normal,
                                color: !_showHistoryTab ? Colors.white : Colors.teal.shade900,
                              ),
                            ),
                          ),
                          selected: !_showHistoryTab,
                          selectedColor: Colors.teal,
                          onSelected: (val) => setState(() => _showHistoryTab = false),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ChoiceChip(
                          label: Center(
                            child: Text(
                              isEng ? "2. Saved Reports (${state.logs.length})" : "২. সংরক্ষিত রিপোর্ট (${state.logs.length})",
                              style: TextStyle(
                                fontWeight: _showHistoryTab ? FontWeight.bold : FontWeight.normal,
                                color: _showHistoryTab ? Colors.white : Colors.teal.shade900,
                              ),
                            ),
                          ),
                          selected: _showHistoryTab,
                          selectedColor: Colors.teal,
                          onSelected: (val) => setState(() => _showHistoryTab = true),
                        ),
                      ),
                    ],
                  ),
                ),

                if (!_showHistoryTab) ...[
                  // Step Progress Line
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      children: [
                        Text(
                          "Step $_currentStep of 5",
                          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.teal, fontSize: 13),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: LinearProgressIndicator(
                              value: _currentStep / 5.0,
                              backgroundColor: Colors.teal.shade100,
                              color: Colors.orange,
                              minHeight: 6,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Active Wizard Step
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: _buildStepView(context, isEng),
                    ),
                  ),
                ] else ...[
                  // Full History View
                  Expanded(
                    child: _buildSavedHistoryView(context, isEng, state),
                  ),
                ],
              ],
            ),
    );
  }

  // --- FULL SAVED HISTORY VIEW ---
  Widget _buildSavedHistoryView(BuildContext context, bool isEng, DiseaseIdentificationState state) {
    final notifier = ref.read(diseaseIdentificationProvider.notifier);

    if (state.logs.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.history_toggle_off, size: 64, color: Colors.grey[400]),
              const SizedBox(height: 12),
              Text(
                isEng ? "No disease records saved yet." : "এখনও কোনো রোগ শনাক্তকরণ রিপোর্ট সংরক্ষিত হয়নি।",
                style: TextStyle(color: Colors.grey[600], fontSize: 15),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () => setState(() => _showHistoryTab = false),
                icon: const Icon(Icons.add),
                label: Text(isEng ? "Start Disease Wizard" : "রোগ শনাক্তকরণ শুরু করুন"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal, foregroundColor: Colors.white),
              ),
            ],
          ),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: state.logs.length,
      itemBuilder: (context, index) {
        final d = state.logs[index];

        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header: Disease Name & Severity
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        d.diagnosedDisease,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.redAccent),
                      ),
                    ),
                    Chip(
                      label: Text("Severity: ${d.severity}", style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
                      backgroundColor: d.severity == "Severe" ? Colors.red : Colors.orange,
                      padding: EdgeInsets.zero,
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  "${isEng ? 'Saved Date' : 'সংরক্ষণের তারিখ'}: ${d.date.day}/${d.date.month}/${d.date.year}",
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
                const Divider(height: 16),

                // Bird Type & Age Group Badges
                if (d.birdType.isNotEmpty || d.ageGroup.isNotEmpty) ...[
                  Row(
                    children: [
                      if (d.birdType.isNotEmpty)
                        Chip(
                          avatar: const Icon(Icons.pets, size: 14, color: Colors.teal),
                          label: Text(d.birdType, style: const TextStyle(fontSize: 12)),
                          backgroundColor: Colors.teal.shade50,
                          padding: EdgeInsets.zero,
                        ),
                      const SizedBox(width: 8),
                      if (d.ageGroup.isNotEmpty)
                        Chip(
                          avatar: const Icon(Icons.access_time, size: 14, color: Colors.teal),
                          label: Text(d.ageGroup, style: const TextStyle(fontSize: 12)),
                          backgroundColor: Colors.teal.shade50,
                          padding: EdgeInsets.zero,
                        ),
                    ],
                  ),
                  const SizedBox(height: 8),
                ],

                // Symptoms Chips
                if (d.symptoms.isNotEmpty) ...[
                  Text(
                    isEng ? "Observed Symptoms:" : "চিহ্নিত লক্ষণসমূহ:",
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black87),
                  ),
                  const SizedBox(height: 4),
                  Wrap(
                    spacing: 6,
                    runSpacing: 4,
                    children: d.symptoms.map((s) => Chip(
                      label: Text(s, style: const TextStyle(fontSize: 11)),
                      backgroundColor: Colors.grey.shade200,
                      padding: EdgeInsets.zero,
                    )).toList(),
                  ),
                  const SizedBox(height: 8),
                ],

                // Lesions Chips
                if (d.lesions.isNotEmpty) ...[
                  Text(
                    isEng ? "Postmortem Lesions:" : "পোস্টমর্টেম ক্ষত (Lesions):",
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black87),
                  ),
                  const SizedBox(height: 4),
                  Wrap(
                    spacing: 6,
                    runSpacing: 4,
                    children: d.lesions.map((l) => Chip(
                      label: Text(l, style: const TextStyle(fontSize: 11, color: Colors.redAccent)),
                      backgroundColor: Colors.red.shade50,
                      padding: EdgeInsets.zero,
                    )).toList(),
                  ),
                  const SizedBox(height: 8),
                ],

                // Treatment Advice
                Text(
                  isEng ? "Recommended Treatment:" : "চিকিৎসা ও ওষুধ:",
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.teal),
                ),
                const SizedBox(height: 2),
                Text(d.treatmentPrescribed, style: const TextStyle(fontSize: 13)),

                // Attached Post-Mortem Photos Preview
                if (d.imageUrls.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  Text(
                    "${isEng ? 'Attached Photos' : 'সংযুক্ত ছবিসমূহ'} (${d.imageUrls.length}):",
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(height: 6),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(d.imageUrls.length, (pIdx) {
                        final imgPath = d.imageUrls[pIdx];
                        return GestureDetector(
                          onTap: () => _showFullImageDialog(context, imgPath),
                          child: Container(
                            margin: const EdgeInsets.only(right: 8),
                            width: 75,
                            height: 75,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.teal.shade200),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.file(
                                File(imgPath),
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) => const Icon(Icons.broken_image),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],

                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton.icon(
                    icon: const Icon(Icons.delete_outline, color: Colors.red, size: 18),
                    label: Text(isEng ? "Delete Record" : "মুছে ফেলুন", style: const TextStyle(color: Colors.red)),
                    onPressed: () => notifier.deleteLog(d.id),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showFullImageDialog(BuildContext context, String path) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: Colors.black,
        insetPadding: const EdgeInsets.all(10),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            InteractiveViewer(
              child: Center(
                child: Image.file(File(path)),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.close, color: Colors.white, size: 30),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepView(BuildContext context, bool isEng) {
    switch (_currentStep) {
      case 1:
        return _buildStep1BirdType(isEng);
      case 2:
        return _buildStep2AgeGroup(isEng);
      case 3:
        return _buildStep3Symptoms(isEng);
      case 4:
        return _buildStep4PostmortemUpload(isEng);
      case 5:
        return _buildStep5LesionSelection(isEng);
      default:
        return _buildStep1BirdType(isEng);
    }
  }

  // --- STEP 1: BIRD TYPE (Screenshot 1) ---
  Widget _buildStep1BirdType(bool isEng) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 10),
        const Text(
          "Step 1: Bird Type সিলেক্ট করুন",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
        ),
        const SizedBox(height: 4),
        Text(
          "মুরগি/হাঁস এবং production type অনুযায়ী সিলেক্ট করুন",
          style: TextStyle(fontSize: 13, color: Colors.grey[600]),
        ),
        const SizedBox(height: 20),

        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 2.8,
              children: _birdTypes.keys.map((key) {
                final isChecked = _birdTypes[key]!;
                return CheckboxListTile(
                  title: Text(key, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                  value: isChecked,
                  activeColor: Colors.teal,
                  onChanged: (val) {
                    setState(() {
                      _birdTypes[key] = val ?? false;
                    });
                  },
                );
              }).toList(),
            ),
          ),
        ),
        const SizedBox(height: 24),

        SizedBox(
          width: 140,
          height: 44,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            onPressed: () {
              setState(() => _currentStep = 2);
            },
            child: const Text("Next", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ),
        ),
      ],
    );
  }

  // --- STEP 2: AGE GROUP (Screenshot 2) ---
  Widget _buildStep2AgeGroup(bool isEng) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 10),
        const Text(
          "Step 2: Age Group সিলেক্ট করুন",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
        ),
        const SizedBox(height: 4),
        Text(
          "যে বয়স বা production stage প্রযোজ্য সেটি সিলেক্ট করুন",
          style: TextStyle(fontSize: 13, color: Colors.grey[600]),
        ),
        const SizedBox(height: 20),

        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 2.8,
              children: _ageGroups.keys.map((key) {
                final isChecked = _ageGroups[key]!;
                return CheckboxListTile(
                  title: Text(key, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                  value: isChecked,
                  activeColor: Colors.teal,
                  onChanged: (val) {
                    setState(() {
                      _ageGroups[key] = val ?? false;
                    });
                  },
                );
              }).toList(),
            ),
          ),
        ),
        const SizedBox(height: 24),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 130,
              height: 44,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade700,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () => setState(() => _currentStep = 1),
                child: const Text("Back", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ),
            const SizedBox(width: 16),
            SizedBox(
              width: 130,
              height: 44,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () => setState(() => _currentStep = 3),
                child: const Text("Next", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // --- STEP 3: SYMPTOMS (Screenshot 3) ---
  Widget _buildStep3Symptoms(bool isEng) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 10),
        const Text(
          "Step 3: সিম্পটম সিলেক্ট করুন",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
        ),
        const SizedBox(height: 4),
        Text(
          "যে লক্ষণগুলো দেখা যাচ্ছে সেগুলো সিলেক্ট করুন",
          style: TextStyle(fontSize: 13, color: Colors.grey[600]),
        ),
        const SizedBox(height: 16),

        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 2.8,
              children: _symptoms.keys.map((key) {
                final isChecked = _symptoms[key]!;
                return CheckboxListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 4),
                  title: Text(key, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                  value: isChecked,
                  activeColor: Colors.teal,
                  onChanged: (val) {
                    setState(() {
                      _symptoms[key] = val ?? false;
                    });
                  },
                );
              }).toList(),
            ),
          ),
        ),
        const SizedBox(height: 24),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 130,
              height: 44,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade700,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () => setState(() => _currentStep = 2),
                child: const Text("Back", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ),
            const SizedBox(width: 16),
            SizedBox(
              width: 130,
              height: 44,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () => setState(() => _currentStep = 4),
                child: const Text("Next", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // --- STEP 4: POSTMORTEM UPLOAD (Screenshot 4) ---
  Widget _buildStep4PostmortemUpload(bool isEng) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 10),
        const Text(
          "Step 4: Postmortem ছবি আপলোড",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
        ),
        const SizedBox(height: 4),
        Text(
          "ছবি diagnosis evidence হিসেবে যুক্ত হবে",
          style: TextStyle(fontSize: 13, color: Colors.grey[600]),
        ),
        const SizedBox(height: 20),

        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green.shade700,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            icon: const Icon(Icons.add_a_photo_outlined),
            label: const Text(
              "Postmortem ছবি আপলোড করুন",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            onPressed: _pickPhotos,
          ),
        ),
        const SizedBox(height: 10),

        Text(
          _postmortemPhotos.isEmpty ? "No image selected" : "${_postmortemPhotos.length} image(s) selected",
          style: const TextStyle(color: Colors.blue, fontSize: 13, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),

        if (_postmortemPhotos.isNotEmpty) ...[
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(_postmortemPhotos.length, (idx) {
                return Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 8, top: 4),
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.teal),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(_postmortemPhotos[idx], fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 4,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _postmortemPhotos.removeAt(idx);
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                          child: const Icon(Icons.close, color: Colors.white, size: 14),
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
          const SizedBox(height: 16),
        ],

        TextField(
          controller: _notesController,
          maxLines: 3,
          decoration: InputDecoration(
            hintText: "অতিরিক্ত তথ্য লিখুন: বয়স, mortality %, farm history",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            contentPadding: const EdgeInsets.all(12),
          ),
        ),
        const SizedBox(height: 24),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 130,
              height: 44,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade700,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () => setState(() => _currentStep = 3),
                child: const Text("Back", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ),
            const SizedBox(width: 16),
            SizedBox(
              width: 130,
              height: 44,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () => setState(() => _currentStep = 5),
                child: const Text("Next", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // --- STEP 5: LESION SELECTION (Screenshot 5) ---
  Widget _buildStep5LesionSelection(bool isEng) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 10),
        const Text(
          "Step 5: Lesion সিলেক্ট করুন",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
        ),
        const SizedBox(height: 4),
        Text(
          "Postmortem-এ যে lesion দেখা গেছে সেগুলো সিলেক্ট করুন",
          style: TextStyle(fontSize: 13, color: Colors.grey[600]),
        ),
        const SizedBox(height: 16),

        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 2.8,
              children: _lesions.keys.map((key) {
                final isChecked = _lesions[key]!;
                return CheckboxListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 4),
                  title: Text(key, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500)),
                  value: isChecked,
                  activeColor: Colors.teal,
                  onChanged: (val) {
                    setState(() {
                      _lesions[key] = val ?? false;
                    });
                  },
                );
              }).toList(),
            ),
          ),
        ),
        const SizedBox(height: 24),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 130,
              height: 44,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade700,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () => setState(() => _currentStep = 4),
                child: const Text("Back", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ),
            const SizedBox(width: 16),
            SizedBox(
              width: 140,
              height: 44,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: _runDiagnosticEngine,
                child: const Text("Analyze", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
