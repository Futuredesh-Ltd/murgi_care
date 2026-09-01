import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../model/local_databank_models.dart';
import '../../../controller/local_databank_providers.dart';

class FlockDataManagementScreen extends ConsumerWidget {
  final bool isEnglish;

  const FlockDataManagementScreen({super.key, required this.isEnglish});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEng = isEnglish;
    final state = ref.watch(flockManagementProvider);
    final notifier = ref.read(flockManagementProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(isEng ? "Flock Data Management" : "ফ্লক ডাটা ব্যবস্থাপনা"),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator(color: Colors.teal))
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Flock Selector Card
                  Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                isEng ? "Active Flock" : "সক্রিয় ফ্লক",
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              ElevatedButton.icon(
                                onPressed: () => _showAddFlockDialog(context, ref),
                                icon: const Icon(Icons.add, size: 16),
                                label: Text(isEng ? "New Flock" : "নতুন ফ্লক"),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.teal,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          if (state.flocks.isEmpty)
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Text(
                                isEng
                                    ? "No active flocks found. Tap 'New Flock' to start."
                                    : "কোনো সক্রিয় ফ্লক পাওয়া যায়নি। নতুন ফ্লক যুক্ত করুন।",
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                            )
                          else
                            DropdownButtonFormField<LocalFlock>(
                              initialValue: state.selectedFlock,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              ),
                              items: state.flocks.map((f) {
                                return DropdownMenuItem<LocalFlock>(
                                  value: f,
                                  child: Text("${f.name} (${f.birdType} - ${f.initialBirds} pcs)"),
                                );
                              }).toList(),
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

                  if (state.selectedFlock != null) ...[
                    const SizedBox(height: 16),
                    // Summary Card
                    _buildSummaryCard(state.selectedFlock!, state.records, isEng),
                    const SizedBox(height: 16),

                    // Log Add Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          isEng ? "Daily Log History" : "দৈনিক হিসাবের তালিকা",
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        ElevatedButton.icon(
                          onPressed: () => _showAddRecordDialog(context, ref, state.selectedFlock!),
                          icon: const Icon(Icons.post_add, size: 18),
                          label: Text(isEng ? "Add Record" : "আজকের এন্ট্রি"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal.shade700,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Records List
                    if (state.records.isEmpty)
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(32),
                          child: Text(
                            isEng ? "No daily entries recorded for this flock." : "এই ফ্লকের কোনো দৈনিক হিসাব পাওয়া যায়নি।",
                            style: TextStyle(color: Colors.grey[600]),
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
                            margin: const EdgeInsets.only(bottom: 8),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.teal.shade100,
                                child: Text(
                                  "${r.date.day}",
                                  style: TextStyle(color: Colors.teal.shade900, fontWeight: FontWeight.bold),
                                ),
                              ),
                              title: Text(
                                "${r.date.day}/${r.date.month}/${r.date.year}",
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                isEng
                                    ? "Feed: ${r.feedKg}kg | Mort: ${r.mortality} | Eggs: ${r.eggCount}\nExp: ৳${r.expenseAmount} | Sales: ৳${r.salesAmount}"
                                    : "খাবার: ${r.feedKg}কেজি | মৃত্যু: ${r.mortality}টি | ডিম: ${r.eggCount}টি\nখরচ: ৳${r.expenseAmount} | বিক্রি: ৳${r.salesAmount}",
                                style: const TextStyle(fontSize: 12),
                              ),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete_outline, color: Colors.redAccent, size: 20),
                                onPressed: () {
                                  notifier.deleteRecord(r.id);
                                },
                              ),
                            ),
                          );
                        },
                      ),
                  ],
                ],
              ),
            ),
    );
  }

  Widget _buildSummaryCard(LocalFlock selectedFlock, List<LocalDailyRecord> records, bool isEng) {
    double totalFeed = 0.0;
    int totalMortality = 0;
    int totalEggs = 0;
    double totalExpense = selectedFlock.chickCost * selectedFlock.initialBirds;
    double totalSales = 0.0;

    for (var r in records) {
      totalFeed += r.feedKg;
      totalMortality += r.mortality;
      totalEggs += r.eggCount;
      totalExpense += r.expenseAmount;
      totalSales += r.salesAmount;
    }

    final double mortRate = selectedFlock.initialBirds > 0
        ? (totalMortality / selectedFlock.initialBirds) * 100
        : 0.0;
    final double netProfit = totalSales - totalExpense;

    return Card(
      color: Colors.teal.shade50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isEng ? "Flock Overview & Summary" : "ফ্লকের সার্বিক সারসংক্ষেপ",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.teal),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _summaryItem(isEng ? "Initial Birds" : "প্রাথমিক মুরগি", "${selectedFlock.initialBirds}", Colors.blue),
                _summaryItem(isEng ? "Mortality" : "মৃত্যু", "$totalMortality (${mortRate.toStringAsFixed(1)}%)", Colors.redAccent),
                _summaryItem(isEng ? "Total Feed" : "মোট খাবার", "${totalFeed.toStringAsFixed(0)} kg", Colors.amber.shade900),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                _summaryItem(isEng ? "Total Eggs" : "মোট ডিম", "$totalEggs", Colors.purple),
                _summaryItem(isEng ? "Total Expense" : "মোট ব্যয়", "৳${totalExpense.toStringAsFixed(0)}", Colors.brown),
                _summaryItem(isEng ? "Total Revenue" : "মোট আয়", "৳${totalSales.toStringAsFixed(0)}", Colors.green.shade700),
                _summaryItem(isEng ? "Net Profit" : "নিট লাভ", "৳${netProfit.toStringAsFixed(0)}", netProfit >= 0 ? Colors.teal.shade900 : Colors.red),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _summaryItem(String label, String value, Color color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: color.withValues(alpha: 0.3)),
        ),
        child: Column(
          children: [
            Text(label, style: TextStyle(fontSize: 10, color: Colors.grey[700])),
            const SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: color),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  void _showAddFlockDialog(BuildContext context, WidgetRef ref) {
    final nameCtrl = TextEditingController();
    final birdsCtrl = TextEditingController();
    final costCtrl = TextEditingController();
    String birdType = 'Broiler';
    final isEng = isEnglish;

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(isEng ? "Add New Flock" : "নতুন ফ্লক যোগ করুন"),
        content: StatefulBuilder(
          builder: (context, setDlgState) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameCtrl,
                decoration: InputDecoration(labelText: isEng ? "Flock Name / Tag" : "ফ্লকের নাম বা ট্যাগ"),
              ),
              DropdownButtonFormField<String>(
                initialValue: birdType,
                decoration: InputDecoration(labelText: isEng ? "Poultry Type" : "মুরগির টাইপ"),
                items: ['Broiler', 'Layer', 'Sonali', 'Breeder', 'Duck', 'Other']
                    .map((t) => DropdownMenuItem(value: t, child: Text(t)))
                    .toList(),
                onChanged: (val) => setDlgState(() => birdType = val!),
              ),
              TextField(
                controller: birdsCtrl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: isEng ? "Initial Bird Count" : "মুরগির সংখ্যা"),
              ),
              TextField(
                controller: costCtrl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: isEng ? "Chick Unit Price (৳)" : "প্রতি বাচ্চার দাম (৳)"),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text(isEng ? "Cancel" : "বাতিল")),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
            onPressed: () {
              if (nameCtrl.text.isNotEmpty) {
                final newFlock = LocalFlock(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  name: nameCtrl.text,
                  birdType: birdType,
                  initialBirds: int.tryParse(birdsCtrl.text) ?? 0,
                  chickCost: double.tryParse(costCtrl.text) ?? 0.0,
                  startDate: DateTime.now(),
                );
                ref.read(flockManagementProvider.notifier).addFlock(newFlock);
                if (ctx.mounted) Navigator.pop(ctx);
              }
            },
            child: Text(isEng ? "Save" : "সংরক্ষণ"),
          ),
        ],
      ),
    );
  }

  void _showAddRecordDialog(BuildContext context, WidgetRef ref, LocalFlock selectedFlock) {
    final feedCtrl = TextEditingController();
    final mortCtrl = TextEditingController();
    final eggCtrl = TextEditingController();
    final expCtrl = TextEditingController();
    final salesCtrl = TextEditingController();
    final isEng = isEnglish;

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(isEng ? "Add Daily Record" : "দৈনিক এন্ট্রি যোগ করুন"),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: feedCtrl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: isEng ? "Feed Consumed (kg)" : "খাবার (কেজি)"),
              ),
              TextField(
                controller: mortCtrl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: isEng ? "Mortality Count" : "মৃত্যু (সংখ্যা)"),
              ),
              TextField(
                controller: eggCtrl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: isEng ? "Egg Count (if Layer)" : "ডিমের সংখ্যা (লেয়ার হলে)"),
              ),
              TextField(
                controller: expCtrl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: isEng ? "Expenses (৳)" : "আজকের অন্যান্য খরচ (৳)"),
              ),
              TextField(
                controller: salesCtrl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: isEng ? "Sales Revenue (৳)" : "আজকের বিক্রি (৳)"),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text(isEng ? "Cancel" : "বাতিল")),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
            onPressed: () {
              final record = LocalDailyRecord(
                id: DateTime.now().millisecondsSinceEpoch.toString(),
                flockId: selectedFlock.id,
                date: DateTime.now(),
                feedKg: double.tryParse(feedCtrl.text) ?? 0.0,
                mortality: int.tryParse(mortCtrl.text) ?? 0,
                eggCount: int.tryParse(eggCtrl.text) ?? 0,
                expenseAmount: double.tryParse(expCtrl.text) ?? 0.0,
                salesAmount: double.tryParse(salesCtrl.text) ?? 0.0,
              );
              ref.read(flockManagementProvider.notifier).addRecord(record);
              if (ctx.mounted) Navigator.pop(ctx);
            },
            child: Text(isEng ? "Save" : "সংরক্ষণ"),
          ),
        ],
      ),
    );
  }
}
