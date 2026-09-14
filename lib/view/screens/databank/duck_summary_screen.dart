import 'package:flutter/material.dart';

class DuckArticleItem {
  final String id;
  final String titleEn;
  final String titleBn;
  final String subtitleEn;
  final String subtitleBn;
  final String originEn;
  final String originBn;
  final String infoKeyEn;
  final String infoKeyBn;
  final String infoValEn;
  final String infoValBn;
  final String imagePath;
  final List<String> detailsEn;
  final List<String> detailsBn;
  final List<String> keyPointsEn;
  final List<String> keyPointsBn;

  const DuckArticleItem({
    required this.id,
    required this.titleEn,
    required this.titleBn,
    required this.subtitleEn,
    required this.subtitleBn,
    required this.originEn,
    required this.originBn,
    required this.infoKeyEn,
    required this.infoKeyBn,
    required this.infoValEn,
    required this.infoValBn,
    required this.imagePath,
    required this.detailsEn,
    required this.detailsBn,
    required this.keyPointsEn,
    required this.keyPointsBn,
  });
}

class DuckPSSummaryScreen extends StatelessWidget {
  final bool isEnglish;

  const DuckPSSummaryScreen({super.key, required this.isEnglish});

  static const List<DuckArticleItem> articles = [
    // 1. Khaki Campbell
    DuckArticleItem(
      id: "khaki_campbell",
      titleEn: "Khaki Campbell (World #1 Egg Duck)",
      titleBn: "খাকি ক্যাম্পবেল (বিশ্বের ১ নম্বর ডিমের হাঁস)",
      subtitleEn: "🔎 Origin & Genetics",
      subtitleBn: "🔎 উৎপত্তি ও জেনেটিক্স",
      originEn: "United Kingdom (UK) 🇬🇧",
      originBn: "যুক্তরাজ্য (ইউকে) 🇬🇧",
      infoKeyEn: "Developed By",
      infoKeyBn: "উন্নয়নকারী",
      infoValEn: "Adele Campbell in 1901 (Mallard × Rouen × Runner)",
      infoValBn: "অ্যাডেল ক্যাম্পবেল (১৯০১, ম্যালার্ড × রুয়েন × রানার)",
      imagePath: "assets/ps_duck.jpg",
      detailsEn: [
        "🔎 ORIGIN & GENETICS:\n• Origin: United Kingdom (UK) 🇬🇧\n• Developed by: Adele Campbell in 1901\n• Genetic Background: Indian Runner × Rouen × Mallard\n• Type: Specialized Egg Layer Duck",
        "📊 PRODUCTION PERFORMANCE:\n• Age at First Egg: 18–20 weeks\n• Peak Production: 90–95%\n• Eggs Per Year: 280–320 eggs (Best recorded: 340+ eggs/yr)\n• Persistency: Excellent, long laying cycle\n• Egg Weight: 65–75 g\n• Egg Color: White to slightly greenish",
        "🍽️ FEED & EFFICIENCY:\n• Feed Intake: 140–160 g/day\n• FCR (Egg Mass): 2.3–2.6\n• Feed Efficiency: Very high\n• Economic Value: Excellent feed-to-egg conversion",
        "⚖️ BODY & HEALTH:\n• Adult Body Weight: 1.8–2.2 kg\n• Livability: 94–96%\n• Disease Resistance: Medium\n• Body Type: Light and active layer type",
        "🌡️ FARM SUITABILITY:\n• Suitable for intensive & semi-intensive farming systems\n• Can perform well without pond water if proper management is maintained",
        "🇧🇩 BANGLADESH CONTEXT:\n• One of the most profitable egg ducks for Bangladesh\n• Very suitable for commercial egg production farms\n• Excellent output compared with feed cost",
        "💡 ADVANCED NOTES:\n• Considered the best egg laying duck in the world\n• Very useful as a base duck for layer breeding programs\n• With proper selection, productivity can be maintained well long-term"
      ],
      detailsBn: [
        "🔎 উৎপত্তি ও জেনেটিক্সঃ\n• উৎপত্তি: United Kingdom (UK) 🇬🇧\n• উন্নয়নকারী: Adele Campbell in 1901\n• জেনেটিক ব্যাকগ্রাউন্ড: Indian Runner × Rouen × Mallard\n• টাইপ: স্পেশালাইজড এগ লেয়ার হাঁস",
        "📊 ডিম উৎপাদন ক্ষমতা ও মানদণ্ডঃ\n• প্রথম ডিমের বয়স: ১৮–২০ সপ্তাহ\n• পিক ডিম উৎপাদন: ৯০–৯৫%\n• বার্ষিক ডিম উৎপাদন: ২৮০–৩২০ টি (সর্বোচ্চ রেকর্ড: ৩৪০+ ডিম/বছর)\n• উৎপাদনে স্থায়িত্ব: চমৎকার ও দীর্ঘস্থায়ী লেয়িং সাইকেল\n• ডিমের ওজন: ৬৫–৭৫ গ্রাম\n• ডিমের রঙ: সাদা থেকে হালকা সবুজ",
        "🍽️ খাবার ও ফিড দক্ষতাঃ\n• দৈনিক ফিড গ্রহণ: ১৪০–১৬০ গ্রাম/দিন\n• এফসিআর (FCR - এগ মাস): ২.৩–২.৬\n• ফিড দক্ষতা: অত্যন্ত উচ্চ\n• অর্থনৈতিক মূল্যায়ন: চমৎকার ফিড-টু-এগ কনভার্সন রেশিও",
        "⚖️ দৈহিক ওজন ও স্বাস্থ্যঃ\n• প্রাপ্তবয়স্ক দৈহিক ওজন: ১.৮–২.২ কেজি\n• বেঁচে থাকার হার (Livability): ৯৪–৯৬%\n• রোগ প্রতিরোধ ক্ষমতা: মাঝারি\n• শরীরের ধরন: হালকা ও অত্যন্ত সক্রিয় লেয়ার বডি টাইপ",
        "🌡️ খামার উপযোগিতাঃ\n• নিবিড় (Intensive) ও আধা-নিবিড় (Semi-intensive) খামারের উপযোগী\n• সঠিক ব্যবস্থাপনায় পুকুরের পানি ছাড়াও চমৎকার পারফর্ম করে",
        "🇧🇩 বাংলাদেশ প্রেক্ষাপটঃ\n• বাংলাদেশের জন্য অন্যতম সেরা লাভজনক ডিমের হাঁসের জাত\n• বাণিজ্যিক ডিম উৎপাদন খামারের জন্য অত্যন্ত উপযোগী\n• খাবার খরচের তুলনায় অসাধারণ ডিমের আউটপুট",
        "💡 অগ্রবর্তী নির্দেশিকা (ADVANCED NOTES)ঃ\n• বিশ্বের সেরা ডিম পাড়া হাঁসের জাত হিসেবে বিবেচিত\n• লেয়ার ব্রিডিং প্রোগ্রামের বেস ডাক হিসেবে অত্যন্ত কার্যকর\n• সঠিক নির্বাচন ও ব্যবস্থাপনায় উচ্চ উৎপাদন দীর্ঘমেয়াদে বজায় থাকে"
      ],
      keyPointsEn: [
        "1. Origin & Genetics: UK 🇬🇧 | Adele Campbell (1901) | Indian Runner x Rouen x Mallard cross",
        "2. Production Specs: First egg at 18-20 wks; 90-95% peak; 280-320 eggs/yr (Best: 340+)",
        "3. Feed & FCR: 140-160 g/day feed intake with 2.3-2.6 FCR (Egg Mass)",
        "4. Bangladesh & Farm Fit: Top profitable egg duck in Bangladesh; works without pond water under good care"
      ],
      keyPointsBn: [
        "১. উৎপত্তি ও জেনেটিক্স: যুক্তরাজ্য 🇬🇧 | অ্যাডেল ক্যাম্পবেল (১৯০১) | রানার x রুয়েন x ম্যালার্ড ক্রস",
        "২. ডিম উৎপাদন: ১৮-২০ সপ্তাহে ডিম শুরু; ৯০-৯৫% পিক; ২৮০-৩২০টি ডিম/বছর (রেকর্ড ৩৪০+)",
        "৩. ফিড ও এফসিআর: দৈনিক ১৪০-১৬০g ফিড এবং ২.৩-২.৬ এফসিআর (এগ মাস)",
        "৪. বাংলাদেশ প্রেক্ষাপট: বাংলাদেশের জন্য সবচেয়ে লাভজনক ডিমের হাঁস; পুকুর ছাড়াও খামারে উপযোগী"
      ],
    ),

    // 2. Indian Runner
    DuckArticleItem(
      id: "indian_runner",
      titleEn: "Indian Runner (High Activity Egg Duck)",
      titleBn: "ইন্ডিয়ান রানার (উচ্চ সক্রিয় ডিমের হাঁস)",
      subtitleEn: "🔎 Origin & Genetics",
      subtitleBn: "🔎 উৎপত্তি ও জেনেটিক্স",
      originEn: "Indonesia 🇮🇩",
      originBn: "ইন্দোনেশিয়া 🇮🇩",
      infoKeyEn: "Breed Type",
      infoKeyBn: "ব্রিডের ধরন",
      infoValEn: "Ancient domesticated erect-standing duck line",
      infoValBn: "প্রাচীন খাড়া ভঙ্গিমার গৃহপালিত হাঁস",
      imagePath: "assets/ps_duck.jpg",
      detailsEn: [
        "🔎 ORIGIN & GENETICS:\n• Origin: Indonesia 🇮🇩\n• Breed Type: Ancient domesticated duck breed\n• Type: Egg Layer Duck\n• Special Identity: Famous for its upright body posture",
        "📊 PRODUCTION PERFORMANCE:\n• Age at First Egg: Around 20 weeks\n• Peak Production: 85–90%\n• Eggs Per Year: 250–300 eggs\n• Egg Weight: 60–70 g\n• Production Nature: Good and consistent under active free-range conditions",
        "🍽️ FEED & EFFICIENCY:\n• Feed Intake: 130–150 g/day\n• FCR (Egg Mass): Around 2.5\n• Feed Use Efficiency: Good, especially in scavenging systems",
        "⚖️ BODY & HEALTH:\n• Adult Body Weight: 1.5–2.0 kg\n• Livability: 93–96%\n• Body Type: Slim, light and highly mobile",
        "🌿 SPECIAL BEHAVIOUR:\n• Stands upright like a penguin\n• Very active and excellent grazer\n• Searches food efficiently in open areas\n• Helpful in insect and snail control",
        "🇧🇩 BANGLADESH CONTEXT:\n• Very suitable for free-range farming in Bangladesh\n• Ideal for paddy field and village-based systems\n• Low-cost management possible in rural conditions",
        "💡 ADVANCED NOTES:\n• Best suited for low-input egg duck farming\n• Highly active nature makes it different from most other duck breeds\n• Good option for farmers wanting both egg output and field adaptability"
      ],
      detailsBn: [
        "🔎 উৎপত্তি ও জেনেটিক্সঃ\n• উৎপত্তি: Indonesia 🇮🇩\n• ব্রিডের ধরন: প্রাচীন গৃহপালিত হাঁসের জাত\n• টাইপ: ডিমের হাঁস (Egg Layer Duck)\n• বিশেষ পরিচয়: সোজা বা খাড়া দৈহিক ভঙ্গিমার জন্য বিশ্বখ্যাত",
        "📊 ডিম উৎপাদন ক্ষমতা ও মানদণ্ডঃ\n• প্রথম ডিমের বয়স: আনুমানিক ২০ সপ্তাহ\n• পিক ডিম উৎপাদন: ৮৫–৯০%\n• বার্ষিক ডিম উৎপাদন: ২৫০–৩০০ টি\n• ডিমের ওজন: ৬০–৭০ গ্রাম\n• উৎপাদনের বৈশিষ্ট্য: মুক্ত চলাচলের মুক্তাঙ্গন খামারে অত্যন্ত ধারাবাহিক ডিম উৎপাদন",
        "🍽️ খাবার ও ফিড দক্ষতাঃ\n• দৈনিক ফিড গ্রহণ: ১৩০–১৫০ গ্রাম/দিন\n• এফসিআর (FCR - এগ মাস): আনুমানিক ২.৫\n• খাদ্য দক্ষতা: চমৎকার, বিশেষ করে উন্মুক্ত কুড়িয়ে খাওয়ার সিস্টেমে",
        "⚖️ দৈহিক ওজন ও স্বাস্থ্যঃ\n• প্রাপ্তবয়স্ক দৈহিক ওজন: ১.৫–২.০ কেজি\n• বেঁচে থাকার হার (Livability): ৯৩–৯৬%\n• শরীরের ধরন: ছিপছিপে, হালকা ও অত্যন্ত ক্ষিপ্র গতিসম্পন্ন",
        "🌿 বিশেষ আচরণ ও স্বভাবঃ\n• পেঙ্গুইনের মতো সোজা বা খাড়া ভঙ্গিমায় দাঁড়ায় ও দৌড়ায়\n• অত্যন্ত সক্রিয় ও চমৎকার চরে খাওয়ার স্বভাব\n• উন্মুক্ত এলাকায় নিজে নিজেই দক্ষতার সাথে খাবার খুঁজে নেয়\n• ক্ষতিকর পোকা ও শামুক নিয়ন্ত্রণে অত্যন্ত কার্যকর",
        "🇧🇩 বাংলাদেশ প্রেক্ষাপটঃ\n• বাংলাদেশে মুক্তাঙ্গন হাঁস পালনের জন্য অত্যন্ত উপযোগী\n• ধানক্ষেত ও গ্রামীন প্রাকৃতিক পরিবেশের জন্য সেরা পছন্দ\n• গ্রামীন পরিবেশে কম খরচে সহজ লালন-পালন সম্ভব",
        "💡 অগ্রবর্তী নির্দেশিকা (ADVANCED NOTES)ঃ\n• কম খরচের (Low-input) ডিমের হাঁস খামারের জন্য সেরা পছন্দ\n• অত্যন্ত সক্রিয় স্বভাব অন্য যেকোনো হাঁসের জাত থেকে এটিকে আলাদা করে\n• ডিম উৎপাদন ও মাঠপর্যায়ের মানানসইতার চমৎকার সমন্বয়"
      ],
      keyPointsEn: [
        "1. Origin & Posture: Indonesia 🇮🇩 | Ancient upright-standing penguin posture",
        "2. Production Specs: First egg at 20 wks; 85-90% peak; 250-300 eggs/yr (60-70g egg weight)",
        "3. Body & Feed: 1.5-2.0 kg slim body weight with 130-150 g/day feed intake",
        "4. Free-Range & Bangladesh: Ideal for paddy fields & village systems with snail/insect control"
      ],
      keyPointsBn: [
        "১. উৎপত্তি ও ভঙ্গি: ইন্দোনেশিয়া 🇮🇩 | প্রাচীন পেঙ্গুইনের মতো সোজা খাড়া ভঙ্গি",
        "২. ডিম উৎপাদন: ২০ সপ্তাহে ডিম শুরু; ৮৫-৯০% পিক; ২৫০-৩০০টি ডিম/বছর (৬০-৭০g ডিমের ওজন)",
        "৩. ওজন ও ফিড: ১.৫-২.০ কেজি হালকা ওজন এবং দৈনিক ১৩০-১৫০g খাবার গ্রহণ",
        "৪. বাংলাদেশ প্রেক্ষাপট: ধানক্ষেত ও গ্রামীন মুক্তাঙ্গন খামারে পোকা/শামুক দমনে সেরা"
      ],
    ),

    // 3. Pekin Duck
    DuckArticleItem(
      id: "pekin_duck",
      titleEn: "Pekin Duck (Global Meat Industry Base)",
      titleBn: "পেকিন ডাক (বিশ্ব মাংস শিল্পের মূল ভিত্তি)",
      subtitleEn: "🔎 Origin & Genetics",
      subtitleBn: "🔎 উৎপত্তি ও জেনেটিক্স",
      originEn: "China 🇨🇳",
      originBn: "চীন 🇨🇳",
      infoKeyEn: "Domesticated From",
      infoKeyBn: "উৎস লাইন",
      infoValEn: "Wild Mallard (Anas platyrhynchos)",
      infoValBn: "বুনো ম্যালার্ড (Anas platyrhynchos)",
      imagePath: "assets/ps_duck.jpg",
      detailsEn: [
        "🔎 ORIGIN & GENETICS:\n• Origin: China 🇨🇳\n• Domesticated From: Wild Mallard\n• Type: Meat Duck / Broiler Duck\n• Industry Importance: Foundation breed of modern duck meat production",
        "📊 PRODUCTION PERFORMANCE:\n• Market Age: 35–42 days\n• Final Body Weight: 3.0–3.5 kg\n• Growth Rate: Very fast\n• Uniformity: High\n• Commercial Value: Excellent for broiler duck production",
        "🍽️ FEED & EFFICIENCY:\n• Feed Intake: High\n• FCR: 2.5–2.8\n• Feed Conversion: Good for heavy meat output",
        "⚖️ BODY & HEALTH:\n• Body Type: Heavy and broad meat-type duck\n• Livability: 95–97%\n• Market Appeal: White feather and heavy carcass are commercially valuable",
        "🌍 INDUSTRY ROLE:\n• Acts as the main base breed of the global duck meat industry\n• Widely used in commercial breeding and meat production systems",
        "🇧🇩 BANGLADESH CONTEXT:\n• Very useful for meat duck farming in Bangladesh\n• Suitable for both medium and large commercial farms\n• Good option where fast growth and early market age are required",
        "💡 ADVANCED NOTES:\n• Can be used as parent stock line\n• Important base for hybrid meat duck development\n• Strong commercial potential in organized duck farming"
      ],
      detailsBn: [
        "🔎 উৎপত্তি ও জেনেটিক্সঃ\n• উৎপত্তি: China 🇨🇳\n• উৎস লাইন: বুনো ম্যালার্ড (Wild Mallard)\n• টাইপ: ব্রয়লার হাঁস / মাংসের হাঁস\n• শিল্পের গুরুত্ব: আধুনিক বিশ্ব ব্রয়লার হাঁস শিল্পের মূল ভিত্তি",
        "📊 উৎপাদন ক্ষমতা ও মানদণ্ডঃ\n• বাজারজাত বয়স: ৩৫–৪২ দিন\n• চূড়ান্ত দৈহিক ওজন: ৩.০–৩.৫ কেজি\n• বৃদ্ধির গতি: অত্যন্ত দ্রুত\n• ইউনিফরমিটি: উচ্চ\n• বাণিজ্যিক মূল্য: ব্রয়লার হাঁস উৎপাদনের জন্য চমৎকার",
        "🍽️ খাবার ও ফিড দক্ষতাঃ\n• দৈনিক ফিড গ্রহণ: উচ্চ (High)\n• এফসিআর (FCR): ২.৫–২.৮\n• খাদ্য রূপান্তর: ভারী মাংস আউটপুটের জন্য অত্যন্ত সাশ্রয়ী",
        "⚖️ দৈহিক ওজন ও স্বাস্থ্যঃ\n• শরীরের গঠন: ভারী ও চওড়া মাংসের হাঁসের বডি স্ট্রাকচার\n• বেঁচে থাকার হার (Livability): ৯৫–৯৭%\n• বাজার আকর্ষণ: ধবধবে সাদা পালক ও ভারী চামড়া বাজারে উচ্চ মূল্য এনে দেয়",
        "🌍 গ্লোবাল ইন্ডাস্ট্রি রোলঃ\n• বিশ্ব ডাক মিট ইন্ডাস্ট্রির প্রধান বেস ব্রিড হিসেবে কাজ করে\n• বাণিজ্যিক প্রজনন ও মাংস উৎপাদন সিস্টেমে ব্যাপকভাবে ব্যবহৃত হয়",
        "🇧🇩 বাংলাদেশ প্রেক্ষাপটঃ\n• বাংলাদেশে মাংসের হাঁস খামারের জন্য অত্যন্ত উপযোগী\n• মাঝারি ও বড় বাণিজ্যিক খামারের জন্য সমানভাবে মানানসই\n• যেখানে দ্রুত বৃদ্ধি ও আগাম বাজারজাতকরণ প্রয়োজন সেখানে সেরা চয়েস",
        "💡 অগ্রবর্তী নির্দেশিকা (ADVANCED NOTES)ঃ\n• প্যারেন্ট স্টক (PS) লাইন হিসেবে ব্যবহার করা যায়\n• হাইব্রিড মিট ডাক তৈরির গুরুত্বপূর্ণ মূল ভিত্তি\n• সুসংগঠিত হাঁস খামারে দুর্দান্ত বাণিজ্যিক সম্ভাবনা রয়েছে"
      ],
      keyPointsEn: [
        "1. Origin & Role: China 🇨🇳 | Domesticated from Wild Mallard | Foundation meat duck breed",
        "2. Market Specs: 3.0-3.5 kg body weight at 35-42 days market age",
        "3. Feed Efficiency: 2.5-2.8 FCR for heavy meat output & high livability (95-97%)",
        "4. Bangladesh & Commercial Fit: Highly suitable for medium & large commercial broiler duck farms"
      ],
      keyPointsBn: [
        "১. উৎপত্তি ও রোল: চীন 🇨🇳 | বুনো ম্যালার্ড উৎস | ব্রয়লার হাঁস শিল্পের প্রধান মূলভিত্তি",
        "২. বাজারজাত মানদণ্ড: ৩৫-৪২ দিনে ৩.০-৩.৫ কেজি চূড়ান্ত দৈহিক ওজন",
        "৩. ফিড ও এফসিআর: ২.৫-২.৮ এফসিআর এবং ৯৫-৯৭% উচ্চ বেঁচে থাকার হার",
        "৪. বাংলাদেশ প্রেক্ষাপট: বাংলাদেশে মাঝারি ও বড় বাণিজ্যিক মিট ডাক খামারের জন্য সেরা"
      ],
    ),

    // 4. Cherry Valley
    DuckArticleItem(
      id: "cherry_valley",
      titleEn: "Cherry Valley (Improved Pekin Hybrid)",
      titleBn: "চেরি ভ্যালি (উন্নত পেকিন হাইব্রিড)",
      subtitleEn: "🔎 Origin & Genetics",
      subtitleBn: "🔎 উৎপত্তি ও জেনেটিক্স",
      originEn: "United Kingdom (UK) 🇬🇧",
      originBn: "যুক্তরাজ্য (ইউকে) 🇬🇧",
      infoKeyEn: "Developed From",
      infoKeyBn: "উন্নয়নকারী প্রতিষ্ঠান",
      infoValEn: "Selected Pekin lines by Cherry Valley Farms UK",
      infoValBn: "চেরি ভ্যালি ফার্মস ইউকে (উন্নত পেকিন সিলেকশন)",
      imagePath: "assets/ps_duck.jpg",
      detailsEn: [
        "🔎 ORIGIN & GENETICS:\n• Origin: United Kingdom (UK) 🇬🇧\n• Developed From: Selected Pekin lines\n• Type: Commercial Hybrid Meat Duck\n• Breed Nature: Improved high-performance Pekin type hybrid",
        "📊 PRODUCTION PERFORMANCE:\n• Market Age: 35–40 days\n• Final Body Weight: 3.2–3.8 kg\n• Growth Rate: Faster than standard Pekin\n• Uniformity: Excellent\n• Commercial Output: Very strong in broiler duck farming",
        "🍽️ FEED & EFFICIENCY:\n• FCR: 2.4–2.6\n• Feed Efficiency: Better than Pekin\n• Economic Value: Strong return due to rapid growth and efficient conversion",
        "⚖️ BODY & HEALTH:\n• Livability: 95–97%\n• Body Type: Heavy, uniform, commercial meat duck\n• Processing Value: Very suitable for premium meat market",
        "🌍 INDUSTRY ROLE:\n• Considered a commercial standard in duck broiler production\n• Widely recognized for intensive meat farming systems",
        "🇧🇩 BANGLADESH CONTEXT:\n• Very suitable for commercial meat duck farming in Bangladesh\n• Fast ROI makes it highly attractive to investors and farmers\n• Best choice where quick turnover is needed",
        "💡 ADVANCED NOTES:\n• High uniformity in flock performance\n• Excellent hybrid for commercial integration\n• Suitable for export-quality meat production under proper management"
      ],
      detailsBn: [
        "🔎 উৎপত্তি ও জেনেটিক্সঃ\n• উৎপত্তি: United Kingdom (UK) 🇬🇧\n• উৎস লাইন: সিলেক্টিভ পেকিন লাইন\n• টাইপ: কমার্শিয়াল হাইব্রিড মাংসের হাঁস\n• ব্রিডের চরিত্র: উন্নত উচ্চ-উৎপাদনশীল পেকিন টাইপ হাইব্রিড",
        "📊 উৎপাদন ক্ষমতা ও মানদণ্ডঃ\n• বাজারজাত বয়স: ৩৫–৪০ দিন\n• চূড়ান্ত দৈহিক ওজন: ৩.২–৩.৮ কেজি\n• বৃদ্ধির গতি: সাধারণ পেকিন হাঁসের চেয়েও দ্রুত\n• ইউনিফরমিটি: চমৎকার\n• বাণিজ্যিক আউটপুট: ব্রয়লার হাঁস খামারে অত্যন্ত শক্তিশালী",
        "🍽️ খাবার ও ফিড দক্ষতাঃ\n• এফসিআর (FCR): ২.৪–২.৬\n• খাদ্য দক্ষতা: পেকিন হাঁসের চেয়েও উন্নত\n• অর্থনৈতিক মান: দ্রুত বৃদ্ধি ও খাদ্য রূপান্তরের কারণে উচ্চ মুনাফা লাভ",
        "⚖️ দৈহিক ওজন ও স্বাস্থ্যঃ\n• বেঁচে থাকার হার (Livability): ৯৫–৯৭%\n• শরীরের গঠন: ভারী, সুষম ও বাণিজ্যিক ব্রয়লার বডি টাইপ\n• প্রক্রিয়াজাতকরণ মান: প্রিমিয়াম মাংসের বাজারের জন্য অত্যন্ত উপযোগী",
        "🌍 গ্লোবাল ইন্ডাস্ট্রি রোলঃ\n• হাঁসের ব্রয়লার উৎপাদনে বাণিজ্যিক মানদণ্ড হিসেবে বিবেচিত\n• নিবিড় মাংসের হাঁস খামার সিস্টেমে বিশ্বব্যাপী স্বীকৃত",
        "🇧🇩 বাংলাদেশ প্রেক্ষাপটঃ\n• বাংলাদেশে বাণিজ্যিক মাংসের হাঁস খামারের জন্য অত্যন্ত উপযোগী\n• দ্রুত বিনিয়োগের লাভ (Fast ROI) খামারি ও বিনিয়োগকারীদের জন্য আকর্ষণীয়\n• যেখানে দ্রুত মূলধন ফেরত বা টার্নওভার প্রয়োজন সেখানে সেরা চয়েস",
        "💡 অগ্রবর্তী নির্দেশিকা (ADVANCED NOTES)ঃ\n• ঝাঁকের পারফরম্যান্সে উচ্চ ইউনিফরমিটি বজায় থাকে\n• বাণিজ্যিক ইন্টিগ্রেশনের জন্য চমৎকার হাইব্রিড হাঁস\n• সঠিক ব্যবস্থাপনায় রপ্তানি-মানের মাংস উৎপাদনের উপযোগী"
      ],
      keyPointsEn: [
        "1. Origin & Type: UK 🇬🇧 | Selected Pekin lines | Commercial Hybrid Meat Duck",
        "2. Ultra-Fast Growth: 3.2-3.8 kg market body weight in 35-40 days",
        "3. Feed Efficiency: 2.4-2.6 FCR with superior meat output & 95-97% livability",
        "4. Commercial ROI: Commercial standard in duck broiler farming with fast return"
      ],
      keyPointsBn: [
        "১. উৎপত্তি ও টাইপ: যুক্তরাজ্য 🇬🇧 | সিলেক্টিভ পেকিন লাইন | কমার্শিয়াল হাইব্রিড মিট ডাক",
        "২. দ্রুততম ওজন অর্জন: মাত্র ৩৫-৪০ দিনে ৩.২-৩.৮ কেজি চূড়ান্ত বাজারজাত ওজন",
        "৩. ফিড দক্ষতা: ২.৪-২.৬ এফসিআর এবং ৯৫-৯৭% উচ্চ বেঁচে থাকার হার",
        "৪. বাণিজ্যিক লাভ: দ্রুত রিটার্ন ও বাণিজ্যিক ব্রয়লার হাঁস খামারের জন্য সেরা চয়েস"
      ],
    ),

    // 5. Muscovy Duck
    DuckArticleItem(
      id: "muscovy_duck",
      titleEn: "Muscovy Duck (Unique Meat Duck)",
      titleBn: "মাসকোভি ডাক (ব্যতিক্রমী মাংসের হাঁস)",
      subtitleEn: "🔎 Origin & Genetics",
      subtitleBn: "🔎 উৎপত্তি ও জেনেটিক্স",
      originEn: "South America 🌎",
      originBn: "দক্ষিণ আমেরিকা 🌎",
      infoKeyEn: "Scientific Identity",
      infoKeyBn: "বৈজ্ঞানিক পরিচয়",
      infoValEn: "Cairina moschata (Non-Mallard distinct species)",
      infoValBn: "Cairina moschata (ম্যালার্ড বহির্ভূত স্বতন্ত্র প্রজাতি)",
      imagePath: "assets/ps_duck.jpg",
      detailsEn: [
        "🔎 ORIGIN & GENETICS:\n• Origin: South America 🌎\n• Scientific Identity: Cairina moschata\n• Special Note: Not a true duck like Mallard-derived domestic ducks\n• Type: Meat Duck + Breeding Duck",
        "📊 PRODUCTION PERFORMANCE:\n• Eggs Per Year: 120–180 eggs\n• Growth Rate: Medium\n• Production Type: Better known for meat quality than egg output",
        "⚖️ BODY & HEALTH:\n• Male Body Weight: 4–5 kg\n• Female Body Weight: 2–3 kg\n• Body Type: Strong, meaty, muscular\n• Health Strength: Hardy under village conditions",
        "🍽️ FEED & EFFICIENCY:\n• Feed Requirement: Low to moderate\n• FCR: Good in low-input systems\n• Management Cost: Comparatively lower in rural farming",
        "💡 SPECIAL FEATURES:\n• Produces low-fat meat\n• Meat quality is highly valued\n• Usually quieter than common ducks\n• Does not quack like typical domestic ducks",
        "🇧🇩 BANGLADESH CONTEXT:\n• Easy to rear in village and low-cost farm systems\n• Useful where feed cost needs to be minimized\n• Good choice for farmers wanting hardy meat ducks",
        "💡 ADVANCED NOTES:\n• Can be crossed with Pekin to produce Mule duck\n• Meat quality is superior in many niche markets\n• Very important for special breeding and alternative meat duck systems"
      ],
      detailsBn: [
        "🔎 উৎপত্তি ও জেনেটিক্সঃ\n• উৎপত্তি: South America 🌎\n• বৈজ্ঞানিক পরিচয়: Cairina moschata\n• বিশেষ নোট: সাধারণ ম্যালার্ড হাঁসের প্রজাতি থেকে সম্পূর্ণ আলাদা\n• টাইপ: মাংসের হাঁস + ব্রিডিং হাঁস",
        "📊 উৎপাদন ক্ষমতা ও মানদণ্ডঃ\n• বার্ষিক ডিম উৎপাদন: ১২০–১৮০ টি\n• বৃদ্ধির গতি: মাঝারি\n• উৎপাদনের ধরণ: ডিমের চেয়ে প্রিমিয়াম মাংসের মানের জন্য বিখ্যাত",
        "⚖️ দৈহিক ওজন ও স্বাস্থ্যঃ\n• পুরুষ (নর) হাঁসের ওজন: ৪–৫ কেজি\n• স্ত্রী (মাদী) হাঁসের ওজন: ২–৩ কেজি\n• শরীরের গঠন: শক্তিশালী, মাংসল ও পেশীবহুল বডি স্ট্রাকচার\n• স্বাস্থ্য সক্ষমতা: গ্রামীন ও প্রতিকূল পরিবেশে অত্যন্ত সহনশীল",
        "🍽️ খাবার ও ফিড দক্ষতাঃ\n• খাবারের চাহিদা: কম থেকে মাঝারি\n• এফসিআর (FCR): কম খরচের সিস্টেমে অত্যন্ত কার্যকর\n• ব্যবস্থাপনা খরচ: গ্রামীন খামারে তুলনামূলকভাবে বেশ কম",
        "💡 বিশেষ বৈশিষ্ট্যসমূহঃ\n• চর্বিমুক্ত লাল মাংস উৎপাদন করে\n• মাংসের মান ও স্বাদ বাজারে অত্যন্ত সমাদৃত\n• সাধারণ হাঁসের তুলনায় অনেক বেশি শান্ত ও নিস্তব্ধ\n• সাধারণ হাঁসের মতো উচ্চ শব্দে প্যাক-প্যাক শব্দ করে না",
        "🇧🇩 বাংলাদেশ প্রেক্ষাপটঃ\n• বাংলাদেশের গ্রামীন ও কম খরচের খামার সিস্টেমে সহজে লালন-পালনযোগ্য\n• যেখানে খাবার খরচ সর্বনিম্ন রাখা প্রয়োজন সেখানে অত্যন্ত উপযোগী\n• সহনশীল ও ওজনে ভারী মাংসের হাঁস পেতে খামারিদের সেরা পছন্দ",
        "💡 অগ্রবর্তী নির্দেশিকা (ADVANCED NOTES)ঃ\n• পেকিন হাঁসের সাথে ক্রস করিয়ে 'মিউল ডাক' (Mule duck) তৈরি করা যায়\n• অনেক প্রিমিয়াম বাজারে এর মাংসের চাহিদা ও দাম অত্যন্ত বেশি\n• বিশেষ ব্রিডিং ও বিকল্প ব্রয়লার হাঁস সিস্টেমে অত্যন্ত গুরুত্বপূর্ণ ভূমিকা রাখে"
      ],
      keyPointsEn: [
        "1. Origin & Species: South America 🌎 | Cairina moschata | Distinct non-Mallard species",
        "2. Heavy Size & Meat: 4-5 kg male adult weight with low-fat gourmet red meat",
        "3. Quiet Behaviour: Does not quack like common ducks; very hardy in village setups",
        "4. Breeding Value: Can cross with Pekin to produce Mule ducks; ideal for low-cost systems"
      ],
      keyPointsBn: [
        "১. উৎপত্তি ও প্রজাতি: দক্ষিণ আমেরিকা 🌎 | Cairina moschata | সাধারণ হাঁস থেকে স্বতন্ত্র প্রজাতি",
        "২. বিশাল আকার ও চর্বিহীন মাংস: ৪-৫ কেজি পুরুষ হাঁসের ওজন এবং চর্বিমুক্ত সুস্বাদু লাল মাংস",
        "৩. নিস্তব্ধ মেজাজ: প্যাক-প্যাক শব্দ করে না; গ্রামীন খামার পরিবেশে সর্বোচ্চ সহনশীল",
        "৪. ব্রিডিং গুরুত্ব: পেকিনের সাথে ক্রস বানিয়ে মিউল ডাক উৎপাদনে ও কম খরচে লাভজনক"
      ],
    ),

    // 6. Jinding Duck
    DuckArticleItem(
      id: "jinding_duck",
      titleEn: "Jinding Duck (Chinese High-Yield Egg Duck)",
      titleBn: "জিনডিং ডাক (চীনা উচ্চ ফলনশীল ডিমের হাঁস)",
      subtitleEn: "🔎 Origin & Genetic Background",
      subtitleBn: "🔎 উৎপত্তি ও জেনেটিক ব্যাকগ্রাউন্ড",
      originEn: "China 🇨🇳 (Zhejiang Province)",
      originBn: "চীন 🇨🇳 (ঝেজিয়াং প্রদেশ)",
      infoKeyEn: "Developed By",
      infoKeyBn: "উন্নয়নকারী সংস্থা",
      infoValEn: "Chinese Poultry Research Institutes (Layer Duck Base)",
      infoValBn: "চীনা পোল্ট্রি গবেষণা ইনস্টিটিউট (লেয়ার ডেক বেস)",
      imagePath: "assets/ps_duck.jpg",
      detailsEn: [
        "🔎 ORIGIN & GENETIC BACKGROUND:\n• Origin: China 🇨🇳 (Zhejiang Province)\n• Developed By: Chinese poultry research institutes\n• Type: Specialized Egg Layer Duck\n• Genetic Base: Local Chinese laying ducks × selective breeding\n• Industry Position: Backbone of China's commercial duck egg industry",
        "📊 PRODUCTION PERFORMANCE:\n• Age at First Egg: 18–20 weeks\n• Peak Production: 90–93%\n• Eggs Per Year: 260–300 eggs (Farm potential: 300+ eggs/yr)\n• Laying Persistency: Very good and long duration",
        "🥚 EGG CHARACTERISTICS:\n• Egg Weight: 65–75 g\n• Egg Color: White to light bluish-green tint\n• Shell Quality: Strong (Low crack risk under proper management)",
        "🍽️ FEED EFFICIENCY & COST ANALYSIS:\n• Feed Intake: 140–160 g/day\n• FCR (Egg Mass): 2.3–2.6\n• Feed Efficiency: High (Nearly similar to Khaki Campbell)\n• Economic Value: Produces high egg output on balanced feed intake",
        "⚖️ BODY WEIGHT & GROWTH:\n• Adult Body Weight: 1.6–2.0 kg\n• Growth Rate: Medium\n• Body Frame: Slim layer-type body\n• Advantage: Lower body weight means lower maintenance feed cost",
        "🧬 REPRODUCTION & HATCHERY PERFORMANCE:\n• Fertility: 88–92%\n• Hatchability: 80–85%\n• Duckling Survival: 90–95%\n• Hatchery Suitability: Very good for breeder and hatchery operations",
        "🦠 DISEASE RESISTANCE & ADAPTABILITY:\n• Disease Resistance: Good\n• Heat Tolerance: High\n• Stress Tolerance: Moderate\n• Climate Adaptation: Performs well in tropical conditions",
        "🇧🇩 BANGLADESH CONTEXT:\n• Very promising for Bangladesh climate\n• Good option for commercial duck egg production\n• Can be a strong alternative or companion to Khaki Campbell",
        "💡 ADVANCED NOTES:\n• Important breed for commercial layer duck farming\n• Strong candidate for egg-focused breeding systems\n• Suitable for app database under high-egg duck category"
      ],
      detailsBn: [
        "🔎 উৎপত্তি ও জেনেটিক ব্যাকগ্রাউন্ডঃ\n• উৎপত্তি: China 🇨🇳 (ঝেজিয়াং প্রদেশ)\n• উন্নয়নকারী: চীনা পোল্ট্রি গবেষণা ইনস্টিটিউট\n• টাইপ: স্পেশালাইজড ডিমের হাঁস (Egg Layer Duck)\n• জেনেটিক বেস: স্থানীয় চীনা লেয়ার হাঁস × সিলেক্টিভ ব্রিডিং\n• শিল্পের অবস্থান: চীন কমার্শিয়াল হাঁসের ডিম শিল্পের মূল মেরুদণ্ড",
        "📊 ডিম উৎপাদন ক্ষমতা ও মানদণ্ডঃ\n• প্রথম ডিমের বয়স: ১৮–২০ সপ্তাহ\n• পিক ডিম উৎপাদন: ৯০–৯৩%\n• বার্ষিক ডিম উৎপাদন: ২৬০–৩০০ টি (উন্নত ফার্ম পটেনশিয়াল: ৩০০+ ডিম/বছর)\n• উৎপাদনে স্থায়িত্ব: অত্যন্ত চমৎকার ও দীর্ঘ স্থায়ীত্ব",
        "🥚 ডিমের গুণাগুণ ও বৈশিষ্ট্যঃ\n• ডিমের ওজন: ৬৫–৭৫ গ্রাম\n• ডিমের রঙ: সাদা থেকে হালকা নীলচে-সবুজ আভা\n• খোসার মান: অত্যন্ত শক্ত (সঠিক ব্যবস্থাপনায় ভাঙ্গার ঝুঁকি কম)",
        "🍽️ খাবার ও ফিড দক্ষতাঃ\n• দৈনিক ফিড গ্রহণ: ১৪০–১৬০ গ্রাম/দিন\n• এফসিআর (FCR - এগ মাস): ২.৩–২.৬\n• ফিড দক্ষতা: অত্যন্ত উচ্চ (খাকি ক্যাম্পবেলের প্রায় সমকক্ষ)\n• অর্থনৈতিক মূল্যায়ন: সুষম খাবারে সর্বোচ্চ ডিমের আউটপুট প্রদান করে",
        "⚖️ দৈহিক ওজন ও বৃদ্ধিঃ\n• প্রাপ্তবয়স্ক দৈহিক ওজন: ১.৬–২.০ কেজি\n• বৃদ্ধির গতি: মাঝারি\n• দৈহিক গঠন: ছিপছিপে লেয়ার বডি ফ্রেম\n• সুবিধা: কম দৈহিক ওজনের কারণে দৈনিক রক্ষণাবেক্ষণ খাদ্য খরচ কম",
        "🧬 প্রজনন ও হ্যাচারি পারফরম্যান্সঃ\n• ফার্টালিটি (উর্বরতা): ৮৮–৯২%\n• হ্যাচেবিলিটি (ফুটার হার): ৮০–৮৫%\n• হাঁসের ছানার বেঁচে থাকার হার: ৯০–৯৫%\n• হ্যাচারি উপযোগিতা: ব্রিডার ও হ্যাচারি অপারেশনের জন্য অত্যন্ত উপযোগী",
        "🦠 রোগ প্রতিরোধ ও মানানসইতাঃ\n• রোগ প্রতিরোধ ক্ষমতা: ভালো\n• তাপ সহনশীলতা: উচ্চ\n• স্ট্রেস সহনশীলতা: মাঝারি\n• জলবায়ু অভিযোজন: ক্রান্তীয় (Tropical) আবহাওয়ায় চমৎকার পারফর্ম করে",
        "🇧🇩 বাংলাদেশ প্রেক্ষাপটঃ\n• বাংলাদেশের আবহাওয়ার জন্য অত্যন্ত আশাব্যঞ্জক\n• বাণিজ্যিক হাঁসের ডিম উৎপাদনের জন্য দারুণ একটি পছন্দ\n• খাকি ক্যাম্পবেলের একটি শক্তিশালী বিকল্প বা সহযোগী হতে পারে",
        "💡 অগ্রবর্তী নির্দেশিকা (ADVANCED NOTES)ঃ\n• বাণিজ্যিক লেয়ার হাঁস খামারের জন্য অত্যন্ত গুরুত্বপূর্ণ জাত\n• ডিম-কেন্দ্রিক ব্রিডিং সিস্টেমের জন্য শক্তিশালী দাবিদার\n• উচ্চ-ডিম উৎপাদনকারী হাঁস ক্যাটাগরিতে অ্যাপ ডেটাবেসের জন্য সম্পূর্ণ উপযুক্ত"
      ],
      keyPointsEn: [
        "1. Origin & Genetics: China 🇨🇳 | Zhejiang Province | Backbone of China duck egg industry",
        "2. Production Specs: 18-20 wks first egg; 90-93% peak; 260-300 eggs/yr (Potential 300+)",
        "3. Body & Feed: 1.6-2.0 kg light adult weight; 140-160 g/day feed intake; 2.3-2.6 FCR",
        "4. Repro & Bangladesh Fit: 88-92% fertility, high heat tolerance & excellent fit for BD"
      ],
      keyPointsBn: [
        "১. উৎপত্তি ও জেনেটিক্স: চীন 🇨🇳 | ঝেজিয়াং প্রদেশ | চীনা হাঁসের ডিম শিল্পের মূল ভিত্তি",
        "২. ডিম উৎপাদন: ১৮-২০ সপ্তাহে প্রথম ডিম; ৯০-৯৩% পিক; ২৬০-৩০০টি ডিম/বছর (পটেনশিয়াল ৩০০+)",
        "৩. ওজন ও ফিড দক্ষতা: ১.৬-২.০ কেজি হালকা ওজন; দৈনিক ১৪০-১৬০g খাবার; ২.৩-২.৬ এফসিআর",
        "৪. হ্যাচারি ও বাংলাদেশ: ৮৮-৯২% উর্বরতা, উচ্চ তাপ সহনশীলতা ও বাংলাদেশের জন্য দারুণ বিকল্প"
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
          isEng ? "Duck PS Summary" : "হাঁস পিএস সারসংক্ষেপ",
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
    DuckArticleItem item,
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
              builder: (_) => DuckArticleDetailScreen(
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
                      color: Colors.teal.shade100,
                      child: const Icon(
                        Icons.water_drop_rounded,
                        color: Colors.teal,
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
                      "${isEng ? item.infoKeyEn : item.infoKeyBn}: ${isEng ? item.infoValEn : item.infoValBn}",
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

class DuckArticleDetailScreen extends StatelessWidget {
  final DuckArticleItem item;
  final bool isEnglish;

  const DuckArticleDetailScreen({
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
                    color: Colors.teal.shade200,
                    child: const Center(
                      child: Icon(
                        Icons.water_drop_rounded,
                        size: 64,
                        color: Colors.teal,
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
                    "🌐 ${isEng ? 'Origin' : 'উৎপত্তি'}: ${isEng ? item.originEn : item.originBn}  |  🏛️ ${isEng ? item.infoValEn : item.infoValBn}",
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
