import 'package:flutter/material.dart';

class BrownLayerArticleItem {
  final String id;
  final String titleEn;
  final String titleBn;
  final String subtitleEn;
  final String subtitleBn;
  final String originEn;
  final String originBn;
  final String companyEn;
  final String companyBn;
  final String imagePath;
  final List<String> detailsEn;
  final List<String> detailsBn;
  final List<String> keyPointsEn;
  final List<String> keyPointsBn;

  const BrownLayerArticleItem({
    required this.id,
    required this.titleEn,
    required this.titleBn,
    required this.subtitleEn,
    required this.subtitleBn,
    required this.originEn,
    required this.originBn,
    required this.companyEn,
    required this.companyBn,
    required this.imagePath,
    required this.detailsEn,
    required this.detailsBn,
    required this.keyPointsEn,
    required this.keyPointsBn,
  });
}

class BrownLayerPSSummaryScreen extends StatelessWidget {
  final bool isEnglish;

  const BrownLayerPSSummaryScreen({super.key, required this.isEnglish});

  static const List<BrownLayerArticleItem> articles = [
    // 1. ISA Brown
    BrownLayerArticleItem(
      id: "isa_brown",
      titleEn: "ISA Brown (World-Class Brown Layer)",
      titleBn: "আইএসএ ব্রাউন (বিশ্বমানের ব্রাউন লেয়ার)",
      subtitleEn: "🔎 Origin & Breed Identity",
      subtitleBn: "🔎 উৎপত্তি ও ব্রিডের পরিচয়",
      originEn: "France 🇫🇷",
      originBn: "ফ্রান্স 🇫🇷",
      companyEn: "Hendrix Genetics",
      companyBn: "হেনড্রিক্স জেনেটিক্স",
      imagePath: "assets/ps_brown_layer.jpg",
      detailsEn: [
        "🔎 ORIGIN & BREED IDENTITY:\n• Origin: France 🇫🇷\n• Company: Hendrix Genetics\n• Type: Commercial Hybrid Brown Layer\n• Global Position: One of the most successful brown egg layer strains in the world",
        "📊 PRODUCTION PERFORMANCE:\n• Age at First Egg: 18 weeks\n• Peak Production: 95–97%\n• Eggs Per Year: 320–340 eggs\n• Egg Weight: 63–66 g\n• Production Nature: Very high output with strong laying persistency",
        "🍽️ FEED & EFFICIENCY:\n• Feed Intake: 110–115 g/day\n• FCR (Egg Mass): 2.0–2.1\n• Efficiency: Excellent feed-to-egg conversion",
        "⚖️ BODY & HEALTH:\n• Body Weight: 2.0–2.2 kg\n• Livability: 95–97%\n• Health Status: Strong under good commercial management",
        "💡 EXPERT INSIGHT:\n• Highest production among major brown layers\n• Fast ROI for commercial farms\n• Ideal for intensive egg production business"
      ],
      detailsBn: [
        "🔎 উৎপত্তি ও ব্রিডের পরিচয়ঃ\n• উৎপত্তি: ফ্রান্স 🇫🇷\n• কোম্পানি: হেনড্রিক্স জেনেটিক্স\n• টাইপ: কমার্শিয়াল হাইব্রিড ব্রাউন লেয়ার\n• গ্লোবাল অবস্থান: বিশ্বের অন্যতম সফল ব্রাউন ডিম লেয়ার স্ট্রেইন",
        "📊 উৎপাদন ক্ষমতা ও পারফরম্যান্সঃ\n• প্রথম ডিমের বয়স: ১৮ সপ্তাহ\n• পিক ডিম উৎপাদন: ৯৫–৯৭%\n• বার্ষিক ডিম উৎপাদন: ৩২০–৩৪০ টি\n• ডিমের ওজন: ৬৩–৬৬ গ্রাম\n• উৎপাদনের বৈশিষ্ট্য: দীর্ঘস্থায়ী ডিম উৎপাদনের ক্ষমতা সহ সর্বোচ্চ আউটপুট",
        "🍽️ খাবার ও ফিড দক্ষতাঃ\n• দৈনিক ফিড গ্রহণ: ১১০–১১৫ গ্রাম/দিন\n• এফসিআর (FCR - এগ মাস): ২.০–২.১\n• খাদ্য দক্ষতা: চমৎকার ফিড-টু-এগ কনভার্সন রেশিও",
        "⚖️ দৈহিক ওজন ও স্বাস্থ্যঃ\n• দৈহিক ওজন: ২.০–২.২ কেজি\n• বেঁচে থাকার হার (Livability): ৯৫–৯৭%\n• স্বাস্থ্য স্থিতি: ভালো বাণিজ্যিক ব্যবস্থাপনায় অত্যন্ত শক্তিশালী",
        "💡 বিশেষজ্ঞদের পর্যবেক্ষণ (EXPERT INSIGHT)ঃ\n• প্রধান ব্রাউন লেয়ারগুলোর মধ্যে সর্বোচ্চ ডিম উৎপাদন ক্ষমতা\n• বাণিজ্যিক খামারের জন্য দ্রুততম বিনিয়োগ লাভ (Fast ROI)\n• নিবিড় বাণিজ্যিক ডিম উৎপাদন ব্যবসার জন্য আদর্শ"
      ],
      keyPointsEn: [
        "1. Origin & Type: France 🇫🇷 | Hendrix Genetics | Commercial Hybrid Brown Layer",
        "2. Production Specs: First egg at 18 wks; 95-97% peak; 320-340 eggs/yr (63-66g egg weight)",
        "3. Feed Efficiency: 110-115 g/day feed intake with 2.0-2.1 FCR (Egg Mass)",
        "4. Expert Insight: Highest production among brown layers with fast commercial ROI"
      ],
      keyPointsBn: [
        "১. উৎপত্তি ও টাইপ: ফ্রান্স 🇫🇷 | হেনড্রিক্স জেনেটিক্স | কমার্শিয়াল হাইব্রিড ব্রাউন লেয়ার",
        "২. উৎপাদন মানদণ্ড: ১৮ সপ্তাহে ডিম শুরু; ৯৫-৯৭% পিক; ৩২০-৩৪০টি ডিম/বছর (৬৩-৬৬g ডিমের ওজন)",
        "৩. ফিড দক্ষতা: দৈনিক ১১০-১১৫g ফিড এবং ২.০-২.১ এফসিআর (এগ মাস)",
        "৪. বিশেষজ্ঞদের পর্যবেক্ষণ: দ্রুততম বিনিয়োগ লাভ সহ ব্রাউন লেয়ারের সর্বোচ্চ উৎপাদন"
      ],
    ),

    // 2. Lohmann Brown
    BrownLayerArticleItem(
      id: "lohmann_brown",
      titleEn: "Lohmann Brown (Stable Commercial Performer)",
      titleBn: "লোহম্যান ব্রাউন (স্থিতিশীল বাণিজ্যিক লেয়ার)",
      subtitleEn: "🔎 Origin & Breed Identity",
      subtitleBn: "🔎 উৎপত্তি ও ব্রিডের পরিচয়",
      originEn: "Germany 🇩🇪",
      originBn: "জার্মানি 🇩🇪",
      companyEn: "Lohmann Breeders",
      companyBn: "লোহম্যান ব্রিডার্স",
      imagePath: "assets/ps_brown_layer.jpg",
      detailsEn: [
        "🔎 ORIGIN & BREED IDENTITY:\n• Origin: Germany 🇩🇪\n• Company: Lohmann Breeders\n• Type: Commercial Hybrid Brown Layer\n• Industry Reputation: Known worldwide for stability and dependable performance",
        "📊 PRODUCTION PERFORMANCE:\n• Eggs Per Year: 310–330 eggs\n• Peak Production: 95–97%\n• Egg Weight: 62–65 g\n• Production Nature: Stable and uniform throughout the laying cycle",
        "🍽️ FEED & EFFICIENCY:\n• Feed Intake: 110–120 g/day\n• Feed Efficiency: Good balance between body maintenance and egg output",
        "⚖️ BODY & HEALTH:\n• Body Weight: 2.0–2.2 kg\n• Body Type: Well-balanced brown layer body structure",
        "💡 EXPERT INSIGHT:\n• Very stable layer strain\n• Known in Bangladesh as a 'Safe Choice' for poultry farmers\n• Highly suitable for long-term commercial farming"
      ],
      detailsBn: [
        "🔎 উৎপত্তি ও ব্রিডের পরিচয়ঃ\n• উৎপত্তি: Germany 🇩🇪\n• কোম্পানি: Lohmann Breeders\n• টাইপ: Commercial Hybrid Brown Layer\n• ইন্ডাস্ট্রির সুনাম: বিশ্বজুড়ে স্থায়িত্ব ও নির্ভরযোগ্য পারফরম্যান্সের জন্য সুপরিচিত",
        "📊 উৎপাদন ক্ষমতা ও পারফরম্যান্সঃ\n• বার্ষিক ডিম উৎপাদন: ৩১০–৩৩০ টি\n• পিক ডিম উৎপাদন: ৯৫–৯৭%\n• ডিমের ওজন: ৬২–৬৫ গ্রাম\n• উৎপাদনের বৈশিষ্ট্য: পুরো লেয়িং সাইকেল জুড়ে স্থিতিশীল ও সুষম উৎপাদন",
        "🍽️ খাবার ও ফিড দক্ষতাঃ\n• দৈনিক ফিড গ্রহণ: ১১০–১২০ গ্রাম/দিন\n• খাদ্য দক্ষতা: দৈহিক রক্ষণাবেক্ষণ ও ডিমের আউটপুটের মধ্যে চমৎকার ভারসাম্য",
        "⚖️ দৈহিক ওজন ও স্বাস্থ্যঃ\n• দৈহিক ওজন: ২.০–২.২ কেজি\n• শরীরের গঠন: সুষম ও মজবুত ব্রাউন লেয়ার দৈহিক গঠন",
        "💡 বিশেষজ্ঞদের পর্যবেক্ষণ (EXPERT INSIGHT)ঃ\n• অত্যন্ত স্থিতিশীল ও নির্ভরযোগ্য লেয়ার স্ট্রেইন\n• বাংলাদেশে 'Safe Choice' হিসেবে খামারিদের কাছে পরিচিত\n• দীর্ঘমেয়াদী বাণিজ্যিক ডিম উৎপাদনের জন্য অত্যন্ত উপযোগী"
      ],
      keyPointsEn: [
        "1. Origin & Company: Germany 🇩🇪 | Lohmann Breeders | Commercial Hybrid Brown Layer",
        "2. Production Specs: 310-330 eggs/yr with 95-97% peak lay & 62-65g egg weight",
        "3. Feed Intake: 110-120 g/day with balanced body maintenance & egg yield",
        "4. Expert Insight: Very stable strain, renowned as a 'Safe Choice' in Bangladesh"
      ],
      keyPointsBn: [
        "১. উৎপত্তি ও কোম্পানি: Germany 🇩🇪 | Lohmann Breeders | কমার্শিয়াল হাইব্রিড ব্রাউন লেয়ার",
        "২. ডিম উৎপাদন: ৩১০-৩৩০টি ডিম/বছর; ৯৫-৯৭% পিক এবং ৬২-৬৫g ডিমের ওজন",
        "৩. ফিড ব্যবহার: দৈনিক ১১০-১২০g খাবার গ্রহণ এবং উন্নত খাদ্য দক্ষতা",
        "৪. বিশেষজ্ঞদের পর্যবেক্ষণ: বাংলাদেশে 'Safe Choice' হিসেবে পরিচিত ও দীর্ঘমেয়াদী খামারে উপযোগী"
      ],
    ),

    // 3. Hy-Line Brown
    BrownLayerArticleItem(
      id: "hy_line_brown",
      titleEn: "Hy-Line Brown (Balanced High Performer)",
      titleBn: "হাই-লাইন ব্রাউন (ভারসাম্যপূর্ণ সেরা লেয়ার)",
      subtitleEn: "🔎 Origin & Breed Identity",
      subtitleBn: "🔎 উৎপত্তি ও ব্রিডের পরিচয়",
      originEn: "USA 🇺🇸",
      originBn: "যুক্তরাষ্ট্র 🇺🇸",
      companyEn: "Hy-Line International",
      companyBn: "হাই-লাইন ইন্টারন্যাশনাল",
      imagePath: "assets/ps_brown_layer.jpg",
      detailsEn: [
        "🔎 ORIGIN & BREED IDENTITY:\n• Origin: USA 🇺🇸\n• Company: Hy-Line International\n• Type: Commercial Hybrid Brown Layer\n• Industry Role: Well-known for balanced production and shell quality",
        "📊 PRODUCTION PERFORMANCE:\n• Eggs Per Year: 300–320 eggs\n• Peak Production: 94–96%\n• Egg Weight: 62–65 g\n• Production Nature: Strong, steady and commercially reliable",
        "🍽️ FEED & EFFICIENCY:\n• Feed Intake: 110–120 g/day\n• Feed Use Efficiency: Good under both standard and commercial management",
        "⚖️ BODY & HEALTH:\n• Body Weight: 1.9–2.1 kg\n• Body Structure: Compact and efficient commercial type",
        "💡 EXPERT INSIGHT:\n• Strong eggshell quality\n• Balanced performance in feed, egg size and livability\n• Suitable for farms wanting reliable brown egg output"
      ],
      detailsBn: [
        "🔎 উৎপত্তি ও ব্রিডের পরিচয়ঃ\n• উৎপত্তি: USA 🇺🇸\n• কোম্পানি: Hy-Line International\n• টাইপ: Commercial Hybrid Brown Layer\n• ইন্ডাস্ট্রিতে ভুমিকা: ভারসাম্যপূর্ণ উৎপাদন ও চমৎকার ডিমের খোসার মান",
        "📊 উৎপাদন ক্ষমতা ও পারফরম্যান্সঃ\n• বার্ষিক ডিম উৎপাদন: ৩০০–৩২০ টি\n• পিক ডিম উৎপাদন: ৯৪–৯৬%\n• ডিমের ওজন: ৬২–৬৫ গ্রাম\n• উৎপাদনের বৈশিষ্ট্য: শক্তিশালী, ধারাবাহিক এবং মানসম্মত কমার্শিয়াল ব্রিড",
        "🍽️ খাবার ও ফিড দক্ষতাঃ\n• দৈনিক ফিড গ্রহণ: ১১০–১২০ গ্রাম/দিন\n• খাদ্য দক্ষতা: সাধারণ ও আধুনিক উভয় ব্যবস্থাপনায় চমৎকার ফিড পারফরম্যান্স",
        "⚖️ দৈহিক ওজন ও স্বাস্থ্যঃ\n• দৈহিক ওজন: ১.৯–২.১ কেজি\n• শরীরের গঠন: সাশ্রয়ী ও সুষম কমার্শিয়াল বডি টাইপ",
        "💡 বিশেষজ্ঞদের পর্যবেক্ষণ (EXPERT INSIGHT)ঃ\n• ডিমের খোসার আকর্ষণীয় শক্তিমত্তা ও গাঢ় রঙ\n• খাদ্য গ্রহণ, ডিমের সাইজ ও বেঁচে থাকার হারে দারুণ ভারসাম্য\n• নির্ভরযোগ্য বাদামী ডিম খামারের জন্য আদর্শ নির্বাচন"
      ],
      keyPointsEn: [
        "1. Origin & Company: USA 🇺🇸 | Hy-Line International | Commercial Hybrid Brown Layer",
        "2. Production Specs: 300-320 eggs/yr with 94-96% peak lay & 62-65g egg weight",
        "3. Body & Feed: 1.9-2.1 kg body weight with 110-120 g/day feed intake",
        "4. Expert Insight: Strong eggshell quality and balanced performance"
      ],
      keyPointsBn: [
        "১. উৎপত্তি ও কোম্পানি: USA 🇺🇸 | Hy-Line International | কমার্শিয়াল হাইব্রিড ব্রাউন লেয়ার",
        "২. ডিম উৎপাদন: ৩০০-৩২০টি ডিম/বছর; ৯৪-৯৬% পিক এবং ৬২-৬৫g ডিমের ওজন",
        "৩. ওজন ও ফিড: ১.৯-২.১ কেজি ওজন এবং দৈনিক ১১০-১২০g খাবার গ্রহণ",
        "৪. বিশেষজ্ঞদের পর্যবেক্ষণ: মজবুত ডিমের খোসা এবং সুষম উৎপাদন সুবিধা"
      ],
    ),

    // 4. Bovans Brown
    BrownLayerArticleItem(
      id: "bovans_brown",
      titleEn: "Bovans Brown (Large Egg Market Specialist)",
      titleBn: "বোভান্স ব্রাউন (বড় ডিমের স্পেশালিস্ট)",
      subtitleEn: "🔎 Origin & Breed Identity",
      subtitleBn: "🔎 উৎপত্তি ও ব্রিডের পরিচয়",
      originEn: "Netherlands 🇳🇱",
      originBn: "নেদারল্যান্ডস 🇳🇱",
      companyEn: "Hendrix Genetics",
      companyBn: "হেনড্রিক্স জেনেটিক্স",
      imagePath: "assets/ps_brown_layer.jpg",
      detailsEn: [
        "🔎 ORIGIN & BREED IDENTITY:\n• Origin: Netherlands 🇳🇱\n• Company: Hendrix Genetics\n• Type: Commercial Hybrid Brown Layer\n• Special Value: Known for larger egg size and strong market appeal",
        "📊 PRODUCTION PERFORMANCE:\n• Eggs Per Year: 310–330 eggs\n• Egg Weight: 63–66 g\n• Production Nature: High output with large-sized brown eggs",
        "🍽️ FEED & EFFICIENCY:\n• Feed Intake: 110–120 g/day\n• Efficiency: Good commercial conversion under proper nutrition",
        "⚖️ BODY & HEALTH:\n• Body Weight: 2.0–2.2 kg\n• Body Type: Strong, market-oriented commercial brown layer",
        "💡 EXPERT INSIGHT:\n• Very suitable for the large egg market segment\n• Delivers excellent premium value in brown egg trading\n• Highly profitable option for commercial egg farms"
      ],
      detailsBn: [
        "🔎 উৎপত্তি ও ব্রিডের পরিচয়ঃ\n• উৎপত্তি: Netherlands 🇳🇱\n• কোম্পানি: Hendrix Genetics\n• টাইপ: Commercial Hybrid Brown Layer\n• বিশেষ সুবিধা: বড় আকৃতির ডিম ও আকর্ষণীয় বাজার চাহিদার জন্য সুপরিচিত",
        "📊 উৎপাদন ক্ষমতা ও পারফরম্যান্সঃ\n• বার্ষিক ডিম উৎপাদন: ৩১০–৩৩০ টি\n• ডিমের ওজন: ৬৩–৬৬ গ্রাম\n• উৎপাদনের বৈশিষ্ট্য: বড় আকৃতির গাঢ় বাদামী ডিমের সর্বোচ্চ আউটপুট",
        "🍽️ খাবার ও ফিড দক্ষতাঃ\n• দৈনিক ফিড গ্রহণ: ১১০–১২০ গ্রাম/দিন\n• খাদ্য দক্ষতা: সঠিক পুষ্টি ব্যবস্থাপনায় উচ্চ বাণিজ্যিক রূপান্তর হার",
        "⚖️ দৈহিক ওজন ও স্বাস্থ্যঃ\n• দৈহিক ওজন: ২.০–২.২ কেজি\n• শরীরের গঠন: শক্তিশালী ও বাজার-ভিত্তিক কমার্শিয়াল বডি স্ট্রাকচার",
        "💡 বিশেষজ্ঞদের পর্যবেক্ষণ (EXPERT INSIGHT)ঃ\n• Large egg market এর জন্য খুবই উপযোগী\n• Premium brown egg segment-এ ভালো value দেয়\n• Commercial farms এ profitable option"
      ],
      keyPointsEn: [
        "1. Origin & Company: Netherlands 🇳🇱 | Hendrix Genetics | Large Egg Specialist",
        "2. Production Specs: 310-330 eggs/yr with heavy 63-66g large egg size",
        "3. Body & Feed: 2.0-2.2 kg body weight with 110-120 g/day feed intake",
        "4. Expert Insight: Premium value choice for large brown egg markets"
      ],
      keyPointsBn: [
        "১. উৎপত্তি ও কোম্পানি: Netherlands 🇳🇱 | Hendrix Genetics | লার্জ এগ স্পেশালিস্ট",
        "২. ডিম উৎপাদন: ৩১০-৩৩০টি ডিম/বছর এবং ৬৩-৬৬g বড় আকারের ডিমের সাইজ",
        "৩. ওজন ও ফিড: ২.০-২.২ কেজি ওজন এবং দৈনিক ১১০-১২০g খাবার গ্রহণ",
        "৪. বিশেষজ্ঞদের পর্যবেক্ষণ: লার্জ ব্রাউন এগ মার্কেটের জন্য লাভজনক চয়েস"
      ],
    ),

    // 5. Rhode Island Red
    BrownLayerArticleItem(
      id: "rhode_island_red",
      titleEn: "Rhode Island Red (Classic Hardy Brown Layer)",
      titleBn: "রোড আইল্যান্ড রেড (ঐতিহ্যবাহী সহনশীল লেয়ার)",
      subtitleEn: "🔎 Origin & Breed Identity",
      subtitleBn: "🔎 উৎপত্তি ও ব্রিডের পরিচয়",
      originEn: "USA 🇺🇸",
      originBn: "যুক্তরাষ্ট্র 🇺🇸",
      companyEn: "Malay × Leghorn × Asiatic crosses",
      companyBn: "মালয় × লেগহর্ন × এশিয়াটিক ক্রস",
      imagePath: "assets/ps_brown_layer.jpg",
      detailsEn: [
        "🔎 ORIGIN & BREED IDENTITY:\n• Origin: USA 🇺🇸\n• Developed From: Malay × Leghorn × Asiatic breeds\n• Type: Pure Breed\n• Main Use: Breeding base, rural farming and crossbreeding programs",
        "📊 PRODUCTION PERFORMANCE:\n• Age at First Egg: 20–22 weeks\n• Peak Production: 85–90%\n• Eggs Per Year: 250–280 eggs\n• Egg Weight: 55–60 g\n• Egg Shell: Brown and strong",
        "🍽️ FEED & EFFICIENCY:\n• Feed Intake: 110–120 g/day\n• FCR (Egg Mass): 2.2–2.4\n• Efficiency: Lower than commercial hybrids but good for hardy systems",
        "⚖️ BODY & HEALTH:\n• Body Weight: 2.2–2.8 kg\n• Livability: 92–95%\n• Heat Tolerance: Medium\n• Body Nature: Strong, hardy and adaptable",
        "💡 EXPERT INSIGHT:\n• Very hardy pure breed\n• Extensively used in crossbreeding programs\n• Excellent choice for rural and breeding-based systems"
      ],
      detailsBn: [
        "🔎 উৎপত্তি ও ব্রিডের পরিচয়ঃ\n• উৎপত্তি: USA 🇺🇸\n• উৎস লাইন: Malay × Leghorn × Asiatic breeds\n• টাইপ: Pure Breed\n• প্রধান ব্যবহার: ব্রিডিং বেস, গ্রামীন খামার ও ক্রস ব্রিডিং প্রোগ্রাম",
        "📊 উৎপাদন ক্ষমতা ও পারফরম্যান্সঃ\n• প্রথম ডিমের বয়স: ২০–২২ সপ্তাহ\n• পিক ডিম উৎপাদন: ৮৫–৯০%\n• বার্ষিক ডিম উৎপাদন: ২৫০–২৮০ টি\n• ডিমের ওজন: ৫৫–৬০ গ্রাম\n• ডিমের খোসা: শক্ত ও গাঢ় বাদামী",
        "🍽️ খাবার ও ফিড দক্ষতাঃ\n• দৈনিক ফিড গ্রহণ: ১১০–১২০ গ্রাম/দিন\n• এফসিআর (FCR - এগ মাস): ২.২–২.৪\n• খাদ্য দক্ষতা: কমার্শিয়াল হাইব্রিডের চেয়ে কম হলেও সহনশীল খামারে কার্যকর",
        "⚖️ দৈহিক ওজন ও স্বাস্থ্যঃ\n• দৈহিক ওজন: ২.২–২.৮ কেজি\n• বেঁচে থাকার হার (Livability): ৯২–৯৫%\n• গরম সহ্য ক্ষমতা: মাঝারি\n• শারীরিক প্রকৃতি: শক্তিশালী, সহনশীল ও পরিবর্তনশীল পরিবেশ মানানসই",
        "💡 বিশেষজ্ঞদের পর্যবেক্ষণ (EXPERT INSIGHT)ঃ\n• অত্যন্ত সহনশীল খাঁটি প্রজাতি (Pure breed)\n• ক্রস ব্রিডিং বা সংকরায়নে ব্যাপক ব্যবহৃত হয়\n• গ্রামীন ও ব্রিডিং-ভিত্তিক খামারের জন্য চমৎকার পছন্দ"
      ],
      keyPointsEn: [
        "1. Origin & Lineage: USA 🇺🇸 | Malay x Leghorn x Asiatic crosses | Pure Breed",
        "2. Production Specs: First egg at 20-22 wks; 85-90% peak; 250-280 eggs/yr (55-60g egg weight)",
        "3. Body & Health: 2.2-2.8 kg body weight with 92-95% livability & strong adaptability",
        "4. Expert Insight: Very hardy pure breed; excellent for rural farming & crossbreeding"
      ],
      keyPointsBn: [
        "১. উৎপত্তি ও লাইন: USA 🇺🇸 | ম্যালয় x লেগহর্ন x এশিয়াটিক ক্রস | পিওর ব্রিড",
        "২. ডিম উৎপাদন: ২০-২২ সপ্তাহে ডিম শুরু; ৮৫-৯০% পিক; ২৫০-২৮০টি ডিম/বছর (৫৫-৬০g ডিমের ওজন)",
        "৩. ওজন ও স্থায়িত্ব: ২.২-২.৮ কেজি ওজন এবং ৯২-৯৫% উচ্চ বেঁচে থাকার হার",
        "৪. বিশেষজ্ঞদের পর্যবেক্ষণ: অত্যন্ত সহনশীল ব্রিড; গ্রামীন খামার ও ক্রস ব্রিডিংয়ে সেরা"
      ],
    ),

    // 6. Australorp
    BrownLayerArticleItem(
      id: "australorp",
      titleEn: "Australorp (Famous Pure Breed Layer)",
      titleBn: "অস্ট্রালর্প (বিখ্যাত পিওর ব্রিড লেয়ার)",
      subtitleEn: "🔎 Origin & Breed Identity",
      subtitleBn: "🔎 উৎপত্তি ও ব্রিডের পরিচয়",
      originEn: "Australia 🇦🇺",
      originBn: "অস্ট্রেলিয়া 🇦🇺",
      companyEn: "Black Orpington utility selections",
      companyBn: "ব্ল্যাক অরপিংটন ইউটিলিটি সিলেক্টেড লাইন",
      imagePath: "assets/ps_brown_layer.jpg",
      detailsEn: [
        "🔎 ORIGIN & BREED IDENTITY:\n• Origin: Australia 🇦🇺\n• Developed From: Black Orpington\n• Type: Pure Breed\n• Breed Reputation: Famous worldwide for exceptional pure breed laying performance",
        "📊 PRODUCTION PERFORMANCE:\n• Eggs Per Year: 250–300 eggs\n• Peak Production: 88–92%\n• Egg Weight: 55–62 g\n• Production Nature: Strong among pure breeds",
        "🍽️ FEED & EFFICIENCY:\n• Feed Intake: 110–120 g/day\n• FCR (Egg Mass): 2.1–2.3\n• Efficiency: Good for a heavy pure breed",
        "⚖️ BODY & HEALTH:\n• Body Weight: 2.5–3.0 kg\n• Livability: 93–96%\n• Nature: Calm and manageable",
        "💡 EXPERT INSIGHT:\n• World famous record layer among pure breeds\n• Calm temperament makes flock management easier\n• Great combination of egg yield and heavy body size"
      ],
      detailsBn: [
        "🔎 উৎপত্তি ও ব্রিডের পরিচয়ঃ\n• উৎপত্তি: Australia 🇦🇺\n• উৎস লাইন: Black Orpington\n• টাইপ: Pure Breed\n• ব্রিড খ্যাতি: পিওর ব্রিড লেয়ার হিসেবে রেকর্ড ডিম উৎপাদনের জন্য বিশ্ব বিখ্যাত",
        "📊 উৎপাদন ক্ষমতা ও পারফরম্যান্সঃ\n• বার্ষিক ডিম উৎপাদন: ২৫০–৩০০ টি\n• পিক ডিম উৎপাদন: ৮৮–৯২%\n• ডিমের ওজন: ৫৫–৬২ গ্রাম\n• উৎপাদনের বৈশিষ্ট্য: পিওর ব্রিডের মধ্যে সর্বোচ্চ উৎপাদনশীল",
        "🍽️ খাবার ও ফিড দক্ষতাঃ\n• দৈনিক ফিড গ্রহণ: ১১০–১২০ গ্রাম/দিন\n• এফসিআর (FCR - এগ মাস): ২.১–২.৩\n• খাদ্য দক্ষতা: ভারী পিওর ব্রিডের জন্য বেশ সাশ্রয়ী",
        "⚖️ দৈহিক ওজন ও স্বাস্থ্যঃ\n• দৈহিক ওজন: ২.৫–৩.০ কেজি\n• বেঁচে থাকার হার (Livability): ৯৩–৯৬%\n• স্বভাব: অত্যন্ত শান্ত ও সহজে পরিচালনাযোগ্য",
        "💡 বিশেষজ্ঞদের পর্যবেক্ষণ (EXPERT INSIGHT)ঃ\n• পিওর ব্রিডের মধ্যে বিশ্ব রেকর্ডধারী ডিমের মুরগী\n• শান্ত মেজাজের কারণে ফার্ম পরিচালনা অনেক সহজ হয়\n• চমৎকার এগ + বডি সাইজ কম্বিনেশন"
      ],
      keyPointsEn: [
        "1. Origin & Lineage: Australia 🇦🇺 | Black Orpington selections | Pure Breed",
        "2. Production Specs: 250-300 eggs/yr with 88-92% peak lay & 55-62g egg weight",
        "3. Body & Feed: 2.5-3.0 kg heavy body weight with 2.1-2.3 FCR",
        "4. Expert Insight: World famous pure breed record layer with calm temperament"
      ],
      keyPointsBn: [
        "১. উৎপত্তি ও লাইন: Australia 🇦🇺 | ব্ল্যাক অরপিংটন সিলেক্টেড লাইন | পিওর ব্রিড",
        "২. ডিম উৎপাদন: ২৫০-৩০০টি ডিম/বছর; ৮৮-৯২% পিক এবং ৫৫-৬২g ডিমের ওজন",
        "৩. ওজন ও এফসিআর: ২.৫-৩.০ কেজি ভারী ওজন এবং ২.১-২.৩ এফসিআর",
        "৪. বিশেষজ্ঞদের পর্যবেক্ষণ: বিশ্বখ্যাত রেকর্ড ডিম প্রদানকারী শান্ত স্বভাবের জাত"
      ],
    ),

    // 7. Plymouth Rock
    BrownLayerArticleItem(
      id: "plymouth_rock",
      titleEn: "Plymouth Rock (Reliable Dual Purpose Breed)",
      titleBn: "প্লাইমাউথ রক (নির্ভরযোগ্য ডুয়েল পারপাস)",
      subtitleEn: "🔎 Origin & Breed Identity",
      subtitleBn: "🔎 উৎপত্তি ও ব্রিডের পরিচয়",
      originEn: "USA 🇺🇸",
      originBn: "যুক্তরাষ্ট্র 🇺🇸",
      companyEn: "Dual Purpose Breed (Barred Rock)",
      companyBn: "ডুয়েল পারপাস ব্রিড (বার্ড রক)",
      imagePath: "assets/ps_brown_layer.jpg",
      detailsEn: [
        "🔎 ORIGIN & BREED IDENTITY:\n• Origin: USA 🇺🇸\n• Type: Dual Purpose Breed\n• Main Use: Both egg production and meat value",
        "📊 PRODUCTION PERFORMANCE:\n• Eggs Per Year: 230–260 eggs\n• Egg Weight: 55–60 g\n• Production Nature: Moderate but dependable",
        "🍽️ FEED & EFFICIENCY:\n• Feed Intake: 110–120 g/day\n• Efficiency: Suitable for mixed-purpose farming systems",
        "⚖️ BODY & HEALTH:\n• Body Weight: 2.5–3.0 kg\n• Body Type: Strong dual-purpose structure\n• Nature: Easy to manage",
        "💡 EXPERT INSIGHT:\n• Good combination of meat and egg production\n• Easy to handle and manage in small/medium setups\n• Great choice for small farm, backyard and traditional systems"
      ],
      detailsBn: [
        "🔎 উৎপত্তি ও ব্রিডের পরিচয়ঃ\n• উৎপত্তি: USA 🇺🇸\n• টাইপ: Dual Purpose Breed\n• প্রধান ব্যবহার: ডিম উৎপাদন ও মাংস মান উভয়ের জন্য",
        "📊 উৎপাদন ক্ষমতা ও পারফরম্যান্সঃ\n• বার্ষিক ডিম উৎপাদন: ২৩০–২৬০ টি\n• ডিমের ওজন: ৫৫–৬০ গ্রাম\n• উৎপাদনের বৈশিষ্ট্য: মাঝারি কিন্তু সুষম ও ধারাবাহিক",
        "🍽️ খাবার ও ফিড দক্ষতাঃ\n• দৈনিক ফিড গ্রহণ: ১১০–১২০ গ্রাম/দিন\n• খাদ্য দক্ষতা: মিশ্র-ব্যবহারের খামার ব্যবস্থাপনায় মানানসই",
        "⚖️ দৈহিক ওজন ও স্বাস্থ্যঃ\n• দৈহিক ওজন: ২.৫–৩.০ কেজি\n• শরীরের গঠন: শক্তিশালী ডুয়েল পারপাস কঙ্কাল কাঠামো\n• মেজাজ: সহজে পরিচালনাযোগ্য ও সহনশীল",
        "💡 বিশেষজ্ঞদের পর্যবেক্ষণ (EXPERT INSIGHT)ঃ\n• চমৎকার মাংস + ডিমের মানসম্মত সমন্বয়\n• সহজে ম্যানেজ বা পরিচালনা করা যায়\n• Small farm, backyard and traditional systems এর জন্য ভালো"
      ],
      keyPointsEn: [
        "1. Origin & Type: USA 🇺🇸 | Classic Dual Purpose Breed (Barred Rock)",
        "2. Production Specs: 230-260 eggs/yr with 55-60g egg weight",
        "3. Body & Feed: 2.5-3.0 kg adult body weight with 110-120 g/day feed intake",
        "4. Expert Insight: Excellent meat + egg dual purpose combo for small & backyard farms"
      ],
      keyPointsBn: [
        "১. উৎপত্তি ও টাইপ: USA 🇺🇸 | ক্লাসিক ডুয়েল পারপাস ব্রিড (বার্ড রক)",
        "২. ডিম উৎপাদন: ২৩০-২৬০টি ডিম/বছর এবং ৫৫-৬০g ডিমের ওজন",
        "৩. ওজন ও ফিড: ২.৫-৩.০ কেজি ওজন এবং দৈনিক ১১০-১২০g খাবার গ্রহণ",
        "৪. বিশেষজ্ঞদের পর্যবেক্ষণ: পারিবারিক ও ছোট খামারে মাংস ও ডিমের সেরা সমন্বয়"
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isEng = isEnglish;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF121212) : const Color(0xFFF2F5F8),
      appBar: AppBar(
        title: Text(
          isEng ? "Brown Layer PS Summary" : "ব্রাউন লেয়ার পিএস সারসংক্ষেপ",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 19,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF00838F),
        elevation: 0.5,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final item = articles[index];
          return _buildArticleCard(context, item, isEng, isDark);
        },
      ),
    );
  }

  Widget _buildArticleCard(
    BuildContext context,
    BrownLayerArticleItem item,
    bool isEng,
    bool isDark,
  ) {
    return Card(
      elevation: 2,
      shadowColor: Colors.black.withValues(alpha: 0.08),
      margin: const EdgeInsets.only(bottom: 12),
      color: isDark ? const Color(0xFF1E293B) : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => BrownLayerArticleDetailScreen(
                item: item,
                isEnglish: isEng,
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Circular Breed Image Thumbnail
              Container(
                width: 76,
                height: 76,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFF00838F).withValues(alpha: 0.3),
                    width: 2,
                  ),
                ),
                child: ClipOval(
                  child: Image.asset(
                    item.imagePath,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: Colors.brown.shade100,
                      child: const Icon(
                        Icons.pets_rounded,
                        color: Colors.brown,
                        size: 36,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 14),

              // Title and Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isEng ? item.titleEn : item.titleBn,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: isDark ? Colors.white : const Color(0xFF1E293B),
                        height: 1.25,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      isEng ? item.subtitleEn : item.subtitleBn,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: isDark ? Colors.tealAccent : const Color(0xFF00838F),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      height: 1,
                      color: isDark ? Colors.white12 : Colors.grey.shade300,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "${isEng ? 'Origin' : 'উৎপত্তি'}: ${isEng ? item.originEn : item.originBn}",
                      style: TextStyle(
                        fontSize: 13,
                        color: isDark ? Colors.grey.shade300 : const Color(0xFF334155),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "${isEng ? 'Company' : 'প্রতিষ্ঠান'}: ${isEng ? item.companyEn : item.companyBn}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12.5,
                        color: isDark ? Colors.grey.shade400 : const Color(0xFF64748B),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 6),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
                color: isDark ? Colors.white38 : Colors.grey.shade400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BrownLayerArticleDetailScreen extends StatelessWidget {
  final BrownLayerArticleItem item;
  final bool isEnglish;

  const BrownLayerArticleDetailScreen({
    super.key,
    required this.item,
    required this.isEnglish,
  });

  @override
  Widget build(BuildContext context) {
    final isEng = isEnglish;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final details = isEng ? item.detailsEn : item.detailsBn;
    final keyPoints = isEng ? item.keyPointsEn : item.keyPointsBn;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF121212) : const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: Text(
          isEng ? item.titleEn : item.titleBn,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.5,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF00838F),
        elevation: 0.5,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Image Card
            Container(
              height: 190,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.asset(
                  item.imagePath,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.brown.shade200,
                    child: const Center(
                      child: Icon(
                        Icons.pets_rounded,
                        size: 64,
                        color: Colors.brown,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 18),

            // Breed Title Banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF1E293B) : Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: const Color(0xFF00838F).withValues(alpha: 0.3),
                  width: 1.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isEng ? item.titleEn : item.titleBn,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: isDark ? Colors.white : const Color(0xFF0F172A),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "🌐 ${isEng ? 'Origin' : 'উৎপত্তি'}: ${isEng ? item.originEn : item.originBn}  |  🏛️ ${isEng ? item.companyEn : item.companyBn}",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: isDark ? Colors.tealAccent : const Color(0xFF00838F),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),

            // Key Points Section
            if (keyPoints.isNotEmpty) ...[
              Text(
                isEng ? "💡 Key Summary Points" : "💡 সারসংক্ষেপ মূল পয়েন্টসমূহ",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.tealAccent : const Color(0xFF00838F),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: isDark
                      ? const Color(0xFF00838F).withValues(alpha: 0.15)
                      : const Color(0xFFE0F7FA),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: keyPoints
                      .map(
                        (kp) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("• ", style: TextStyle(fontWeight: FontWeight.bold)),
                              Expanded(
                                child: Text(
                                  kp,
                                  style: TextStyle(
                                    fontSize: 13.5,
                                    height: 1.4,
                                    fontWeight: FontWeight.w600,
                                    color: isDark ? Colors.white : const Color(0xFF004D40),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(height: 20),
            ],

            // Details Paragraphs
            Text(
              isEng ? "📋 Comprehensive Technical Details" : "📋 বিস্তারিত টেকনিক্যাল নির্দেশিকা",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : const Color(0xFF0F172A),
              ),
            ),
            const SizedBox(height: 10),
            ...details.map(
              (p) => Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF1E293B) : Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Text(
                  p,
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.55,
                    color: isDark ? Colors.grey.shade200 : const Color(0xFF334155),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
