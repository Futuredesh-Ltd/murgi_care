import 'package:flutter/material.dart';

class BroilerPSArticleItem {
  final String id;
  final String titleEn;
  final String titleBn;
  final String subtitleBn;
  final String subtitleEn;
  final String snippetBn;
  final String snippetEn;
  final String imagePath;
  final List<String> detailsEn;
  final List<String> detailsBn;
  final List<String> keyPointsEn;
  final List<String> keyPointsBn;

  BroilerPSArticleItem({
    required this.id,
    required this.titleEn,
    required this.titleBn,
    required this.subtitleBn,
    required this.subtitleEn,
    required this.snippetBn,
    required this.snippetEn,
    required this.imagePath,
    required this.detailsEn,
    required this.detailsBn,
    required this.keyPointsEn,
    required this.keyPointsBn,
  });
}

class BroilerPSGuideScreen extends StatelessWidget {
  final bool isEnglish;

  const BroilerPSGuideScreen({super.key, required this.isEnglish});

  static final List<BroilerPSArticleItem> articles = [
    // 1. Feed Management during Brooding
    BroilerPSArticleItem(
      id: "feed_management_brooding",
      titleEn: "Feed Management during Brooding.",
      titleBn: "ব্রুডিংয়ে ফিড ব্যবস্থাপনা",
      subtitleBn: "ফিড ব্যবস্থাপনা (Feed Management)",
      subtitleEn: "Starter Feed, Weight Management, Feeder Space & Height Adjustments",
      snippetBn: "1️⃣ স্টার্টার ফিডঃ ম্যাশ বা ফাইন ক্রাম্ব আকারে ৭ দিনে সুপারিশকৃত বডি ওয়েট অর্জন...",
      snippetEn: "1️⃣ Starter Feed: Provide mash or fine crumble to hit day 7 weight targets...",
      imagePath: "assets/ps_broiler.jpg",
      detailsEn: [
        "Starter Feed Management:\nProvide starter feed in mash or fine crumble form. Supply sufficient feed quantity to ensure both male and female chicks achieve recommended standard body weights at 7 days of age.",
        "Uniform Body Weight at 4 Weeks:\nAchieving uniform body weight and correct frame size by 4 weeks of age is critical to ensure a strong start for the flock.",
        "Male Chick Weight Management:\n• Achieve standard body weight targets weekly during the first 4 weeks.\n• If target weight is missed at 28 days, provide extended Ad Libitum feeding for male birds.\n• For layers, sex-separate rearing is recommended for at least the first 6 weeks.\n• For optimum results, full sex-separate rearing up to 140-154 days is strongly recommended.",
        "Adequate Feeder Space:\nMaintain sufficient feeder space according to flock age.\n• From 4 weeks to housing:\n  - Pullets = Minimum 4.5 inches (11.5 cm)\n  - Roosters = Minimum 6.0 inches (15 cm)",
        "Timely & Uniform Feed Distribution:\n• Feed daily at the exact same scheduled time.\n• Feed must distribute uniformly across the entire house within 3 minutes of starting the feeder.",
        "Feeder Hopper & Run Time Tuning:\n• Adjust feed hopper gates and run times so feed travels as far across the shed as possible.\n• This maximizes usable feeder space per bird.",
        "Feeder Height Adjustment:\n• For the first 14 days, keep feed troughs/pans directly on the litter so all chicks eat easily without climbing in.\n• Thereafter, elevate feeders gradually so trough/pan lips align with bird back height.\n• Base weekly feed increments on actual body weight targets."
      ],
      detailsBn: [
        "1️⃣ স্টার্টার ফিডঃ\nএই সময়ে স্টার্টার ফিড ম্যাশ বা ফাইন ক্রাম্ব আকারে দিতে হবে। পুরুষ ও স্ত্রী বাচ্চাকে ৭ দিন বয়সে সুপারিশকৃত বডি ওয়েট অর্জনের জন্য প্রয়োজনীয় পরিমাণ ফিড সরবরাহ করতে হবে।",
        "2️⃣ ৪ সপ্তাহে ইউনিফর্ম বডি ওয়েটঃ\n৪ সপ্তাহ বয়সে সমান বডি ওয়েট ও সঠিক ফ্রেম সাইজ অর্জন করা ফ্লকের ভালো শুরু নিশ্চিত করার জন্য অত্যন্ত গুরুত্বপূর্ণ।",
        "3️⃣ পুরুষ বাচ্চার ওজন ব্যবস্থাপনাঃ\n• প্রথম ৪ সপ্তাহ প্রতি সপ্তাহে নির্ধারিত বডি ওয়েট স্ট্যান্ডার্ড অর্জন করতে হবে।\n• ২৮ দিন বয়সে লক্ষ্যমাত্রা অর্জিত না হলে পুরুষ পাখির জন্য দীর্ঘ সময় Ad libitum feeding (ইচ্ছামতো খাওয়ার সুযোগ) দেওয়া উচিত।\n• লেয়ার এর জন্য কমপক্ষে প্রথম ৬ সপ্তাহ পুরুষ ও স্ত্রী আলাদা করে পালন করা ভালো।\n• সর্বোত্তম ফলাফলের জন্য ১৪০–১৫৪ দিন বয়স পর্যন্ত সম্পূর্ণ আলাদা লালন-পালন (sex-separate rearing) সুপারিশ করা হয়।",
        "4️⃣ পর্যাপ্ত ফিডার স্পেসঃ\nফ্লকের বয়স অনুযায়ী সবসময় পর্যাপ্ত ফিডার স্পেস নিশ্চিত করতে হবে।\n\n• ৪ সপ্তাহ থেকে হাউজিং পর্যন্তঃ\n  - পুলেট = ন্যূনতম ৪.৫ ইঞ্চি (১১.৫ সেমি)\n  - মোরগ = ন্যূনতম ৬.০ ইঞ্চি (১৫ সেমি)",
        "5️⃣ নির্দিষ্ট সময়ে সমানভাবে ফিড বিতরণঃ\n• প্রতিদিন একই সময়ে ফিড প্রদান করতে হবে।\n• ফিডার চালু হওয়ার পর ৩ মিনিটের মধ্যে পুরো হাউসে সমানভাবে ফিড পৌঁছে যেতে হবে।",
        "6️⃣ ফিডার সমন্বয়ঃ\n• ফিড হপার গেট বা ফিডার রান টাইম এমনভাবে সমন্বয় করতে হবে যাতে ফিড পুরো হাউস জুড়ে বা যতদূর সম্ভব পৌঁছায়।\n• এতে প্রতি পাখির জন্য সর্বোচ্চ ফিডার স্পেস নিশ্চিত হয়।",
        "7️⃣ ফিডারের উচ্চতা সমন্বয়ঃ\n• প্রথম ১৪ দিন ফিড ট্রফ বা প্যান লিটারের উপর বসানো থাকবে, যাতে সব বাচ্চা সহজে খেতে পারে এবং ফিডারে উঠতে না হয়।\n• এরপর ধীরে ধীরে ফিডারের উচ্চতা বাড়াতে হবে, যাতে ট্রফ বা প্যানের কিনারা সবসময় পাখির পিঠের সমান উচ্চতায় থাকে।\n• সাপ্তাহিক ফিড বৃদ্ধি বডি ওয়েট লক্ষ্যমাত্রার উপর ভিত্তি করে নির্ধারণ করতে হবে।"
      ],
      keyPointsEn: [
        "1. Starter Feed: Mash/Fine crumble to hit 7-day weight target",
        "2. Male Weight & Sex-Separate Rearing (140-154 days)",
        "3. Feeder Space: Pullet 4.5 in, Rooster 6.0 in",
        "4. Distribution < 3 min & Feeder Height at back level"
      ],
      keyPointsBn: [
        "১. স্টার্টার ফিড: ম্যাশ/ফাইন ক্রাম্বল (৭ম দিনে লক্ষ্যমাত্রা ওজন)",
        "২. পুরুষ ওজন ব্যবস্থাপনা & সেক্স-সেপারেট রিয়ারিং (১৪০-১৫৪ দিন)",
        "৩. ফিডার স্পেস: পুলেট ৪.৫ ইঞ্চি, মোরগ ৬.০ ইঞ্চি",
        "৪. ফিড বিতরণ < ৩ মিনিট & পিঠের সমান্তরালে ফিডার উচ্চতা"
      ],
    ),

    // 2. Lighting Management During Brooding
    BroilerPSArticleItem(
      id: "lighting_management_brooding",
      titleEn: "Lighting Management During Brooding.",
      titleBn: "ব্রুডিংয়ে লাইটিং ব্যবস্থাপনা",
      subtitleBn: "লাইটিং ব্যবস্থাপনা (Lighting Management)",
      subtitleEn: "Optimal Photoperiod, Intensity & Blackout Schedule Guidelines",
      snippetBn: "1️⃣ প্রথম ৪৮-৭২ ঘণ্টাঃ নিরবচ্ছিন্ন আলো, ২০-৬০ লাক্স তীব্রতা & ব্ল্যাকআউট লাইটিং প্রোগ্রাম...",
      snippetEn: "1️⃣ First 48-72 Hours: Continuous light, 20-60 Lux intensity & blackout lighting schedule...",
      imagePath: "assets/ps_broiler.jpg",
      detailsEn: [
        "First 48-72 Hours Lighting:\nProvide continuous light for the first 48-72 hours post-placement.\n\n• Maintain light intensity at 20-60 Lux (approx 2.0-6.0 foot-candles) during the first 7 days so chicks find feed and water easily.\n• All rearing houses should be completely Light Tight.\n• Rearing flocks under blackout conditions is strongly recommended.",
        "Blackout Rearing Lighting Schedule (0-4 Weeks):\n🔹 Age: 0-3 Days:\n• Light = 23 hours | Intensity = 20-60 Lux\n\n🔹 Age: 4-7 Days:\n• Light = 16 hours | Intensity = 20 Lux\n\n🔹 Age: 8-14 Days:\n• Light = 12 hours | Intensity = 10 Lux\n\n🔹 Age: 14-28 Days:\n• Light = 8 hours | Intensity = 5 Lux",
        "Important Guidelines:\nMaintain adequate day-length during the first 4 weeks so birds have sufficient time to consume their target feed allotment."
      ],
      detailsBn: [
        "1️⃣ প্রথম ৪৮–৭২ ঘণ্টাঃ\nপ্লেসমেন্টের পর প্রথম ৪৮–৭২ ঘণ্টা নিরবচ্ছিন্ন (Continuous) আলো দিতে হবে।\n\n• প্রথম ৭ দিন আলোর তীব্রতা ২০–৬০ লাক্স (প্রায় ২.০–৬.০ ফুট ক্যান্ডেল) রাখতে হবে, যাতে বাচ্চারা সহজে খাবার ও পানি খুঁজে পায়।\n• সব রিয়ারিং হাউস সম্পূর্ণ লাইট-টাইট (Light Tight) হওয়া উচিত।\n• ব্ল্যাকআউট কন্ডিশনে ফ্লক পালন করা অত্যন্ত সুপারিশযোগ্য।",
        "2️⃣ ব্ল্যাকআউট রিয়ারিং লাইটিং প্রোগ্রাম (০–৪ সপ্তাহ)ঃ\n🔹 বয়স: ০–৩ দিনঃ\n• আলো = ২৩ ঘণ্টা\n• আলোর তীব্রতা = ২০–৬০ লাক্স\n\n🔹 বয়স: ৪–৭ দিনঃ\n• আলো = ১৬ ঘণ্টা\n• আলোর তীব্রতা = ২০ লাক্স\n\n🔹 বয়স: ৮–১৪ দিনঃ\n• আলো = ১২ ঘণ্টা\n• আলোর তীব্রতা = ১০ লাক্স\n\n🔹 বয়স: ১৪–২৮ দিনঃ\n• আলো = ৮ ঘণ্টা\n• আলোর তীব্রতা = ৫ লাক্স",
        "3️⃣ গুরুত্বপূর্ণ নির্দেশনাঃ\nপ্রথম ৪ সপ্তাহে পর্যাপ্ত ডে-লেংথ বজায় রাখতে হবে, যাতে পাখিরা নির্ধারিত সম্পূর্ণ ফিড খাওয়ার জন্য পর্যাপ্ত সময় পায়।"
      ],
      keyPointsEn: [
        "1. First 48-72 hrs: Continuous light (20-60 Lux)",
        "2. Blackout Schedule: Day 0-3 (23h), Day 4-7 (16h)",
        "3. Day 8-14 (12h, 10 Lux), Day 14-28 (8h, 5 Lux)",
        "4. Light-tight blackout rearing strongly recommended"
      ],
      keyPointsBn: [
        "১. প্রথম ৪৮-৭২ ঘন্টা: নিরবচ্ছিন্ন আলো & ২০-৬০ লাক্স তীব্রতা",
        "২. ০-৩ দিন: ২৩ ঘণ্টা আলো | ২০-৬০ লাক্স",
        "৩. ৪-৭ দিন: ১৬ ঘণ্টা | ৮-১৪ দিন: ১২ ঘণ্টা | ১৪-২৮ দিন: ৮ ঘণ্টা",
        "৪. লাইট-টাইট ব্ল্যাকআউট হাউজিং সুপারিশকৃত"
      ],
    ),

    // 3. Internal chick temperature guidelines
    BroilerPSArticleItem(
      id: "internal_chick_temperature",
      titleEn: "Internal chick temperature guidelines.",
      titleBn: "বাচ্চার অভ্যন্তরীণ তাপমাত্রা নির্দেশিকা",
      subtitleBn: "বাচ্চার অভ্যন্তরীণ তাপমাত্রা নির্দেশিকা (Internal Chick Temperature Guidelines)",
      subtitleEn: "Body Vent Temperature Standard & Thermal Comfort Range",
      snippetBn: "1️⃣ স্বাভাবিক তাপমাত্রা ৪০–৪১°C, অতিরিক্ত হাঁপানো রোধ & কুসুম ও প্রাথমিক ফিডের গুরুত্ব...",
      snippetEn: "1️⃣ Normal temp 40-41°C (104-106°F), panting prevention, yolk role & early feed importance...",
      imagePath: "assets/ps_broiler.jpg",
      detailsEn: [
        "Normal Internal Temperature:\nNewly hatched chick internal temperature should be 40-41°C (104-106°F). Over the first 5 days, it naturally increases to 41-42°C (106-108°F).",
        "Excessive Temperature:\nIf internal temperature exceeds 41°C (106°F), the chick will begin panting to shed excess heat.",
        "Low Temperature:\nAn internal temperature below 40°C (104°F) indicates the chick is experiencing cold stress/chilling.",
        "Comfortable Condition:\nIn thermal comfort, chicks breathe normally through their nostrils and lose only 1-2 grams of moisture in the first 24 hours.",
        "Role of Yolk:\nThe egg yolk contains 1-2 grams of water, so slight weight loss does not cause dehydration under normal conditions.",
        "Risks of Excessive Panting:\nIf chicks pant heavily, they can lose 5-10 grams of moisture in the first 24 hours, leading to rapid dehydration.",
        "Relative Humidity (RH):\nHigh humidity reduces moisture loss but hinders heat dissipation. Maintaining balanced temperature and RH is essential.",
        "Chicks from Small Eggs:\nChicks from small eggs (young breeder flocks) produce less body heat and require higher brooding ambient temperatures.",
        "Yolk Composition:\nThe egg yolk consists of approx 2/3 fat and 1/3 protein.\n• Fat = Energy source\n• Protein = Necessary for growth",
        "Yolk Quantity:\nResidual yolk mass should ideally be less than 10% of total chick body weight.",
        "Importance of Early Feed Intake:\nIf early feed intake is delayed, the chick burns both yolk fat and protein for energy, leading to a protein deficit required for structural growth."
      ],
      detailsBn: [
        "1️⃣ স্বাভাবিক তাপমাত্রাঃ\nনতুন ফোঁটা বাচ্চার অভ্যন্তরীণ তাপমাত্রা ৪০–৪১°C (১০৪–১০৬°F) হওয়া উচিত। প্রথম ৫ দিনের মধ্যে এটি বেড়ে ৪১–৪২°C (১০৬–১০৮°F) হতে পারে।",
        "2️⃣ অতিরিক্ত তাপমাত্রাঃ\nঅভ্যন্তরীণ তাপমাত্রা ৪১°C (১০৬°F) এর বেশি হলে বাচ্চা হাঁপাতে (panting) শুরু করবে।",
        "3️⃣ কম তাপমাত্রাঃ\nঅভ্যন্তরীণ তাপমাত্রা ৪০°C (১০৪°F) এর কম হলে বুঝতে হবে বাচ্চা ঠান্ডায় কষ্ট পাচ্ছে।",
        "4️⃣ স্বস্তিদায়ক অবস্থাঃ\nআরামদায়ক অবস্থায় বাচ্চা নাক দিয়ে স্বাভাবিকভাবে শ্বাস নেয় এবং প্রথম ২৪ ঘণ্টায় ১–২ গ্রাম আর্দ্রতা (moisture) হারায়।",
        "5️⃣ কুসুমের (Yolk) ভূমিকাঃ\nডিমের কুসুমেও ১–২ গ্রাম পানি থাকে, তাই বাচ্চা কিছু ওজন হারালেও সাধারণত পানিশূন্য (dehydrated) হয় না।",
        "6️⃣ অতিরিক্ত হাঁপালে ঝুঁকিঃ\nযদি বাচ্চা হাঁপাতে শুরু করে, তাহলে প্রথম ২৪ ঘণ্টায় ৫–১০ গ্রাম আর্দ্রতা হারাতে পারে, যা দ্রুত পানিশূন্যতার কারণ হতে পারে।",
        "7️⃣ আপেক্ষিক আর্দ্রতা (Relative Humidity)ঃ\nবেশি আর্দ্রতা আর্দ্রতা ক্ষয় কমায়, কিন্তু একই সাথে শরীরের তাপ বের হওয়াও বাধাগ্রস্ত করে। তাই সঠিক তাপমাত্রা বজায় রাখা অত্যন্ত গুরুত্বপূর্ণ।",
        "8️⃣ ছোট ডিমের বাচ্চাঃ\nছোট ডিম (তরুণ ব্রিডার ফ্লক) থেকে আসা বাচ্চার শরীরে তাপ উৎপাদন কম হয়, তাই তাদের জন্য তুলনামূলক বেশি ব্রুডিং তাপমাত্রা প্রয়োজন।",
        "9️⃣ কুসুমের গঠনঃ\nডিমের কুসুমে প্রায় ২/৩ অংশ চর্বি (Fat) এবং ১/৩ অংশ প্রোটিন থাকে।\n• চর্বি = শক্তির উৎস\n• প্রোটিন = বৃদ্ধির জন্য প্রয়োজনীয়",
        "🔟 কুসুমের পরিমাণঃ\nকুসুমের পরিমাণ মোট বাচ্চার ওজনের ১০% এর কম হওয়া উচিত।",
        "1️⃣1️⃣ প্রাথমিক ফিড গ্রহণের গুরুত্বঃ\nযদি শুরুতেই বাচ্চা খাবার গ্রহণ না করে, তাহলে সে কুসুমের চর্বি ও প্রোটিন উভয়ই শক্তির জন্য ব্যবহার করবে। এর ফলে বৃদ্ধির জন্য প্রয়োজনীয় প্রোটিনের ঘাটতি দেখা দিতে পারে।"
      ],
      keyPointsEn: [
        "1. Normal Temp: 40-41°C (104-106°F) → 41-42°C by Day 5",
        "2. Overheating (> 41°C Panting) vs Chilling (< 40°C)",
        "3. Panting Moisture Loss: 5-10g/24h (Dehydration risk)",
        "4. Yolk Composition: 2/3 Fat (energy), 1/3 Protein (growth); <10% BW"
      ],
      keyPointsBn: [
        "১. স্বাভাবিক তাপমাত্রা: ৪০-৪১°C (১০৪-১০৬°F) → ৫ দিনে ৪১-৪২°C",
        "২. ওভারহিটিং: > ৪১°C (হাঁপানো) | চিলিং: < ৪০°C (ঠান্ডা)",
        "৩. হাঁপালে আর্দ্রতা ক্ষয়: ৫-১০ গ্রাম/২৪ ঘন্টা (পানিশূন্যতার ঝুঁকি)",
        "৪. কুসুমের গঠন: ২/৩ চর্বি (শক্তি), ১/৩ প্রোটিন (বৃদ্ধি); মোট ওজনের < ১০%"
      ],
    ),

    // 4. Ventilation Guidelines in Brooding
    BroilerPSArticleItem(
      id: "ventilation_guidelines_brooding",
      titleEn: "Ventilation Guidelines in Brooding.",
      titleBn: "ব্রুডিংয়ে ভেন্টিলেশন নির্দেশিকা",
      subtitleBn: "ভেন্টিলেশন নির্দেশিকা (Ventilation Guidelines)",
      subtitleEn: "Minimum Air Exchange, Air Velocity Limits & System Protocols",
      snippetBn: "1️⃣ ২৮ দিনের আগে টানেল ভেন্টিলেশন নিষিদ্ধ, ০-১৪ দিন < ৪০ fpm, ট্রানজিশনাল সিস্টেম...",
      snippetEn: "1️⃣ Avoid tunnel ventilation before 28 days, day 0-14 < 40 fpm, transitional systems...",
      imagePath: "assets/ps_broiler.jpg",
      detailsEn: [
        "Avoid Tunnel Ventilation Before 28 Days:\nNever use tunnel ventilation before 28 days of age because birds lack full feather coverage and cannot tolerate high air velocity and cold drafts.",
        "Age 0-14 Days:\n• Keep air speed over birds at a minimum: less than 40 fpm (0.3 m/s).\n• Actual Air Temperature must be the primary consideration when setting target temperature.",
        "Age 15-21 Days:\n• Air speed should not exceed 100 fpm (0.5 m/s).\n• Transitional Ventilation Systems can be utilized during this stage.\n• Effective Air Temperature becomes the primary consideration for temperature settings.",
        "Age 22-28 Days:\n• Air speed should not exceed 200 fpm (1.0 m/s).\n• Transitional Ventilation System can continue to be used.\n• Effective Air Temperature remains the main metric for temperature management.",
        "After 29 Days of Age:\n• Air speed limits are no longer constrained.\n• Evaporative Cooling Systems can be engaged as needed.\n• Effective Temperature and Relative Humidity (RH) are the primary considerations.",
        "Important Principle:\nNever ventilate a poultry house solely for human convenience. Ventilation must always prioritize chick comfort, respiratory health, and flock performance."
      ],
      detailsBn: [
        "1️⃣ টানেল ভেন্টিলেশন ব্যবহারঃ\n২৮ দিন বয়সের আগে কখনোই টানেল ভেন্টিলেশন ব্যবহার করা উচিত নয়। কারণ ২৮ দিনের আগে পাখির পালক সম্পূর্ণ গজায় না, ফলে তারা বাতাসের চাপ ও ঠান্ডা সহজে সহ্য করতে পারে না।",
        "2️⃣ ০–১৪ দিন বয়সঃ\n• পাখির ওপর দিয়ে বাতাসের গতি সর্বনিম্ন রাখতে হবে: ৪০ fpm (০.৩ মি/সেকেন্ড) এর কম।\n• সঠিক তাপমাত্রা নির্ধারণের ক্ষেত্রে Actual Air Temperature (বাস্তব বায়ুর তাপমাত্রা) প্রধান বিবেচ্য বিষয় হবে।",
        "3️⃣ ১৫–২১ দিন বয়সঃ\n• বাতাসের গতি ১০০ fpm (০.৫ মি/সেকেন্ড) এর বেশি হওয়া যাবে না।\n• এ সময়ে Transitional Ventilation System ব্যবহার করা যেতে পারে।\n• তাপমাত্রা নির্ধারণে Effective Air Temperature (কার্যকর তাপমাত্রা) প্রধান বিবেচ্য বিষয় হবে।",
        "4️⃣ ২২–২৮ দিন বয়সঃ\n• বাতাসের গতি ২০০ fpm (১ মি/সেকেন্ড) এর বেশি হওয়া যাবে না।\n• এখানেও Transitional Ventilation System ব্যবহার করা যেতে পারে।\n• তাপমাত্রা সেট করার ক্ষেত্রে Effective Air Temperature বিবেচনায় নিতে হবে।",
        "5️⃣ ২৯ দিন বয়সের পরঃ\n• বাতাসের গতি সীমাবদ্ধ রাখার প্রয়োজন নেই।\n• প্রয়োজন হলে Evaporative Cooling System ব্যবহার করা যেতে পারে।\n• সঠিক তাপমাত্রা নির্ধারণের ক্ষেত্রে Effective Temperature ও Relative Humidity প্রধান বিবেচ্য বিষয় হবে।",
        "6️⃣ গুরুত্বপূর্ণ নির্দেশনাঃ\nমুরগির হাউস কখনোই শুধুমাত্র খামারির সুবিধা অনুযায়ী ভেন্টিলেট করা উচিত নয়। ভেন্টিলেশন সবসময় বাচ্চার আরাম, স্বাস্থ্য ও পারফরম্যান্স বিবেচনা করে নির্ধারণ করতে হবে।"
      ],
      keyPointsEn: [
        "1. Tunnel Ventilation: Avoid before 28 days (immature feathers)",
        "2. Day 0-14: Air speed < 40 fpm (0.3 m/s) | Actual air temp",
        "3. Day 15-28: Air speed 100-200 fpm | Transitional ventilation",
        "4. Day 29+: Evaporative cooling allowed | Effective temp & RH"
      ],
      keyPointsBn: [
        "১. টানেল ভেন্টিলেশন: ২৮ দিনের আগে সম্পূর্ণ নিষেধ (পালক গজানো পর্যন্ত)",
        "২. ০-১৪ দিন: বাতাসের গতি < ৪০ fpm (০.৩ মি/সে) | প্রকৃত বায়ু তাপমাত্রা",
        "৩. ১৫-২৮ দিন: গতি ১০০-২০০ fpm (০.৫-১.০ মি/সে) | ট্রানজিশনাল ভেন্টিলেশন",
        "৪. ২৯+ দিন: ইভাপোরেটিভ কুলিং ব্যবহার | কার্যকর তাপমাত্রা & আর্দ্রতা"
      ],
    ),

    // 5. Definition of Good Air Quality
    BroilerPSArticleItem(
      id: "air_quality_definition",
      titleEn: "Definition of Good Air Quality.",
      titleBn: "ভালো বায়ুর গুণগত মান",
      subtitleBn: "ভালো বায়ুর গুণগত মান (Good Air Quality)",
      subtitleEn: "Shed Air Composition Thresholds & Safety Limits",
      snippetBn: "1️⃣ অক্সিজেন >১৯.৬%, CO2 <৩০০০ ppm, NH3 <১০ ppm, RH ৪৫–৬৫% & ভেন্টিলেশন সতর্কতা...",
      snippetEn: "1️⃣ Oxygen >19.6%, CO2 <3000 ppm, NH3 <10 ppm, RH 45-65% & ventilation warnings...",
      imagePath: "assets/ps_broiler.jpg",
      detailsEn: [
        "1️⃣ Oxygen (O2):\n> 19.6%\n👉 Must not fall below 19.6% at any time.",
        "2️⃣ Carbon Dioxide (CO2):\n< 0.3% / 3000 ppm\n👉 Must not exceed 0.3% or 3000 ppm.",
        "3️⃣ Carbon Monoxide (CO):\n< 10 ppm\n👉 Must not exceed 10 ppm.",
        "4️⃣ Ammonia (NH3):\n< 10 ppm\n👉 Must not exceed 10 ppm.",
        "5️⃣ Inspirable Dust:\n< 3.4 mg/m³\n👉 Must not exceed 3.4 mg/m³.",
        "6️⃣ Relative Humidity (RH):\n45-65%\n👉 Must remain between 45% (not less) and 65% (not more).",
        "📌 Symbol Meanings & Warning:\n• > = Not less than\n• < = Not more than\n• >< = Within target range\n\n⚠️ If target air standards are not maintained, Minimum Ventilation must be increased immediately."
      ],
      detailsBn: [
        "1️⃣ অক্সিজেন (Oxygen)ঃ\n> ১৯.৬%\n👉 ১৯.৬% এর কম হওয়া যাবে না।",
        "2️⃣ কার্বন ডাই-অক্সাইড (Carbon Dioxide)ঃ\n< ০.৩% / ৩০০০ ppm\n👉 ০.৩% বা ৩০০০ ppm এর বেশি হওয়া যাবে না।",
        "3️⃣ কার্বন মনোক্সাইড (Carbon Monoxide)ঃ\n< ১০ ppm\n👉 ১০ ppm এর বেশি হওয়া যাবে না।",
        "4️⃣ অ্যামোনিয়া (Ammonia)ঃ\n< ১০ ppm\n👉 ১০ ppm এর বেশি হওয়া যাবে না।",
        "5️⃣ শ্বাসযোগ্য ধূলিকণা (Inspirable Dust)ঃ\n< ৩.৪ mg/m³\n👉 ৩.৪ mg/m³ এর বেশি হওয়া যাবে না।",
        "6️⃣ আপেক্ষিক আর্দ্রতা (Relative Humidity)ঃ\n৪৫–৬৫%\n👉 ৪৫% এর কম নয় এবং ৬৫% এর বেশি নয় (অর্থাৎ ৪৫–৬৫% এর মধ্যে থাকতে হবে)।",
        "📌 চিহ্নের অর্থ ও গুরুত্বপূর্ণ সতর্কতাঃ\n• > = এর কম নয়\n• < = এর বেশি নয়\n• >< = এর মাঝামাঝি সীমার মধ্যে\n\n⚠️ যদি উপরোক্ত মান বজায় না থাকে, তাহলে Minimum Ventilation বৃদ্ধি করতে হবে।"
      ],
      keyPointsEn: [
        "1. Oxygen (O2): > 19.6% minimum",
        "2. Carbon Dioxide (CO2): < 3000 ppm | Carbon Monoxide (CO): < 10 ppm",
        "3. Ammonia (NH3): < 10 ppm | Inspirable Dust: < 3.4 mg/m³",
        "4. Relative Humidity: 45-65% (Increase Min Ventilation if out of bounds)"
      ],
      keyPointsBn: [
        "১. অক্সিজেন: > ১৯.৬% (এর কম নয়)",
        "২. কার্বন ডাই-অক্সাইড: < ৩০০০ ppm | কার্বন মনোক্সাইড: < ১০ ppm",
        "৩. অ্যামোনিয়া: < ১০ ppm | শ্বাসযোগ্য ধূলিকণা: < ৩.৪ mg/m³",
        "৪. আর্দ্রতা: ৪৫–৬৫% (যদি মান ঠিক না থাকে তবে Minimum Ventilation বাড়াতে হবে)"
      ],
    ),

    // 6. Basics of Brooding
    BroilerPSArticleItem(
      id: "basics_of_brooding",
      titleEn: "Basics of Brooding.",
      titleBn: "ব্রুডিংয়ের মূল মৌলিক বিষয়সমূহ",
      subtitleBn: "জীবনের প্রথম ১৪ দিন: অত্যন্ত গুরুত্বপূর্ণ সময়কাল",
      subtitleEn: "First 14 Days: Critical Development Window & Crop Assessment Guidelines",
      snippetBn: "1️⃣ প্রথম ১৪ দিনে ৪টি মূল উপাদান, মিনি-ড্রিংকার ব্যবহার & ৯৫%+ ক্রপ ফিলাপ নিশ্চিতকরণ...",
      snippetEn: "1️⃣ First 14 days 4 essentials, mini drinkers, line flushing & 95%+ crop fill target...",
      imagePath: "assets/ps_broiler.jpg",
      detailsEn: [
        "Importance of Brooding Period (First 14 Days):\nThe first 14 days are the most critical foundation period. Always remember the 4 essentials:\n👉 Feed, Water, Temperature & Air Quality.\nInitial care and effort directly determine lifetime flock performance.",
        "1️⃣ Feed & Water Upon Arrival:\n• Provide fresh feed and clean water immediately as chicks reach the rearing house.\n• Maintain water temperature between 15°C - 25°C (59°F - 77°F).",
        "2️⃣ Water Line Flushing:\n• Flush water lines a few hours prior to chick placement.\n• Regular flushing during week 1 increases feed/water intake and prevents biofilm buildup.",
        "3️⃣ Brooder & Heater Inspection:\n• Inspect brooders and heaters regularly to ensure proper function.\n• Verify infrared heater angles so heat distributes correctly across the brooding area.",
        "4️⃣ Supplemental Drinkers:\n• Use supplemental mini-drinkers/founts from Day 1 to Days 3-5 (avoid open trays).\n• Reduces footpad infections and water contamination risk.\n• Never place drinkers directly underneath brooders.",
        "5️⃣ 2-Hour Post-Placement Check:\n• Inspect chicks 2 hours after placement to verify comfort, activity, and feed/water crop fill.",
        "6️⃣ Crop Assessment (Crop Check):\nEffective management tool to evaluate early feed and water intake.\n• Randomly select 100 chicks.\n• Check crops 6-8 hours post-placement (or next morning if placed in evening).\n• Crops should be soft and pliable.\n\n⚠️ Hard crop = Insufficient water.\n⚠️ Swollen & tight crop = Insufficient feed.\n\n👉 Target: At least 95% of chicks must have full, pliable crops."
      ],
      detailsBn: [
        "📌 ব্রুডিং পিরিয়ডের গুরুত্ব (জীবনের প্রথম ১৪ দিন)ঃ\nপাখির জীবনের প্রথম ১৪ দিন সবচেয়ে গুরুত্বপূর্ণ সময়গুলোর একটি। এই সময়ে চারটি মৌলিক বিষয় অবশ্যই মনে রাখতে হবে:\n👉 ফিড, পানি, তাপমাত্রা এবং বায়ুর গুণগত মান।\nব্রুডিং পিরিয়ডের গুরুত্ব যতই বলা হোক, তা কমই বলা হবে। জীবনের প্রথম ১৪ দিনই ভবিষ্যৎ ভালো পারফরম্যান্সের ভিত্তি স্থাপন করে। ব্রুডিংয়ের শুরুতে যে যত্ন ও পরিশ্রম করা হয়, তার ফলাফল ফ্লকের চূড়ান্ত পারফরম্যান্সে প্রতিফলিত হয়।",
        "1️⃣ আগমনের সাথে সাথে ফিড ও পানিঃ\n• বাচ্চা রিয়ারিং হাউসে পৌঁছানোর সাথে সাথে টাটকা ফিড ও পানি সরবরাহ করতে হবে।\n• পানির তাপমাত্রা ১৫°C – ২৫°C (৫৯°F – ৭৭°F) এর মধ্যে রাখতে হবে।",
        "2️⃣ পানির লাইন ফ্লাশিংঃ\n• বাচ্চা আসার কয়েক ঘণ্টা আগে পানির লাইন ফ্লাশ করতে হবে, যাতে তারা টাটকা পানি পায়।\n• প্রথম সপ্তাহে নিয়মিত ফ্লাশিং করলে পানি ও ফিড গ্রহণ বাড়ে এবং বায়োফিল্ম জমা কমে।",
        "3️⃣ ব্রুডার ও হিটার পরীক্ষাঃ\n• ব্রুডার ও হিটার নিয়মিত পরীক্ষা করতে হবে, যেন সঠিকভাবে কাজ করছে।\n• ইনফ্রারেড হিটারের কোণ (angle) ঠিক আছে কিনা দেখতে হবে, যাতে তাপ সঠিক জায়গায় পৌঁছায়।",
        "4️⃣ অতিরিক্ত ড্রিংকার ব্যবহারঃ\n• ডে-ওল্ড থেকে ৩–৫ দিন বয়স পর্যন্ত অতিরিক্ত ড্রিংকার ব্যবহার করা ভালো।\n• মিনি ড্রিংকার বা চিক ফাউন্ট ব্যবহার করুন, খোলা ট্রে ব্যবহার করবেন না।\n• এতে পায়ের সংক্রমণ ও পানির মান খারাপ হওয়ার ঝুঁকি কমে।\n• ড্রিংকার কখনোই ব্রুডারের ঠিক নিচে বসাবেন না।",
        "5️⃣ প্লেসমেন্টের ২ ঘণ্টা পর পর্যবেক্ষণঃ\n• প্লেসমেন্টের দুই ঘণ্টা পর বাচ্চা পরীক্ষা করুন।\n• তারা তাপমাত্রায় স্বস্তিতে আছে কিনা এবং খাবার ও পানি গ্রহণ করছে কিনা নিশ্চিত করুন।",
        "6️⃣ ক্রপ মূল্যায়ন (Crop Assessment)ঃ\nক্রপ চেক হলো একটি কার্যকর ব্যবস্থাপনা টুল, যা দিয়ে বোঝা যায় বাচ্চা সঠিকভাবে খাবার ও পানি পেয়েছে কিনা।\n• এলোমেলোভাবে ১০০টি বাচ্চা নির্বাচন করুন।\n• প্লেসমেন্টের ৬–৮ ঘণ্টা পর (বা সন্ধ্যায় এলে পরদিন সকালে) ক্রপ আলতোভাবে পরীক্ষা করুন।\n• ক্রপ নরম ও নমনীয় হওয়া উচিত।\n\n⚠️ যদি ক্রপ শক্ত হয় → পর্যাপ্ত পানি পায়নি।\n⚠️ যদি ক্রপ ফুলে ও টানটান থাকে → পর্যাপ্ত ফিড পায়নি।\n\n👉 পরীক্ষার সময় কমপক্ষে ৯৫% বাচ্চার ক্রপ ভর্তি ও নমনীয় থাকতে হবে।"
      ],
      keyPointsEn: [
        "1. 4 Essentials: Feed, Water, Temp & Air Quality (Water 15-25°C)",
        "2. Flush water lines before arrival & regularly in Week 1",
        "3. Supplemental mini-founts for 3-5 days (avoid open trays)",
        "4. Crop Check (6-8h post-placement): 95%+ full & pliable"
      ],
      keyPointsBn: [
        "১. ৪টি মূল বিষয়: ফিড, পানি, তাপমাত্রা & বায়ুর মান (পানি ১৫-২৫°সে)",
        "২. ওয়াটার লাইন ফ্লাশিং: প্লেসমেন্টের আগে & ১ম সপ্তাহে নিয়মিত",
        "৩. ব্রুডার ও অতিরিক্ত মিনি-ড্রিংকার (৩-৫ দিন, খোলা ট্রে নয়)",
        "৪. ক্রপ চেক (৬-৮ ঘন্টা পর): ৯৫%+ পূর্ণ ও নমনীয় হতে হবে (শক্ত=পানি ঘাটতি)"
      ],
    ),

    // 7. The rules for first light stimulation
    BroilerPSArticleItem(
      id: "rules_first_light_stimulation",
      titleEn: "The rules for first light stimulation.",
      titleBn: "প্রথম লাইট স্টিমুলেশনের নিয়মাবলী",
      subtitleBn: "প্রথম লাইট স্টিমুলেশনের জন্য প্রস্তুতি নির্ধারণের নিয়মাবলী",
      subtitleEn: "Readiness Criteria: Weight (2300-2500g), Fleshing, Fat & Age Guidelines",
      snippetBn: "1️⃣ বডি ওয়েট ২৩০০-২৫০০ গ্রাম, ৯৫% ফ্লেশিং স্কোর #৩/#৪, ৯০% পেলভিক ফ্যাট, ১৪৭-১৫৪ দিনে লাইট...",
      snippetEn: "1️⃣ Body weight 2300-2500g, 95% fleshing score #3/#4, 90% pelvic fat, 147-154 days lighting...",
      imagePath: "assets/ps_broiler.jpg",
      detailsEn: [
        "1️⃣ Target Body Weight:\nFemale body weight must be between 2300-2500 grams.",
        "2️⃣ Fleshing Score:\nAt least 95% of birds must achieve a Fleshing Score of #3 or #4, indicating optimal body condition and muscle development.",
        "3️⃣ Pelvic Fat Reserves:\nAt least 90% of females must possess adequate pelvic fat deposition.\n\nEvaluation Method:\n• Pelvic bones should feel rounded off.\n• Outer bone depression areas should be filled with fat.\n\nAlternatively, sub-cutaneous fat can be evaluated by inspecting the 'Fat Vein'. However, this is mostly used after 25 weeks of age when birds enter lay and pelvic bone abdominal fat becomes harder to assess.",
        "4️⃣ Age at Light Stimulation:\nInitial light stimulation must be given between 147-154 days of age (21-22 weeks).",
        "5️⃣ Post-Light Feed Increments:\nAfter initial light stimulation, elevate daily feed allocation gradually.\n👉 Increase feed by 2-3 grams per bird weekly until egg production commences."
      ],
      detailsBn: [
        "1️⃣ নির্ধারিত বডি ওয়েটঃ\nমুরগির বডি ওয়েট ২৩০০–২৫০০ গ্রাম এর মধ্যে থাকতে হবে।",
        "2️⃣ ফ্লেশিং স্কোর (Fleshing Score)ঃ\nকমপক্ষে ৯৫% মুরগির ফ্লেশিং স্কোর #৩ বা #৪ হতে হবে। এটি নির্দেশ করে যে পাখির শারীরিক কন্ডিশন ও মাংসলতা সঠিক পর্যায়ে আছে।",
        "3️⃣ পেলভিক ফ্যাট (Pelvic Fat)ঃ\nকমপক্ষে ৯০% মুরগির উপযুক্ত পেলভিক ফ্যাট থাকতে হবে।\n\nপরীক্ষার পদ্ধতিঃ\n• পেলভিক হাড় গোলাকার (rounding-off) অনুভূত হবে।\n• বাইরের হাড়ের ডিপ্রেশন অংশ চর্বি দিয়ে পূর্ণ থাকবে।\n\nবিকল্পভাবে “Fat Vein” দেখে সাবকিউটেনিয়াস ফ্যাট নির্ধারণ করা যায়। তবে এটি সাধারণত ২৫ সপ্তাহের পর বেশি ব্যবহৃত হয়, যখন মুরগী উৎপাদন পর্যায়ে প্রবেশ করে এবং পেলভিক হাড় দিয়ে পেটের ভেতরের চর্বির পরিমাণ ভালোভাবে বোঝা যায় না।",
        "4️⃣ বয়সঃ\nপ্রথম লাইট স্টিমুলেশন ১৪৭–১৫৪ দিন বয়সে দিতে হবে।",
        "5️⃣ লাইট স্টিমুলেশনের পর ফিড বৃদ্ধিঃ\nপ্রথম লাইট স্টিমুলেশনের পর ধীরে ধীরে ফিড বাড়াতে হবে।\n👉 প্রতি সপ্তাহে ২–৩ গ্রাম করে বাড়ানো উচিত, উৎপাদন শুরু হওয়া পর্যন্ত।"
      ],
      keyPointsEn: [
        "1. Body Weight: 2300-2500 g | Fleshing Score: 95%+ #3 or #4",
        "2. Pelvic Fat: 90%+ adequate fat reserve (rounded-off pelvic bones)",
        "3. Age Range: 147-154 Days (21-22 Weeks)",
        "4. Post-Light Feed Increment: +2-3 g/bird weekly until lay onset"
      ],
      keyPointsBn: [
        "১. বডি ওয়েট: ২৩০০–২৫০০ গ্রাম | ফ্লেশিং স্কোর: ৯৫%+ #৩ বা #৪",
        "২. পেলভিক ফ্যাট: ৯০%+ পর্যাপ্ত চর্বি সঞ্চয় (পেলভিক হাড় গোলাকার অনুভব)",
        "৩. লাইট স্টিমুলেশনের বয়স: ১৪৭–১৫৪ দিন",
        "৪. ফিড বৃদ্ধি: স্টিমুলেশনের পর প্রতি সপ্তাহে ২–৩ গ্রাম/পাখি (ডিম আসা পর্যন্ত)"
      ],
    ),

    // 8. Preparation for Lay Phase
    BroilerPSArticleItem(
      id: "preparation_lay_phase",
      titleEn: "Preparation for Lay Phase.",
      titleBn: "লেয়িং ফেজের প্রস্তুতি",
      subtitleBn: "নিয়মিত ওজন বৃদ্ধির গুরুত্বপূর্ণ ধাপ",
      subtitleEn: "Weight Gain, Fleshing Reserves, Uniformity & Light Stimulation Rules",
      snippetBn: "1️⃣ ধারাবাহিক ওজন বৃদ্ধি, ফ্লেশিং ও চর্বির মজুদ, ৭০%+ ইউনিফরমিটি & কম ওজন থাকলে লাইট বিলম্ব...",
      snippetEn: "1️⃣ Consistent weight gain, fleshing & fat reserves, 70%+ uniformity & delay light if underweight...",
      imagePath: "assets/ps_broiler.jpg",
      detailsEn: [
        "Importance of Consistent Weight Gain Prior to Lay:\nConsistent weekly body weight gains are critical during this phase. The primary objective is to build adequate fleshing (muscle) and fat reserves to sustain production throughout the laying cycle.",
        "1️⃣ Key Essentials to Maintain:\n• 1. Regular Feed Elevation: Increase feed according to target schedule.\n• 2. Right Age & Body Condition: Ensure age and body condition are optimal before light stimulation.\n• 3. Uniform Frame Size: Maintain consistent frame size across the flock.\n• 4. Adequate Fleshing & Fat Reserve: Build reserves to support peak and persistent egg lay.\n• 5. Prevent Stagnant Growth: Ensure body weight never stalls or drops.",
        "2️⃣ Critical Light Stimulation Guidelines:\n• Delay light stimulation if bird physical composition is inadequate.\n• Design feed and weight management programs that prepare pullets to respond uniformly to light stimulation.\n\nBird response to light stimulation depends on:\n👉 Physical condition (fleshing & fat)\n👉 Actual body weight\n\n⚠️ Never light stimulate if underweight birds remain in the flock.",
        "3️⃣ Target Body Weight & Uniformity Standards:\nFollow breed-specific management supplements to determine target light stimulation weight.\n\n• 1. Uniformity: At least 70% of the flock must fall within ±10% of average body weight (70%+ uniformity).\n• 2. Breed-Specific Weight: Birds must achieve breed standard average weight to ensure synchronized photoperiod response.\n\n👉 If average body weight or flock uniformity falls below breed targets, delay initial light stimulation."
      ],
      detailsBn: [
        "📌 নিয়মিত ওজন বৃদ্ধির গুরুত্বপূর্ণ ধাপঃ\nমুরগির জীবনের এই পর্যায়ে নিয়মিত ও ধারাবাহিক ওজন বৃদ্ধি অত্যন্ত প্রয়োজন। মূল উদ্দেশ্য হলো—\nমুরগির শরীরে পর্যাপ্ত মাংসলতা (fleshing) ও চর্বির মজুদ (fat reserve) তৈরি করা, যাতে সারা উৎপাদনকাল জুড়ে তা কাজে লাগে।",
        "1️⃣ গুরুত্বপূর্ণ ৫টি বিষয়ঃ\n• ১. নিয়মিত ফিড বৃদ্ধি: সঠিক সময় অনুযায়ী নিয়মিত ফিড বৃদ্ধি করতে হবে。\n• ২. সঠিক বয়স ও শারীরিক অবস্থা: লাইট স্টিমুলেশনের সময় পাখির বয়স ও শারীরিক অবস্থা (body condition) সঠিক থাকতে হবে。\n• ৩. ফ্রেম সাইজ বজায় রাখা: সমান ও ধারাবাহিক ফ্রেম সাইজ বজায় রাখতে হবে。\n• ৪. পর্যাপ্ত মাংসলতা ও ফ্যাট রিজার্ভ: ভবিষ্যৎ ডিম উৎপাদনের জন্য যথেষ্ট fleshing ও fat reserve গড়ে তুলতে হবে。\n• ৫. ওজন বৃদ্ধি থেমে যাওয়া রোধ: ওজন বৃদ্ধি যেন থেমে না যায় বা কমে না যায়, তা নিশ্চিত করতে হবে।",
        "2️⃣ লাইট স্টিমুলেশন বিষয়ে গুরুত্বপূর্ণ নির্দেশনাঃ\n• যদি মনে হয় পাখির শারীরিক অবস্থা (physical composition) সঠিক নয়, তাহলে লাইট স্টিমুলেশন বিলম্ব করা উত্তম।\n• ভালো ব্রিডার ফ্লক ডিম উৎপাদনের জন্য এমন ফিড ও ওজন ব্যবস্থাপনা প্রোগ্রাম তৈরি করতে হবে, যা পুলেটকে সমানভাবে (uniformly) লাইট স্টিমুলেশনের প্রতি সাড়া দেওয়ার জন্য প্রস্তুত করে।\n\nমুরগির লাইট স্টিমুলেশনের প্রতিক্রিয়া নির্ভর করে—\n👉 তার শারীরিক গঠন (condition)\n👉 তার বডি ওয়েটের উপর\n\n⚠️ ফ্লকে যদি এখনও কম ওজনের (underweight) পাখি থাকে, তাহলে লাইট স্টিমুলেশন দেওয়া উচিত নয়।",
        "3️⃣ গড় বডি ওয়েট ও ইউনিফরমিটিঃ\nলাইট স্টিমুলেশন শুরু করার গড় বডি ওয়েট নির্ধারণের জন্য সংশ্লিষ্ট ব্রিডার ম্যানেজমেন্ট সাপ্লিমেন্ট অনুসরণ করতে হবে।\n\n• ১. ইউনিফরমিটি: কমপক্ষে ৭০% ফ্লক গড় বডি ওয়েটের ±১০% সীমার মধ্যে থাকতে হবে (অর্থাৎ ৭০% ফ্লক ইউনিফরমিটি নিশ্চিত করতে হবে)।\n• ২. ব্রিড স্পেসিফিক বডি ওয়েট: মুরগিকে অবশ্যই সংশ্লিষ্ট ব্রিড অনুযায়ী নির্ধারিত গড় বডি ওয়েট অর্জন করতে হবে, যাতে লাইট স্টিমুলেশনে সঠিক প্রতিক্রিয়া পাওয়া যায়।\n\n👉 যদি গড় বডি ওয়েট বা ইউনিফরমিটি ব্রিডের সুপারিশকৃত মানের নিচে থাকে, তাহলে প্রথম লাইট স্টিমুলেশন বিলম্ব করার কথা বিবেচনা করতে হবে।"
      ],
      keyPointsEn: [
        "1. Objective: Build adequate fleshing & fat reserves before lay",
        "2. Rule: Delay light stimulation if flock is underweight or non-uniform",
        "3. Uniformity Target: Minimum 70% within ±10% of mean weight",
        "4. Light Response: Dependent on physical condition & target body weight"
      ],
      keyPointsBn: [
        "১. লক্ষ্য: ধারাবাহিক ওজন বৃদ্ধি, ফ্লেশিং & ফ্যাট রিজার্ভ গড়ে তোলা",
        "২. মূল নীতি: কম ওজনের পাখি থাকলে লাইট স্টিমুলেশন বিলম্বিত করা",
        "৩. ইউনিফরমিটি: কমপক্ষে ৭০% পাখি (গড় ওজনের ±১০% সীমার মধ্যে)",
        "৪. লাইট সাড়া: শারীরিক কন্ডিশন ও বডি ওয়েটের ওপর নির্ভরশীল"
      ],
    ),

    // 9. Water Management in Breeder
    BroilerPSArticleItem(
      id: "water_management_breeder",
      titleEn: "Water Management in Breeder.",
      titleBn: "ব্রিডারে পানি ব্যবস্থাপনা",
      subtitleBn: "পানির ব্যবস্থাপনা নির্দেশিকা (Water Management Guidelines)",
      subtitleEn: "Hydration Systems, Drinker Ratios, Sanitation & Line Flushing",
      snippetBn: "1️⃣ বেল ড্রিংকার ১:৮০, নিপল ১:৮-১০, সম্পূরক ড্রিংকার, ফ্লাশিং & পানি পান পর্যবেক্ষণ...",
      snippetEn: "1️⃣ Bell 1:80, Nipple 1:8-10, supplementary drinkers, line flushing & consumption monitoring...",
      imagePath: "assets/ps_broiler.jpg",
      detailsEn: [
        "1️⃣ Primary Drinking Systems:\nMain system can be Bell Drinkers or Nipple Drinkers.\n\n• Bell Drinker = 1 per 80 birds\n• Nipple Drinker = 8-10 birds per nipple\n• No bird should travel more than 3 meters (10 feet) to access water.",
        "2️⃣ Supplementary Drinkers:\n• Provide 2 additional drinkers per 100 chicks from Day 1 to 7 days of age.\n• Ensure chicks have unrestricted access to primary water lines from Day 1.",
        "3️⃣ Nipple Drinker Hygiene & Setup:\n• Nipple drinkers offer superior biosecurity and water sanitation.\n• Adjust height and pressure according to manufacturer specifications.",
        "4️⃣ Bell Drinker Cleaning Protocol:\n• Scrub bell drinkers thoroughly at least every other day.\n• Disinfect cleaning buckets and brushes with chlorine or Quaternary Ammonium sanitizers.",
        "5️⃣ Water Line Flushing:\n• Flush water lines several times daily during the first week.\n• Provides cool, fresh water and stimulates feed intake.",
        "6️⃣ Water Sanitation & Disinfection:\n• Treat water with disinfectants like chlorine to eliminate bacterial contamination.\n• High shed temperatures warm water rapidly, encouraging bacterial bloom.",
        "7️⃣ Header Tank Protection:\n• Header tanks must have tight-fitting lids to prevent airborne dust and bacterial contamination.",
        "8️⃣ Drinker Height Adjustment:\n• After 4 weeks of age, align bell drinker lip height with bird back level.\n• Adjust height regularly to prevent spillage and damp litter.",
        "9️⃣ Water Consumption Monitoring:\n• Birds consume the majority of their water requirement within 2-3 hours after feeding.\n• If water meter usage does not surge during this post-feeding window, inspect water lines for restrictions or low pressure."
      ],
      detailsBn: [
        "1️⃣ প্রধান পানির সিস্টেমঃ\nপ্রধান ড্রিংকিং সিস্টেম হতে পারে বেল ড্রিংকার বা নিপল ড্রিংকার।\n\n• বেল ড্রিংকার = প্রতি ৮০টি পাখির জন্য ১টি\n• নিপল ড্রিংকার = প্রতি নিপলে ৮–১০টি পাখি\n• কোনো পাখিকে পানি পেতে ৩ মিটার (১০ ফুট) এর বেশি পথ অতিক্রম করতে হবে না।",
        "2️⃣ অতিরিক্ত ড্রিংকার (Supplementary Drinkers)ঃ\n• ডে-ওল্ড থেকে ৭ দিন বয়স পর্যন্ত প্রতি ১০০টি বাচ্চার জন্য ২টি অতিরিক্ত ড্রিংকার দিতে হবে।\n• ডে-ওল্ড থেকেই প্রধান পানির লাইনে বাচ্চাদের প্রবেশাধিকার নিশ্চিত করতে হবে।",
        "3️⃣ নিপল ড্রিংকারঃ\n• নিপল ড্রিংকার বেশি স্বাস্থ্যসম্মত পানি সরবরাহ ব্যবস্থা।\n• প্রস্তুতকারকের নির্দেশনা অনুযায়ী উচ্চতা ও প্রেসার সমন্বয় করতে হবে।",
        "4️⃣ বেল ড্রিংকার পরিষ্কারঃ\n• বেল ড্রিংকার অন্তত এক দিন পরপর ভালোভাবে ধুতে হবে।\n• পরিষ্কারের জন্য ব্যবহৃত বালতি ও ব্রাশ ক্লোরিন বা কোয়াটারনারি অ্যামোনিয়াম স্যানিটাইজার দিয়ে জীবাণুমুক্ত করতে হবে।",
        "5️⃣ পানির লাইন ফ্লাশিংঃ\n• প্রথম কয়েকদিন (প্রথম সপ্তাহ) দিনে কয়েকবার পানির লাইন ফ্লাশ করতে হবে।\n• এতে ঠান্ডা ও তাজা পানি পাওয়া যায় এবং ফিড গ্রহণ বৃদ্ধি পায়।",
        "6️⃣ পানিতে জীবাণুনাশক ব্যবহারঃ\n• পানিতে ক্লোরিনের মতো জীবাণুনাশক ব্যবহার করতে হবে, যাতে ব্যাকটেরিয়ার উপস্থিতি না থাকে।\n• হাউসের উচ্চ তাপমাত্রায় পানি দ্রুত গরম হয়ে যায় এবং ব্যাকটেরিয়া দ্রুত বৃদ্ধি পায়।",
        "7️⃣ হেডার ট্যাংকঃ\n• হেডার ট্যাংকে অবশ্যই ঢাকনা থাকতে হবে, যাতে বাতাসের মাধ্যমে ব্যাকটেরিয়া বা ময়লা ঢুকতে না পারে।",
        "8️⃣ ড্রিংকারের উচ্চতা সমন্বয়ঃ\n• ৪ সপ্তাহ বয়সের পর বেল ড্রিংকারের উচ্চতা পাখির পিঠের সমান রাখতে হবে।\n• নিয়মিত উচ্চতা সমন্বয় করতে হবে, যাতে পানি ছিটকে না পড়ে এবং লিটার ভেজা না হয়।",
        "9️⃣ পানি গ্রহণ পর্যবেক্ষণঃ\n• পাখি সাধারণত খাওয়ার পরবর্তী ২–৩ ঘণ্টায় বেশি পানি পান করে।\n• এই সময়ে পানি ব্যবহারের পরিমাণ না বাড়লে পানির লাইনে বাধা বা কম প্রবাহ থাকার সম্ভাবনা থাকে, যা পাখিকে পর্যাপ্ত পানি পেতে বাধা দেয়।"
      ],
      keyPointsEn: [
        "1. Bell: 1/80 birds | Nipple: 1/8-10 birds (Max 3m distance)",
        "2. Supplementary Drinkers: 2/100 chicks for first 7 days",
        "3. Hygiene: Scrub alternate days & sanitize with chlorine",
        "4. Consumption Surge: Monitor water meter 2-3h post feeding"
      ],
      keyPointsBn: [
        "১. বেল ড্রিংকার: ১টি/৮০ পাখি | নিপল: ১টি/৮-১০ পাখি (সর্বোচ্চ ৩ মি দূরত্ব)",
        "২. সম্পূরক ড্রিংকার: ডে-ওল্ডে ২টি/১০০ বাচ্চা (৭ দিন পর্যন্ত)",
        "৩. পরিষ্কার & স্যানিটেশন: একদিন পর পর ধোয়া & ক্লোরিনেশন নিশ্চিতকরণ",
        "৪. পিক ওয়াটার ব্যবহার: খাওয়ার পরবর্তী ২-৩ ঘণ্টায় পর্যবেক্ষণ"
      ],
    ),

    // 10. Nipple Flow Rates in Breeder
    BroilerPSArticleItem(
      id: "nipple_flow_rates",
      titleEn: "Nipple Flow Rates in Breeder.",
      titleBn: "নিপল ড্রিংকার ফ্লো রেট",
      subtitleBn: "নিপল ড্রিংকার ফ্লো রেট (প্রথম ৪ সপ্তাহ ও পরবর্তী সময়)",
      subtitleEn: "Age-Wise Nipple Water Delivery Rates & Pressure Adjustments",
      snippetBn: "1️⃣ ০-৭ দিন ৩০মি.লি, ৭-১৪ দিন ৪২মি.লি, ১৪-২১ দিন ৪৯মি.লি, ২১-২৮ দিন ৫৬মি.লি, ২৮+ দিন ৬০মি.লি...",
      snippetEn: "1️⃣ Day 0-7 (30ml/min), Day 7-14 (42ml/min), Day 14-21 (49ml/min), Day 21-28 (56ml/min), Day 28+ (60ml/min)...",
      imagePath: "assets/ps_broiler.jpg",
      detailsEn: [
        "1️⃣ Age: 0-7 Days:\n• Nipple flow rate = 30 ml/minute",
        "2️⃣ Age: 7-14 Days:\n• Nipple flow rate = 42 ml/minute",
        "3️⃣ Age: 14-21 Days:\n• Nipple flow rate = 49 ml/minute",
        "4️⃣ Age: 21-28 Days:\n• Nipple flow rate = 56 ml/minute",
        "5️⃣ Age: > 28 Days:\n• Nipple flow rate = 60 ml/minute",
        "👉 Ensuring precise age-based flow rates is vital to guarantee adequate hydration and uniform growth."
      ],
      detailsBn: [
        "1️⃣ বয়স: ০–৭ দিনঃ\n• প্রতি মিনিটে নিপল থেকে পানি প্রবাহ = ৩০ মিলি",
        "2️⃣ বয়স: ৭–১৪ দিনঃ\n• প্রতি মিনিটে পানি প্রবাহ = ৪২ মিলি",
        "3️⃣ বয়স: ১৪–২১ দিনঃ\n• প্রতি মিনিটে পানি প্রবাহ = ৪৯ মিলি",
        "4️⃣ বয়স: ২১–২৮ দিনঃ\n• প্রতি মিনিটে পানি প্রবাহ = ৫৬ মিলি",
        "5️⃣ বয়স: ২৮ দিনের বেশিঃ\n• প্রতি মিনিটে পানি প্রবাহ = ৬০ মিলি",
        "👉 বয়স অনুযায়ী সঠিক ফ্লো রেট নিশ্চিত করা অত্যন্ত গুরুত্বপূর্ণ, যাতে পাখি পর্যাপ্ত পানি পায় এবং বৃদ্ধি স্বাভাবিক থাকে।"
      ],
      keyPointsEn: [
        "1. Age 0-7 Days: 30 ml/min",
        "2. Age 7-14 Days: 42 ml/min | Age 14-21 Days: 49 ml/min",
        "3. Age 21-28 Days: 56 ml/min | Age > 28 Days: 60 ml/min",
        "4. Precise age-based flow rates support uniform growth"
      ],
      keyPointsBn: [
        "১. ০-৭ দিন: ৩০ মিলি/মিনিট",
        "২. ৭-১৪ দিন: ৪২ মিলি/মিনিট | ১৪-২১ দিন: ৪৯ মিলি/মিনিট",
        "৩. ২১-২৮ দিন: ৫৬ মিলি/মিনিট | ২৮+ দিন: ৬০ মিলি/মিনিট",
        "৪. বয়স ভিত্তিক ফ্লো রেট হাইড্রেশন ও স্বাভাবিক বৃদ্ধি সুনিশ্চিত করে"
      ],
    ),

    // 11. Breeder Body weight Control
    BroilerPSArticleItem(
      id: "body_weight_control",
      titleEn: "Breeder Body weight Control.",
      titleBn: "ব্রিডার বডি ওয়েট নিয়ন্ত্রণ",
      subtitleBn: "বডি ওয়েট নিয়ন্ত্রণের উদ্দেশ্য ও পদ্ধতি (Body Weight Control Management)",
      subtitleEn: "Weekly Weight Tracking, Scale Specs, Sample Selection & Feed Allocation",
      snippetBn: "1️⃣ ৬০-১০০টি নমুনা ওজন, ±২০গ্রা নির্ভুল স্কেল, রিয়ারিংয়ে ফিড না কমানো & পিকের পর ফিড হ্রাস...",
      snippetEn: "1️⃣ 60-100 sample weigh, ±20g accurate scale, no feed reduction in rearing & post-peak withdrawal...",
      imagePath: "assets/ps_broiler.jpg",
      detailsEn: [
        "Objectives & Principles of Body Weight Control:\nAchieve target body weight standards for every age while maintaining high flock uniformity.\n\n• Rearing Feed Allocation: 👉 Based on Body Weight + Maintenance requirements.\n• Laying Feed Allocation: 👉 Based on Body Weight + Maintenance + Egg Production % + Egg Weight.",
        "1️⃣ Importance of Weekly Weighing:\nPrecise feed allocation is impossible without consistent weekly body weight monitoring.",
        "2️⃣ Sampling & Weighing Frequency:\n• Weigh 60-100 birds per pen or 1-2% of total population (minimum 50 birds) for a representative sample.\n• At 7 and 14 days, group weigh 10 chicks together in a bucket.\n• Thereafter, weigh individual birds weekly on the same day and time (prior to feeding or on off-feed days).",
        "3️⃣ Scale Specifications & Accuracy:\n• Scale capacity: minimum 5 kg (11.02 lbs) with accuracy of ±20 g (0.04 lbs).\n• Calibrate scales regularly; digital scales with printer memory are recommended.",
        "4️⃣ Sampling Location:\n• Catch sample birds from the central house section.\n• For large samples, divide catch points evenly across front, middle, and rear sections.",
        "5️⃣ Complete Sample Weighing:\n• Weigh every bird trapped inside the catching pen, including small/culled birds.\n• Use this window to correct sexing errors. Record weights accurately.",
        "6️⃣ Average Weight Calculation:\n• Sum all individual weights and divide by sample count to calculate exact average body weight.",
        "7️⃣ Plotting Growth Chart & 8️⃣ Feed Allocation:\n• Plot average weight against standard breed growth curves.\n• Calculate feed allocation for the upcoming days.\n👉 Maintain or elevate feed during rearing; never reduce feed except in emergency situations.",
        "9️⃣ Post-Peak Feed Reduction:\n• Controlled feed reduction commences post-peak egg production.\n• Purpose: Control mature body weight, maintain persistent egg lay, and preserve fertility.\n⚠️ Specific feed withdrawal protocols vary depending on flock dynamics."
      ],
      detailsBn: [
        "📌 বডি ওয়েট নিয়ন্ত্রণের মূল উদ্দেশ্য ও নীতিঃ\nসকল পাখিকে বয়স অনুযায়ী নির্ধারিত লক্ষ্যমাত্রা ওজন পর্যন্ত উন্নীত করা এবং ভালো ইউনিফরমিটি বজায় রাখা।\n\n• রিয়ারিং সময়ে ফিড নির্ধারণ: 👉 বডি ওয়েট ও মেইনটেন্যান্স প্রয়োজন অনুযায়ী।\n• লে (ডিম উৎপাদন) পর্যায়ে ফিড নির্ধারণ: 👉 বডি ওয়েট + মেইনটেন্যান্স + ডিম উৎপাদন + ডিমের ওজন অনুযায়ী।",
        "1️⃣ সাপ্তাহিক ওজন পরিমাপের গুরুত্বঃ\nসঠিকভাবে প্রতি সপ্তাহে বডি ওয়েট পরিমাপ না করলে ফিডের সঠিক পরিমাণ নির্ধারণ করা সম্ভব নয়।",
        "2️⃣ কীভাবে বডি ওয়েট মাপবেনঃ\n• প্রতি পেন থেকে প্রতি সপ্তাহে ৬০–১০টি পাখি অথবা মোট পাখির ১%–২% (ন্যূনতম ৫০টি পাখি) ওজন করতে হবে (প্রতিনিধিত্বমূলক নমুনা)।\n• ৭ ও ১৪ দিন বয়সে একসাথে ১০টি বাচ্চা বালতিতে রেখে গ্রুপ ওজনে মাপা যায়।\n• এরপর থেকে প্রতি সপ্তাহে একই দিন ও সময়ে প্রতিটি পাখি আলাদাভাবে ওজন করুন (ফিড দেওয়ার আগে বা অফ-ডে তে)।",
        "3️⃣ সঠিক ওজন মাপার যন্ত্রঃ\n• স্কেলের ধারণক্ষমতা কমপক্ষে ৫ কেজি (১১.০২ পাউন্ড) ও নির্ভুলতা ±২০ গ্রাম (.০৪ পাউন্ড) হতে হবে।\n• নিয়মিত ক্যালিব্রেশন পরীক্ষা নিশ্চিত করুন; প্রিন্টআউট সুবিধাযুক্ত ডিজিটাল স্কেল উত্তম।",
        "4️⃣ সঠিক নমুনা সংগ্রহঃ\n• হাউসের মাঝখানের অংশ থেকে পাখি সংগ্রহ করা ভালো।\n• বড় নমুনা হলে হাউসের সামনে, মাঝখান ও পিছন—এই ৩ জায়গা থেকে সমানভাবে নিতে হবে।",
        "5️⃣ সব পাখি ওজন করাঃ\n• ক্যাচিং পেনে ধরা পড়া সব পাখি (ছোট পাখিসহ) ওজন করতে হবে।\n• এই সময়ে ভুল লিঙ্গ শনাক্তকরণ (cull sexing errors) সংশোধন করা যায়। চার্টে লিখে রাখুন।",
        "6️⃣ গড় ওজন নির্ধারণঃ\n• সব পাখির ওজন যোগ করে মোট সংখ্যা দিয়ে ভাগ করে গড় (Average) বডি ওয়েট নির্ধারণ করুন।",
        "7️⃣ চার্টে প্লট করা ও 8️⃣ ফিড পরিমাণ নির্ধারণঃ\n• গড় বডি ওয়েট সংশ্লিষ্ট গ্রোথ চার্টে প্লট করতে হবে।\n• পরবর্তী দিনের জন্য ফিডের পরিমাণ নির্ধারণ করুন।\n👉 রিয়ারিং সময়ে ফিড সাধারণত বজায় রাখা বা বৃদ্ধি করা হয় (জরুরি পরিস্থিতি ছাড়া ফিড কমানো উচিত নয়)।",
        "9️⃣ পিক প্রোডাকশনের পর ফিড ব্যবস্থাপনাঃ\n• ডিম উৎপাদনের পিকের পর সাধারণত ফিড কমানো হয়।\n• উদ্দেশ্য: পূর্ণবয়স্ক বডি ওয়েট নিয়ন্ত্রণ, ডিম উৎপাদনের স্থায়িত্ব বজায় রাখা ও ফার্টিলিটি নিশ্চিত করা।\n⚠️ ফিড কমানোর সুনির্দিষ্ট পদ্ধতি ফ্লকভেদে ভিন্ন হতে পারে।"
      ],
      keyPointsEn: [
        "1. Sample Size: 60-100 birds/pen (1-2% of flock), group weigh at 7-14 days",
        "2. Scale Accuracy: ±20 g, capacity minimum 5 kg",
        "3. Rearing Rule: Maintain/elevate feed; never drop during rearing",
        "4. Post-Peak Withdrawal: Control adult body weight & sustain fertility"
      ],
      keyPointsBn: [
        "১. নমুনা সাইজ: ৬০-১০০টি/পেন (বা ১-২% পাখি), ৭-১৪ দিনে গ্রুপ ওজন",
        "২. স্কেল নির্ভুলতা: ±২০ গ্রাম, ধারণক্ষমতা ন্যূনতম ৫ কেজি",
        "৩. রিয়ারিং ফিড রুল: ফিড বৃদ্ধি/বজায় রাখা (জরুরি ছাড়া কমানো নিষেধ)",
        "৪. পিকের পর ফিড কমানো: পূর্ণবয়স্ক ওজন & ফার্টিলিটি ধরে রাখা"
      ],
    ),

    // 12. Brooding Guide for Optimum Breeder Development
    BroilerPSArticleItem(
      id: "optimum_breeder_brooding_guide",
      titleEn: "Brooding Guide for Optimum Breeder Development.",
      titleBn: "সর্বোত্তম ব্রিডার উন্নয়নের ব্রুডিং গাইড",
      subtitleBn: "সর্বোত্তম ব্রিডার উন্নয়নের জন্য ব্রুডিং নির্দেশিকা",
      subtitleEn: "Comprehensive Setup & Care Protocols for Parent Chicks",
      snippetBn: "1️⃣ Brooding Period এর গুরুত্বঃ Brooding period সাধারণত বাচ্চা ফার্মে আসার পর থেকে প্রথম ১৪ দিন...",
      snippetEn: "1️⃣ Importance of Brooding Period: Brooding covers the first 14 days post chick placement...",
      imagePath: "assets/ps_broiler.jpg",
      detailsEn: [
        "Brooding Period Importance: The brooding period is generally considered the first 14 days after chicks arrive at the farm. This phase is the most critical stage in a chick's life.",
        "Sensitive Phase: During this period, the chick's body temperature regulation (thermoregulation system) transitions from an immature state to maturity, making it an extremely sensitive phase.",
        "Survival Dependence: The survival of newly hatched chicks largely depends on how quickly and effectively they adapt from the hatchery environment to the farm environment.",
        "Long-Term Impact of Errors: Any management mistakes made during this critical time can cause permanent damage and negatively affect the entire flock's lifetime performance."
      ],
      detailsBn: [
        "Brooding Period এর গুরুত্বঃ Brooding period সাধারণত বাচ্চা ফার্মে আসার পর থেকে প্রথম ১৪ দিন পর্যন্ত ধরা হয়। এই সময়টাই একটি বাচ্চার জীবনের সবচেয়ে গুরুত্বপূর্ণ ধাপ।",
        "সংবেদনশীল সময়কালঃ এই সময় বাচ্চার দেহের তাপমাত্রা নিয়ন্ত্রণ ব্যবস্থা (thermoregulation system) অপরিণত অবস্থা থেকে ধীরে ধীরে পরিণত অবস্থায় রূপান্তরিত হয়। তাই এটি অত্যন্ত সংবেদনশীল একটি পর্যায়।",
        "বেঁচে থাকার নির্ভরতাঃ নতুন ফুটে বের হওয়া বাচ্চার বেঁচে থাকা অনেকটাই নির্ভর করে হ্যাচারি থেকে ফার্ম পরিবেশে কত দ্রুত ও কার্যকরভাবে সে খাপ খাইয়ে নিতে পারছে তার উপর।",
        "ভুলের দীর্ঘমেয়াদি প্রভাবঃ এই গুরুত্বপূর্ণ সময়ে কোনো ব্যবস্থাপনাগত ভুল হলে তা অনেক সময় স্থায়ী ক্ষতির কারণ হতে পারে এবং পুরো ফ্লকের সারাজীবনের পারফরম্যান্সের উপর নেতিবাচক প্রভাব ফেলতে পারে।"
      ],
      keyPointsEn: [
        "Primary Phase: First 14 days post-placement",
        "System Maturation: Thermoregulation development",
        "Key Factor: Fast adaptation from hatchery to farm",
        "Risk Factor: Early mistakes cause permanent damage"
      ],
      keyPointsBn: [
        "১. Brooding Period এর গুরুত্ব (প্রথম ১৪ দিন)",
        "২. সংবেদনশীল সময়কাল (থার্মোরেগুলেশন ব্যবস্থা)",
        "৩. বেঁচে থাকার নির্ভরতা (ফার্ম পরিবেশে খাপ খাওয়ানো)",
        "৪. ভুলের দীর্ঘমেয়াদি প্রভাব (স্থায়ী ক্ষতির সম্ভাবনা)"
      ],
    ),

    // 13. The physiological changes during Brooding Period
    BroilerPSArticleItem(
      id: "physiological_changes_brooding",
      titleEn: "The physiological changes during Brooding Period.",
      titleBn: "ব্রুডিং পিরিয়ডে শারীরবৃত্তীয় পরিবর্তনসমূহ",
      subtitleBn: "ব্রুডিং পিরিয়ডে যে শারীরবৃত্তীয় (Physiological) পরিবর্তনগুলো ঘটে তা নিম্নোক্ত সিস্টেমগুলোর বিকাশের সাথে সম্পর্কিত",
      subtitleEn: "Immune, Digestive, Skeletal & Thermoregulation System Development",
      snippetBn: "1️⃣ ইমিউন সিস্টেমঃ প্যাসিভ (মাতৃ-প্রদত্ত ২-৩ সপ্তাহ) ও অ্যাকটিভ ইমিউনিটির বিকাশ...",
      snippetEn: "1️⃣ Immune System: Passive (maternal 2-3 weeks) & Active immunity development...",
      imagePath: "assets/ps_broiler.jpg",
      detailsEn: [
        "Immune System Development:\n• Passive Immunity: Antibodies pass from breeder hen via yolk to chick, lasting approx 2-3 weeks.\n• Active Immunity: Developed gradually via in-ovo vaccines, day-old vaccines, field vaccination & pathogen exposure.",
        "Digestive System Maturation:\n• Rapid growth of internal organs (liver, intestine, pancreas, spleen & bursa) essential for optimal digestion.\n• Feed conversion and growth velocity are most efficient during this window compared to any other stage.",
        "Skeletal Development (Long Bone Growth):\n• Rapid growth and density accumulation of long bones, vital for strong legs and mineral metabolism in adult life.",
        "Thermoregulation System:\n• Chicks cannot self-regulate body temperature for the first 5 days.\n• Thermoregulation system is not fully mature until ~2 weeks of age.\n• Survival depends entirely on maintaining precise ambient shed temperature.",
        "📌 Important Note:\nImproper brooding management leads to higher chick mortality, poor flock uniformity, and reduced lifetime layer/breeder performance, inflating production costs per bird.",
        "👉 7-Day Target Weight:\nShould reach 4.0 to 4.5 times the day-old chick weight. 7-day body weight is a key benchmark of brooding success. If missed, re-evaluate pre-placement and brooding protocols immediately."
      ],
      detailsBn: [
        "ইমিউন সিস্টেম (Immune System)ঃ\n• প্যাসিভ ইমিউনিটি (Passive Immunity)ঃ ব্রিডার মুরগি থেকে ডিমের কুসুমের মাধ্যমে অ্যান্টিবডি বাচ্চার শরীরে প্রবেশ করে। এই মাতৃ-প্রদত্ত সুরক্ষা সাধারণত প্রায় ২–৩ সপ্তাহ পর্যন্ত থাকে।\n\n• অ্যাকটিভ ইমিউনিটি (Active Immunity)ঃ ইন-ওভো ভ্যাকসিন, ডে-ওল্ড ভ্যাকসিন, ফিল্ড ভ্যাকসিনেশন এবং পরিবেশে বিদ্যমান রোগজীবাণুর সংস্পর্শের মাধ্যমে ধীরে ধীরে নিজস্ব রোগপ্রতিরোধ ক্ষমতা তৈরি হয়।",
        "পরিপাকতন্ত্র (Digestive System)ঃ\n• লিভার, অন্ত্র, প্যানক্রিয়াস, প্লীহা (Spleen) ও বার্সা সহ অভ্যন্তরীণ অঙ্গগুলোর দ্রুত বৃদ্ধি ঘটে, যা সঠিক হজম প্রক্রিয়ার জন্য অত্যন্ত প্রয়োজনীয়।\n\n• জীবনের অন্য যেকোনো সময়ের তুলনায় এই সময়ে ফিড কনভার্শন ও বৃদ্ধি হার সবচেয়ে বেশি কার্যকর থাকে।",
        "কঙ্কালতন্ত্র / লম্বা হাড়ের বিকাশ (Skeletal Development)ঃ\n• লম্বা হাড়ের দ্রুত বৃদ্ধি ও পুরুত্ব বৃদ্ধি ঘটে, যা ভবিষ্যতে শক্ত পা ও সঠিক মিনারেল মেটাবলিজমের জন্য অত্যন্ত গুরুত্বপূর্ণ।",
        "তাপমাত্রা নিয়ন্ত্রণ ব্যবস্থা (Thermoregulation)ঃ\n• জীবনের প্রথম ৫ দিন বাচ্চা নিজ শরীরের তাপমাত্রা নিয়ন্ত্রণ করতে পারে না।\n\n• প্রায় ২ সপ্তাহ বয়স পর্যন্ত তাপ নিয়ন্ত্রণ ব্যবস্থা পুরোপুরি পরিপক্ব হয় না।\n\n• এই সময় বাচ্চার বেঁচে থাকা সম্পূর্ণভাবে নির্ভর করে খামারির সঠিক পরিবেশ তাপমাত্রা বজায় রাখার উপর।",
        "📌 নোটঃ\nভুল ব্রুডিং ব্যবস্থাপনা হলে বাচ্চার মৃত্যুহার বৃদ্ধি, ফ্লকের ইউনিফরমিটি কমে যাওয়া এবং পালেট ও লেয়ার হাউসে সামগ্রিক খারাপ পারফরম্যান্স দেখা দিতে পারে। এর ফলে প্রতি বাচ্চার উৎপাদন খরচ বেড়ে যায়।",
        "👉 ৭ দিনের লক্ষ্যমাত্রা ওজনঃ\nডে-ওল্ড বাচ্চার ওজনের প্রায় ৪ থেকে ৪.৫ গুণ হওয়া উচিত। ৭ দিন বয়সের বডি ওয়েট ব্রুডিং ব্যবস্থাপনার সাফল্য নির্ণয়ের একটি চমৎকার নির্দেশক। যদি এই লক্ষ্যমাত্রা অর্জিত না হয়, তবে প্রি-প্লেসমেন্ট প্রস্তুতি ও ব্রুডিং ব্যবস্থাপনা পদ্ধতি গুরুত্বসহকারে পুনর্মূল্যায়ন করা প্রয়োজন।"
      ],
      keyPointsEn: [
        "1. Immune System (Passive 2-3 wks & Active)",
        "2. Digestive System & Internal Organ Growth",
        "3. Skeletal Development (Long Bone Growth)",
        "4. Thermoregulation & 7-Day Target Weight (4-4.5x DOC weight)"
      ],
      keyPointsBn: [
        "১. ইমিউন সিস্টেম (প্যাসিভ ও অ্যাকটিভ ইমিউনিটি)",
        "২. পরিপাকতন্ত্র ও অঙ্গের দ্রুত বিকাশ",
        "৩. কঙ্কালতন্ত্র (লম্বা হাড়ের বৃদ্ধি)",
        "৪. থার্মোরেগুলেশন ও ৭ দিনের লক্ষ্যমাত্রা ওজন (৪-৪.৫ গুণ)"
      ],
    ),

    // 14. Physiological Development Curve - Broiler Female
    BroilerPSArticleItem(
      id: "physiological_development_curve_female",
      titleEn: "Physiological Development Curve - Broiler Female.",
      titleBn: "ব্রয়লার ফিমেল-এর শারীরবৃত্তীয় উন্নয়ন কার্ভ",
      subtitleBn: "ব্রয়লার ফিমেল-এর শারীরবৃত্তীয় উন্নয়ন কার্ভ (Physiological Development Curve – Broiler Female)",
      subtitleEn: "4 Key Phases of Broiler Breeder Female Rearing & Growth Curve",
      snippetBn: "রিয়ারিং পিরিয়ডে বডি ওয়েট কার্ভ সঠিকভাবে বোঝা অত্যন্ত গুরুত্বপূর্ণ। এই সময়কে সাধারণত ৪টি ধাপে ভাগ করা যায়...",
      snippetEn: "Understanding body weight curves in rearing is critical, divided into 4 key development phases...",
      imagePath: "assets/ps_broiler.jpg",
      detailsEn: [
        "Rearing Period Weight Curve Importance:\nUnderstanding the body weight curve during rearing is extremely critical. This growth window is typically divided into 4 main phases.",
        "1️⃣ Phase 1: 0-8 Weeks:\nDuring this period, critical frame size and flock uniformity for future lifetime performance are established. Failing to reach target growth in this phase negatively impacts all future laying performance.",
        "2️⃣ Phase 2: 8-12 Weeks:\nBirds must be kept under a carefully controlled feeding program during this phase.\nObjectives:\n• Prevent pullets from becoming overweight\n• Prevent excessive muscle/fleshing accumulation (over-fleshed)",
        "3️⃣ Phase 3: 12-16 Weeks:\nPuberty begins during this phase.\n• Fleshing gradually increases\n• Overall physical condition and body reserve mature",
        "4️⃣ Phase 4: 16-20 Weeks:\nGrowth velocity must be significantly accelerated during this window.\nObjectives:\n• Prepare birds for sexual development & maturity\n• Ensure optimum flock uniformity\n• Achieve adequate muscle & skeletal conditioning",
        "📌 Around 20 Weeks:\nBy 20 weeks of age, abdominal fat deposition should commence, which is not strictly dependent on body weight alone. This fat serves as an essential energy reserve for upcoming egg production."
      ],
      detailsBn: [
        "রিয়ারিং পিরিয়ডে বডি ওয়েট কার্ভের গুরুত্বঃ\nরিয়ারিং পিরিয়ডে বডি ওয়েট কার্ভ সঠিকভাবে বোঝা অত্যন্ত গুরুত্বপূর্ণ। এই সময়কে সাধারণত ৪টি ধাপে ভাগ করা যায়।",
        "1️⃣ প্রথম ধাপ: ০–৮ সপ্তাহঃ\nএই সময়েই ভবিষ্যৎ জীবনের জন্য সবচেয়ে গুরুত্বপূর্ণ ফ্রেম সাইজ ও ইউনিফরমিটি নির্ধারিত হয়। এই পর্যায়ে সঠিক বৃদ্ধি নিশ্চিত না হলে পরবর্তী পারফরম্যান্সে নেতিবাচক প্রভাব পড়ে।",
        "2️⃣ দ্বিতীয় ধাপ: ৮–১২ সপ্তাহঃ\nএই সময়ে পাখিকে একটি সতর্কভাবে নিয়ন্ত্রিত ফিডিং প্রোগ্রামের অধীনে রাখতে হবে।\n\nউদ্দেশ্য হলো—\n• পাখিকে অতিরিক্ত মোটা (overweight) হওয়া থেকে রক্ষা করা\n• অতিরিক্ত মাংসল (over fleshed) হওয়া প্রতিরোধ করা",
        "3️⃣ তৃতীয় ধাপ: ১২–১৬ সপ্তাহঃ\nএই সময়ে বয়ঃসন্ধিকাল (Puberty) শুরু হয়।\n\n• ধীরে ধীরে মাংসলতা (fleshing) বৃদ্ধি পেতে শুরু করবে\n• সার্বিক শারীরিক কন্ডিশন উন্নত হবে",
        "4️⃣ চতুর্থ ধাপ: ১৬–২০ সপ্তাহঃ\nএই সময়ে বৃদ্ধি হার উল্লেখযোগ্যভাবে বাড়াতে হবে।\n\nউদ্দেশ্য হলো—\n• যৌন পরিপক্বতার (sexual development) জন্য প্রস্তুত করা\n• সঠিক ইউনিফরমিটি নিশ্চিত করা\n• পর্যাপ্ত মাংসলতা অর্জন করা",
        "📌 ২০ সপ্তাহের দিকেঃ\n২০ সপ্তাহ বয়সের দিকে পেটের চর্বি (abdominal fat) সঞ্চয় শুরু হওয়া উচিত, যা বডি ওয়েটের উপর সরাসরি নির্ভরশীল নয়। এটি ভবিষ্যৎ ডিম উৎপাদনের জন্য গুরুত্বপূর্ণ শক্তির সঞ্চয় হিসেবে কাজ করে।"
      ],
      keyPointsEn: [
        "1. Phase 1 (0-8 wks): Frame size & uniformity establishment",
        "2. Phase 2 (8-12 wks): Controlled feeding to avoid overweight/over-fleshing",
        "3. Phase 3 (12-16 wks): Puberty onset & gradual fleshing increase",
        "4. Phase 4 (16-20 wks): Accelerated growth for sexual maturity & fat deposit"
      ],
      keyPointsBn: [
        "১. ১ম ধাপ (০-৮ সপ্তাহ): ফ্রেম সাইজ ও ইউনিফরমিটি নির্ধারণ",
        "২. ২য় ধাপ (৮-১২ সপ্তাহ): অতিরিক্ত মোটা/মাংসল রোধে নিয়ন্ত্রিত ফিডিং",
        "৩. ৩য় ধাপ (১২-১৬ সপ্তাহ): বয়ঃসন্ধিকাল শুরু ও শারীরিক কন্ডিশন বৃদ্ধি",
        "৪. ৪র্থ ধাপ (১৬-২০ সপ্তাহ): দ্রুত বৃদ্ধি, যৌন পরিপক্বতা & ২০ সপ্তাহে পেটের চর্বি"
      ],
    ),

    // 15. Pre-Placement Preparation during Brooding
    BroilerPSArticleItem(
      id: "pre_placement_preparation",
      titleEn: "Pre-Placement Preparation during Brooding.",
      titleBn: "ব্রুডিংয়ে প্রি-প্লেসমেন্ট প্রস্তুতি",
      subtitleBn: "ব্রুডিং চলাকালীন প্রি-প্লেসমেন্ট প্রস্তুতি",
      subtitleEn: "Advance Planning, Litter, Water Line & Chick Comfort Zone Setup",
      snippetBn: "1️⃣ আগাম পরিকল্পনা ও হাউস প্রস্তুতিঃ বাচ্চা আসার আগেই ঘর সম্পূর্ণ জীবাণুমুক্ত...",
      snippetEn: "1️⃣ Advance Planning: Shed washing, disinfection & chick comfort zone setup...",
      imagePath: "assets/ps_broiler.jpg",
      detailsEn: [
        "Advance Planning & House Preparation:\nThe key to successful rearing is implementing effective management before chicks arrive. The house must be thoroughly cleaned, disease-free, and biosecure prior to placement.",
        "Litter Management:\nSpread high-quality litter 3-4 inches (7.5-10 cm) thick evenly across the floor to prevent heat loss through the ground.\n• Litter must be spread uniformly.\n• Uneven floor temperature causes chick huddling.\n• Uneven litter obstructs chick movement.\n• Uneven feeder/drinker heights impair feed and water intake.",
        "Water Line Preparation:\n• Clean and sanitize water lines completely prior to chick placement.\n• Flush water lines thoroughly.\n• Adjust water pressure specifically for day-old chicks rather than reusing old flock pressure settings.",
        "Stocking Density:\nConsider local climate and equipment type when determining stocking density.\n• Provide male chicks with more floor space than female chicks.\n• This enables males to reach target body weights effectively.",
        "Preparing the Chick Comfort Zone:\nPre-placement is the ideal time to establish a 'Chick Comfort Zone' around the brooder where heat, feed, and water are all immediately accessible without choice trade-offs. Proper equipment placement is vital to achieve this."
      ],
      detailsBn: [
        "আগাম পরিকল্পনা ও হাউস প্রস্তুতিঃ\nসফল রিয়ারিংয়ের মূল চাবিকাঠি হলো বাচ্চা ফার্মে আসার আগেই কার্যকর ব্যবস্থাপনা শুরু করা। বাচ্চা প্লেস করার আগে হাউস সম্পূর্ণ পরিষ্কার, রোগমুক্ত এবং বায়োসিকিউর থাকতে হবে।",
        "লিটার ব্যবস্থাপনাঃ\nপুরো ফ্লোরে ৩–৪ ইঞ্চি (৭.৫–১০ সেমি) পুরু ভালো মানের লিটার বিছাতে হবে, যাতে মেঝে দিয়ে তাপ বের হয়ে না যায়।\n\n• লিটার সমানভাবে পুরো হাউসে ছড়িয়ে দিতে হবে।\n• অসম তাপমাত্রা হলে বাচ্চারা নির্দিষ্ট স্থানে জড়ো হয়ে যেতে পারে (huddling)।\n• অসম লিটার বাচ্চার চলাচলে বাধা সৃষ্টি করে।\n• ফিড ও পানির লাইনের উচ্চতা অসম হলে বাচ্চা ঠিকমতো খাবার ও পানি পায় না।",
        "পানির লাইন প্রস্তুতিঃ\n• প্লেসমেন্টের আগে পানির লাইন সম্পূর্ণ পরিষ্কার ও জীবাণুমুক্ত করতে হবে।\n• ভালোভাবে ফ্লাশ করতে হবে।\n• পানির প্রেসার আগের ফ্লক অনুযায়ী না রেখে বাচ্চার উপযোগী করে সমন্বয় করতে হবে।",
        "স্টকিং ডেনসিটিঃ\nস্টকিং ডেনসিটি নির্ধারণের সময় স্থানীয় আবহাওয়া ও ব্যবহৃত যন্ত্রপাতির ধরন বিবেচনায় নিতে হবে।\n\n• পুরুষ বাচ্চাকে স্ত্রী বাচ্চার তুলনায় বেশি ফ্লোর স্পেস দিতে হবে।\n• এতে তারা লক্ষ্যমাত্রা অনুযায়ী বডি ওয়েট অর্জন করতে পারবে।",
        "“Chick Comfort Zone” প্রস্তুত করাঃ\nপ্রি-প্লেসমেন্ট সময় হলো “Chick Comfort Zone” তৈরির আদর্শ সময়। এটি ব্রুডারের চারপাশের সেই এলাকা, যেখানে বাচ্চাকে তাপ, খাবার বা পানির মধ্যে কোনো একটি বেছে নিতে হয় না—সবকিছু সহজলভ্য থাকে। এই লক্ষ্য অর্জনের জন্য সঠিক যন্ত্রপাতি স্থাপন (Equipment Placement) অত্যন্ত গুরুত্বপূর্ণ।"
      ],
      keyPointsEn: [
        "1. Advance Planning & Shed Sanitation",
        "2. 3-4 Inch Uniform Litter Setup",
        "3. Water Line Sanitation & Pressure Tuning",
        "4. Male Floor Space & Chick Comfort Zone Setup"
      ],
      keyPointsBn: [
        "১. আগাম পরিকল্পনা ও হাউস প্রস্তুতি",
        "২. ৩-৪ ইঞ্চি লিটার ব্যবস্থাপনা ও সমতা",
        "৩. পানির লাইন ফ্লাশিং ও প্রেসার সমন্বয়",
        "৪. মেল বাচ্চার বাড়তি ফ্লোর স্পেস & Chick Comfort Zone"
      ],
    ),

    // 15. Brooding Space Requirements (0-4 wk)
    BroilerPSArticleItem(
      id: "brooding_space_requirements",
      titleEn: "Brooding Space Requirements (0-4 wk).",
      titleBn: "ব্রুডিং স্পেসের প্রয়োজনীয়তা (০-৪ সপ্তাহ)",
      subtitleBn: "Brooding Space Requirements (০–৪ সপ্তাহ) (ব্রুডিং স্পেসের প্রয়োজনীয়তা)",
      subtitleEn: "Floor Space, Feeder Space, Drinker Space & Supplemental Tray Management",
      snippetBn: "1️⃣ ফ্লোর স্পেস (Floor Space)ঃ ০ দিনে ০.২০-০.২৫ বর্গফুট থেকে বাড়িয়ে ৪ সপ্তাহে ১ বর্গফুট...",
      snippetEn: "1️⃣ Floor Space: 0.20-0.25 sq ft at Day 0, expanding to 1.0 sq ft by 4 weeks...",
      imagePath: "assets/ps_broiler.jpg",
      detailsEn: [
        "Floor Space Requirements:\n• Day 0: Provide 0.20 - 0.25 sq ft per female or male chick. Gradually expand space to reach 1.0 sq ft per bird by 4 weeks of age.",
        "Feeder Space Requirements:\nChain Feeder:\n• Female chicks = 2 inches per chick\n• Male chicks = 3 inches per chick\n\nPan Feeder:\n• 20 female chicks per pan\n• 18 male chicks per pan",
        "Water Space Requirements:\nNipple Drinker:\n• 10-12 female chicks per nipple\n• 10 male chicks per nipple\n\nBell Drinker:\n• 80-100 female chicks per drinker\n• 80 male chicks per drinker",
        "Supplemental Feeder Trays:\n• Provide 1 tray per 50 chicks.\n• Use supplemental feeder trays for the first 7-10 days post-placement.",
        "Tray Management & Chick Activity:\n• After the first 2-3 days, gradually move supplemental trays closer to the automated feeding system before complete removal.\n• Slowly remove trays over a few days.\n• Gently walk chicks 2-3 times daily for the first few days to encourage feed and water consumption.\n\n⚠️ Flocks that fail to adapt quickly to feed and water run a high risk of elevated early mortality."
      ],
      detailsBn: [
        "ফ্লোর স্পেস (Floor Space)ঃ\n• ০দিনে প্রতি মেয়ে বা পুরুষ বাচ্চার জন্য ০.২০ - ০.২৫ বর্গফুট জায়গা দিতে হবে। প্রয়োজন অনুযায়ী জায়গা বাড়িয়ে ৪ সপ্তাহের মধ্যে ১ বর্গফুট (1 sft) জায়গা দিতে হবে।",
        "ফিডার স্পেস (Feeder Space)ঃ\nচেইন ফিডার (Chain Feeder)ঃ\n• মেয়ে বাচ্চা = প্রতি বাচ্চা ২ ইঞ্চি\n• পুরুষ বাচ্চা = প্রতি বাচ্চা ৩ ইঞ্চি\n\nপ্যান ফিডার (Pan Feeder)ঃ\n• প্রতি প্যানে ২০টি মেয়ে বাচ্চা\n• প্রতি প্যানে ১৮টি পুরুষ বাচ্চা",
        "পানির ব্যবস্থা (Water Space)ঃ\nনিপল ড্রিংকার (Nipple)ঃ\n• প্রতি নিপলে ১০–১২টি মেয়ে বাচ্চা\n• প্রতি নিপলে ১০টি পুরুষ বাচ্চা\n\nবেল ড্রিংকার (Bell Drinker)ঃ\n• প্রতি ড্রিংকারে ৮০–১০০টি মেয়ে বাচ্চা\n• প্রতি ড্রিংকারে ৮০টি পুরুষ বাচ্চা",
        "অতিরিক্ত ফিডার ট্রে (Supplemental Feeder Trays)ঃ\n• প্রতি ৫০টি বাচ্চার জন্য ১টি ট্রে দিতে হবে।\n• প্রথম ৭–১০ দিন পর্যন্ত অতিরিক্ত ট্রে ব্যবহার করা উচিত।",
        "ট্রে ব্যবস্থাপনা ও বাচ্চা সক্রিয় রাখাঃ\n• প্রথম ২–৩ দিনের পর ট্রেগুলো ধীরে ধীরে অটোমেটেড ফিডিং সিস্টেমের কাছাকাছি সরাতে হবে।\n• কয়েক দিনের মধ্যে ধীরে ধীরে ট্রে সরিয়ে ফেলতে হবে।\n• প্লেসমেন্টের পর প্রথম কয়েকদিন দিনে ২–৩ বার হালকাভাবে বাচ্চাদের হাঁটানো ভালো ব্যবস্থাপনার অংশ, যা তাদের খাবার ও পানি গ্রহণে উৎসাহিত করে।\n\n⚠️ যে ফ্লক দ্রুত খাবার ও পানিতে অভ্যস্ত হতে পারে না, তাদের প্রাথমিক মৃত্যুহার বেশি হওয়ার ঝুঁকি থাকে।"
      ],
      keyPointsEn: [
        "1. Floor Space: 0.20-0.25 sqft (Day 0) -> 1.0 sqft (4 Wks)",
        "2. Feeder Space: Chain (2-3 in) & Pan (18-20 birds/pan)",
        "3. Drinker Space: Nipple (10-12 birds) & Bell (80-100 birds)",
        "4. Supplemental Trays: 1 Tray per 50 chicks"
      ],
      keyPointsBn: [
        "১. ফ্লোর স্পেস: ০.২০-০.২৫ সফ্ট (০ দিন) -> ১.০ সফ্ট (৪ সপ্তাহ)",
        "২. ফিডার স্পেস: চেইন (২-৩ ইঞ্চ) & প্যান (১৮-২০টি/প্যান)",
        "৩. পানির ব্যবস্থা: নিপল (১০-১২টি) & বেল (৮০-১০০টি)",
        "৪. ট্রে ব্যবস্থাপনা & ১ ট্রে প্রতি ৫০ বাচ্চা"
      ],
    ),

    // 16. Crop Check of Chicks after Placement
    BroilerPSArticleItem(
      id: "crop_check_chicks",
      titleEn: "Crop Check of Chicks after Placement.",
      titleBn: "বাচ্চার ক্রপ চেক নির্দেশিকা",
      subtitleBn: "বাচ্চার ক্রপ চেক (Crop Check of Chicks)",
      subtitleEn: "Placement Timing, Crop Feel Diagnostics & Feed/Water Consumption Verification",
      snippetBn: "1️⃣ একই দিনে হ্যাচ হলে পরদিন সকালে ক্রপ চেক করুন; ৯৫% বাচ্চার ক্রপ নরম ও নমনীয়...",
      snippetEn: "1️⃣ Same Day Hatch: Check next morning; 95% chicks should have soft, pliable crops...",
      imagePath: "assets/ps_broiler.jpg",
      detailsEn: [
        "Placement on Hatch Day:\nIf chicks are placed on the farm on the exact day of hatch, conduct the crop check the following morning. The purpose of this crop check is to verify that chicks have successfully located feed and water.",
        "Placement the Day After Hatch:\nIf chicks are placed the day after hatch, perform the crop check 8 hours post-placement.\n• At least 95% of chicks sampled should have soft and pliable crops, indicating successful feed and water consumption.",
        "Hard Crop Diagnosis:\nIf the crop feels hard, the chick has not consumed adequate water. Immediately inspect water supply, line pressure, and drinker accessibility.",
        "Swollen / Distended Crop Diagnosis:\nIf the crop feels swollen and distended, the chick has ingested water but insufficient feed. Promptly evaluate feed availability, distribution, and texture consistency."
      ],
      detailsBn: [
        "একই দিনে হ্যাচ হলেঃ\nযদি বাচ্চা ফোটার দিনেই ফার্মে প্লেস করা হয়, তাহলে পরদিন সকালে তাদের ক্রপ (পাকস্থলীর থলি) পরীক্ষা করতে হবে। এই “Crop Check” করার উদ্দেশ্য হলো নিশ্চিত হওয়া যে বাচ্চারা খাবার ও পানি খুঁজে পেয়েছে।",
        "পরের দিন প্লেসমেন্ট হলেঃ\nযদি হ্যাচের পরের দিন বাচ্চা প্লেস করা হয়, তাহলে প্লেসমেন্টের ৮ ঘণ্টা পর ক্রপ চেক করতে হবে।\n\nএই সময়ে কমপক্ষে ৯৫% বাচ্চার ক্রপ নরম ও নমনীয় (soft and pliable) অনুভূত হওয়া উচিত, যা নির্দেশ করে তারা সফলভাবে খাবার ও পানি গ্রহণ করেছে।",
        "শক্ত (Hard) ক্রপঃ\nযদি ক্রপ শক্ত লাগে, তাহলে বুঝতে হবে বাচ্চা পর্যাপ্ত পানি পায়নি। এই ক্ষেত্রে সাথে সাথে পানির সরবরাহ ও প্রাপ্যতা পরীক্ষা করতে হবে।",
        "ফুলে থাকা (Swollen / Distended) ক্রপঃ\nযদি ক্রপ ফুলে ও টানটান থাকে, তাহলে বুঝতে হবে বাচ্চা পানি পেয়েছে কিন্তু পর্যাপ্ত খাবার পায়নি। এই অবস্থায় ফিডের প্রাপ্যতা ও গুণগত মান (consistency) দ্রুত পরীক্ষা করা প্রয়োজন।"
      ],
      keyPointsEn: [
        "1. Same Day Hatch: Check crop next morning",
        "2. Next Day Placement: Check 8 hrs post-placement (95% target)",
        "3. Hard Crop: Lack of water (Inspect water lines)",
        "4. Swollen Crop: Lack of feed (Inspect feed availability)"
      ],
      keyPointsBn: [
        "১. একই দিনে হ্যাচ: পরদিন সকালে ক্রপ চেক",
        "২. পরের দিন প্লেসমেন্ট: ৮ ঘন্টা পর চেক (লক্ষ্য ৯৫% নরম ক্রপ)",
        "৩. শক্ত ক্রপ: পানির ঘাটতি (পানির লাইন রি-চেক করুন)",
        "৪. ফুলে থাকা ক্রপ: ফিডের ঘাটতি (ফিড লাইন রি-চেক করুন)"
      ],
    ),

    // 17. Uniformity of Broiler Breeder
    BroilerPSArticleItem(
      id: "uniformity_broiler_breeder",
      titleEn: "Uniformity of Broiler Breeder.",
      titleBn: "ব্রয়লার ব্রিডারের ইউনিফরমিটি",
      subtitleBn: "ইউনিফর্ম প্যারент ব্রিডার ফ্লকের গুরুত্ব",
      subtitleEn: "Flock Weight Consistency & 18 Key Causes of Uniformity Loss",
      snippetBn: "1️⃣ ইউনিফর্ম ফ্লকের সুবিধা, ১৮টি মূল কারণ (ফরমালডিহাইড, অসমান ফিড, <৩০ মিনিট ক্লিনআপ)...",
      snippetEn: "1️⃣ Uniformity benefits & 18 key causes of uneven body weights in breeder flocks...",
      imagePath: "assets/ps_broiler.jpg",
      detailsEn: [
        "Importance of Uniform Parent Breeder Flock:\nA highly uniform breeder flock is far easier to manage and produces significantly more chicks per hen housed compared to an uneven flock.\nAchieving superior uniformity requires meticulous attention to management details.",
        "⚠️ Common Causes of Uniformity Problems (1-6):\n• 1️⃣ Formaldehyde Gas Residual: Presence during chick placement stunts early growth and uniformity.\n• 2️⃣ Mixing Donor Flock Ages: Mixing Day-Old Chicks from different breeder parent ages reduces flock uniformity.\n• 3️⃣ Beak Conditioning Defect: Poor beak trimming/treatment impairs feeding ability.\n• 4️⃣ Extreme Temperatures: Severe heat or cold stress disrupts growth rates.\n• 5️⃣ Uneven Feed Distribution: Slow or patchy feed delivery causes weight variance.\n• 6️⃣ Incorrect Feed Volume: Overfeeding or underfeeding degrades flock uniformity.",
        "⚠️ Common Causes of Uniformity Problems (7-12):\n• 7️⃣ Incorrect Feed Specs: Sub-optimal nutrition profile leads to uneven development.\n• 8️⃣ Pellet Size Variation: Fine dust or irregular pellet size creates feeding preference.\n• 9️⃣ Overstocking Density: High bird density escalates feed competition.\n• 🔟 Inadequate Water Supply: Water restriction curtails feed intake.\n• 1️⃣1️⃣ Energy Imbalance: Excessive or deficient dietary energy distorts growth.\n• 1️⃣2️⃣ Insufficient Feeding Light: Low light intensity impairs feeding visibility.",
        "⚠️ Common Causes of Uniformity Problems (13-18):\n• 13 Incorrect Feeder Height: Feeders set too high or low block equal feed access.\n• 14 Irregular Feeding Schedule: Inconsistent feeding times induce weight variations.\n• 15 Pen Drift & Count Errors: Incorrect bird count per pen destabilizes uniformity.\n• 16 Disease & Parasites: Sub-clinical disease leaves affected birds lagging.\n• 17 Rapid Feed Cleanup (<30 min): Feed consumed in under 30 minutes starves shy/timid birds.\n• 18 Insufficient Feeder Space: Inadequate linear space per bird creates weight gaps.",
        "👉 Ensuring high flock uniformity requires strict control over feed, water, temperature, lighting, and daily husbandry protocols."
      ],
      detailsBn: [
        "📌 ইউনিফর্ম প্যারেন্ট ব্রিডার ফ্লকের গুরুত্বঃ\nএকটি ইউনিফর্ম (সমান ওজনের) প্যারেন্ট ব্রিডার ফ্লক পরিচালনা করা সহজ এবং এটি প্রতিটি হাউসড মুরগি থেকে বেশি বাচ্চা উৎপাদন করে, তুলনামূলকভাবে অসম (uneven) ফ্লকের চেয়ে।\n\nভালো ইউনিফরমিটি আসে সূক্ষ্ম বিষয়গুলোর প্রতি সতর্ক নজর দেওয়ার মাধ্যমে।",
        "⚠️ বডি ওয়েট ইউনিফরমিটি সমস্যার সাধারণ কারণসমূহ (১-৬)ঃ\n• 1️⃣ ফরমালডিহাইড গ্যাসের উপস্থিতি: চিক প্লেসমেন্টের সময় ফরমালডিহাইড গ্যাস থাকলে বৃদ্ধি ও ইউনিফরমিটি ব্যাহত হতে পারে।\n• 2️⃣ বিভিন্ন বয়সের প্যারেন্ট সোর্স মিশ্রণ: ডে-ওল্ড অবস্থায় বিভিন্ন বয়সের প্যারেন্ট স্টক মিশ্রণ করলে ইউনিফরমিটি কমে যায়।\n• 3️⃣ বীক কন্ডিশনিং ত্রুটি: বীক ট্রিমিং বা কন্ডিশনিং সঠিক মান অনুযায়ী না করলে খাওয়ার সক্ষমতা কমে যায়।\n• 4️⃣ চরম তাপমাত্রা: অত্যধিক গরম বা ঠান্ডা বৃদ্ধি ব্যাহত করে।\n• 5️⃣ অসম ফিড বিতরণ: হাউস জুড়ে ফিড সমানভাবে না পৌঁছালে ওজনের তারতম্য হয়।\n• 6️⃣ ভুল ফিড পরিমাণ: অতিরিক্ত বা কম ফিড প্রদান করলে ইউনিফরমিটি নষ্ট হয়।",
        "⚠️ বডি ওয়েট ইউনিফরমিটি সমস্যার সাধারণ কারণসমূহ (৭-১২)ঃ\n• 7️⃣ ভুল ফিড স্পেসিফিকেশন: ফিডের পুষ্টিমান সঠিক না হলে বৃদ্ধি অসম হয়।\n• 8️⃣ পিলেট সাইজ সমস্যা: পিলেট খুব বড়, ছোট বা অসমান হলে খাওয়ার অসামঞ্জস্য দেখা দেয়।\n• 9️⃣ অতিরিক্ত স্টকিং (Overstocking): অতিরিক্ত মুরগী রাখলে প্রতিযোগিতা বাড়ে ও ইউনিফরমিটি কমে।\n• 🔟 অপর্যাপ্ত পানির সরবরাহ: যথেষ্ট পানি না থাকলে ফিড গ্রহণ কমে যায়।\n• 1️⃣1️⃣ খুব বেশি বা খুব কম এনার্জি ফিড: অতিরিক্ত বা কম এনার্জি বৃদ্ধি ব্যাহত করে।\n• 1️⃣2️⃣ খাওয়ার সময় পর্যাপ্ত আলো না থাকা: আলো কম থাকলে পাখি ঠিকমতো ফিড খেতে পারে না।",
        "⚠️ বডি ওয়েট ইউনিফরমিটি সমস্যার সাধারণ কারণসমূহ (১৩-১৮)ঃ\n• 1️⃣3️⃣ ভুল ফিডার উচ্চতা: ফিডার বেশি উঁচু বা নিচু হলে সব পাখি সমানভাবে খেতে পারে না।\n• 1️⃣4️⃣ অনিয়মিত ফিডিং সময়: প্রতিদিন নির্দিষ্ট সময়ে ফিড না দিলে ওজনের তারতম্য হয়।\n• 1️⃣5️⃣ ভুল মুরগির সংখ্যা বা পেন ড্রিফট: পেনে সঠিক সংখ্যক পাখি না থাকলে ইউনিফরমিটি কমে।\n• 1️⃣6️⃣ রোগ বা পরজীবী সংক্রমণ: রোগ হলে কিছু মুরগী পিছিয়ে পড়ে।\n• 1️⃣7️⃣ খুব দ্রুত ফিড শেষ হওয়া: ৩০ মিনিটের কম সময়ে ফিড শেষ হয়ে গেলে দুর্বল মুরগী ফিড পায় না।\n• 1️⃣8️⃣ অপর্যাপ্ত ফিডিং স্পেস: প্রতিটি মুরগির জন্য পর্যাপ্ত খাওয়ার জায়গা না থাকলে ওজন সমান থাকে না।",
        "👉 ভালো ইউনিফরমিটি নিশ্চিত করতে হলে ফিড, পানি, তাপমাত্রা, আলো এবং ব্যবস্থাপনার প্রতিটি ধাপে সূক্ষ্মভাবে নজর দিতে হবে।"
      ],
      keyPointsEn: [
        "1. Advantage: Uniform flocks produce significantly more chicks per hen",
        "2. Feeding Rule: Feed cleanup time >30 min & adequate linear space",
        "3. Risks: Formaldehyde, mixed source ages, beak defects & extremes",
        "4. Solution: Meticulous control of feed, water, temp & pen counts"
      ],
      keyPointsBn: [
        "১. সুফল: ইউনিফর্ম ফ্লক থেকে প্রতি মুরগিতে বেশি বাচ্চা পাওয়া যায়",
        "২. ফিডিং রুল: ক্লিনআপ টাইম > ৩০ মিনিট & পর্যাপ্ত ফিডিং স্পেস",
        "৩. ঝুঁকি: ফরমালডিহাইড, বীক ট্রিমিং ত্রুটি, মিক্সড সোর্স & চরম তাপমাত্রা",
        "৪. ব্যবস্থাপনা: ফিড, পানি, আলো, সঠিক স্থান & রোগ নিয়ন্ত্রণ"
      ],
    ),

    // 18. Timing of Grading
    BroilerPSArticleItem(
      id: "timing_of_grading",
      titleEn: "Timing of Grading.",
      titleBn: "গ্রেডিংয়ের সময়সূচি",
      subtitleBn: "গ্রেডিংয়ের সময়সূচি (Timing of Grading)",
      subtitleEn: "Primary Grading Schedule, Single Grading Strategy & Limited Grading Rules",
      snippetBn: "1️⃣ প্রাথমিক গ্রেডিং ৭–১০ দিনে (এরপর ৪, ৮ & ১৬ সপ্তাহে), ১ বার সম্ভব হলে ২৩–২৮ দিন...",
      snippetEn: "1️⃣ Primary grading at 7-10 days (then 4, 8 & 16 weeks), single grading option at 23-28 days...",
      imagePath: "assets/ps_broiler.jpg",
      detailsEn: [
        "Primary Grading Schedule:\n• Performing initial grading at 7–10 days of age achieves early flock uniformity.\n• Subsequent grading can be performed at 4, 8, and 16 weeks of age.",
        "Single Grading Strategy:\n• If only 1 grading session is feasible, the optimal window is 23–28 days of age.\n• Segregate the lightest 20–25% of birds into a separate pen.\n• Provide custom feed allocation according to their specific weight requirement so they rapidly reach target body weight.",
        "Managing Flocks with Limited Grading:\nIn regions or setups where multiple gradings are not practical, maintaining flawless basic management is crucial.\n\nKey Management Essentials:\n• Adequate feeder space\n• Rapid feed distribution in minimal time (especially in low light/darkness)\n• Uniform bird distribution across the entire house\n• Adequate drinking water supply\n• Correct water line pressure\n\n👉 Timely grading and solid basic management significantly enhance flock uniformity."
      ],
      detailsBn: [
        "1️⃣ প্রাথমিক গ্রেডিংঃ\n• প্রথম গ্রেডিং ৭–১০ দিন বয়সে করলে শুরুতেই ভালো ফ্লক ইউনিফরমিটি অর্জন করা যায়।\n• এরপর আবার ৪, ৮ এবং ১৬ সপ্তাহে গ্রেডিং করা যেতে পারে।",
        "2️⃣ যদি মাত্র ১ বার গ্রেডিং করা সম্ভব হয়ঃ\n• সবচেয়ে উপযুক্ত সময় হলো ২৩–২৮ দিন বয়সে।\n• সবচেয়ে হালকা ওজনের ২০–২৫% মুরগী আলাদা করে একটি পৃথক পেনে রাখতে হবে।\n• সেখানে তাদের প্রয়োজন অনুযায়ী ফিড দেওয়া হবে, যাতে তারা দ্রুত লক্ষ্যমাত্রা ওজনে পৌঁছাতে পারে।",
        "3️⃣ যেখানে কম গ্রেডিং করা সম্ভবঃ\nযেসব এলাকায় বা ব্যবস্থায় একাধিক গ্রেডিং করা যায় না, সেখানে মৌলিক ব্যবস্থাপনা সঠিক রাখা অত্যন্ত গুরুত্বপূর্ণ।\n\nবিশেষভাবে নিশ্চিত করতে হবে—\n• পর্যাপ্ত ফিডার স্পেস\n• অল্প সময়ে দ্রুত ফিড বিতরণ (বিশেষত অন্ধকারে)\n• পুরো হাউসে মুরগির সুষম বণ্টন\n• পর্যাপ্ত পানির সরবরাহ\n• সঠিক পানির চাপ (Water Pressure)\n\n👉 সঠিক সময়ে গ্রেডিং এবং ভালো মৌলিক ব্যবস্থাপনা নিশ্চিত করলে ফ্লকের ইউনিফরমিটি উল্লেখযোগ্যভাবে উন্নত হয়।"
      ],
      keyPointsEn: [
        "1. Initial Grading: Age 7-10 days (Then at 4, 8 & 16 weeks)",
        "2. Single Grading Option: Age 23-28 days (Separate light 20-25% birds)",
        "3. Light Pen Strategy: Tailored feeding to achieve target weight faster",
        "4. Limited Grading Rules: Max feeder space, fast feed & proper water pressure"
      ],
      keyPointsBn: [
        "১. প্রাথমিক গ্রেডিং: ৭-১০ দিন বয়সে (এরপর ৪, ৮ & ১৬ সপ্তাহে)",
        "২. ১ বার গ্রেডিং হলে: ২৩-২৮ দিন বয়সে উপযুক্ত সময়",
        "৩. হালকা পাখি আলাদা: হালকা ২০-২৫% পাখি লাইট পেনে রাখা",
        "৪. কম গ্রেডিং বিকল্প: পর্যাপ্ত ফিডার স্পেস, দ্রুত ফিড, সুষম বণ্টন ও পানির চাপ"
      ],
    ),

    // 19. Troubleshooting Body Weight Control
    BroilerPSArticleItem(
      id: "troubleshooting_body_weight",
      titleEn: "Troubleshooting Body Weight Control.",
      titleBn: "বডি ওয়েট নিয়ন্ত্রণে সমস্যা সমাধান",
      subtitleBn: "বডি ওয়েট নিয়ন্ত্রণে সমস্যা সমাধান (Troubleshooting Body Weight Control)",
      subtitleEn: "Age-Wise Corrective Target Realignment Curves (5, 10, 15 & 20 Weeks)",
      snippetBn: "A️⃣ ৫ সপ্তাহ, B️⃣ ১০ সপ্তাহ, C️⃣ ১৫ সপ্তাহ ও D️⃣ ২০ সপ্তাহে টার্গেটের বাইরে ওজনের সমাধান...",
      snippetEn: "A️⃣ 5-Week, B️⃣ 10-Week, C️⃣ 15-Week & D️⃣ 20-Week corrective target weight curves...",
      imagePath: "assets/ps_broiler.jpg",
      detailsEn: [
        "Troubleshooting Body Weight Control Principle:\nWhen a flock strays from target body weight, corrective actions must focus on long-term flock goals rather than quick fixes.\n\nKey Objectives During Realignment:\n👉 Ensure female pullets gain appropriate body condition and weight\n👉 Guarantee proper onset of sexual maturity at target age",
        "A️⃣ Weight Deviation at 5 Weeks of Age:\n1️⃣ Underweight by ≤100 g: Set a revised target curve to gradually realign with standard weight by 63 days (9 weeks).\n2️⃣ Underweight by >100 g: Redraw target curve to catch up with standard weight by 84 days (12 weeks).\n3️⃣ Overweight by ≤100 g: Adjust target curve to bring flock back to standard by 49 days (7 weeks).\n4️⃣ Overweight by >100 g: Redraw target curve to gradually return to standard by 70 days (10 weeks).",
        "B️⃣ Weight Deviation at 10 Weeks of Age:\n1️⃣ Underweight by 100 g: Set a revised target curve to reach standard weight by 133 days (19 weeks).\n2️⃣ Overweight by 100 g: Draw a new target curve parallel to standard up to 21 weeks, then return to standard target by 25 weeks.",
        "C️⃣ Weight Deviation at 15 Weeks of Age:\n1️⃣ Underweight by 100 g: Set a new target curve to reach standard weight by 133–140 days (19–20 weeks).\n2️⃣ Overweight by 100 g: Follow a target curve parallel to standard up to 22 weeks, returning to standard by 26 weeks.",
        "D️⃣ Weight Deviation at 20 Weeks of Age:\n1️⃣ Underweight by 100 g:\n• Delay light stimulation by 1 week.\n• Follow a parallel target curve until daily egg production reaches 5%.\n• As egg production rises, normal feed escalations will naturally restore body weight.\n\n2️⃣ Overweight by 100 g:\n• Follow a target curve parallel to standard throughout the remaining period.\n\n👉 Always implement gradual feed adjustments rather than abrupt changes. The ultimate goal is sustaining body condition for maximum lifetime egg production."
      ],
      detailsBn: [
        "📌 বডি ওয়েট নিয়ন্ত্রণে সমস্যা সমাধানঃ\nকখনো কখনো ফ্লক নির্ধারিত বডি ওয়েট লক্ষ্যমাত্রায় থাকে না। এ ধরনের পরিস্থিতিতে যে সংশোধনমূলক ব্যবস্থা নেওয়া হবে, তা স্বল্পমেয়াদি নয় বরং দীর্ঘমেয়াদি লক্ষ্য বিবেচনায় নিতে হবে।\n\nসংশোধনের সময় নিশ্চিত করতে হবে—\n👉 স্ত্রী পাখি যেন প্রয়োজনীয় বডি কন্ডিশন ও ওজন বৃদ্ধি অর্জন করে\n👉 এবং যৌন পরিপক্বতায় (Sexual Maturity) সঠিকভাবে পৌঁছাতে পারে।",
        "A️⃣ ৫ সপ্তাহ বয়সে ওজন লক্ষ্যমাত্রার বাইরেঃ\n1️⃣ ১০০ গ্রাম বা কম কম ওজনঃ নতুন টার্গেট বডি ওয়েট নির্ধারণ করে ধীরে ধীরে ৬৩ দিন (৯ সপ্তাহ) বয়সের মধ্যে স্ট্যান্ডার্ডে পৌঁছাতে হবে।\n2️⃣ ১০০ গ্রামের বেশি কম ওজনঃ নতুন টার্গেট নির্ধারণ করে ৮৪ দিন (১২ সপ্তাহ) বয়সের মধ্যে স্ট্যান্ডার্ড অর্জন করতে হবে।\n3️⃣ ১০০ গ্রাম বা কম বেশি ওজনঃ টার্গেট পুনর্নির্ধারণ করে ৪৯ দিন (৭ সপ্তাহ) বয়সের মধ্যে স্ট্যান্ডার্ডে ফিরিয়ে আনতে হবে।\n4️⃣ ১০০ গ্রামের বেশি বেশি ওজনঃ টার্গেট পুনর্নির্ধারণ করে ৭০ দিন (১০ সপ্তাহ) বয়সের মধ্যে স্ট্যান্ডার্ডে আনতে হবে।",
        "B️⃣ ১০ সপ্তাহ বয়সে ওজন লক্ষ্যমাত্রার বাইরেঃ\n1️⃣ ১০০ গ্রাম কম ওজনঃ নতুন টার্গেট নির্ধারণ করে ১৩৩ দিন (১৯ সপ্তাহ) বয়সের মধ্যে স্ট্যান্ডার্ড অর্জন করতে হবে।\n2️⃣ ১০০ গ্রাম বেশি ওজনঃ ২১ সপ্তাহ পর্যন্ত স্ট্যান্ডার্ড টার্গেটের সমান্তরালভাবে নতুন কার্ভ আঁকতে হবে। ২৫ সপ্তাহ বয়সের মধ্যে স্ট্যান্ডার্ডে ফিরতে হবে।",
        "C️⃣ ১৫ সপ্তাহ বয়সে ওজন লক্ষ্যমাত্রার বাইরেঃ\n1️⃣ ১০০ গ্রাম কম ওজনঃ নতুন টার্গেট নির্ধারণ করে ১৩৩–১৪০ দিন (১৯–২০ সপ্তাহ) বয়সের মধ্যে স্ট্যান্ডার্ড অর্জন করতে হবে।\n2️⃣ ১০০ গ্রাম বেশি ওজনঃ ২২ সপ্তাহ পর্যন্ত স্ট্যান্ডার্ডের সমান্তরাল কার্ভ অনুসরণ করতে হবে। ২৬ সপ্তাহের মধ্যে স্ট্যান্ডার্ডে ফিরতে হবে।",
        "D️⃣ ২০ সপ্তাহ বয়সে ওজন লক্ষ্যমাত্রার বাইরেঃ\n1️⃣ ১০০ গ্রাম কম ওজনঃ\n• লাইট স্টিমুলেশন ১ সপ্তাহ বিলম্ব করতে হবে।\n• ৫% দৈনিক উৎপাদন শুরু হওয়া পর্যন্ত স্ট্যান্ডার্ডের সমান্তরাল নতুন টার্গেট অনুসরণ করতে হবে।\n• এরপর উৎপাদন বৃদ্ধির সাথে সাথে ফিড বৃদ্ধি অনুযায়ী ওজন স্বাভাবিকভাবে বাড়বে।\n\n2️⃣ ১০০ গ্রাম বেশি ওজনঃ\n• পুরো সময়জুড়ে স্ট্যান্ডার্ড টার্গেটের সমান্তরাল কার্ভ অনুসরণ করতে হবে।\n\n👉 মনে রাখবেন, দ্রুত ও হঠাৎ পরিবর্তন না করে ধীরে ধীরে সমন্বয় করাই সঠিক পদ্ধতি। লক্ষ্য হওয়া উচিত—সঠিক বডি কন্ডিশন বজায় রেখে ভবিষ্যৎ উৎপাদন নিশ্চিত করা।"
      ],
      keyPointsEn: [
        "1. 5-Wk Deviation: Realign by 7-12 weeks depending on error severity",
        "2. 10-Wk Deviation: Underweight realigned at 19 wks; Overweight by 25 wks",
        "3. 15-Wk Deviation: Underweight realigned at 19-20 wks; Overweight by 26 wks",
        "4. 20-Wk Underweight: Delay light stimulation 1 week & track parallel target"
      ],
      keyPointsBn: [
        "১. ৫ সপ্তাহে বিচ্যুতি: ৭-১২ সপ্তাহের মধ্যে স্তরে ফিরিয়ে আনা",
        "২. ১০ সপ্তাহে বিচ্যুতি: কম ওজন ১৯ সপ্তাহে, বেশি ওজন ২৫ সপ্তাহে স্ট্যান্ডার্ডে আনা",
        "৩. ১৫ সপ্তাহে বিচ্যুতি: কম ওজন ১৯-২০ সপ্তাহে, বেশি ওজন ২৬ সপ্তাহে সংশোধন",
        "৪. ২০ সপ্তাহে কম ওজন: লাইট স্টিমুলেশন ১ সপ্তাহ বিলম্ব করা & সমান্তরাল কার্ভ টানা"
      ],
    ),

    // 20. Consideration before Transfer a Flock
    BroilerPSArticleItem(
      id: "consideration_before_transfer",
      titleEn: "Consideration before Transfer a Flock.",
      titleBn: "ফ্লক স্থানান্তরের বিবেচ্য বিষয়সমূহ",
      subtitleBn: "ফ্লক স্থানান্তরের আগে বিবেচ্য বিষয়সমূহ (Consideration Before Transfer a Flock)",
      subtitleEn: "8 Pre-Transfer Guidelines for Moving Pullets from Rearing to Laying House",
      snippetBn: "1️⃣ ১ সপ্তাহ আগে প্রস্তুতি, পুরুষ স্থানান্তর ২-৩ দিন আগে, রাত/ভোরে স্থানান্তর...",
      snippetEn: "1️⃣ House ready 1 wk prior, males moved 2-3 days early, night/early morning transfer...",
      imagePath: "assets/ps_broiler.jpg",
      detailsEn: [
        "1️⃣ Laying House Readiness:\n• Laying house must be completely prepared at least 1 week prior to the scheduled transfer date.\n• Feeders, drinkers, and nest boxes must be fully operational.",
        "2️⃣ Adequate Clean Crates:\n• Provide sufficient sanitized transfer crates at the start of each day to move the flock smoothly.",
        "3️⃣ Male Transfer Schedule:\n• Final selection and transfer of male roosters must be completed 2-3 days before transferring female pullets.",
        "4️⃣ Female Health & Physical Culling:\n• Carefully inspect females before moving to the laying house.\n• Cull any birds displaying visible structural or physical defects.",
        "5️⃣ Transfer Timing:\n• Transfer birds during nighttime or early morning hours to minimize environmental and temperature stress.",
        "6️⃣ Unloading onto Slats:\n• When releasing birds from crates/cages, place them directly onto the slat area.",
        "7️⃣ Post-Transfer Crop & Behavior Monitoring:\n• Monitor birds closely post-transfer.\n• Perform crop checks to verify that birds have located feed and water lines.",
        "8️⃣ Encouraging Slat Usage & Step Height:\n• Walk through the house regularly to encourage birds to move onto the slats.\n• Ensure the step height from litter to slat level is approximately 45 cm (18 inches).\n\n👉 Careful planning and stress-free transfer facilitate rapid adaptation to the production phase."
      ],
      detailsBn: [
        "1️⃣ লেয়িং হাউস প্রস্তুত থাকাঃ\n• স্থানান্তরের নির্ধারিত তারিখের কমপক্ষে ১ সপ্তাহ আগে লেয়িং হাউস সম্পূর্ণ প্রস্তুত থাকতে হবে।\n• ফিডার, ড্রিংকার ও নেস্ট বক্স সম্পূর্ণ সচল থাকতে হবে।",
        "2️⃣ পর্যাপ্ত পরিষ্কার ক্রেটঃ\n• প্রতিদিনের শুরুতেই পুরো ফ্লক স্থানান্তরের জন্য পর্যাপ্ত পরিষ্কার ক্রেট থাকতে হবে।",
        "3️⃣ পুরুষ মুরগির স্থানান্তরঃ\n• পুরুষ মুরগির চূড়ান্ত বাছাই ও স্থানান্তর স্ত্রী পাখির ২–৩ দিন আগে সম্পন্ন করতে হবে।",
        "4️⃣ স্ত্রী পাখির স্বাস্থ্য পরীক্ষাঃ\n• লেয়িং হাউসে নেওয়ার আগে মুরগিকে ভালোভাবে পর্যবেক্ষণ করতে হবে।\n• যেসব মুরগির দৃশ্যমান ত্রুটি আছে, সেগুলো বাদ দিতে হবে।",
        "5️⃣ স্থানান্তরের সময়ঃ\n• রাতের বেলা অথবা ভোরে মুরগী স্থানান্তর করা উত্তম। এতে স্ট্রেস কম হয়।",
        "6️⃣ ক্রেট থেকে নামানোর পদ্ধতিঃ\n• ক্রেট বা খাঁচা থেকে মুরগি বের করার সময় সরাসরি স্ল্যাটের উপর রাখতে হবে।",
        "7️⃣ স্থানান্তরের পর পর্যবেক্ষণঃ\n• স্থানান্তরের পর মুরগিকে নিবিড়ভাবে পর্যবেক্ষণ করতে হবে।\n• ক্রপ স্পর্শ করে দেখতে হবে তারা খাবার ও পানি খুঁজে পেয়েছে কিনা।",
        "8️⃣ স্ল্যাট ব্যবহার উৎসাহিত করাঃ\n• নিয়মিত হাউসে হাঁটাহাঁটি করে মুরগিকে স্ল্যাট এলাকায় যেতে উৎসাহিত করতে হবে।\n• লিটার থেকে স্ল্যাটে ওঠার ধাপের উচ্চতা প্রায় ৪৫ সেমি (১৮ ইঞ্চি) হওয়া উচিত。\n\n👉 সঠিক পরিকল্পনা ও যত্নসহ স্থানান্তর করলে স্ট্রেস কমে এবং উৎপাদন পর্যায়ে দ্রুত মানিয়ে নেওয়া সম্ভব হয়।"
      ],
      keyPointsEn: [
        "1. House Readiness: Complete setup 1 week prior to transfer",
        "2. Male Transfer: 2-3 days before female pullets",
        "3. Timing & Unloading: Night/Early morning; place directly on slats",
        "4. Slat Step Height: ~45 cm (18 inches) with regular walking"
      ],
      keyPointsBn: [
        "১. ঘর প্রস্তুতি: স্থানান্তরের অন্তত ১ সপ্তাহ আগে প্রস্তুত রাখা",
        "২. পুরুষ স্থানান্তর: ফিমেল স্থানান্তরের ২-৩ দিন আগে সম্পন্ন করা",
        "৩. সময় & আনলোডিং: রাতে/ভোরে স্থানান্তরিত করে সরাসরি স্ল্যাটে রাখা",
        "৪. স্ল্যাটের উচ্চতা: লিটার থেকে স্ল্যাটের ধাপ ৪৫ সেমি (১৮ ইঞ্চি)"
      ],
    ),

    // 21. Housing and Equipment Requirement
    BroilerPSArticleItem(
      id: "housing_equipment_requirement",
      titleEn: "Housing and Equipment Requirement.",
      titleBn: "হাউজিং ও যন্ত্রপাতির প্রয়োজনীয়তা",
      subtitleBn: "হাউজিং ও যন্ত্রপাতির প্রয়োজনীয়তা (Housing and Equipment Requirement)",
      subtitleEn: "Ventilation Cycles, Feeding Cooling, Feeder/Drinker Density & Nesting Standards",
      snippetBn: "1️⃣ ভেন্টিলেশন চক্র (৮ মিনিটে ১ বার এয়ার এক্সচেঞ্জ), ফিডিংয়ে এক্সট্রা কুলিং, চেইন ফিডার ১৫ সেমি...",
      snippetEn: "1️⃣ Ventilation cycles (1 air exchange/8 min), feeding time cooling, chain feeder 15 cm...",
      imagePath: "assets/ps_broiler.jpg",
      detailsEn: [
        "1️⃣ Ventilation System Capacity & Cycling:\nVentilation must maintain optimum house temperature across varying weather conditions.\n\n• Cold Weather Operations:\n  - Minimum ventilation fans must complete 1 full air exchange at least every 8 minutes.\n  - Fan timer schedule: 1 minute ON every 5 minutes OR 2 minutes ON every 10 minutes.\n\n• Above Set-Point Temperature Operations:\n  - Engage maximum ventilation capacity.\n  - Ensure 1 full air exchange every 5 minutes until temperature drops back below set point.",
        "2️⃣ Additional Cooling During Feeding Time:\n• Hens produce extra metabolic heat while eating.\n• Supplementary cooling is necessary during feeding hours.\n• This enhances flock livability and preserves target feed intake.",
        "3️⃣ Feeder Space Standards (Feed Distribution < 3 min):\n• Chain Feeder = Minimum 15 cm (6 inches) per hen\n• Round Feeder Pan = 12 hens per pan\n• Oval Feeder Pan = 14 hens per pan",
        "4️⃣ Drinker Density & Nest Proximity:\n• Nipple drinkers are highly recommended for parent stock (8-10 hens per nipple).\n• Bell drinkers = 60-70 hens per bell drinker.\n• Install drinker lines close to the nesting area so hens easily transition to nests.",
        "5️⃣ Nesting System Allocation Ratios:\n• Manual Nest Box = 1 hole per 4 hens\n• Automatic Roll-Away Mechanical Nest = 1 hole per 5 hens\n\n👉 Harmonizing housing design, ventilation cycles, and equipment specs is essential for flock health, egg production, and hatchability."
      ],
      detailsBn: [
        "1️⃣ ভেন্টিলেশন সিস্টেমের সক্ষমতাঃ\nভেন্টিলেশন সিস্টেম এমন হতে হবে যাতে বিভিন্ন আবহাওয়ায় প্রয়োজনীয় তাপমাত্রা নিয়ন্ত্রণ করা যায়।\n\n• ঠান্ডা অঞ্চলেঃ\n  - ন্যূনতম ভেন্টিলেশন ফ্যান ক্ষমতা = প্রতি ৮ মিনিটে কমপক্ষে ১ বার সম্পূর্ণ এয়ার এক্সচেঞ্জ।\n  - এক্সহস্ট ফ্যান টাইমার: প্রতি ৫ মিনিটে ১ মিনিট অথবা প্রতি ১০ মিনিটে ২ মিনিট।\n\n• সেট পয়েন্টের বেশি তাপমাত্রাঃ\n  - সর্বোচ্চ ভেন্টিলেশন সিস্টেম চালু করতে হবে।\n  - প্রতি ৫ মিনিটে ১ বার সম্পূর্ণ এয়ার এক্সচেঞ্জ নিশ্চিত করতে হবে, তাপমাত্রা সেট পয়েন্টের নিচে না আসা পর্যন্ত।",
        "2️⃣ ফিডিং সময় অতিরিক্ত কুলিংঃ\n• খাবার গ্রহণের সময় মুরগী অতিরিক্ত মেটাবলিক (বিপাকীয়) তাপ উৎপন্ন করে।\n• তাই ফিডিং চলাকালীন সময়ে অতিরিক্ত কুলিং প্রয়োজন।\n• এতে মুরগির বেঁচে থাকার হার (Livability) ও ফিড গ্রহণ স্বাভাবিক থাকে।",
        "3️⃣ ফিডার স্পেস (ফিড বিতরণ < ৩ মিনিট)ঃ\n• চেইন ফিডার = প্রতি মুরগির জন্য ন্যূনতম ১৫ সেমি (৬ ইঞ্চি)\n• রাউন্ড প্যান = প্রতি প্যানে ১২টি মুরগী\n• ওভাল প্যান = প্রতি প্যানে ১৪টি মুরগী",
        "4️⃣ ড্রিংকার ব্যবস্থাঃ\n• প্যারেন্ট স্টকের জন্য নিপল ড্রিংকার বেশি উপযোগী (প্রতি নিপলে ৮–১০টি মুরগি)।\n• বেল ড্রিংকার ব্যবহার করলে প্রতি ড্রিংকারে ৬০–৭০টি মুরগি।\n• ড্রিংকার লাইন নেস্টিং সিস্টেমের কাছাকাছি স্থাপন করতে হবে, যাতে পাখি সহজে নেস্ট ব্যবহার করে।",
        "5️⃣ নেস্টিং সিস্টেমঃ\n• ম্যানুয়াল নেস্টিং সিস্টেমে প্রতি নেস্ট হোলে ৪টি মুরগির ব্যবস্থা রাখতে হবে।\n• মেকানিক্যাল রোল-অ্যাওয়ে নেস্টে প্রতি নেস্ট হোলে ৫টি মুরগির জায়গা দেওয়া যায়。\n\n👉 সঠিক হাউজিং, ভেন্টিলেশন ও যন্ত্রপাতির সমন্বয় প্যারেন্ট ব্রিডার ফ্লকের স্বাস্থ্য, ডিম উৎপাদন ও ফার্টিলিটি বজায় রাখতে অত্যন্ত গুরুত্বপূর্ণ।"
      ],
      keyPointsEn: [
        "1. Min Ventilation: 1 air exchange per 8 min (Timer 1min/5min or 2min/10min)",
        "2. Above Set Point: Maximum ventilation (1 exchange per 5 min)",
        "3. Feeder Space: Chain 15 cm (6 in), Round 12 hens/pan, Oval 14 hens/pan",
        "4. Drinker & Nest: Nipple 1:8-10, Bell 1:60-70; Manual Nest 1:4, Auto Nest 1:5"
      ],
      keyPointsBn: [
        "১. ন্যূনতম ভেন্টিলেশন: ৮ মিনিটে ১টি এয়ার এক্সচেঞ্জ (টাইমার ১মি/৫মি বা ২মি/১০মি)",
        "২. সেট পয়েন্টের উপরে: সর্বোচ্চ ভেন্টিলেশন (৫ মিনিটে ১টি এয়ার এক্সচেঞ্জ)",
        "৩. ফিডার স্পেস: চেইন ১৫ সেমি, রাউন্ড প্যান ১২টি/প্যান, ওভাল প্যান ১৪টি/প্যান",
        "৪. ড্রিংকার & নেস্ট: নিপল ১:৮-১০, বেল ১:৬০-৭০; ম্যানুয়াল নেস্ট ১:৪, অটো নেস্ট ১:৫"
      ],
    ),

    // 22. Female Feed Management from Light Stimulation to Peak
    BroilerPSArticleItem(
      id: "female_feed_light_to_peak",
      titleEn: "Female Feed Management from Light Stimulation to Peak ...",
      titleBn: "লাইট স্টিমুলেশন থেকে পিক পর্যন্ত স্ত্রী ফিড ব্যবস্থাপনা",
      subtitleBn: "লাইট স্টিমুলেশন থেকে পিক প্রোডাকশন পর্যন্ত স্ত্রী মুরগীর ফিড ব্যবস্থাপনা",
      subtitleEn: "Nutrient Partitioning, Weekly Feed Escalation (2-3g/wk) & Conservative Feeding Benefits",
      snippetBn: "1️⃣ পুষ্টির ৩ ভাগে বণ্টন (রক্ষণাবেক্ষণ, বৃদ্ধি, প্রজনন অঙ্গ), সাপ্তাহিক ২-৩ গ্রাম ফিড বৃদ্ধি...",
      snippetEn: "1️⃣ Nutrient partitioning (maintenance, growth, reproduction), 2-3g/wk feed escalation...",
      imagePath: "assets/ps_broiler.jpg",
      detailsEn: [
        "Nutrient Partitioning Post Light Stimulation:\nThe phase from Moment of Light Stimulation (MOL) to peak egg production is one of the most sensitive nutritional windows.\n\nFollowing light stimulation, hens allocate nutrients into 3 key areas:\n👉 Maintenance\n👉 Body growth\n👉 Reproductive organ development\n\nProper feed management ensures optimal balance across these three demands.",
        "1️⃣ Light Stimulation to Onset of Lay Feeding:\n• Feed allocation must strictly follow body weight progression.\n• If pullets are light-stimulated in correct physical condition, small weekly feed increases are sufficient.\n\n👉 Increase feed by 2-3 g/bird/week (or 0.44-0.66 lb/100 birds/week).",
        "2️⃣ Benefits of Conservative Feeding Program (Part 1):\n• Reduces percentage of double yolk eggs\n• Minimizes risk of 2-4% lower peak production problems\n• Decreases floor eggs (especially in community nest systems)\n• Lowers risk of Egg Peritonitis as birds enter peak production",
        "3️⃣ Health & Metabolic Benefits (Part 2):\n• Reduces mortality from Prolapse, Sudden Death Syndrome (SDS), Heart Attacks, and Fatty Liver Syndrome\n• Lowers cull hen rates during 22-30 weeks of age\n• Improves laying persistency after peak\n• Simplifies feeding management and post-peak feed reduction\n• Decreases the proportion of less efficient flocks",
        "👉 Summary: Gradual and controlled feed escalation post light stimulation ensures long-term high lay persistence, superior bird health, and optimal flock performance."
      ],
      detailsBn: [
        "📌 পুষ্টিগত সংবেদনশীল পর্যায়ঃ\nলাইট স্টিমুলেশন (MOL – Moment of Light Stimulation) থেকে পিক প্রোডাকশন পর্যন্ত সময়টি ব্রিডার ফ্লকের জীবনের সবচেয়ে সংবেদনশীল পর্যায়।\n\nলাইট স্টিমুলেশনের পর স্ত্রী পাখি তার পুষ্টি ৩টি ভাগে বণ্টন করেঃ\n👉 রক্ষণাবেক্ষণ (Maintenance)\n👉 বৃদ্ধি (Growth)\n👉 প্রজনন অঙ্গের বিকাশ (Reproductive Development)\n\nসঠিক ব্যবস্থাপনা এই পুষ্টি বণ্টনের ভারসাম্য নিয়ন্ত্রণ করে।",
        "1️⃣ লাইট স্টিমুলেশন থেকে প্রোডাকশন শুরু পর্যন্তঃ\n• ফিড প্রদান করতে হবে বডি ওয়েট অনুযায়ী।\n• সঠিক বডি কন্ডিশনে লাইট স্টিমুলেশন দেওয়া হলে প্রতি সপ্তাহে ছোট ফিড বৃদ্ধি যথেষ্ট।\n\n👉 প্রতি সপ্তাহে ২–৩ গ্রাম/মুরগী (অথবা ০.৪৪–০.৬৬ পাউন্ড/১০০ পাখি/সপ্তাহ)।",
        "2️⃣ সংযত (Conservative) ফিডিং প্রোগ্রামের উপকারিতা (১-৪)ঃ\n• ডাবল কুসুমের (Double Yolk) শতাংশ কমে\n• পিক প্রোডাকশনে ২–৪% কম উৎপাদন সমস্যার ঝুঁকি কমে\n• ফ্লোর এগ কমে (বিশেষত কমিউনিটি নেস্ট সিস্টেমে)\n• পিক প্রোডাকশনে ঢোকার সময় এগ পেরিটোনাইটিসের ঝুঁকি কমে",
        "3️⃣ স্বাস্থ্য ও মেটাবলিক সুফল (৫-৯)ঃ\n• প্রোলাপ্স, SDS, হার্ট অ্যাটাক ও ফ্যাটি লিভারজনিত হঠাৎ মৃত্যুহার কমে\n• ২২–৩০ সপ্তাহে কুল (Cull) মুরগীর সংখ্যা কমে\n• ডিম উৎপাদনের স্থায়িত্ব (Persistency) উন্নত হয়\n• লেয়িং পর্যায়ে ফিড ম্যানেজমেন্ট সহজ হয় ও পিকের পর ফিড কমানো সুবিধা জনক হয়\n• কম দক্ষ (Less efficient) ফ্লকের সংখ্যা কমে",
        "👉 সংক্ষেপে: লাইট স্টিমুলেশনের পর ধীরে ও নিয়ন্ত্রিত ফিড বৃদ্ধি দীর্ঘমেয়াদে উচ্চ উৎপাদন, উন্নত স্বাস্থ্য ও সেরা ফ্লক পারফরম্যান্স নিশ্চিত করে।"
      ],
      keyPointsEn: [
        "1. Nutrient Split: Maintenance, Growth & Reproductive Development",
        "2. Pre-Lay Feed Rate: 2-3 g/bird/week (0.44-0.66 lb/100 birds/wk)",
        "3. Key Benefits: Fewer double yolks, lower floor eggs & less Egg Peritonitis",
        "4. Health Impact: Lower SDS, Prolapse, Heart Attack & Fatty Liver deaths"
      ],
      keyPointsBn: [
        "১. পুষ্টি বণ্টন: রক্ষণাবেক্ষণ, শারীরিক বৃদ্ধি & প্রজনন অঙ্গ বিকাশ",
        "২. প্রাক-লেয়িং ফিড বৃদ্ধি: ২-৩ গ্রাম/মুরগী/সপ্তাহ (০.৪৪-০.৬৬ পাউন্ড/১০০ পাখি)",
        "৩. মূল সুফল: কম ডাবল কুসুম, কম ফ্লোর এগ & কম এগ পেরিটোনাইটিস",
        "৪. স্বাস্থ্য সুফল: কম প্রোলাপ্স, SDS, হার্ট অ্যাটাক & ফ্যাটি লিভার মৃত্যু"
      ],
    ),

    // 23. Feeding Procedure (Chain System)
    BroilerPSArticleItem(
      id: "feeding_procedure_chain_system",
      titleEn: "Feeding Procedure (Chain System)",
      titleBn: "ফিডিং পদ্ধতি (চেইন ফিডিং সিস্টেম)",
      subtitleBn: "ফিডিং পদ্ধতি (চেইন ফিডিং সিস্টেম) (FEEDING PROCEDURE – CHAIN SYSTEM)",
      subtitleEn: "12 Step Standard Operating Procedure for Chain Feeder Operation",
      snippetBn: "1️⃣ ফিড প্রস্তুতি & শকার লাইন, শাওয়ার বায়োসিকিউরিটি, মোরগ ফিডিং আগে শুরু, ৯০% ফিড ক্লিনআপ সময়...",
      snippetEn: "1️⃣ Feed prep & shocker line, biosecurity shower, male feeding first, 90% cleanup record...",
      imagePath: "assets/ps_broiler.jpg",
      detailsEn: [
        "1️⃣ Feed Preparation & Shocker Line:\n• Weigh feed into clean chain feeder hoppers.\n• Pre-weigh male feed the day before and assign to male feeders.\n• Ensure roost shocker lines are active during preparation.",
        "2️⃣ Biosecurity Shower & 3️⃣ Hand-Foot Washing:\n• Feeding staff must shower for at least 5 minutes and wear dedicated farm uniforms.\n• Wash and sanitize hands and boots before shed entry.",
        "4️⃣ Initial Inspection & 5️⃣ Medication Administration:\n• Check water line gate valves and tally daily mortality.\n• Administer prescribed medications via medicator before feeding.",
        "6️⃣ Male Feeding Priority & 7️⃣ Monitoring:\n• Always start male feeding first and confirm equal feed distribution.\n• Record male start/end feed times; inspect feeder height and litter condition.",
        "8️⃣ Hopper Feed Levels & 9️⃣ Hen Distribution & Cleanup Record:\n• Monitor hopper feed levels during chain run; manually top up after stop if needed.\n• Ensure uniform hen distribution along troughs; record cleanup time when 90% feed is consumed.",
        "🔟 Sick Bird Isolation, 1️⃣1️⃣ Hopper Cleaning & 1️⃣2️⃣ Overall Audit:\n• Cull/isolate sick birds observed during feeding into sick pens.\n• Sweep and clean hoppers thoroughly after cleanup.\n• Continually audit feeder space, drinker height, water pressure, and litter quality.\n\n👉 Operating chain feeding according to strict SOP maximizes flock uniformity and lay persistence."
      ],
      detailsBn: [
        "1️⃣ ফিড প্রস্তুতিঃ\n• চেইন ফিডার পরিষ্কারের পর হপারে ওজনকৃত ফিড প্রদান করতে হবে।\n• মোরগের ফিড আগের দিন মেপে নির্ধারিত ফিডারে দিতে হবে।\n• এই সময় শকার লাইন (Shocker Line) সক্রিয় রাখতে হবে।",
        "2️⃣ বায়োসিকিউরিটি & ৩️⃣ ধোয়া-মোছাঃ\n• ফিডিং কর্মীরা শাওয়ার রুমে কমপক্ষে ৫ মিনিট গোসল করে নির্ধারিত ইউনিফর্ম পরবে।\n• শেডে প্রবেশের পূর্বে হাত ও পা জীবাণুমুক্ত করে ধুতে হবে।",
        "4️⃣ প্রাথমিক পরীক্ষা & ৫️⃣ ওষুধ প্রয়োগঃ\n• পানির লাইনের গেট ভালভ ও মৃত্যুহার (Mortality) পর্যবেক্ষণ করতে হবে।\n• ফিড দেওয়ার আগে মেডিকেটরের মাধ্যমে প্রয়োজনীয় ওষুধ প্রয়োগ করতে হবে।",
        "6️⃣ মোরগের ফিডিং & ৭️⃣ পর্যবেক্ষণঃ\n• প্রথমে মোরগের ফিডিং শুরু করতে হবে এবং সমান বিতরণ নিশ্চিত করতে হবে।\n• মোরগ ফিডিংয়ের শুরু ও শেষ সময় রেকর্ড করতে হবে এবং ফিডার উচ্চতা ও লিটার চেক করতে হবে।",
        "8️⃣ হপার পরীক্ষা & ৯️⃣ মুরগীর বণ্টন ও ফিড শেষঃ\n• চেইন চলাকালীন ফিডের স্তর দেখতে হবে; বন্ধ হলে প্রয়োজনে ম্যানুয়াল ফিড দেওয়া হবে।\n• ফিডার চারপাশে সুষম বণ্টন দেখতে হবে এবং ৯০% ফিড শেষ হলে সময় রেকর্ড করতে হবে।",
        "🔟 সিকেল বার্ড ছাঁটাই, 1️⃣1️⃣ হপার ক্লিন & 1️⃣2️⃣ ওভারঅল চেকিংঃ\n• অসুস্থ মুরগী চিহ্নিত করে সিকেল পেনে আলাদা করতে হবে।\n• ফিড শেষ হলে হপার পরিষ্কার করতে হবে।\n• পর্যাপ্ত স্পেস, পানির উচ্চতা, পানির চাপ ও লিটার কন্ডিশন পর্যবেক্ষণ করতে হবে。\n\n👉 সঠিক চেইন ফিডিং এসওপি ইউনিফরমিটি, স্বাস্থ্য ও উৎপাদন বাড়ায়।"
      ],
      keyPointsEn: [
        "1. Prep & Biosecurity: 5-min shower, active shocker line & male feed pre-weighed",
        "2. Male First Feeding: Feed roosters prior to hens & record start/finish time",
        "3. Cleanup Metric: Record time stamp when 90% of feed is eaten",
        "4. Environmental Checks: Audit feeder space, water pressure, drinker height & litter"
      ],
      keyPointsBn: [
        "১. প্রস্তুতি & বায়োসিকিউরিটি: ৫ মিনিট গোসল, শকার লাইন চালু & মোরগের ফিড মেপে রাখা",
        "২. মোরগের ফিডিং অগ্রাধিকার: মুরগীর আগে মোরগকে ফিড দেওয়া & সময় রেকর্ড করা",
        "৩. ক্লিনআপ রেকর্ড: ৯০% ফিড শেষ হওয়ার সময় স্ট্যাম্প রেকর্ড করা",
        "৪. সার্বিক পরীক্ষা: ফিডিং স্পেস, পানির চাপ, ড্রিংকার উচ্চতা & লিটার কন্ডিশন চেক করা"
      ],
    ),

    // 24. Post Peak Feeding or Feed Reduction
    BroilerPSArticleItem(
      id: "post_peak_feeding_reduction",
      titleEn: "Post Peak Feeding or Feed Reduction.",
      titleBn: "পিকের পর ফিড কমানোর ব্যবস্থাপনা",
      subtitleBn: "পিকের পর ফিড ব্যবস্থাপনা / ফিড কমানো (Post Peak Feeding or Feed Reduction)",
      subtitleEn: "Over-Feeding vs Correct-Feeding Reduction Schedules & Egg Mass Calculation",
      snippetBn: "1️⃣ পিকে ওভারফিডিং বনাম ২️⃣ সঠিক এনার্জি ফিডিং সূচি, ৩️⃣ ৮৭%+ পিকের নির্দেশনা & ৪️⃣ এগ মাস সূত্র...",
      snippetEn: "1️⃣ Over-feeding vs 2️⃣ correct energy feeding post-peak schedules, 3️⃣ 87%+ peak rules & 4️⃣ Egg Mass...",
      imagePath: "assets/ps_broiler.jpg",
      detailsEn: [
        "1️⃣ Over-Feeding in Peak Reduction Schedule:\n• Reduce total feed by 5 g (1.1 lb/100 birds) within the first 2 weeks post-peak.\n• Thereafter, reduce feed by 1 g (0.22 lb/100 birds) per week up to 40 weeks of age.\n• After 40 weeks, reduce even more slowly: 1 g (0.22 lb/100 birds) every 2-3 weeks.\n\n🔻 Total overall feed reduction is approximately 10-15%.",
        "2️⃣ Correct Energy Feeding in Peak Reduction Schedule:\n• Hold peak feed allocation steady for 2-3 weeks post-peak.\n• Thereafter, reduce feed by 1 g (0.22 lb/100 birds) per week up to 40 weeks of age.\n• After 40 weeks, reduce gradually: 1 g (0.22 lb/100 birds) every 2-3 weeks.\n\n🔻 Total overall feed reduction is approximately 7-10%.",
        "3️⃣ High Peak Observation (>87% Peak Lay):\n• If flock exceeds 87% peak lay, hold peak feed 1-2 weeks longer.\n• Alternatively, add 1 g (0.22 lb/100 birds) feed for every extra 2% lay above 87%.\n• These high-performing flocks convert extra feed directly into Egg Mass rather than body fat.",
        "4️⃣ Egg Mass Calculation & Lay Persistence:\n👉 Egg Mass (g/bird/day) = Laying Percentage (%) × Average Egg Weight (g)\n\n• As lay percentage declines post-peak, individual egg weight increases.\n• Maintaining precise nutrition based on Egg Mass sustains laying persistency.\n\n👉 Sound post-peak feed reduction maintains optimal body weight, lay persistency, and hatchability."
      ],
      detailsBn: [
        "1️⃣ পিকে অতিরিক্ত ফিড দেওয়া হলে (Over Feeding in Peak)ঃ\n• ২ সপ্তাহের মধ্যে মোট ৫ গ্রাম (১.১ lb/১০০ মুরগী) ফিড কমাতে হবে।\n• এরপর ৪০ সপ্তাহ পর্যন্ত প্রতি সপ্তাহে ১ গ্রাম (০.২২ lb/১০০ মুরগী) করে ধীরে ধীরে কমাতে হবে।\n• ৪০ সপ্তাহের পর আরও ধীরগতিতে: প্রতি ২–৩ সপ্তাহে ১ গ্রাম (০.২২ lb/১০০ মুরগী)।\n\n🔻 মোট ফিড হ্রাস পাবে প্রায় ১০–১৫%।",
        "2️⃣ পিকে সঠিক এনার্জি ফিডিং থাকলে (Correct Energy Feeding in Peak)ঃ\n• পিক ফিড লেভেল ২–৩ সপ্তাহ ধরে রাখতে হবে।\n• এরপর ৪০ সপ্তাহ পর্যন্ত প্রতি সপ্তাহে ১ গ্রাম (০.২২ lb/১০০ পাখি) করে কমানো চলবে।\n• ৪০ সপ্তাহের পর ধীরগতিতে: প্রতি ২–৩ সপ্তাহে ১ গ্রাম (০.২২ lb/১০০ পাখি)।\n\n🔻 মোট ফিড হ্রাস পাবে প্রায় ৭–১০% (ক্ষেত্রবিশেষে কম হতে পারে)।",
        "3️⃣ পর্যবেক্ষণ (Observation - ৮৭%+ পিক)ঃ\n• পিক প্রোডাকশন ৮৭% এর বেশি হলে পিক ফিড ১–২ সপ্তাহ বেশি ধরে রাখা ভালো।\n• অথবা ৮৭% এর উপরে প্রতি অতিরিক্ত ২% প্রোডাকশনের জন্য ১ গ্রাম (০.২২ lb/১০০ পাখি) ফিড বাড়ানো যেতে পারে।\n• এসব ফ্লক সাধারণত মেদযুক্ত হয় না, কারণ গৃহীত ফিড উচ্চ এগ মাসে (Egg Mass) রূপান্তরিত হয়।",
        "4️⃣ এগ মাস (Egg Mass) নির্ণয়ঃ\n👉 এগ মাস (গ্রাম/পাখি/দিন) = দৈনিক ডিম উৎপাদনের % × গড় ডিমের ওজন (গ্রাম)\n\n• পিকের পর উৎপাদন শতাংশ কিছুটা কমলেও ডিমের ওজন বাড়তে থাকে।\n• তাই এই সময়ে সঠিক পুষ্টি ও এগ মাস ট্র্যাকিং ডিমের স্থায়িত্ব ধরে রাখে।\n\n👉 সঠিক পিক-পরবর্তী ফিড ব্যবস্থাপনা বডি ওয়েট, উৎপাদনের স্থায়িত্ব এবং ফার্টিলিটি বজায় রাখে।"
      ],
      keyPointsEn: [
        "1. Over-Fed Peak Cut: -5g in 2 wks, then -1g/wk to 40 wks (-10-15% total)",
        "2. Correct-Fed Peak Cut: Hold 2-3 wks, then -1g/wk to 40 wks (-7-10% total)",
        "3. High Lay (>87%): Hold peak feed 1-2 wks longer or +1g per +2% lay",
        "4. Egg Mass Formula: Laying % × Avg Egg Weight (g)"
      ],
      keyPointsBn: [
        "১. ওভারফিডেড পিক কাট: ২ সপ্তাহে -৫ গ্রাম, এরপর ৪০ সপ্তাহ পর্যন্ত -১ গ্রাম/সপ্তাহ (১০-১৫% মোট হ্রাস)",
        "২. সঠিক ফিডেড পিক কাট: ২-৩ সপ্তাহ হোল্ড, এরপর ৪০ সপ্তাহ পর্যন্ত -১ গ্রাম/সপ্তাহ (৭-১০% হ্রাস)",
        "৩. উচ্চ উৎপাদন (>৮৭%): পিক ফিড ১-২ সপ্তাহ বেশি রাখা বা প্রতি ২% ডিমের জন্য +১ গ্রাম ফিড",
        "৪. এগ মাস সূত্র: ডিম উৎপাদন % × গড় ডিমের ওজন (গ্রাম)"
      ],
    ),

    // 25. Feed Cleanup Time
    BroilerPSArticleItem(
      id: "feed_cleanup_time",
      titleEn: "Feed Cleanup Time.",
      titleBn: "ফিড ক্লিনআপ টাইম",
      subtitleBn: "ফিড ক্লিনআপ টাইম (Feed Cleanup Time)",
      subtitleEn: "Eating Duration Standards (Crumble 1.5h, Mash 3h), Deviation Risks & Influencing Factors",
      snippetBn: "⏱️ ক্রাম্বল ১.৫ ঘন্টা, ম্যাশ ৩ ঘন্টা | দ্রুত/ধীর ফিড শেষের ঝুঁকি & ৬টি প্রভাবক কারণ...",
      snippetEn: "⏱️ Crumble 1.5 hrs, Mash 3 hrs | Fast/slow cleanup risks & 6 influencing factors...",
      imagePath: "assets/ps_broiler.jpg",
      detailsEn: [
        "⏱️ Normal Cleanup Duration Standards:\n• Crumble / Pellet Feed = Approx 1.5 hours\n• Mash Feed = Approx 3.0 hours\n\nThese durations are considered ideal benchmarks post-feeding.",
        "1️⃣ Risks of Rapid Cleanup (Fast Cleanup):\n• Indicates underfeeding or high feed competition; birds are left hungry.\n• Reducing feed allocation further under fast cleanup will harm egg production.",
        "2️⃣ Risks of Slow Cleanup (>3.5-4.0 Hours):\n• Indicates overfeeding; hens consume excess calories and become overweight/uneven.\n• Requires relatively prompt feed reduction and allocation adjustment.",
        "3️⃣ Hazards of Prolonged Cleanup (Selective Eating):\n• Hens engage in selective eating—consuming large coarse particles while leaving fine nutrients in troughs.\n• Degrades flock uniformity and leads to lower egg production and hatchability.",
        "⚠️ 6 Factors Influencing Feed Cleanup Time:\n• 1️⃣ Feed Form: Pellet vs Crumble vs Mash texture\n• 2️⃣ Feed Ingredients: Raw material quality and palatability\n• 3️⃣ Ambient Temperature: Extreme heat, cold, or sudden thermal swings\n• 4️⃣ Water System: Nipple drinkers vs open bell troughs\n• 5️⃣ Feeding Machinery: Feed distribution speed and system design\n• 6️⃣ Health Status: Subclinical enteritis or systemic illness\n\n👉 Maintaining standard cleanup times is essential for flock uniformity, health, and peak performance."
      ],
      detailsBn: [
        "⏱️ স্বাভাবিক ক্লিনআপ সময়ঃ\n• ক্রাম্বল ফিড = প্রায় ১.৫ ঘণ্টা\n• ম্যাশ ফিড = প্রায় ৩ ঘণ্টা\n\nএই সময়সীমা স্বাভাবিক বলে ধরা হয়।",
        "1️⃣ খুব দ্রুত ফিড শেষ হলে (Fast Cleanup Risks)ঃ\n• মুরগী প্রয়োজনীয় পুষ্টি পাচ্ছে না হতে পারে বা অতিরিক্ত ক্ষুধার্ত থাকতে পারে।\n• এই অবস্থায় হঠাৎ ফিড কমিয়ে দিলে ডিম উৎপাদনে নেতিবাচক প্রভাব পড়ে।",
        "2️⃣ খুব ধীরে ফিড শেষ হলে (Slow Cleanup > 3.5-4h)ঃ\n• মুরগী অতিরিক্ত ফিড পাচ্ছে, যা পাখি মোটা (overweight) ও অসম (uneven) করে দেয়।\n• এই ক্ষেত্রে তুলনামূলক দ্রুত ফিড কমানো বা সমন্বয় প্রয়োজন।",
        "3️⃣ দীর্ঘ ক্লিনআপ টাইমের ঝুঁকি (Selective Eating)ঃ\n• মুরগী বাছাই করে খাওয়া (Selective Eating) শুরু করে—মোটা দানা খেয়ে সূক্ষ্ম অংশ (Fines) ফিডারে ফেলে রাখে।\n• ফলে ইউনিফরমিটি নষ্ট হয় এবং ডিমের সংখ্যা ও ফার্টিলিটি কমে যায়।",
        "⚠️ ফিড ক্লিনআপ টাইমে প্রভাব ফেলতে পারে এমন ৬টি বিষয়ঃ\n• 1️⃣ ফিডের গঠন: পেলেট / ক্রাম্বল / ম্যাশ ফর্ম\n• 2️⃣ কাঁচামাল: ফিডের গুণগত মান ও পুষ্টির সংমিশ্রণ\n• 3️⃣ তাপমাত্রা: অত্যধিক গরম/ঠান্ডা বা হঠাৎ আবহাওয়ার পরিবর্তন\n• 4️⃣ পানির ব্যবস্থা: নিপল ড্রিংকার বা বেল ট্রফ\n• 5️⃣ ফিডিং সিস্টেম: ফিড বিতরণের গতি ও সিস্টেমের ধরন\n• 6️⃣ রোগ সংক্রান্ত কারণ: অন্ত্রের সংক্রমণ বা স্বাস্থ্য সমস্যা\n\n👉 সঠিক ফিড ক্লিনআপ টাইম বজায় রাখা ইউনিফরমিটি, স্বাস্থ্য ও উৎপাদন দক্ষতা নিশ্চিত করে।"
      ],
      keyPointsEn: [
        "1. Standard Time: Crumble ~1.5 hrs, Mash ~3.0 hrs",
        "2. Fast Cleanup (<1.5h): Underfeeding & hunger; do NOT cut feed",
        "3. Slow Cleanup (>3.5-4h): Overfeeding, obesity & selective eating of coarse grains",
        "4. Key Drivers: Feed form, ingredients, temp, water lines, feeder speed & health"
      ],
      keyPointsBn: [
        "১. স্বাভাবিক সময়: ক্রাম্বল ~১.৫ ঘন্টা, ম্যাশ ~৩.০ ঘন্টা",
        "২. দ্রুত ক্লিনআপ (<১.৫ঘ): ফিডের ঘাটতি & অনাহার; ফিড হঠাৎ কাটা নিষেধ",
        "৩. ধীর ক্লিনআপ (>৩.৫-৪ঘ): অতিরিক্ত ফিড, মেদভুঁড়ি & সিলেক্টিভ ইটিং",
        "৪. প্রভাবক উপাদান: ফিড ফর্ম, কাঁচামাল, তাপমাত্রা, পানি, ফিডার গতি & রোগ"
      ],
    ),

    // 26. Male Management
    BroilerPSArticleItem(
      id: "male_management",
      titleEn: "Male Management.",
      titleBn: "মোরগের ব্যবস্থাপনা",
      subtitleBn: "মোরগের ব্যবস্থাপনা (Male Management)",
      subtitleEn: "8-Point Rearing, Testis Development, Transfer Ratios & Weight Matching Rules",
      snippetBn: "1️⃣ ১ম ৮-১২ সপ্তাহে ফ্রেম, ২️⃣ ৮ সপ্তাহে ফিজিক্যাল টেস্ট, ৩️⃣ ১৬-২২ সপ্তাহে টেস্টিকুলার গ্রোথ, ৮️⃣ ওয়েট ম্যাচিং...",
      snippetEn: "1️⃣ 1st 8-12 wks frame size, 2️⃣ 8-wk physical cull, 3️⃣ 16-22 wks testicular growth, 8️⃣ weight matching...",
      imagePath: "assets/ps_broiler.jpg",
      detailsEn: [
        "📌 Early Rearing Care & Lighting Requirements:\nA strong start in male rearing establishes body weight uniformity and skeletal frame integrity essential for lifelong fertility.\n\n• Maintain sex-separate rearing up to 20 weeks of age.\n• In dark-out houses, provide minimum 25 Lux light intensity during the first 4 weeks to allow ample feeding time.",
        "1️⃣ First 8-12 Weeks Frame Control:\n• Weight gain in the first 8-12 weeks directly determines adult skeletal frame size.\n• Overweight males develop oversized frames; keep weights strictly aligned with standards between weeks 4-16.\n• Visually grade heavy males at 3-4 weeks and adjust feeding to realign them with standard by week 8.",
        "2️⃣ 8-Week Physical Selection & Culling:\nHand-inspect every rooster at 8 weeks. Cull males with physical defects such as crooked toes, spinal deformities, eye lesions, or beak defects.",
        "3️⃣ Post 16-Week Feeding & Testicular Development:\nAfter 16 weeks, maintain steady feed increments to stimulate body weight and testicular development.\n⚠️ Severe stress, weight loss, or growth arrest between weeks 16-22 impairs testicular growth, resulting in lower early hatchability and reduced lifetime fertility.",
        "4️⃣ Early Transfer, 5️⃣ Transfer Ratios & 6️⃣ Medium-Weight Selection:\n• Relocate roosters to laying house 2-3 days before hens so they adapt to new feeding lines without stealing hen feed.\n• Transfer ratios: 7-9% in closed environmental houses; 9-10% in open houses.\n• Cull underweight and excessively heavy males to maintain a uniform medium-weight male population.",
        "7️⃣ 23-Week Mating Ratio & 8️⃣ Weight Matching Strategy:\n• Mating ratios at 23 weeks: 7.5-9.0% in slatted houses; up to 10.0% in full floor systems.\n• Weight Matching: Pair heavy roosters with heavy pullets and light roosters with light pullets to enhance sexual synchronization, hen receptivity, and mating efficiency.\n\n👉 Superior rooster management directly drives flock fertility, hatchability, and overall performance."
      ],
      detailsBn: [
        "📌 মোরগের প্রাথমিক যত্ন & আলোঃ\nমোরগের রিয়ারিংয়ে ভালো শুরু বডি ওয়েট ইউনিফরমিটি ও কঙ্কাল বিকাশ নিশ্চিত করে, যা ভবিষ্যৎ ফার্টিলিটির চাবিকাঠি।\n\n• ২০ সপ্তাহ পর্যন্ত সেক্স-সেপারেট রিয়ারিং (আলাদা পালন) করা উচিত।\n• ডার্ক-আউট হাউসে প্রথম ৪ সপ্তাহে অন্তত ২৫ লাক্স আলো ও যথেষ্ট সময় দিতে হবে যাতে তারা প্রয়োজনীয় ফিড পায়।",
        "1️⃣ প্রথম ৮–১২ সপ্তাহের গুরুত্বঃ\n• এই সময়ে ওজনের উন্নয়ন ভবিষ্যতের ফ্রেম সাইজ তৈরি করে।\n• অতিরিক্ত ওজনের মোরগ বড় ফ্রেম তৈরি করে, তাই ৪–১৬ সপ্তাহে ওজন স্ট্যান্ডার্ডের কাছাকাছি রাখতে হবে।\n• ৩–৪ সপ্তাহে ভিজ্যুয়াল গ্রেডিং করে ভারী মোরগ আলাদা করে ৮ সপ্তাহে স্ট্যান্ডার্ডে ফিরাতে হবে।",
        "2️⃣ ৮ সপ্তাহ শারীরিক পরীক্ষা (Physical Culling)ঃ\nসব মোরগ পরীক্ষা করে দৃশ্যমান ত্রুটিযুক্ত মোরগ বাদ দিতে হবে: বাঁকা আঙুল, মেরুদণ্ডের বক্রতা, চোখ ও ঠোঁটের ত্রুটি।",
        "3️⃣ ১৬ সপ্তাহের পর & টেস্টিকুলার বিকাশঃ\n১৬ সপ্তাহের পর মোরগকে নিয়মিত ফিড দিয়ে উদ্দীপিত রাখতে হবে।\n⚠️ ১৬–২২ সপ্তাহে স্ট্রেস, ওজন কমে যাওয়া বা বৃদ্ধি থমকে গেলে টেস্টিসের বিকাশ ব্যাহত হয়, যার ফলে প্রাথমিক হ্যাচ ও সারাজীবনের ফার্টিলিটি কমে যায়।",
        "4️⃣ ২-৩ দিন আগে স্থানান্তর, 5️⃣ স্থানান্তর অনুপাত & 6️⃣ মিডিয়াম গ্রুপঃ\n• লেয়িং হাউসে মুরগীর ২–৩ দিন আগে মোরগ স্থানান্তর করলে ফিডিং সিস্টেমে অভ্যস্ত হয়।\n• স্থানান্তরের সময় অনুপাত: ক্লোজড হাউসে ৭–৯%, ওপেন হাউসে ৯–১০%।\n• কম ওজনের ও অতিরিক্ত ভারী মোরগ ছাঁটাই করে মাঝারি ওজনের দল বজায় রাখতে হবে (ভারী মোরগ স্পাইকিংয়ের জন্য রাখা যায়)।",
        "7️⃣ ২৩ সপ্তাহে ম্যাটিং অনুপাত & 8️⃣ ওজন মেলানো (Weight Matching)ঃ\n• ২৩ সপ্তাহে ম্যাটিং রেশিও: স্ল্যাটেড হাউসে ৭.৫–৯%, ফ্লোর অপারেশনে ১০% পর্যন্ত।\n• ওজন মেলানো: ভারী মোরগের সাথে ভারী মুরগী এবং হালকা মোরগের সাথে হালকা মুরগী রাখা হলে যৌন পরিপক্বতা সমন্বয়, হেনের গ্রহণযোগ্যতা ও ম্যাটিং দক্ষতা বৃদ্ধি পায়。\n\n👉 সঠিক মোরগ ব্যবস্থাপনা ফার্টিলিটি, হ্যাচেবিলিটি ও উৎপাদন সরাসরি বাড়ায়।"
      ],
      keyPointsEn: [
        "1. Rearing: Sex-separate to 20 wks; 25 Lux light in first 4 wks",
        "2. Frame & Cull: Grade at 3-4 wks; 8-wk physical cull (crooked toes/spine/beak)",
        "3. Testes Development: 16-22 wks critical (avoid stress/weight loss)",
        "4. Weight Matching: Pair heavy males with heavy hens, light with light"
      ],
      keyPointsBn: [
        "১. রিয়ারিং: ২০ সপ্তাহ পর্যন্ত সেক্স-সেপারেট; ১ম ৪ সপ্তাহে ২৫ লাক্স আলো",
        "২. ফ্রেম & ছাঁটাই: ৩-৪ সপ্তাহে গ্রেডিং; ৮ সপ্তাহে শারীরিক পরীক্ষা (আঙুল/মেরুদণ্ড/ঠোঁট)",
        "৩. টেস্টিস বিকাশ: ১৬-২২ সপ্তাহ অতি সংবেদনশীল (স্ট্রেস & ওজন হ্রাস মুক্ত রাখা)",
        "৪. ওয়েট ম্যাচিং: ভারী মোরগের সাথে ভারী মুরগী & হালকা মোরগের সাথে হালকা মুরগী মেলানো"
      ],
    ),

    // 27. Male Spiking
    BroilerPSArticleItem(
      id: "male_spiking",
      titleEn: "Male Spiking.",
      titleBn: "মেল স্পাইকিং",
      subtitleBn: "মেল স্পাইকিং (Male Spiking)",
      subtitleEn: "9 Guidelines for Male Spiking Protocols, Age Specs (25 wks, >=4.0 kg) & Timing",
      snippetBn: "1️⃣ অতিরিক্ত মোরগ সংরক্ষণ, ২০% যোগ, ২৫ সপ্তাহ বয়স & ৪.০ কেজি মিনিমাম ওজন, ৩০-৩২ সপ্তাহে আর্লি স্পাইকিং...",
      snippetEn: "1️⃣ Extra male rearing, +20% spike males, 25 wks age & >=4.0 kg weight, early spiking 30-32 wks...",
      imagePath: "assets/ps_broiler.jpg",
      detailsEn: [
        "📌 Purpose of Male Spiking & Decline Causes:\nMale spiking involves introducing young fertile roosters into an older breeder flock to restore fertility drop commonly seen past 45 weeks.\n\nPrimary Male Fertility Decline Drivers:\n• Natural loss of mating interest after 35-40 weeks\n• Reduced sperm quality and volume after 55 weeks\n• Excessive weight, foot/leg issues decreasing mating efficiency\n• Male mortality reducing total rooster-to-hen ratio",
        "1️⃣ Extra Rooster Rearing & 2️⃣ Spiking Percentage:\n• Rear extra males in separate houses/pens during transfer to draw from when spiking.\n• Add at least 20% spike males relative to current male headcount. Prune old males down to 6.5-7.0% ratio beforehand to minimize male aggression.",
        "3️⃣ Spike Male Quality Standards (25 Wks, >=4.0 kg):\n• Spike males must be physically defect-free and sexually mature.\n• Minimum age = 25 weeks; Minimum body weight = 4.0 kg (to successfully compete with resident males).",
        "4️⃣ Routine Primary Male Culling & 5️⃣ Early Spiking (30-32 Weeks):\n• Systematically cull weak or heavy primary males.\n• Early spiking at 30-32 weeks allows starting with a lower 6-7% male ratio at 21-22 weeks, gradually increasing to 8.5-10% post-spiking, enhancing hen receptivity.",
        "6️⃣ Post-Spiking Feed Stimulus (+2-3 g/day):\n• Increasing male feed allocation slightly (+2 to +3 g/rooster/day) post-spiking stimulates resident males to mate actively for at least 4 weeks alongside new males.",
        "7️⃣ Spiking Window, 8️⃣ Frequency & 9️⃣ 55-Week Limit:\n• Perform spiking prior to week 40 for optimal fertility recovery.\n• Usually 1 spiking event per flock cycle is sufficient; 2 spikings spaced 8-10 weeks apart are also effective.\n• Spiking beyond 55 weeks of age is generally not economically viable.\n\n👉 Timely, well-planned male spiking sustains flock fertility, hatchability, and economic return."
      ],
      detailsBn: [
        "📌 মেল স্পাইকিংয়ের উদ্দেশ্য & কারণসমূহঃ\nস্পাইকিং হলো বয়স্ক ব্রয়লার ব্রিডার ফ্লকে নতুন তরুণ মোরগ যোগ করা, যাতে ৪৫ সপ্তাহের পর ফার্টিলিটি হ্রাস পূরণ করা যায়।\n\nপ্রাথমিক মোরগের ফার্টিলিটি কমার কারণঃ\n• ৩৫–৪০ সপ্তাহের পর স্বাভাবিকভাবে ম্যাটিং আগ্রহ কমে যাওয়া\n• ৫৫ সপ্তাহের পর স্পার্মের মান হ্রাস পাওয়া\n• ওজন বৃদ্ধি, পা/পায়ের সমস্যাজনিত কারণে ম্যাটিং দক্ষতা কমে যাওয়া\n• অতিরিক্ত মোরগ মরটালিটির কারণে মেল-ফিমেল অনুপাত কমে যাওয়া",
        "1️⃣ অতিরিক্ত মোরগ সংরক্ষণ & 2️⃣ স্পাইকিং শতাংশঃ\n• স্থানান্তরের সময় অতিরিক্ত মোরগ আলাদা হাউস/ফার্মে বা আলাদা পেনে রেখে ব্যবহার করা যায়।\n• কমপক্ষে ২০% স্পাইক মোরগ যোগ করতে হবে; তবে তার আগে পুরোনো মোরগ কুলিং করে অনুপাত ৬.৫–৭% এ নামাতে হবে। এতে আক্রমণাত্মক আচরণ নিয়ন্ত্রণে থাকে।",
        "3️⃣ স্পাইকিং মোরগের মান (২৫ সপ্তাহ & ৪.০ কেজি)ঃ\n• শারীরিক ত্রুটিমুক্ত ও যৌনভাবে সম্পূর্ণ পরিপক্ব হতে হবে।\n• বয়স কমপক্ষে ২৫ সপ্তাহ এবং সর্বনিম্ন ওজন ৪.০ কেজি হওয়া আবশ্যক (যাতে পুরানো মোরগের সাথে টিকতে পারে)।",
        "4️⃣ প্রাথমিক মোরগ ছাঁটাই & 5️⃣ আগাম স্পাইকিং (৩০–৩২ সপ্তাহ)ঃ\n• দুর্বল প্রাথমিক মোরগ নিয়মিত বাদ দিয়ে আদর্শ অনুপাত বজায় রাখতে হবে।\n• ৩০–৩২ সপ্তাহে আগাম স্পাইকিং শুরু করলে শুরুতে ২১–২২ সপ্তাহে অনুপাত ৬–৭% রাখা যায় এবং পরে বাড়িয়ে ৮.৫–১০% করা যায়। এটি সেক্স মিক্সিং উন্নত করে।",
        "6️⃣ স্পাইকিং পরবর্তী ফিড বৃদ্ধি (+২-৩ গ্রাম/দিন)ঃ\n• স্পাইকিংয়ের পর সামান্য ফিড বৃদ্ধি (প্রতি মোরগে ২–৩ গ্রাম/দিন) উপকারী, কারণ নতুন মোরগের সাথে পুরোনো মোরগও অন্তত ৪ সপ্তাহ ৩০ সপ্তাহ বয়সের মতো সক্রিয় হয়ে ওঠে।",
        "7️⃣ কখন করবেন, 8️⃣ কয়বার করবেন & 9️⃣ ৫৫ সপ্তাহের সীমানাঃ\n• ৪০ সপ্তাহের আগেই স্পাইকিং করা উত্তম; ফার্টিলিটি কমার জন্য অপেক্ষা না করে পূর্বপরিকল্পনা রাখুন।\n• সাধারণত ১ বার স্পাইকিং যথেষ্ট; তবে ৮–১০ সপ্তাহ ব্যবধানে ২ বারও করা যায়।\n• ৫৫ সপ্তাহের পর স্পাইকিং সাধারণত অর্থনৈতিকভাবে লাভজনক নয়。\n\n👉 পরিকল্পিত মেল স্পাইকিং ফার্টিলিটি ও হ্যাচেবিলিটি দীর্ঘ মেয়াদে সর্বোচ্চ রাখে।"
      ],
      keyPointsEn: [
        "1. Spike Male Specs: Minimum 25 weeks of age & minimum 4.0 kg body weight",
        "2. Spiking Ratio: Add +20% young males after reducing primary males to 6.5-7%",
        "3. Early Spiking Window: 30-32 weeks (Start with 6-7% ratio, expand to 8.5-10%)",
        "4. Post-Spike Feed & Cutoff: +2-3g feed/male/day; spiking beyond 55 wks not viable"
      ],
      keyPointsBn: [
        "১. স্পাইক মোরগের মানদণ্ড: সর্বনিম্ন ২৫ সপ্তাহ বয়স & অন্তত ৪.০ কেজি বডি ওয়েট",
        "২. স্পাইকিং অনুপাত: পুরানো মোরগ ৬.৫-৭% এ নামিয়ে নতুন +২০% স্পাইক মোরগ যোগ করা",
        "৩. আগাম স্পাইকিং সময়: ৩০-৩২ সপ্তাহে (শুরুতে ৬-৭% মেল অনুপাত রেখে পরে ৮.৫-১০% করা)",
        "৪. ফিড বৃদ্ধি & সীমা: স্পাইকিংয়ের পর +২-৩ গ্রাম ফিড/দিন; ৫৫ সপ্তাহের পর স্পাইকিং লাভজনক নয়"
      ],
    ),

    // 28. How to Spike & Expected Results
    BroilerPSArticleItem(
      id: "how_to_spike_expected_results",
      titleEn: "How to Spike & Expected Results.",
      titleBn: "মেল স্পাইকিং করার পদ্ধতি ও ফলাফল",
      subtitleBn: "মেল স্পাইকিং করার পদ্ধতি (How to Spike & Expected Results)",
      subtitleEn: "3 Spiking Methods, Expected Fertility Outcomes, Reserve Pen Specs & Biosecurity Protocol",
      snippetBn: "1️⃣ ৩টি পদ্ধতি (নতুন তরুণ মোরগ, ইন্টার-স্পাইকিং, ২৬ সপ্তাহের ভারী মোরগ), প্রত্যাশিত ফলাফল & বায়োসিকিউর স্পাইকিং...",
      snippetEn: "1️⃣ 3 spiking methods (fresh young, inter-spiking, 26-wk heavy males), outcomes & biosecure rules...",
      imagePath: "assets/ps_broiler.jpg",
      detailsEn: [
        "1️⃣ Method 1 – Fresh Young Male Addition:\n• Add fresh young males representing at least 20% of total house male population.\n• Spike males must be at least 25 weeks of age with a minimum body weight of ~4.0 kg (8.8 lbs).",
        "2️⃣ Method 2 – Inter-Spiking (Highly Recommended):\n• Move all quality primary males from one house/compartment to another house.\n• Place new spike males into the vacated house.\n👉 Minimizes territorial competition between primary and spike males while maximizing efficiency.",
        "3️⃣ Method 3 – 26-Week Heavy Male Utilization:\n• Separate heavy males at 26 weeks from a young parent flock (birds already experienced with feed/water and mating).\n• Move them into houses where primary males have been harvested or relocated.\n👉 Highly popular in 100% floor housing where 10-11% males can be kept up to 26 weeks without aggression.",
        "📊 Expected Results Post-Spiking (Points 1-3):\n• Fertility Peak: Peak fertility is achieved 2-3 weeks post-spiking; hatchability increases by 2-3%.\n• Mating Rejuvenation: Rejuvenates primary male mating activity for 6-8 weeks.\n• Temporary Aggression: Male competition increases for ~2 weeks post-introduction; minor mortality risk.",
        "⚠️ Limitations & Reserve Male Holding Pen Specs (Points 4-6):\n• Spiking does not fix underlying management flaws or overweight male issues.\n• Reserve Male Pen Specs: 3 males/m² (~3.5 ft²/male), ample feeders, drinkers, and hiding barriers.\n• Holding extra males in hen pens prior to spiking reduces hen receptivity.",
        "🛡️ Biosecure Spiking Protocol (Points 1-5):\n• Source males strictly from a single, disease-free origin flock.\n• Conduct serological screening 5-7 days prior to transfer for Mycoplasma, Avian Influenza (AI), TRT, Salmonella, and parasites.\n• Halt transfer if any suspect/positive results appear; transport birds in sanitized enclosed vehicles.\n\n👉 Biosecure spiking restores long-term flock fertility and hatchability safely."
      ],
      detailsBn: [
        "1️⃣ পদ্ধতি ১ – নতুন তরুণ মোরগ যোগ করাঃ\n• প্রতিটি হাউসে মোট মোরগের কমপক্ষে ২০% নতুন তরুণ মোরগ যোগ করতে হবে।\n• মোরগের বয়স কমপক্ষে ২৫ সপ্তাহ হতে হবে এবং বডি ওয়েট প্রায় ৪.০ কেজি (৮.৮ পাউন্ড) হতে হবে।",
        "2️⃣ পদ্ধতি ২ – ইন্টার-স্পাইকিং (Inter-Spiking - সর্বাধিক সুপারিশকৃত)ঃ\n• একটি হাউস/কম্পার্টমেন্ট থেকে ভালো প্রাথমিক মোরগ বের করে অন্য হাউসে ভাগ করে দেওয়া হয়।\n• যে হাউসে মোরগ থাকবে না, সেখানে নতুন স্পাইকিং মোরগ দেওয়া হয়।\n👉 এতে প্রাথমিক ও নতুন মোরগের মধ্যে প্রতিযোগিতা কমে এবং সর্বোচ্চ দক্ষতা নিশ্চিত হয়।",
        "3️⃣ পদ্ধতি ৩ – ভারী মোরগ ব্যবহার (২৬ সপ্তাহ)ঃ\n• তরুণ প্যারেন্ট স্টক থেকে ২৬ সপ্তাহ বয়সে ভারী মোরগ আলাদা করা হয় (যারা ইতিমধ্যে খাবার, পানি ও ম্যাটিং চেনে)।\n• তাদের এমন হাউসে দেওয়া হয় যেখান থেকে প্রাথমিক মোরগ সরানো হয়েছে।\n👉 ১০০% ফ্লোর অপারেশন ফার্মে এটি বিশেষ জনপ্রিয় (২৬ সপ্তাহ পর্যন্ত ১০–১১% পুরুষ রাখা যায়)।",
        "📊 প্রত্যাশিত ফলাফল (Expected Results) (১-৩)ঃ\n• ফার্টিলিটি বৃদ্ধি: ২–৩ সপ্তাহ পর সর্বোচ্চ ফার্টিলিটি অর্জিত হয় এবং হ্যাচেবিলিটি ২–৩% বাড়ে।\n• ম্যাটিং গতি: প্রাথমিক মোরগের ম্যাটিং গতি বাড়ে, যা ৬–৮ সপ্তাহ স্থায়ী হয়।\n• আক্রমণাত্মক আচরণ: প্রথম ২ সপ্তাহ সামান্য প্রতিযোগিতা ও মরটালিটি বাড়তে পারে।",
        "⚠️ সীমাবদ্ধতা & রিজার্ভ মোরগ সংরক্ষণ (৪-৬)ঃ\n• পূর্ববর্তী অব্যবস্থাপনা বা অতিরিক্ত মোটা মোরগের মূল সমস্যা স্পাইকিং সমাধান করে না।\n• রিজার্ভ মোরগ পেনে রাখতে হবে: ৩টি মোরগ/মি² (৩.৫ ft²/মোরগ), পর্যাপ্ত ফিডার-ড্রিংকার ও লুকানোর স্থান।\n• স্পাইকিংয়ের আগে অতিরিক্ত মোরগ একসাথে রাখলে হেনের গ্রহণযোগ্যতা (Receptivity) কমে যেতে পারে।",
        "🛡️ বায়োসিকিউর পদ্ধতিতে স্পাইকিং (Biosecure Spiking) (১-৫)ঃ\n• স্পাইকিং মোরগ অবশ্যই একক নির্দিষ্ট উৎস ফ্লক থেকে আসতে হবে।\n• স্থানান্তরের ৫–৭ দিন আগে সেরোলজিক্যাল পরীক্ষা (মাইকোপ্লাজমা, AI, TRT, সালমোনেলা, পরজীবী) করতে হবে।\n• পজিটিভ বা সন্দেহজনক ফল এলে স্থানান্তর স্থগিত রেখে বন্ধ গাড়িতে (Enclosed Vehicle) নিরাপদ পরিবহন করতে হবে।\n\n👉 সঠিক পরিকল্পনা ও বায়োসিকিউর স্পাইকিং ফার্টিলিটি ও হ্যাচেবিলিটি উল্লেখযোগ্যভাবে উন্নত করে।"
      ],
      keyPointsEn: [
        "1. 3 Spiking Methods: Fresh young males, Inter-spiking & 26-wk heavy males",
        "2. Expected Gains: Peak fertility in 2-3 wks; +2-3% hatchability for 6-8 wks",
        "3. Reserve Pen Density: 3 males/m² (~3.5 ft²/male) with hiding barriers",
        "4. Biosecurity Screening: Test 5-7 days prior for Mycoplasma, AI, TRT & Salmonella"
      ],
      keyPointsBn: [
        "১. ৩টি স্পাইকিং পদ্ধতি: নতুন কচি মোরগ, ইন্টার-স্পাইকিং & ২৬ সপ্তাহের ভারী মোরগ",
        "২. প্রত্যাশিত লাভ: ২-৩ সপ্তাহে ফার্টিলিটি পিক; ৬-৮ সপ্তাহের জন্য +২-৩% হ্যাচেবিলিটি",
        "৩. রিজার্ভ পেন ঘনত্ব: ৩ মোরগ/মি² (৩.৫ ft²/মোরগ) & লুকানোর স্থান",
        "৪. বায়োসিকিউরিটি স্ক্রীনিং: ৫-৭ দিন আগে মাইকোপ্লাজমা, AI, TRT & সালমোনেলা টেস্ট"
      ],
    ),

    // 29. Intra-Spiking of Male
    BroilerPSArticleItem(
      id: "intra_spiking_of_male",
      titleEn: "Intra-Spiking of Male.",
      titleBn: "ইন্ট্রা-স্পাইকিং (মোরগ অদলবদল)",
      subtitleBn: "ইন্ট্রা-স্পাইকিং (Intra-Spiking of Male)",
      subtitleEn: "Swapping 25-30% Primary Males Between Pens/Houses for Low-Risk Fertility Persistency",
      snippetBn: "1️⃣ ২৫-৩০% মেল অদলবদল, ৪০ & ৪৮ সপ্তাহে উপযুক্ত সময়, ৬-৮ সপ্তাহ ম্যাটিং উদ্দীপনা, বায়োসিকিউরিটি ঝুঁকিমুক্ত...",
      snippetEn: "1️⃣ 25-30% male swap between pens, ideal at 40 & 48 wks, 6-8 wks mating boost, zero biosecurity risk...",
      imagePath: "assets/ps_broiler.jpg",
      detailsEn: [
        "📌 Definition of Intra-Spiking:\nIntra-Spiking refers to swapping 25-30% of primary roosters between different pens or houses on the same farm.\nNo outside young males are introduced, yet changing environment creates fresh stimulation and rejuvenates mating activity.",
        "1️⃣ Optimal Timing for Intra-Spiking:\n• Best results are achieved when performed prior to 45 weeks of age.\n• Performing intra-spiking twice—specifically at 40 weeks and 48 weeks of age—yields peak fertility persistency.",
        "2️⃣ Rejuvenation Duration & 3️⃣ Key Advantages:\n• Mating activity increases significantly post-swap and persists for 6-8 weeks.\n• Key Advantage: Transferred males are already mature, experienced, and equal in body weight; they compete evenly without initial sexual hesitation.",
        "4️⃣ Temporary Aggression Behavior:\n• Male territorial aggression increases slightly during the first 2 weeks after swapping.\n• Mortality impact on roosters or hens is negligible under proper management.",
        "5️⃣ Impact on Hatchability & 6️⃣ Operational Benefits:\n• While immediate hatchability spikes are modest, hatchability persistency is greatly extended. Two intra-spikings can boost total hatchability by 1.0-1.5%.\n• Operational Advantages: Cost-effective, easy to execute, and carries zero biosecurity breach risk.\n\n👉 Intra-spiking serves as an excellent low-cost, zero-risk alternative or supplement to traditional male spiking."
      ],
      detailsBn: [
        "📌 ইন্ট্রা-স্পাইকিং (Intra-Spiking) পরিচিতিঃ\nইন্ট্রা-স্পাইকিং বলতে একই ফার্মের বিভিন্ন হাউসের মধ্যে ২৫–৩০% প্রাথমিক মোরগ অদলবদল করা বোঝায়।\nএখানে নতুন তরুণ মোরগ আনা হয় না, কিন্তু ঘর অদলবদলের ফলে নতুন উদ্দীপনা তৈরি হয় এবং ম্যাটিং কার্যক্রম পুনরুজ্জীবিত হয়।",
        "1️⃣ ইন্ট্রা-স্পাইকিংয়ের উপযুক্ত সময়ঃ\n• স্পাইকিংয়ের মতোই এটি ৪৫ সপ্তাহের আগে করলে বেশি ভালো ফল পাওয়া যায়।\n• বিশেষ করে ৪০ এবং ৪৮ সপ্তাহ বয়সে অদলবদল করলে সবচেয়ে কার্যকর ফল পাওয়া যায়।",
        "2️⃣ ম্যাটিং কার্যক্রম বৃদ্ধি & 3️⃣ প্রধান সুবিধাঃ\n• অদলবদলের পর ম্যাটিং কার্যক্রম উল্লেখযোগ্যভাবে বাড়ে, যার প্রভাব ৬–৮ সপ্তাহ স্থায়ী হয়।\n• সুবিধা: মোরগগুলো ইতিমধ্যেই অভিজ্ঞ, সমান ওজন ও যৌন পরিপক্বতাসম্পন্ন; তাই তারা সহজেই স্থানান্তরিত ঘরে মানিয়ে নেয়।",
        "4️⃣ সাময়িক আক্রমণাত্মক আচরণঃ\n• অদলবদলের পর প্রথম ২ সপ্তাহ মোরগের প্রতিযোগিতা ও আক্রমণাত্মক আচরণ কিছুটা বাড়তে পারে।\n• তবে এতে মোরগ বা মুরগীর মৃত্যুহারের বড় কোনো সমস্যা ঘটে না।",
        "5️⃣ হ্যাচেবিলিটির প্রভাব & 6️⃣ সার্বিক সুবিধাসমূহঃ\n• হঠাৎ হ্যাচেবিলিটি বেশি না বাড়লেও উৎপাদনের স্থায়িত্ব (Persistency) উন্নত হয়। দুইবার ইন্ট্রা-স্পাইকিং করলে মোট হ্যাচেবিলিটি ১–১.৫% বাড়ে।\n• সার্বিক সুবিধা: অত্যন্ত সাশ্রয়ী, সহজে প্রয়োগযোগ্য এবং সবচেয়ে বড় বিষয়—বাইরে থেকে পাখি না আনায় বায়োসিকিউরিটি ঝুঁকি শূন্য।\n\n👉 তাই অনেক ফার্মে স্পাইকিংয়ের বিকল্প বা পরিপূরক হিসেবে ইন্ট্রা-স্পাইকিং সফলভাবে প্রয়োগ করা হয়।"
      ],
      keyPointsEn: [
        "1. Intra-Spiking Concept: Swap 25-30% primary males between houses on same farm",
        "2. Optimal Windows: Best done at 40 & 48 weeks of age (<45 wks limit)",
        "3. Duration: Mating boost lasts 6-8 weeks with experienced, weight-matched males",
        "4. Advantage: Low cost, easy execution, zero biosecurity risk, +1-1.5% hatchability persistency"
      ],
      keyPointsBn: [
        "১. ইন্ট্রা-স্পাইকিং ধারণা: একই ফার্মের ঘরের মধ্যে ২৫-৩০% মোরগ অদলবদল করা",
        "২. উপযুক্ত সময়: ৪০ ও ৪৮ সপ্তাহ বয়সে অদলবদল করা (৪৫ সপ্তাহের আগে সেরা)",
        "৩. স্থায়িত্ব: অভিজ্ঞ ও সমান ওজনের মোরগ দিয়ে ৬-৮ সপ্তাহ ম্যাটিং চাঙ্গা থাকা",
        "৪. সুবিধাসমূহ: শূন্য বায়োসিকিউরিটি ঝুঁকি, অত্যন্ত সাশ্রয়ী & +১-১.৫% হ্যাচেবিলিটি স্থায়িত্ব"
      ],
    ),

    // 30. Egg Handling in the Breeder Farm
    BroilerPSArticleItem(
      id: "egg_handling_breeder_farm",
      titleEn: "Egg Handling in the Breeder Farm.",
      titleBn: "ব্রিডার ফার্মে ডিম ব্যবস্থাপনা",
      subtitleBn: "ব্রিডার ফার্মে ডিম ব্যবস্থাপনা (Egg Handling in the Breeder Farm)",
      subtitleEn: "16 Protocols for Collection, Cooling (6h to 22-25°C), Sharp End Down Traying & Storage",
      snippetBn: "1️⃣ দিনে ৪ বার ডিম সংগ্রহ, ৬ ঘন্টায় ২২-২৫°C এ কুলিং, তীক্ষ্ণ দিক নিচে (sharp end down) রেখে ট্রেয়িং...",
      snippetEn: "1️⃣ Collect 4x/day, cool to 22-25°C in 6 hrs, tray sharp end down & store with calibrated RH/temp...",
      imagePath: "assets/ps_broiler.jpg",
      detailsEn: [
        "1️⃣ Nest Space, 2️⃣ Light/Draft Shielding & 3️⃣ Nest Hygiene:\n• Ensure sufficient, comfortable, and readily accessible nest space.\n• Shield nest boxes from direct light entry and cold air drafts.\n• Maintain strict nest sanitation with deep nest hygiene checks at least once weekly.",
        "4️⃣ Hand Hygiene, 5️⃣ Collection Schedule (4x Daily) & 6️⃣ Shock Mitigation:\n• Wash and sanitize hands thoroughly prior to each egg collection round.\n• Collect eggs from nests at least 4 times per day.\n• Avoid physical shocks and vibration during collection and transit to protect fragile embryos and shell integrity.",
        "7️⃣ 6-Hour Cooling Process (41°C → 22-25°C) & 8️⃣ Cooling Speed:\n• Gradually cool internal egg temperature from hen body temp 41°C (106°F) down to 22-25°C (72-77°F) over a 6-hour window.\n• Avoid cooling eggs too rapidly or too slowly.",
        "9️⃣ Sorting, 🔟 Recordkeeping & 1️⃣1️⃣ Traying (Sharp End Down):\n• Segregate hatching eggs, non-hatching eggs, floor eggs, double yolks, and cracked eggs.\n• Record daily counts by category.\n• Always set hatching eggs into trays with the sharp end pointing down.",
        "1️⃣2️⃣ Boxing, 1️⃣3️⃣ Storage Room, 1️⃣4️⃣ Climate Control, 1️⃣5️⃣ Daily Monitoring & 1️⃣6️⃣ Calibration:\n• Pack trayed eggs into boxes once cooled to 22-25°C and transfer to the farm egg holding room.\n• Maintain recommended temperature and relative humidity in the egg store.\n• Monitor ambient metrics daily and regularly calibrate thermometers and hygrometers against certified standards.\n\n👉 Rigorous egg handling preserves embryo viability, hatchability, and chick quality."
      ],
      detailsBn: [
        "1️⃣ নেস্ট স্পেস, 2️⃣ সরাসরি আলো/বাতাস রোধ & 3️⃣ নেস্ট হাইজিনঃ\n• পর্যাপ্ত ও আরামদায়ক নেস্ট স্পেস নিশ্চিত করতে হবে।\n• নেস্টের ভেতরে সরাসরি আলো বা ঠান্ডা বাতাস (draught) প্রবেশ নিষিদ্ধ।\n• নেস্ট পরিচ্ছন্ন রাখতে হবে এবং সপ্তাহে অন্তত ১ বার নেস্ট হাইজিন স্পেশাল ক্লিন করতে হবে।",
        "4️⃣ হাত ধোয়া, 5️⃣ সংগ্রহ সূচি (৪ বার) & 6️⃣ ঝাঁকুনি এড়ানোঃ\n• প্রতিবার ডিম সংগ্রহের পূর্বে হাত জীবাণুমুক্ত করতে হবে।\n• দিনে কমপক্ষে ৪ বার নেস্ট থেকে ডিম সংগ্রহ করতে হবে।\n• ডিম সংগ্রহ ও পরিবহনে ঝাঁকুনি/আঘাত এড়াতে হবে (যাতে ভ্রূণ ক্ষতি ও সূক্ষ্ম ফাটল না হয়)।",
        "7️⃣ ৬ ঘণ্টার কুলিং প্রক্রিয়া (৪১°C → ২২–২৫°C) & 8️⃣ কুলিং গতিঃ\n• ডিম মুরগির বডি টেম্পারেচার ৪১°C (১০৬°F) থেকে প্রায় ৬ ঘণ্টার মধ্যে ধীরে ধীরে কমিয়ে ২২–২৫°C (৭২–৭৭°F) এ আনতে হবে।\n• ডিম খুব দ্রুত বা খুব ধীর গতিতে ঠান্ডা করা উচিত নয়।",
        "9️⃣ ডিম আলাদা করা, 🔟 দৈনিক রেকর্ড & 1️⃣1️⃣ ট্রেয়িং (Sharp End Down)ঃ\n• হ্যাচিং, নন-হ্যাচিং, ফ্লোর এগ, ডাবল ইয়োল্ক ও ফাটা ডিম আলাদা করে দৈনিক সংখ্যা রেকর্ড করতে হবে।\n• হ্যাচিং ডিম ট্রেতে সবসময় তীক্ষ্ণ দিক নিচে (sharp end down) রেখে সেট করতে হবে।",
        "1️⃣2️⃣ বক্সে রাখা, 1️⃣3️⃣ স্টোরেজ রুম, 1️⃣4️⃣ পরিবেশ, 1️⃣5️⃣ মনিটরিং & 1️⃣6️⃣ ক্যালিব্রেশনঃ\n• ২২–২৫°C এ ঠান্ডা হওয়ার পর ট্রেগুলো বক্সে ভরে এগ স্টোরেজ রুমে রাখতে হবে।\n• স্টোরেজ রুমের তাপমাত্রা ও আর্দ্রতা প্রতিদিন মেপে রেকর্ড করতে হবে।\n• থার্মোমিটার ও হাইগ্রোমিটার স্ট্যান্ডার্ড ক্যালিব্রেটেড মিটার দিয়ে নিয়মিত যাচাই করতে হবে。\n\n👉 সঠিক ডিম ব্যবস্থাপনা হ্যাচেবিলিটি ও বাচ্চার কোয়ালিটি রক্ষা করে।"
      ],
      keyPointsEn: [
        "1. Collection & Cooling: Collect >=4x daily; cool 41°C to 22-25°C over 6 hours",
        "2. Traying Rule: Set hatching eggs with sharp end down in trays",
        "3. Sorting & Records: Separate floor eggs, double yolks, cracks; track daily counts",
        "4. Storage Control: Keep egg room temp & RH regulated; calibrate thermo/hygrometers"
      ],
      keyPointsBn: [
        "১. ডিম সংগ্রহ & কুলিং: দিনে অন্তত ৪ বার ডিম সংগ্রহ; ৬ ঘন্টায় ৪১°C থেকে ২২-২৫°C এ আনা",
        "২. ট্রেয়িং নিয়ম: ট্রেতে হ্যাচিং ডিম সবসময় তীক্ষ্ণ দিক নিচে (sharp end down) রাখা",
        "৩. ছাঁটাই & রেকর্ড: ফ্লোর এগ, ডাবল ইয়োল্ক ও ফাটা ডিম আলাদা করা & দৈনিক হিসাব রাখা",
        "৪. স্টোরেজ নিয়ন্ত্রণ: স্টোরেজ রুমের তাপমাত্রা/আর্দ্রতা মনিটর করা & হাইগ্রোমিটার ক্যালিব্রেশন"
      ],
    ),

    // 31. Egg Weighing Management
    BroilerPSArticleItem(
      id: "egg_weighing_management",
      titleEn: "Egg Weighing Management.",
      titleBn: "ডিমের ওজন পরিমাপ",
      subtitleBn: "ডিমের ওজন পরিমাপ (Egg Weighing)",
      subtitleEn: "Sampling 90 Eggs, Underweight & Overweight Causes, Size Factors & Ideal 70g Weight Cap",
      snippetBn: "1️⃣ ২য় সংগ্রহের পর ৯০টি ডিম স্কেলিং, কম/বেশি ওজনের ৭+৪ কারণ, ৭০ গ্রাম সীমার উপরে হ্যাচেবিলিটি হ্রাস...",
      snippetEn: "1️⃣ Weigh >=90 eggs after 2nd collection; spot under/overweight causes; cap avg weight <70g...",
      imagePath: "assets/ps_broiler.jpg",
      detailsEn: [
        "1️⃣ Egg Weighing Procedure & Sampling (>=90 Eggs):\n• Usually weigh eggs after the second collection (mid-morning).\n• Sample and weigh at least 90 eggs per flock.\n⚠️ Exclude from weighing: Double yolk eggs, misshapen eggs, very small eggs, and cracked eggs.\n👉 Plotting daily average egg weight on graphs enables rapid detection of flock problems.",
        "2️⃣ Causes of Underweight Eggs (7 Key Causes):\n• Underfeeding / insufficient feed allocation\n• Low energy or protein density in feed\n• Inadequate water supply / restricted flow\n• Disease outbreaks / health challenges\n• Extreme high house temperature (heat stress)\n• Underweight birds / poor body weight uniformity\n• Abnormally high production rate",
        "3️⃣ Causes of Overweight Eggs (4 Key Causes):\n• Overfeeding / excessive ration allocation\n• Excessively high energy or protein in feed\n• Overweight / obese hens\n• Abnormally low production rate",
        "4️⃣ Key Factors Determining Egg Size & 5️⃣ Delayed Lighting Effect:\n• Factors: Body weight at photostimulation, bird development during 21-25 weeks, and hens becoming overweight post-peak.\n• Delayed Light Stimulation: Delaying light stimulation results in larger eggs right from the start and throughout the entire laying cycle.",
        "6️⃣ Ideal Egg Weight Goal (<70g) & 7️⃣ Problems with Oversized Eggs (>70g):\n• Ideal Target: Maintain average egg weight below 70g (2.47 oz) for as long as possible.\n• Oversized Egg Hazard: Eggs exceeding 70g suffer from reduced hatchability, depressing whole flock hatchability (a primary cause of rapid hatch decline post 50 weeks).\n\n👉 Routine egg weight monitoring ensures timely feed adjustments, maintaining peak hatchability and egg quality."
      ],
      detailsBn: [
        "1️⃣ ডিম ওজন করার পদ্ধতি & স্যাম্পলিং (৯০টি ডিম)ঃ\n• সাধারণত দ্বিতীয়বার ডিম সংগ্রহের পর (মাঝ সকাল) ডিম ওজন করা উচিত।\n• প্রতিবার কমপক্ষে ৯০টি ডিম ওজন করতে হবে।\n⚠️ ওজনের সময় বাদ দিতে হবে: ডাবল ইয়োল্ক, বিকৃত (misshapen), খুব ছোট ও ফাটা ডিম।\n👉 ডিমের দৈনিক গড় ওজন গ্রাফে প্লট করলে সম্ভাব্য ফ্লক সমস্যা দ্রুত শনাক্ত করা যায়।",
        "2️⃣ কম ওজনের ডিমের কারণ (Underweight Eggs) (৭টি কারণ)ঃ\n• পর্যাপ্ত ফিড না দেওয়া\n• ফিডে কম এনার্জি বা প্রোটিন\n• পানির অপর্যাপ্ত সরবরাহ\n• রোগ বা স্বাস্থ্য সমস্যা\n• হাউসের চরম তাপমাত্রা (হিট স্ট্রেস)\n• কম ওজনের মুরগী\n• খুব বেশি উৎপাদন হার",
        "3️⃣ বেশি ওজনের ডিমের কারণ (Overweight Eggs) (৪টি কারণ)ঃ\n• অতিরিক্ত ফিড দেওয়া\n• ফিডে বেশি এনার্জি বা প্রোটিন\n• অতিরিক্ত ওজনের মুরগী\n• কম উৎপাদন হার",
        "4️⃣ ডিমের আকার নির্ধারণের কারণ & 5️⃣ দেরিতে লাইট দেওয়ার প্রভাবঃ\n• ডিমের আকার নির্ভর করে: ফটোস্টিমুলেশনের সময় মুরগীর বডি ওয়েট, ২১–২৫ সপ্তাহ বয়সে বার্ডের উন্নয়ন এবং পিকের পর মুরগী অতিরিক্ত মোটা হয়ে যাওয়া।\n• দেরিতে লাইট দিলে: লাইট স্টিমুলেশন দেরিতে দিলে শুরু থেকেই ডিম বড় হয় এবং পুরো উৎপাদনকালেই বড় ডিম পাওয়া যায়।",
        "6️⃣ আদর্শ ডিমের ওজন (৭০ গ্রাম) & 7️⃣ বেশি বড় ডিমের সমস্যা (>৭০ গ্রাম)ঃ\n• আদর্শ লক্ষ্য: যতদিন সম্ভব গড় ডিমের ওজন ৭০ গ্রাম (২.৪৭ আউন্স) এর নিচে রাখার চেষ্টা করা উচিত।\n• অতিরিক্ত বড় ডিমের সমস্যা: ৭০ গ্রাম এর বেশি ডিমে হ্যাচেবিলিটি কমে যায়, যা পুরো ফ্লকের গড় হ্যাচেবিলিটি কমায় (বিশেষ করে ৫০ সপ্তাহের পর হ্যাচ দ্রুত কমে যাওয়ার অন্যতম কারণ এটি)।\n\n👉 দৈনিক ডিমের ওজন মনিটরিং সঠিক ফিড ব্যবস্থাপনা ও সর্বোচ্চ হ্যাচেবিলিটি বজায় রাখতে অপরিহার্য।"
      ],
      keyPointsEn: [
        "1. Weighing SOP: Weigh >=90 eggs after 2nd collection; exclude double yolk/cracked/misshapen eggs",
        "2. Underweight Causes: Underfeeding, low energy/protein, water restriction, disease, heat stress",
        "3. Overweight Causes: Overfeeding, high energy/protein, overweight hens, low production",
        "4. Ideal Weight Cap: Keep avg egg weight <70g (2.47 oz); >70g drops post-50 wk hatchability"
      ],
      keyPointsBn: [
        "১. ওজন পদ্ধতি: ২য় সংগ্রহের পর ৯০টি ডিম স্কেলিং; ডাবল ইয়োল্ক/ফাটা/বিকৃত ডিম বাদ দেওয়া",
        "২. কম ওজনের কারণ: ফিড ঘাটতি, কম এনার্জি/প্রোটিন, পানি সমস্যা, রোগ, হিট স্ট্রেস ও কম ওজনের মুরগী",
        "৩. বেশি ওজনের কারণ: ওভারফিডিং, হাই এনার্জি/প্রোটিন, মোটা মুরগী ও কম উৎপাদন হার",
        "৪. আদর্শ ওজন সীমা: গড় ডিমের ওজন ৭০ গ্রাম (২.৪৭ oz) এর নিচে রাখা; >৭০ গ্রাম ডিমে ৫০ সপ্তাহের পর হ্যাচিং কমে"
      ],
    ),

    // 32. Egg Collection Management
    BroilerPSArticleItem(
      id: "egg_collection_management",
      titleEn: "Egg Collection Management.",
      titleBn: "ডিম সংগ্রহ ব্যবস্থাপনা",
      subtitleBn: "ডিম সংগ্রহ ব্যবস্থাপনা (Egg Collection)",
      subtitleEn: "10 Protocols for Nest Cleanliness, 4-6x Daily Collection, Floor Egg Rules & Nest Closure SOP",
      snippetBn: "1️⃣ দিনে ৪-৬ বার ডিম সংগ্রহ, ৪০-৫০ হাজার জীবিত কোষ সুরক্ষা, ফ্লোর এগ আলাদাকরণ, ট্রে সর্বোচ্চ ৩ স্তর...",
      snippetEn: "1️⃣ Collect 4-6x daily; protect 40-50k embryo cells; segregate floor eggs; stack trays max 3 tiers...",
      imagePath: "assets/ps_broiler.jpg",
      detailsEn: [
        "📌 Embryo Viability & Core Objective:\nA fertile egg contains 40,000-50,000 live cells at lay. Hatchability can only be preserved post-lay—never improved. Improper handling rapidly destroys embryonic potential.",
        "1️⃣ Nest Cleanliness & 2️⃣ Floor Egg Walking Strategy:\n• Maintain clean manual nests with fresh, dry wood shavings; remove feces or broken eggs immediately and avoid overfilling.\n• Walk frequently through onset laying flocks to discourage corner laying and guide hens into nest boxes.",
        "3️⃣ Collection Frequency (4-6x Daily) & 4️⃣ Egg Cooling Benefit:\n• Collect eggs at least 4 times per day; increase to 6 times daily during peak production.\n• Cool eggs quickly to storage temperature to halt pre-incubation and early embryo development, drastically reducing Early Dead Germ (EDG) and boosting hatchability.",
        "5️⃣ Mechanical Nest SOP, 6️⃣ Floor Egg Rules & 7️⃣ Sanitation:\n• Schedule mechanical belt collections mainly in the morning; keep afternoons for house maintenance.\n• NEVER return floor eggs to nests; collect, pack, and set floor eggs in separate incubators.\n• Sanitize hands before/after each collection and after handling floor eggs.",
        "8️⃣ Shock/Breakage Prevention, 9️⃣ Belt Conveyor SOP & 🔟 Nest Closure SOP:\n• Handle eggs gently using plastic/fiber trays stacked up to MAX 3 TIERS; NEVER use baskets or buckets.\n• Prevent egg pile-ups on belt collection tables and adjust belt speed to operator comfort.\n• Nest Closure: Manual (close lower nests before last round, upper nests after); Automatic Community (open 1 hour before lights ON, close 1 hour before lights OFF).\n\n👉 Proper egg collection maximizes hatchability, chick quality, and overall breeder farm profitability."
      ],
      detailsBn: [
        "📌 ভ্রূণের জীবনক্ষমতা & মূল উদ্দেশ্যঃ\nএকটি উর্বর ডিমে প্রায় ৪০,০০০–৫০,০০০ জীবিত কোষ থাকে। ডিম পাড়ার পর হ্যাচিং ক্ষমতা সংরক্ষণ করা যায়, তবে বাড়ানো যায় না। ভুল পরিচালনায় হ্যাচিং সম্ভাবনা দ্রুত কমে।",
        "1️⃣ নেস্ট পরিচ্ছন্নতা & 2️⃣ ফ্লোর এগ কমানোর কৌশলঃ\n• ম্যানুয়াল নেস্টে পরিষ্কার কাঠের গুঁড়া/শেভিংস ব্যবহার করতে হবে; মল ও ফাটা ডিম দ্রুত সরিয়ে নতুন পরিষ্কার উপাদান দিতে হবে।\n• ডিম পাড়া শুরু করা ফ্লকে নিয়মিত হেঁটে কোণায় ডিম দেওয়ার চেষ্টা করা মুরগিকে নেস্টে উৎসাহিত করতে হবে।",
        "3️⃣ ডিম সংগ্রহের সংখ্যা (৪-৬ বার) & 4️⃣ ডিম ঠান্ডা করার উপকারিতাঃ\n• দিনে কমপক্ষে ৪ বার ডিম সংগ্রহ করতে হবে; পিক প্রোডাকশনে ৬ বার সংগ্রহ করা উত্তম।\n• নিয়মিত ডিম সংগ্রহ করে স্টোরেজ তাপমাত্রায় ঠান্ডা করলে প্রি-ইনকিউবেশন ও ভ্রূণের আগাম বিকাশ বন্ধ হয়, ফলে Early Dead Germ কমে ও হ্যাচেবিলিটি বাড়ে।",
        "5️⃣ মেকানিক্যাল নেস্ট সূচি, 6️⃣ ফ্লোর এগ নিয়ম & 7️⃣ স্বাস্থ্যবিধিঃ\n• মেকানিক্যাল নেস্টে সকালে অধিকাংশ ডিম সংগ্রহ শেষ করে বিকেলে হাউসের মেরামত ও ব্যবস্থাপনা সম্পন্ন করতে হবে।\n• ফ্লোর এগ কোনো অবস্থাতেই নেস্টে ফেরত দেওয়া যাবে না; আলাদা সংগ্রহ, প্যাকিং ও মেশিনে সেট করতে হবে।\n• প্রতিবার ডিম সংগ্রহ ও ফ্লোর এগ ধরার আগে-পরে হাত ভালোভাবে জীবাণুমুক্ত করতে হবে।",
        "8️⃣ ফাটল প্রতিরোধ, 9️⃣ বেল্ট সিস্টেম & 🔟 নেস্ট বন্ধ করার নিয়মঃ\n• প্লাস্টিক/ফাইবার ট্রে সর্বোচ্চ ৩ স্তর (tier) পর্যন্ত বহন করা যাবে; বালতি বা ঝুড়ি ব্যবহার নিষিদ্ধ।\n• মেকানিক্যাল বেল্টে সংগ্রহ টেবিলে ডিম জমতে না দিয়ে স্বাচ্ছন্দ্যদায়ক বেল্ট গতি বজায় রাখতে হবে।\n• নেস্ট বন্ধের নিয়ম: ম্যানুয়াল (শেষ সংগ্রহের আগে নিচের ও পরে উপরের নেস্ট বন্ধ); অটোমেটিক (লাইট জ্বলার ১ ঘণ্টা আগে খোলা & বন্ধের ১ ঘণ্টা আগে বন্ধ)।\n\n👉 সঠিক ডিম সংগ্রহ পদ্ধতি হ্যাচেবিলিটি, বাচ্চার মান ও ব্রিডার ফার্মের উৎপাদন দক্ষতা উল্লেখযোগ্যভাবে উন্নত করে।"
      ],
      keyPointsEn: [
        "1. Frequency & Embryo Cell: Protect 40-50k live cells; collect 4x daily (6x during peak lay)",
        "2. Floor Eggs: Never put floor eggs back into nests; collect/pack/incubate in separate units",
        "3. Handling SOP: Stack plastic/fiber trays max 3 tiers; NEVER use baskets or buckets",
        "4. Nest Closure: Manual (close lower before last round, upper after); Auto (open -1h light ON, close -1h light OFF)"
      ],
      keyPointsBn: [
        "১. সংগ্রহের সংখ্যা & ভ্রূণ সেল: ৪০-৫০ হাজার জীবিত কোষ সুরক্ষা; দিনে ৪ বার (পিকে ৬ বার) ডিম সংগ্রহ",
        "২. ফ্লোর এগ নিয়ম: ফ্লোর এগ নেস্টে ফেরত না দেওয়া; আলাদা সংগ্রহ, প্যাকিং & সেটিং করা",
        "৩. হ্যান্ডলিং নিয়ম: প্লাস্টিক/ফাইবার ট্রে সর্বোচ্চ ৩ স্তর (tier) বহন; ঝুড়ি/বালতি সম্পূর্ণ নিষিদ্ধ",
        "৪. নেস্ট বন্ধের নিয়ম: ম্যানুয়াল (শেষের আগে নিচে, পরে উপরে); অটোমেটিক (লাইট ON-এর ১ঘ আগে খোলা, OFF-এর ১ঘ আগে বন্ধ)"
      ],
    ),

    // 33. Egg Grading Management
    BroilerPSArticleItem(
      id: "egg_grading_management",
      titleEn: "Egg Grading Management.",
      titleBn: "ডিম গ্রেডিং ব্যবস্থাপনা",
      subtitleBn: "ডিম সংগ্রহ ও গ্রেডিং (Egg Grading)",
      subtitleEn: "Cull Criteria (6 Types), Sharp End Down Traying, 40-Wk Nest Pad Clean & Stage-1 Cooling Room",
      snippetBn: "1️⃣ ৬টি অনুপযুক্ত ডিম বাতিল, ট্রেতে তীক্ষ্ণ দিক নিচে রাখা, ৪০ সপ্তাহে নেস্ট প্যাড ওয়াশ, রাতে নেস্ট বন্ধ...",
      snippetEn: "1️⃣ Cull 6 non-hatch egg types; tray sharp end down; wash nest pads at 40 wks; stage-1 cool room...",
      imagePath: "assets/ps_broiler.jpg",
      detailsEn: [
        "1️⃣ Grading Precautions & 2️⃣ Non-Hatching Egg Cull Criteria (6 Types):\n• Exercise extreme caution during egg grading to prevent micro-cracks or damage to hatching eggs.\n• Cull the following non-hatchable eggs immediately:\n  - Dirty eggs (per company policy)\n  - Cracked eggs\n  - Undersized / very small eggs\n  - Double yolk or oversized eggs\n  - Poor shell quality (thin, rough, or porous shells)\n  - Misshapen or abnormal shell shape eggs",
        "3️⃣ Rejected Egg Storage & 4️⃣ Tray Setting SOP (Sharp End Down):\n• Store rejected eggs strictly separate and away from prime hatching eggs.\n• Always set hatching eggs into trays or setter flats with the sharp end pointing down.",
        "5️⃣ Handling Room Hygiene & 6️⃣ Nest Pad Maintenance (40 Weeks):\n• Maintain the egg handling room in a clean, disinfected, and organized state.\n• Clean automatic nest pads regularly; washing nest pads at 40 weeks of age is a vital best practice.",
        "7️⃣ Night Nest Closure & 8️⃣ Pest Control SOP:\n• Close individual manual nests and community nests at night to prevent hens from roosting inside and dirtying nest pads.\n• Implement strict rodent and pest control programs in the egg handling and holding rooms.",
        "9️⃣ Handling Room Thermal Profile (Stage-1 Cooling):\n• The egg handling room functions as the first cooling step for eggs.\n• Ambient Temperature: Must be cooler than the laying house, but slightly warmer than the primary egg storage room.\n\n👉 Meticulous egg grading and environmental management drastically improve hatchability and chick quality."
      ],
      detailsBn: [
        "1️⃣ ডিম গ্রেডিংয়ের সতর্কতা & 2️⃣ হ্যাচিংয়ের জন্য অনুপযুক্ত ডিম (৬টি শ্রেণি)ঃ\n• ডিম গ্রেডিংয়ের সময় অত্যন্ত সতর্ক থাকতে হবে যাতে হ্যাচিং ডিমের কোনো সূক্ষ্ম ক্ষতি না হয়।\n• নিম্নোক্ত ডিমগুলো হ্যাচিং ক্ষেত্র থেকে বাতিল করতে হবে:\n  - ময়লা ডিম (কোম্পানির নীতি অনুযায়ী)\n  - ফাটা ডিম\n  - খুব ছোট ডিম (হ্যাচারি পলিসি অনুযায়ী)\n  - খুব বড় বা ডাবল ইয়োল্ক ডিম\n  - খারাপ খোসা (Thin/rough/poor shell quality)\n  - বিকৃত বা অস্বাভাবিক আকারের ডিম",
        "3️⃣ বাতিল ডিম সংরক্ষণ & 4️⃣ ডিম ট্রেতে রাখার নিয়ম (Sharp End Down)ঃ\n• বাতিল ডিম অবশ্যই মূল হ্যাচিং ডিম থেকে সম্পূর্ণ আলাদা স্থানে সংরক্ষণ করতে হবে।\n• হ্যাচিং ডিম ট্রেতে রাখার সময় সবসময় তীক্ষ্ণ দিক নিচের দিকে (sharp end down) রেখে সেট করতে হবে।",
        "5️⃣ এগ হ্যান্ডলিং রুম পরিচ্ছন্নতা & 6️⃣ নেস্ট প্যাড ওয়াশ (৪০ সপ্তাহ)ঃ\n• ডিম হ্যান্ডলিং রুম সবসময় সম্পূর্ণ পরিষ্কার, জীবাণুমুক্ত ও গোছানো রাখতে হবে।\n• অটোমেটিক নেস্টের নেস্ট প্যাড পরিষ্কার রাখতে হবে; বিশেষ করে ৪০ সপ্তাহ বয়সে নেস্ট প্যাড পরিষ্কার করা অতি উত্তম অভ্যাস।",
        "7️⃣ রাতে নেস্ট বন্ধ রাখা & 8️⃣ কীটপতঙ্গ নিয়ন্ত্রণঃ\n• ম্যানুয়াল ও কমিউনিটি নেস্ট রাতে বন্ধ রাখতে হবে, যাতে মুরগী নেস্টে ঘুমাতে না পারে এবং নেস্ট প্যাড মলদ্বারা ময়লা না হয়।\n• এগ স্টোর ও হ্যান্ডলিং রুমে ইঁদুর, মাছি ও অন্যান্য ক্ষতিকর প্রাণী নিয়ন্ত্রণে নিয়মিত পদক্ষেপ নিতে হবে।",
        "9️⃣ এগ হ্যান্ডলিং রুমের তাপমাত্রা (কুলিংয়ের ১ম ধাপ)ঃ\n• এগ হ্যান্ডলিং রুম হলো ডিম ঠান্ডা হওয়ার প্রথম ধাপ।\n• তাপমাত্রা নিয়ন্ত্রণ: এটি লেয়িং হাউসের তুলনায় ঠান্ডা হতে হবে, তবে এগ স্টোরেজ রুমের তুলনায় কিছুটা উষ্ণ থাকতে হবে।\n\n👉 সঠিক ডিম গ্রেডিং ও রুম পরিবেশ হ্যাচেবিলিটি বৃদ্ধি এবং প্রিমিয়াম মানের বাচ্চা নিশ্চিত করে।"
      ],
      keyPointsEn: [
        "1. Cull 6 Egg Types: Dirty, cracked, small, double-yolk, poor shell, misshapen eggs",
        "2. Setting Rule: Set hatching eggs with sharp end down; segregate culls away from egg room",
        "3. Hygiene & Pads: Wash automatic nest pads at 40 weeks; close nests at night to keep pads clean",
        "4. Handling Room Temp: Stage-1 cooling (cooler than lay house, warmer than egg store)"
      ],
      keyPointsBn: [
        "১. ৬ ধরনের ডিম বাতিল: ময়লা, ফাটা, ছোট, ডাবল ইয়োল্ক, পাতলা খোসা ও বিকৃত আকারের ডিম",
        "২. সেটিং নিয়ম: ট্রেতে তীক্ষ্ণ দিক নিচে (sharp end down) রাখা; বাতিল ডিম আলাদা রাখা",
        "৩. হাইজিন & নেস্ট প্যাড: ৪০ সপ্তাহে অটো নেস্ট প্যাড পরিষ্কার করা; রাতে নেস্ট বন্ধ রাখা",
        "৪. হ্যান্ডলিং রুম তাপমাত্রা: কুলিংয়ের ১ম ধাপ (শেডের চেয়ে ঠান্ডা, স্টোরেজের চেয়ে উষ্ণ)"
      ],
    ),

    // 34. Rodent Control Management
    BroilerPSArticleItem(
      id: "rodent_control_management",
      titleEn: "Rodent Control Management.",
      titleBn: "ইঁদুর নিয়ন্ত্রণ ব্যবস্থাপনা",
      subtitleBn: "ইঁদুর নিয়ন্ত্রণ প্রটোকল (Rodent Control)",
      subtitleEn: "10 Eradication Rules, Entry Gap Specs (20-35mm), Pallet Storage & Year-Round Bait Rotation",
      snippetBn: "1️⃣ ২০-৩৫ মিমি গর্তে প্রবেশ রোধ, ১০টি সমন্বিত পদক্ষেপ, প্যালেটে ফিড ব্যাগ সংরক্ষণ, নিয়মিত bait রোটেশন...",
      snippetEn: "1️⃣ Seal 20-35mm entry gaps; 10 integrated pest control steps; elevate feed on pallets; rotate bait...",
      imagePath: "assets/ps_broiler.jpg",
      detailsEn: [
        "📌 Disease Transmission & Structural Damage Risks:\nRodents transmit Salmonella, Cholera, and other severe infectious pathogens. Structural hazards include destroying wall insulation, damaging curtains and water pipes, chewing electrical wiring (fire risk), and attacking live poultry.",
        "🚪 Entry Gap Thresholds (20mm & 35mm Rule):\n• Mice enter through gaps as small as 20 mm (~¾ inch).\n• Rats enter through gaps as small as 35 mm (~1½ inches).\n👉 General Rule: If a rodent's head can fit through an opening, its entire body will follow.",
        "1️⃣ Debris Clearance & 2️⃣ Vegetation Management:\n• Clear all trash, unused equipment, and debris around shed perimeters to eliminate harborage.\n• Regularly trim grass, bushes, and tree branches surrounding farm buildings.",
        "3️⃣ Rodent-Proofing & 4️⃣ Prompt Mortality Removal:\n• Seal and rodent-proof all shed entry doors, wall joints, and pipe penetrations.\n• Remove and hygienically dispose of dead birds immediately to prevent attracting rodents.",
        "5️⃣ Spillage Cleanup & 6️⃣ Pallet Feed Storage SOP:\n• Sweep and clean spilled feed immediately.\n• Maintain clean feed stores; always stack feed bags elevated on wooden/plastic pallets away from walls.",
        "7️⃣ Year-Round Baiting, 8️⃣ Bait Rotation & 9️⃣ Trapping & 🔟 Metal Barriers:\n• Maintain rodent bait stations year-round using fresh rodenticides.\n• Rotate bait types and active ingredients regularly to prevent rodents from developing bait shyness or resistance.\n• Deploy mechanical traps where appropriate.\n• Install smooth metal sheet barriers around shed perimeters to block rodent climbing.\n\n👉 An aggressive rodent control program preserves farm biosecurity and prevents costly structural damage."
      ],
      detailsBn: [
        "📌 রোগ সংক্রমণ & অবকাঠামোগত ক্ষতির ঝুঁকিঃ\nইঁদুর সালমোনেলা, কলেরা ও অন্যান্য সংক্রামক রোগের মারাত্মক বাহক। ক্ষতিকর দিক: ইনসুলেশন নষ্ট করা, কার্টেন ও ওয়াটার পাইপ ফুটো করা, ইলেকট্রিক তার কেটে ফেলা (অগ্নিঝুঁকি) এবং পোল্ট্রি পাখিকে আক্রমণ/ক্ষতি করা।",
        "🚪 প্রবেশপথের পরিমাপ (২০ মিমি & ৩৫ মিমি নিয়ম)ঃ\n• ছোট ইঁদুর ২০ মিমি (প্রায় ¾ ইঞ্চি) ফাঁক দিয়ে ঢুকতে পারে।\n• বড় ইঁদুর (Rat) ৩৫ মিমি (প্রায় ১½ ইঞ্চি) ফাঁক দিয়ে ঢুকতে পারে।\n👉 সাধারণ নিয়ম: ইঁদুরের মাথা কোনো গর্ত দিয়ে ঢুকতে পারলে তার পুরো শরীরও ঢুকে যায়।",
        "1️⃣ লুকানোর জায়গা অপসারণ & 2️⃣ গাছপালা পরিষ্কারঃ\n• শেডের চারপাশের সব আবর্জনা, অব্যবহৃত জিনিস ও স্তূপ সরিয়ে ফেলতে হবে।\n• শেডের আশেপাশের ঘাস, ঝোপঝাড় ও গাছের ডালপালা নিয়মিত ছাঁটতে হবে।",
        "3️⃣ ভবনের প্রবেশপথ সুরক্ষিত করা & 4️⃣ মৃত মুরগি দ্রুত অপসারণঃ\n• শেডের দরজা, দেয়ালের ফাঁক ও পাইপের প্রবেশপথ Rodent Proof করতে হবে।\n• মৃত মুরগী সাথে সাথে ও সঠিকভাবে অপসারণ করতে হবে যাতে ইঁদুর আকৃষ্ট না হয়।",
        "5️⃣ ফিড অপচয় পরিষ্কার & 6️⃣ প্যালেটে ফিড রাখা (SOP)ঃ\n• ফিড মাটিতে পড়ে গেলে সাথে সাথে পরিষ্কার করতে হবে।\n• ফিড স্টোর পরিষ্কার রাখতে হবে এবং ফিড ব্যাগ মেঝে থেকে উপরে প্যালেটের উপর রাখতে হবে।",
        "7️⃣ সারা বছর বিষ ব্যবহার, 8️⃣ Poison Bait রোটেশন, 9️⃣ ফাঁদ & 🔟 ধাতব বাধাঃ\n• সারা বছর Rodent Bait Station চালু রাখতে হবে এবং তাজা rodenticide ব্যবহার করতে হবে।\n• নিয়মিত bait ও বিষের ধরন পরিবর্তন করতে হবে (ইঁদুরের প্রতিরোধ ক্ষমতা তৈরি রোধে)।\n• সুবিধাজনক স্থানে ইঁদুর ধরার ফাঁদ ব্যবহার করা উচিত।\n• শেডের চারপাশে ধাতব শিট (metal sheet barrier) বসিয়ে ইঁদুরের শেডে ওঠা প্রতিরোধ করা যায়।\n\n👉 কার্যকর rodent control প্রোগ্রাম ফার্মকে রোগমুক্ত রাখে ও বিপুল আর্থিক ক্ষতি রোধ করে।"
      ],
      keyPointsEn: [
        "1. Gap Thresholds: Block 20mm (mice) & 35mm (rat) gaps; if head enters, body passes",
        "2. Feed & Storage SOP: Cleanup feed spills instantly; store feed bags elevated on pallets",
        "3. Year-Round Baiting: Keep fresh bait stations year-round; rotate bait formulas to stop resistance",
        "4. Sanitation & Proofing: Trim vegetation, clear debris, remove mortalities, install metal sheet barriers"
      ],
      keyPointsBn: [
        "১. গর্তের পরিমাপ: ২০ মিমি (ছোট ইঁদুর) & ৩৫ মিমি (বড় ইঁদুর) গর্ত বন্ধ; মাথা ঢুকলে পুরো শরীর ঢোকে",
        "২. ফিড ও স্টোরেজ SOP: পড়ে যাওয়া ফিড দ্রুত পরিষ্কার; ব্যাগ মেঝে থেকে উপরে প্যালেটে রাখা",
        "৩. সারা বছর baiting: সারা বছর তাজা bait station রাখা; রোদ প্রতিরোধ রোধে বিষ পরিবর্তন করা",
        "৪. পরিচ্ছন্নতা & ব্যারিয়ার: গাছ ছাঁটা, ময়লা ফেলা, মৃত পাখি অপসারণ & মেটাল শিট ব্যারিয়ার বসানো"
      ],
    ),

    // 35. Water Quality Management
    BroilerPSArticleItem(
      id: "water_quality_management",
      titleEn: "Water Quality Management.",
      titleBn: "পানির গুণমান ব্যবস্থাপনা",
      subtitleBn: "পানির গুণমান প্রটোকল (Water Quality)",
      subtitleEn: "TDS <3000 ppm, Hardness <20 ppm, Salinity <1000 ppm, 3-5 ppm Chlorine & 3-Month Water Test",
      snippetBn: "1️⃣ TDS সর্বোচ্চ 3000 ppm, Hardness <20 ppm, লবণাক্ততা <1000 ppm, ড্রিংকারে ক্লোরিন 3-5 ppm...",
      snippetEn: "1️⃣ TDS max 3000 ppm; Hardness <20 ppm; Salinity <1000 ppm; free chlorine 3-5 ppm; test 3-monthly...",
      imagePath: "assets/ps_broiler.jpg",
      detailsEn: [
        "📌 Water Purity & Pathogen Control:\nWater must always be supplied clean, cool, and completely pathogen-free. Impure water directly impairs flock health and production.",
        "📊 Chemical Limits (TDS, Hardness & Salinity):\n• Total Dissolved Solids (TDS): Maximum limit is 3000 ppm.\n• Water Hardness (Ca & Mg salts): Ideal hardness is less than 20 ppm.\n• Salinity (Salt Content): Should be kept below 1000 ppm.",
        "💧 Chlorination Benefits & 6️⃣ Drinker Residual Target:\n• Chlorine Benefits: Effectively controls bacterial pathogens and prevents slime/biofilm and algae buildup in water supply lines.\n• Active Chlorine Concentration: Maintain 3-5 ppm free chlorine at drinker endpoints.",
        "🧪 3-Month Water Analysis & 8️⃣ Flock Health Impact:\n• Test water supply parameters (Water Analysis) every 3 months to identify required water treatment interventions.\n\n👉 Maintaining optimal water quality promotes maximum feed intake, growth rate, egg production, and flock vigor."
      ],
      detailsBn: [
        "📌 পানির পরিচ্ছন্নতা & জীবাণুমুক্তকরণঃ\nপোল্ট্রি ফার্মে পানি সবসময় সম্পূর্ণ পরিষ্কার, ঠান্ডা এবং রোগজীবাণুমুক্ত (pathogen-free) রাখতে হবে। দূষিত পানি পাখির বৃদ্ধি ও উৎপাদনে সরাসরি ব্যাঘাত ঘটায়।",
        "📊 কেমিক্যাল মানদণ্ড (TDS, Hardness & Salinity)ঃ\n• Total Dissolved Solids (TDS): পানিতে TDS সর্বোচ্চ 3000 ppm এর বেশি হওয়া উচিত নয়।\n• পানির কঠোরতা (Hardness): ক্যালসিয়াম ও ম্যাগনেসিয়াম লবণ (Hardness) 20 ppm এর কম হওয়া ভালো।\n• পানির লবণাক্ততা (Salinity): লবণাক্ততা 1000 ppm এর কম থাকা উচিত।",
        "💧 ক্লোরিন ব্যবস্থার সুবিধা & 6️⃣ ড্রিংকার ক্লোরিন মাত্রাঃ\n• ক্লোরিনের সুবিধা: পানিতে ব্যাকটেরিয়া নিয়ন্ত্রণ করে এবং পানির পাইপলাইনে slime, বায়োফিল্ম ও algae জমা পড়া কমায়।\n• ক্লোরিন মাত্রা: ড্রিংকারে মুক্ত ক্লোরিনের মাত্রা 3–5 ppm বজায় রাখা উত্তম।",
        "🧪 ৩ মাস অন্তর পানি পরীক্ষা (Water Analysis)ঃ\n• প্রতি ৩ মাস অন্তর ল্যাবে পানির পরীক্ষা (Water Analysis) করা ভালো অভ্যাস, যাতে প্রয়োজনীয় ওয়াটার ট্রিটমেন্ট নির্ধারণ করা যায়।\n\n👉 ভালো পানির মান বজায় রাখলে মুরগীর খাদ্য গ্রহণ, বৃদ্ধি, উৎপাদন ও সার্বিক স্বাস্থ্য ভালো থাকে।"
      ],
      keyPointsEn: [
        "1. Standard Water Thresholds: TDS max 3000 ppm, Hardness <20 ppm, Salinity <1000 ppm",
        "2. Chlorination Level: Maintain 3-5 ppm free chlorine in drinkers to eliminate bacteria & biofilm",
        "3. Water Analysis Schedule: Conduct laboratory water tests every 3 months for treatment auditing",
        "4. Productivity Impact: Ensures optimal feed digestion, growth, egg lay, and flock immunity"
      ],
      keyPointsBn: [
        "১. পানির কেমিক্যাল সীমা: TDS সর্বোচ্চ 3000 ppm, Hardness <20 ppm, লবণাক্ততা <1000 ppm",
        "২. ক্লোরিনের পরিমাণ: ব্যাকটেরিয়া & বায়োফিল্ম মুক্ত রাখতে ড্রিংকারে 3-5 ppm ক্লোরিন রাখা",
        "৩. ল্যাব টেস্ট সূচি: ওয়াটার ট্রিটমেন্ট মূল্যায়নে প্রতি ৩ মাস অন্তর পানি পরীক্ষা করা",
        "৪. উৎপাদনের প্রভাব: ফিড হজম, দৈহিক বৃদ্ধি, ডিম উৎপাদন & রোগ প্রতিরোধ ক্ষমতা উন্নত রাখা"
      ],
    ),

    // 36. Medication Management
    BroilerPSArticleItem(
      id: "medication_management",
      titleEn: "Medication Management.",
      titleBn: "ঔষধ প্রয়োগ ব্যবস্থাপনা",
      subtitleBn: "ঔষধ প্রয়োগ প্রটোকল (Medication SOP)",
      subtitleEn: "Biosecurity & Vaccine Priority, Misuse Hazards, Send 6-8 Birds for Lab Sensitivity Test",
      snippetBn: "1️⃣ প্রতিরোধই সেরা পদ্ধতি, অযথা অ্যান্টিবায়োটিক না দেওয়া, ৬-৮টি অসুস্থ বার্ড ল্যাবে সেনসিটিভিটি টেস্ট...",
      snippetEn: "1️⃣ Prevention via biosecurity/vaccine; avoid misuse; send 6-8 birds for lab sensitivity testing...",
      imagePath: "assets/ps_broiler.jpg",
      detailsEn: [
        "📌 Prevention Priority & Veterinarian Consultation:\nDisease prevention via biosecurity and vaccination is far more effective and economical than treatment. When disease outbreaks occur despite precautions, consult a qualified veterinarian immediately.",
        "1️⃣ Core Prevention Strategy & 2️⃣ Hazards of Unnecessary Medication:\n• Robust biosecurity protocols and flawless vaccination timing form the primary barrier against pathogens.\n• Indiscriminate medication and antibiotic misuse are costly and mask true clinical symptoms, making accurate diagnosis difficult.",
        "3️⃣ Precise Medication Selection & 4️⃣ Treatment Limitations:\n• Prescribing the correct drug at the exact right time is vital; administering wrong medications can be harmful.\n• Not all poultry diseases have effective treatments, and treating severely impaired flocks may not be economically viable.",
        "5️⃣ Laboratory Diagnostics & Sensitivity Testing (6-8 Birds):\n• Upon identifying disease symptoms, send 6-8 affected birds to a recognized diagnostic laboratory.\n• Perform bacterial isolation and Sensitivity Testing to identify the exact effective antibiotic.\n\n👉 Never administer medications without definitive diagnosis; rely on biosecurity, vaccination, and lab testing."
      ],
      detailsBn: [
        "📌 প্রতিরোধ অগ্রাধিকার & বিশেষজ্ঞ পরামর্শঃ\nরোগ নিয়ন্ত্রণের সবচেয়ে সাশ্রয়ী ও কার্যকর উপায় হলো প্রতিরোধ (Prevention)। শক্তিশালী বায়োসিকিউরিটি ও সঠিক ভ্যাকসিনেশন প্রোগ্রামের মাধ্যমে অধিকাংশ রোগ ঠেকানো সম্ভব। অনাকাঙ্ক্ষিত রোগ দেখা দিলে দ্রুত অভিজ্ঞ ভিটেরিনারিয়ানের পরামর্শ নিতে হবে।",
        "1️⃣ প্রতিরোধই সেরা পদ্ধতি & 2️⃣ অপ্রয়োজনীয় ওষুধ ব্যবহারের ক্ষতিকর দিকঃ\n• সঠিক বায়োসিকিউরিটি এবং যথাসময়ে ভ্যাকসিনেশনই প্রধান প্রতিরক্ষা ব্যবস্থা।\n• ওষুধ ও অ্যান্টিবায়োটিক অত্যন্ত ব্যয়বহুল। অযথা ওষুধ ব্যবহার করলে রোগের আসল লক্ষণ ঢেকে যায়, ফলে সঠিক রোগ নির্ণয় কঠিন হয়ে পড়ে।",
        "3️⃣ সঠিক ওষুধ নির্বাচন & 4️⃣ চিকিৎসার সীমাবদ্ধতাঃ\n• সঠিক ওষুধ এবং সঠিক সময়ে চিকিৎসা রোগ নিয়ন্ত্রণে অত্যন্ত গুরুত্বপূর্ণ। ভুল ওষুধ উল্টো ক্ষতি করতে পারে।\n• সব রোগের কার্যকর চিকিৎসা নেই এবং কিছু ক্ষেত্রে চিকিৎসা করা অর্থনৈতিকভাবে লাভজনক নয়।",
        "5️⃣ ল্যাব পরীক্ষার গুরুত্ব & সেনসিটিভিটি টেস্ট (৬–৮টি পাখি)ঃ\n• শেডে রোগের লক্ষণ দেখা দিলে দ্রুত ৬–৮টি আক্রান্ত মুরগি রোগ নির্ণয় ল্যাবরেটরিতে পাঠানো উচিত।\n• ল্যাবে Sensitivity Test করিয়ে কোন ওষুধ রোগজীবাণুর বিরুদ্ধে কাজ করবে তা নিশ্চিত হয়ে চিকিৎসা শুরু করতে হবে।\n\n👉 সারসংক্ষেপ: সঠিক রোগ নির্ণয় ছাড়া আন্দাজে ওষুধ ব্যবহার নিষিদ্ধ; বায়োসিকিউরিটি, ভ্যাকসিনেশন ও ল্যাব পরীক্ষা দিয়েই রোগ নিয়ন্ত্রণ নিশ্চিত করতে হবে।"
      ],
      keyPointsEn: [
        "1. Core Strategy: Prevention via strict biosecurity and proper vaccination is key",
        "2. Avoid Drug Misuse: Unnecessary antibiotic use masks symptoms and increases mortality costs",
        "3. Lab Testing SOP: Send 6-8 affected birds to lab for bacterial Sensitivity Testing",
        "4. Definitive Diagnosis: Never administer drugs blindly without professional lab confirmation"
      ],
      keyPointsBn: [
        "১. সেরা কৌশল: শক্তিশালী বায়োসিকিউরিটি & সঠিক ভ্যাকসিনেশনের মাধ্যমে রোগ প্রতিরোধ",
        "২. ওষুধ অপব্যবহার রোধ: অযথা অ্যান্টিবায়োটিক ব্যবহারে আসল লক্ষণ ঢেকে যায় & খরচ বাড়ে",
        "৩. ল্যাব টেস্ট SOP: আক্রান্ত ৬-৮টি মুরগী ল্যাবে পাঠিয়ে Sensitivity Test সম্পন্ন করা",
        "৪. সঠিক চিকিৎসা: ল্যাব টেস্ট ও বিশেষজ্ঞের লিখিত পরামর্শ ছাড়া আন্দাজে ওষুধ না দেওয়া"
      ],
    ),

    // 37. Vaccination Management
    BroilerPSArticleItem(
      id: "vaccination_management",
      titleEn: "Vaccination Management.",
      titleBn: "ভ্যাকসিনেশন ব্যবস্থাপনা",
      subtitleBn: "ভ্যাকসিনেশন প্রটোকল (Vaccination SOP)",
      subtitleEn: "16 Rules: Cold Chain, Change Needle Every 500 Doses, Inguinal Site Benefits & Titer Auditing",
      snippetBn: "1️⃣ সুস্থ পাখির শতভাগ ডোজ, প্রতি ৫০০ ডোজে সূঁচ পরিবর্তন, উরুর ইনজেকশনের (Inguinal) ৪টি সুবিধা...",
      snippetEn: "1️⃣ 100% full dose on healthy birds; change needle every 500 doses; 4 key inguinal site benefits...",
      imagePath: "assets/ps_broiler.jpg",
      detailsEn: [
        "📌 Primary Goal & Immune Response:\nVaccination builds active immunity against field pathogens using attenuated or inactivated organisms. Timing must minimize flock stress and economic losses.",
        "1️⃣ Tailored Programs, 2️⃣ Healthy Birds Only & 3️⃣ Post-Vaccine Care:\n• Tailor vaccine programs to local disease challenges.\n• Vaccinate strictly healthy birds only.\n• Provide supportive care post-vaccination to minimize stress reactions.",
        "4️⃣ Manufacturer Guidelines, 5️⃣ Cold Chain Storage & 6️⃣ Full Dosage:\n• Follow manufacturer instructions for dilution and route.\n• Maintain strict cold chain; protect from heat/sunlight and never use expired stock.\n• Administer the full specified dose; NEVER dilute to stretch doses.",
        "7️⃣ Opened Vials, 8️⃣ Safe Disposal & 9️⃣ Mixing SOP:\n• Never save opened vaccine bottles for later use.\n• Safely destroy empty vials to prevent virus spread.\n• Shake vaccine thoroughly before and during administration.",
        "🔟 Needle Change (500 Doses), 1️⃣1️⃣ Audit & 1️⃣2️⃣ Reconciliation:\n• Change injection needles every 500 doses to maintain needle sharpness.\n• Assign a supervisor to audit accuracy and re-vaccinate missed birds.\n• Reconcile used dose counts against issued stock at shift end.",
        "1️⃣3️⃣ Equipment Hygiene, 1️⃣4️⃣ Post-Vaccine Audits & 1️⃣5️⃣ Inguinal Site Benefits:\n• Clean and sterilize all equipment daily post-use.\n• Monitor birds for neck sores, torticollis, mortality, or leg issues.\n• Inguinal (Thigh) Site Advantages: Preserves breast muscle quality, reduces stress, yields higher antibody titers, and lowers CV (improves uniformity).",
        "1️⃣6️⃣ Routine Serological Monitoring:\n• Regularly monitor flock health and antibody titers via blood sampling.\n\n👉 Rigorous vaccination protocols guarantee disease resistance, production stability, and premium chick quality."
      ],
      detailsBn: [
        "📌 মূল উদ্দেশ্য & রোগ প্রতিরোধ ক্ষমতাঃ\nভ্যাকসিনেশনের লক্ষ্য কম ক্ষতিকর জীবাণু দিয়ে মুরগীর শরীরে অনাক্রম্যতা (Immunity) গড়ে তোলা। স্ট্রেস ও অর্থনৈতিক ক্ষতি কমাতে উপযুক্ত বয়স নির্বাচন করা জরুরি।",
        "1️⃣ আঞ্চলিক প্রোগ্রাম, 2️⃣ সুস্থ মুরগী & 3️⃣ ভ্যাকসিনের পর যত্নঃ\n• আঞ্চলিক রোগের ঝুঁকি অনুযায়ী ভ্যাকসিন সূচি নির্ধারণ করতে হবে।\n• শুধুমাত্র শতভাগ সুস্থ মুরগিতে ভ্যাকসিন দিতে হবে।\n• ভ্যাকসিনের পর সঠিক পরিচর্যায় পাখির স্ট্রেস কমাতে হবে।",
        "4️⃣ নির্দেশিকা মানা, 5️⃣ কোল্ড চেইন সংরক্ষণ & 6️⃣ পূর্ণাঙ্গ ডোজঃ\n• প্রস্তুতকারকের নির্দেশনা মতে মিশ্রণ, পাতলা করা ও প্রয়োগ করতে হবে।\n• ফ্রিজে নির্দিষ্ট তাপমাত্রায় রাখতে হবে; সূর্যালোক/তাপ থেকে দূরে রাখা & মেয়াদোত্তীর্ণ ভ্যাকসিন বর্জন।\n• সবসময় সম্পূর্ণ ডোজ দিতে হবে; কম দেওয়ার জন্য পাতলা করা নিষিদ্ধ।",
        "7️⃣ খোলা বোতল বর্জন, 8️⃣ বোতল ধ্বংস & 9️⃣ নিয়মিত ঝাঁকানোঃ\n• খোলা বোতল পরে ব্যবহারের জন্য রাখা যাবে না।\n• ব্যবহৃত খালি বোতল সঠিকভাবে ধ্বংস করতে হবে।\n• ব্যবহারের আগে ও প্রয়োগকালে বোতল নিয়মিত ঝাঁকাতে হবে।",
        "🔟 সূঁচ পরিবর্তন (৫০০ ডোজ), 1️⃣1️⃣ তদারকি & 1️⃣2️⃣ হিসাব মেলানোঃ\n• সূচের ধার বজায় রাখতে প্রতি ৫০০ ডোজ পর সূঁচ পরিবর্তন করা আবশ্যক।\n• একজন সুপারভাইজার মিস হওয়া পাখি চিহ্নিত করে পুনরায় ভ্যাকসিন দেওয়া নিশ্চিত করবে।\n• দিন শেষে ব্যবহৃত ডোজ ও ফার্মে আনা ডোজের হিসাব মেলাতে হবে।",
        "1️⃣3️⃣ সরঞ্জাম পরিষ্কার, 1️⃣4️⃣ পার্শ্বপ্রতিক্রিয়া মনিটরিং & 1️⃣5️⃣ Inguinal (উরু) ইনজেকশনের সুবিধাঃ\n• প্রতিদিন কাজ শেষে সব ইনজেকশন সরঞ্জাম পরিষ্কার ও জীবাণুমুক্ত করতে হবে।\n• ঘাড়ে ক্ষত, ঘাড় বাঁকা, মরটালিটি বা পায়ের সমস্যা তদারকি করতে হবে।\n• Inguinal (উরু) ইনজেকশনের ৪ সুবিধা: বুকের মাংস ক্ষতি হয় না, স্ট্রেস কম হয়, হাই টাইটার পাওয়া যায় & CV কম হয় (ইউনিফরমিটি বাড়ে)।",
        "1️⃣6️⃣ নিয়মিত অ্যান্টিবডি টাইটার টেস্টঃ\n• রক্তের নমুনা দিয়ে ফ্লকের অ্যান্টিবডি টাইটার ও অনাক্রম্যতা নিয়মিত পরীক্ষা করতে হবে।\n\n👉 সঠিক ভ্যাকসিনেশন প্রোগ্রাম রোগ প্রতিরোধ, উৎপাদন স্থায়িত্ব ও প্রিমিয়াম বাচ্চার মান নিশ্চিত করে।"
      ],
      keyPointsEn: [
        "1. Full Dose & Health: Vaccinate healthy birds only with 100% full specified dosage",
        "2. Needle SOP: Change injection needle every 500 doses to ensure sharpness & sterility",
        "3. Inguinal Injection: Thigh site protects breast meat, reduces stress & increases antibody titer",
        "4. Cold Chain & Disposal: Maintain refrigerated storage; destroy empty vials safely post-use"
      ],
      keyPointsBn: [
        "১. পূর্ণাঙ্গ ডোজ & স্বাস্থ্য: কেবল সুস্থ পাখিতে শতভাগ পূর্ণাঙ্গ নির্দিষ্ট ডোজে ভ্যাকসিন দেওয়া",
        "২. সূঁচ পরিবর্তন SOP: ধার ও জীবাণুমুক্ততা বজায় রাখতে প্রতি ৫০০ ডোজে সূঁচ পরিবর্তন করা",
        "৩. Inguinal (উরু) ইনজেকশন: বুকের মাংস রক্ষা করে, স্ট্রেস কমায় & বেশি অ্যান্টিবডি টাইটার দেয়",
        "৪. কোল্ড চেইন & বর্জ্য: ফ্রিজে সঠিক তাপমাত্রায় রাখা & ব্যবহৃত বোতল নিরাপদে ধ্বংস করা"
      ],
    ),

    // 38. Salmonella & Mycoplasma Control
    BroilerPSArticleItem(
      id: "salmonella_mycoplasma_control",
      titleEn: "Salmonella & Mycoplasma Control.",
      titleBn: "সালমোনেলা ও মাইকোপ্লাজমা নিয়ন্ত্রণ",
      subtitleBn: "সালমোনেলা ও মাইকোপ্লাজমা প্রটোকল (Salmonella & Mycoplasma SOP)",
      subtitleEn: "Screening for 6 Pathogens (MG, MS, SG, SP, SE, ST), Concrete Floors, Foot Dips & Quarantine Rules",
      snippetBn: "1️⃣ ৬টি প্যাথোজেন মুক্ত রাখা (MG/MS & Salmonella 4 Strains), কংক্রিট ফ্লোর, ফুট-ডিপ & শেড তালাবদ্ধ রাখা...",
      snippetEn: "1️⃣ Maintain negative status for MG, MS, SG, SP, SE, ST; concrete floors; foot dips & shower SOP...",
      imagePath: "assets/ps_broiler.jpg",
      detailsEn: [
        "📌 Verified Negative Status (6 Key Pathogens):\nBroiler breeder flocks must maintain strict negative status for 6 major vertical pathogens:\n• Mycoplasma gallisepticum (MG)\n• Mycoplasma synoviae (MS)\n• Salmonella gallinarum (SG)\n• Salmonella pullorum (SP)\n• Salmonella enteritidis (SE)\n• Salmonella typhimurium (ST)",
        "1️⃣ Concrete Floors & 2️⃣ Restricted Personnel Access:\n• All poultry houses must feature concrete floors for effective cleaning and disinfection.\n• Restrict entry strictly to designated farm staff; employees must never visit outside poultry farms or live bird markets.",
        "3️⃣ Cross-Unit Biosecurity, Quarantine & Boot SOP:\n• Shower and change clothes when moving between farm units.\n• Quarantine suspect or positive houses immediately and visit them LAST during daily routine.\n• Enforce shed-specific footwear in every house.",
        "4️⃣ Protective Apparel, 5️⃣ Entry Sanitation & 6️⃣ Door Locking:\n• Supply clean protective coveralls and boots for supervisors and authorized visitors.\n• Equip house entryways with handwashing sinks, soap, paper towels, foot dips, and brushes.\n• Keep house doors locked at all times to prevent unauthorized entry.",
        "7️⃣ Human Vector Transmission Prevention:\n• Humans can act as vectors for Salmonella transmission to poultry.\n• Staff suffering from diarrhea or enteric symptoms must report to farm management before starting work.\n\n👉 Rigorous biosecurity, daily hygiene barriers, and serological monitoring guarantee Salmonella and Mycoplasma freedom."
      ],
      detailsBn: [
        "📌 নেগেটিভ স্ট্যাটাস রক্ষা (৬টি মূল রোগজীবাণু)ঃ\nব্রয়লার ব্রিডার ফ্লককে নিয়মিত ল্যাব টেস্টে ৬টি প্রধান লম্বালম্বি (vertical) সংক্রামক জীবাণুর বিরুদ্ধে শতভাগ নেগেটিভ রাখতে হবে:\n• Mycoplasma gallisepticum (MG)\n• Mycoplasma synoviae (MS)\n• Salmonella gallinarum\n• Salmonella pullorum\n• Salmonella enteritidis\n• Salmonella typhimurium",
        "1️⃣ কংক্রিট ফ্লোর & 2️⃣ সীমিত প্রবেশাধিকারঃ\n• সব শেডে কংক্রিট ফ্লোর থাকতে হবে, যাতে সহজে ধৌত ও শতভাগ জীবাণুমুক্ত করা যায়।\n• শুধুমাত্র দায়িত্বপ্রাপ্ত কর্মচারীদের প্রবেশের অনুমতি থাকবে; বাইরে অন্য পোল্ট্রি ফার্ম বা মেলায় যাওয়া নিষিদ্ধ।",
        "3️⃣ ইউনিট পরিবর্তন, কোয়ারেন্টাইন & আলাদা জুতাঃ\n• এক ইউনিট থেকে অন্য ইউনিটে যাওয়ার আগে গোসল ও কাপড় পরিবর্তন করতে হবে।\n• সন্দেহজনক/পজিটিভ ফ্লক কোয়ারেন্টাইনে রেখে দিনের কাজের সবশেষে সেই শেডে যেতে হবে।\n• প্রতিটি শেডে আলাদা জুতা (shed-specific boots) ব্যবহার করতে হবে।",
        "4️⃣ সুরক্ষামূলক পোশাক, 5️⃣ প্রবেশদ্বারে স্বাস্থ্যবিধি & 6️⃣ শেড নিরাপত্তাঃ\n• সুপারভাইজার ও ভিজিটরদের জন্য পরিষ্কার সুরক্ষামূলক গাউন/কভারঅল ও বুট সরবরাহ করতে হবে।\n• প্রবেশদ্বারে হাত ধোয়ার বেসিন, সাবান/স্যানিটাইজার, তোয়ালে, ফুট-ডিপ ও ব্রাশ রাখতে হবে।\n• অনাকাঙ্ক্ষিত প্রবেশ রোধে শেডের দরজা সবসময় তালাবদ্ধ রাখতে হবে।",
        "7️⃣ মানুষের মাধ্যমে সংক্রমণ প্রতিরোধঃ\n• মানুষ পোল্ট্রিতে সালমোনেলা ছড়াতে পারে। কর্মচারীর ডায়রিয়া বা পেটের সমস্যা থাকলে কাজ শুরুর আগেই ম্যানেজমেন্টকে অবহিত করা বাধ্যতামূলক।\n\n👉 কঠোর বায়োসিকিউরিটি, প্রবেশদ্বার হাইজিন এবং নিয়মিত রক্ত পরীক্ষায় সালমোনেলা ও মাইকোপ্লাজমা মুক্ত রাখা নিশ্চিত হয়।"
      ],
      keyPointsEn: [
        "1. 6 Target Pathogens: Zero tolerance for MG, MS, S. gallinarum, S. pullorum, S. enteritidis, S. typhimurium",
        "2. Structural SOP: Smooth concrete floors for 100% disinfection; locked doors & entry foot dips",
        "3. Quarantine Routine: Visit suspect/positive houses last in the day; enforce shed-specific boots",
        "4. Human Vector SOP: Staff with diarrhea or stomach symptoms must report before entering sheds"
      ],
      keyPointsBn: [
        "১. ৬টি টার্গেট প্যাথোজেন: MG, MS, S. gallinarum, S. pullorum, S. enteritidis ও S. typhimurium মুক্ত রাখা",
        "২. অবকাঠামোগত SOP: শতভাগ জীবাণুমুক্তকরণে কংক্রিট ফ্লোর; বন্ধ দরজা & প্রবেশদ্বারে ফুট-ডিপ",
        "৩. কোয়ারেন্টাইন নিয়ম: সন্দেহজনক শেডে দিনশেষে প্রবেশ; প্রতিটি শেডে আলাদা জুতা ব্যবহার",
        "৪. মানব জীবাণুবাহক SOP: কর্মীদের পেটের সমস্যা/ডায়রিয়া থাকলে কাজ শুরুর আগে জানান বাধ্যতামূলক"
      ],
    ),

    // 39. Fumigation & Fumigation Methods
    BroilerPSArticleItem(
      id: "fumigation_and_methods",
      titleEn: "Fumigation & Fumigation Methods.",
      titleBn: "ফিউমিগেশন ও ফিউমিগেশন পদ্ধতি",
      subtitleBn: "ফিউমিগেশন প্রটোকল (Fumigation SOP & Methods)",
      subtitleEn: "Environmental Rules (RH 70-80%, 21°C), KMnO4+Formalin SOP, Paraformaldehyde Prills & Aerosol Fogging",
      snippetBn: "1️⃣ RH ৭০-৮০% & temp ২১°C, ফরমালিন+KMnO4 (৩:২), ১L/২৫ m³, Paraformaldehyde (১kg/৩০০ m³)...",
      snippetEn: "1️⃣ RH 70-80% & 21°C temp; Formalin+KMnO4 3:2 ratio; Paraformaldehyde 1kg/300 m³; 24h airtight seal...",
      imagePath: "assets/ps_broiler.jpg",
      detailsEn: [
        "📌 Formaldehyde Fumigation Efficacy & Environmental Rules:\nFormaldehyde gas is a gold-standard fumigant. To ensure maximum gas penetration and efficacy, strict environmental conditions must be established:\n• Relative Humidity: Increase RH to 70–80%.\n• Temperature: Maintain house temperature at 21°C (70°F) or higher.\n• Surface Moisture: Wet down internal shed surfaces or set water troughs to boost ambient humidity.\n• Airtight Seal: Seal the shed completely post-fumigation and leave undisturbed for 24 hours.",
        "1️⃣ Method 1 – Formalin + Potassium Permanganate (KMnO4):\n• Rapid exothermic reaction generating hot formaldehyde gas.\n• Ratio & Dosage: 1 Liter Formalin per 25 m³ house volume (3 parts Formalin : 2 parts KMnO4).\n⚠️ Safety Rules: Max 1.2 L Formalin per container; vessel depth must be at least 3x chemical depth; place containers strictly on metal/concrete bases (NEVER on litter); operators MUST wear respirator masks.",
        "📐 House Calculation Example (1705 m³ Shed - 55m x 10m x 3.1m):\n• Total Chemicals: 68.2 Liters Formalin, 45.36 kg KMnO4, split into 60 containers.\n• Per Container Charge: 760g KMnO4 + 1.2 Liters Formalin added rapidly.",
        "2️⃣ Method 2 – Paraformaldehyde Heating Method:\n• Paraformaldehyde prills heated to 218°C (425°F) release pure formaldehyde gas safely.\n• Dosage: 1 kg prills per 300 m³ volume (ideal for automated timer heating devices).",
        "3️⃣ Method 3 – Formalin Vapor / Aerosol Method:\n• Aerosol Fogging Mix: 28 ml Formalin + 28 ml water per 25 m³ sprayed via thermal foggers.\n\n👉 Maintaining proper temperature, humidity, and chemical proportions guarantees thorough pathogen destruction."
      ],
      detailsBn: [
        "📌 ফিউমিগেশন দক্ষতা & পরিবেশগত শর্তাবলীঃ\nফরমালডিহাইড গ্যাস বহু বছর ধরে সবচেয়ে প্রামাণিক ফিউমিগেন্ট। সর্বোচ্চ কার্যকারিতা পেতে নিম্নোক্ত পরিবেশগত শর্ত মানা আবশ্যক:\n• আপেক্ষিক আর্দ্রতা (RH): ৭০–৮০% পর্যন্ত বাড়াতে হবে।\n• শেডের তাপমাত্রা: কমপক্ষে ২১°C (৭০°F) রাখা (ফরমালডিহাইড উচ্চ তাপমাত্রায় বেশি সক্রিয়)।\n• পৃষ্ঠের আর্দ্রতা: শেডের মেঝে/দেয়াল ধুয়ে বা পানির পাত্র রেখে আর্দ্রতা নিশ্চিত করতে হবে।\n• সিল করে ২৪ ঘণ্টা রাখা: ফিউমিগেশন শেষে শেড সিল করে ২৪ ঘণ্টা বন্ধ রাখতে হবে।",
        "1️⃣ পদ্ধতি ১ – ফরমালিন + পটাশিয়াম পারম্যাঙ্গানেট (KMnO4)ঃ\n• তীব্র বিক্রিয়ায় তাপ ও ফরমালডিহাইড গ্যাস উৎপন্ন হয়।\n• অনুপাত & পরিমাণ: ১ লিটার ফরমালিন প্রতি ২৫ m³ আয়তন (৩ অংশ ফরমালিন : ২ অংশ পটাশিয়াম পারম্যাঙ্গানেট)।\n⚠️ সতর্কতা: ১ পাত্রে ১.২ লিটারের বেশি ফরমালিন না দেওয়া; পাত্রের গভীরতা কেমিক্যালের ৩ গুণ; পাত্র ধাতু/কংক্রিটের উপর রাখা (লিটারে নিষিদ্ধ); রেসপিরেটর মাস্ক ব্যবহার বাধ্যতামূলক।",
        "📐 শেডের হিসাব উদাহরণ (১৭০৫ m³ শেড - ৫৫ মি × ১০ মি × ৩.১ মি)ঃ\n• মোট রাসায়নিক: ৬৮.২ লিটার ফরমালিন, ৪৫.৩৬ কেজি KMnO4, ৬০টি ধাতব কন্টেইনার।\n• প্রতি কন্টেইনারে চার্জ: ৭৬০ গ্রাম KMnO4 দেওয়ার পর দ্রুত ১.২ লিটার ফরমালিন ঢালা।",
        "2️⃣ পদ্ধতি ২ – Paraformaldehyde Heating Methodঃ\n• Paraformaldehyde prills ২১৮°C (৪২৫°F) তাপমাত্রায় গরম করে গ্যাস তৈরি করা হয়।\n• পরিমাণ: ১ কেজি prills ≈ ৩০০ m³ আয়তনের জন্য যথেষ্ট (টাইমার হিটিং ডিভাইসে অটোমেটিক ব্যবহারযোগ্য)।",
        "3️⃣ পদ্ধতি ৩ – Formalin Vapor / Aerosol Methodঃ\n• এরোসল ফগিং মিশ্রণ: ২৮ ml ফরমালিন + ২৮ ml পানি প্রতি ২৫ m³ (ফগার বা এরোসল মেশিনের সাহায্যে ছড়ানো)।\n\n👉 সঠিক তাপমাত্রা, আর্দ্রতা ও রাসায়নিক অনুপাত মেনে ফিউমিগেশন করলে ফার্ম জীবাণুমুক্ত রাখা সহজ হয়।"
      ],
      keyPointsEn: [
        "1. Env Specs: RH 70-80%, Temp >=21°C (70°F), seal airtight for 24 hours",
        "2. Method 1 (Formalin+KMnO4): 1L Formalin per 25 m³ (3:2 ratio); max 1.2L per metal pot; wear respirator",
        "3. Method 2 (Paraformaldehyde): Heat prills to 218°C (425°F); 1 kg prills per 300 m³ volume",
        "4. Method 3 (Aerosol): 28 ml Formalin + 28 ml water per 25 m³ via fogging machines"
      ],
      keyPointsBn: [
        "১. পরিবেশ শর্ত: RH ৭০-৮০%, তাপমাত্রা >=২১°C (৭০°F), ফিউমিগেশন শেষে ২৪ ঘণ্টা শেড সিল রাখা",
        "২. পদ্ধতি ১ (ফরমালিন+KMnO4): ১L ফরমালিন/২৫ m³ (৩:২ অনুপাত); পাত্রে সর্বোচ্চ ১.২L; রেসপিরেটর পর বাধ্যতামূলক",
        "৩. পদ্ধতি ২ (Paraformaldehyde): prills ২১৮°C এ গরম করা; ১ কেজি prills প্রতি ৩০০ m³ আয়তনে",
        "৪. পদ্ধতি ৩ (Aerosol): ২৮ ml ফরমালিন + ২৮ ml পানি প্রতি ২৫ m³ এ ফগিং মেশিনে স্প্রে করা"
      ],
    ),

    // 40. Breeder Farm Disinfection Schedule
    BroilerPSArticleItem(
      id: "breeder_farm_disinfection_schedule",
      titleEn: "Breeder Farm Disinfection Schedule.",
      titleBn: "ব্রিডার ফার্ম জীবাণুমুক্তকরণ সূচি",
      subtitleBn: "ব্রিডার ফার্ম জীবাণুমুক্তকরণ সূচি (Disinfection Schedule & SOP)",
      subtitleEn: "13-Step Terminal Sanitation Protocol, Water Line Flush, 6m Perimeter Spray & 8 Cleanout Steps",
      snippetBn: "1️⃣ ১৩টি টার্মিনাল ধাপ, সরঞ্জাম ও পানির লাইন ফ্লাশিং, ৬ মিটার চারপাশ স্প্রে, ৪৮ ঘণ্টা আগে ফিউমিগেশন...",
      snippetEn: "1️⃣ 13-step terminal sanitation SOP; water line flushing; spray 6m outer perimeter; 48h pre-chick fumigation...",
      imagePath: "assets/ps_broiler.jpg",
      detailsEn: [
        "📌 13-Step Terminal Sanitation SOP:\n1. Equipment Removal & Soaking: Remove portable equipment, soak in water, pressure wash, and immerse in approved disinfectant solution.\n2. Dust Removal: Blow or brush down ceiling and wall dust post-equipment removal.\n3. Litter Evacuation: Transport old litter off-farm in covered vehicles.\n4. Interior Wash: Pressure wash interior with heavy-duty detergent (air inlets, fan shafts, concrete floors).\n5. Exterior Wash: Pressure wash exterior fan shafts, inlets, roof, and gutters.\n6. Bulk Feed Bin Sanitation: Empty, clean, and fumigate feed bins; dry 100% before refilling.\n7. Disinfectant Wash: Spray entire interior, fan shafts, and ceilings with approved disinfectant.",
        "8️⃣ Water Line Sanitization, 9️⃣ 6m Perimeter Spray & 🔟 Fumigation:\n8. Flush water lines with sanitizing solution; rinse thoroughly to leave ZERO chemical residue (prevents live vaccine neutralization).\n9. Spray dried floor, side walls, and 6-meter (20-ft) outer perimeter with broad-spectrum disinfectant.\n10. Terminal Fumigation: Install clean equipment and fresh litter, heat house, and execute formaldehyde fumigation at least 48 hours prior to chick arrival.\n11. Ventilation: Neutralize and ventilate building thoroughly 24 hours post-fumigation.\n12. Auxiliary Rooms: Clean and sanitize egg store rooms, feed stores, and staff changing rooms.\n13. Insecticide SOP: Apply approved insecticides following manufacturer labels.",
        "📋 8-Step Sequential Cleanout Summary:\n1. Depopulate all birds\n2. Clear out all organic litter and manure\n3. Remove portable equipment for external pressure washing & disinfection\n4. Pressure wash shed interior with heavy detergent\n5. Apply virucidal/bactericidal disinfectant spray\n6. Apply insecticides & rodenticides as needed\n7. Perform primary formaldehyde fumigation\n8. Re-install equipment, add fresh litter, and execute final terminal fumigation.\n\n👉 Thorough cleaning is your primary shield; always remove organic matter before applying disinfectants."
      ],
      detailsBn: [
        "📌 ১৩টি টার্মিনাল পরিচ্ছন্নতা ধাপ (SOP)ঃ\n১. সরঞ্জাম ভিজিয়ে ধোয়া: বহনযোগ্য যন্ত্রপাতি বাইরে এনে পানিতে ভিজিয়ে প্রেশার ওয়াশ করে জীবাণুনাশকে ডুবিয়ে রাখা।\n২. ধুলা ঝাড়া: ব্রাশ/ব্লোয়ার দিয়ে শেডের ভেতরের ও ছাদের ধুলা ঝাড়া।\n৩. লিটার অপসারণ: ঢাকা পরিবহনে পুরনো লিটার ফার্মের বাইরে সরিয়ে দেওয়া।\n৪. ডিটারজেন্ট ওয়াশ: প্রেশার ওয়াশার ও ডিটারজেন্ট দিয়ে এয়ার ইনলেট, ফ্যান শ্যাফট ও কংক্রিট ফ্লোর ধোয়া।\n৫. বাইরের অংশ ওয়াশ: ফ্যান শ্যাফট, ইনলেট, ছাদ ও গাটার প্রেশার ওয়াশ করা।\n৬. ফিড বিন ফিউমিগেশন: ফিড বিন খালি করে ওয়াশ ও ফিউমিগেশন করা (শুকানোর পর নতুন ফিড দেওয়া)।\n৭. ডিসইনফেকট্যান্ট ধোয়া: জীবাণুনাশক পানি দিয়ে শেডের ভেতর, ছাদ ও ফ্যান শ্যাফট ধোয়া।",
        "8️⃣ পানির লাইন ফ্লাশ, 9️⃣ ৬ মিটার চারপাশ স্প্রে & 🔟 ফিউমিগেশনঃ\n৮. স্যানিটাইজার দিয়ে পানির লাইন ফ্লাশ করা; বিশুদ্ধ পানি দিয়ে এমনভাবে ধোয়া যাতে লাইভ ভ্যাকসিনের কার্যকারিতা নষ্টকারী কোনো অবশিষ্টাংশ না থাকে।\n৯. ফ্লোর, দেয়াল ও শেডের চারপাশের ৬ মিটার (২০ ফুট) এলাকা জীবাণুনাশক দিয়ে স্প্রে করা।\n১০. টার্মিনাল ফিউমিগেশন: নতুন লিটার ও পরিষ্কার সরঞ্জাম বসিয়ে শেড গরম করে নতুন ফ্লক আনার অন্তত ৪৮ ঘণ্টা আগে ফরমালডিহাইড ফিউমিগেশন করা।\n১১. ভেন্টিলেশন: ২৪ ঘণ্টা পর গ্যাস প্রশমিত করে শেড খুলে সম্পূর্ণ ভেন্টিলেশন করা।\n১২. অন্যান্য রুম: এগ স্টোর, ফিড স্টোর ও স্টাফ চেঞ্জিং রুম একইভাবে পরিষ্কার ও জীবাণুমুক্ত করা।\n১৩. ইনসেক্টিসাইড: নির্দেশিকা মেনে প্রয়োজনীয় কীটনাশক স্প্রে করা।",
        "📋 ৮-ধাপে শেড পরিষ্কারের ধারাবাহিক সারসংক্ষেপঃ\n১. শেড থেকে সব পাখি বিক্রি/সরিয়ে ফেলা\n২. সব লিটার ও জৈব বর্জ্য অপসারণ করা\n৩. বহনযোগ্য যন্ত্রপাতি বাইরে নিয়ে ধোয়া ও জীবাণুমুক্ত করা\n৪. শক্তিশালী ডিটারজেন্ট দিয়ে প্রেশার ওয়াশ করা\n৫. ভায়রুসিডাল জীবাণুনাশক স্প্রে করা\n৬. কীটনাশক ও রোডেন্টিসাইড প্রয়োগ করা\n৭. ফরমালডিহাইড ফিউমিগেশন সম্পন্ন করা\n৮. নতুন লিটার ও সরঞ্জাম বসিয়ে চূড়ান্ত ফিউমিগেশন করা।\n\n👉 পরিচ্ছন্নতাই প্রধান সুরক্ষা; জীবাণুনাশক ব্যবহারের আগেই সব জৈব বর্জ্য সম্পূর্ণ অপসারিত হতে হবে।"
      ],
      keyPointsEn: [
        "1. 13 Sanitation Steps: Complete interior/exterior wash, feed bin fumigation & auxiliary room cleaning",
        "2. Water Line SOP: Flush lines completely & rinse to leave zero residue (protects live vaccines)",
        "3. Perimeter & Timing: Spray 6m (20ft) outer perimeter; execute fumigation >=48h before chick arrival",
        "4. Cleanout Rule: Organic matter must be 100% removed before applying disinfectants"
      ],
      keyPointsBn: [
        "১. ১৩টি পরিচ্ছন্নতা ধাপ: শেডের ভেতর-বাইরে প্রেশার ওয়াশ, ফিড বিন ফিউমিগেশন & অন্য সব রুম পরিষ্কার",
        "২. ওয়াটার লাইন SOP: লাইন ফ্লাশ ও ধৌত করা যাতে লাইভ ভ্যাকসিন নষ্ট করার কোনো কেমিক্যাল না থাকে",
        "৩. চারপাশ & সময়: শেডের চারপাশে ৬ মি (২০ ফুট) স্প্রে; বাচ্চা আসার অন্তত ৪৮ ঘণ্টা আগে ফিউমিগেশন",
        "৪. জীবাণুমুক্তকরণের নিয়ম: জীবাণুনাশক ব্যবহারের আগে জৈব বর্জ্য শতভাগ অপসারণ করতে হবে"
      ],
    ),

    // 41. Bio-Security on the Farm
    BroilerPSArticleItem(
      id: "biosecurity_on_the_farm",
      titleEn: "Bio-Security on the Farm.",
      titleBn: "ফার্মে বায়োসিকিউরিটি",
      subtitleBn: "ফার্ম বায়োসিকিউরিটি প্রটোকল (Farm Bio-Security SOP)",
      subtitleEn: "14 Pillars: 600m Multi-Age Separation, Shower-In SOP, Color-Coded Apparel & Incineration",
      snippetBn: "1️⃣ ১৪টি বায়োসিকিউরিটি স্তম্ভ, ৬০০ মিটার ফ্লক দূরত্ব, শাওয়ার-ইন SOP, কালার কোডেড ইউনিফর্ম, ইনসিনারেটর...",
      snippetEn: "1️⃣ 14 biosecurity pillars; 600m multi-age distance; shower-in & color-coded boots; on-site incinerator...",
      imagePath: "assets/ps_broiler.jpg",
      detailsEn: [
        "📌 Comprehensive Scope & Staff Awareness:\nBiosecurity must encompass every operational link: feed production, farm management, hatchery, maintenance, and staff hygiene. A single breach endangers the entire operation. All staff must understand and strictly enforce rules.",
        "1️⃣ Isolated Siting & 2️⃣ Single-Age Flocks (600m / 2000 ft Rule):\n• Site parent farms in remote, isolated areas.\n• Maintain single-age flocks on one farm site. If multi-age sites exist, keep at least 600m (2000 ft) distance between ages.\n• Workflow Priority: Always work in younger flocks first before moving to older flocks.",
        "3️⃣ Perimeter Fencing, 4️⃣ Feed Truck SOP & 5️⃣ Shower-In Protocol:\n• Secure farm perimeters with fencing to block unauthorized people, vehicles, or animals.\n• Feed trucks should fill bins from outside the perimeter. If entering, wash wheels/chassis at gate dips and fog truck cabin.\n• Staff Hygiene: Mandatory shower-in, clean farm uniform, and designated farm boots (Shower rooms must feature strict Clean/Dirty zones).",
        "6️⃣ Color-Coded Uniforms & 7️⃣ Prohibition of Other Animals:\n• Use color-coded uniforms and boots by zone to restrict staff cross-movement between sectors.\n• Prohibit all livestock, pet animals, and outside poultry on breeder premises.",
        "8️⃣ Pest Control, 9️⃣ On-Site Incineration & 🔟 Visitor Registry:\n• Maintain rodent/bird-proofing and rotate bait to prevent resistance.\n• Mortality Disposal: Destroy mortalities on-site using incinerators.\n• Record all visitor entries in a permanent registry logbook.\n\n👉 A robust biosecurity system minimizes disease risk, raises production, and protects breeder investments."
      ],
      detailsBn: [
        "📌 সার্বিক আওতা & কর্মকর্তা-কর্মচারীদের সচেতনতাঃ\nবায়োসিকিউরিটি প্রোগ্রাম ফিড মিল, ফার্ম ম্যানেজমেন্ট, হ্যাচারি, মেইনটেন্যান্স ও কর্মীদের পরিচ্ছন্নতাসহ সব কার্যক্রমের ওপর প্রযোজ্য। কোনো একটি লিংকে ভুল হলে পুরো ফার্ম ঝুঁকিতে পড়ে। সকল কর্মচারীকে নিয়মগুলো কঠোরভাবে মানতে হবে।",
        "1️⃣ নির্জন অবস্থান & 2️⃣ একই বয়সের ফ্লক (৬০০ মিটার / ২০০০ ফুট নিয়ম)ঃ\n• নতুন প্যারেন্ট ফার্ম নির্জন ও পৃথক স্থানে স্থাপন করা উচিত।\n• একই ফার্মে একই বয়সের ফ্লক (All-In-All-Out) রাখা উত্তম। ভিন্ন বয়সের ফ্লকে অন্তত ৬০০ মিটার (২০০০ ফুট) দূরত্ব রাখতে হবে।\n• কাজের নিয়ম: আগে ছোট বয়সের ফ্লকে কাজ শেষ করে দিনশেষে বড় বয়সের ফ্লকে যেতে হবে।",
        "3️⃣ পেরিমিটার ফেন্স, 4️⃣ ফিড ট্রাক SOP & 5️⃣ শাওয়ার-ইন স্বাস্থ্যবিধিঃ\n• ফার্মের চারপাশ ফেন্সিং করে অননুমোদিত মানুষ/গাড়ি/প্রাণী প্রবেশ বন্ধ রাখা।\n• ফিড গাড়ি বাইরে থেকে বিনে দেওয়া উত্তম। ভিতরে ঢুকলে গেটে প্রেশার ওয়াশ ও গাড়ির ক্যাবিন ডিসইনফেকট্যান্ট ফগিং করতে হবে।\n• কর্মীদের নিয়ম: ফার্মে প্রবেশের পূর্বে বাধ্যতামূলক গোসল (Shower-in), পরিচ্ছন্ন ইউনিফর্ম ও নির্দিষ্ট বুট পরা (শাওয়ার রুমে Clean & Dirty জোন থাকা বাধ্যতামূলক)।",
        "6️⃣ কালার কোডেড পোশাক & 7️⃣ অন্যান্য প্রাণী সম্পূর্ণ নিষিদ্ধঃ\n• এলাকা অনুযায়ী ইউনিফর্ম ও বুটের আলাদা রং (Color Coding) রাখা, যাতে কর্মীদের যাতায়াত সহজে নিয়ন্ত্রণ করা যায়।\n• ফার্মে অন্য কোনো পোল্ট্রি, গবাদি পশু বা পোষা প্রাণী রাখা সম্পূর্ণ নিষিদ্ধ।",
        "8️⃣ বন্য পাখি/ইঁদুর নিয়ন্ত্রণ, 9️⃣ অন-সাইট ইনসিনারেটর & 🔟 ভিজিটর রেজিস্টারঃ\n• ঘরগুলো ইঁদুর ও বন্য পাখি প্রতিরোধী করা; নিয়মিত ইঁদুরের বিষ রোটেশন করা।\n• মৃত মুরগী ফার্মের ভেতরেই ইনসিনারেটর (Incinerator) দিয়ে পুড়িয়ে ছাই করা।\n• ফার্মে আসা সকল দর্শনার্থীর নাম ও তথ্য স্থায়ী ভিজিটর রেজিস্টারে লিপিবদ্ধ রাখা।\n\n👉 শক্তিশালী বায়োসিকিউরিটি ব্যবস্থা রোগের ঝুঁকি কমায়, উৎপাদন বৃদ্ধি করে এবং সার্বিক ব্রিডার অপারেশন নিরাপদ রাখে।"
      ],
      keyPointsEn: [
        "1. Multi-Age Separation: Single-age stocking preferred; keep >=600m (2000ft) between different ages",
        "2. Biosecurity Entry SOP: Mandatory shower-in, Clean/Dirty zone separation & gate truck fogging",
        "3. Color-Coded Apparel: Use sector-specific uniform/boot colors to prevent cross-contamination",
        "4. Mortality Disposal: Destroy dead birds on-site using incinerators; keep permanent visitor logs"
      ],
      keyPointsBn: [
        "১. ভিন্ন বয়সের দূরত্ব: একই বয়সের ফ্লক রাখা উত্তম; ভিন্ন বয়সে অন্তত ৬০০ মি (২০০০ ফুট) দূরত্ব রাখা",
        "২. প্রবেশ স্বাস্থ্যবিধি: বাধ্যতামূলক শাওয়ার-ইন (Shower-In), Clean/Dirty জোন & ফিড গাড়ি ফগিং",
        "৩. কালার কোডেড বুট: বিভিন্ন সেকশনে আলাদা রঙের ইউনিফর্ম/বুট দিয়ে কর্মীর যাতায়াত নিয়ন্ত্রণ",
        "৪. মৃত মুরগী ধ্বংস: অন-সাইট ইনসিনারেটরে মৃত মুরগী পোড়ানো; স্থায়ী ভিজিটর রেজিস্টার রাখা"
      ],
    ),

    // 42. Egg Storage Management
    BroilerPSArticleItem(
      id: "egg_storage_management",
      titleEn: "Egg Storage Management.",
      titleBn: "ডিম সংরক্ষণ ব্যবস্থাপনা",
      subtitleBn: "ডিম সংরক্ষণ প্রটোকল (Egg Storage SOP)",
      subtitleEn: "RH ~75%, 3x Daily Temp Check, Climate-Controlled Transport & 3-Stage Thermal Rules",
      snippetBn: "1️⃣ আর্দ্রতা ৭৫%, দিনে ৩ বার তাপমাত্রা চেক, সপ্তাহে অন্তত ২ বার ডিম পরিবহন, Sweating প্রতিরোধ...",
      snippetEn: "1️⃣ Keep 75% RH; audit temp 3x daily; transport >=2x weekly; prevent egg sweating & 3 thermal stages...",
      imagePath: "assets/ps_broiler.jpg",
      detailsEn: [
        "📌 Controlled Cooling & 75% Relative Humidity SOP:\n• Allow eggs to cool gradually post-collection before transferring into final cold storage.\n• Maintain Relative Humidity (RH) at approximately 75% in the egg holding room to prevent egg moisture loss.",
        "📊 Daily 3x Thermal Audit & Recording SOP:\n• Record daily maximum and minimum temperatures and relative humidity on logging charts.\n• Audit thermometers 3 times daily: 1. Morning, 2. Noon, 3. Evening.",
        "💧 Condensation (Sweating) Prevention & Transport:\n• Moving cold eggs into warm/humid environments causes surface water condensation (sweating), enabling bacterial penetration into egg pores.\n• Prevention: Transport eggs using temperature-controlled, climate-regulated egg vehicles at least 2 times per week.",
        "🌐 Environmental Alignment Across 3 Locations:\n• Maintain thermal harmony across all 3 egg holding locations:\n  1. Farm Egg Storage Room\n  2. Egg Transport Vehicle\n  3. Hatchery Egg Store Room",
        "🌡️ 3-Stage Thermal Progression & Fluctuation Hazards:\n• Follow the 3-stage thermal progression:\n  Stage 1: Gradual cooling down from nest temperature post-lay.\n  Stage 2: Maintained cold storage at the hatchery egg store.\n  Stage 3: Controlled pre-warming prior to setting in incubators.\n⚠️ Temperature fluctuations during storage elevate Early Embryonic Mortality (EEM) and degrade day-old chick quality.\n\n👉 Constant temperature, 75% RH, and gradual pre-warming maximize hatchability and chick vigor."
      ],
      detailsBn: [
        "📌 ধীরে ঠান্ডা করা & ৭৫% আপেক্ষিক আর্দ্রতা (SOP)ঃ\n• ডিম সংগ্রহের পর সরাসরি স্টোরে না রেখে ধীরে ধীরে সংরক্ষণ কক্ষের তাপমাত্রায় ঠান্ডা হতে দেওয়া।\n• ডিমের অভ্যন্তরীণ পানি শুকাতে না দিতে ডিম সংরক্ষণ কক্ষে আপেক্ষিক আর্দ্রতা (RH) প্রায় ৭৫% বজায় রাখতে হবে।",
        "📊 দিনে ৩ বার তাপমাত্রা ও আর্দ্রতা রেকর্ডঃ\n• ডিম সংরক্ষণ কক্ষে প্রতিদিন সর্বোচ্চ ও সর্বনিম্ন তাপমাত্রা রেজিস্টার ডাটা চার্টে লিখে রাখা।\n• প্রতিদিন নির্দিষ্ট ৩টি সময়ে থার্মোমিটার ও হাইগ্রোমিটার পর্যবেক্ষণ করা: ১. সকাল, ২. দুপুর এবং ৩. সন্ধ্যা।",
        "💧 কনডেনসেশন (Sweating) প্রতিরোধ & পরিবহনঃ\n• ঠান্ডা ডিম হঠাৎ গরম ও বেশি আর্দ্র বাতাসে আনলে খোসায় পানি জমে (Sweating), যা জীবাণুকে খোসার রন্ধ্র দিয়ে ভেতরে ঢোকার সুযোগ দেয়।\n• সমাধান: ডিমের জন্য Temperature-controlled কভার্ড গাড়ি ব্যবহার করা এবং সপ্তাহে অন্তত ২ বার ডিম হ্যাচারিতে পরিবহন করা।",
        "🌐 ৩টি সংরক্ষণ স্থানের পরিবেশগত সমতাঃ\n• ডিমের মান ও ভ্রূণ বাঁচাতে ৩টি স্থানের তাপমাত্রা ও আর্দ্রতা সমান ও সামঞ্জস্যপূর্ণ রাখা আবশ্যক:\n  ১. ফার্মের ডিম সংরক্ষণ কক্ষ\n  ২. ডিম পরিবহন কভার্ড গাড়ি\n  ৩. হ্যাচারির ডিম সংরক্ষণ কক্ষ",
        "🌡️ তাপমাত্রা পরিবর্তনের ৩টি পর্যায় & ওঠানামার ঝুঁকিঃ\n• সঠিক তাপমাত্রা পরিবর্তনের ৩টি ক্রমান্বয়ে ধাপ মেনে চলতে হবে:\n  ধাপ ১: ডিম পাড়ার পর ধীরে ধীরে ঠান্ডা করা\n  ধাপ ২: হ্যাচারির স্টোর রুমে পরিমিত শীতল তাপমাত্রায় রাখা\n  ধাপ ৩: ইনকিউবেটরে দেওয়ার আগে pre-warming করে ধীরে ধীরে গরম করা\n⚠️ সংরক্ষণে বারবার তাপমাত্রা ওঠানামা করলে প্রাথমিক ভ্রূণ মৃত্যু (Early embryonic mortality) বাড়ে ও বাচ্চার মান নষ্ট হয়।\n\n👉 স্থির তাপমাত্রা, ৭৫% আর্দ্রতা ও নিয়মভিত্তিক Pre-warming সর্বোচ্চ হ্যাচেবিলিটি নিশ্চিত করে।"
      ],
      keyPointsEn: [
        "1. RH & Cooling: Cool eggs gradually post-lay; maintain ~75% Relative Humidity in store room",
        "2. Daily Logging: Audit max/min temp and RH 3 times daily (Morning, Noon, Evening)",
        "3. Climate Transport: Transport eggs >=2x weekly using climate-controlled vehicles to prevent sweating",
        "4. Thermal Harmony: Align temp across farm store, transport & hatchery; pre-warm eggs prior to setting"
      ],
      keyPointsBn: [
        "১. আর্দ্রতা & কুলিং: সংগ্রহের পর ধীরে ঠান্ডা করা; সংরক্ষণ কক্ষে প্রায় ৭৫% আপেক্ষিক আর্দ্রতা রাখা",
        "২. দৈনিক চেক: দিনে ৩ বার (সকাল, দুপুর, সন্ধ্যা) থার্মোমিটার ও আর্দ্রতা পর্যবেক্ষণ করে চার্টে লেখা",
        "৩. তাপমাত্রা নিয়ন্ত্রিত গাড়ি: Sweating এড়াতে জলবায়ু নিয়ন্ত্রিত গাড়িতে সপ্তাহে অন্তত ২ বার হ্যাচারিতে ডিম নেওয়া",
        "৪. পরিবেশের সমতা: ফার্ম স্টোর, গাড়ি ও হ্যাচারি স্টোরের তাপমাত্রা সমান রাখা; সেটিংয়ের আগে Pre-warming করা"
      ],
    ),

    // 43. Egg Hygiene Management
    BroilerPSArticleItem(
      id: "egg_hygiene_management",
      titleEn: "Egg Hygiene Management.",
      titleBn: "ডিমের স্বাস্থ্যবিধি ব্যবস্থাপনা",
      subtitleBn: "ডিমের স্বাস্থ্যবিধি প্রটোকল (Egg Hygiene & Sanitization SOP)",
      subtitleEn: "Sanitizing Agents (Formaldehyde, Paraformaldehyde, Peracetic Acid), Wetting Hazards & Triad Rules",
      snippetBn: "1️⃣ পরিষ্কার ডিমের গুরুত্ব, স্যানিটাইজার (ফরমালডিহাইড, পেরাসিটিক অ্যাসিড), ভিজা ডিম প্রতিরোধ, ঘনত্ব/তাপ/আর্দ্রতা...",
      snippetEn: "1️⃣ Clean egg priority; sanitizers (Formaldehyde, Peracetic Acid); avoid wet eggs; chemical triad rules...",
      imagePath: "assets/ps_broiler.jpg",
      detailsEn: [
        "📌 Value of Clean Egg Collection:\nCollecting clean eggs directly from manual nests or automatic community belts ensures maximum hatchability and yields top-tier day-old chicks.",
        "🧪 Approved Sanitization Agents & Alternatives:\n• Primary Gaseous Agents: Formaldehyde gas and Paraformaldehyde prills.\n• Safe Alternative: Peracetic Acid solutions (applied under controlled conditions).",
        "⚠️ Liquid Sanitizer Precautions & Wetting Hazards:\n• Avoid wetting eggshells when applying liquid sanitizers to prevent bacterial migration through shell pores.\n• Liquid sanitization is strictly recommended only in low-humidity environments with forced drying.",
        "⚙️ Mandatory Environmental Triad for Efficacy:\nTo achieve 100% sanitizer efficacy, the following triad must be precisely controlled:\n  1. Accurate Chemical Concentration\n  2. Correct Environmental Temperature\n  3. Regulated Relative Humidity",
        "💩 Impact of Organic Soil & Dirty Eggs:\n• Physical dirt and feces on eggshells rapidly degrade and neutralize sanitizer efficacy.\n• Sanitization is effective ONLY on physically clean eggs; never rely on sanitizers to clean dirty eggs.\n\n👉 Rigorous egg hygiene and precise sanitization safeguard embryonic health and chick quality."
      ],
      detailsBn: [
        "📌 পরিষ্কার ডিমের গুরুত্বঃ\nনেস্ট বা অটোমেটিক কমিউনিটি বেল্ট থেকে শতভাগ পরিষ্কার ডিম সংগ্রহ করা উচ্চমানের বাচ্চা উৎপাদন ও সর্বোচ্চ হ্যাচেবিলিটির প্রথম ও প্রধান শর্ত।",
        "🧪 অনুমোদিত স্যানিটাইজার & বিকল্প কেমিক্যালঃ\n• প্রামাণিক রাসায়নিক পদার্থ: ফরমালডিহাইড (Formaldehyde) এবং প্যারাফরমালডিহাইড (Paraformaldehyde)।\n• নিরাপদ বিকল্প: পেরাসিটিক অ্যাসিড (Peracetic Acid)।",
        "⚠️ তরল স্যানিটাইজার ব্যবহারের সতর্কতা & ভিজা ডিমের ঝুঁকিঃ\n• তরল স্যানিটাইজার বা স্প্রে করার সময় ডিমের খোসা ভিজে যাওয়া (wet eggs) সম্পূর্ণ প্রতিরোধ করতে হবে, যাতে খোসার রন্ধ্র দিয়ে জীবাণু ভেতরে ঢুকতে না পারে।\n• এই পদ্ধতি শুধুমাত্র কম আর্দ্রতার (low humidity) পরিবেশে দ্রুত শুকানোর সুব্যবস্থাসহ প্রয়োগ করা নিরাপদ।",
        "⚙️ কার্যকারিতার ৩টি পরিবেশগত পূর্বশর্ত (Environmental Triad)ঃ\nযেকোনো জীবাণুনাশক শতভাগ কার্যকর হতে হলে ৩টি পরিবেশগত সূচক সঠিক থাকা বাধ্যতামূলক:\n  ১. সঠিক রাসায়নিক ঘনত্ব (Chemical concentration)\n  ২. সঠিক রুম তাপমাত্রা (Correct temperature)\n  ৩. সঠিক আপেক্ষিক আর্দ্রতা (Correct humidity)",
        "💩 ময়লা ডিমের ক্ষতিকর প্রভাবঃ\n• ডিমের খোসায় বিষ্ঠা বা অর্গানিক ময়লা থাকলে তা স্যানিটাইজারের জীবাণুমুক্ত করার ক্ষমতা দ্রুত নষ্ট করে দেয়।\n• স্যানিটাইজেশন শুধুমাত্র পরিষ্কার ডিমে কার্যকর হয়; স্যানিটাইজার দিয়ে ময়লা ডিম পরিষ্কার করার চেষ্টা নিষিদ্ধ।\n\n👉 সঠিক ডিমের স্বাস্থ্যবিধি ও বিজ্ঞানসম্মত স্যানিটাইজেশন হ্যাচেবিলিটি ও বাচ্চার মান অক্ষুণ্ন রাখে।"
      ],
      keyPointsEn: [
        "1. Sanitizing Agents: Use Formaldehyde, Paraformaldehyde, or alternative Peracetic Acid",
        "2. Avoid Wet Eggs: Prevent eggshell wetting during liquid spraying; apply strictly in low-humidity zones",
        "3. Environmental Triad: Maintain exact Chemical Concentration, Temperature, and Relative Humidity",
        "4. Dirty Egg Hazard: Organic dirt neutralizes sanitizers; sanitization is effective ONLY on clean eggs"
      ],
      keyPointsBn: [
        "১. জীবাণুনাশক নির্বাচন: ফরমালডিহাইড, প্যারাফরমালডিহাইড বা বিকল্প পেরাসিটিক অ্যাসিড ব্যবহার",
        "২. ভিজা ডিম এড়ানো: স্প্রেকালে খোসা ভেজা নিষিদ্ধ; কেবল কম আর্দ্রতার স্থানে দ্রুত শুকানোর ব্যবস্থায় প্রয়োগ",
        "৩. পরিবেশের ৩ শর্ত: রাসায়নিকের সঠিক ঘনত্ব, উপযুক্ত তাপমাত্রা এবং সঠিক আর্দ্রতা বজায় রাখা",
        "৪. ময়লা ডিমের প্রভাব: বিষ্ঠা ও ময়লা স্যানিটাইজারের কার্যকারিতা নষ্ট করে; স্যানিটাইজেশন কেবল পরিষ্কার ডিমে কার্যকর"
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
          isEng ? "Broiler PS Management" : "ব্রয়লার পিএস ব্যবস্থাপনা",
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
    BroilerPSArticleItem item,
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
              builder: (_) => BroilerPSArticleDetailScreen(
                item: item,
                isEnglish: isEng,
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
                width: 76,
                height: 76,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFF00838F).withValues(alpha: 0.25),
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
                        Icons.pets_rounded,
                        color: Color(0xFF00838F),
                        size: 38,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 14),

              // Title, Subtitle, Snippet
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isEng ? item.titleEn : item.titleBn,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : const Color(0xFF0F172A),
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      isEng ? item.subtitleEn : item.subtitleBn,
                      style: TextStyle(
                        fontSize: 12.5,
                        color: isDark ? Colors.white70 : const Color(0xFF475569),
                        height: 1.25,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      isEng ? item.snippetEn : item.snippetBn,
                      style: TextStyle(
                        fontSize: 12,
                        color: isDark ? Colors.teal.shade300 : const Color(0xFF00695C),
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
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

class BroilerPSArticleDetailScreen extends StatelessWidget {
  final BroilerPSArticleItem item;
  final bool isEnglish;

  const BroilerPSArticleDetailScreen({
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
            fontSize: 17,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF00838F),
        foregroundColor: Colors.white,
        elevation: 0.5,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Image Header Card
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              clipBehavior: Clip.antiAlias,
              child: Stack(
                children: [
                  Image.asset(
                    item.imagePath,
                    height: 160,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 160,
                      color: const Color(0xFF00838F),
                      child: const Center(
                        child: Icon(Icons.pets_rounded, size: 60, color: Colors.white),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withValues(alpha: 0.85),
                            Colors.transparent,
                          ],
                        ),
                      ),
                      child: Text(
                        isEng ? item.subtitleEn : item.subtitleBn,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Key Quick Reference Card
            if (keyPoints.isNotEmpty) ...[
              Card(
                elevation: 2,
                color: isDark ? const Color(0xFF1E293B) : const Color(0xFFE0F2F1),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.stars_rounded, color: Color(0xFF00838F), size: 22),
                          const SizedBox(width: 8),
                          Text(
                            isEng ? "Quick Key Metrics" : "সংক্ষিপ্ত মূল লক্ষ্যমাত্রা",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Color(0xFF00838F),
                            ),
                          ),
                        ],
                      ),
                      const Divider(height: 18),
                      ...keyPoints.map(
                        (kp) => Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("📌 ", style: TextStyle(fontSize: 13)),
                              Expanded(
                                child: Text(
                                  kp,
                                  style: TextStyle(
                                    fontSize: 13.5,
                                    fontWeight: FontWeight.w600,
                                    color: isDark ? Colors.white : const Color(0xFF1E293B),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],

            // Detailed Content Points Card
            Text(
              isEng ? "Management Guidelines & Recommendations" : "ব্যবস্থাপনা নির্দেশিকা ও পদক্ষেপসমূহ",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : const Color(0xFF0F172A),
              ),
            ),
            const SizedBox(height: 10),

            Card(
              elevation: 2,
              color: isDark ? const Color(0xFF1E293B) : Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: List.generate(details.length, (idx) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: const BoxDecoration(
                              color: Color(0xFF00838F),
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              "${idx + 1}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              details[idx],
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.45,
                                color: isDark ? Colors.white70 : const Color(0xFF334155),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
