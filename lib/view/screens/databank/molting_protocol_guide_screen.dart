import 'package:flutter/material.dart';

class MoltingProtocolGuideScreen extends StatelessWidget {
  final bool isEnglish;

  const MoltingProtocolGuideScreen({super.key, required this.isEnglish});

  @override
  Widget build(BuildContext context) {
    final isEng = isEnglish;

    return Scaffold(
      backgroundColor: const Color(0xFFF4F7F6),
      appBar: AppBar(
        title: Text(isEng ? "Molting Protocol Guide" : "মোল্টিং প্রটোকল গাইড"),
        backgroundColor: const Color(0xFF00695C),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Header Title & Subtitle
            Center(
              child: Column(
                children: [
                  Text(
                    isEng ? "Molting Protocol Guide" : "মোল্টিং প্রটোকল গাইড",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    isEng
                        ? "Follow the selected molting protocol carefully and monitor flock response."
                        : "মনোনীত মোল্টিং প্রটোকল মেনে চলুন এবং ফ্লকের স্বাস্থ্য পর্যবেক্ষণ করুন।",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Card 1: Protocol Details Overview
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 2,
              color: const Color(0xFFE8F5E9),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isEng ? "Protocol Details" : "প্রটোকল বিস্তারিত",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1B5E20),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "PRACTICAL MOLTING PROTOCOL GUIDE",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Default Strategy: MODERATE CONTROLLED MOLTING",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: Color(0xFF2E7D32),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      isEng
                          ? "This is the safest and most practical system for both Layer and Breeder flocks."
                          : "এটি Layer ও Breeder উভয়ের জন্য সবচেয়ে safe ও practical system.",
                      style: const TextStyle(fontSize: 13, color: Color(0xFF334155)),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 14),

            // Card 2: 1. MOLTING START করার আগে ENSURE করুন
            _buildSectionCard(
              title: isEng
                  ? "1. ENSURE BEFORE STARTING MOLTING"
                  : "১. MOLTING START করার আগে ENSURE করুন",
              children: [
                _checkItem("Flock healthy আছে"),
                _checkItem("Mortality normal আছে"),
                _checkItem("Water line ঠিক আছে"),
                _checkItem("Ventilation ঠিক আছে"),
                _checkItem("Lighting control করা যাবে"),
                _checkItem("Body weight acceptable"),
                _checkItem("Uniformity ভালো"),
                _checkItem("Vaccine schedule review করা হয়েছে"),
                _checkItem("Deworming status review করা হয়েছে"),
                _checkItem("External parasite check করা হয়েছে"),
                _checkItem("Vitamin-electrolyte/mineral support ready আছে"),
                _checkItem("Heat stress control করা যাবে"),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.amber.shade50,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.amber.shade200),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.warning_amber_rounded, color: Colors.amber.shade900, size: 20),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          isEng
                              ? "Antibiotic Note: Routine antibiotic not recommended. Do not use antibiotics without vet advice unless disease signs are present."
                              : "Antibiotic Note: Routine antibiotic recommended না। Disease sign থাকলে vet advice ছাড়া antibiotic use করবেন না।",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.amber.shade900,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),

            // Card 3: 2. যে flock এ molting করবেন না
            _buildSectionCard(
              title: isEng
                  ? "2. FLOCKS NOT SUITABLE FOR MOLTING"
                  : "২. যে flock এ molting করবেন না",
              children: [
                _crossItem("Sick flock"),
                _crossItem("Disease recovery weak flock"),
                _crossItem("High mortality flock"),
                _crossItem("Very poor body condition"),
                _crossItem("Severe heat stress condition"),
                _crossItem("Breeder male খুব weak হলে"),
              ],
            ),
            const SizedBox(height: 14),

            // Card 4: 3. DAY 1–3: TRANSITION PHASE
            _buildSectionCard(
              title: "3. DAY 1–3: TRANSITION PHASE",
              children: [
                _subHeading("Feed:"),
                _checkItem("Normal feed এর 50–60% দিন"),
                const SizedBox(height: 6),
                _subHeading("Light:"),
                _checkItem("8 hours"),
                const SizedBox(height: 6),
                _subHeading("Water:"),
                _checkItem("Always normal"),
                const SizedBox(height: 8),
                _subHeading("Expected Changes:"),
                _checkItem("Production কমতে শুরু করবে"),
                _checkItem("Bird একটু quiet হতে পারে"),
                _checkItem("Feed intake naturally কমবে"),
                const SizedBox(height: 8),
                _subHeading("Danger Signs:", color: Colors.red.shade700),
                _crossItem("Severe weakness"),
                _crossItem("Water intake কমে যাওয়া"),
                _crossItem("Heat stress"),
                _crossItem("Mortality বেড়ে যাওয়া"),
              ],
            ),
            const SizedBox(height: 14),

            // Card 5: AGGRESSIVE MOLTING OPTION
            _buildSectionCard(
              title: "AGGRESSIVE MOLTING OPTION",
              badge: isEng ? "Layer Only" : "শুধুমাত্র লেয়ার",
              badgeColor: Colors.deepOrange,
              children: [
                Text(
                  isEng
                      ? "Only for strong, healthy layer flocks."
                      : "Only strong healthy layer flock এর জন্য।",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange.shade800,
                  ),
                ),
                const SizedBox(height: 10),
                _subHeading("Day 1–3:"),
                _crossItem("Feed stop / near-zero feed"),
                _checkItem("Water normal"),
                _checkItem("Light 8 hours"),
                const SizedBox(height: 8),
                _subHeading("Day 4 onward:"),
                _checkItem("Body weight দেখে restricted feeding"),
                _checkItem("Target weight loss 20–25%"),
                _checkItem("Production 0–5%"),
                const SizedBox(height: 8),
                _subHeading("Not recommended for:", color: Colors.red.shade700),
                _crossItem("Breeder flock"),
                _crossItem("Weak flock"),
                _crossItem("Disease recovery flock"),
                _crossItem("Heat stress condition"),
              ],
            ),
            const SizedBox(height: 14),

            // Card 6: 4. DAY 4–10: RESTRICTION PHASE
            _buildSectionCard(
              title: "4. DAY 4–10: RESTRICTION PHASE",
              children: [
                _subHeading("Feed:"),
                _checkItem("Normal feed এর 30–40% দিন"),
                _checkItem("অথবা low nutrient molt diet"),
                const SizedBox(height: 6),
                _subHeading("Light:"),
                _checkItem("8 hours continue"),
                const SizedBox(height: 8),
                _subHeading("Target:"),
                _checkItem("Body weight loss 20–25%"),
                _checkItem("Production 0–5%"),
                const SizedBox(height: 8),
                _subHeading("Daily Monitor:"),
                _checkItem("Body weight"),
                _checkItem("Production"),
                _checkItem("Mortality"),
                _checkItem("Water intake"),
                _checkItem("Droppings"),
                _checkItem("Activity"),
              ],
            ),
            const SizedBox(height: 14),

            // Card 7: 5. DAY 11–14: TARGET CHECK PHASE
            _buildSectionCard(
              title: "5. DAY 11–14: TARGET CHECK PHASE",
              children: [
                _subHeading("If target achieved:"),
                _checkItem("Weight loss 20–25%"),
                _checkItem("Production 0–5%"),
                _checkItem("Mortality normal"),
                _arrowItem("Recovery feeding শুরু করুন"),
                const SizedBox(height: 8),
                _subHeading("If target not achieved:"),
                _arrowItem("Restriction continue করুন, কিন্তু danger sign দেখলে stop করুন"),
                const SizedBox(height: 8),
                _subHeading("Danger:", color: Colors.red.shade700),
                _crossItem("Weight loss >25%"),
                _crossItem("Mortality high"),
                _crossItem("Severe weakness"),
                _arrowItem("Immediate recovery feeding + health check", color: Colors.red.shade800),
              ],
            ),
            const SizedBox(height: 14),

            // Card 8: 6. DAY 15–28: RECOVERY FEEDING PHASE
            _buildSectionCard(
              title: "6. DAY 15–28: RECOVERY FEEDING PHASE",
              children: [
                _subHeading("Feed:"),
                _checkItem("ধীরে ধীরে normal feed এ ফিরুন"),
                const SizedBox(height: 6),
                _subHeading("Light:"),
                _checkItem("ধীরে ধীরে বাড়ান"),
                const SizedBox(height: 8),
                _subHeading("Monitor:"),
                _checkItem("Body weight recovery"),
                _checkItem("Feather condition"),
                _checkItem("Production return"),
                _checkItem("Mortality"),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  // --- HELPER BUILDERS ---
  Widget _buildSectionCard({
    required String title,
    required List<Widget> children,
    String? badge,
    Color? badgeColor,
  }) {
    return Card(
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
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                ),
                if (badge != null)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: (badgeColor ?? Colors.teal).withAlpha(25),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: badgeColor ?? Colors.teal),
                    ),
                    child: Text(
                      badge,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: badgeColor ?? Colors.teal,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 6),
            const Divider(),
            const SizedBox(height: 6),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _subHeading(String text, {Color? color}) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 2),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: color ?? const Color(0xFF334155),
        ),
      ),
    );
  }

  Widget _checkItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_rounded, color: Colors.green, size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 13, color: Color(0xFF334155)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _crossItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.close_rounded, color: Colors.red, size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 13, color: Color(0xFF334155)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _arrowItem(String text, {Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.arrow_right_alt_rounded, color: color ?? const Color(0xFF0F172A), size: 20),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: color ?? const Color(0xFF0F172A),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
