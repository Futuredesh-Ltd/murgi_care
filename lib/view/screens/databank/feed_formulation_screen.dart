import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../model/feed_standard_model.dart';
import '../../../model/local_databank_models.dart';
import '../../../controller/local_databank_providers.dart';
import 'add_edit_ingredient_screen.dart';

class FeedFormulationScreen extends ConsumerStatefulWidget {
  final bool isEnglish;

  const FeedFormulationScreen({super.key, required this.isEnglish});

  @override
  ConsumerState<FeedFormulationScreen> createState() => _FeedFormulationScreenState();
}

class _FeedFormulationScreenState extends ConsumerState<FeedFormulationScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _selectedIngredientToAdd = defaultFeedIngredients.first.name;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEng = widget.isEnglish;
    final state = ref.watch(feedFormulationProvider);
    final notifier = ref.read(feedFormulationProvider.notifier);

    // Sync tab controller index with Riverpod state if changed programmatically
    if (_tabController.index != state.selectedTabIndex) {
      _tabController.animateTo(state.selectedTabIndex);
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF4F7F6),
      appBar: AppBar(
        title: Text(isEng ? "Poultry Feed Formulation" : "পোল্ট্রি ফিড ফর্মুলেশন"),
        backgroundColor: const Color(0xFF1B4F72),
        foregroundColor: Colors.white,
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          onTap: (index) => notifier.setSelectedTabIndex(index),
          isScrollable: true,
          indicatorColor: Colors.amberAccent,
          indicatorWeight: 3,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          tabs: [
            Tab(
              icon: const Icon(Icons.grid_view_rounded, size: 20),
              text: isEng ? "Feed Types (${allFeedTypeStandards.length})" : "ফিড টাইপ (${allFeedTypeStandards.length})",
            ),
            Tab(
              icon: const Icon(Icons.science_rounded, size: 20),
              text: isEng ? "Create Formula" : "ফর্মুলা তৈরি",
            ),
            Tab(
              icon: const Icon(Icons.analytics_rounded, size: 20),
              text: isEng ? "Nutrient Standards" : "নিউট্রিয়েন্ট স্ট্যান্ডার্ড",
            ),
            Tab(
              icon: const Icon(Icons.storage_rounded, size: 20),
              text: isEng ? "Saved Formulas" : "সংরক্ষিত ফর্মুলা",
            ),
          ],
        ),
      ),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator(color: Color(0xFF1B4F72)))
          : TabBarView(
              controller: _tabController,
              children: [
                _buildSelectFeedTypeTab(context, state, notifier, isEng),
                _buildCreateFormulaTab(context, state, notifier, isEng),
                _buildNutrientStandardsTab(context, state, notifier, isEng),
                _buildSavedFormulasTab(context, state, notifier, isEng),
              ],
            ),
    );
  }

  // ============================================================================
  // TAB 1: SELECT FEED TYPE (Grid of 28 Feed Types - Images 1, 2, 3)
  // ============================================================================
  Widget _buildSelectFeedTypeTab(
    BuildContext context,
    FeedFormulationState state,
    FeedFormulationNotifier notifier,
    bool isEng,
  ) {
    final filteredTypes = allFeedTypeStandards.where((item) {
      if (state.searchQuery.isEmpty) return true;
      final q = state.searchQuery.toLowerCase();
      return item.category.toLowerCase().contains(q) ||
          item.breed.toLowerCase().contains(q) ||
          item.stage.toLowerCase().contains(q) ||
          item.displayName.toLowerCase().contains(q);
    }).toList();

    return Column(
      children: [
        // Title & Search Header
        Container(
          width: double.infinity,
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                isEng ? "Select Feed Type" : "ফিড টাইপ নির্বাচন করুন",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E293B),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                isEng ? "Total Feed Types: ${allFeedTypeStandards.length}" : "মোট ফিড টাইপ: ${allFeedTypeStandards.length}টি",
                style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
              ),
              const SizedBox(height: 14),
              // Search Input
              TextField(
                decoration: InputDecoration(
                  hintText: isEng ? "Search feed type" : "ফিড টাইপ খুঁজুন...",
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: const Color(0xFFF8FAFC),
                  contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
                onChanged: (val) => notifier.setSearchQuery(val),
              ),
            ],
          ),
        ),
        const Divider(height: 1),

        // Grid of 28 Cards
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(12),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.18,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: filteredTypes.length,
            itemBuilder: (context, index) {
              final item = filteredTypes[index];
              final isSelected = state.selectedFeedType.id == item.id;

              return Card(
                elevation: isSelected ? 4 : 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(
                    color: isSelected ? const Color(0xFF2E7D32) : Colors.grey.shade200,
                    width: isSelected ? 2 : 1,
                  ),
                ),
                color: Colors.white,
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () => notifier.selectFeedType(item),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          item.category,
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item.breed,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0F172A),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item.stage,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2E7D32),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // ============================================================================
  // TAB 2: CREATE FEED FORMULA (Formula Builder - Image 4)
  // ============================================================================
  Widget _buildCreateFormulaTab(
    BuildContext context,
    FeedFormulationState state,
    FeedFormulationNotifier notifier,
    bool isEng,
  ) {
    final target = state.selectedFeedType;

    return Stack(
      children: [
        SingleChildScrollView(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Banner
              Center(
                child: Column(
                  children: [
                    Text(
                      isEng ? "Create Feed Formula" : "ফিড ফর্মুলা তৈরি করুন",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      target.fullPath,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2E7D32),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // 1. Add Ingredient Card
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
                          Text(
                            isEng ? "Add Ingredient" : "উপাদান যোগ করুন",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2E7D32),
                            ),
                          ),
                          TextButton.icon(
                            onPressed: () async {
                              final created = await Navigator.push<FeedIngredient>(
                                context,
                                MaterialPageRoute(
                                  builder: (ctx) => AddEditIngredientScreen(isEnglish: isEng),
                                ),
                              );
                              if (created != null) {
                                await ref.read(feedFormulationProvider.notifier).loadIngredients();
                                setState(() => _selectedIngredientToAdd = created.name);
                              }
                            },
                            icon: const Icon(Icons.add_circle_outline_rounded, size: 18, color: Color(0xFF2E7D32)),
                            label: Text(
                              isEng ? "+ Custom Ingredient" : "+ কাস্টম উপাদান",
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF2E7D32),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        isEng ? "Select an ingredient and add it to the formula" : "তালিকায় উপাদান নির্বাচন করে যোগ করুন",
                        style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                      ),
                      const SizedBox(height: 12),
                      Builder(
                        builder: (context) {
                          final allIngs = state.allIngredients;
                          final selectedVal = allIngs.any((i) => i.name == _selectedIngredientToAdd)
                              ? _selectedIngredientToAdd
                              : (allIngs.isNotEmpty ? allIngs.first.name : null);

                          return DropdownButtonFormField<String>(
                            key: ValueKey("dd_${selectedVal}_${allIngs.length}"),
                            initialValue: selectedVal,
                            isExpanded: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                            ),
                            items: allIngs.map((ing) {
                              final isCustomText = ing.isCustom ? " ★" : "";
                              return DropdownMenuItem(
                                value: ing.name,
                                child: Text(
                                  "${ing.name} (${ing.cp}% CP)$isCustomText",
                                  overflow: TextOverflow.ellipsis,
                                ),
                              );
                            }).toList(),
                            onChanged: (val) {
                              if (val != null) setState(() => _selectedIngredientToAdd = val);
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 44,
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  notifier.addIngredient(_selectedIngredientToAdd, 1.0);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("Added $_selectedIngredientToAdd"),
                                      duration: const Duration(seconds: 1),
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.add, color: Colors.white),
                                label: Text(
                                  isEng ? "+ Add Ingredient" : "+ উপাদান যোগ করুন",
                                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF2E7D32),
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // 2. Formula Ingredients List Card
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
                        isEng ? "Formula Ingredients" : "ফর্মুলার উপাদানসমূহ",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2E7D32),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        isEng ? "Enter amount in kg. Long press an item to remove it." : "কেজিতে পরিমাণ লিখুন। মুছে ফেলতে চেপে ধরুন।",
                        style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                      ),
                      const SizedBox(height: 12),
                      ...state.ingredientWeights.entries.map((entry) {
                        final name = entry.key;
                        final weight = entry.value;
                        final ing = defaultFeedIngredients.firstWhere(
                          (i) => i.name == name,
                          orElse: () => FeedIngredient(name: name, cp: 0, me: 0, pricePerKg: 0),
                        );

                        return Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF8FAFC),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey.shade200),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      name,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF0F172A),
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      "CP ${ing.cp}% | ME ${ing.me} | ৳${ing.pricePerKg}/kg",
                                      style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 8),
                              SizedBox(
                                width: 85,
                                height: 38,
                                child: TextFormField(
                                  key: ValueKey("input_$name"),
                                  initialValue: weight.toStringAsFixed(2),
                                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding: const EdgeInsets.symmetric(vertical: 4),
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                  ),
                                  onChanged: (val) {
                                    final parsed = double.tryParse(val) ?? 0.0;
                                    notifier.updateIngredientWeight(name, parsed);
                                  },
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.close, color: Colors.redAccent, size: 18),
                                onPressed: () => notifier.removeIngredient(name),
                              ),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // 3. Live Nutrient Result Card
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 2,
                color: const Color(0xFFF0FDF4),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            isEng ? "Live Nutrient Result" : "লাইভ নিউট্রিয়েন্ট ফলাফল",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF166534),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: state.totalWeight == 100.0 ? Colors.green.shade100 : Colors.amber.shade100,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              "Total: ${state.totalWeight.toStringAsFixed(2)} kg",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: state.totalWeight == 100.0 ? Colors.green.shade900 : Colors.amber.shade900,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Divider(),
                      const SizedBox(height: 6),
                      _nutrientRow("CP (Crude Protein):", "${state.calculatedCP.toStringAsFixed(2)}%", "(Target: ${target.targetCP}%)"),
                      _nutrientRow("ME (Energy):", "${state.calculatedME.toStringAsFixed(2)} kcal/kg", "(Target: ${target.targetME} kcal)"),
                      _nutrientRow("Ca (Calcium):", "${state.calculatedCa.toStringAsFixed(2)}%", "(Target: ${target.targetCa}%)"),
                      _nutrientRow("Av.P (Phosphorus):", "${state.calculatedAvP.toStringAsFixed(2)}%", "(Target: ${target.targetAvP}%)"),
                      _nutrientRow("Lys (Lysine):", "${state.calculatedLys.toStringAsFixed(2)}%", "(Target: ${target.targetLys}%)"),
                      const Divider(),
                      _nutrientRow(
                        isEng ? "Estimated Cost / kg:" : "আনুমানিক খরচ/কেজি:",
                        "৳${state.costPerKg.toStringAsFixed(2)}",
                        "",
                        isBold: true,
                        color: const Color(0xFF166534),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        // Floating Action Buttons / Palette (Image 4 bottom-right buttons)
        Positioned(
          right: 16,
          bottom: 16,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // 100 kg Button
              _floatingPillButton(
                label: "100 kg",
                icon: Icons.upload_rounded,
                color: const Color(0xFF4C8BF5),
                onTap: () {
                  notifier.scaleTo100Kg();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(isEng ? "Batch scaled to 100 kg" : "১০০ কেজিতে স্কেল করা হয়েছে"),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
              ),
              const SizedBox(height: 8),

              // Balance Button
              _floatingPillButton(
                label: isEng ? "Balance" : "ব্যালেন্স",
                icon: Icons.build_rounded,
                color: const Color(0xFF26A69A),
                onTap: () {
                  notifier.rebalanceFormula();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Row(
                        children: [
                          const Icon(Icons.check_circle, color: Colors.white, size: 20),
                          const SizedBox(width: 8),
                          Text(isEng ? "Formula rebalanced!" : "ফর্মুলা পুনঃভারসাম্য করা হয়েছে!"),
                        ],
                      ),
                      backgroundColor: Colors.teal.shade700,
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
              ),
              const SizedBox(height: 8),

              // Result Button
              _floatingPillButton(
                label: isEng ? "Result" : "ফলাফল",
                icon: Icons.info_outline_rounded,
                color: const Color(0xFFAB47BC),
                onTap: () => _showResultDetailsDialog(context, state, target, isEng),
              ),
              const SizedBox(height: 8),

              // Save Button
              _floatingPillButton(
                label: isEng ? "Save" : "সেভ করুন",
                icon: Icons.save_rounded,
                color: const Color(0xFF4CAF50),
                onTap: () => _saveFormulaToSqflite(context, ref, state, notifier, isEng),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ============================================================================
  // TAB 3: NUTRIENT STANDARDS (List of 28 Standards - Image 5)
  // ============================================================================
  Widget _buildNutrientStandardsTab(
    BuildContext context,
    FeedFormulationState state,
    FeedFormulationNotifier notifier,
    bool isEng,
  ) {
    final filteredStandards = allFeedTypeStandards.where((item) {
      if (state.standardsSearchQuery.isEmpty) return true;
      final q = state.standardsSearchQuery.toLowerCase();
      return item.displayName.toLowerCase().contains(q) ||
          item.category.toLowerCase().contains(q) ||
          item.fullPath.toLowerCase().contains(q);
    }).toList();

    return Column(
      children: [
        // Title & Search Header
        Container(
          width: double.infinity,
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                isEng ? "Nutrient Standard" : "নিউট্রিয়েন্ট স্ট্যান্ডার্ড মান",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E293B),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                isEng ? "Total Standards: ${allFeedTypeStandards.length}" : "মোট স্ট্যান্ডার্ড মান: ${allFeedTypeStandards.length}টি",
                style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
              ),
              const SizedBox(height: 14),
              TextField(
                decoration: InputDecoration(
                  hintText: isEng ? "Search: Broiler, Layer, Starter..." : "খুঁজুন: Broiler, Layer, Starter...",
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: const Color(0xFFF8FAFC),
                  contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
                onChanged: (val) => notifier.setStandardsSearchQuery(val),
              ),
            ],
          ),
        ),
        const Divider(height: 1),

        // List of 28 Standard Cards
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(14),
            itemCount: filteredStandards.length,
            itemBuilder: (context, index) {
              final std = filteredStandards[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 1.5,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        std.displayName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0F172A),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "Category: ${std.category}",
                        style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          _standardBadge("CP: ${std.targetCP}%", Colors.green.shade800),
                          const SizedBox(width: 8),
                          _standardBadge("ME: ${std.targetME} kcal/kg", Colors.green.shade800),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          _standardBadge("Ca: ${std.targetCa}%", Colors.blue.shade800),
                          const SizedBox(width: 8),
                          _standardBadge("Av.P: ${std.targetAvP}%", Colors.blue.shade800),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          _standardBadge("Lys: ${std.targetLys}%", Colors.deepOrange.shade800),
                          const SizedBox(width: 8),
                          _standardBadge("Met: ${std.targetMet}%", Colors.deepOrange.shade800),
                          const SizedBox(width: 8),
                          _standardBadge("Max Fiber: ${std.maxFiber}%", Colors.deepOrange.shade800),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // ============================================================================
  // TAB 4: SAVED FORMULAS (SQLite Database Records)
  // ============================================================================
  Widget _buildSavedFormulasTab(
    BuildContext context,
    FeedFormulationState state,
    FeedFormulationNotifier notifier,
    bool isEng,
  ) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            isEng ? "Saved Feed Formulations (SQLite)" : "সংরক্ষিত ফিড ফর্মুলা (ডাটাবেস)",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
          ),
          const SizedBox(height: 4),
          Text(
            isEng ? "Stored locally on device in SQLite database" : "আপনার ডিভাইসের লোকাল SQLite ডাটাবেসে সংরক্ষিত",
            style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 14),

          if (state.formulations.isEmpty)
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Column(
                  children: [
                    Icon(Icons.inventory_2_outlined, size: 50, color: Colors.grey.shade400),
                    const SizedBox(height: 10),
                    Text(
                      isEng ? "No saved formulations yet" : "এখনও কোন সংরক্ষিত ফর্মুলা নেই",
                      style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                    ),
                  ],
                ),
              ),
            )
          else
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.formulations.length,
              itemBuilder: (context, index) {
                final f = state.formulations[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  elevation: 1.5,
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    title: Text(f.formulaName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(
                          "${f.targetBreed} | ${f.totalBatchKg.toStringAsFixed(1)} kg batch",
                          style: const TextStyle(color: Color(0xFF2E7D32), fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          "CP: ${f.crudeProteinPercent.toStringAsFixed(1)}% | ME: ${f.metabolizableEnergy.toStringAsFixed(0)} kcal\nCost: ৳${f.costPerKg.toStringAsFixed(2)}/kg",
                          style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outline_rounded, color: Colors.redAccent),
                      onPressed: () {
                        notifier.deleteFormulation(f.id);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(isEng ? "Formulation deleted" : "ফর্মুলা মোছা হয়েছে")),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }

  // --- HELPER WIDGETS ---
  Widget _nutrientRow(String label, String value, String target, {bool isBold = false, Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
                color: color ?? const Color(0xFF334155),
              ),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: color ?? const Color(0xFF0F172A),
            ),
          ),
          if (target.isNotEmpty) ...[
            const SizedBox(width: 6),
            Text(
              target,
              style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
            ),
          ],
        ],
      ),
    );
  }

  Widget _floatingPillButton({
    required String label,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Material(
      elevation: 4,
      color: color,
      borderRadius: BorderRadius.circular(25),
      child: InkWell(
        borderRadius: BorderRadius.circular(25),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: Colors.white, size: 16),
              const SizedBox(width: 6),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _standardBadge(String text, Color color) {
    return Text(
      text,
      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: color),
    );
  }

  // --- ACTIONS & DIALOGS ---
  void _showResultDetailsDialog(BuildContext context, FeedFormulationState state, FeedTypeStandard target, bool isEng) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(isEng ? "Nutrient Standard Comparison" : "স্ট্যান্ডার্ড মানের সাথে তুলনা"),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                target.displayName,
                style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF2E7D32)),
              ),
              const SizedBox(height: 10),
              _compareRow("Crude Protein", "${state.calculatedCP.toStringAsFixed(2)}%", "${target.targetCP}%"),
              _compareRow("Metabolizable Energy", "${state.calculatedME.toStringAsFixed(0)} kcal", "${target.targetME} kcal"),
              _compareRow("Calcium (Ca)", "${state.calculatedCa.toStringAsFixed(2)}%", "${target.targetCa}%"),
              _compareRow("Phosphorus (Av.P)", "${state.calculatedAvP.toStringAsFixed(2)}%", "${target.targetAvP}%"),
              _compareRow("Lysine (Lys)", "${state.calculatedLys.toStringAsFixed(2)}%", "${target.targetLys}%"),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(isEng ? "Close" : "বন্ধ করুন"),
          ),
        ],
      ),
    );
  }

  Widget _compareRow(String title, String val, String targetVal) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 12)),
          Row(
            children: [
              Text(val, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
              Text(" (Std: $targetVal)", style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
            ],
          ),
        ],
      ),
    );
  }

  void _saveFormulaToSqflite(
    BuildContext context,
    WidgetRef ref,
    FeedFormulationState state,
    FeedFormulationNotifier notifier,
    bool isEng,
  ) {
    final item = LocalFeedFormulation(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      formulaName: state.formulaName,
      targetBreed: state.selectedFeedType.displayName,
      crudeProteinPercent: state.calculatedCP,
      metabolizableEnergy: state.calculatedME,
      totalBatchKg: state.totalWeight,
      costPerKg: state.costPerKg,
      ingredientsRatio: state.ingredientWeights,
      createdAt: DateTime.now(),
    );

    notifier.saveFormulation(item);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle, color: Colors.white),
            const SizedBox(width: 8),
            Text(isEng ? "Formulation saved to SQLite!" : "ফর্মুলা সফলভাবে সেভ হয়েছে!"),
          ],
        ),
        backgroundColor: Colors.green.shade700,
      ),
    );
  }
}
