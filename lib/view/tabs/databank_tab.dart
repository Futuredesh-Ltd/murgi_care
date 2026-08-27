import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../services/databank_service.dart';
import '../../model/databank_model.dart';
import '../../controller/riverpod_providers.dart';

class DataBankTab extends ConsumerWidget {
  final bool isEnglish;

  const DataBankTab({super.key, required this.isEnglish});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEng = isEnglish;
    final user = FirebaseAuth.instance.currentUser;
    final dataBankService = DataBankService();
    final selectedFarm = ref.watch(databankFarmProvider);
    final selectedBatch = ref.watch(databankBatchProvider);

    if (user == null) {
      return Container(
        padding: const EdgeInsets.all(32),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.lock_outline_rounded, size: 64, color: Colors.teal),
            const SizedBox(height: 16),
            Text(
              isEng ? "Personal Farm DataBank" : "ব্যক্তিগত খামার ডেটাব্যাংক",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              isEng
                  ? "Please log in to manage your farm records, daily feed, mortality & sales."
                  : "আপনার খামারের দৈনিক রেকর্ড, খাবার, মৃত্যু ও বিক্রয় সংরক্ষণ করতে লগইন করুন।",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Card
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.teal.shade700, Colors.teal.shade500],
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                const Icon(Icons.folder_shared_rounded, color: Colors.white, size: 40),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        isEng ? "My Farm DataBank" : "আমার ডিজিটাল খামার খাতা",
                        style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        isEng ? "Private & Isolated for ${user.email}" : "আপনার সংরক্ষিত তথ্য সম্পূর্ণ নিরাপদ ও গোপনীয়",
                        style: const TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Step 1: Select or Create Farm
          _buildFarmSelector(context, ref, dataBankService, selectedFarm, isEng),

          if (selectedFarm != null) ...[
            const SizedBox(height: 16),
            // Step 2: Select or Create Batch
            _buildBatchSelector(context, ref, dataBankService, selectedFarm, selectedBatch, isEng),
          ],

          if (selectedFarm != null && selectedBatch != null) ...[
            const SizedBox(height: 20),
            // Step 3: Analytics & Daily Records
            _buildBatchAnalytics(context, dataBankService, selectedBatch, isEng),
            const SizedBox(height: 16),
            _buildDailyRecordsSection(context, dataBankService, selectedBatch, isEng),
          ],
        ],
      ),
    );
  }

  // --- FARM SELECTOR ---
  Widget _buildFarmSelector(
    BuildContext context,
    WidgetRef ref,
    DataBankService dataBankService,
    Farm? selectedFarm,
    bool isEng,
  ) {
    return StreamBuilder<List<Farm>>(
      stream: dataBankService.getFarmsStream(),
      builder: (context, snapshot) {
        final farms = snapshot.data ?? [];
        final Farm? selectedFarmValue = farms.any((f) => f.id == selectedFarm?.id)
            ? farms.firstWhere((f) => f.id == selectedFarm?.id)
            : null;

        return Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      isEng ? "Select Farm" : "খামার নির্বাচন করুন",
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add_circle, color: Colors.teal),
                      onPressed: () => _showAddFarmDialog(context, dataBankService, isEng),
                      tooltip: isEng ? "Add New Farm" : "নতুন খামার যোগ করুন",
                    ),
                  ],
                ),
                if (farms.isEmpty)
                  Text(isEng ? "No farms created yet. Tap '+' to create." : "এখনও কোনো খামার যোগ করেননি। '+' চাপুন।")
                else
                  DropdownButtonFormField<Farm>(
                    value: selectedFarmValue,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    ),
                    hint: Text(isEng ? "Choose a Farm" : "খামার সিলেক্ট করুন"),
                    items: farms.map((f) {
                      return DropdownMenuItem<Farm>(
                        value: f,
                        child: Text("${f.name} (${f.farmType})"),
                      );
                    }).toList(),
                    onChanged: (val) {
                      ref.read(databankFarmProvider.notifier).state = val;
                      ref.read(databankBatchProvider.notifier).state = null;
                    },
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  // --- BATCH SELECTOR ---
  Widget _buildBatchSelector(
    BuildContext context,
    WidgetRef ref,
    DataBankService dataBankService,
    Farm selectedFarm,
    Batch? selectedBatch,
    bool isEng,
  ) {
    return StreamBuilder<List<Batch>>(
      stream: dataBankService.getBatchesStream(selectedFarm.id),
      builder: (context, snapshot) {
        final batches = snapshot.data ?? [];
        final Batch? selectedBatchValue = batches.any((b) => b.id == selectedBatch?.id)
            ? batches.firstWhere((b) => b.id == selectedBatch?.id)
            : null;

        return Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      isEng ? "Select Batch" : "ব্যাচ নির্বাচন করুন",
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add_circle, color: Colors.teal),
                      onPressed: () => _showAddBatchDialog(context, dataBankService, selectedFarm, isEng),
                      tooltip: isEng ? "Add New Batch" : "নতুন ব্যাচ চালু করুন",
                    ),
                  ],
                ),
                if (batches.isEmpty)
                  Text(isEng ? "No active batches in this farm." : "এই খামারে কোনো সক্রিয় ব্যাচ নেই।")
                else
                  DropdownButtonFormField<Batch>(
                    value: selectedBatchValue,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    ),
                    hint: Text(isEng ? "Choose a Batch" : "ব্যাচ সিলেক্ট করুন"),
                    items: batches.map((b) {
                      return DropdownMenuItem<Batch>(
                        value: b,
                        child: Text("${b.batchName} (${b.initialBirds} psc)"),
                      );
                    }).toList(),
                    onChanged: (val) {
                      ref.read(databankBatchProvider.notifier).state = val;
                    },
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  // --- ANALYTICS ---
  Widget _buildBatchAnalytics(
    BuildContext context,
    DataBankService dataBankService,
    Batch selectedBatch,
    bool isEng,
  ) {
    return StreamBuilder<List<DailyRecord>>(
      stream: dataBankService.getDailyRecordsStream(selectedBatch.id, selectedBatch.id),
      builder: (context, snapshot) {
        final records = snapshot.data ?? [];

        double totalFeed = 0.0;
        int totalMortality = 0;
        double totalExpense = selectedBatch.chickCost * selectedBatch.initialBirds;
        double totalSales = 0.0;

        for (var r in records) {
          totalFeed += r.feedKg;
          totalMortality += r.mortality;
          totalExpense += r.expenseAmount;
          totalSales += r.salesAmount;
        }

        final double mortalityRate = selectedBatch.initialBirds > 0
            ? (totalMortality / selectedBatch.initialBirds) * 100
            : 0.0;
        final double netProfit = totalSales - totalExpense;

        return Card(
          color: Colors.teal.shade50,
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isEng ? "Batch Overview & Summary" : "ব্যাচের সারসংক্ষেপ ও পারফরম্যান্স",
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.teal),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    _statBox(isEng ? "Birds" : "মোট মুরগি", "${selectedBatch.initialBirds}", Colors.blue),
                    _statBox(isEng ? "Mortality" : "মৃত্যু", "$totalMortality (${mortalityRate.toStringAsFixed(1)}%)", Colors.redAccent),
                    _statBox(isEng ? "Total Feed" : "মোট খাদ্য", "${totalFeed.toStringAsFixed(0)} kg", Colors.amber.shade900),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    _statBox(isEng ? "Total Expense" : "মোট খরচ", "৳${totalExpense.toStringAsFixed(0)}", Colors.brown),
                    _statBox(isEng ? "Total Revenue" : "মোট বিক্রয়", "৳${totalSales.toStringAsFixed(0)}", Colors.green),
                    _statBox(isEng ? "Net Profit" : "নিট লাভ", "৳${netProfit.toStringAsFixed(0)}", netProfit >= 0 ? Colors.teal.shade900 : Colors.red),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _statBox(String label, String value, Color color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Column(
          children: [
            Text(label, style: TextStyle(fontSize: 11, color: Colors.grey[700])),
            const SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: color),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  // --- DAILY RECORDS SECTION ---
  Widget _buildDailyRecordsSection(
    BuildContext context,
    DataBankService dataBankService,
    Batch selectedBatch,
    bool isEng,
  ) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              isEng ? "Daily Farm Log" : "দৈনিক হিসাবের খাতা",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            ElevatedButton.icon(
              onPressed: () => _showAddRecordDialog(context, dataBankService, selectedBatch, isEng),
              icon: const Icon(Icons.add, size: 18),
              label: Text(isEng ? "Add Record" : "আজকের হিসাব যোগ"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        StreamBuilder<List<DailyRecord>>(
          stream: dataBankService.getDailyRecordsStream(selectedBatch.id, selectedBatch.id),
          builder: (context, snapshot) {
            final records = snapshot.data ?? [];
            if (records.isEmpty) {
              return Text(isEng ? "No daily records added yet." : "এখনও কোনো হিসাব লিপিবদ্ধ করা হয়নি।");
            }

            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: records.length,
              itemBuilder: (context, index) {
                final r = records[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    title: Text(
                      "${r.date.day}/${r.date.month}/${r.date.year}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "খাবার: ${r.feedKg}kg | মৃত্যু: ${r.mortality}টি | খরচ: ৳${r.expenseAmount} | বিক্রয়: ৳${r.salesAmount}",
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }

  void _showAddFarmDialog(BuildContext context, DataBankService dataBankService, bool isEng) {
    final nameCtrl = TextEditingController();
    final locCtrl = TextEditingController();
    String type = 'Broiler';

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(isEng ? "Create Farm" : "নতুন খামার যোগ করুন"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: "খামারের নাম")),
            TextField(controller: locCtrl, decoration: const InputDecoration(labelText: "অবস্থান / ঠিকানা")),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("বাতিল")),
          ElevatedButton(
            onPressed: () async {
              if (nameCtrl.text.isNotEmpty) {
                await dataBankService.addFarm(Farm(id: '', name: nameCtrl.text, location: locCtrl.text, farmType: type));
                if (ctx.mounted) Navigator.pop(ctx);
              }
            },
            child: const Text("সংরক্ষণ করুন"),
          ),
        ],
      ),
    );
  }

  void _showAddBatchDialog(BuildContext context, DataBankService dataBankService, Farm selectedFarm, bool isEng) {
    final nameCtrl = TextEditingController();
    final birdsCtrl = TextEditingController();
    final chickCostCtrl = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(isEng ? "New Batch" : "নতুন ব্যাচ চালু করুন"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: "ব্যাচের নাম (যেমন: ব্যাচ-০১)")),
            TextField(controller: birdsCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: "মুরগির সংখ্যা")),
            TextField(controller: chickCostCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: "প্রতি বাচ্চার কেনামূল্য")),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("বাতিল")),
          ElevatedButton(
            onPressed: () async {
              if (nameCtrl.text.isNotEmpty) {
                await dataBankService.addBatch(
                  selectedFarm.id,
                  Batch(
                    id: '',
                    batchName: nameCtrl.text,
                    birdType: 'Broiler',
                    initialBirds: int.tryParse(birdsCtrl.text) ?? 0,
                    chickCost: double.tryParse(chickCostCtrl.text) ?? 0.0,
                    startDate: DateTime.now(),
                  ),
                );
                if (ctx.mounted) Navigator.pop(ctx);
              }
            },
            child: const Text("সংরক্ষণ"),
          ),
        ],
      ),
    );
  }

  void _showAddRecordDialog(BuildContext context, DataBankService dataBankService, Batch selectedBatch, bool isEng) {
    final feedCtrl = TextEditingController();
    final mortCtrl = TextEditingController();
    final expCtrl = TextEditingController();
    final salesCtrl = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(isEng ? "Daily Log" : "আজকের দৈনিক হিসাব"),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: feedCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: "খাদ্য প্রদান (কেজি)")),
              TextField(controller: mortCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: "মৃত্যু (সংখ্যা)")),
              TextField(controller: expCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: "আজকের খরচ (৳)")),
              TextField(controller: salesCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: "আজকের বিক্রি (৳)")),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("বাতিল")),
          ElevatedButton(
            onPressed: () async {
              await dataBankService.addDailyRecord(
                selectedBatch.id,
                selectedBatch.id,
                DailyRecord(
                  id: '',
                  date: DateTime.now(),
                  feedKg: double.tryParse(feedCtrl.text) ?? 0.0,
                  mortality: int.tryParse(mortCtrl.text) ?? 0,
                  expenseAmount: double.tryParse(expCtrl.text) ?? 0.0,
                  salesAmount: double.tryParse(salesCtrl.text) ?? 0.0,
                ),
              );
              if (ctx.mounted) Navigator.pop(ctx);
            },
            child: const Text("সংরক্ষণ"),
          ),
        ],
      ),
    );
  }
}
