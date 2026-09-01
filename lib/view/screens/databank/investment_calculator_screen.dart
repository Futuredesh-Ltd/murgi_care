import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../model/local_databank_models.dart';
import '../../../controller/local_databank_providers.dart';
import 'project_detail_screen.dart';

class InvestmentCalculatorScreen extends ConsumerStatefulWidget {
  final bool isEnglish;

  const InvestmentCalculatorScreen({super.key, required this.isEnglish});

  @override
  ConsumerState<InvestmentCalculatorScreen> createState() => _InvestmentCalculatorScreenState();
}

class _InvestmentCalculatorScreenState extends ConsumerState<InvestmentCalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    final isEng = widget.isEnglish;
    final state = ref.watch(investmentCalculatorProvider);
    final notifier = ref.read(investmentCalculatorProvider.notifier);

    final totalProjects = state.projects.length;
    final totalBirdCapacity = state.projects.fold<int>(0, (sum, item) => sum + item.birdQuantity);

    return Scaffold(
      backgroundColor: const Color(0xFFF4F7F6),
      appBar: AppBar(
        title: Text(isEng ? "Investment Dashboard" : "ইনভেস্টমেন্ট ড্যাশবোর্ড"),
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
                  // Top Banner Title
                  Center(
                    child: Column(
                      children: [
                        Text(
                          isEng ? "Investment Dashboard" : "ইনভেস্টমেন্ট ড্যাশবোর্ড",
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1E293B),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          isEng
                              ? "Manage investment projects, bird capacity, and project budgets"
                              : "ইনভেস্টমেন্ট প্রজেক্ট, পাখির ধারণক্ষমতা এবং বাজেট পরিচালনা করুন",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 2 Top Summary Cards (Image 1 style matching app design)
                  Row(
                    children: [
                      // Projects Card
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withAlpha(12),
                                blurRadius: 6,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Text(
                                isEng ? "Projects" : "প্রজেক্টস",
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF64748B),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "$totalProjects",
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1E293B),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),

                      // Bird Capacity Card
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withAlpha(12),
                                blurRadius: 6,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Text(
                                isEng ? "Bird Capacity" : "পাখির ক্যাপাসিটি",
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF64748B),
                                ),
                              ),
                              const SizedBox(height: 8),
                              FittedBox(
                                child: Text(
                                  _formatNumber(totalBirdCapacity),
                                  style: const TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF1E293B),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Section Header: Saved Projects
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        isEng ? "Saved Projects" : "সংরক্ষিত প্রজেক্টসমূহ",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0F172A),
                        ),
                      ),
                      if (state.projects.isNotEmpty)
                        Text(
                          "Total: ${state.projects.length}",
                          style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                        ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Saved Projects List or Empty State
                  if (state.projects.isEmpty)
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.folder_open_rounded, size: 54, color: Colors.grey.shade400),
                          const SizedBox(height: 12),
                          Text(
                            isEng ? "No saved projects yet" : "এখনও কোনো প্রজেক্ট সংরক্ষণ করা হয়নি",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade700,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            isEng
                                ? "Click '+ New Project' below to create your first investment project."
                                : "আপনার প্রথম ইনভেস্টমেন্ট প্রজেক্ট তৈরি করতে নিচের '+ নতুন প্রজেক্ট' বাটনে ট্যাপ করুন।",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
                          ),
                        ],
                      ),
                    )
                  else
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.projects.length,
                      itemBuilder: (context, index) {
                        final p = state.projects[index];
                        final inv = p.shedCost + p.chickCostTotal + p.feedBudgetTotal + p.medicineBudget + p.laborCost;
                        final profit = p.expectedRevenue - inv;

                        return Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          elevation: 2,
                          color: Colors.white,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(16),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (ctx) => ProjectDetailScreen(
                                    project: p,
                                    isEnglish: isEng,
                                  ),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Title & Delete button
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        p.projectName,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF0F172A),
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete_outline_rounded, color: Colors.redAccent, size: 20),
                                      onPressed: () => notifier.deleteProject(p.id),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),

                                // Badges Row (Farm Type, Breed, District)
                                Wrap(
                                  spacing: 6,
                                  runSpacing: 6,
                                  children: [
                                    if (p.farmType.isNotEmpty) _badgeChip(p.farmType, const Color(0xFF2E7D32)),
                                    if (p.breedType.isNotEmpty) _badgeChip(p.breedType, const Color(0xFF0284C7)),
                                    if (p.district.isNotEmpty) _badgeChip(p.district, const Color(0xFF7C3AED)),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                const Divider(height: 1),
                                const SizedBox(height: 10),

                                // Project Details Grid
                                Row(
                                  children: [
                                    _detailCell(
                                      label: isEng ? "Bird Capacity" : "পাখির সংখ্যা",
                                      value: p.birdQuantity > 0 ? "${_formatNumber(p.birdQuantity)} birds" : "N/A",
                                    ),
                                    _detailCell(
                                      label: isEng ? "House System" : "হাউস টাইপ",
                                      value: p.houseType.isNotEmpty ? p.houseType : "N/A",
                                    ),
                                    _detailCell(
                                      label: isEng ? "Sheds" : "শেড সংখ্যা",
                                      value: "${p.numberOfSheds} Sheds",
                                    ),
                                  ],
                                ),

                                if (inv > 0 || p.expectedRevenue > 0) ...[
                                  const SizedBox(height: 10),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFF8FAFC),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.grey.shade200),
                                    ),
                                    child: Row(
                                      children: [
                                        _detailCell(
                                          label: isEng ? "Investment" : "বিনিয়োগ",
                                          value: "৳${_formatNumber(inv.toInt())}",
                                          valueColor: Colors.brown,
                                        ),
                                        _detailCell(
                                          label: isEng ? "Expected Revenue" : "সম্ভাব্য বিক্রি",
                                          value: "৳${_formatNumber(p.expectedRevenue.toInt())}",
                                          valueColor: Colors.blue.shade900,
                                        ),
                                        _detailCell(
                                          label: isEng ? "Est. Profit" : "সম্ভাব্য লাভ",
                                          value: "৳${_formatNumber(profit.toInt())}",
                                          valueColor: profit >= 0 ? Colors.green.shade800 : Colors.red,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ),
                      );
                      },
                    ),
                  const SizedBox(height: 80), // Extra space for FAB / bottom button
                ],
              ),
            ),

      // Bottom Fixed Button (Image 1 matching app design)
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          width: double.infinity,
          height: 52,
          child: ElevatedButton.icon(
            onPressed: () => _openNewProjectForm(context),
            icon: const Icon(Icons.add_rounded, size: 22, color: Colors.white),
            label: Text(
              isEng ? "New Project" : "নতুন প্রজেক্ট",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF00897B),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
              elevation: 4,
            ),
          ),
        ),
      ),
    );
  }

  Widget _badgeChip(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withAlpha(25),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withAlpha(80)),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
    );
  }

  Widget _detailCell({
    required String label,
    required String value,
    Color? valueColor,
  }) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 10, color: Colors.grey.shade600),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: valueColor ?? const Color(0xFF0F172A),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  String _formatNumber(int number) {
    return number.toString().replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]},',
        );
  }

  // --- NEW PROJECT FORM DIALOG / BOTTOM SHEET (Image 2) ---
  void _openNewProjectForm(BuildContext context) {
    final isEng = widget.isEnglish;

    final nameCtrl = TextEditingController();
    final quantityCtrl = TextEditingController();
    final shedsCtrl = TextEditingController(text: "1");

    // Financial Budget Controllers (Optional)
    final shedCostCtrl = TextEditingController();
    final chickCostCtrl = TextEditingController();
    final feedBudgetCtrl = TextEditingController();
    final medBudgetCtrl = TextEditingController();
    final laborCostCtrl = TextEditingController();
    final revCtrl = TextEditingController();

    String farmType = 'Broiler';
    String breedType = 'Cobb 500';
    String houseType = 'Open House';
    String floorSystem = 'Deep Litter';
    String district = 'Dhaka';

    final farmTypes = ['Broiler', 'Layer', 'Sonali', 'Color / Sonali Classic', 'Breeder'];
    final breedTypes = [
      'Cobb 500',
      'Ross 308',
      'Hy-Line Brown',
      'Novogen Brown',
      'Sonali Classic',
      'Bovans White',
      'Hubbard Classic',
      'Lohmann Brown',
      'Other'
    ];
    final houseTypes = [
      'Open House',
      'Open House System',
      'Environmentally Controlled (EC) House',
      'Semi-EC House'
    ];
    final floorSystems = [
      'Deep Litter',
      'Deep Litter System',
      'Slatt / Plastic Floor System',
      'Cage System'
    ];
    final districts = [
      'Dhaka', 'Gazipur', 'Bogura', 'Cumilla', 'Chattogram', 'Mymensingh', 'Tangail',
      'Rajshahi', 'Dinajpur', 'Jhenaidah', 'Kishoreganj', 'Sirajganj', 'Pabna',
      'Barishal', 'Sylhet', 'Jessore', 'Faridpur', 'Cox\'s Bazar', 'Narsingdi',
      'Narayanganj', 'Other'
    ];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => StatefulBuilder(
        builder: (context, setModalState) {
          return Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20,
              bottom: MediaQuery.of(context).viewInsets.bottom + 20,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Title Bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        isEng ? "New Investment Project" : "নতুন ইনভেস্টমেন্ট প্রজেক্ট",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0F172A),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close_rounded, color: Colors.grey),
                        onPressed: () => Navigator.pop(ctx),
                      ),
                    ],
                  ),
                  const Divider(),
                  const SizedBox(height: 10),

                  // 1. Project Name
                  TextField(
                    controller: nameCtrl,
                    decoration: InputDecoration(
                      hintText: isEng ? "Project Name" : "প্রজেক্টের নাম",
                      labelText: isEng ? "Project Name" : "প্রজেক্টের নাম",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // 2. Select Farm Type
                  DropdownButtonFormField<String>(
                    initialValue: farmTypes.contains(farmType) ? farmType : farmTypes.first,
                    isExpanded: true,
                    decoration: InputDecoration(
                      labelText: isEng ? "Select Farm Type" : "ফার্ম টাইপ নির্বাচন করুন",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    ),
                    items: farmTypes
                        .map((f) => DropdownMenuItem(
                              value: f,
                              child: Text(f, overflow: TextOverflow.ellipsis),
                            ))
                        .toList(),
                    onChanged: (val) {
                      if (val != null) setModalState(() => farmType = val);
                    },
                  ),
                  const SizedBox(height: 12),

                  // 3. Select Breed Type
                  DropdownButtonFormField<String>(
                    initialValue: breedTypes.contains(breedType) ? breedType : breedTypes.first,
                    isExpanded: true,
                    decoration: InputDecoration(
                      labelText: isEng ? "Select Breed Type" : "জাত নির্বাচন করুন",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    ),
                    items: breedTypes
                        .map((b) => DropdownMenuItem(
                              value: b,
                              child: Text(b, overflow: TextOverflow.ellipsis),
                            ))
                        .toList(),
                    onChanged: (val) {
                      if (val != null) setModalState(() => breedType = val);
                    },
                  ),
                  const SizedBox(height: 12),

                  // 4. Bird Quantity
                  TextField(
                    controller: quantityCtrl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: isEng ? "Bird Quantity" : "পাখির সংখ্যা",
                      labelText: isEng ? "Bird Quantity" : "পাখির সংখ্যা",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // 5. Select House Type
                  DropdownButtonFormField<String>(
                    initialValue: houseTypes.contains(houseType) ? houseType : houseTypes.first,
                    isExpanded: true,
                    decoration: InputDecoration(
                      labelText: isEng ? "Select House Type" : "হাউস টাইপ নির্বাচন করুন",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    ),
                    items: houseTypes
                        .map((h) => DropdownMenuItem(
                              value: h,
                              child: Text(h, overflow: TextOverflow.ellipsis),
                            ))
                        .toList(),
                    onChanged: (val) {
                      if (val != null) setModalState(() => houseType = val);
                    },
                  ),
                  const SizedBox(height: 12),

                  // 6. Select Floor System
                  DropdownButtonFormField<String>(
                    initialValue: floorSystems.contains(floorSystem) ? floorSystem : floorSystems.first,
                    isExpanded: true,
                    decoration: InputDecoration(
                      labelText: isEng ? "Select Floor System" : "ফ্লোর সিস্টেম নির্বাচন করুন",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    ),
                    items: floorSystems
                        .map((fs) => DropdownMenuItem(
                              value: fs,
                              child: Text(fs, overflow: TextOverflow.ellipsis),
                            ))
                        .toList(),
                    onChanged: (val) {
                      if (val != null) setModalState(() => floorSystem = val);
                    },
                  ),
                  const SizedBox(height: 12),

                  // 7. Select District
                  DropdownButtonFormField<String>(
                    initialValue: districts.contains(district) ? district : districts.first,
                    isExpanded: true,
                    decoration: InputDecoration(
                      labelText: isEng ? "Select District" : "জেলা নির্বাচন করুন",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    ),
                    items: districts
                        .map((d) => DropdownMenuItem(
                              value: d,
                              child: Text(d, overflow: TextOverflow.ellipsis),
                            ))
                        .toList(),
                    onChanged: (val) {
                      if (val != null) setModalState(() => district = val);
                    },
                  ),
                  const SizedBox(height: 12),

                  // 8. Number Of Sheds
                  TextField(
                    controller: shedsCtrl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: isEng ? "Number Of Sheds" : "শেডের সংখ্যা",
                      labelText: isEng ? "Number Of Sheds" : "শেডের সংখ্যা",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Optional Financial Budget Expander
                  Theme(
                    data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      title: Text(
                        isEng ? "Financial Budget Inputs (Optional)" : "আর্থিক বাজেট ইনপুট (ঐচ্ছিক)",
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF2E7D32)),
                      ),
                      children: [
                        const SizedBox(height: 6),
                        TextField(
                          controller: shedCostCtrl,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: isEng ? "Shed Construction Cost (৳)" : "শেড নির্মাণ খরচ (৳)",
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: chickCostCtrl,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: isEng ? "Chick Purchase Budget (৳)" : "বাচ্চা ক্রয় বাজেট (৳)",
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: feedBudgetCtrl,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: isEng ? "Feed Budget (৳)" : "খাবারের বাজেট (৳)",
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: medBudgetCtrl,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: isEng ? "Medicine Budget (৳)" : "ওষুধ ও ভ্যাকসিন বাজেট (৳)",
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: laborCostCtrl,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: isEng ? "Labor & Misc Cost (৳)" : "লেবার ও অন্যান্য খরচ (৳)",
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: revCtrl,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: isEng ? "Expected Revenue (৳)" : "আশঙ্কাজনক বিক্রি/আয় (৳)",
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        const SizedBox(height: 12),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // SAVE PROJECT Button (Image 2 style matching app design)
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (nameCtrl.text.trim().isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(isEng ? "Please enter project name" : "প্রজেক্টের নাম দিন")),
                          );
                          return;
                        }

                        final newProj = LocalInvestmentProject(
                          id: DateTime.now().millisecondsSinceEpoch.toString(),
                          projectName: nameCtrl.text.trim(),
                          location: district,
                          farmType: farmType,
                          breedType: breedType,
                          birdQuantity: int.tryParse(quantityCtrl.text.trim()) ?? 0,
                          houseType: houseType,
                          floorSystem: floorSystem,
                          district: district,
                          numberOfSheds: int.tryParse(shedsCtrl.text.trim()) ?? 1,
                          shedCost: double.tryParse(shedCostCtrl.text.trim()) ?? 0.0,
                          chickCostTotal: double.tryParse(chickCostCtrl.text.trim()) ?? 0.0,
                          feedBudgetTotal: double.tryParse(feedBudgetCtrl.text.trim()) ?? 0.0,
                          medicineBudget: double.tryParse(medBudgetCtrl.text.trim()) ?? 0.0,
                          laborCost: double.tryParse(laborCostCtrl.text.trim()) ?? 0.0,
                          expectedRevenue: double.tryParse(revCtrl.text.trim()) ?? 0.0,
                          createdAt: DateTime.now(),
                        );

                        ref.read(investmentCalculatorProvider.notifier).saveProject(newProj);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(isEng ? "Project saved successfully!" : "প্রজেক্ট সফলভাবে সেভ হয়েছে!"),
                            backgroundColor: const Color(0xFF2E7D32),
                          ),
                        );

                        Navigator.pop(ctx);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00897B),
                        foregroundColor: Colors.white,
                        elevation: 2,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: Text(
                        isEng ? "SAVE PROJECT" : "প্রজেক্ট সেভ করুন",
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 0.5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
