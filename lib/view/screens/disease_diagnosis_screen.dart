import 'package:flutter/material.dart';

class DiagnosisArticleSection {
  final String titleBn;
  final String titleEn;
  final List<String> pointsBn;
  final List<String> pointsEn;

  DiagnosisArticleSection({
    required this.titleBn,
    required this.titleEn,
    required this.pointsBn,
    required this.pointsEn,
  });
}

class DiseaseDiagnosisItem {
  final String id;
  final String titleBn;
  final String titleEn;
  final String descBn;
  final String descEn;
  final String imagePath;
  final String introBn;
  final String introEn;
  final String sectionHeaderBn;
  final String sectionHeaderEn;
  final List<DiagnosisArticleSection> sections;
  final String summaryTitleBn;
  final String summaryTitleEn;
  final String summaryQuoteBn;
  final String summaryQuoteEn;
  final String summarySubBn;
  final String summarySubEn;

  DiseaseDiagnosisItem({
    required this.id,
    required this.titleBn,
    required this.titleEn,
    required this.descBn,
    required this.descEn,
    required this.imagePath,
    required this.introBn,
    required this.introEn,
    required this.sectionHeaderBn,
    required this.sectionHeaderEn,
    required this.sections,
    required this.summaryTitleBn,
    required this.summaryTitleEn,
    required this.summaryQuoteBn,
    required this.summaryQuoteEn,
    required this.summarySubBn,
    required this.summarySubEn,
  });
}

class DiseaseDiagnosisScreen extends StatelessWidget {
  final bool isEnglish;

  const DiseaseDiagnosisScreen({super.key, required this.isEnglish});

  static final List<DiseaseDiagnosisItem> _items = [
    // -------------------------------------------------------------
    // Item 1: Commercial Broiler (বাণিজ্যিক ব্রয়লার)
    // -------------------------------------------------------------
    DiseaseDiagnosisItem(
      id: "comm_broiler",
      titleBn: "বাণিজ্যিক ব্রয়লার",
      titleEn: "Commercial Broiler",
      descBn:
          "COMMERCIAL BROILER:\n🐔 কমার্শিয়াল ব্রয়লার মুরগির রোগ নির্ণয়ের কৌশল (Diagnostic Techniques for Commercial Broiler Diseases)...",
      descEn:
          "COMMERCIAL BROILER:\n🐔 Complete diagnostic techniques for Commercial Broiler diseases including clinical signs, necropsy, lab tests & farm history...",
      imagePath: "assets/comm_broiler.jpg",
      introBn:
          "COMMERCIAL BROILER:\n\n🐔 কমার্শিয়াল ব্রয়লার মুরগির রোগ নির্ণয়ের কৌশল (Diagnostic Techniques for Commercial Broiler Diseases)। ব্রয়লার মুরগির উৎপাদন লাভজনক রাখতে হলে দ্রুত ও সঠিক রোগ নির্ণয় করতে পারাটাই মূল।",
      introEn:
          "COMMERCIAL BROILER:\n\n🐔 Diagnostic Techniques for Commercial Broiler Diseases:\nRapid and precise disease diagnosis is the single most vital factor for maintaining profitable commercial broiler farming.",
      sectionHeaderBn: "🔰 ব্রয়লারের রোগ নির্ণয়ের ৭টি প্রধান ধাপ:",
      sectionHeaderEn: "🔰 7 Key Diagnostic Steps for Broilers:",
      sections: [
        DiagnosisArticleSection(
          titleBn: "✅ ১. প্রাথমিক পর্যবেক্ষণ (Clinical Observation)ঃ",
          titleEn: "1. Clinical Observation:",
          pointsBn: [
            "মুরগির স্বাভাবিক আচরণ থেকে বিচ্যুতি যেসকল রোগের ইঙ্গিত দিতে পারেঃ",
            "•লক্ষণঃ খাওয়া কমে যাওয়া → সম্ভাব্য রোগঃ কক্সিডিওসিস, নিউক্যাসল, ইনফেকশাস ব্রনকাইটিস",
            "•লক্ষণঃ ঝিম ধরা, পালক ফুলিয়ে বসে থাকা → সম্ভাব্য রোগঃ ইনফেকশাস বোর্দেটেলোসিস, cholera",
            "•লক্ষণঃ চোখ-নাক দিয়ে পানি পড়া → সম্ভাব্য রোগঃ ক্রোনিক রেসপাইরেটরি ডিজিজ (CRD), IB",
            "•লক্ষণঃ হেঁচকি/গলা দিয়ে শব্দ → সম্ভাব্য রোগঃ নিউক্যাসেল, ILT",
            "•লক্ষণঃ পায়খানায় রক্ত → সম্ভাব্য রোগঃ কক্সিডিওসিস",
            "•লক্ষণঃ গা গরম, জ্বর → সম্ভাব্য রোগঃ ব্যাকটেরিয়াল ইনফেকশন",
          ],
          pointsEn: [
            "Deviations from normal behavior indicating specific diseases:",
            "•Symptom: Reduced feed intake → Suspected: Coccidiosis, Newcastle, IB",
            "•Symptom: Lethargy, ruffled feathers → Suspected: Bordetellosis, Fowl Cholera",
            "•Symptom: Watery eyes & nasal discharge → Suspected: CRD, IB",
            "•Symptom: Gasping/gurgling sound → Suspected: Newcastle, ILT",
            "•Symptom: Bloody droppings → Suspected: Coccidiosis",
            "•Symptom: Fever / body heat → Suspected: Bacterial Infection",
          ],
        ),
        DiagnosisArticleSection(
          titleBn: "✅ ২. পায়খানা বিশ্লেষণ (Droppings Observation)ঃ",
          titleEn: "2. Droppings Observation:",
          pointsBn: [
            "•সবুজ পায়খানা = নিউক্যাসল",
            "•রক্তমিশ্রিত পায়খানা = কক্সিডিওসিস",
            "•সাদা কটকটে পায়খানা = ইকোলাই বা সালমোনেলোসিস",
          ],
          pointsEn: [
            "•Bright green droppings = Newcastle Disease",
            "•Bloody diarrhea = Coccidiosis",
            "•White chalky droppings = E. coli or Salmonellosis",
          ],
        ),
        DiagnosisArticleSection(
          titleBn: "✅ ৩. মৃত মুরগির পোস্টমর্টেম (Necropsy)ঃ",
          titleEn: "3. Post-Mortem (Necropsy) Inspection:",
          pointsBn: [
            "মুরগির ভিতরের অঙ্গগুলো দেখে নির্ণয় করা হয়ঃ",
            "•আন্ত্রিক দেয়ালে রক্ত জমাট → কক্সিডিওসিস",
            "•ফুসফুসে তরল বা কালচে রং → নিউক্যাসল/ILT",
            "•লিভারে দাগ, রঙ পরিবর্তন → cholera, হেপাটাইটিস",
            "•এয়ারস্যাক ঘোলা/ ফেনা → CRD",
            "•কিডনি বড়, ফোলা → IB, গাউট",
            "•হাড়ের জয়েন্টে তরল → MS (Mycoplasma synoviae)",
          ],
          pointsEn: [
            "Inspect internal organs post-mortem:",
            "•Hemorrhagic intestinal lining → Coccidiosis",
            "•Fluid/dark congestion in lungs → Newcastle / ILT",
            "•Necrotic spots/discolored liver → Fowl Cholera, Hepatitis",
            "•Cloudy/foamy air sacs → CRD",
            "•Swollen enlarged kidneys → IB, Gout",
            "•Exudate in joint capsules → MS (Mycoplasma synoviae)",
          ],
        ),
        DiagnosisArticleSection(
          titleBn: "✅ ৪. ল্যাব টেস্ট (Laboratory Diagnosis)ঃ",
          titleEn: "4. Laboratory Diagnosis:",
          pointsBn: [
            "•ব্লাড স্মিয়ার টেস্ট → লিউকোসিস, হিমোপ্রোটোজোয়া",
            "•ব্যাকটেরিওলজি কালচার → ইকোলাই, স্যালমোনেলা",
            "•PCR টেস্ট → ভাইরাস নির্ণয়ে (NDV, IBV, ILT)",
            "•ELISA টেস্ট → অ্যান্টিবডি মাপার মাধ্যমে রোগ সনাক্ত",
            "•Gram Stain → ব্যাকটেরিয়া সনাক্ত",
            "•Culture & Sensitivity → উপযুক্ত অ্যান্টিবায়োটিক বেছে নিতে",
          ],
          pointsEn: [
            "•Blood Smear Test → Leukosis, Hemoprotozoa",
            "•Bacteriology Culture → E. coli, Salmonella",
            "•PCR Test → Viral identification (NDV, IBV, ILT)",
            "•ELISA Test → Antibody titer measurement & disease confirmation",
            "•Gram Stain → Bacterial identification",
            "•Culture & Sensitivity → Antibiotic selection",
          ],
        ),
        DiagnosisArticleSection(
          titleBn: "✅ ৫. ট্রায়াল চিকিৎসা (Therapeutic Diagnosis)ঃ",
          titleEn: "5. Therapeutic Diagnosis:",
          pointsBn: [
            "•কখনও রোগ নির্ণয় না হওয়া পর্যন্ত অনুমানভিত্তিক ওষুধ প্রয়োগ করে দেখা হয় যে প্রতিক্রিয়া (যেমন, কক্সিডিওসিসে কক্সিস, CRD-তে টাইলোসিন/ডক্সিসাইক্লিন)",
          ],
          pointsEn: [
            "•Presumptive trial medication applied when lab tests are pending to observe treatment response (e.g. Coxis for Coccidiosis, Tylosin/Doxycycline for CRD).",
          ],
        ),
        DiagnosisArticleSection(
          titleBn: "✅ ৬. খামার ইতিহাস (Farm History)ঃ",
          titleEn: "6. Farm History & Epizootiology:",
          pointsBn: [
            "•বাচ্চা কোথা থেকে?",
            "•কয় দিন বয়স?",
            "•কি ভ্যাকসিন দেওয়া হয়েছে?",
            "•পূর্বে কোনো রোগ হয়েছিল?",
            "•পরিবেশ (তাপমাত্রা, বায়ু চলাচল) কেমন?",
          ],
          pointsEn: [
            "•Hatchery origin of day-old chicks?",
            "•Flock age in days?",
            "•Vaccination history & dates?",
            "•Previous disease outbreaks on farm?",
            "•Environmental parameters (Temperature, airflow & humidity)?",
          ],
        ),
        DiagnosisArticleSection(
          titleBn: "✅ ৭. রোগ ছড়ানোর ধরন বিশ্লেষণঃ",
          titleEn: "7. Mortality Pattern Analysis:",
          pointsBn: [
            "•যদি হঠাৎ অনেক মুরগি মারা যায় → ভাইরাস সংক্রমণ (যেমন, ND, AI)",
            "•ধীরে ধীরে মৃত্যু বাড়ে → ব্যাকটেরিয়া/পরজীবী সংক্রমণ",
          ],
          pointsEn: [
            "•Sudden high mortality spike → Acute viral infection (ND, Avian Influenza)",
            "•Gradual increasing mortality → Bacterial or parasitic infection",
          ],
        ),
      ],
      summaryTitleBn: "🔍 গুরুত্বপূর্ণ পরামর্শঃ",
      summaryTitleEn: "🔍 Important Guidelines:",
      summaryQuoteBn:
          "প্রত্যেক খামারে রেকর্ড রাখা খুব দরকার। অভিজ্ঞ ভেটেরিনারির মাধ্যমে পোস্টমর্টেম করা সবচেয়ে নির্ভরযোগ্য। সবসময় ভ্যাকসিন চার্ট অনুসরণ করা।",
      summaryQuoteEn:
          "Maintain daily farm logs. Autopsy by a registered veterinarian is most reliable. Always follow vaccine charts.",
      summarySubBn: "",
      summarySubEn: "",
    ),

    // -------------------------------------------------------------
    // Item 2: Commercial Color Chicken (বাণিজ্যিক কালার চিকেন)
    // -------------------------------------------------------------
    DiseaseDiagnosisItem(
      id: "comm_color",
      titleBn: "বাণিজ্যিক কালার চিকেন",
      titleEn: "Commercial Color Chicken",
      descBn:
          "COMMERCIAL COLOR CHICKEN:\n🐔 কমার্শিয়াল কালার মুরগির রোগ নির্ণয়ের কৌশলঃ\nপ্রাথমিক পর্যবেক্ষণ, পায়খানা, পোস্টমর্টেম, ল্যাব টেস্ট, ট্রায়াল চিকিৎসা ও সাক্সেস চেকলিস্ট...",
      descEn:
          "COMMERCIAL COLOR CHICKEN:\n🐔 Complete diagnostic techniques for Commercial Color/Sonali birds including clinical observation, necropsy, trial therapy & checklist...",
      imagePath: "assets/comm_color.jpg",
      introBn:
          "COMMERCIAL COLOR CHICKEN:\n\n🐔 কমার্শিয়াল কালার মুরগির রোগ নির্ণয়ের কৌশলঃ\nসোনালী ও কালার বার্ডের ক্ষেত্রে দ্রুত ও সঠিক রোগ শনাক্তকরণ খামারের মৃত্যুহার শূন্যের কোঠায় নামিয়ে আনতে এবং লাভজনকতা বজায় রাখতে সহায়তা করে। নিচে বিস্তারিত ডায়াগনসিস গাইড দেওয়া হলো:",
      introEn:
          "COMMERCIAL COLOR CHICKEN:\n\n🐔 Diagnostic Techniques for Commercial Color Birds:\nAccurate disease detection in Sonali and Color bird breeds minimizes mortality and secures farm profitability.",
      sectionHeaderBn: "🔰 কালার মুরগির রোগ নির্ণয়ের ৬টি প্রধান ধাপ ও চেকলিস্ট:",
      sectionHeaderEn: "🔰 6 Key Diagnostic Steps & Checklist for Color Birds:",
      sections: [
        DiagnosisArticleSection(
          titleBn: "✅ ১. প্রাথমিক পর্যবেক্ষণ (Clinical Observation)ঃ",
          titleEn: "1. Clinical Observation:",
          pointsBn: [
            "মুরগির স্বাভাবিক আচরণ থেকে বিচ্যুতি যেসকল রোগের ইঙ্গিত দিতে পারে:",
            "•লক্ষণঃ খাওয়া কমে যাওয়া → সম্ভাব্য রোগঃ কক্সিডিওসিস, নিউক্যাসল, ইনফেকশাস ব্রনকাইটিস",
            "•লক্ষণঃ ঝিম ধরা, পালক ফুলিয়ে বসে থাকা → সম্ভাব্য রোগঃ ইনফেকশাস বোর্দেটেলোসিস, cholera",
            "•লক্ষণঃ চোখ-নাক দিয়ে পানি পড়া → সম্ভাব্য রোগঃ ক্রোনিক রেসপাইরেটরি ডিজিজ (CRD), IB",
            "•লক্ষণঃ হেঁচকি/গলা দিয়ে শব্দ → সম্ভাব্য রোগঃ নিউক্যাসল, ILT",
            "•লক্ষণঃ পায়খানায় রক্ত → সম্ভাব্য রোগঃ কক্সিডিওসিস",
            "•লক্ষণঃ গা গরম, জ্বর → সম্ভাব্য রোগঃ ব্যাকটেরিয়াল ইনফেকশন",
          ],
          pointsEn: [
            "Deviations from normal behavior indicating specific diseases:",
            "•Symptom: Reduced feed intake → Suspected: Coccidiosis, Newcastle, IB",
            "•Symptom: Lethargy, ruffled feathers → Suspected: Bordetellosis, Fowl Cholera",
            "•Symptom: Watery eyes & nasal discharge → Suspected: CRD, IB",
            "•Symptom: Gasping/gurgling sound → Suspected: Newcastle, ILT",
            "•Symptom: Bloody droppings → Suspected: Coccidiosis",
            "•Symptom: Fever / body heat → Suspected: Bacterial Infection",
          ],
        ),
        DiagnosisArticleSection(
          titleBn: "✅ ২. পায়খানা ও পরিবেশ পর্যবেক্ষণঃ",
          titleEn: "2. Droppings & Environment Inspection:",
          pointsBn: [
            "•সবুজ পায়খানা → NDV (নিউক্যাসল)",
            "•সাদা পানি পায়খানা → ইকোলাই, কোরিজা",
            "•রক্তমিশ্রিত পায়খানা → কক্সিডিওসিস",
            "•খামারে গন্ধ ও গরম আবহাওয়া → পরিবেশগত চাপ + রোগ প্রবণতা",
          ],
          pointsEn: [
            "•Bright green droppings → NDV (Newcastle)",
            "•White watery droppings → E. coli, Infectious Coryza",
            "•Bloody diarrhea → Coccidiosis",
            "•Foul ammonia odor & hot climate → Environmental stress + disease risk",
          ],
        ),
        DiagnosisArticleSection(
          titleBn: "✅ ৩. পোস্টমর্টেম পরীক্ষার মাধ্যমে রোগ নির্ণয় (Necropsy Findings)ঃ",
          titleEn: "3. Post-Mortem (Necropsy) Findings:",
          pointsBn: [
            "মুরগির ভিতরের অঙ্গগুলো দেখে নির্ণয় করা হয়ঃ",
            "•আন্ত্রিক দেয়ালে রক্ত জমাট → কক্সিডিওসিস",
            "•ফুসফুসে তরল বা কালচে রং → নিউক্যাসল/ILT",
            "•লিভারে দাগ, রঙ পরিবর্তন → cholera, হেপাটাইটিস",
            "•এয়ারস্যাক ঘোলা/ ফেনা → CRD",
            "•কিডনি বড়, ফোলা → IB, গাউট",
            "•হাড়ের জয়েন্টে তরল → MS (Mycoplasma synoviae)",
          ],
          pointsEn: [
            "Inspect internal organs post-mortem:",
            "•Hemorrhagic intestinal wall → Coccidiosis",
            "•Fluid/dark discoloration in lungs → Newcastle / ILT",
            "•Necrotic spots/discolored liver → Fowl Cholera, Hepatitis",
            "•Cloudy/foamy air sacs → CRD",
            "•Swollen enlarged kidneys → IB, Gout",
            "•Exudate in joint fluid → MS (Mycoplasma synoviae)",
          ],
        ),
        DiagnosisArticleSection(
          titleBn: "✅ ৪. ল্যাব টেস্ট (নির্ভরযোগ্য পদ্ধতি)ঃ",
          titleEn: "4. Laboratory Diagnosis:",
          pointsBn: [
            "•ব্লাড স্মিয়ার টেস্ট → লিউকোসিস, হিমোপ্রোটোজোয়া",
            "•ব্যাকটেরিওলজি কালচার → ইকোলাই, স্যালমোনেলা",
            "•PCR টেস্ট → ভাইরাস নির্ণয়ে (NDV, IBV, ILT)",
            "•ELISA টেস্ট → অ্যান্টিবডি মাপার মাধ্যমে রোগ সনাক্ত",
            "•Gram Stain → ব্যাকটেরিয়া সনাক্ত",
            "•Culture & Sensitivity → উপযুক্ত অ্যান্টিবায়োটিক বেছে নিতে",
          ],
          pointsEn: [
            "•Blood Smear Test → Leukosis, Hemoprotozoa",
            "•Bacteriology Culture → E. coli, Salmonella",
            "•PCR Test → Viral identification (NDV, IBV, ILT)",
            "•ELISA Test → Antibody titer measurement & disease confirmation",
            "•Gram Stain → Bacterial identification",
            "•Culture & Sensitivity → Antibiotic selection",
          ],
        ),
        DiagnosisArticleSection(
          titleBn: "✅ ৫. রোগ ইতিহাস ও ঝুঁকি বিশ্লেষণ (Case History)ঃ",
          titleEn: "5. Case History & Risk Analysis:",
          pointsBn: [
            "•আগে কোনো ভ্যাকসিন দেওয়া হয়েছিল কিনা?",
            "•আশেপাশে রোগের প্রাদুর্ভাব?",
            "•একই সময় ব্রিডার মুরগি বা অন্য জাত আছে কি না?",
            "•বয়স অনুযায়ী সমস্যা হচ্ছে কি না?",
          ],
          pointsEn: [
            "•Previous vaccination records & timeline?",
            "•Disease outbreaks in neighboring farms?",
            "•Co-housing with breeder or other bird breeds?",
            "•Age-specific disease susceptibility?",
          ],
        ),
        DiagnosisArticleSection(
          titleBn: "✅ ৬. ফার্ম পর্যায়ে ট্রায়াল চিকিৎসা (Treatment Diagnosis)ঃ",
          titleEn: "6. Farm-Level Trial Medication:",
          pointsBn: [
            "যখন ল্যাব সুবিধা থাকে না তখন রোগের লক্ষণ দেখে অনুমান করেঃ",
            "•টাইলোসিন/ডক্সিসাইক্লিন → CRD, Coryza",
            "•এম্প্রোলিয়াম → কক্সিডিওসিস",
            "•অক্সিটেট/টাইলোসিন → cholera/ইকোলাই",
            "•সলিউশন + ইলেক্ট্রোলাইট → গরমে স্ট্রেস",
          ],
          pointsEn: [
            "Presumptive medication when lab facility is unavailable:",
            "•Tylosin / Doxycycline → CRD, Infectious Coryza",
            "•Amprolium → Coccidiosis",
            "•Oxytetracycline / Tylosin → Fowl Cholera / E. coli",
            "•Vitamin-C + Electrolyte Solution → Heat Stress",
          ],
        ),
        DiagnosisArticleSection(
          titleBn: "🔍 আলাদা যেসব বিষয় খেয়াল রাখবে কালার মুরগির জন্যঃ",
          titleEn: "🔍 Specific Diseases to Watch in Color Birds:",
          pointsBn: [
            "•ILT (Infectious Laryngotracheitis): পুরোনো খামারে বেশি হয় – রক্তমিশ্র কফ উঠে।",
            "•Infectious Coryza: চোখ ফোলা, নাক দিয়ে গন্ধযুক্ত তরল।",
          ],
          pointsEn: [
            "•ILT (Infectious Laryngotracheitis): Common in old farms – bloody tracheal mucus.",
            "•Infectious Coryza: Swollen eyes with foul-smelling nasal exudate.",
          ],
        ),
        DiagnosisArticleSection(
          titleBn: "📋 রোগ নির্ণয়ের সময় ব্যবহারের জন্য চেকলিস্টঃ",
          titleEn: "📋 Diagnostic Field Checklist:",
          pointsBn: [
            "•আচরণ স্বাভাবিক?",
            "•খাদ্যগ্রহণ কেমন?",
            "•পায়খানা পর্যবেক্ষণ",
            "•মৃত্যুর হার ও ধরণ",
            "•আশেপাশে অন্য খামারে রোগ?",
            "•পরিবেশগত তাপমাত্রা ও ভেন্টিলেশন ঠিক আছে?",
          ],
          pointsEn: [
            "•Is flock behavior normal?",
            "•How is daily feed intake?",
            "•Inspect droppings condition",
            "•Check mortality rate & pattern",
            "•Disease status in neighboring farms?",
            "•Are environmental temperature & ventilation adequate?",
          ],
        ),
      ],
      summaryTitleBn: "✅ মূল কথা:",
      summaryTitleEn: "✅ Diagnostic Key:",
      summaryQuoteBn:
          "সোনালী ও কালার মুরগিতে সময়মতো লক্ষণ সনাক্তকরণ, ট্রায়াল চিকিৎসা ও চেকলিস্ট অনুসরণ শতভাগ রোগ নিয়ন্ত্রণ নিশ্চিত করে।",
      summaryQuoteEn:
          "Timely symptom detection, trial treatment, and checklist adherence ensure 100% disease control in color birds.",
      summarySubBn: "",
      summarySubEn: "",
    ),

    // -------------------------------------------------------------
    // Item 3: Commercial Layer (বাণিজ্যিক লেয়ার)
    // -------------------------------------------------------------
    DiseaseDiagnosisItem(
      id: "comm_layer",
      titleBn: "বাণিজ্যিক লেয়ার",
      titleEn: "Commercial Layer",
      descBn:
          "COMMERCIAL LAYER:\n🐔 কমার্শিয়াল লেয়ার মুরগির রোগ নির্ণয়ের কৌশলঃ\nপ্রাথমিক লক্ষণ, পায়খানা বিশ্লেষণ, ডিম উৎপাদন ধরণ, পোস্টমর্টেম, ল্যাব টেস্ট, ট্রায়াল চিকিৎসা ও চেকলিস্ট...",
      descEn:
          "COMMERCIAL LAYER:\n🐔 Complete diagnostic techniques for Commercial Layer hens including clinical signs, droppings, egg production monitoring, necropsy, lab tests & checklist...",
      imagePath: "assets/comm_layer.jpg",
      introBn:
          "COMMERCIAL LAYER:\n\n🐔 কমার্শিয়াল লেয়ার মুরগির রোগ নির্ণয়ের কৌশলঃ\nলেয়ার মুরগিতে রোগ হলে সরাসরি ডিম উৎপাদন ধস নামে (Egg Drop) এবং ডিমের আকৃতি ও খোলসের মান নষ্ট হয়। সঠিক রোগ নির্ণয়ের মাধ্যমে ডিম উৎপাদন ও মুরগির স্বাস্থ্য নিশ্চিত করা সম্ভব। নিচে বিস্তারিত ডায়াগনসিস পদ্ধতি দেওয়া হলো:",
      introEn:
          "COMMERCIAL LAYER:\n\n🐔 Diagnostic Techniques for Commercial Layer Hens:\nIn layer hens, disease directly causes egg drops and shell abnormalities. Timely diagnosis preserves production and hen health.",
      sectionHeaderBn: "🔰 লেয়ার মুরগির রোগ নির্ণয়ের ৭টি প্রধান ধাপ ও চেকলিস্ট:",
      sectionHeaderEn: "🔰 7 Key Diagnostic Steps & Field Checklist for Layer Hens:",
      sections: [
        DiagnosisArticleSection(
          titleBn: "✅ ১. রোগের প্রাথমিক লক্ষণ (Clinical Signs)ঃ",
          titleEn: "1. Clinical Signs Observation:",
          pointsBn: [
            "•লক্ষণঃ ডিম কমে যাওয়া বা আকৃতি ছোট → সম্ভাব্য রোগঃ ইনফেকশাস ব্রনকাইটিস (IB), নিউক্যাসল",
            "•লক্ষণঃ ডিমের খোলস পাতলা বা ভেঙে যায় → সম্ভাব্য রোগঃ EDS (Egg Drop Syndrome), ক্যালসিয়াম অভাব",
            "•লক্ষণঃ খাওয়া কমে যাওয়া → সম্ভাব্য রোগঃ কোলাই, ND, IB",
            "•লক্ষণঃ পায়খানায় রক্ত → সম্ভাব্য রোগঃ কক্সিডিওসিস",
            "•লক্ষণঃ ঝিম ধরা ও পালক ঝরা → সম্ভাব্য রোগঃ মারেকস, নিউক্যাসল, নিউট্রিশনাল সমস্যা",
            "•লক্ষণঃ পেট ফুলে যাওয়া ডিম বন্ধ হওয়া → সম্ভাব্য রোগঃ Internal Laying, Egg Peritonitis",
            "•লক্ষণঃ চোখ ও নাক দিয়ে পানি → সম্ভাব্য রোগঃ CRD, Coryza",
            "•লক্ষণঃ মুখ খোলা রেখে হাঁপানির মতো শ্বাস → সম্ভাব্য রোগঃ ILT, CRD, ND",
          ],
          pointsEn: [
            "•Symptom: Egg drop or small eggs → Suspected: Infectious Bronchitis (IB), Newcastle",
            "•Symptom: Thin or broken eggshells → Suspected: EDS (Egg Drop Syndrome), Calcium deficiency",
            "•Symptom: Reduced feed intake → Suspected: E. coli, ND, IB",
            "•Symptom: Bloody droppings → Suspected: Coccidiosis",
            "•Symptom: Lethargy & feather loss → Suspected: Marek's, Newcastle, Nutritional deficiency",
            "•Symptom: Swollen abdomen & cessation of laying → Suspected: Internal Laying, Egg Peritonitis",
            "•Symptom: Eye & nasal watery discharge → Suspected: CRD, Coryza",
            "•Symptom: Open-mouth gasping → Suspected: ILT, CRD, ND",
          ],
        ),
        DiagnosisArticleSection(
          titleBn: "✅ ২. পায়খানা বিশ্লেষণ (Feces Observation)ঃ",
          titleEn: "2. Feces / Droppings Inspection:",
          pointsBn: [
            "1) রক্তমিশ্রিত পায়খানা → কক্সিডিওসিস",
            "2) সাদা পানি বা দুধের মতো পায়খানা → ইকোলাই",
            "3) সবুজ পায়খানা → নিউক্যাসল",
            "4) হলুদ বা ফেনাযুক্ত পায়খানা → ডিম সংক্রান্ত রোগ বা হজম সমস্যা",
          ],
          pointsEn: [
            "1) Bloody droppings → Coccidiosis",
            "2) White watery or milky droppings → E. coli",
            "3) Bright green droppings → Newcastle Disease",
            "4) Yellowish or foamy droppings → Reproductive tract disorder or digestive problem",
          ],
        ),
        DiagnosisArticleSection(
          titleBn: "✅ ৩. ডিম উৎপাদনের ধরণ বিশ্লেষণ (Egg Production Monitoring)ঃ",
          titleEn: "3. Egg Production & Quality Monitoring:",
          pointsBn: [
            "1) ডিম উৎপাদন হঠাৎ কমে যাওয়া → ইনফেকশাস ব্রনকাইটিস, EDS",
            "2) খোলস পাতলা বা দাগযুক্ত → ND, IB, ক্যালসিয়াম অভাব",
            "3) ডিমে রঙ পরিবর্তন → ফিড সংক্রান্ত, হেপাটাইটিস",
          ],
          pointsEn: [
            "1) Sudden drop in daily egg production → Infectious Bronchitis, EDS-76",
            "2) Thin-shelled, rough or speckled eggs → ND, IB, Calcium deficiency",
            "3) Pigment loss or discolored eggs → Feed formulation issues, Viral Hepatitis",
          ],
        ),
        DiagnosisArticleSection(
          titleBn: "✅ ৪. পোস্টমর্টেম কৌশল (Necropsy/PM Exam)ঃ",
          titleEn: "4. Post-Mortem (Necropsy) Examination:",
          pointsBn: [
            "1) ডিম্বনালী (oviduct) ফোলা, পুঁজ → Egg Peritonitis",
            "2) যকৃত (Liver) দাগ, বড় → cholera, হেপাটাইটিস",
            "3) ডিম্বাশয় (Ovary) ফোলা, পচা ডিম → Internal Laying, Salpingitis",
            "4) এয়ারস্যাক ফেনা/ঝিল্লি → CRD, IB",
            "5) গলা/ট্রাকিয়া রক্ত জমাট → ILT",
          ],
          pointsEn: [
            "1) Swollen oviduct with purulent exudate → Egg Peritonitis",
            "2) Enlarged discolored liver with necrotic spots → Fowl Cholera, Hepatitis",
            "3) Atrophied/misshapen ovary with coagulated yolks → Internal Laying, Salpingitis",
            "4) Cloudy/foamy air sac membranes → CRD, IB",
            "5) Hemorrhagic trachea with blood clots → ILT (Infectious Laryngotracheitis)",
          ],
        ),
        DiagnosisArticleSection(
          titleBn: "✅ ৫. ল্যাবরেটরি পরীক্ষা (Lab Diagnosis)ঃ",
          titleEn: "5. Laboratory Diagnosis:",
          pointsBn: [
            "•ব্লাড স্মিয়ার টেস্ট → লিউকোসিস, হিমোপ্রোটোজোয়া",
            "•ব্যাকটেরিওলজি কালচার → ইকোলাই, স্যালমোনেলা",
            "•PCR টেস্ট → ভাইরাস নির্ণয়ে (NDV, IBV, ILT)",
            "•ELISA টেস্ট → অ্যান্টিবডি মাপার মাধ্যমে রোগ সনাক্ত",
            "•Gram Stain → ব্যাকটেরিয়া সনাক্ত",
            "•Culture & Sensitivity → উপযুক্ত অ্যান্টিবায়োটিক বেছে নিতে",
          ],
          pointsEn: [
            "•Blood Smear Test → Leukosis, Hemoprotozoa",
            "•Bacteriology Culture → E. coli, Salmonella",
            "•PCR Test → Viral identification (NDV, IBV, ILT)",
            "•ELISA Test → Antibody titer measurement & disease confirmation",
            "•Gram Stain → Bacterial identification",
            "•Culture & Sensitivity → Antibiotic selection",
          ],
        ),
        DiagnosisArticleSection(
          titleBn: "✅ ৬. ফার্ম ইতিহাস (Farm History) বিশ্লেষণঃ",
          titleEn: "6. Farm History Analysis:",
          pointsBn: [
            "•ভ্যাকসিন দেওয়া হয়েছিল কিনা?",
            "•উৎপাদনে বয়স কত দিন চলছে?",
            "•আশেপাশে কোনো খামারে রোগ আছে কিনা?",
            "•কি ধরনের ফিড দেওয়া হচ্ছে (কারণ ফিড অনেক সময় ডিম খোলস বা রঙ পরিবর্তনের কারণ হয়)?",
          ],
          pointsEn: [
            "•Complete layer vaccination record verification?",
            "•Current flock laying age in weeks?",
            "•Prevalence of disease in neighboring poultry farms?",
            "•Feed formulation & calcium-phosphorus ratio check?",
          ],
        ),
        DiagnosisArticleSection(
          titleBn: "✅ ৭. চিকিৎসা পর্যবেক্ষণ পদ্ধতি (Therapeutic Diagnosis)ঃ",
          titleEn: "7. Therapeutic Diagnosis:",
          pointsBn: [
            "🧪 কক্সিডিওসিস সন্দেহে – Amprolium দিলে প্রতিক্রিয়া দেখে নিশ্চিত হওয়া যায়",
            "🧪 CRD সন্দেহে – ডক্সিসাইক্লিন বা টাইলোসিন প্রয়োগ",
            "🧪 Internal laying বা EDS এ – টিলমাইকোসিন, supportive therapy",
            "🧪 হরমোনাল বা নিউট্রিশনাল সমস্যা → ভিটামিন-ডি৩, ক্যালসিয়াম সাপ্লিমেন্টেশন",
          ],
          pointsEn: [
            "🧪 Suspected Coccidiosis – Amprolium trial response",
            "🧪 Suspected CRD – Doxycycline or Tylosin administration",
            "🧪 Internal laying or EDS – Tilmicosin & supportive therapy",
            "🧪 Hormonal or Nutritional disorder – Vitamin-D3 & Calcium supplementation",
          ],
        ),
        DiagnosisArticleSection(
          titleBn: "📋 লেয়ার মুরগির রোগ নির্ণয়ে চেকলিস্ট (ফার্ম পর্যায়ে)ঃ",
          titleEn: "📋 Layer Hen Diagnostic Field Checklist:",
          pointsBn: [
            "•আচরণ স্বাভাবিক কি না?",
            "•ডিম উৎপাদন স্বাভাবিক কি না?",
            "•পায়খানার রঙ ও ধরণ কেমন?",
            "•চোখ, নাক, মুখে কোনো পরিবর্তন?",
            "•ডিমের খোলসে সমস্যা আছে কি না?",
            "•খামারের তাপমাত্রা ও পরিবেশ ঠিক আছে?",
          ],
          pointsEn: [
            "•Is flock behavior normal?",
            "•Is daily egg production rate normal?",
            "•Check droppings color and consistency",
            "•Inspect eyes, nostrils, and mouth for discharge",
            "•Inspect eggshell quality, thickness, and shape",
            "•Verify farm ambient temperature, ventilation & lighting",
          ],
        ),
      ],
      summaryTitleBn: "✅ মূলকথা:",
      summaryTitleEn: "✅ Diagnostic Key:",
      summaryQuoteBn:
          "লেয়ার মুরগিতে ডিম উৎপাদন ও খোসার মান পর্যবেক্ষণ করে সঠিক ডায়াগনসিস করা এবং দ্রুত চিকিৎসা দেওয়া সর্বোচ্চ প্রফিটেবিলিটি নিশ্চিত করে।",
      summaryQuoteEn:
          "Monitoring egg production rates and shell quality enables rapid diagnosis and maximizes layer flock profitability.",
      summarySubBn: "",
      summarySubEn: "",
    ),

    // -------------------------------------------------------------
    // Item 4: Broiler Parent Stock (ব্রয়লার প্যারেন্ট স্টক)
    // -------------------------------------------------------------
    DiseaseDiagnosisItem(
      id: "broiler_parent",
      titleBn: "ব্রয়লার প্যারেন্ট স্টক",
      titleEn: "Broiler Parent Stock",
      descBn:
          "BROILER PARENT STOCK:\n🐔 ব্রয়লার প্যারেন্ট মুরগির রোগ নির্ণয়ের কৌশল (Diagnostic Techniques for Broiler Breeder/Parent Stock)...",
      descEn:
          "BROILER PARENT STOCK:\n🐔 Complete diagnostic techniques for Broiler Breeder/Parent Stock including age-wise monitoring, necropsy, lab techniques & breeder checklist...",
      imagePath: "assets/broiler_parent.jpg",
      introBn:
          "BROILER PARENT STOCK:\n\n🐔 ব্রয়লার প্যারেন্ট মুরগির রোগ নির্ণয়ের কৌশল (Diagnostic Techniques for Broiler Breeder/Parent Stock):\nপ্যারেন্ট স্টকে কোনো রোগ প্রবেশ করলে তা ডিমের মাধ্যমে বাচ্চার শরীরে ছড়ায় (Vertical Transmission)। উচ্চ ফার্টিলিটি, হ্যাচাবিলিটি ও সুস্থ বাচ্চার জন্য নিখুঁত রোগ নির্ণয় জরুরি।",
      introEn:
          "BROILER PARENT STOCK:\n\n🐔 Diagnostic Techniques for Broiler Breeder/Parent Stock:\nPreventing vertically transmitted diseases in parent stock guarantees maximum egg fertility, hatchability, and healthy commercial chick output.",
      sectionHeaderBn: "🔰 ব্রয়লার প্যারেন্ট স্টকের রোগ নির্ণয়ের ৭টি প্রধান ধাপ ও চেকলিস্ট:",
      sectionHeaderEn: "🔰 7 Diagnostic Steps & Breeder Checklist for Broiler Parents:",
      sections: [
        DiagnosisArticleSection(
          titleBn: "✅ ১. রোগের বয়সভিত্তিক পর্যবেক্ষণঃ",
          titleEn: "1. Age-Wise Disease Surveillance:",
          pointsBn: [
            "1) ০–৪ সপ্তাহ → মারেকস, Gumboro (IBD), ND",
            "2) ৫–১৬ সপ্তাহ → CRD, ILT, Fowl Cholera",
            "3) ১৭+ সপ্তাহ (ডিম শুরু) → Egg Peritonitis, Salpingitis, EDS, IB, ND",
          ],
          pointsEn: [
            "1) Weeks 0–4 → Marek's Disease, Gumboro (IBD), Newcastle (ND)",
            "2) Weeks 5–16 → CRD, ILT, Fowl Cholera",
            "3) Weeks 17+ (Onset of Lay) → Egg Peritonitis, Salpingitis, EDS, IB, ND",
          ],
        ),
        DiagnosisArticleSection(
          titleBn: "✅ ২. প্রাথমিক লক্ষণ দেখে রোগ চেনা (Clinical Symptoms)ঃ",
          titleEn: "2. Clinical Symptoms Identification:",
          pointsBn: [
            "1) ডিম কমে যাওয়া → IB, EDS, ND",
            "2) পাতলা বা দাগযুক্ত খোলস → EDS, ক্যালসিয়াম/ভিটামিন-ডি অভাব",
            "3) হাঁচি-কাশি-শ্বাসকষ্ট → CRD, IB, ILT",
            "4) চোখ-নাক দিয়ে পানি → Coryza, CRD",
            "5) হঠাৎ মৃত্যু → cholera, নিউক্যাসল",
            "6) গায়ে জ্বর, ডিম আটকে যাওয়া → Egg peritonitis, Heat stress",
            "7) ডিম্বাশয়ে সমস্যা → Internal laying, Salpingitis",
          ],
          pointsEn: [
            "1) Drop in egg production → IB, EDS-76, Newcastle (ND)",
            "2) Thin or speckled eggshells → EDS, Calcium / Vitamin-D3 deficiency",
            "3) Sneezing, coughing & gasping → CRD, IB, ILT",
            "4) Watery eyes & nasal discharge → Infectious Coryza, CRD",
            "5) Sudden flock mortality → Fowl Cholera, Newcastle Disease",
            "6) High fever & egg binding → Egg Peritonitis, Severe Heat Stress",
            "7) Ovarian follicle lesions → Internal Laying, Salpingitis",
          ],
        ),
        DiagnosisArticleSection(
          titleBn: "✅ ৩. পোস্টমর্টেমে অঙ্গ পর্যবেক্ষণ (Necropsy Findings)ঃ",
          titleEn: "3. Post-Mortem (Necropsy) Organ Inspection:",
          pointsBn: [
            "1) ডিমনালী ফোলা, পুঁজ → Egg peritonitis, Salpingitis",
            "2) যকৃত দাগযুক্ত, বড় → Fowl cholera, Inclusion body hepatitis",
            "3) এয়ারস্যাক ঘোলা/ফেনা → CRD, IB",
            "4) ট্রাকিয়াতে (গলা) রক্ত জমাট → ILT",
            "5) কিডনি বড়, সাদা → IB nephropathogenic strain",
            "6) হৃদপিণ্ড পুরু ঝিল্লি → Ascites, E. coli",
          ],
          pointsEn: [
            "1) Swollen oviduct with purulent exudate → Egg Peritonitis, Salpingitis",
            "2) Enlarged liver with necrotic foci → Fowl Cholera, Inclusion Body Hepatitis (IBH)",
            "3) Cloudy / foamy air sacs → CRD, Infectious Bronchitis (IB)",
            "4) Hemorrhagic trachea with blood clots → Infectious Laryngotracheitis (ILT)",
            "5) Enlarged pale kidneys with urate deposits → Nephropathogenic IB strain",
            "6) Fibrinous pericarditis & thick membranes → Ascites, Colibacillosis (E. coli)",
          ],
        ),
        DiagnosisArticleSection(
          titleBn: "✅ ৪. ডিম উৎপাদন বিশ্লেষণ (Egg Production Monitoring)ঃ",
          titleEn: "4. Hatching Egg Production Monitoring:",
          pointsBn: [
            "1) ডিম কমে যাওয়া → IB, ND, EDS",
            "2) খোলস পাতলা → ক্যালসিয়াম অভাব, EDS",
            "3) ডিমে রক্ত বা খোলস ভেঙে যাওয়া → ডিম আটকে যাওয়া, Trauma",
          ],
          pointsEn: [
            "1) Sharp production drops → IB, ND, EDS-76",
            "2) Thin eggshell quality → Calcium deficiency, EDS-76",
            "3) Blood spots or shell fractures → Egg binding, Mechanical trauma",
          ],
        ),
        DiagnosisArticleSection(
          titleBn: "✅ ৫. ল্যাব টেস্ট কৌশল (Lab Techniques)ঃ",
          titleEn: "5. Laboratory Techniques:",
          pointsBn: [
            "1) PCR → ভাইরাল রোগ (ND, IB, ILT, EDS) নিশ্চিত করতে",
            "2) Bacterial culture → E. coli, Pasteurella, Salmonella",
            "3) ELISA → আগের ভাইরাস সংক্রমণ শনাক্ত",
            "4) Egg shell quality test → ক্যালসিয়াম বা মিনারেল ঘাটতি পরিমাপ",
          ],
          pointsEn: [
            "1) PCR → Definitive viral confirmation (NDV, IBV, ILT, EDS-76)",
            "2) Bacterial Culture → E. coli, Pasteurella multocida, Salmonella species",
            "3) ELISA → Serological screening for previous viral exposure & titers",
            "4) Eggshell Quality Testing → Measuring shell breaking strength & mineral thickness",
          ],
        ),
        DiagnosisArticleSection(
          titleBn: "✅ ৬. ফার্ম ইতিহাস ও পরিবেশ বিশ্লেষণ (Farm Record & Environment)ঃ",
          titleEn: "6. Farm Record & Environmental Analysis:",
          pointsBn: [
            "•টিকাদান ইতিহাস ঠিক আছে কি না?",
            "•ঘরের পরিবেশ – তাপমাত্রা, আর্দ্রতা, বায়ু চলাচল?",
            "•ফিড পরিবর্তন বা ঘাটতি?",
            "•পানি পরিষ্কার? টক্সিন আছে কি?",
          ],
          pointsEn: [
            "•Complete breeder vaccination log audit?",
            "•House environment parameters – Temperature, humidity, airflow?",
            "•Feed formulation change or nutrient deficiency?",
            "•Drinking water quality & mycotoxin screening?",
          ],
        ),
        DiagnosisArticleSection(
          titleBn: "✅ ৭. চিকিৎসা-ভিত্তিক রোগ শনাক্ত (Therapeutic Diagnosis)ঃ",
          titleEn: "7. Therapeutic Diagnosis:",
          pointsBn: [
            "•কক্সিডিওসিস → Amprolium দিলে উন্নতি?",
            "•CRD → Tylosin বা Doxycycline দিলে ভালো হয়?",
            "•Peritonitis → Broad-spectrum antibiotic দিলে উন্নতি হয়?",
            "•Egg binding → ক্যালসিয়াম/ভিটামিন D3 দিলে উন্নতি?",
          ],
          pointsEn: [
            "•Coccidiosis → Immediate response to Amprolium therapy?",
            "•CRD → Symptomatic relief with Tylosin or Doxycycline?",
            "•Peritonitis → Response to broad-spectrum injectable antibiotics?",
            "•Egg binding → Recovery following oral Calcium & Vitamin-D3 boost?",
          ],
        ),
        DiagnosisArticleSection(
          titleBn: "📋 রোগ নির্ণয়ের জন্য চেকলিস্ট (Breeder-specific Checklist)ঃ",
          titleEn: "📋 Breeder-Specific Diagnostic Checklist:",
          pointsBn: [
            "•ওজন ও ডিম উৎপাদন ঠিক আছে?",
            "•হঠাৎ মৃত্যু ঘটছে কি?",
            "•পায়খানার ধরণ কেমন?",
            "•ডিমের খোলসের অবস্থা?",
            "•চোখ/নাক/গলা থেকে কিছু বের হচ্ছে কি?",
            "•পেট ফোলা/নরম?",
          ],
          pointsEn: [
            "•Is body weight & egg production on target curve?",
            "•Are sudden unexplained deaths occurring?",
            "•Inspect droppings color and consistency",
            "•Inspect hatching eggshell quality & breaking strength",
            "•Check eyes, nostrils & trachea for exudate/discharge",
            "•Examine abdomen for fluid swelling or soft peritonitis mass",
          ],
        ),
      ],
      summaryTitleBn: "✅ মূলকথা:",
      summaryTitleEn: "✅ Diagnostic Key:",
      summaryQuoteBn:
          "ব্রয়লার প্যারেন্ট স্টকে ডিম উৎপাদন ও ফার্টিলিটি ধরে রাখতে সঠিক বয়সভিত্তিক রোগ শনাক্তকরণ, পোস্টমর্টেম ও ল্যাব ডায়াগনসিস শতভাগ কার্যকর ছানা উৎপাদন নিশ্চিত করে।",
      summaryQuoteEn:
          "Age-specific disease monitoring, necropsy, and lab diagnostics ensure 100% fertile egg hatchability in Broiler Parent Stock.",
      summarySubBn: "",
      summarySubEn: "",
    ),

    // -------------------------------------------------------------
    // Item 5: Color Parent Stock (কালার প্যারেন্ট স্টক)
    // -------------------------------------------------------------
    DiseaseDiagnosisItem(
      id: "color_parent",
      titleBn: "কালার প্যারেন্ট স্টক",
      titleEn: "Color Parent Stock",
      descBn:
          "COLOR PARENT STOCK:\n🐔 কালার প্যারেন্ট মুরগির রোগ নির্ণয়ের কৌশল (Diagnostic Techniques for Color Parent Chicken)...",
      descEn:
          "COLOR PARENT STOCK:\n🐔 Complete diagnostic techniques for Color Parent Chicken including age-wise surveillance, clinical signs, necropsy, lab techniques & breeder checklist...",
      imagePath: "assets/color_parent.jpg",
      introBn:
          "COLOR PARENT STOCK:\n\n🐔 কালার প্যারেন্ট মুরগির রোগ নির্ণয়ের কৌশল (Diagnostic Techniques for Color Parent Chicken):\nসোনালী/কালার প্যারেন্ট স্টকে উচ্চ ডিম উৎপাদন, ফার্টিলিটি ও সুস্থ হ্যাচিং বাচ্চার জন্য নিখুঁত ডায়াগনসিস আবশ্যক। নিচে বিস্তারিত পর্যবেক্ষণ গাইড দেওয়া হলো:",
      introEn:
          "COLOR PARENT STOCK:\n\n🐔 Diagnostic Techniques for Color Parent Chicken:\nPrecision diagnostic protocols ensure high egg fertility, hatchability, and disease-free chick output in Sonali & Color breeder parent flocks.",
      sectionHeaderBn: "🔰 কালার প্যারেন্ট স্টকের রোগ নির্ণয়ের ৭টি প্রধান ধাপ ও চেকলিস্ট:",
      sectionHeaderEn: "🔰 7 Diagnostic Steps & Breeder Checklist for Color Parents:",
      sections: [
        DiagnosisArticleSection(
          titleBn: "✅ ১. রোগের বয়সভিত্তিক পর্যবেক্ষণঃ",
          titleEn: "1. Age-Wise Disease Surveillance:",
          pointsBn: [
            "1) ০–৪ সপ্তাহ → মারেকস, Gumboro (IBD), ND",
            "2) ৫–১৬ সপ্তাহ → CRD, ILT, Fowl Cholera",
            "3) ১৭+ সপ্তাহ (ডিম শুরু) → Egg Peritonitis, Salpingitis, EDS, IB, ND",
          ],
          pointsEn: [
            "1) Weeks 0–4 → Marek's Disease, Gumboro (IBD), Newcastle (ND)",
            "2) Weeks 5–16 → CRD, ILT, Fowl Cholera",
            "3) Weeks 17+ (Onset of Lay) → Egg Peritonitis, Salpingitis, EDS, IB, ND",
          ],
        ),
        DiagnosisArticleSection(
          titleBn: "✅ ২. প্রাথমিক লক্ষণ দেখে রোগ চেনা (Clinical Symptoms)ঃ",
          titleEn: "2. Clinical Symptoms Identification:",
          pointsBn: [
            "1) ডিম কমে যাওয়া → IB, EDS, ND",
            "2) পাতলা বা দাগযুক্ত খোলস → EDS, ক্যালসিয়াম/ভিটামিন-ডি অভাব",
            "3) হাঁচি-কাশি-শ্বাসকষ্ট → CRD, IB, ILT",
            "4) চোখ-নাক দিয়ে পানি → Coryza, CRD",
            "5) হঠাৎ মৃত্যু → cholera, নিউক্যাসল",
            "6) গায়ে জ্বর, ডিম আটকে যাওয়া → Egg peritonitis, Heat stress",
            "7) ডিম্বাশয়ে সমস্যা → Internal laying, Salpingitis",
          ],
          pointsEn: [
            "1) Drop in egg production → IB, EDS-76, Newcastle (ND)",
            "2) Thin or speckled eggshells → EDS, Calcium / Vitamin-D3 deficiency",
            "3) Sneezing, coughing & gasping → CRD, IB, ILT",
            "4) Watery eyes & nasal discharge → Infectious Coryza, CRD",
            "5) Sudden flock mortality → Fowl Cholera, Newcastle Disease",
            "6) High fever & egg binding → Egg Peritonitis, Severe Heat Stress",
            "7) Ovarian follicle lesions → Internal Laying, Salpingitis",
          ],
        ),
        DiagnosisArticleSection(
          titleBn: "✅ ৩. পোস্টমর্টেমে অঙ্গ পর্যবেক্ষণ (Necropsy Findings)ঃ",
          titleEn: "3. Post-Mortem (Necropsy) Organ Inspection:",
          pointsBn: [
            "1) ডিমনালী ফোলা, পুঁজ → Egg peritonitis, Salpingitis",
            "2) যকৃত দাগযুক্ত, বড় → Fowl cholera, Inclusion body hepatitis",
            "3) এয়ারস্যাক ঘোলা/ফেনা → CRD, IB",
            "4) ট্রাকিয়াতে (গলা) রক্ত জমাট → ILT",
            "5) কিডনি বড়, সাদা → IB nephropathogenic strain",
            "6) হৃদপিণ্ড পুরু ঝিল্লি → Ascites, E. coli",
          ],
          pointsEn: [
            "1) Swollen oviduct with purulent exudate → Egg Peritonitis, Salpingitis",
            "2) Enlarged liver with necrotic foci → Fowl Cholera, Inclusion Body Hepatitis (IBH)",
            "3) Cloudy / foamy air sacs → CRD, Infectious Bronchitis (IB)",
            "4) Hemorrhagic trachea with blood clots → Infectious Laryngotracheitis (ILT)",
            "5) Enlarged pale kidneys with urate deposits → Nephropathogenic IB strain",
            "6) Fibrinous pericarditis & thick membranes → Ascites, Colibacillosis (E. coli)",
          ],
        ),
        DiagnosisArticleSection(
          titleBn: "✅ ৪. ডিম উৎপাদন বিশ্লেষণ (Egg Production Monitoring)ঃ",
          titleEn: "4. Hatching Egg Production Monitoring:",
          pointsBn: [
            "1) ডিম কমে যাওয়া → IB, ND, EDS",
            "2) খোলস পাতলা → ক্যালসিয়াম অভাব, EDS",
            "3) ডিমে রক্ত বা খোলস ভেঙে যাওয়া → ডিম আটকে যাওয়া, Trauma",
          ],
          pointsEn: [
            "1) Sharp production drops → IB, ND, EDS-76",
            "2) Thin eggshell quality → Calcium deficiency, EDS-76",
            "3) Blood spots or shell fractures → Egg binding, Mechanical trauma",
          ],
        ),
        DiagnosisArticleSection(
          titleBn: "✅ ৫. ল্যাব টেস্ট কৌশল (Lab Techniques)ঃ",
          titleEn: "5. Laboratory Techniques:",
          pointsBn: [
            "1) PCR → ভাইরাল রোগ (ND, IB, ILT, EDS) নিশ্চিত করতে",
            "2) Bacterial culture → E. coli, Pasteurella, Salmonella",
            "3) ELISA → আগের ভাইরাস সংক্রমণ শনাক্ত",
            "4) Egg shell quality test → ক্যালসিয়াম বা মিনারেল ঘাটতি পরিমাপ",
          ],
          pointsEn: [
            "1) PCR → Definitive viral confirmation (NDV, IBV, ILT, EDS-76)",
            "2) Bacterial Culture → E. coli, Pasteurella multocida, Salmonella species",
            "3) ELISA → Serological screening for previous viral exposure & titers",
            "4) Eggshell Quality Testing → Measuring shell breaking strength & mineral thickness",
          ],
        ),
        DiagnosisArticleSection(
          titleBn: "✅ ৬. ফার্ম ইতিহাস ও পরিবেশ বিশ্লেষণ (Farm Record & Environment)ঃ",
          titleEn: "6. Farm Record & Environmental Analysis:",
          pointsBn: [
            "•টিকাদান ইতিহাস ঠিক আছে কি না?",
            "•ঘরের পরিবেশ – তাপমাত্রা, আর্দ্রতা, বায়ু চলাচল?",
            "•ফিড পরিবর্তন বা ঘাটতি?",
            "•পানি পরিষ্কার? টক্সিন আছে কি?",
          ],
          pointsEn: [
            "•Complete breeder vaccination log audit?",
            "•House environment parameters – Temperature, humidity, airflow?",
            "•Feed formulation change or nutrient deficiency?",
            "•Drinking water quality & mycotoxin screening?",
          ],
        ),
        DiagnosisArticleSection(
          titleBn: "✅ ৭. চিকিৎসা-ভিত্তিক রোগ শনাক্ত (Therapeutic Diagnosis)ঃ",
          titleEn: "7. Therapeutic Diagnosis:",
          pointsBn: [
            "•কক্সিডিওসিস → Amprolium দিলে উন্নতি?",
            "•CRD → Tylosin বা Doxycycline দিলে ভালো হয়?",
            "•Peritonitis → Broad-spectrum antibiotic দিলে উন্নতি হয়?",
            "•Egg binding → ক্যালসিয়াম/ভিটামিন D3 দিলে উন্নতি?",
          ],
          pointsEn: [
            "•Coccidiosis → Immediate response to Amprolium therapy?",
            "•CRD → Symptomatic relief with Tylosin or Doxycycline?",
            "•Peritonitis → Response to broad-spectrum injectable antibiotics?",
            "•Egg binding → Recovery following oral Calcium & Vitamin-D3 boost?",
          ],
        ),
        DiagnosisArticleSection(
          titleBn: "📋 রোগ নির্ণয়ের জন্য চেকলিস্ট (Breeder-specific Checklist)ঃ",
          titleEn: "📋 Breeder-Specific Diagnostic Checklist:",
          pointsBn: [
            "•ওজন ও ডিম উৎপাদন ঠিক আছে?",
            "•হঠাৎ মৃত্যু ঘটছে কি?",
            "•পায়খানার ধরণ কেমন?",
            "•ডিমের খোলসের অবস্থা?",
            "•চোখ/নাক/গলা থেকে কিছু বের হচ্ছে কি?",
            "•পেট ফোলা/নরম?",
          ],
          pointsEn: [
            "•Is body weight & egg production on target curve?",
            "•Are sudden unexplained deaths occurring?",
            "•Inspect droppings color and consistency",
            "•Inspect hatching eggshell quality & breaking strength",
            "•Check eyes, nostrils & trachea for exudate/discharge",
            "•Examine abdomen for fluid swelling or soft peritonitis mass",
          ],
        ),
      ],
      summaryTitleBn: "✅ মূলকথা:",
      summaryTitleEn: "✅ Diagnostic Key:",
      summaryQuoteBn:
          "কালার প্যারেন্ট স্টকে ডিম উৎপাদন ও ফার্টিলিটি ধরে রাখতে সঠিক বয়সভিত্তিক রোগ শনাক্তকরণ, পোস্টমর্টেম ও ল্যাব ডায়াগনসিস শতভাগ কার্যকর ছানা উৎপাদন নিশ্চিত করে।",
      summaryQuoteEn:
          "Age-specific disease monitoring, necropsy, and lab diagnostics ensure 100% fertile egg hatchability in Color Parent Stock.",
      summarySubBn: "",
      summarySubEn: "",
    ),

    // -------------------------------------------------------------
    // Item 6: Layer Parent Stock (লেয়ার প্যারেন্ট স্টক)
    // -------------------------------------------------------------
    DiseaseDiagnosisItem(
      id: "layer_parent",
      titleBn: "লেয়ার প্যারেন্ট স্টক",
      titleEn: "Layer Parent Stock",
      descBn:
          "LAYER PARENT STOCK:\n🐔 লেয়ার প্যারেন্ট মুরগির রোগ নির্ণয়ের কৌশল (Diagnostic Techniques for Layer Breeder or Parent Stock)...",
      descEn:
          "LAYER PARENT STOCK:\n🐔 Complete diagnostic techniques for Layer Breeder or Parent Stock including age-wise monitoring, necropsy, lab techniques & breeder checklist...",
      imagePath: "assets/layer_parent.jpg",
      introBn:
          "LAYER PARENT STOCK:\n\n🐔 লেয়ার প্যারেন্ট মুরগির রোগ নির্ণয়ের কৌশল (Diagnostic Techniques for Layer Breeder or Parent Stock):\nলেয়ার প্যারেন্ট স্টক থেকে তৈরি লেয়ার বাচ্চা যেন জন্মগত রোগমুক্ত হয়, সেজন্য অত্যন্ত নিখুঁত ডায়াগনসিস প্রয়োজন। নিচে বিস্তারিত আলোচনা দেওয়া হলো:",
      introEn:
          "LAYER PARENT STOCK:\n\n🐔 Diagnostic Techniques for Layer Breeder or Parent Stock:\nPrecision diagnostic protocols ensure commercial layer chicks are born 100% free of vertically transmitted pathogens.",
      sectionHeaderBn: "🔰 লেয়ার প্যারেন্ট স্টকের রোগ নির্ণয়ের ৭টি প্রধান ধাপ ও চেকলিস্ট:",
      sectionHeaderEn: "🔰 7 Diagnostic Steps & Breeder Checklist for Layer Parents:",
      sections: [
        DiagnosisArticleSection(
          titleBn: "✅ ১. রোগের বয়সভিত্তিক পর্যবেক্ষণঃ",
          titleEn: "1. Age-Wise Disease Surveillance:",
          pointsBn: [
            "1) ০–৪ সপ্তাহ → মারেকস, Gumboro (IBD), ND",
            "2) ৫–১৬ সপ্তাহ → CRD, ILT, Fowl Cholera",
            "3) ১৭+ সপ্তাহ (ডিম শুরু) → Egg Peritonitis, Salpingitis, EDS, IB, ND",
          ],
          pointsEn: [
            "1) Weeks 0–4 → Marek's Disease, Gumboro (IBD), Newcastle (ND)",
            "2) Weeks 5–16 → CRD, ILT, Fowl Cholera",
            "3) Weeks 17+ (Onset of Lay) → Egg Peritonitis, Salpingitis, EDS, IB, ND",
          ],
        ),
        DiagnosisArticleSection(
          titleBn: "✅ ২. প্রাথমিক লক্ষণ দেখে রোগ চেনা (Clinical Symptoms)ঃ",
          titleEn: "2. Clinical Symptoms Identification:",
          pointsBn: [
            "1) ডিম কমে যাওয়া → IB, EDS, ND",
            "2) পাতলা বা দাগযুক্ত খোলস → EDS, ক্যালসিয়াম/ভিটামিন-ডি অভাব",
            "3) হাঁচি-কাশি-শ্বাসকষ্ট → CRD, IB, ILT",
            "4) চোখ-নাক দিয়ে পানি → Coryza, CRD",
            "5) হঠাৎ মৃত্যু → cholera, নিউক্যাসল",
            "6) গায়ে জ্বর, ডিম আটকে যাওয়া → Egg peritonitis, Heat stress",
            "7) ডিম্বাশয়ে সমস্যা → Internal laying, Salpingitis",
          ],
          pointsEn: [
            "1) Drop in egg production → IB, EDS-76, Newcastle (ND)",
            "2) Thin or speckled eggshells → EDS, Calcium / Vitamin-D3 deficiency",
            "3) Sneezing, coughing & gasping → CRD, IB, ILT",
            "4) Watery eyes & nasal discharge → Infectious Coryza, CRD",
            "5) Sudden flock mortality → Fowl Cholera, Newcastle Disease",
            "6) High fever & egg binding → Egg Peritonitis, Severe Heat Stress",
            "7) Ovarian follicle lesions → Internal Laying, Salpingitis",
          ],
        ),
        DiagnosisArticleSection(
          titleBn: "✅ ৩. পোস্টমর্টেমে অঙ্গ পর্যবেক্ষণ (Necropsy Findings)ঃ",
          titleEn: "3. Post-Mortem (Necropsy) Organ Inspection:",
          pointsBn: [
            "1) ডিমনালী ফোলা, পুঁজ → Egg peritonitis, Salpingitis",
            "2) যকৃত দাগযুক্ত, বড় → Fowl cholera, Inclusion body hepatitis",
            "3) এয়ারস্যাক ঘোলা/ফেনা → CRD, IB",
            "4) ট্রাকিয়াতে (গলা) রক্ত জমাট → ILT",
            "5) কিডনি বড়, সাদা → IB nephropathogenic strain",
            "6) হৃদপিণ্ড পুরু ঝিল্লি → Ascites, E. coli",
          ],
          pointsEn: [
            "1) Swollen oviduct with purulent exudate → Egg Peritonitis, Salpingitis",
            "2) Enlarged liver with necrotic foci → Fowl Cholera, Inclusion Body Hepatitis (IBH)",
            "3) Cloudy / foamy air sacs → CRD, Infectious Bronchitis (IB)",
            "4) Hemorrhagic trachea with blood clots → Infectious Laryngotracheitis (ILT)",
            "5) Enlarged pale kidneys with urate deposits → Nephropathogenic IB strain",
            "6) Fibrinous pericarditis & thick membranes → Ascites, Colibacillosis (E. coli)",
          ],
        ),
        DiagnosisArticleSection(
          titleBn: "✅ ৪. ডিম উৎপাদন বিশ্লেষণ (Egg Production Monitoring)ঃ",
          titleEn: "4. Hatching Egg Production Monitoring:",
          pointsBn: [
            "1) ডিম কমে যাওয়া → IB, ND, EDS",
            "2) খোলস পাতলা → ক্যালসিয়াম অভাব, EDS",
            "3) ডিমে রক্ত বা খোলস ভেঙে যাওয়া → ডিম আটকে যাওয়া, Trauma",
          ],
          pointsEn: [
            "1) Sharp production drops → IB, ND, EDS-76",
            "2) Thin eggshell quality → Calcium deficiency, EDS-76",
            "3) Blood spots or shell fractures → Egg binding, Mechanical trauma",
          ],
        ),
        DiagnosisArticleSection(
          titleBn: "✅ ৫. ল্যাব টেস্ট কৌশল (Lab Techniques)ঃ",
          titleEn: "5. Laboratory Techniques:",
          pointsBn: [
            "1) PCR → ভাইরাল রোগ (ND, IB, ILT, EDS) নিশ্চিত করতে",
            "2) Bacterial culture → E. coli, Pasteurella, Salmonella",
            "3) ELISA → আগের ভাইরাস সংক্রমণ শনাক্ত",
            "4) Egg shell quality test → ক্যালসিয়াম বা মিনারেল ঘাটতি পরিমাপ",
          ],
          pointsEn: [
            "1) PCR → Definitive viral confirmation (NDV, IBV, ILT, EDS-76)",
            "2) Bacterial Culture → E. coli, Pasteurella multocida, Salmonella species",
            "3) ELISA → Serological screening for previous viral exposure & titers",
            "4) Eggshell Quality Testing → Measuring shell breaking strength & mineral thickness",
          ],
        ),
        DiagnosisArticleSection(
          titleBn: "✅ ৬. ফার্ম ইতিহাস ও পরিবেশ বিশ্লেষণ (Farm Record & Environment)ঃ",
          titleEn: "6. Farm Record & Environmental Analysis:",
          pointsBn: [
            "•টিকাদান ইতিহাস ঠিক আছে কি না?",
            "•ঘরের পরিবেশ – তাপমাত্রা, আর্দ্রতা, বায়ু চলাচল?",
            "•ফিড পরিবর্তন বা ঘাটতি?",
            "•পানি পরিষ্কার? টক্সিন আছে কি?",
          ],
          pointsEn: [
            "•Complete breeder vaccination log audit?",
            "•House environment parameters – Temperature, humidity, airflow?",
            "•Feed formulation change or nutrient deficiency?",
            "•Drinking water quality & mycotoxin screening?",
          ],
        ),
        DiagnosisArticleSection(
          titleBn: "✅ ৭. চিকিৎসা-ভিত্তিক রোগ শনাক্ত (Therapeutic Diagnosis)ঃ",
          titleEn: "7. Therapeutic Diagnosis:",
          pointsBn: [
            "•কক্সিডিওসিস → Amprolium দিলে উন্নতি?",
            "•CRD → Tylosin বা Doxycycline দিলে ভালো হয়?",
            "•Peritonitis → Broad-spectrum antibiotic দিলে উন্নতি হয়?",
            "•Egg binding → ক্যালসিয়াম/ভিটামিন D3 দিলে উন্নতি?",
          ],
          pointsEn: [
            "•Coccidiosis → Immediate response to Amprolium therapy?",
            "•CRD → Symptomatic relief with Tylosin or Doxycycline?",
            "•Peritonitis → Response to broad-spectrum injectable antibiotics?",
            "•Egg binding → Recovery following oral Calcium & Vitamin-D3 boost?",
          ],
        ),
        DiagnosisArticleSection(
          titleBn: "📋 রোগ নির্ণয়ের জন্য চেকলিস্ট (Breeder-specific Checklist)ঃ",
          titleEn: "📋 Breeder-Specific Diagnostic Checklist:",
          pointsBn: [
            "•ওজন ও ডিম উৎপাদন ঠিক আছে?",
            "•হঠাৎ মৃত্যু ঘটছে কি?",
            "•পায়খানার ধরণ কেমন?",
            "•ডিমের খোলসের অবস্থা?",
            "•চোখ/নাক/গলা থেকে কিছু বের হচ্ছে কি?",
            "•পেট ফোলা/নরম?",
          ],
          pointsEn: [
            "•Is body weight & egg production on target curve?",
            "•Are sudden unexplained deaths occurring?",
            "•Inspect droppings color and consistency",
            "•Inspect hatching eggshell quality & breaking strength",
            "•Check eyes, nostrils & trachea for exudate/discharge",
            "•Examine abdomen for fluid swelling or soft peritonitis mass",
          ],
        ),
      ],
      summaryTitleBn: "✅ মূলকথা:",
      summaryTitleEn: "✅ Diagnostic Key:",
      summaryQuoteBn:
          "লেয়ার প্যারেন্ট স্টকে ডিম উৎপাদন ও ফার্টিলিটি ধরে রাখতে সঠিক বয়সভিত্তিক রোগ শনাক্তকরণ, পোস্টমর্টেম ও ল্যাব ডায়াগনসিস শতভাগ সুস্থ লেয়ার বাচ্চা উৎপাদন নিশ্চিত করে।",
      summaryQuoteEn:
          "Age-specific disease monitoring, necropsy, and lab diagnostics ensure 100% healthy commercial layer chick output in Layer Parent Stock.",
      summarySubBn: "",
      summarySubEn: "",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F5F8),
      appBar: AppBar(
        title: Text(
          isEnglish ? "Disease Diagnosis Techniques" : "রোগ নির্ণয় কৌশল",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 19,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF00838F),
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        itemCount: _items.length,
        itemBuilder: (context, index) {
          final item = _items[index];
          return _buildDiagnosisCard(context, item);
        },
      ),
    );
  }

  Widget _buildDiagnosisCard(BuildContext context, DiseaseDiagnosisItem item) {
    return Card(
      elevation: 2,
      shadowColor: Colors.black.withValues(alpha: 0.08),
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => DiseaseDiagnosisArticleDetailScreen(
                item: item,
                isEnglish: isEnglish,
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Circular Image Thumbnail
              Container(
                width: 78,
                height: 78,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFF00838F).withValues(alpha: 0.2),
                    width: 1.5,
                  ),
                ),
                child: ClipOval(
                  child: Image.asset(
                    item.imagePath,
                    width: 78,
                    height: 78,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: const Color(0xFF00838F).withValues(alpha: 0.1),
                      child: const Icon(
                        Icons.medical_services_outlined,
                        color: Color(0xFF00838F),
                        size: 32,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              // Title & Snippet Column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      isEnglish ? item.titleEn : item.titleBn,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black,
                        height: 1.25,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      isEnglish ? item.descEn : item.descBn,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade800,
                        height: 1.35,
                      ),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================================
// Disease Diagnosis Article Detail Screen
// ============================================================================
class DiseaseDiagnosisArticleDetailScreen extends StatelessWidget {
  final DiseaseDiagnosisItem item;
  final bool isEnglish;

  const DiseaseDiagnosisArticleDetailScreen({
    super.key,
    required this.item,
    required this.isEnglish,
  });

  @override
  Widget build(BuildContext context) {
    final title = isEnglish ? item.titleEn : item.titleBn;
    final intro = isEnglish ? item.introEn : item.introBn;
    final sectionHeader =
        isEnglish ? item.sectionHeaderEn : item.sectionHeaderBn;
    final summaryTitle = isEnglish ? item.summaryTitleEn : item.summaryTitleBn;
    final summaryQuote = isEnglish ? item.summaryQuoteEn : item.summaryQuoteBn;
    final summarySub = isEnglish ? item.summarySubEn : item.summarySubBn;

    return Scaffold(
      backgroundColor: const Color(0xFFF2F5F8),
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF00838F),
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            // Top Image Cover Card
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade300, width: 0.8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(bottom: 12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  item.imagePath,
                  width: double.infinity,
                  height: 220,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 140,
                    color: const Color(0xFF00838F).withValues(alpha: 0.1),
                    child: const Icon(
                      Icons.medical_services_outlined,
                      size: 50,
                      color: Color(0xFF00838F),
                    ),
                  ),
                ),
              ),
            ),

            // Article Body Container
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade300, width: 0.8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title Header in Article Body
                  Text(
                    "$title:",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Intro Text Paragraph
                  Text(
                    intro,
                    style: TextStyle(
                      fontSize: 14.5,
                      color: Colors.grey.shade900,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Section Divider Line
                  Container(
                    height: 1,
                    color: Colors.grey.shade400,
                    width: double.infinity,
                  ),
                  const SizedBox(height: 16),

                  // Section Header Title
                  Text(
                    sectionHeader,
                    style: const TextStyle(
                      fontSize: 15.5,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2E7D32),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // List of Article Sections
                  ...item.sections.map((sec) {
                    final secTitle = isEnglish ? sec.titleEn : sec.titleBn;
                    final points = isEnglish ? sec.pointsEn : sec.pointsBn;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Section Title
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              secTitle.startsWith("📌") ||
                                      secTitle.startsWith("🐓") ||
                                      secTitle.startsWith("⚠️") ||
                                      secTitle.startsWith("✅") ||
                                      secTitle.startsWith("🔍") ||
                                      secTitle.startsWith("📋")
                                  ? ""
                                  : "🟢 ",
                              style: const TextStyle(fontSize: 14),
                            ),
                            Expanded(
                              child: Text(
                                secTitle,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: secTitle.startsWith("⚠️")
                                      ? Colors.amber.shade900
                                      : secTitle.startsWith("📌")
                                          ? Colors.red.shade800
                                          : const Color(0xFF2E7D32),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),

                        // Section Points / Callout Lines
                        ...points.map((pt) {
                          final isCallout = pt.startsWith("👉") ||
                              pt.startsWith("🧪") ||
                              pt.startsWith("⚙️") ||
                              pt.startsWith("📌") ||
                              pt.startsWith("✅") ||
                              pt.startsWith("⚠️") ||
                              pt.startsWith("🔍") ||
                              pt.startsWith("📋");
                          final isNumbered = RegExp(r'^\d+[\.\)]').hasMatch(pt);
                          final isHeaderLine = !pt.startsWith("•") &&
                              !pt.startsWith("o") &&
                              !isNumbered &&
                              !isCallout;

                          if (isCallout) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  top: 8, bottom: 4, left: 2),
                              child: Text(
                                pt,
                                style: const TextStyle(
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                            );
                          } else if (isNumbered) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  top: 5, bottom: 5, left: 4),
                              child: Text(
                                pt,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey.shade900,
                                  height: 1.45,
                                ),
                              ),
                            );
                          } else if (isHeaderLine) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  top: 6, bottom: 4, left: 4),
                              child: Text(
                                pt,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey.shade800,
                                ),
                              ),
                            );
                          } else {
                            return Padding(
                              padding: const EdgeInsets.only(
                                bottom: 5,
                                left: 4,
                                right: 4,
                              ),
                              child: Text(
                                pt,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade900,
                                  height: 1.45,
                                ),
                              ),
                            );
                          }
                        }),
                        const SizedBox(height: 14),

                        // Divider after section
                        Container(
                          height: 0.8,
                          color: Colors.grey.shade300,
                          width: double.infinity,
                        ),
                        const SizedBox(height: 14),
                      ],
                    );
                  }),

                  // Summary Box Footer at the bottom
                  const SizedBox(height: 8),
                  Text(
                    summaryTitle,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "👉 ",
                        style: TextStyle(fontSize: 15),
                      ),
                      Expanded(
                        child: Text(
                          summaryQuote,
                          style: const TextStyle(
                            fontSize: 14.5,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (summarySub.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "👉 ",
                          style: TextStyle(fontSize: 15),
                        ),
                        Expanded(
                          child: Text(
                            summarySub,
                            style: TextStyle(
                              fontSize: 13.5,
                              color: Colors.grey.shade800,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
