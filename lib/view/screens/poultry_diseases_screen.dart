import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../controller/riverpod_providers.dart';

class DiseaseArticleSection {
  final String titleBn;
  final String titleEn;
  final List<String> pointsBn;
  final List<String> pointsEn;

  DiseaseArticleSection({
    required this.titleBn,
    required this.titleEn,
    required this.pointsBn,
    required this.pointsEn,
  });
}

class PoultryDiseaseItem {
  final String id;
  final String titleBn;
  final String titleEn;
  final String subtitleEn;
  final String descBn;
  final String descEn;
  final String badgeTag;
  final IconData primaryIcon;
  final IconData secondaryIcon;
  final List<Color> gradientColors;
  final Color badgeColor;
  final String introBn;
  final String introEn;
  final String sectionHeaderBn;
  final String sectionHeaderEn;
  final List<DiseaseArticleSection> sections;
  final String summaryTitleBn;
  final String summaryTitleEn;
  final String summaryQuoteBn;
  final String summaryQuoteEn;
  final String summarySubBn;
  final String summarySubEn;

  PoultryDiseaseItem({
    required this.id,
    required this.titleBn,
    required this.titleEn,
    required this.subtitleEn,
    required this.descBn,
    required this.descEn,
    required this.badgeTag,
    required this.primaryIcon,
    required this.secondaryIcon,
    required this.gradientColors,
    required this.badgeColor,
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

class PoultryDiseasesScreen extends ConsumerWidget {
  final bool isEnglish;

  const PoultryDiseasesScreen({super.key, required this.isEnglish});

  static final List<PoultryDiseaseItem> _items = [
    // -------------------------------------------------------------
    // Item 1: Newcastle Disease (রাণীক্ষেত)
    // -------------------------------------------------------------
    PoultryDiseaseItem(
      id: "newcastle_disease",
      titleBn: "রাণীক্ষেত",
      titleEn: "Newcastle Disease",
      subtitleEn: "NEWCASTLE DISEASE:",
      descBn:
          "NEWCASTLE DISEASE:\nরাণীক্ষেত রোগ (Ranikhet disease) বা নিউক্যাসল ডিজিজ (Newcastle Disease – NDV) হলো পোল্ট্রি শিল্পের সবচেয়ে মারাত্মক অতি-সংক্রামক ভাইরাসজনিত রোগ...",
      descEn:
          "NEWCASTLE DISEASE:\nNewcastle Disease (Ranikhet) is a highly contagious viral disease affecting respiratory, nervous, and digestive systems of poultry...",
      badgeTag: "NDV",
      primaryIcon: Icons.coronavirus_rounded,
      secondaryIcon: Icons.air_rounded,
      gradientColors: [const Color(0xFFD32F2F), const Color(0xFFFF5252)],
      badgeColor: const Color(0xFFB71C1C),
      introBn:
          "NEWCASTLE DISEASE:\n\n🐓 রাণীক্ষেত রোগ (Ranikhet Disease / Newcastle Disease - NDV):\nরাণীক্ষেত রোগ হলো প্যারামিক্সোভাইরাস টাইপ-১ দ্বারা সৃষ্ট মুরগির অত্যন্ত ছোঁয়াচে ও মরণঘাতী ভাইরাসজনিত রোগ। এটি দ্রুত গতিতে পুরো শেডে ছড়িয়ে পড়ে এবং মৃত্যুহার ৯০–১০০% পর্যন্ত হতে পারে।",
      introEn:
          "NEWCASTLE DISEASE:\n\n🐓 Newcastle Disease (Ranikhet Disease - NDV):\nNewcastle disease is an acute, highly contagious viral infection of poultry caused by Avian Paramyxovirus-1 (APMV-1), causing devastating respiratory distress and neurological paralysis.",
      sectionHeaderBn: "🔰 রানীক্ষেত রোগের পূর্ণাঙ্গ তথ্য গাইড:",
      sectionHeaderEn: "🔰 Newcastle Disease Complete Guide:",
      sections: [
        DiseaseArticleSection(
          titleBn: "১. রোগের কারণ ও জীবাণু:",
          titleEn: "1. Etiology & Pathogen:",
          pointsBn: [
            "•রোগের কারণ: Avian Paramyxovirus Type 1 (APMV-1)।",
            "•সংক্রমণ মাধ্যম: দূষিত বাতাস, খাদ্য, পানি, পোশাক, যানবাহন ও আক্রান্ত পাখির ড্রপিংস।",
            "•ইনকিউবেশন পিরিয়ড: ২ থেকে ১৫ দিন (গড়ে ৪–৬ দিন)।",
          ],
          pointsEn: [
            "•Causative Agent: Avian Paramyxovirus Type 1 (APMV-1).",
            "•Transmission: Airborne aerosol, contaminated feed, water, wild birds & fomites.",
            "•Incubation Period: 2 to 15 days (Average 4-6 days).",
          ],
        ),
        DiseaseArticleSection(
          titleBn: "২. রোগের লক্ষণ সমূহ (Symptoms):",
          titleEn: "2. Clinical Symptoms:",
          pointsBn: [
            "•শ্বাসপ্রশ্বাসে গডগড শব্দ, হাঁচি, কাশি ও হা করে শ্বাস নেওয়া।",
            "•ঘাড় বাঁকা হয়ে যাওয়া, চক্কর খাওয়া বা পা পক্ষাঘাতগ্রস্ত হওয়া (স্নায়বিক লক্ষণ)।",
            "•সবুজ রঙের পাতলা পায়খানা (Greenish watery diarrhea)।",
            "•চোখ-মুখ ফোলা ও ঝুলন্ত ডানার দুর্বলতা।",
            "•লেয়ার মুরগিতে হঠাৎ ৮০–৯০% ডিম উৎপাদন ধস নেওয়া।",
          ],
          pointsEn: [
            "•Gasping, coughing, sneezing & distinct tracheal rales.",
            "•Twisted neck (Torticollis), tremors, and leg/wing paralysis.",
            "•Profuse bright green watery diarrhea.",
            "•Facial edema and drooping wings.",
            "•Sudden catastrophic 80-90% drop in egg production.",
          ],
        ),
        DiseaseArticleSection(
          titleBn: "৩. পোস্টমর্টেম চিহ্ন (Lesions):",
          titleEn: "3. Post-Mortem Lesions:",
          pointsBn: [
            "•প্রোভেন্ট্রিকুলাসের টিপে পিনপয়েন্ট রক্তক্ষরণ (Pinpoint hemorrhages on proventriculus).",
            "•সিকাল টনসিলে রক্তক্ষরণ ও ক্ষত।",
            "•শ্বাসনালীতে অতিরিক্ত কফ ও রক্তাভ মিউকাস।",
          ],
          pointsEn: [
            "•Pinpoint hemorrhages at the tips of proventricular papillae.",
            "•Hemorrhagic ulcerations in cecal tonsils and Peyer's patches.",
            "•Severe tracheal congestion filled with catarrhal exudate.",
          ],
        ),
        DiseaseArticleSection(
          titleBn: "৪. প্রতিরোধ ও চিকিৎসা:",
          titleEn: "4. Prevention & Control:",
          pointsBn: [
            "•ভাইরাসজনিত রোগ হওয়ায় সরাসরি কোনো কার্যকরী অ্যান্টিবায়োটিক চিকিৎসা নেই।",
            "•নিয়মিত সময়সূচি মেনে লাইভ (B1, LaSota) ও কিল্ড ভ্যাকসিন প্রয়োগ করা।",
            "•সেকেন্ডারি ব্যাকটেরিয়াল ইনফেকশন রোধে ব্রডস্পেকট্রাম অ্যান্টিবায়োটিক ও ইলেক্ট্রোলাইট দেওয়া।",
          ],
          pointsEn: [
            "•No direct curative antiviral therapy exists.",
            "•Strict adherence to live (B1, LaSota) and oil-adjuvanted killed vaccines.",
            "•Supportive care with electrolytes, Vitamin C, and broad-spectrum antibiotics to curb secondary infections.",
          ],
        ),
      ],
      summaryTitleBn: "✅ মূলকথা:",
      summaryTitleEn: "✅ Key Takeaway:",
      summaryQuoteBn:
          "রাণীক্ষেত রোগ প্রতিরোধের একমাত্র হাতিয়ার হলো সঠিক কোল্ড চেইনে সময়মতো ভ্যাকসিন দেওয়া এবং জৈব-নিরাপত্তা জোরদার করা।",
      summaryQuoteEn:
          "Timely vaccination under proper cold chain combined with strict biosecurity is the only defense against Newcastle Disease.",
      summarySubBn: "",
      summarySubEn: "",
    ),

    // -------------------------------------------------------------
    // Item 2: Infectious Bronchitis (ব্রংকাইটিস)
    // -------------------------------------------------------------
    PoultryDiseaseItem(
      id: "bronchitis",
      titleBn: "ব্রংকাইটিস",
      titleEn: "Infectious Bronchitis",
      subtitleEn: "BRONCHITIS:",
      descBn:
          "BRONCHITIS:\nমুরগীর ব্রংকাইটিস (Infectious Bronchitis – IB) হলো একটি অতি-সংক্রামক ভাইরাসজনিত রোগ, যা Coronavirus পরিবারের অংশ...",
      descEn:
          "BRONCHITIS:\nInfectious Bronchitis (IB) is an acute, highly contagious coronavirus infection affecting respiratory, kidney, and reproductive tracts...",
      badgeTag: "IBV",
      primaryIcon: Icons.air_rounded,
      secondaryIcon: Icons.medication_rounded,
      gradientColors: [const Color(0xFFE65100), const Color(0xFFFF9800)],
      badgeColor: const Color(0xFFEF6C00),
      introBn:
          "BRONCHITIS:\n\n🐓 ইনফেকশাস ব্রংকাইটিস (Infectious Bronchitis - IB):\nইনফেকশাস ব্রংকাইটিস হলো করোনাভাইরাস দ্বারা সৃষ্ট মুরগির তীব্র শ্বাসনালী, কিডনি ও প্রজননতন্ত্রের মারাত্মক সংক্রামক রোগ। কম বয়সী বাচ্চাতে শ্বাসকষ্ট এবং লেয়ার মুরগিতে অমসৃণ ডিম ও খোসার বিকৃতি ঘটায়।",
      introEn:
          "BRONCHITIS:\n\n🐓 Infectious Bronchitis (IB):\nInfectious Bronchitis is a rapidly spreading Gammacoronavirus infection targeting the avian respiratory system, kidneys (Nephropathogenic strains), and female reproductive tract.",
      sectionHeaderBn: "🔰 ইনফেকশাস ব্রংকাইটিস রোগ নির্দেশিকা:",
      sectionHeaderEn: "🔰 Infectious Bronchitis Complete Protocol:",
      sections: [
        DiseaseArticleSection(
          titleBn: "১. লক্ষণ সমূহ:",
          titleEn: "1. Clinical Symptoms:",
          pointsBn: [
            "•হাঁচি, কাশি, নাক দিয়ে পানি ও শ্বাস নিতে কষ্ট হওয়া।",
            "•বাচ্চা মুরগির ব্রুডারে তাপের কাছে দলা পাকিয়ে বসে থাকা।",
            "•লেয়ার মুরগির ডিমের খোসা পাতলা, অমসৃণ, আঁকাবাঁকা ও কুঁচকানো হওয়া।",
            "•ডিমের ভেতরের অ্যালবুমিন (সাদা অংশ) পানির মতো পাতলা হয়ে যাওয়া।",
            "•কিডনি স্ট্রেইনে অতিরিক্ত পানি পান করা ও ভেজা ড্রপিংস।",
          ],
          pointsEn: [
            "•Snicking, coughing, tracheal rales, and wet eyes.",
            "•Chicks huddling under brooder heaters with severe gasping.",
            "•Misshapen, thin-shelled, rough, or soft-shelled eggs in laying hens.",
            "•Watery, thin egg albumen quality loss.",
            "•Excessive water consumption and watery diarrhea (Nephropathogenic IB).",
          ],
        ),
        DiseaseArticleSection(
          titleBn: "২. পোস্টমর্টেম ও চিকিৎসা:",
          titleEn: "2. Post-Mortem & Control:",
          pointsBn: [
            "•শ্বাসনালী ও ব্রংকাসে শ্লেষ্মা বা পনিরের মতো জমাট বস্তু।",
            "•কিডনি বড়, ফ্যাকাশে ও ইউরেট ক্রিস্টাল জমা (Gout)।",
            "•প্রতিরোধে H120, Ma5 ও IB-Killed ভ্যাকসিন নিয়মিত প্রয়োগ করা।",
          ],
          pointsEn: [
            "•Serous or caseous exudate in lower trachea and bronchi plugs.",
            "•Swollen, pale kidneys with white urate crystal deposits (Visceral Gout).",
            "•Vaccinate regularly using H120, Ma5 live strains and booster killed vaccines.",
          ],
        ),
      ],
      summaryTitleBn: "✅ মূলকথা:",
      summaryTitleEn: "✅ Key Takeaway:",
      summaryQuoteBn:
          "আইবি ভ্যাকসিন সঠিকভাবে দিলে ডিমের খোসার মান নষ্ট হওয়া ও ব্রংকাইটিসের ক্ষতি থেকে খামার রক্ষা পায়।",
      summaryQuoteEn:
          "Proper IB vaccination prevents eggshell deformities and guards young chicks against respiratory loss.",
      summarySubBn: "",
      summarySubEn: "",
    ),

    // -------------------------------------------------------------
    // Item 3: Gumboro Disease (গামবোরো রোগ)
    // -------------------------------------------------------------
    PoultryDiseaseItem(
      id: "gumboro",
      titleBn: "গামবোরো রোগ",
      titleEn: "Gumboro Disease",
      subtitleEn: "GUMBORO:",
      descBn:
          "GUMBORO:\nমুরগীর গামবোরো রোগ (Gumboro Disease / Infectious Bursal Disease – IBD) হলো একটি ভয়াবহ সংক্রামক ভাইরাসজনিত রোগ যা মুরগির ইমিউন সিস্টেম ধ্বংস করে...",
      descEn:
          "GUMBORO:\nInfectious Bursal Disease (IBD / Gumboro) attacks the Bursa of Fabricius, destroying young chicks' immune response capability...",
      badgeTag: "IBD",
      primaryIcon: Icons.shield_outlined,
      secondaryIcon: Icons.science_rounded,
      gradientColors: [const Color(0xFF7B1FA2), const Color(0xFFE040FB)],
      badgeColor: const Color(0xFF6A1B9A),
      introBn:
          "GUMBORO:\n\n🐓 গামবোরো রোগ (Gumboro Disease / IBD):\nগামবোরো হলো বার্নাবাইরাস (Birnavirus) দ্বারা সৃষ্ট ৩–৬ সপ্তাহ বয়সী মুরগির প্রধান ইমিউনোসাপ্রেসিভ রোগ। এটি মুরগির ইমিউন অঙ্গ 'ফ্যাব্রিসিয়াস বার্সা' ধ্বংস করে ফেলে, ফলে অন্য যেকোনো রোগে মুরগি সহজে মারা যায়।",
      introEn:
          "GUMBORO:\n\n🐓 Infectious Bursal Disease (IBD / Gumboro):\nGumboro disease is a viral infection targeting young chickens (3-6 weeks of age), selectively destroying B-lymphocytes in the Bursa of Fabricius and causing severe immunosuppression.",
      sectionHeaderBn: "🔰 গামবোরো রোগের লক্ষণ ও পোস্টমর্টেম চিহ্ন:",
      sectionHeaderEn: "🔰 Gumboro Clinical Symptoms & Autopsy:",
      sections: [
        DiseaseArticleSection(
          titleBn: "১. প্রধান লক্ষণসমূহ:",
          titleEn: "1. Main Clinical Symptoms:",
          pointsBn: [
            "•হঠাৎ মৃত্যুহার বৃদ্ধি (৩-৬ সপ্তাহ বয়সে চড়া স্লাইক)।",
            "•সাদা চুনের মতো পাতলা পায়খানা এবং মলদ্বারের পালক নোংরা হওয়া।",
            "•মুরগি কাঁপা, বিষণ্ন হয়ে পালক ফুলিয়ে বসে থাকা।",
            "•শরীর পানিশূন্য (Dehydrated) হয়ে যাওয়া ও পা শুকিয়ে যাওয়া।",
          ],
          pointsEn: [
            "•Sudden spike in mortality in 3 to 6-week-old birds.",
            "•White, watery, chalky diarrhea with soiled vent feathers.",
            "•Severe depression, trembling, and huddling.",
            "•Dehydration with shriveled leg muscles.",
          ],
        ),
        DiseaseArticleSection(
          titleBn: "২. পোস্টমর্টেম পরীক্ষা:",
          titleEn: "2. Post-Mortem Findings:",
          pointsBn: [
            "•ফ্যাব্রিসিয়াস বার্সা ফুলে দ্বিগুণ হওয়া, পরবর্তীতে রক্তক্ষরণ ও কাঁচের মতো তরল থাকা।",
            "•উরুর মাংসপেশি (Thigh muscle) ও বুকের মাংসে ডোরাকাটা স্ট্রাইপ রক্তক্ষরণ।",
            "•প্রতিরোধে ৭–১১ দিন ও ১৬–১৮ দিনে সময়মতো গামবোরো ইন্টারমিডিয়েট প্লাস ভ্যাকসিন দেওয়া।",
          ],
          pointsEn: [
            "•Enlarged, edematous, or hemorrhagic Bursa of Fabricius.",
            "•Petecchial hemorrhages on thigh and breast muscles.",
            "•Administer Intermediate Plus IBD vaccine at 7-11 days and 16-18 days.",
          ],
        ),
      ],
      summaryTitleBn: "✅ মূলকথা:",
      summaryTitleEn: "✅ Key Takeaway:",
      summaryQuoteBn:
          "গামবোরো ইমিউন সিস্টেম ধ্বংস করে, তাই সময়মতো ইন্টারমিডিয়েট প্লাস ভ্যাকসিন দেওয়া অত্যন্ত জরুরি।",
      summaryQuoteEn:
          "Gumboro destroys immune defense; timely intermediate plus vaccination is non-negotiable.",
      summarySubBn: "",
      summarySubEn: "",
    ),

    // -------------------------------------------------------------
    // Item 4: Coccidiosis (কক্সিডিওসিস রোগ)
    // -------------------------------------------------------------
    PoultryDiseaseItem(
      id: "coccidiosis",
      titleBn: "কক্সিডিওসিস রোগ",
      titleEn: "Coccidiosis",
      subtitleEn: "COCCIDIOSIS:",
      descBn:
          "COCCIDIOSIS:\nমুরগীর কক্সিডিওসিস (Coccidiosis) হলো একটি প্রোটোজোয়া সংক্রমণ, যা Eimeria প্রজাতির পরজীবী দ্বারা অন্ত্রের টিস্যু ধ্বংস করে...",
      descEn:
          "COCCIDIOSIS:\nCoccidiosis is a protozoan intestinal disease caused by Eimeria species leading to bloody diarrhea and nutrient malabsorption...",
      badgeTag: "COC",
      primaryIcon: Icons.water_drop_rounded,
      secondaryIcon: Icons.bug_report_rounded,
      gradientColors: [const Color(0xFF900C3F), const Color(0xFFC70039)],
      badgeColor: const Color(0xFF72092C),
      introBn:
          "COCCIDIOSIS:\n\n🐓 কক্সিডিওসিস বা রক্তআমশয় (Coccidiosis):\nকক্সিডিওসিস হলো এইমেরিয়া (Eimeria) নামক এককোষী পরজীবী দ্বারা সৃষ্ট মুরগির পরিপাকতন্ত্রের সংক্রামক রোগ। ভেজা লিটার ও স্যাঁতসেঁতে পরিবেশে এর স্পোর দ্রুত ছড়ায় এবং অন্ত্রের ভেতরের চামড়া ছিলে রক্তপাত ঘটায়।",
      introEn:
          "COCCIDIOSIS:\n\n🐓 Avian Coccidiosis:\nCoccidiosis is an intestinal protozoal disease caused by Eimeria species (E. tenella, E. necatrix, E. acervulina), causing bloody diarrhea and intestinal lining destruction.",
      sectionHeaderBn: "🔰 কক্সিডিওসিস রোগ পর্যবেক্ষণ ও চিকিৎসা:",
      sectionHeaderEn: "🔰 Coccidiosis Diagnosis & Treatment:",
      sections: [
        DiseaseArticleSection(
          titleBn: "১. লক্ষণ ও ধরণ:",
          titleEn: "1. Types & Symptoms:",
          pointsBn: [
            "•রক্ত আমশয় বা খয়েরি/চকলেটি রঙের পাতলা পায়খানা।",
            "•পাখি ফ্যাকাসে হওয়া, ওজন না বাড়া ও রক্তস্বল্পতা।",
            "•সিকাল কক্সিডিওসিস (Eimeria tenella): অন্ধঅন্ত্র বা সিকামে তাজা রক্ত জমাট থাকা।",
            "•অন্ত্রের কক্সিডিওসিস (Eimeria necatrix): ক্ষুদ্রান্ত্রে সাদা-লাল ছোপ ছোপ দাগ।",
          ],
          pointsEn: [
            "•Bloody droppings or chocolate-brown slimy diarrhea.",
            "•Severe anemia, pale comb/wattles, and weight loss.",
            "•Cecal Coccidiosis (E. tenella): Caeca distended with fresh clotted blood.",
            "•Intestinal Coccidiosis (E. necatrix): White & red petechial spots along small intestine.",
          ],
        ),
        DiseaseArticleSection(
          titleBn: "২. চিকিৎসা ও প্রতিরোধ:",
          titleEn: "2. Treatment & Prevention:",
          pointsBn: [
            "•চিকিৎসা: এম্প্রোলিয়াম (Amprolium), সালফাডিন বা টল্ট্রাজুরিল (Toltrazuril) প্রয়োগ।",
            "•প্রতিরোধ: লিটার শুকনো রাখা, নিয়মিত র্যাকিং করা এবং কক্সিডিওস্ট্যাট ব্যবহার।",
          ],
          pointsEn: [
            "•Medication: Amprolium, Sulfadimidine, or Toltrazuril solution.",
            "•Prevention: Keep litter dry, stir daily, and use anticoccidial feed additives.",
          ],
        ),
      ],
      summaryTitleBn: "✅ মূলকথা:",
      summaryTitleEn: "✅ Key Takeaway:",
      summaryQuoteBn:
          "শুকনো লিটার ব্যবস্থাপনা কক্সিডিওসিস প্রতিরোধের সবচেয়ে কার্যকর এবং সস্তা উপায়।",
      summaryQuoteEn:
          "Dry litter management is the single most effective and cheapest preventative for Coccidiosis.",
      summarySubBn: "",
      summarySubEn: "",
    ),

    // -------------------------------------------------------------
    // Item 5: Salmonellosis (সালমোনেলা রোগ)
    // -------------------------------------------------------------
    PoultryDiseaseItem(
      id: "salmonellosis",
      titleBn: "সালমোনেলা রোগ",
      titleEn: "Salmonellosis",
      subtitleEn: "SALMONELLOSIS:",
      descBn:
          "SALMONELLOSIS:\nমুরগীর সালমোনেলা রোগ (Salmonellosis) হলো একটি ব্যাকটেরিয়াল রোগ, যা Salmonella Pullorum/Gallinarum দ্বারা সৃষ্ট...",
      descEn:
          "SALMONELLOSIS:\nSalmonellosis encompasses Pullorum Disease, Fowl Typhoid, and Paratyphoid caused by Salmonella bacterial pathogens...",
      badgeTag: "SAL",
      primaryIcon: Icons.biotech_rounded,
      secondaryIcon: Icons.sanitizer_rounded,
      gradientColors: [const Color(0xFF4E342E), const Color(0xFF8D6E63)],
      badgeColor: const Color(0xFF3E2723),
      introBn:
          "SALMONELLOSIS:\n\n🐓 সালমোনেলা রোগ (Pullorum / Fowl Typhoid / Paratyphoid):\nসালমোনেলা হলো ব্যাকটেরিয়াজনিত সংক্রামক রোগ যা ছানার পুলোরাম, প্রাপ্তবয়স্ক মুরগির ফাউল টাইফয়েড ও প্যারাটাইফয়েড সৃষ্টি করে। এটি মা-মুরগি থেকে ডিমে ছড়ায় (Vertical Transmission)।",
      introEn:
          "SALMONELLOSIS:\n\n🐓 Avian Salmonellosis:\nSalmonella infections in poultry include Pullorum disease (S. pullorum), Fowl Typhoid (S. gallinarum), and Paratyphoid (S. enteritidis/typhimurium), affecting hatchability and causing high chick mortality.",
      sectionHeaderBn: "🔰 সালমোনেলা ডায়াগনসিস ও প্রতিকার:",
      sectionHeaderEn: "🔰 Salmonellosis Diagnosis & Control:",
      sections: [
        DiseaseArticleSection(
          titleBn: "১. লক্ষণ ও প্যাথলজি:",
          titleEn: "1. Symptoms & Pathology:",
          pointsBn: [
            "•বাচ্চাতে সাদা খকখকে পায়খানা (Pullorum / White Diarrhea)।",
            "•প্রাপ্তবয়স্ক পাখির যকৃতে তামাটে বা সবুজ ব্রোঞ্জ রঙ (Bronze liver in Fowl Typhoid)।",
            "•ডিম্বাশয়ের কুসুম বিকৃত, কালো ও পচে যাওয়া।",
          ],
          pointsEn: [
            "•Chicks exhibiting sticky white diarrhea around vent (White Diarrhea).",
            "•Enlarged greenish-bronze liver in adult birds (Fowl Typhoid).",
            "•Misshapen, discolored, pedunculated ovarian follicles.",
          ],
        ),
        DiseaseArticleSection(
          titleBn: "২. প্রতিরোধ ও চিকিৎসা:",
          titleEn: "2. Treatment & Control:",
          pointsBn: [
            "•সিরোলোজি টেস্ট (Blood Agglutination) করে পজিটিভ ব্রুড সরাতে হবে।",
            "•অ্যান্টিবায়োটিক (যেমন: সিপ্রোফ্লোক্সাসিন, কোলিস্টিন, ট্রাইমেথোপ্রিম) ব্যবহার।",
          ],
          pointsEn: [
            "•Perform blood plate agglutination test to eliminate positive carrier breeders.",
            "•Administer effective antibiotics (Ciprofloxacin, Colistin, Trimethoprim-Sulfa).",
          ],
        ),
      ],
      summaryTitleBn: "✅ মূলকথা:",
      summaryTitleEn: "✅ Key Takeaway:",
      summaryQuoteBn:
          "প্যারেন্ট স্টকে ব্লাড টেস্ট করে সালমোনেলা ক্যারিয়ার মুরগি ছাঁটাই করা সবচেয়ে জরুরি।",
      summaryQuoteEn:
          "Blood testing and culling carrier breeder hens is vital to stop vertical Salmonella transmission.",
      summarySubBn: "",
      summarySubEn: "",
    ),

    // -------------------------------------------------------------
    // Item 6: Infectious Coryza (করাইজা রোগ)
    // -------------------------------------------------------------
    PoultryDiseaseItem(
      id: "coryza",
      titleBn: "করাইজা রোগ",
      titleEn: "Infectious Coryza",
      subtitleEn: "CORYZA:",
      descBn:
          "CORYZA:\nমুরগীর Coryza (করাইজা) রোগ হলো একটি তীব্র ব্যাকটেরিয়াজনিত সংক্রামক ঊর্ধ্ব-শ্বাসনালীর রোগ, যা Avibacterium paragallinarum দ্বারা হয়...",
      descEn:
          "CORYZA:\nInfectious Coryza is an acute bacterial upper respiratory disease caused by Avibacterium paragallinarum with characteristic facial edema...",
      badgeTag: "COR",
      primaryIcon: Icons.face_rounded,
      secondaryIcon: Icons.masks_rounded,
      gradientColors: [const Color(0xFF1565C0), const Color(0xFF0288D1)],
      badgeColor: const Color(0xFF0D47A1),
      introBn:
          "CORYZA:\n\n🐓 করাইজা রোগ (Infectious Coryza):\nকরাইজা হলো এভিব্যাকটেরিয়াম প্যারাগ্যালিনেরাম (Avibacterium paragallinarum) দ্বারা সৃষ্ট মুরগির অত্যন্ত ছোঁয়াচে ব্যাকটেরিয়াজনিত রোগ। এতে চোখ-মুখ অতিরিক্ত ফুলে যায় ও মুখ থেকে প্রচণ্ড দুর্গন্ধ বের হয়।",
      introEn:
          "CORYZA:\n\n🐓 Infectious Coryza:\nInfectious Coryza is an acute bacterial respiratory disease characterized by nasal discharge, sneezing, and severe facial edema in growing and laying birds.",
      sectionHeaderBn: "🔰 করাইজা রোগের লক্ষণ ও চিকিৎসা:",
      sectionHeaderEn: "🔰 Infectious Coryza Protocol:",
      sections: [
        DiseaseArticleSection(
          titleBn: "১. প্রধান লক্ষণসমূহ:",
          titleEn: "1. Clinical Signs:",
          pointsBn: [
            "•চোখ ও মুখের চারপাশ চরমভাবে ফুলে ওঠা (Facial Swelling)।",
            "•নাক ও চোখ দিয়ে ঘন, আঠালো ও দুর্গন্ধযুক্ত তরল ঝরা।",
            "•চোখ পিচুটি দিয়ে আটকে যাওয়া ও অন্ধ হয়ে যাওয়া।",
            "•লেয়ার মুরগিতে ১০-৪০% ডিম উৎপাদন কমে যাওয়া।",
          ],
          pointsEn: [
            "•Severe edema and swelling of facial tissue and wattles.",
            "•Foul-smelling, thick, sticky oculonasal discharge.",
            "•Eyelids glued shut with cheesy exudate.",
            "•10-40% drop in egg production in laying flocks.",
          ],
        ),
        DiseaseArticleSection(
          titleBn: "২. চিকিৎসা ও প্রতিরোধ:",
          titleEn: "2. Treatment & Control:",
          pointsBn: [
            "•চিকিৎসা: সালফোনামাইড, টাইলোসিন, ডক্সিসাইক্লিন বা সিপ্রোফ্লোক্সাসিন প্রয়োগ।",
            "•প্রতিরোধ: মুরগির শেডে বায়ু চলাচল ঠিক রাখা ও নিয়মিত করাইজা ভ্যাকসিন প্রদান।",
          ],
          pointsEn: [
            "•Medication: Sulfonamides, Tylosin, Doxycycline, or Ciprofloxacin.",
            "•Prevention: Ensure good shed ventilation and routine Coryza vaccination.",
          ],
        ),
      ],
      summaryTitleBn: "✅ মূলকথা:",
      summaryTitleEn: "✅ Key Takeaway:",
      summaryQuoteBn:
          "শেডে পর্যাপ্ত বাতাস চলাচল নিশ্চিত করলে এবং করাইজা ভ্যাকসিন দিলে মুখ ফোলা রোগ থেকে রেহাই মেলে।",
      summaryQuoteEn:
          "Adequate air ventilation combined with Coryza vaccination prevents facial edema outbreaks.",
      summarySubBn: "",
      summarySubEn: "",
    ),

    // -------------------------------------------------------------
    // Item 7: Fowl Cholera (কলেরা রোগ)
    // -------------------------------------------------------------
    PoultryDiseaseItem(
      id: "fowl_cholera",
      titleBn: "কলেরা রোগ",
      titleEn: "Fowl Cholera",
      subtitleEn: "CHOLERA:",
      descBn:
          "CHOLERA:\nমুরগীর cholera রোগ (Fowl Cholera) হলো একটি মারাত্মক ব্যাকটেরিয়াল সংক্রমণ, যা Pasteurella multocida দ্বারা সৃষ্ট...",
      descEn:
          "CHOLERA:\nFowl Cholera is a contagious bacterial disease caused by Pasteurella multocida occurring in acute septicemic or chronic forms...",
      badgeTag: "FC",
      primaryIcon: Icons.local_hospital_rounded,
      secondaryIcon: Icons.warning_amber_rounded,
      gradientColors: [const Color(0xFF1A237E), const Color(0xFF3949AB)],
      badgeColor: const Color(0xFF0D47A1),
      introBn:
          "CHOLERA:\n\n🐓 ফাউল cholera (Fowl Cholera):\nফাউল cholera হলো পেস্টুরেল্লা মাল্টোসিডা (Pasteurella multocida) নামক ব্যাকটেরিয়া দ্বারা সৃষ্ট প্রৌঢ় ও বয়স্ক মুরগির মারাত্মক সংক্রামক রোগ। এটি তীব্র সেপ্টিকসেমিয়া তৈরি করে হঠাৎ মৃত্যু ঘটায়।",
      introEn:
          "CHOLERA:\n\n🐓 Fowl Cholera:\nFowl Cholera is a severe contagious bacterial infection caused by Pasteurella multocida affecting mature poultry, leading to high acute mortality and cyanosis.",
      sectionHeaderBn: "🔰 ফাউল cholera গাইডলাইন:",
      sectionHeaderEn: "🔰 Fowl Cholera Guidelines:",
      sections: [
        DiseaseArticleSection(
          titleBn: "১. লক্ষণ ও পোস্টমর্টেম:",
          titleEn: "1. Symptoms & Necropsy:",
          pointsBn: [
            "•ঝুঁটি ও ফুল গাঢ় বেগুনি বা নীল রঙ ধারণ করা (Cyanosis)।",
            "•সবুজ বা হলুদ রঙের পেটের ড্রপিংস।",
            "•কলিজায় অসংখ্য পিনপয়েন্ট সাদা মরা টিস্যুর দাগ (Necrotic foci on liver)。",
          ],
          pointsEn: [
            "•Cyanotic dark purple comb and wattles.",
            "•Profuse green or yellow diarrhea.",
            "•Multifocal pinpoint white necrotic spots across liver surface.",
          ],
        ),
        DiseaseArticleSection(
          titleBn: "২. চিকিৎসা ও প্রতিরোধ:",
          titleEn: "2. Treatment & Control:",
          pointsBn: [
            "•চিকিৎসা: অক্সিটেট্রাসাইক্লিন, পেনিসিলিন, ট্রাইমেথোপ্রিম-সালফা প্রয়োগ।",
            "•প্রতিরোধ: ৬ ও ১০ সপ্তাহে ফাউল cholera ভ্যাকসিন প্রদান করা।",
          ],
          pointsEn: [
            "•Medication: Oxytetracycline, Penicillin, or Trimethoprim-Sulfamethoxazole.",
            "•Prevention: Administer Fowl Cholera bacterin vaccine at 6 & 10 weeks of age.",
          ],
        ),
      ],
      summaryTitleBn: "✅ মূলকথা:",
      summaryTitleEn: "✅ Key Takeaway:",
      summaryQuoteBn:
          "বয়স্ক লেয়ার ও ব্রিডার ফার্মে ৬ ও ১০ সপ্তাহে ফাউল cholera ভ্যাকসিন দেওয়া আবশ্যক।",
      summaryQuoteEn:
          "Fowl Cholera bacterin vaccination at 6 & 10 weeks is essential for layer and breeder flocks.",
      summarySubBn: "",
      summarySubEn: "",
    ),

    // -------------------------------------------------------------
    // Item 8: Chicken Anemia Virus (চিকেন অ্যানিমিয়া ভাইরাস - CAV)
    // -------------------------------------------------------------
    PoultryDiseaseItem(
      id: "cav_disease",
      titleBn: "চিকেন অ্যানিমিয়া ভাইরাস",
      titleEn: "Chicken Anemia Virus (CAV)",
      subtitleEn: "CHICKEN ANEMIA VIRUS (CAV):",
      descBn:
          "CHICKEN ANEMIA VIRUS (CAV):\nচিকেন অ্যানিমিয়া ভাইরাস (Chicken Anemia Virus - CAV) একটি DNA ভাইরাস, যা Gyrovirus গোত্রের অংশ এবং ছানাতে রক্তস্বল্পতা ও ইমিউন ধস ঘটায়...",
      descEn:
          "CHICKEN ANEMIA VIRUS (CAV):\nCAV causes severe anemia, aplastic bone marrow, and immunosuppression in young chicks transferred vertically from non-immune breeders...",
      badgeTag: "CAV",
      primaryIcon: Icons.opacity_rounded,
      secondaryIcon: Icons.healing_rounded,
      gradientColors: [const Color(0xFF880E4F), const Color(0xFFD81B60)],
      badgeColor: const Color(0xFF4A0000),
      introBn:
          "CHICKEN ANEMIA VIRUS (CAV):\n\n🐓 চিকেন অ্যানিমিয়া ভাইরাস (CAV):\nচিকেন অ্যানিমিয়া ভাইরাস হলো গায়রোভাইরাস দ্বারা সৃষ্ট কচি বাচ্চার মারাত্মক ইমিউনোসাপ্রেসিভ ও রক্তস্বল্পতাজনিত রোগ। এটি অস্থিমজ্জা (Bone marrow) ও থাইমাস ধ্বংস করে ছানাকে ফ্যাকাশে করে দেয়।",
      introEn:
          "CHICKEN ANEMIA VIRUS (CAV):\n\n🐓 Chicken Anemia Virus (CAV):\nCAV is an immunosuppressive viral disease of young chicks causing severe anemia, subcutaneous hemorrhages, and atrophy of bone marrow and lymphoid tissues.",
      sectionHeaderBn: "🔰 সিএভি রোগ ডায়াগনসিস ও প্রতিরোধ:",
      sectionHeaderEn: "🔰 CAV Diagnosis & Prevention:",
      sections: [
        DiseaseArticleSection(
          titleBn: "১. প্রধান লক্ষণসমূহ:",
          titleEn: "1. Clinical Features:",
          pointsBn: [
            "•বাচ্চা চরম ফ্যাকাশে ও রক্তস্বল্পতায় ভোগা।",
            "•চামড়ার নিচে ও ডানায় নীলচে-লাল রক্তক্ষরণ (Blue wing disease)।",
            "•অস্থিমজ্জা (Bone marrow) লাল রঙের বদলে হলুদ হয়ে যাওয়া।",
          ],
          pointsEn: [
            "•Severe pallor of comb, wattles, and eyelids due to aplastic anemia.",
            "•Subcutaneous hemorrhages and blue discoloration of wing skin (Blue Wing Disease).",
            "•Pale yellow fatty bone marrow instead of healthy red marrow.",
          ],
        ),
        DiseaseArticleSection(
          titleBn: "২. প্রতিরোধ:",
          titleEn: "2. Prevention & Vaccination:",
          pointsBn: [
            "•ব্রিডার মুরগিতে ৯–১২ সপ্তাহে CAV ভ্যাকসিন দিয়ে ডিমের মাধ্যমে বাচ্চার ইমিউনিটি নিশ্চিত করা।",
          ],
          pointsEn: [
            "•Vaccinate parent breeder stock at 9-12 weeks to pass maternal antibodies to chicks.",
          ],
        ),
      ],
      summaryTitleBn: "✅ মূলকথা:",
      summaryTitleEn: "✅ Key Takeaway:",
      summaryQuoteBn:
          "ব্রিডার ফার্মে CAV ভ্যাকসিন দিলে বাচ্চার জন্মগত রক্তস্বল্পতা রোগ ১০০% রোধ হয়।",
      summaryQuoteEn:
          "Vaccinating parent breeders eliminates vertical CAV transmission to commercial chicks.",
      summarySubBn: "",
      summarySubEn: "",
    ),

    // -------------------------------------------------------------
    // Item 9: Avian Influenza (এভিয়ান ইনফ্লুয়েঞ্জা - Bird Flu)
    // -------------------------------------------------------------
    PoultryDiseaseItem(
      id: "avian_influenza",
      titleBn: "এভিয়ান ইনফ্লুয়েঞ্জা",
      titleEn: "Avian Influenza (Bird Flu)",
      subtitleEn: "AVIAN INFLUENZA:",
      descBn:
          "AVIAN INFLUENZA:\nএভিয়ান ইনফ্লুয়েঞ্জা (Bird Flu) একটি ভাইরাসজনিত রোগ, যা Orthomyxoviridae পরিবারের Influenza A ভাইরাস দ্বারা অত্যন্ত দ্রুত ছড়ায়...",
      descEn:
          "AVIAN INFLUENZA:\nAvian Influenza (Bird Flu) is a highly contagious viral infection caused by Influenza A viruses (H5N1, H9N2) causing severe systemic illness...",
      badgeTag: "AIF",
      primaryIcon: Icons.warning_amber_rounded,
      secondaryIcon: Icons.dangerous_rounded,
      gradientColors: [const Color(0xFF4A0000), const Color(0xFFB71C1C)],
      badgeColor: const Color(0xFF310000),
      introBn:
          "AVIAN INFLUENZA:\n\n🐓 এভিয়ান ইনফ্লুয়েঞ্জা বা বার্ড ফ্লু (Avian Influenza - Bird Flu):\nবার্ড ফ্লু হলো ইনফ্লুয়েঞ্জা এ ভাইরাস (H5N1, H9N2) দ্বারা সৃষ্ট মুরগির অত্যন্ত ভয়াবহ সংক্রামক রোগ। এটি অতি-সংক্রামক (HPAI) হলে ১০০% পর্যন্ত মুরগি কয়েক ঘণ্টার মধ্যে মেরে ফেলতে পারে।",
      introEn:
          "AVIAN INFLUENZA:\n\n🐓 Avian Influenza (Bird Flu):\nAvian Influenza is a high-consequence viral infection caused by Type A Influenza viruses, causing mass mortality, respiratory failure, and systemic hemorrhages.",
      sectionHeaderBn: "🔰 বার্ড ফ্লু শনাক্তকরণ ও পদক্ষেপ:",
      sectionHeaderEn: "🔰 Bird Flu Surveillance & Action:",
      sections: [
        DiseaseArticleSection(
          titleBn: "১. প্রধান লক্ষণসমূহ:",
          titleEn: "1. Clinical Symptoms:",
          pointsBn: [
            "•ঝুঁটি, ফুল ও পায়ে গাঢ় নীল-কালো রক্তক্ষরণ (Cyanosis & leg hemorrhages)।",
            "•চোখ ও মুখ অতিরিক্ত ফুলে যাওয়া।",
            "•হঠাৎ কোনো পূর্বলক্ষণ ছাড়াই গণমৃত্যু (HPAI H5N1)।",
            "•লেয়ারে ডিম উৎপাদন শূন্যের কোঠায় নেমে আসা (LPAI H9N2)।",
          ],
          pointsEn: [
            "•Cyanotic dark purple comb/wattles and shanks hemorrhages.",
            "•Severe head & facial swelling with lacrimation.",
            "•Sudden mass flock mortality within hours (HPAI H5N1).",
            "•Catastrophic drop in egg production (LPAI H9N2).",
          ],
        ),
        DiseaseArticleSection(
          titleBn: "২. পদক্ষেপ ও নিয়ন্ত্রণ:",
          titleEn: "2. Action & Biosecurity:",
          pointsBn: [
            "•আক্রান্ত ফার্ম কোয়ারেন্টাইন করা ও ভেটেরিনারি প্রশাসনকে জানানো।",
            "•H9N2 কিল্ড ভ্যাকসিন সময়মতো প্রয়োগ করা।",
          ],
          pointsEn: [
            "•Immediately isolate farm, report to livestock authority, and strictly enforce biosecurity.",
            "•Use inactivated H9N2 vaccines according to regional schedule.",
          ],
        ),
      ],
      summaryTitleBn: "✅ মূলকথা:",
      summaryTitleEn: "✅ Key Takeaway:",
      summaryQuoteBn:
          "বার্ড ফ্লু প্রতিরোধে কঠোর বাইওসিউরিটি এবং সরকার অনুমোদিত কিল্ড ভ্যাকসিন প্রয়োগই একমাত্র নিরাপত্তা।",
      summaryQuoteEn:
          "Strict biosecurity paired with approved killed vaccines is the primary defense against Bird Flu.",
      summarySubBn: "",
      summarySubEn: "",
    ),

    // -------------------------------------------------------------
    // Item 10: Inclusion Body Hepatitis (আই বি এইচ - IBH)
    // -------------------------------------------------------------
    PoultryDiseaseItem(
      id: "ibh_disease",
      titleBn: "আই বি এইচ",
      titleEn: "Inclusion Body Hepatitis (IBH)",
      subtitleEn: "IBH (Inclusion Body Hepatitis):",
      descBn:
          "IBH (Inclusion Body Hepatitis):\n🔹 রোগের পরিচিতি: IBH বা Inclusion Body Hepatitis হলো এক প্রকার এভিয়ান এডেনোভাইরাস (Fowl Adenovirus - FAdV) দ্বারা সৃষ্ট রোগ...",
      descEn:
          "IBH (Inclusion Body Hepatitis):\nIBH is an acute adenoviral infection of young broilers characterized by sudden mortality, fragile pale liver, and hydropericardium...",
      badgeTag: "IBH",
      primaryIcon: Icons.favorite_rounded,
      secondaryIcon: Icons.healing_outlined,
      gradientColors: [const Color(0xFF004D40), const Color(0xFF00897B)],
      badgeColor: const Color(0xFF00332C),
      introBn:
          "IBH (Inclusion Body Hepatitis):\n\n🔹 রোগের পরিচিতি:\nIBH বা Inclusion Body Hepatitis হলো এভিয়ান এডেনোভাইরাস (Fowl Adenovirus - FAdV Group I) দ্বারা সৃষ্ট ৩–৭ সপ্তাহ বয়সী ব্রয়লার মুরগির সংক্রামক রোগ। এতে লিভার ফ্যাকাশে ও নরম হয়ে যায় এবং হৃদপিণ্ডে পানি জমে (Hydropericardium)।",
      introEn:
          "IBH (Inclusion Body Hepatitis):\n\n🔹 Diseases Overview:\nIBH is an acute viral disease of growing broilers caused by Fowl Adenovirus (FAdV), characterized by severe liver damage and clear fluid accumulation around the heart (Hydropericardium syndrome).",
      sectionHeaderBn: "🔰 আইবিএইচ রোগের বিবরণ ও চিকিৎসা:",
      sectionHeaderEn: "🔰 IBH Disease Overview & Protocol:",
      sections: [
        DiseaseArticleSection(
          titleBn: "১. প্রধান লক্ষণ ও পোস্টমর্টেম:",
          titleEn: "1. Clinical Signs & Necropsy:",
          pointsBn: [
            "•হঠাৎ ৩–৭ সপ্তাহ বয়সে মৃত্যুহার ১০-৩০% পর্যন্ত বেড়ে যাওয়া।",
            "•যকৃত (Liver) আকারে বড়, ফ্যাকাশে, হলুদ ও অত্যন্ত নরম ভাঙনপ্রবণ হয়ে যাওয়া।",
            "•হৃদপিণ্ডের থলিতে স্বচ্ছ পানি জমে থাকা (Hydropericardium / Water heart syndrome)।",
          ],
          pointsEn: [
            "•Sudden death spikes of 10-30% in 3 to 7-week-old broilers.",
            "•Enlarged, pale yellow, friable liver with petechial hemorrhages.",
            "•Straw-colored fluid accumulation inside pericardial sac (Hydropericardium).",
          ],
        ),
        DiseaseArticleSection(
          titleBn: "২. প্রতিরোধ ও প্রতিকার:",
          titleEn: "2. Treatment & Prevention:",
          pointsBn: [
            "•লিভার টনিক, হেপাটোপ্রোটেক্টিভ ওষুধ ও ভিটামিন-সি দেওয়া।",
            "•প্যারেন্ট স্টকে এডেনোভাইরাস ভ্যাকসিন প্রয়োগ নিশ্চিত করা।",
          ],
          pointsEn: [
            "•Provide liver tonics, vitamin C, and supportive hepatoprotectants.",
            "•Vaccinate parent breeder flocks with FAdV vaccines.",
          ],
        ),
      ],
      summaryTitleBn: "✅ মূলকথা:",
      summaryTitleEn: "✅ Key Takeaway:",
      summaryQuoteBn:
          "আইবিএইচ হলে লিভার টনিক দেওয়া এবং প্যারেন্ট স্টকে এডেনোভাইরাস ভ্যাকসিন নিশ্চিত করা উচিত।",
      summaryQuoteEn:
          "Provide liver support tonics and verify breeder FAdV vaccination to control IBH.",
      summarySubBn: "",
      summarySubEn: "",
    ),

    // -------------------------------------------------------------
    // Item 11: Mycoplasmosis (মাইকোপ্লাজমা)
    // -------------------------------------------------------------
    PoultryDiseaseItem(
      id: "mycoplasmosis",
      titleBn: "মাইকোপ্লাজমা",
      titleEn: "Mycoplasmosis",
      subtitleEn: "MICOPLASMOSIS:",
      descBn:
          "MICOPLASMOSIS:\n📘 মুরগীর মাইকোপ্লাজমা রোগ (Mycoplasma infection – MG/MS) হলো ব্যাকটেরিয়াসদৃশ অণুজীব দ্বারা সৃষ্ট দীর্ঘস্থায়ী শ্বাসকষ্ট ও জয়েন্ট ফোলা রোগ...",
      descEn:
          "MICOPLASMOSIS:\nAvian Mycoplasmosis (MG / MS) causes chronic respiratory disease (CRD) and infectious synovitis in commercial poultry flocks...",
      badgeTag: "CRD",
      primaryIcon: Icons.bubble_chart_rounded,
      secondaryIcon: Icons.health_and_safety_rounded,
      gradientColors: [const Color(0xFF006064), const Color(0xFF00ACC1)],
      badgeColor: const Color(0xFF00363A),
      introBn:
          "MICOPLASMOSIS:\n\n📘 মুরগীর মাইকোপ্লাজমা রোগ (Mycoplasma Infection):\nমাইকোপ্লাজমা গ্যালিসেপ্টিকাম (MG) ও মাইকোপ্লাজমা সাইনোভাই (MS) দ্বারা সৃষ্ট মুরগির দীর্ঘস্থায়ী শ্বাসনালী সংক্রমণ (CRD) ও জয়েন্টের প্রদাহ। এটি ডিমের মাধ্যমে বাচ্চার শরীরে ছড়ায়।",
      introEn:
          "MICOPLASMOSIS:\n\n📘 Avian Mycoplasmosis:\nMycoplasmosis caused by Mycoplasma gallisepticum (MG) and Mycoplasma synoviae (MS) leads to Chronic Respiratory Disease (CRD), airsacculitis, and leg lameness in poultry.",
      sectionHeaderBn: "🔰 মাইকোপ্লাজমা নির্দেশিকা:",
      sectionHeaderEn: "🔰 Mycoplasmosis Guidelines:",
      sections: [
        DiseaseArticleSection(
          titleBn: "১. প্রধান লক্ষণসমূহ:",
          titleEn: "1. Clinical Symptoms:",
          pointsBn: [
            "•দীর্ঘদিন ধরে হাঁচি, কাশি ও শ্বাসনালীতে সাঁসাঁ শব্দ (CRD)।",
            "•পা বা ডানার জয়েন্ট ফুলে যাওয়া ও খোঁড়ানো (Infectious Synovitis - MS)।",
            "•বায়ুথলিতে ফেনা বা পনিরের মতো মিউকাস জমতে থাকা (Airsacculitis)।",
          ],
          pointsEn: [
            "•Persistent coughing, sneezing, and tracheal rales (CRD).",
            "•Swollen hock joints, foot pads, and lameness (Infectious Synovitis).",
            "•Foamy or caseous exudate in air sacs (Airsacculitis).",
          ],
        ),
        DiseaseArticleSection(
          titleBn: "২. চিকিৎসা ও প্রতিরোধ:",
          titleEn: "2. Treatment & Control:",
          pointsBn: [
            "•টাইলোসিন (Tylosin), ডক্সিসাইক্লিন, টিয়াযুলিন (Tiamulin) বা টিলমাইকোসিন প্রয়োগ।",
            "•মাইকোপ্লাজমা মুক্ত বাচ্চা সংগ্রহ করা ও জৈব-নিরাপত্তা বজায় রাখা।",
          ],
          pointsEn: [
            "•Targeted therapy with Tylosin, Doxycycline, Tiamulin, or Tilmicosin.",
            "•Source MG/MS-free chicks and maintain strict farm biosecurity.",
          ],
        ),
      ],
      summaryTitleBn: "✅ মূলকথা:",
      summaryTitleEn: "✅ Key Takeaway:",
      summaryQuoteBn:
          "মাইকোপ্লাজমা দমনে টাইলোসিন বা ডক্সিসাইক্লিন প্রয়োগ এবং লিটার শুষ্ক রাখা কার্যকর।",
      summaryQuoteEn:
          "Targeted Tylosin/Doxycycline treatment paired with dry litter controls Mycoplasma.",
      summarySubBn: "",
      summarySubEn: "",
    ),

    // -------------------------------------------------------------
    // Item 12: Avian Encephalomyelitis (এভিয়ান এনসেফালোমাইলাইটিস - AE)
    // -------------------------------------------------------------
    PoultryDiseaseItem(
      id: "ae_disease",
      titleBn: "এভিয়ান এনসেফালোমাইলাইটিস",
      titleEn: "Avian Encephalomyelitis (AE)",
      subtitleEn: "AVIAN ENCEPHALOMYELITIS:",
      descBn:
          "AVIAN ENCEPHALOMYELITIS:\nএভিয়ান এনসেফালোমাইলাইটিস (Avian Encephalomyelitis – AE) মুরগির একটি ভাইরাসজনিত স্নায়বিক রোগ, যা Picornaviridae পরিবারের ভাইরাসের কারণে হয়...",
      descEn:
          "AVIAN ENCEPHALOMYELITIS:\nAE is a viral infection caused by Tremovirus affecting young chicks with head tremors, ataxia, and cataracts in adult layers...",
      badgeTag: "AE",
      primaryIcon: Icons.psychology_rounded,
      secondaryIcon: Icons.remove_red_eye_rounded,
      gradientColors: [const Color(0xFF311B92), const Color(0xFF5E35B1)],
      badgeColor: const Color(0xFF1A237E),
      introBn:
          "AVIAN ENCEPHALOMYELITIS:\n\n🐓 এভিয়ান এনসেফালোমাইলাইটিস (Avian Encephalomyelitis - AE / Epidemic Tremor):\nএভিয়ান এনসেফালোমাইলাইটিস হলো পিকরনাভাইরাস (Picornavirus / Tremovirus) দ্বারা সৃষ্ট কচি বাচ্চার স্নায়বিক রোগ। এটি মাথা ও ঘাড়ে কাঁপুনি (Epidemic tremor) ঘটায়।",
      introEn:
          "AVIAN ENCEPHALOMYELITIS:\n\n🐓 Avian Encephalomyelitis (AE / Epidemic Tremor):\nAvian Encephalomyelitis is a viral neurotropic disease of young chicks (1-3 weeks) causing head tremors, muscle incoordination, and eye cataracts in laying hens.",
      sectionHeaderBn: "🔰 এই রোগের লক্ষণ ও টিকাদান:",
      sectionHeaderEn: "🔰 AE Symptoms & Vaccination:",
      sections: [
        DiseaseArticleSection(
          titleBn: "১. প্রধান লক্ষণসমূহ:",
          titleEn: "1. Clinical Features:",
          pointsBn: [
            "•১–৩ সপ্তাহ বয়সী বাচ্চার হাঁটাচলায় ভারসাম্যহীনতা (Ataxia) ও মাথা-ঘাড় কাঁপা (Head Tremors)।",
            "•বয়স্ক লেয়ারে হঠাৎ ৫–১০% ডিম কমে যাওয়া এবং চোখের লেন্স ছানি পড়া (Cataract/Opacity)।",
          ],
          pointsEn: [
            "•Ataxia, leg weakness, and fine head/neck tremors in 1 to 3-week-old chicks.",
            "•Temporary 5-10% egg drop and lens cataracts/opacity in adult laying hens.",
          ],
        ),
        DiseaseArticleSection(
          titleBn: "২. প্রতিরোধ:",
          titleEn: "2. Prevention:",
          pointsBn: [
            "•লেয়ার ও ব্রিডার মুরগিতে ১০–১৬ সপ্তাহে AE ভ্যাকসিন ডানা ছিদ্র করে (Wing web) প্রয়োগ করা।",
          ],
          pointsEn: [
            "•Vaccinate layer & breeder pullets at 10-16 weeks of age via wing-web puncture method.",
          ],
        ),
      ],
      summaryTitleBn: "✅ মূলকথা:",
      summaryTitleEn: "✅ Key Takeaway:",
      summaryQuoteBn:
          "১০–১৬ সপ্তাহে ব্রিডার ও লেয়ারকে AE ভ্যাকসিন দিলে ছানার মাথা কাঁপুনি ও ডিম ধস ১০০% রোধ হয়।",
      summaryQuoteEn:
          "Wing-web AE vaccination at 10-16 weeks prevents epidemic tremors in chicks completely.",
      summarySubBn: "",
      summarySubEn: "",
    ),

    // -------------------------------------------------------------
    // Item 13: Marek's Disease (মারেক্স রোগ)
    // -------------------------------------------------------------
    PoultryDiseaseItem(
      id: "mareks_disease",
      titleBn: "মারেক্স রোগ",
      titleEn: "Marek's Disease",
      subtitleEn: "MAREK'S DISEASE:",
      descBn:
          "MAREK'S DISEASE:\nমারেক্স রোগ একটি ভাইরাসজনিত ক্যান্সার রোগ, যা Gallid Herpesvirus-2 (MDV) দ্বারা সৃষ্ট এবং মুরগির স্নায়ু ও অঙ্গপ্রত্যঙ্গে টিউমার তৈরি করে...",
      descEn:
          "MAREK'S DISEASE:\nMarek's Disease is an oncogenic alphaherpesvirus disease causing T-cell lymphomas and peripheral nerve paralysis in poultry...",
      badgeTag: "MDV",
      primaryIcon: Icons.accessible_rounded,
      secondaryIcon: Icons.verified_user_rounded,
      gradientColors: [const Color(0xFF263238), const Color(0xFF546E7A)],
      badgeColor: const Color(0xFF1C313A),
      introBn:
          "MAREK'S DISEASE:\n\n🐓 মারেক্স রোগ (Marek's Disease - MDV):\nমারেক্স রোগ হলো এভিয়ান হার্পিসভাইরাস (Gallid Alphaherpesvirus 2) দ্বারা সৃষ্ট মুরগির ভাইরাসজনিত ক্যান্সার রোগ। এটি প্রান্তীয় স্নায়ু (Nerves) ও অভ্যন্তরীণ অঙ্গে লিউকোসাইট টিউমার তৈরি করে পা পক্ষাঘাতগ্রস্ত করে দেয়।",
      introEn:
          "MAREK'S DISEASE:\n\n🐓 Marek's Disease (MDV):\nMarek's disease is an infectious herpesvirus neoplasm causing T-cell lymphoma, visceral organ tumors, and sciatic nerve enlargement leading to leg paralysis.",
      sectionHeaderBn: "🔰 মারেক্স রোগ নির্দেশিকা:",
      sectionHeaderEn: "🔰 Marek's Disease Guidelines:",
      sections: [
        DiseaseArticleSection(
          titleBn: "১. প্রধান লক্ষণসমূহ:",
          titleEn: "1. Clinical Features:",
          pointsBn: [
            "•পাখি এক পা সামনে এবং এক পা পেছনে ছড়িয়ে শুয়ে পড়া (Classic paralysis pose)।",
            "•চোখের মনি ধূসর বা অনিয়মিত হয়ে যাওয়া (Grey eye / Ocular Marek's)。",
            "•লিভার, স্প্লিন, কিডনি ও হৃদপিণ্ডে টিউমারের মার্বেল দাগ।",
          ],
          pointsEn: [
            "•Unilateral leg paralysis with one leg stretched forward and the other backward.",
            "•Irregular pupil shape and grey iris discoloration (Ocular Marek's).",
            "•Lymphoid tumors on liver, spleen, kidneys, heart, and ovary.",
          ],
        ),
        DiseaseArticleSection(
          titleBn: "২. প্রতিরোধ:",
          titleEn: "2. Prevention & Vaccination:",
          pointsBn: [
            "•হ্যাচারিতে জীবনের ১ম দিনেই (Day 1) HVT বা Rispens মারেক্স ভ্যাকসিন দেওয়া বাধ্যতামূলক।",
          ],
          pointsEn: [
            "•Mandatory Day-1 hatchery vaccination using HVT or Rispens strains in ovo or subcutaneously.",
          ],
        ),
      ],
      summaryTitleBn: "✅ মূলকথা:",
      summaryTitleEn: "✅ Key Takeaway:",
      summaryQuoteBn:
          "১ম দিন হ্যাচারিতে মারেক্স ভ্যাকসিন প্রদান করাই এই পক্ষাঘাত ক্যান্সার প্রতিরোধের একমাত্র উপায়।",
      summaryQuoteEn:
          "Day-1 hatchery vaccination is the absolute only way to prevent Marek's paralysis.",
      summarySubBn: "",
      summarySubEn: "",
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchQuery = ref.watch(poultryDiseasesSearchProvider);

    final filteredItems = _items.where((item) {
      final nameBn = item.titleBn.toLowerCase();
      final nameEn = item.titleEn.toLowerCase();
      final subEn = item.subtitleEn.toLowerCase();
      final query = searchQuery.toLowerCase();
      return nameBn.contains(query) ||
          nameEn.contains(query) ||
          subEn.contains(query);
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF2F5F8),
      appBar: AppBar(
        title: Text(
          isEnglish ? "Poultry Diseases Directory" : "মুরগির রোগ বালাই",
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
      body: Column(
        children: [
          // Search Bar Widget
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 6),
            child: TextField(
              onChanged: (val) => ref
                  .read(poultryDiseasesSearchProvider.notifier)
                  .setSearchQuery(val),
              decoration: InputDecoration(
                hintText: isEnglish
                    ? "Search disease name..."
                    : "রোগের নাম দিয়ে খুঁজুন...",
                prefixIcon:
                    const Icon(Icons.search_rounded, color: Color(0xFF00838F)),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide:
                      const BorderSide(color: Color(0xFF00838F), width: 1.5),
                ),
              ),
            ),
          ),

          // List of Disease Items
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                final item = filteredItems[index];
                return _buildDiseaseCard(context, item);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDiseaseCard(BuildContext context, PoultryDiseaseItem item) {
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
              builder: (_) => PoultryDiseaseDetailScreen(
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
              // Distinct Vector Badge Thumbnail
              _buildDiseaseBadge(item, size: 78),
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
                    const SizedBox(height: 3),
                    Text(
                      item.subtitleEn,
                      style: TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.bold,
                        color: item.gradientColors.first,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      isEnglish ? item.descEn : item.descBn,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade800,
                        height: 1.35,
                      ),
                      maxLines: 3,
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

  Widget _buildDiseaseBadge(PoultryDiseaseItem item, {required double size}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: item.gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: item.gradientColors.first.withValues(alpha: 0.35),
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
        border: Border.all(
          color: Colors.white,
          width: 2.2,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background concentric ring
          Container(
            width: size * 0.76,
            height: size * 0.76,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.28),
                width: 1.2,
              ),
            ),
          ),
          // Center Medical Icon
          Icon(
            item.primaryIcon,
            color: Colors.white,
            size: size * 0.38,
          ),
          // Unique Disease Badge Tag (e.g. NDV, IBV, IBD, etc) at bottom center
          Positioned(
            bottom: 6,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1.5),
              decoration: BoxDecoration(
                color: item.badgeColor,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Colors.white, width: 0.9),
              ),
              child: Text(
                item.badgeTag,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 9.5,
                  letterSpacing: 0.4,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// Poultry Disease Detail Screen
// ============================================================================
class PoultryDiseaseDetailScreen extends StatelessWidget {
  final PoultryDiseaseItem item;
  final bool isEnglish;

  const PoultryDiseaseDetailScreen({
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
            // Top Distinct Banner Card
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
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(bottom: 12),
              child: Container(
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  gradient: LinearGradient(
                    colors: item.gradientColors,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 86,
                          height: 86,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withValues(alpha: 0.15),
                          ),
                        ),
                        Icon(
                          item.primaryIcon,
                          size: 54,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.25),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "${item.badgeTag} • ${item.subtitleEn}",
                        style: const TextStyle(
                          fontSize: 12.5,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
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
                                      secTitle.startsWith("🔹") ||
                                      secTitle.startsWith("📘")
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
                              pt.startsWith("🔹") ||
                              pt.startsWith("📘");
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
