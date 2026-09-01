import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../model/local_databank_models.dart';

class ProjectDetailScreen extends ConsumerStatefulWidget {
  final LocalInvestmentProject project;
  final bool isEnglish;

  const ProjectDetailScreen({
    super.key,
    required this.project,
    required this.isEnglish,
  });

  @override
  ConsumerState<ProjectDetailScreen> createState() => _ProjectDetailScreenState();
}

class _ProjectDetailScreenState extends ConsumerState<ProjectDetailScreen> {
  // Manual edit toggle
  bool _enableManualEdit = false;

  // Equipment selection
  String _feedingSystem = 'Manual Feeding';
  String _drinkingSystem = 'Manual Drinker';
  String _layerCageType = 'Local Cage';

  // Editable Market Prices
  late TextEditingController _chickPriceCtrl;
  late TextEditingController _feedPriceCtrl;
  late TextEditingController _salePriceCtrl;
  late TextEditingController _eggPriceCtrl;
  late TextEditingController _culledPriceCtrl;
  late TextEditingController _laborPerBirdCtrl;
  late TextEditingController _medPerBirdCtrl;
  late TextEditingController _litterPerBirdCtrl;
  late TextEditingController _elecPerBirdCtrl;
  late TextEditingController _transPerBirdCtrl;
  late TextEditingController _miscPerBirdCtrl;

  // Fixed Capital Override Controllers
  late TextEditingController _landCostCtrl;
  late TextEditingController _shedCostCtrl;
  late TextEditingController _equipCostCtrl;
  late TextEditingController _genCostCtrl;
  late TextEditingController _elecSetupCostCtrl;
  late TextEditingController _waterCostCtrl;
  late TextEditingController _bioCostCtrl;
  late TextEditingController _officeCostCtrl;
  late TextEditingController _otherFixedCostCtrl;

  // Mortality Simulation
  double _mortalityRate = 3.0; // %

  @override
  void initState() {
    super.initState();
    final p = widget.project;
    final birds = p.birdQuantity > 0 ? p.birdQuantity : 1000;

    // Default prices
    _chickPriceCtrl = TextEditingController(text: "55");
    _feedPriceCtrl = TextEditingController(text: "55");
    _salePriceCtrl = TextEditingController(text: "180");
    _eggPriceCtrl = TextEditingController(text: "10");
    _culledPriceCtrl = TextEditingController(text: "150");
    _laborPerBirdCtrl = TextEditingController(text: "12");
    _medPerBirdCtrl = TextEditingController(text: "10");
    _litterPerBirdCtrl = TextEditingController(text: "5");
    _elecPerBirdCtrl = TextEditingController(text: "6");
    _transPerBirdCtrl = TextEditingController(text: "5");
    _miscPerBirdCtrl = TextEditingController(text: "5");

    // Calculated / Default Fixed Costs
    final shedCostCalc = p.shedCost > 0 ? p.shedCost : (birds * 1050.0);
    final landCostCalc = shedCostCalc * 0.45;
    final equipCostCalc = birds * 88.0;

    _landCostCtrl = TextEditingController(text: "${landCostCalc.toInt()}");
    _shedCostCtrl = TextEditingController(text: "${shedCostCalc.toInt()}");
    _equipCostCtrl = TextEditingController(text: "${equipCostCalc.toInt()}");
    _genCostCtrl = TextEditingController(text: "300000");
    _elecSetupCostCtrl = TextEditingController(text: "${(shedCostCalc * 0.05).toInt()}");
    _waterCostCtrl = TextEditingController(text: "141150");
    _bioCostCtrl = TextEditingController(text: "112920");
    _officeCostCtrl = TextEditingController(text: "250000");
    _otherFixedCostCtrl = TextEditingController(text: "110049");
  }

  @override
  void dispose() {
    _chickPriceCtrl.dispose();
    _feedPriceCtrl.dispose();
    _salePriceCtrl.dispose();
    _eggPriceCtrl.dispose();
    _culledPriceCtrl.dispose();
    _laborPerBirdCtrl.dispose();
    _medPerBirdCtrl.dispose();
    _litterPerBirdCtrl.dispose();
    _elecPerBirdCtrl.dispose();
    _transPerBirdCtrl.dispose();
    _miscPerBirdCtrl.dispose();

    _landCostCtrl.dispose();
    _shedCostCtrl.dispose();
    _equipCostCtrl.dispose();
    _genCostCtrl.dispose();
    _elecSetupCostCtrl.dispose();
    _waterCostCtrl.dispose();
    _bioCostCtrl.dispose();
    _officeCostCtrl.dispose();
    _otherFixedCostCtrl.dispose();
    super.dispose();
  }

  // --- AREA CALCULATIONS ---
  double get _shedAreaSqft {
    final qty = widget.project.birdQuantity > 0 ? widget.project.birdQuantity : 1000;
    if (widget.project.houseType.contains('EC')) {
      return qty * 0.75; // 0.75 sqft per bird in EC house
    } else if (widget.project.floorSystem.contains('Cage')) {
      return qty * 0.55;
    }
    return qty * 1.5; // 1.5 sqft per bird in Open House
  }

  double get _utilityAreaSqft => _shedAreaSqft * 0.50; // 50% extra for utility & biosecurity
  double get _totalLandDecimal => (_shedAreaSqft + _utilityAreaSqft) / 435.6;

  // --- WORKING CAPITAL CALCULATIONS ---
  int get _birds => widget.project.birdQuantity > 0 ? widget.project.birdQuantity : 1000;
  double get _chickCost => _birds * (double.tryParse(_chickPriceCtrl.text) ?? 55.0);
  double get _feedCost => _birds * 3.1 * (double.tryParse(_feedPriceCtrl.text) ?? 55.0); // 3.1kg feed per broiler
  double get _vaccineCost => _birds * 5.0;
  double get _medicineCost => _birds * (double.tryParse(_medPerBirdCtrl.text) ?? 10.0);
  double get _laborCost => _birds * (double.tryParse(_laborPerBirdCtrl.text) ?? 12.0);
  double get _electricityCost => _birds * (double.tryParse(_elecPerBirdCtrl.text) ?? 6.0);
  double get _litterCost => _birds * (double.tryParse(_litterPerBirdCtrl.text) ?? 5.0);
  double get _transportCost => _birds * (double.tryParse(_transPerBirdCtrl.text) ?? 5.0);
  double get _miscCost => _birds * (double.tryParse(_miscPerBirdCtrl.text) ?? 5.0);

  double get _totalWorkingCapital =>
      _chickCost +
      _feedCost +
      _vaccineCost +
      _medicineCost +
      _laborCost +
      _electricityCost +
      _litterCost +
      _transportCost +
      _miscCost;

  // --- FIXED CAPITAL CALCULATIONS ---
  double get _totalFixedCapital {
    return (double.tryParse(_landCostCtrl.text) ?? 0.0) +
        (double.tryParse(_shedCostCtrl.text) ?? 0.0) +
        (double.tryParse(_equipCostCtrl.text) ?? 0.0) +
        (double.tryParse(_genCostCtrl.text) ?? 0.0) +
        (double.tryParse(_elecSetupCostCtrl.text) ?? 0.0) +
        (double.tryParse(_waterCostCtrl.text) ?? 0.0) +
        (double.tryParse(_bioCostCtrl.text) ?? 0.0) +
        (double.tryParse(_officeCostCtrl.text) ?? 0.0) +
        (double.tryParse(_otherFixedCostCtrl.text) ?? 0.0);
  }

  // --- REVENUE & PROFIT CALCULATIONS ---
  double get _survivingBirds => _birds * (1.0 - (_mortalityRate / 100.0));
  double get _expectedRevenue => _survivingBirds * 2.1 * (double.tryParse(_salePriceCtrl.text) ?? 180.0); // 2.1kg avg body wt
  double get _netProfit => _expectedRevenue - _totalWorkingCapital;
  double get _roiPercent => _totalWorkingCapital > 0 ? (_netProfit / _totalWorkingCapital) * 100 : 0.0;

  @override
  Widget build(BuildContext context) {
    final isEng = widget.isEnglish;
    final p = widget.project;

    return Scaffold(
      backgroundColor: const Color(0xFFF4F7F6),
      appBar: AppBar(
        title: Text(p.projectName),
        backgroundColor: const Color(0xFF00695C),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Top Card: Project Overview Details (Image 2 style)
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
                      p.projectName,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                    const SizedBox(height: 10),
                    _infoRow("Farm Type:", p.farmType.isNotEmpty ? p.farmType : "Broiler"),
                    _infoRow("Breed Type:", p.breedType.isNotEmpty ? p.breedType : "Cobb 500"),
                    _infoRow("Bird Quantity:", "${_formatNumber(_birds)} Birds"),
                    _infoRow("House Type:", p.houseType.isNotEmpty ? p.houseType : "Open House"),
                    _infoRow("Floor System:", p.floorSystem.isNotEmpty ? p.floorSystem : "Slat System"),
                    _infoRow("District:", p.district.isNotEmpty ? p.district : "Gazipur"),
                    _infoRow("Number of Sheds:", "${p.numberOfSheds}"),
                    _infoRow("Created Date:", "${p.createdAt.day.toString().padLeft(2, '0')} ${_monthName(p.createdAt.month)} ${p.createdAt.year}"),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 2. Main Navigation Action Accordions (Matching Images 1, 2, 3, 4, 5)
            _buildAccordionCard(
              title: isEng ? "Farm Area & Equipment Requirement" : "ফার্ম এলাকা ও ইকুইপমেন্ট প্রয়োজন",
              color: const Color(0xFF00897B),
              icon: Icons.square_foot_rounded,
              child: _buildAreaAndEquipmentSection(isEng),
            ),
            const SizedBox(height: 12),

            _buildAccordionCard(
              title: isEng ? "Fixed Capital Cost" : "স্থায়ী মূলধন খরচ (Fixed Capital)",
              color: const Color(0xFF2E7D32),
              icon: Icons.account_balance_wallet_rounded,
              child: _buildFixedCapitalSection(isEng),
            ),
            const SizedBox(height: 12),

            _buildAccordionCard(
              title: isEng ? "Working Capital Update" : "চলতি মূলধন খরচ (Working Capital)",
              color: const Color(0xFF0284C7),
              icon: Icons.payments_rounded,
              child: _buildWorkingCapitalSection(isEng),
            ),
            const SizedBox(height: 12),

            _buildAccordionCard(
              title: isEng ? "Market Price Update" : "মার্কেট দর পর্যায়ক্রমিক আপডেট",
              color: const Color(0xFFEA580C),
              icon: Icons.storefront_rounded,
              child: _buildMarketPriceSection(isEng),
            ),
            const SizedBox(height: 12),

            _buildAccordionCard(
              title: isEng ? "Mortality Simulation" : "মরটালিটি সিমুলেশন ও ঝুঁকি প্রভাব",
              color: Colors.purple.shade700,
              icon: Icons.warning_amber_rounded,
              child: _buildMortalitySimulationSection(isEng),
            ),
            const SizedBox(height: 12),

            _buildAccordionCard(
              title: isEng ? "Profit and ROI Forecast" : "লাভ ও আনুমানিক রিটার্ন (ROI)",
              color: Colors.teal.shade900,
              icon: Icons.trending_up_rounded,
              child: _buildProfitAndRoiSection(isEng),
            ),
            const SizedBox(height: 12),

            _buildAccordionCard(
              title: isEng ? "Final Executive Investment Report" : "চূড়ান্ত ইনভেস্টমেন্ট রিপোর্ট",
              color: const Color(0xFF1E293B),
              icon: Icons.assessment_rounded,
              child: _buildFinalReportSection(isEng),
            ),
            const SizedBox(height: 20),

            // Export / Share PDF Full-Width Green Button (Image 2 style)
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                onPressed: () => _exportReport(context),
                icon: const Icon(Icons.picture_as_pdf_rounded, color: Colors.white),
                label: Text(
                  isEng ? "Export / Share PDF Report" : "রিপোর্ট শেয়ার / ডাউনলোড করুন (PDF)",
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00695C),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 3,
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  // --- 1. FARM AREA & EQUIPMENT SECTION (Image 4) ---
  Widget _buildAreaAndEquipmentSection(bool isEng) {
    final feederQty = (_birds / 50).ceil();
    final drinkerQty = (_birds / 80).ceil();
    final feedingCost = feederQty * 450;
    final drinkingCost = drinkerQty * 350;
    final slatCost = widget.project.floorSystem.contains('Slat') ? (_birds * 75) : 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Farm Area Requirement Card
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: const Color(0xFFE0F2FE),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFBAE6FD)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isEng ? "Farm Area Requirement" : "ফার্ম এলাকা ও জমি প্রয়োজন",
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFF0369A1)),
              ),
              const SizedBox(height: 8),
              _subInfoRow("Required Shed Area:", "${_formatNumber(_shedAreaSqft.toInt())} sqft"),
              _subInfoRow("Utility & Biosecurity Area:", "${_formatNumber(_utilityAreaSqft.toInt())} sqft"),
              _subInfoRow("Total Land Required:", "${_totalLandDecimal.toStringAsFixed(2)} decimal"),
            ],
          ),
        ),
        const SizedBox(height: 14),

        // Equipment and Automation Card
        Text(
          isEng ? "Equipment and Automation" : "যন্ত্রপাতি ও অটোমেশন নির্বাচন",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF0F172A)),
        ),
        const SizedBox(height: 8),

        DropdownButtonFormField<String>(
          initialValue: _feedingSystem,
          isExpanded: true,
          decoration: InputDecoration(
            labelText: isEng ? "Feeding System" : "ফিডিং সিস্টেম",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
          items: ['Manual Feeding', 'Automatic Pan Feeding', 'Chain Feeding']
              .map((s) => DropdownMenuItem(value: s, child: Text(s, overflow: TextOverflow.ellipsis)))
              .toList(),
          onChanged: (val) => setState(() => _feedingSystem = val!),
        ),
        const SizedBox(height: 10),

        DropdownButtonFormField<String>(
          initialValue: _drinkingSystem,
          isExpanded: true,
          decoration: InputDecoration(
            labelText: isEng ? "Drinking System" : "ওয়াটারিং সিস্টেম",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
          items: ['Manual Drinker', 'Automatic Nipple Drinker', 'Bell Drinker']
              .map((s) => DropdownMenuItem(value: s, child: Text(s, overflow: TextOverflow.ellipsis)))
              .toList(),
          onChanged: (val) => setState(() => _drinkingSystem = val!),
        ),
        const SizedBox(height: 10),

        DropdownButtonFormField<String>(
          initialValue: _layerCageType,
          isExpanded: true,
          decoration: InputDecoration(
            labelText: isEng ? "Layer Cage Type" : "খাঁচা/কেজ টাইপ",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
          items: ['Local Cage', 'Imported Battery Cage', 'A-Frame Cage', 'N/A']
              .map((s) => DropdownMenuItem(value: s, child: Text(s, overflow: TextOverflow.ellipsis)))
              .toList(),
          onChanged: (val) => setState(() => _layerCageType = val!),
        ),
        const SizedBox(height: 12),

        // Calculated equipment summary
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFFF8FAFC),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _subInfoRow("Feeding System:", "$_feedingSystem (Qty: $feederQty, Cost: ৳${_formatNumber(feedingCost)})"),
              _subInfoRow("Drinking System:", "$_drinkingSystem (Qty: $drinkerQty, Cost: ৳${_formatNumber(drinkingCost)})"),
              if (slatCost > 0) _subInfoRow("Slat System Cost:", "৳${_formatNumber(slatCost)}"),
            ],
          ),
        ),
      ],
    );
  }

  // --- 2. FIXED CAPITAL SECTION (Image 3) ---
  Widget _buildFixedCapitalSection(bool isEng) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              isEng ? "Enable Manual Edit Mode" : "ম্যানুয়াল এডিট মোড অন করুন",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            Switch(
              value: _enableManualEdit,
              activeTrackColor: const Color(0xFF2E7D32),
              onChanged: (val) => setState(() => _enableManualEdit = val),
            ),
          ],
        ),
        const SizedBox(height: 8),

        _costInputTile("Land Cost (৳):", _landCostCtrl, enabled: _enableManualEdit),
        _costInputTile("Shed Construction (৳):", _shedCostCtrl, enabled: _enableManualEdit),
        _costInputTile("Equipment (৳):", _equipCostCtrl, enabled: _enableManualEdit),
        _costInputTile("Generator / Solar (৳):", _genCostCtrl, enabled: _enableManualEdit),
        _costInputTile("Electrical Setup (৳):", _elecSetupCostCtrl, enabled: _enableManualEdit),
        _costInputTile("Water System (৳):", _waterCostCtrl, enabled: _enableManualEdit),
        _costInputTile("Biosecurity (৳):", _bioCostCtrl, enabled: _enableManualEdit),
        _costInputTile("Office / Store Room (৳):", _officeCostCtrl, enabled: _enableManualEdit),
        _costInputTile("Other Fixed Cost (৳):", _otherFixedCostCtrl, enabled: _enableManualEdit),
        const SizedBox(height: 12),

        // Total Fixed Capital Display
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: const Color(0xFFF0FDF4),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.green.shade300),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isEng ? "Total Fixed Capital:" : "মোট স্থায়ী মূলধন:",
                style: TextStyle(fontSize: 13, color: Colors.green.shade900, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                "৳${_formatNumber(_totalFixedCapital.toInt())}",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.green.shade800),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // --- 3. WORKING CAPITAL SECTION (Image 5) ---
  Widget _buildWorkingCapitalSection(bool isEng) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _subInfoRow("Chick / DOC Cost:", "৳${_formatNumber(_chickCost.toInt())}"),
        _subInfoRow("Feed Cost:", "৳${_formatNumber(_feedCost.toInt())}"),
        _subInfoRow("Vaccine Cost:", "৳${_formatNumber(_vaccineCost.toInt())}"),
        _subInfoRow("Medicine Cost:", "৳${_formatNumber(_medicineCost.toInt())}"),
        _subInfoRow("Labour Cost:", "৳${_formatNumber(_laborCost.toInt())}"),
        _subInfoRow("Electricity / Gas Cost:", "৳${_formatNumber(_electricityCost.toInt())}"),
        _subInfoRow("Litter Cost:", "৳${_formatNumber(_litterCost.toInt())}"),
        _subInfoRow("Transport Cost:", "৳${_formatNumber(_transportCost.toInt())}"),
        _subInfoRow("Misc / Emergency Cost:", "৳${_formatNumber(_miscCost.toInt())}"),
        const SizedBox(height: 14),

        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: const Color(0xFFEFF6FF),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.blue.shade300),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isEng ? "Total Working Capital per Batch:" : "ব্যাচ প্রতি মোট চলতি মূলধন:",
                style: TextStyle(fontSize: 13, color: Colors.blue.shade900, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                "৳${_formatNumber(_totalWorkingCapital.toInt())}",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue.shade800),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),

        SizedBox(
          width: double.infinity,
          height: 44,
          child: ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(isEng ? "Working Capital Saved!" : "চলতি মূলধন সেভ হয়েছে!"),
                  backgroundColor: const Color(0xFF2E7D32),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0284C7),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child: Text(
              isEng ? "SAVE WORKING CAPITAL" : "চলতি মূলধন সেভ করুন",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  // --- 4. MARKET PRICE UPDATE SECTION (Image 1) ---
  Widget _buildMarketPriceSection(bool isEng) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _costInputTile("Chick / DOC Price (৳/bird):", _chickPriceCtrl),
        _costInputTile("Feed Price (৳/kg):", _feedPriceCtrl),
        _costInputTile("Live Broiler Sale Price (৳/kg):", _salePriceCtrl),
        _costInputTile("Egg Sale Price (৳/egg):", _eggPriceCtrl),
        _costInputTile("Culled Bird Sale Price (৳/kg):", _culledPriceCtrl),
        _costInputTile("Medicine & Vaccine per bird (৳):", _medPerBirdCtrl),
        _costInputTile("Labor Cost per bird (৳):", _laborPerBirdCtrl),
        _costInputTile("Litter Cost per bird (৳):", _litterPerBirdCtrl),
        _costInputTile("Electricity/Gas per bird (৳):", _elecPerBirdCtrl),
        _costInputTile("Transport per bird (৳):", _transPerBirdCtrl),
        _costInputTile("Misc Cost per bird (৳):", _miscPerBirdCtrl),
        const SizedBox(height: 14),

        SizedBox(
          width: double.infinity,
          height: 44,
          child: ElevatedButton(
            onPressed: () {
              setState(() {});
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(isEng ? "Market prices updated successfully!" : "বাজার দর সেভ হয়েছে!"),
                  backgroundColor: const Color(0xFF2E7D32),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFEA580C),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child: Text(
              isEng ? "SAVE MARKET PRICE" : "বাজার দর সেভ করুন",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  // --- 5. MORTALITY SIMULATION SECTION ---
  Widget _buildMortalitySimulationSection(bool isEng) {
    final mortalityLoss = _birds * (_mortalityRate / 100.0) * 2.1 * (double.tryParse(_salePriceCtrl.text) ?? 180.0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isEng
              ? "Simulated Mortality Rate: ${_mortalityRate.toStringAsFixed(1)}%"
              : "মরটালিটি হার সিমুলেশন: ${_mortalityRate.toStringAsFixed(1)}%",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        Slider(
          value: _mortalityRate,
          min: 0.0,
          max: 15.0,
          divisions: 30,
          activeColor: Colors.purple.shade700,
          label: "${_mortalityRate.toStringAsFixed(1)}%",
          onChanged: (val) => setState(() => _mortalityRate = val),
        ),
        const SizedBox(height: 8),

        _subInfoRow("Surviving Birds:", "${_formatNumber(_survivingBirds.toInt())} birds"),
        _subInfoRow("Estimated Mortality Loss:", "৳${_formatNumber(mortalityLoss.toInt())}"),
        _subInfoRow("Adjusted Batch Profit:", "৳${_formatNumber(_netProfit.toInt())}"),
      ],
    );
  }

  // --- 6. PROFIT AND ROI FORECAST SECTION ---
  Widget _buildProfitAndRoiSection(bool isEng) {
    final batchesPerYear = widget.project.farmType.contains('Broiler') ? 5.5 : 1.0;
    final annualProfit = _netProfit * batchesPerYear;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _subInfoRow("Expected Revenue per Batch:", "৳${_formatNumber(_expectedRevenue.toInt())}"),
        _subInfoRow("Total Working Capital:", "৳${_formatNumber(_totalWorkingCapital.toInt())}"),
        _subInfoRow("Net Profit per Batch:", "৳${_formatNumber(_netProfit.toInt())}"),
        _subInfoRow("Estimated Net Profit Margin:", "${((_netProfit / (_expectedRevenue == 0 ? 1 : _expectedRevenue)) * 100).toStringAsFixed(1)}%"),
        _subInfoRow("Estimated ROI per Batch:", "${_roiPercent.toStringAsFixed(1)}%"),
        _subInfoRow("Annual Projected Profit:", "৳${_formatNumber(annualProfit.toInt())}"),
      ],
    );
  }

  // --- 7. FINAL EXECUTIVE REPORT SECTION ---
  Widget _buildFinalReportSection(bool isEng) {
    final totalCap = _totalFixedCapital + _totalWorkingCapital;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _subInfoRow("Total Fixed Capital Required:", "৳${_formatNumber(_totalFixedCapital.toInt())}"),
        _subInfoRow("Total Working Capital Required:", "৳${_formatNumber(_totalWorkingCapital.toInt())}"),
        const Divider(),
        _subInfoRow("TOTAL PROJECT INVESTMENT:", "৳${_formatNumber(totalCap.toInt())}", isBold: true),
        const SizedBox(height: 6),
        _subInfoRow("Net Profit per Batch:", "৳${_formatNumber(_netProfit.toInt())}", isBold: true),
      ],
    );
  }

  // --- HELPER BUILDERS ---
  Widget _buildAccordionCard({
    required String title,
    required Color color,
    required IconData icon,
    required Widget child,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      color: Colors.white,
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withAlpha(25),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color, size: 22),
          ),
          title: Text(
            title,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: child,
            ),
          ],
        ),
      ),
    );
  }

  Widget _costInputTile(String label, TextEditingController controller, {bool enabled = true}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
            ),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              height: 38,
              child: TextField(
                controller: controller,
                enabled: enabled,
                keyboardType: TextInputType.number,
                style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          SizedBox(
            width: 130,
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

  Widget _subInfoRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: isBold ? const Color(0xFF0F172A) : Colors.grey.shade700,
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 6,
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: isBold ? const Color(0xFF00695C) : const Color(0xFF0F172A),
              ),
            ),
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

  String _monthName(int month) {
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return months[month - 1];
  }

  void _exportReport(BuildContext context) {
    final isEng = widget.isEnglish;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(isEng ? "Report exported successfully!" : "রিপোর্ট সফলভাবে তৈরি হয়েছে!"),
        backgroundColor: const Color(0xFF00695C),
      ),
    );
  }
}
