import 'package:flutter/material.dart';

class WhiteLayerArticleItem {
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

  const WhiteLayerArticleItem({
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

class WhiteLayerPSSummaryScreen extends StatelessWidget {
  final bool isEnglish;

  const WhiteLayerPSSummaryScreen({super.key, required this.isEnglish});

  static const List<WhiteLayerArticleItem> articles = [
    // 1. Hy-Line W-36
    WhiteLayerArticleItem(
      id: "hy_line_w36",
      titleEn: "Hy-Line W-36 (World Leader White Layer)",
      titleBn: "হাই-লাইন W-36 (বিশ্বসেরা হোয়াইট লেয়ার)",
      subtitleEn: "🔎 Origin & Breed Identity",
      subtitleBn: "🔎 উৎপত্তি ও ব্রিডের পরিচয়",
      originEn: "USA 🇺🇸",
      originBn: "যুক্তরাষ্ট্র 🇺🇸",
      companyEn: "Hy-Line International",
      companyBn: "হাই-লাইন ইন্টারন্যাশনাল",
      imagePath: "assets/ps_white_layer.jpg",
      detailsEn: [
        "📌 BREED OVERVIEW & ORIGIN:\nHy-Line W-36 is the world's most efficient commercial white egg layer, bred by Hy-Line International in Iowa, USA. Celebrated globally for lowest feed consumption per dozen eggs.",
        "📊 PERFORMANCE METRICS (TO 100 WEEKS):\n• Production Potential: 500+ white eggs per hen housed.\n• Peak Laying Rate: 96% - 98%.\n• Target Weight (20 wks): 1250 - 1300 g.\n• Adult Body Weight (72 wks): 1580 - 1630 g.\n• Average Egg Weight: 62.0 - 63.0 g.\n• Shell Breaking Strength: Industry leading shell durability.",
        "🌾 FEED EFFICIENCY ADVANTAGE:\n• Daily Feed Intake: 98 - 104 g/day per bird (Lowest Feed Costs).\n• FCR: 1.95 - 2.02 kg feed per kg egg mass.\n\n👉 Hy-Line W-36 delivers maximum net profit in egg production worldwide."
      ],
      detailsBn: [
        "📌 ব্রিডের সংক্ষিপ্ত বিবরণ ও উৎপত্তিঃ\nআমেরিকার হাই-লাইন ইন্টারন্যাশনাল দ্বারা তৈরি হাই-লাইন W-36 বিশ্বের সবচেয়ে দক্ষ ও সাশ্রয়ী সাদা ডিমের লেয়ার মুরগি। প্রতি ডজন ডিমে সর্বনিম্ন খাবার খরচের জন্য এটি আন্তর্জাতিকভাবে খ্যাত।",
        "📊 উৎপাদন ক্ষমতা ও মানদণ্ড (১০০ সপ্তাহ পর্যন্ত)ঃ\n• ডিম উৎপাদন ক্ষমতা: ১০০ সপ্তাহে ৫০০+ চমৎকার সাদা ডিম।\n• পিক লেয়িং হার: ৯৬% - ৯৮%।\n• ২০ সপ্তাহে টার্গেট ওজন: ১২৫০ - ১৩০০ গ্রাম।\n• ৭২ সপ্তাহে প্রাপ্তবয়স্ক ওজন: ১৫৮০ - ১৬৩০ গ্রাম।\n• গড় ডিমের ওজন: ৬২.০ - ৬৩.০ গ্রাম।\n• খোসার শক্তিমত্তা: শীর্ষমানের মজবুত খোসা।",
        "🌾 খাদ্য দক্ষতা সুবিধাঃ\n• দৈনিক ফিড গ্রহণ: ৯৮ - ১০৪ গ্রাম/দিন (সর্বনিম্ন ফিড খরচ)।\n• ফিড কনভার্সন রেশিও (FCR): ১.৯৫ - ২.০২।\n\n👉 কম খাবার খরচে সর্বোচ্চ মুনাফা অর্জনে হাই-লাইন W-36 এর বিকল্প নেই।"
      ],
      keyPointsEn: [
        "1. Origin & Company: USA 🇺🇸 | Hy-Line International",
        "2. Top Yield: 500+ white eggs to 100 wks with 96-98% peak lay",
        "3. Compact Body: 1250g at 20 wks | 1580g adult weight at 72 wks",
        "4. Lowest Feed Intake: Only 98-104g/day daily feed consumption"
      ],
      keyPointsBn: [
        "১. উৎপত্তি ও কোম্পানি: যুক্তরাষ্ট্র 🇺🇸 | হাই-লাইন ইন্টারন্যাশনাল",
        "২. ডিম উৎপাদন: ১০০ সপ্তাহে ৫০০+ সাদা ডিম এবং ৯৬-৯৮% পিক লেয়িং",
        "৩. হালকা দৈহিক গঠন: ২০ সপ্তাহে ১২৫০g | ৭২ সপ্তাহে ১৫৮০g প্রাপ্তবয়স্ক ওজন",
        "৪. সর্বনিম্ন ফিড গ্রহণ: দৈনিক মাত্র ৯৮-১০৪g খাবার গ্রহণ"
      ],
    ),

    // 2. Lohmann LSL-Classic
    WhiteLayerArticleItem(
      id: "lohmann_lsl_classic",
      titleEn: "Lohmann LSL-Classic (Premium German White Layer)",
      titleBn: "লোহম্যান এলএসএল (জার্মান প্রিমিয়াম হোয়াইট লেয়ার)",
      subtitleEn: "🔎 Origin & Breed Identity",
      subtitleBn: "🔎 উৎপত্তি ও ব্রিডের পরিচয়",
      originEn: "Germany 🇩🇪",
      originBn: "জার্মানি 🇩🇪",
      companyEn: "Lohmann Breeders",
      companyBn: "লোহম্যান ব্রিডার্স",
      imagePath: "assets/ps_white_layer.jpg",
      detailsEn: [
        "📌 BREED OVERVIEW & ORIGIN:\nLohmann LSL-Classic is Germany's premier white egg layer developed by Lohmann Breeders. It combines high egg mass with superior persistency and excellent feathering.",
        "📊 PERFORMANCE METRICS (TO 95 WEEKS):\n• Production Potential: 460 - 475 white eggs per hen housed.\n• Peak Laying Rate: 95% - 97%.\n• Target Weight (20 wks): 1280 - 1330 g.\n• Adult Body Weight (72 wks): 1620 - 1680 g.\n• Average Egg Weight: 63.0 - 64.0 g.",
        "🌾 SHELL & FLOCK STABILITY:\n• Daily Feed Intake: 102 - 106 g/day.\n• Livability: 96% - 98% throughout rearing and laying phases.",
        "👉 Outstanding performance in both tropical open houses and controlled environment cage systems."
      ],
      detailsBn: [
        "📌 ব্রিডের সংক্ষিপ্ত বিবরণ ও উৎপত্তিঃ\nজার্মানির লোহম্যান ব্রিডার্স কর্তৃক উদ্ভাবিত লোহম্যান এলএসএল-ক্লাসিক উন্নত সাদা লেয়ার মুরগি। উচ্চ ডিম উৎপাদন ক্ষমতা ও চমৎকার ডিমের খোসার মান এর প্রধান বৈশিষ্ট্য।",
        "📊 উৎপাদন ক্ষমতা ও মানদণ্ড (৯৫ সপ্তাহ পর্যন্ত)ঃ\n• ডিম উৎপাদন ক্ষমতা: ৯৫ সপ্তাহে ৪৬০ - ৪৭৫ টি সাদা ডিম।\n• পিক লেয়িং হার: ৯৫% - ৯৭%।\n• ২০ সপ্তাহে টার্গেট ওজন: ১২৮০ - ১৩৩০ গ্রাম।\n• ৭২ সপ্তাহে প্রাপ্তবয়স্ক ওজন: ১৬২০ - ১৬৮০ গ্রাম।\n• গড় ডিমের ওজন: ৬৩.০ - ৬৪.০ গ্রাম।",
        "🌾 খোসা ও ঝাঁকের স্থায়িত্বঃ\n• দৈনিক ফিড গ্রহণ: ১০২ - ১০৬ গ্রাম/দিন।\n• বেঁচে থাকার হার (Livability): ৯৬% - ৯৮%।\n\n👉 খোলা শেড ও তাপমাত্রা নিয়ন্ত্রিত আধুনিক শেড উভয় পরিবেশেই সমান কার্যকর।"
      ],
      keyPointsEn: [
        "1. Origin & Company: Germany 🇩🇪 | Lohmann Breeders",
        "2. High Production: 460-475 white eggs to 95 wks with 95-97% peak lay",
        "3. Target Weight: 1280g at 20 wks | 1620g adult weight at 72 wks",
        "4. Superior Livability: 96-98% livability & strong eggshell quality"
      ],
      keyPointsBn: [
        "১. উৎপত্তি ও কোম্পানি: জার্মানি 🇩🇪 | লোহম্যান ব্রিডার্স",
        "২. ডিম উৎপাদন: ৯৫ সপ্তাহে ৪৬০-৪৭৫ টি ডিম এবং ৯৫-৯৭% পিক লেয়িং",
        "৩. দৈহিক ওজন: ২০ সপ্তাহে ১২৮০g | ৭২ সপ্তাহে ১৬২০g প্রাপ্তবয়স্ক ওজন",
        "৪. উচ্চ বেঁচে থাকার হার: ৯৬-৯৮% লিভেবিলিটি ও মজবুত ডিমের খোসা"
      ],
    ),

    // 3. Shaver White
    WhiteLayerArticleItem(
      id: "shaver_white",
      titleEn: "Shaver White (High Yield Efficient White Layer)",
      titleBn: "শেভার হোয়াইট (উচ্চ ফলনশীল হোয়াইট লেয়ার)",
      subtitleEn: "🔎 Origin & Breed Identity",
      subtitleBn: "🔎 উৎপত্তি ও ব্রিডের পরিচয়",
      originEn: "Canada 🇨🇦 / Netherlands 🇳🇱",
      originBn: "কানাডা 🇨🇦 / নেদারল্যান্ডস 🇳🇱",
      companyEn: "Hendrix Genetics",
      companyBn: "হেনড্রিক্স জেনেটিক্স",
      imagePath: "assets/ps_white_layer.jpg",
      detailsEn: [
        "📌 BREED OVERVIEW & ORIGIN:\nShaver White is a high-producing white layer developed originally in Canada, now maintained by Hendrix Genetics. Known for rapid early egg size growth and long persistence.",
        "📊 PERFORMANCE METRICS (TO 90 WEEKS):\n• Production Potential: 440 - 455 white eggs per hen housed.\n• Peak Laying Rate: 95% - 97%.\n• Target Weight (20 wks): 1270 - 1320 g.\n• Adult Body Weight (72 wks): 1610 - 1660 g.\n• Average Egg Weight: 62.5 - 63.5 g.",
        "🌾 EFFICIENCY:\n• Daily Feed Intake: 100 - 105 g/day.\n• Early onset of lay with rapid peak attainment.",
        "👉 Strong shell strength and low feed consumption."
      ],
      detailsBn: [
        "📌 ব্রিডের সংক্ষিপ্ত বিবরণ ও উৎপত্তিঃ\nকানাডায় উদ্ভাবিত এবং বর্তমানে হেনড্রিক্স জেনেটিক্স দ্বারা পরিচালিত শেভার হোয়াইট দ্রুত ডিম দেওয়া শুরু এবং দ্রুত পিকের জন্য সুপরিচিত।",
        "📊 উৎপাদন ক্ষমতা ও মানদণ্ড (৯০ সপ্তাহ পর্যন্ত)ঃ\n• ডিম উৎপাদন ক্ষমতা: ৯০ সপ্তাহে ৪৪০ - ৪৫৫ টি সাদা ডিম।\n• পিক লেয়িং হার: ৯৫% - ৯৭%।\n• ২০ সপ্তাহে টার্গেট ওজন: ১২৭০ - ১৩২০ গ্রাম।\n• ৭২ সপ্তাহে প্রাপ্তবয়স্ক ওজন: ১৬১০ - ১৬৬০ গ্রাম।\n• গড় ডিমের ওজন: ৬২.৫ - ৬৩.৫ গ্রাম।",
        "🌾 খাদ্য দক্ষতাঃ\n• দৈনিক ফিড গ্রহণ: ১০০ - ১০৫ গ্রাম/দিন।\n• দ্রুত বয়স থেকে পিক উৎপাদন শুরু।\n\n👉 শক্ত ডিমের খোসা ও কম খাদ্যে বেশি উৎপাদন নিশ্চিত করে।"
      ],
      keyPointsEn: [
        "1. Origin & Company: Canada 🇨🇦 / Netherlands 🇳🇱 | Hendrix Genetics",
        "2. Early Peak Lay: Rapid onset of lay reaching 95-97% peak production",
        "3. Body Weights: 1270g at 20 wks | 1610g adult weight at 72 wks",
        "4. Efficient Feed Use: 100-105g/day daily feed intake"
      ],
      keyPointsBn: [
        "১. উৎপত্তি ও কোম্পানি: কানাডা 🇨🇦 / নেদারল্যান্ডস 🇳🇱 | হেনড্রিক্স জেনেটিক্স",
        "২. দ্রুত পিক অর্জন: দ্রুত বয়স থেকেই ৯৫-৯৭% পিকের উচ্চ ডিম উৎপাদন",
        "৩. দৈহিক ওজন: ২০ সপ্তাহে ১২৭০g | ৭২ সপ্তাহে ১৬১০g প্রাপ্তবয়স্ক ওজন",
        "৪. সাশ্রয়ী ফিড: দৈনিক ১০০-১০৫g খাবার গ্রহণ"
      ],
    ),

    // 4. Bovans White
    WhiteLayerArticleItem(
      id: "bovans_white",
      titleEn: "Bovans White (Adaptable Commercial White Layer)",
      titleBn: "বোভান্স হোয়াইট (সহনশীল হোয়াইট লেয়ার)",
      subtitleEn: "🔎 Origin & Breed Identity",
      subtitleBn: "🔎 উৎপত্তি ও ব্রিডের পরিচয়",
      originEn: "Netherlands 🇳🇱",
      originBn: "নেদারল্যান্ডস 🇳🇱",
      companyEn: "Hendrix Genetics",
      companyBn: "হেনড্রিক্স জেনেটিক্স",
      imagePath: "assets/ps_white_layer.jpg",
      detailsEn: [
        "📌 BREED OVERVIEW & ORIGIN:\nBovans White is a robust Dutch white layer bred by Hendrix Genetics. Engineered for high stress tolerance and steady egg production in hot humid climates.",
        "📊 PERFORMANCE METRICS (TO 100 WEEKS):\n• Production Potential: 490+ white eggs per hen housed.\n• Peak Laying Rate: 95% - 97%.\n• Target Weight (20 wks): 1290 - 1340 g.\n• Adult Body Weight (72 wks): 1630 - 1690 g.\n• Average Egg Weight: 62.5 - 63.5 g.",
        "🌾 CLIMATE RESILIENCE:\n• Daily Feed Intake: 100 - 105 g/day.\n• High livability in warm and tropical poultry houses.",
        "👉 Excellent flock uniformity and reliable persistent production."
      ],
      detailsBn: [
        "📌 ব্রিডের সংক্ষিপ্ত বিবরণ ও উৎপত্তিঃ\nনেদারল্যান্ডসের হেনড্রিক্স জেনেটিক্স দ্বারা উন্নত বোভান্স হোয়াইট অত্যন্ত মজবুত ও সহনশীল একটি সাদা লেয়ার ব্রিড। গরম ও আর্দ্র আবহাওয়ায় এটি চমৎকার পারফর্ম করে।",
        "📊 উৎপাদন ক্ষমতা ও মানদণ্ড (১০০ সপ্তাহ পর্যন্ত)ঃ\n• ডিম উৎপাদন ক্ষমতা: ১০০ সপ্তাহে ৪৯০+ টি চমৎকার সাদা ডিম।\n• পিক লেয়িং হার: ৯৫% - ৯৭%।\n• ২০ সপ্তাহে টার্গেট ওজন: ১২৯০ - ১৩৪০ গ্রাম।\n• ৭২ সপ্তাহে প্রাপ্তবয়স্ক ওজন: ১৬৩০ - ১৬৯০ গ্রাম।\n• গড় ডিমের ওজন: ৬২.৫ - ৬৩.৫ গ্রাম।",
        "🌾 আবহাওয়া সহনশীলতাঃ\n• দৈনিক ফিড গ্রহণ: ১০০ - ১০৫ গ্রাম/দিন।\n• ট্রপিক্যাল ও উষ্ণ আবহাওয়ায় উচ্চ লিভেবিলিটি।\n\n👉 ঝাঁকের উচ্চ ইউনিফরমিটি ও দীর্ঘস্থায়ী ডিম উৎপাদনের জন্য খামারীদের পছন্দের তালিকায় শীর্ষস্থানে।"
      ],
      keyPointsEn: [
        "1. Origin & Company: Netherlands 🇳🇱 | Hendrix Genetics",
        "2. Long Production: 490+ white eggs to 100 wks with 95-97% peak lay",
        "3. Body Weights: 1290g at 20 wks | 1630g adult weight at 72 wks",
        "4. Tropical Hardiness: Excellent adaptability to warm climatic conditions"
      ],
      keyPointsBn: [
        "১. উৎপত্তি ও কোম্পানি: নেদারল্যান্ডস 🇳🇱 | হেনড্রিক্স জেনেটিক্স",
        "২. দীর্ঘস্থায়ী ডিম: ১০০ সপ্তাহে ৪৯০+ ডিম এবং ৯৫-৯৭% পিক লেয়িং",
        "৩. দৈহিক ওজন: ২০ সপ্তাহে ১২৯০g | ৭২ সপ্তাহে ১৬৩০g প্রাপ্তবয়স্ক ওজন",
        "৪. আবহাওয়া সহনশীলতা: গরম ও আর্দ্র আবহাওয়ায় চমৎকার মানিয়ে নেওয়ার ক্ষমতা"
      ],
    ),

    // 5. Novogen White
    WhiteLayerArticleItem(
      id: "novogen_white",
      titleEn: "Novogen White (Balanced High Performance White)",
      titleBn: "নভোজেন হোয়াইট (ভারসাম্যপূর্ণ হোয়াইট লেয়ার)",
      subtitleEn: "🔎 Origin & Breed Identity",
      subtitleBn: "🔎 উৎপত্তি ও ব্রিডের পরিচয়",
      originEn: "France 🇫🇷",
      originBn: "ফ্রান্স 🇫🇷",
      companyEn: "Groupe Grimaud / Novogen",
      companyBn: "গ্রুপ গ্রিমাউড / নভোজেন",
      imagePath: "assets/ps_white_layer.jpg",
      detailsEn: [
        "📌 BREED OVERVIEW & ORIGIN:\nNovogen White is bred in France by Novogen (Groupe Grimaud). Famous for exceptionally strong shell quality, docile behavior, and outstanding cage/cage-free adaptation.",
        "📊 PERFORMANCE METRICS (TO 95 WEEKS):\n• Production Potential: 465 - 480 white eggs per hen housed.\n• Peak Laying Rate: 95% - 97%.\n• Target Weight (20 wks): 1280 - 1330 g.\n• Adult Body Weight (72 wks): 1610 - 1670 g.\n• Average Egg Weight: 62.8 - 63.8 g.",
        "🌾 ADVANTAGES:\n• Daily Feed Intake: 101 - 105 g/day.\n• Outstanding shell breaking strength reducing transport cracked eggs.",
        "👉 Quiet flock behavior with minimal feather pecking."
      ],
      detailsBn: [
        "📌 ব্রিডের সংক্ষিপ্ত বিবরণ ও উৎপত্তিঃ\nফ্রান্সের নভোজেন (গ্রুপ গ্রিমাউড) দ্বারা উদ্ভাবিত নভোজেন হোয়াইট একটি বিশ্বমানের সাদা লেয়ার জাত। এর অতি শক্ত খোসা ডিম পরিবহনে অপচয় রোধ করে।",
        "📊 উৎপাদন ক্ষমতা ও মানদণ্ড (৯৫ সপ্তাহ পর্যন্ত)ঃ\n• ডিম উৎপাদন ক্ষমতা: ৯৫ সপ্তাহে ৪৬৫ - ৪৮০ টি ডিম।\n• পিক লেয়িং হার: ৯৫% - ৯৭%।\n• ২০ সপ্তাহে টার্গেট ওজন: ১২৮০ - ১৩৩০ গ্রাম।\n• ৭২ সপ্তাহে প্রাপ্তবয়স্ক ওজন: ১৬১০ - ১৬৭০ গ্রাম।\n• গড় ডিমের ওজন: ৬২.৮ - ৬৩.৮ গ্রাম।",
        "🌾 মূল সুবিধাসমূহঃ\n• দৈনিক ফিড গ্রহণ: ১০১ - ১০৫ গ্রাম/দিন।\n• ডিমের অতি শক্ত খোসা ফার্টিলিটি ও ট্রান্সপোর্টেশন ক্ষতি কমায়।\n\n👉 শান্ত স্বভাবের মুরগী হওয়ায় শেডে ক্যানিবালিজম ও পালক ছেঁড়ার সমস্যা হয় না।"
      ],
      keyPointsEn: [
        "1. Origin & Company: France 🇫🇷 | Groupe Grimaud / Novogen",
        "2. Yield Potential: 465-480 eggs to 95 wks with 95-97% peak lay",
        "3. Body Weights: 1280g at 20 wks | 1610g adult weight at 72 wks",
        "4. Strong Shells: Exceptional shell strength minimizing transport cracks"
      ],
      keyPointsBn: [
        "১. উৎপত্তি ও কোম্পানি: ফ্রান্স 🇫🇷 | গ্রুপ গ্রিমাউড / নভোজেন",
        "২. ডিম উৎপাদন: ৯৫ সপ্তাহে ৪৬৫-৪৮০ টি ডিম এবং ৯৫-৯৭% পিক লেয়িং",
        "৩. দৈহিক ওজন: ২০ সপ্তাহে ১২৮০g | ৭২ সপ্তাহে ১৬১০g প্রাপ্তবয়স্ক ওজন",
        "৪. শক্ত ডিমের খোসা: পরিবহনকালে ভাঙা ডিমের হার কমায়"
      ],
    ),

    // 6. Dekalb White
    WhiteLayerArticleItem(
      id: "dekalb_white",
      titleEn: "Dekalb White (Top Efficiency & Docile White Layer)",
      titleBn: "ডিকাল্ব হোয়াইট (দক্ষ ও শান্ত হোয়াইট লেয়ার)",
      subtitleEn: "🔎 Origin & Breed Identity",
      subtitleBn: "🔎 উৎপত্তি ও ব্রিডের পরিচয়",
      originEn: "Netherlands 🇳🇱",
      originBn: "নেদারল্যান্ডস 🇳🇱",
      companyEn: "Hendrix Genetics",
      companyBn: "হেনড্রিক্স জেনেটিক্স",
      imagePath: "assets/ps_white_layer.jpg",
      detailsEn: [
        "📌 BREED OVERVIEW & ORIGIN:\nDekalb White originated in the Netherlands under Hendrix Genetics. Renowned as a docile, friendly white layer producing large volumes of high-quality white eggs.",
        "📊 PERFORMANCE METRICS (TO 100 WEEKS):\n• Production Potential: 495+ white eggs per hen housed.\n• Peak Laying Rate: 96% - 98%.\n• Target Weight (20 wks): 1275 - 1325 g.\n• Adult Body Weight (72 wks): 1600 - 1650 g.\n• Average Egg Weight: 62.5 - 63.5 g.",
        "🌾 BEHAVIOR & FEEDING:\n• Daily Feed Intake: 99 - 104 g/day.\n• Extremely quiet temperament suited for alternative aviaries and conventional cages.",
        "👉 High persistency with late cycle egg shell strength."
      ],
      detailsBn: [
        "📌 ব্রিডের সংক্ষিপ্ত বিবরণ ও উৎপত্তিঃ\nনেদারল্যান্ডসের হেনড্রিক্স জেনেটিক্স দ্বারা বিকশিত ডিকাল্ব হোয়াইট অত্যন্ত শান্ত মেজাজের বিশ্বমানের লেয়ার। এটি খামারীদের দীর্ঘ সময় ধরে উচ্চ ডিম উৎপাদন সুবিধা দেয়।",
        "📊 উৎপাদন ক্ষমতা ও মানদণ্ড (১০০ সপ্তাহ পর্যন্ত)ঃ\n• ডিম উৎপাদন ক্ষমতা: ১০০ সপ্তাহে ৪৯৫+ টি সাদা ডিম।\n• পিক লেয়িং হার: ৯৬% - ৯৮%।\n• ২০ সপ্তাহে টার্গেট ওজন: ১২৭৫ - ১৩২৫ গ্রাম।\n• ৭২ সপ্তাহে প্রাপ্তবয়স্ক ওজন: ১৬০০ - ১৬৫০ গ্রাম।\n• গড় ডিমের ওজন: ৬২.৫ - ৬৩.৫ গ্রাম।",
        "🌾 স্বভাব ও ফিডিংঃ\n• দৈনিক ফিড গ্রহণ: ৯৯ - ১০৪ গ্রাম/দিন।\n• অত্যন্ত শান্ত ও নম্র স্বভাবের কারণে শেড ব্যবস্থাপনা বেশ সহজ।\n\n👉 জীবনের শেষ পর্যায় পর্যন্ত চমৎকার ডিমের খোসার মান ধরে রাখতে সক্ষম।"
      ],
      keyPointsEn: [
        "1. Origin & Company: Netherlands 🇳🇱 | Hendrix Genetics",
        "2. Long Persistency: 495+ eggs to 100 wks with 96-98% peak lay",
        "3. Body Weights: 1275g at 20 wks | 1600g adult weight at 72 wks",
        "4. Docile Nature: Exceptionally calm flock behavior & excellent FCR"
      ],
      keyPointsBn: [
        "১. উৎপত্তি ও কোম্পানি: নেদারল্যান্ডস 🇳🇱 | হেনড্রিক্স জেনেটিক্স",
        "২. দীর্ঘ স্থায়িত্ব: ১০০ সপ্তাহে ৪৯৫+ ডিম এবং ৯৬-৯৮% পিক লেয়িং",
        "৩. দৈহিক ওজন: ২০ সপ্তাহে ১২৭৫g | ৭২ সপ্তাহে ১৬০০g প্রাপ্তবয়স্ক ওজন",
        "৪. শান্ত স্বভাব: শান্ত মেজাজ এবং চমৎকার এফসিআর"
      ],
    ),

    // 7. Single Comb White Leghorn
    WhiteLayerArticleItem(
      id: "white_leghorn",
      titleEn: "White Leghorn (Classic Foundation White Layer)",
      titleBn: "হোয়াইট লেগহর্ন (ক্লাসিক ফাউন্ডেশন লেয়ার)",
      subtitleEn: "🔎 Origin & Breed Identity",
      subtitleBn: "🔎 উৎপত্তি ও ব্রিডের পরিচয়",
      originEn: "Italy 🇮🇹 / USA 🇺🇸",
      originBn: "ইতালি 🇮🇹 / যুক্তরাষ্ট্র 🇺🇸",
      companyEn: "Developed From: Mediterranean Leghorn Lineage",
      companyBn: "উৎপত্তি: মেডিটেরেনিয়ান লেগহর্ন বংশোদ্ভূত",
      imagePath: "assets/ps_white_layer.jpg",
      detailsEn: [
        "📌 BREED OVERVIEW & ORIGIN:\nSingle Comb White Leghorn originated in Tuscany, Italy, and was further refined in the USA. It is the original genetic foundation for almost all modern commercial white egg layers.",
        "📊 PERFORMANCE METRICS:\n• Annual Production: 280 - 320 chalk-white eggs per year.\n• Target Weight (20 wks): 1300 - 1400 g.\n• Adult Female Weight: 1750 - 1950 g.\n• Average Egg Weight: 58 - 62 g.",
        "🌾 CHARACTERISTICS:\n• Active, alert, and extremely heat tolerant.\n• Highest raw egg output per unit of feed among heritage pure breeds.",
        "👉 Iconic white earlobes, large red single comb, and snow-white plumage."
      ],
      detailsBn: [
        "📌 ব্রিডের সংক্ষিপ্ত বিবরণ ও উৎপত্তিঃ\nইতালির টাস্কানিতে উৎপত্তি এবং পরবর্তীতে আমেরিকায় পরিশোধিত 'হোয়াইট লেগহর্ন' আধুনিক সকল বাণিজ্যিক সাদা লেয়ারের মূল জেনেটিক ভিত্তি।",
        "📊 উৎপাদন ক্ষমতা ও মানদণ্ডঃ\n• বার্ষিক ডিম উৎপাদন: ২৮০ - ৩২০ টি বরফের মতো সাদা ডিম।\n• ২০ সপ্তাহে টার্গেট ওজন: ১৩০০ - ১৪০০ গ্রাম।\n• প্রাপ্তবয়স্ক স্ত্রী মুরগির ওজন: ১৭৫০ - ১৯৫০ গ্রাম।\n• গড় ডিমের ওজন: ৫৮ - ৬২ গ্রাম।",
        "🌾 শারীরিক বৈশিষ্ট্যঃ\n• অত্যন্ত চটপটে, সতর্ক এবং গরম আবহাওয়া সহ্য করার অসাধারণ ক্ষমতা।\n• কম খাবারে রেকর্ড পরিমাণ ডিম পাড়ার প্রাকৃতিক ক্ষমতা।\n\n👉 লাল ঝুঁটি, সাদা ইয়ারলোব ও বরফের মতো ধবধবে সাদা পালক এদের প্রধান আকর্ষণ।"
      ],
      keyPointsEn: [
        "1. Origin & Lineage: Italy 🇮🇹 / USA 🇺🇸 | Mediterranean Leghorn bloodline",
        "2. Foundation Layer: Ancestor of all modern commercial white layers",
        "3. Production Yield: 280-320 white eggs/yr with 1.75-1.95kg adult weight",
        "4. Heat Tolerance: Highly active, alert, and heat resistant"
      ],
      keyPointsBn: [
        "১. উৎপত্তি ও লাইন: ইতালি 🇮🇹 / যুক্তরাষ্ট্র 🇺🇸 | মেডিটেরেনিয়ান লাইন",
        "২. মূল পূর্বপুরুষ: সমস্ত আধুনিক সাদা বাণিজ্যিক লেয়ারের জেনেটিক ভিত্তি",
        "৩. ডিম উৎপাদন: বার্ষিক ২৮০-৩২০টি ডিম ও ১.৭৫-১.৯৫ কেজি প্রাপ্তবয়স্ক ওজন",
        "৪. বৈশিষ্ট্য: অত্যন্ত চটপটে ও উচ্চ গরম আবহাওয়া সহনশীলতা"
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
          isEng ? "White Layer PS Summary" : "হোয়াইট লেয়ার পিএস সারসংক্ষেপ",
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
    WhiteLayerArticleItem item,
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
              builder: (_) => WhiteLayerArticleDetailScreen(
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
                      color: Colors.blueGrey.shade100,
                      child: const Icon(
                        Icons.pets_rounded,
                        color: Colors.blueGrey,
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

class WhiteLayerArticleDetailScreen extends StatelessWidget {
  final WhiteLayerArticleItem item;
  final bool isEnglish;

  const WhiteLayerArticleDetailScreen({
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
                    color: Colors.blueGrey.shade200,
                    child: const Center(
                      child: Icon(
                        Icons.pets_rounded,
                        size: 64,
                        color: Colors.blueGrey,
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
