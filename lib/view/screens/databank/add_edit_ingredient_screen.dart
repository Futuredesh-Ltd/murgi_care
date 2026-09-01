import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../model/feed_standard_model.dart';
import '../../../controller/local_databank_providers.dart';

class AddEditIngredientScreen extends ConsumerStatefulWidget {
  final bool isEnglish;
  final FeedIngredient? existingIngredient;

  const AddEditIngredientScreen({
    super.key,
    required this.isEnglish,
    this.existingIngredient,
  });

  @override
  ConsumerState<AddEditIngredientScreen> createState() => _AddEditIngredientScreenState();
}

class _AddEditIngredientScreenState extends ConsumerState<AddEditIngredientScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameCtrl;
  late TextEditingController _cpCtrl;
  late TextEditingController _meCtrl;
  late TextEditingController _caCtrl;
  late TextEditingController _avpCtrl;
  late TextEditingController _lysCtrl;
  late TextEditingController _metCtrl;
  late TextEditingController _fiberCtrl;
  late TextEditingController _fatCtrl;
  late TextEditingController _priceCtrl;

  @override
  void initState() {
    super.initState();
    final ing = widget.existingIngredient;
    _nameCtrl = TextEditingController(text: ing?.name ?? '');
    _cpCtrl = TextEditingController(text: ing != null ? '${ing.cp}' : '');
    _meCtrl = TextEditingController(text: ing != null ? '${ing.me}' : '');
    _caCtrl = TextEditingController(text: ing != null ? '${ing.ca}' : '');
    _avpCtrl = TextEditingController(text: ing != null ? '${ing.avP}' : '');
    _lysCtrl = TextEditingController(text: ing != null ? '${ing.lys}' : '');
    _metCtrl = TextEditingController(text: ing != null ? '${ing.met}' : '');
    _fiberCtrl = TextEditingController(text: ing != null ? '${ing.fiber}' : '');
    _fatCtrl = TextEditingController(text: ing != null ? '${ing.fat}' : '');
    _priceCtrl = TextEditingController(text: ing != null ? '${ing.pricePerKg}' : '');
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _cpCtrl.dispose();
    _meCtrl.dispose();
    _caCtrl.dispose();
    _avpCtrl.dispose();
    _lysCtrl.dispose();
    _metCtrl.dispose();
    _fiberCtrl.dispose();
    _fatCtrl.dispose();
    _priceCtrl.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (_nameCtrl.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(widget.isEnglish ? "Please enter ingredient name" : "উপাদানের নাম দিন")),
      );
      return;
    }

    final newIng = FeedIngredient(
      id: widget.existingIngredient?.id ?? _nameCtrl.text.trim(),
      name: _nameCtrl.text.trim(),
      cp: double.tryParse(_cpCtrl.text.trim()) ?? 0.0,
      me: double.tryParse(_meCtrl.text.trim()) ?? 0.0,
      ca: double.tryParse(_caCtrl.text.trim()) ?? 0.0,
      avP: double.tryParse(_avpCtrl.text.trim()) ?? 0.0,
      lys: double.tryParse(_lysCtrl.text.trim()) ?? 0.0,
      met: double.tryParse(_metCtrl.text.trim()) ?? 0.0,
      fiber: double.tryParse(_fiberCtrl.text.trim()) ?? 0.0,
      fat: double.tryParse(_fatCtrl.text.trim()) ?? 0.0,
      pricePerKg: double.tryParse(_priceCtrl.text.trim()) ?? 0.0,
      isCustom: true,
    );

    await ref.read(feedFormulationProvider.notifier).saveCustomIngredient(newIng);

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(widget.isEnglish ? "Ingredient saved successfully!" : "উপাদান সফলভাবে সেভ হয়েছে!"),
        backgroundColor: Colors.green.shade700,
      ),
    );

    Navigator.pop(context, newIng);
  }

  @override
  Widget build(BuildContext context) {
    final isEng = widget.isEnglish;

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: Text(
          isEng ? "Add / Edit Ingredient" : "উপাদান যোগ / এডিট করুন",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF0F172A)),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.5,
        foregroundColor: const Color(0xFF0F172A),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 8),

              // 1. Ingredient Name (Full width)
              _buildInputCard(
                hintText: isEng ? "Ingredient Name" : "উপাদানের নাম",
                controller: _nameCtrl,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 12),

              // 2. CP % & ME kcal/kg (Row 1)
              Row(
                children: [
                  Expanded(
                    child: _buildInputCard(
                      hintText: "CP %",
                      controller: _cpCtrl,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildInputCard(
                      hintText: "ME kcal/kg",
                      controller: _meCtrl,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // 3. Calcium % & Av. Phosphorus % (Row 2)
              Row(
                children: [
                  Expanded(
                    child: _buildInputCard(
                      hintText: "Calcium %",
                      controller: _caCtrl,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildInputCard(
                      hintText: "Av. Phosphorus %",
                      controller: _avpCtrl,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // 4. Lysine % & Methionine % (Row 3)
              Row(
                children: [
                  Expanded(
                    child: _buildInputCard(
                      hintText: "Lysine %",
                      controller: _lysCtrl,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildInputCard(
                      hintText: "Methionine %",
                      controller: _metCtrl,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // 5. Fiber % & Fat % (Row 4)
              Row(
                children: [
                  Expanded(
                    child: _buildInputCard(
                      hintText: "Fiber %",
                      controller: _fiberCtrl,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildInputCard(
                      hintText: "Fat %",
                      controller: _fatCtrl,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // 6. Price Tk/kg (Full width)
              _buildInputCard(
                hintText: "Price Tk/kg",
                controller: _priceCtrl,
              ),
              const SizedBox(height: 24),

              // Save Button (Full width green)
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: _save,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2E7D32),
                    foregroundColor: Colors.white,
                    elevation: 2,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text(
                    isEng ? "Save Ingredient" : "উপাদান সেভ করুন",
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputCard({
    required String hintText,
    required TextEditingController controller,
    TextInputType keyboardType = const TextInputType.numberWithOptions(decimal: true),
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        style: const TextStyle(fontSize: 15, color: Color(0xFF334155)),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: Color(0xFF2E7D32), width: 1.5),
          ),
        ),
      ),
    );
  }
}
