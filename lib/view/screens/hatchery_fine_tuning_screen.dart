import 'package:flutter/material.dart';
import 'hatchery_operation_guide_screen.dart';

class FineTuningItem {
  final String id;
  final String titleEn;
  final String titleBn;
  final String subtitlePrefixEn;
  final String subtitlePrefixBn;
  final String subtitleTextEn;
  final String subtitleTextBn;
  final IconData icon;
  final String descriptionEn;
  final String descriptionBn;
  final List<String> keyPointsEn;
  final List<String> keyPointsBn;
  final List<String> sopsEn;
  final List<String> sopsBn;

  const FineTuningItem({
    required this.id,
    required this.titleEn,
    required this.titleBn,
    required this.subtitlePrefixEn,
    required this.subtitlePrefixBn,
    required this.subtitleTextEn,
    required this.subtitleTextBn,
    required this.icon,
    required this.descriptionEn,
    required this.descriptionBn,
    required this.keyPointsEn,
    required this.keyPointsBn,
    required this.sopsEn,
    required this.sopsBn,
  });
}

class HatcheryFineTuningScreen extends StatefulWidget {
  final bool isEnglish;

  const HatcheryFineTuningScreen({super.key, required this.isEnglish});

  @override
  State<HatcheryFineTuningScreen> createState() => _HatcheryFineTuningScreenState();
}

class _HatcheryFineTuningScreenState extends State<HatcheryFineTuningScreen> {
  static const List<FineTuningItem> _items = [
    // 1. External Egg Quality
    FineTuningItem(
      id: "external_egg_quality",
      titleEn: "External Egg Quality (Advanced Selection Guide)",
      titleBn: "ডিমের বাহ্যিক গুণমান (উন্নত বাছাই গাইড)",
      subtitlePrefixEn: "🔎 Overview",
      subtitlePrefixBn: "🔎 ওভারভিউ",
      subtitleTextEn: "External egg quality is the first step of hatchery success",
      subtitleTextBn: "ডিমের বাহ্যিক গুণমান হলো হ্যাচারির সাফল্যের প্রথম ধাপ",
      icon: Icons.egg_rounded,
      descriptionEn:
          "External egg quality is the first step of hatchery success. Poor external eggs must be rejected before incubation.",
      descriptionBn:
          "ডিমের বাহ্যিক গুণমান হলো হ্যাচারির সাফল্যের প্রথম ধাপ। ইনকিউবেশনের পূর্বে নিম্নমানের বা ত্রুটিযুক্ত ডিম অবশ্যই বাতিল করতে হবে।",
      keyPointsEn: [
        "Dirty Eggs: Egg may contain manure, blood, dust, egg contents or conveyor marks.",
        "Misshaped Eggs: Too round, too long or irregular (flat-sided) eggs.",
        "Wrong Position: Blunt end (air cell side) must be upward. Use candling in dark room if unsure.",
        "Abnormal Shell Color: Too pale or too white in brown egg breeds.",
        "Poor Shell Quality: Thin, rough shell, wrinkles, body-check cracks.",
        "Hairline Cracks: Detected only by candling.",
        "Visible Cracks: Can be seen easily, membrane may be damaged.",
        "Size Problem: <50g or >70g eggs are not ideal."
      ],
      keyPointsBn: [
        "ময়লা ডিম: ডিমে বিষ্ঠা, রক্ত, ধুলাবালি, ডিমের উপাদান বা কনভেয়ারের দাগ থাকতে পারে।",
        "বিকৃত ডিম: অতিরিক্ত গোল, অতিরিক্ত লম্বা বা অনিয়মিত (একপাশে চ্যাপ্টা) ডিম।",
        "ভুল অবস্থান: ভোঁতা মাথা (এয়ার সেল সাইড) অবশ্যই ওপরের দিকে থাকবে। নিশ্চিত না হলে ক্যান্ডলিং করুন।",
        "অস্বাভাবিক খোসার রঙ: বাদামী ডিমের জাতের ক্ষেত্রে ডিম বেশি ফ্যাকাশে বা সাদা হওয়া।",
        "খোসার নিম্ন গুণমান: পাতলা, খসখসে খোসা, রিঙ্কেলস বা বডি-চেক ফাটা।",
        "সূক্ষ্ম ফাটা (Hairline Cracks): শুধুমাত্র ক্যান্ডলিংয়ের মাধ্যমে ধরা পড়ে।",
        "দৃশ্যমান ফাটা: সহজে চোখে পড়ে, ভেতরের পর্দা ক্ষতিগ্রস্ত হতে পারে।",
        "ওজন সমস্যা: ৫০ গ্রামের কম বা ৭০ গ্রামের বেশি ডিম আদর্শ নয়।"
      ],
      sopsEn: [
        "Quality Rule: If more than 3 eggs (out of 30 sample) show defects → improve egg handling."
      ],
      sopsBn: [
        "কোয়ালিটি রুল: যদি ৩০টি ডিমের নমুনার মধ্যে ৩টির বেশি ডিমে ত্রুটি দেখা যায় → ডিম হ্যান্ডলিং উন্নত করুন।"
      ],
    ),

    // 2. Internal Egg Quality
    FineTuningItem(
      id: "internal_egg_quality",
      titleEn: "Internal Egg Quality (Embryo Support Check)",
      titleBn: "ডিমের অভ্যন্তরীণ গুণমান (ভ্রূণ বিকাশ পরীক্ষা)",
      subtitlePrefixEn: "🔎 Overview",
      subtitlePrefixBn: "🔎 ওভারভিউ",
      subtitleTextEn: "Albumen firming, Haugh unit, vitelline membrane & air cell placement",
      subtitleTextBn: "অ্যালবুমেন ঘনত্ব, হফ ইউনিট, কুসুম মেমব্রেন ও এয়ার সেল অবস্থান",
      icon: Icons.opacity_rounded,
      descriptionEn:
          "Internal egg composition directly provides nutrients and physical cushioning to the developing embryo throughout the 21-day incubation period.",
      descriptionBn:
          "ডিমের অভ্যন্তরীণ উপাদান ২১ দিনের ইনকিউবেশন কাল জুড়ে ভ্রূণকে প্রয়োজনীয় পুষ্টি ও সুরক্ষা প্রদান করে।",
      keyPointsEn: [
        "Haugh Unit Standard: Fresh eggs should achieve >75 Haugh Units for optimal embryo support.",
        "Albumen Thickness: Dense thick albumen keeps the yolk centered and cushions early blastoderm development.",
        "Vitelline Membrane Integrity: Strong yolk membrane prevents yolk leakage into albumen.",
        "Air Cell Stability: Air cell must be fixed at the broad end. Reject eggs with floating, displaced, or loose air cells.",
        "Inclusions: Cull eggs containing blood spots, meat spots, or double yolks."
      ],
      keyPointsBn: [
        "হফ ইউনিট মানদণ্ড: তাজা ডিমের হফ ইউনিট মান >৭৫ থাকা উচিত।",
        "অ্যালবুমেনের ঘনত্ব: ঘন অ্যালবুমেন কুসুমকে কেন্দ্রে রাখে এবং ভ্রূণকে সুরক্ষা দেয়।",
        "কুসুম মেমব্রেনের শক্তি: মজবুত মেমব্রেন অ্যালবুমেনে কুসুম মিশে যাওয়া রোধ করে।",
        "এয়ার সেলের স্থায়িত্ব: এয়ার সেল সবসময় ডিমের মোটা মাথায় স্থির থাকতে হবে। আলগা বা চলন্ত এয়ার সেলযুক্ত ডিম বাদ দিন।",
        "ত্রুটিপূর্ণ কণা: রক্তের দাগ, মাংসের স্পট বা দ্বিকুষুম যুক্ত ডিম ছাঁটাই করুন।"
      ],
      sopsEn: [
        "Perform sample Haugh Unit measurements on fresh eggs weekly.",
        "Candle sample eggs to check air-cell position before setting.",
        "Avoid prolonged egg storage to prevent albumen liquefaction."
      ],
      sopsBn: [
        "প্রতি সপ্তাহে তাজা ডিমের নমুনা হফ ইউনিট পরিমাপ করুন।",
        "সেটিংয়ের আগে এয়ার সেলের অবস্থান দেখতে ডিম ক্যান্ডলিং করুন।",
        "অ্যালবুমেন পাতলা হওয়া রোধ করতে দীর্ঘদিন ডিম জমিয়ে রাখা এড়িয়ে চলুন।"
      ],
    ),

    // 3. Fertility & Embryo Quality Monitoring
    FineTuningItem(
      id: "fertility_embryo_monitoring",
      titleEn: "Fertility & Embryo Quality Monitoring",
      titleBn: "ফার্টিলিটি ও ভ্রূণ গুণমান মনিটর (Causes of Embryo Mortality)",
      subtitlePrefixEn: "🔎 Overview",
      subtitlePrefixBn: "🔎 ওভারভিউ",
      subtitleTextEn: "Causes of embryo mortality, breakout diagnosis & hatchery vs farm analysis",
      subtitleTextBn: "ভ্রূণ মৃত্যুর কারণ, ব্রেকআউট নির্ণয় ও হ্যাচারি বনাম খামার বিশ্লেষণ",
      icon: Icons.biotech_rounded,
      descriptionEn:
          "Identifying specific causes of embryo mortality during incubation residue breakout enables precise troubleshooting between hatchery conditions and farm/breeder flock management.",
      descriptionBn:
          "ইনকিউবেশন রেসিডিউ ব্রেকআউটের সময় ভ্রূণ মৃত্যুর নির্দিষ্ট কারণ চিহ্নিতকরণ হ্যাচারির পরিবেশ এবং খামার/ব্রিডার ব্যবস্থাপনার সমস্যা পৃথকভাবে নিরসনে সাহায্য করে।",
      keyPointsEn: [
        "1. Early Dead (1–7 Days):\n   • Hatchery: Formalin exposure 12–96h, slow warmup, egg surface condensation, wrong turning angle/freq, long or fluctuating storage.\n   • Farm: Inadequate egg collection, poor breeder nutrition, contamination, floor/soiled eggs.",
        "2. Mid Dead (8–14 Days):\n   • Hatchery: Embryo temperature too high.\n   • Farm: Breeder nutritional deficiencies, egg contamination.",
        "3. Late Dead (15–19 Days):\n   • Hatchery: Setter/hatcher temp or humidity incorrect, shell temp/water loss errors, transfer damage, upside down setting, insufficient water loss.\n   • Farm: Breeder nutritional deficiencies, contamination.",
        "4. At Pipping (20–21 Days):\n   • Hatchery: Inadequate turning, upside down setting, transfer damage, excessive hatcher fumigation, prolonged storage.\n   • Farm: Breeder nutritional deficiencies.",
        "5. Contamination:\n   • Hatchery: Inappropriate shell disinfection, surface condensation during transport/storage, thin/cracked shells, high hatchery ambient contamination.\n   • Farm: High floor egg percentage, poor nest hygiene.",
        "6. Malpositions & Malformations:\n   • Hatchery: Head in small end (upside down setting, high temp, shallow turning); Beak above wing (heat stress); Exposed brain (early high temp); Ectopic viscera (mid high temp); Extra limbs (rough handling/jarring).\n   • Farm: Beak above wing (linoleic acid deficiency); Poor nest hygiene."
      ],
      keyPointsBn: [
        "১. প্রারম্ভিক মৃত্যু (১-৭ দিন):\n   • হ্যাচারি: ফরমালিন এক্সপোজার ১২-৯৬ ঘণ্টা, দেরিতে তা ওঠা, কন্ডেনসেশন, ভুল টার্নিং কোণ/ফ্রিকোয়েন্সি, দীর্ঘ বা উঠানামা করা স্টোরেজ temp।\n   • ফার্ম: অপর্যাপ্ত ডিম সংগ্রহ, পুষ্টির ঘাটতি, জীবাণু সংক্রমণ, ফ্লোর/নোংরা ডিম।",
        "২. মধ্যবর্তী মৃত্যু (৮-১৪ দিন):\n   • হ্যাচারি: ভ্রূণের তাপমাত্রা অতিরিক্ত বেশি।\n   • ফার্ম: ব্রিডারের পুষ্টির ঘাটতি, ডিমের জীবাণু সংক্রমণ।",
        "৩. শেষ পর্যায় মৃত্যু (১৫-১৯ দিন):\n   • হ্যাচারি: সেটার/হ্যাচার তাপমাত্রা বা আর্দ্রতা ভুল, ট্রান্সফার ড্যামেজ, উল্টো ডিম বসানো, অপর্যাপ্ত পানি হ্রাস।\n   • ফার্ম: ব্রিডারের পুষ্টির ঘাটতি, জীবাণু সংক্রমণ।",
        "৪. পিপিং পর্যায় মৃত্যু (২০-২১ দিন):\n   • হ্যাচারি: অপর্যাপ্ত টার্নিং, উল্টো ডিম সেটিং, ট্রান্সফার ড্যামেজ, হ্যাচারে অতিরিক্ত ফিউমিগেশন, দীর্ঘ ডিম স্টোরেজ।\n   • ফার্ম: ব্রিডারের পুষ্টির ঘাটতি।",
        "৫. জীবাণু সংক্রমণ (Contamination):\n   • হ্যাচারি: অনুপযুক্ত খোসা জীবাণুমুক্তকরণ, স্টোরেজ/পরিবহনে ঘাম বা ঘনীভবন, পাতলা/ফাটা খোসা, হ্যাচারির অভ্যন্তরীণ উচ্চ জীবাণু।\n   • ফার্ম: বেশি ফ্লোর ডিম, নোংরা নেস্ট।",
        "৬. ভুল অবস্থান ও বিকৃতি (Malpositions & Malformations):\n   • হ্যাচারি: সরু মাথায় মাথা (উল্টো ডিম, উচ্চ তাপ, কম টার্নিং); ডানার ওপর ঠোঁট (হিট স্ট্রেস); উন্মুক্ত মস্তিষ্ক (প্রারম্ভিক উচ্চ তাপ); বহিরাগত নাড়িভুঁড়ি (মধ্যবর্তী উচ্চ তাপ); অতিরিক্ত পা/ডানা (পরিবহনে ঝাঁকুনি/আঘাত)।\n   • ফার্ম: ডানার ওপর ঠোঁট (লিনোলেনিক এসিড ঘাটতি); নোংরা নেস্ট।"
      ],
      sopsEn: [
        "Perform routine 21-day residue breakout analysis for all unhatched eggs.",
        "Maintain accurate records categorizing mortality into Early, Mid, Late, Pipped, Contaminated, and Malformed stages.",
        "Cross-check high early/late mortality with hatchery logger graphs and farm nest hygiene reports."
      ],
      sopsBn: [
        "অনফোটা ডিমের ক্ষেত্রে নিয়মিত ২১-দিনের রেসিডিউ ব্রেকআউট বিশ্লেষণ পরিচালনা করুন।",
        "মৃত্যুর ধরণ অনুযায়ী (প্রারম্ভিক, মধ্যবর্তী, লেট, পিপিং, কন্টামিনেশন ও বিকৃতি) সঠিক রেকর্ড রাখুন।",
        "উচ্চ প্রারম্ভিক/লেট মৃত্যুর হার পাওয়া গেলে হ্যাচারির ডেটালগার গ্রাফ এবং ফার্মের নেস্ট হাইজিন রিপোর্টের সাথে মিলিয়ে দেখুন।"
      ],
    ),

    // 4. Setter Temperature Monitoring
    FineTuningItem(
      id: "setter_temperature_monitoring",
      titleEn: "Setter Temperature Monitoring (Advanced SOP)",
      titleBn: "সেটার তাপমাত্রা মনিটরিং (উন্নত SOP)",
      subtitlePrefixEn: "🔎 Principles",
      subtitlePrefixBn: "🔎 নীতিমালা",
      subtitleTextEn: "Embryo shell temperature (EST), 37.5–37.8°C control & thermal mapping",
      subtitleTextBn: "ভ্রূণ ত্বক তাপমাত্রা (EST), ৩৭.৫–৩৭.৮°সে নিয়ন্ত্রণ ও থার্মাল ম্যাপিং",
      icon: Icons.thermostat_rounded,
      descriptionEn:
          "Incubation temperature controls embryo metabolic rate, organ development, and overall hatching time.",
      descriptionBn:
          "ইনকিউবেশন তাপমাত্রা ভ্রূণের মেটাবলিক রেট, অঙ্গের বিকাশ এবং সামগ্রিক বাচ্চা ফোটার সময়কাল নিয়ন্ত্রণ করে।",
      keyPointsEn: [
        "Air Temperature Standard: Operating air temperature target 37.5°C–37.8°C (99.5°F–100.0°F).",
        "Embryo Shell Temperature (EST): Maintain EST strictly at 37.8°C (100.0°F) from Day 1 to Day 18 using infrared ear thermometer.",
        "Overheating Warning: EST above 38.3°C (101.0°F) during late incubation causes unhealed navels, organ damage, and weak chicks.",
        "Thermal Mapping: Calibrate machine sensors monthly and eliminate cold/hot spots across setter trolleys."
      ],
      keyPointsBn: [
        "বাতাসের তাপমাত্রা মানদণ্ড: সেটারের এয়ার টেম্পারেচার ৩৭.৫–৩৭.৮°সে (৯৯.৫–১০০.০°ফারেনহাইট) তে রাখুন।",
        "ভ্রূণের ত্বক তাপমাত্রা (EST): ইনফ্রারেড থার্মোমিটার দিয়ে ১ম থেকে ১৮তম দিন পর্যন্ত EST নিখুঁতভাবে ৩৭.৮°সে (১০০.০°ফা) বজায় রাখুন।",
        "ওভারহিটিং সতর্কবার্তা: শেষের দিকে EST ৩৮.৩°সে (১০১.০°ফা) এর বেশি হলে কাঁচা নাভি, অঙ্গের ক্ষতি ও দুর্বল বাচ্চা তৈরি হয়।",
        "থার্মাল ম্যাপিং: প্রতি মাসে সেন্সর ক্যালিব্রেট করুন এবং ট্রলির মধ্যকার হট/কোল্ড স্পট দূর করুন।"
      ],
      sopsEn: [
        "Measure EST on 36 eggs per setter trolley daily at top, middle, and bottom positions.",
        "Calibrate setter temperature sensors using a precision reference thermometer.",
        "Maintain clean circulation fans and dampers to ensure uniform airflow."
      ],
      sopsBn: [
        "প্রতিদিন সেটার ট্রলির উপর, মাঝ ও নিচের ৩৬টি ডিমের EST পরিমাপ করুন।",
        "নিখুঁত রেফারেন্স থার্মোমিটার দিয়ে সেটার সেন্সর ক্যালিব্রেট করুন।",
        "সমান বায়ুসঞ্চালন নিশ্চিত করতে সার্কুলেশন ফ্যান ও ড্যাম্পার পরিষ্কার রাখুন।"
      ],
    ),

    // 5. Chick Comfort Monitoring System
    FineTuningItem(
      id: "chick_comfort_monitoring",
      titleEn: "Chick Comfort Monitoring System",
      titleBn: "বাচ্চার আরাম ও ভেন্ট তাপমাত্রা মনিটরিং (Chick Comfort SOP)",
      subtitlePrefixEn: "🌡️ Ideal Vent Temp",
      subtitlePrefixBn: "🌡️ আদর্শ ভেন্ট temp",
      subtitleTextEn: "39.4–40.5°C vent temp, ThermoScan® measurement procedure & diagnosis",
      subtitleTextBn: "৩৯.৪–৪০.৫°সে ভেন্ট temp, থার্মোস্ক্যান® পরিমাপ পদ্ধতি ও রোগ নির্ণয়",
      icon: Icons.child_care_rounded,
      descriptionEn:
          "Day-old chicks cannot self-regulate body temperature. Measuring vent temperature with a Braun ThermoScan® IRT thermometer ensures chicks remain in their thermoneutral comfort zone (39.4–40.5°C) from hatch to farm brooding.",
      descriptionBn:
          "একদিনের বাচ্চা নিজস্ব শরীরের তাপমাত্রা নিজে নিয়ন্ত্রণ করতে পারে না। ব্রাউন থার্মোস্ক্যান® থার্মোমিটার দিয়ে ভেন্ট তাপমাত্রা মেপে বাচ্চার স্বস্তিদায়ক তাপাঞ্চল (৩৯.৪–৪০.৫°সে) বজায় রাখা আবশ্যক।",
      keyPointsEn: [
        "1. Why Chick Comfort Matters:\n   • Newly hatched chicks cannot control body temp; incorrect temp causes stress, rapid water loss, and poor broiler performance.",
        "2. Measuring Method & Comfort Indicators:\n   • Use medical ear thermometer (Braun ThermoScan® IRT4520).\n   • Optimum Vent Temperature: 39.4–40.5°C (103–105°F).\n   • <39.4°C (Too Cold): Huddling in corners, cold feet and legs.\n   • 39.4–40.5°C (Ideal): Quiet, alert & evenly spread out in boxes.\n   • >40.5°C (Too Hot): Open-beak panting, wing spreading & dehydration.",
        "3. Sampling Locations & Timing:\n   • Test in hatchers, chick holding rooms, transport trucks, and first 2 days of farm brooding.\n   • Measure within 10 minutes of removing chicks from environment.\n   • Sample 5 chicks per position from top, middle, and bottom of box stacks, near walls, doors, and draft areas.",
        "4. Step-by-Step Measurement Procedure:\n   • Step 1: Ensure clean tip with a new plastic probe cover.\n   • Step 2: Sample 5 chicks per stack (avoid center chicks of a huddle; reject wet/dirty vents).\n   • Step 3: Hold chick expose vent by pushing rump gently upward with thumb.\n   • Step 4: Place ThermoScan tip gently onto bare vent skin, press button, wait until light stops flashing, log result.",
        "5. Diagnostic Interpretation & Actions:\n   • Vent Temp <39.4°C (<103°F) [Cold]: Increase holding temp, check cold air drafts, dry wet floors/chicks (post-vaccination), fix box circulation & reduce carousel time.\n   • Vent Temp >40.5°C (>105°F) [Hot]: Decrease holding temp, improve box air circulation, widen space between chick boxes, walls, and heaters."
      ],
      keyPointsBn: [
        "১. কেন বাচ্চার আরাম গুরুত্বপূর্ণ:\n   • সদ্য ফোটা বাচ্চা শরীরের তাপমাত্রা নিয়ন্ত্রণ করতে পারে না; ভুল তাপমাত্রা স্ট্রেস, দ্রুত পানিশূন্যতা ও খামারে খারাপ পারফরম্যান্সের কারণ হয়।",
        "২. পরিমাপের নিয়ম ও বাচ্চার আচরণ:\n   • ব্রাউন থার্মোস্ক্যান® ইনফ্রারেড থার্মোমিটার ব্যবহার করুন।\n   • আদর্শ ভেন্ট (পায়ুপথ) তাপমাত্রা: ৩৯.৪–৪০.৫°সে (১০৩–১০৫°ফা)।\n   • <৩৯.৪°সে (অতিরিক্ত ঠান্ডা): কোণায় দলা পাকিয়ে থাকা, পা ঠান্ডা থাকা।\n   • ৩৯.৪–৪০.৫°সে (আদর্শ তাপ): শান্ত, চঞ্চল ও বক্সে সমানভাবে ছড়ানো।\n   • >৪০.৫°সে (অতিরিক্ত গরম): মুখ হাঁ করে হাঁপানো, ডানা মেলা ও ডিহাইড্রেশন।",
        "৩. নমুনা সংগ্রহের স্থান ও সময়:\n   • হ্যাচারি রুম, হোল্ডিং রুম, ট্রাক এবং খামারে ব্রুডিংয়ের ১ম ২ দিন মেপে দেখুন।\n   • রুম/ইনকিউবেটর থেকে বের করার ১০ মিনিটের মধ্যে পরিমাপ সম্পন্ন করুন।\n   • ট্রলি/বক্সের ওপর, মাঝ ও নিচ থেকে এবং দেয়াল ও দরজার কাছের বক্সে টেস্ট করুন।",
        "৪. পরিমাপের ধাপসমূহ:\n   • ধাপ ১: প্রোপের মাথায় নতুন প্লাস্টিক কভার লাগিয়ে নিন।\n   • ধাপ ২: প্রতি পজিশনে ৫টি বাচ্চা নির্বাচন করুন (দলা পাকানো বাচ্চার মাঝখান থেকে নেবেন না; ভেজা ভেন্ট বাদ দিন)।\n   • ধাপ ৩: বুড়ো আঙুল দিয়ে বাচ্চার পিঠ সামান্য উঁচু করে ভেন্ট অনাবৃত করুন।\n   • ধাপ ৪: থার্মোমিটারের টিপ ভেন্টের খালি চামড়ায় হালকাভাবে ঠেকিয়ে বোতাম চাপুন, লাইট বন্ধ হলে রিডিং রেকর্ড করুন।",
        "৫. রেজাল্ট বিশ্লেষণ ও করণীয়:\n   • ভেন্ট Temp <৩৯.৪°সে [ঠান্ডা]: হোল্ডিং রুমের তাপ বাড়ান, বাতাসের ঝাপটা বন্ধ করুন, ভেজা মেঝে/বাচ্চা শুকান, বক্সের চারপাশের বায়ুপ্রবাহ ঠিক করুন।\n   • ভেন্ট Temp >৪০.৫°সে [গরম]: হোল্ডিং রুমের তাপ কমান, বক্সের মধ্যকার বায়ুপ্রবাহ বাড়ান, দেয়াল ও হিটার থেকে বক্সের দূরত্ব বাড়ান।"
      ],
      sopsEn: [
        "Use Braun ThermoScan® IRT4520 with fresh probe cover for all vent checks.",
        "Measure 5 chicks per box stack position within 10 minutes of removal.",
        "Target strictly 39.4–40.5°C vent temp; adjust room HVAC immediately upon variance."
      ],
      sopsBn: [
        "ভেন্ট পরীক্ষার জন্য নতুন প্রোপ কভার সহ ব্রাউন থার্মোস্ক্যান® থার্মোমিটার ব্যবহার করুন।",
        "রুম থেকে বের করার ১০ মিনিটের মধ্যে প্রতি স্ট্যাকের ৫টি বাচ্চার ভেন্ট মেপে দেখুন।",
        "কঠোরভাবে ৩৯.৪–৪০.৫°সে ভেন্ট temp টার্গেট করুন; ব্যতিক্রম হলে দ্রুত রুমের এইচভিএসি অ্যাডজাস্ট করুন।"
      ],
    ),

    // 6. Egg Turning System
    FineTuningItem(
      id: "egg_turning_system",
      titleEn: "Egg Turning System (Critical Factor)",
      titleBn: "ডিম টার্নিং সিস্টেম মনিটরিং (Egg Turning SOP)",
      subtitlePrefixEn: "🔎 Importance",
      subtitlePrefixBn: "🔎 গুরুত্ব",
      subtitleTextEn: "Hourly 38–45° turning angle, frequency check, failure causes & diagnosis",
      subtitleTextBn: "ঘণ্টায় ৩৮–৪৫° টার্নিং কোণ, ফ্রিকোয়েন্সি চেক, ব্যর্থতার কারণ ও সমাধান",
      icon: Icons.sync_rounded,
      descriptionEn:
          "Egg turning from Day 0 to Day 15 is essential for normal embryonic membrane movement, nutrient absorption, and uniform airflow distribution across the setter.",
      descriptionBn:
          "০ থেকে ১৫তম দিন পর্যন্ত ডিম ঘুরানো (টার্নিং) ভ্রূণের মেমব্রেন চলাচল, অ্যালবুমেন থেকে পুষ্টি শোষণ এবং সেটারের সর্বত্র সমান বাতাস চলাচলের জন্য অপরিহার্য।",
      keyPointsEn: [
        "1. Critical Turning Factors:\n   • Frequency: Turn eggs once every 1 hour (24 times daily).\n   • Angle: 38°–45° from horizontal. Turning angles <38° reduce hatchability.\n   • Smoothness: Smooth motion without jarring or shaking to avoid rupturing delicate embryonic blood vessels.",
        "2. Inspection Protocol (Frequency & Angle):\n   • Check initial startup turn for smooth motion and full angle coverage in both directions.\n   • Perform physical checks at least 3 times daily at consistent, ODD-HOUR intervals to verify tilt direction alternates.\n   • Measure actual plastic tray angle (not just metal frame) on middle trolleys using an angle protractor under automatic operation.",
        "3. Signs of Turning Inadequacy:\n   • Increased early embryo mortality (Days 0–7).\n   • Increased late embryo mortality.\n   • High frequency of malpositions (especially upside down eggs).\n   • Sticky chicks with unabsorbed albumen.",
        "4. Causes of Turning Failure:\n   • Trolley not properly engaged with turning mechanism.\n   • Worn trolley wheels causing misalignment.\n   • Turning sensor or microswitch failure.\n   • Software error or incorrect programming.\n   • No pneumatic air pressure or electrical power supply to actuator.\n   • Mechanical actuator/cylinder fault."
      ],
      keyPointsBn: [
        "১. গুরুত্বপূর্ণ টার্নিং মানদণ্ড:\n   • ফ্রিকোয়েন্সি: প্রতি ১ ঘণ্টায় ১ বার (দিনে ২৪ বার) ডিম ঘুরাতে হবে।\n   • কোণ (Angle): আনুভূমিক থেকে ৩৮°–৪৫° কোণ। ৩৮° এর কম কোণ হ্যাচেবিলিটি কমিয়ে দেয়।\n   • মসৃণতা: রক্তনালী ছেঁড়া রোধ করতে কোনো প্রকার ঝাকুনি ছাড়া মসৃণভাবে ঘুরতে হবে।",
        "২. পরিদর্শন পদ্ধতি (ফ্রিকোয়েন্সি ও কোণ):\n   • মেশিন চালুর প্রথম সম্পূর্ণ টার্নিং পর্যবেক্ষণ করুন।\n   • প্রতিদিন অন্তত ৩ বার বিজোড়-ঘণ্টা পরপর সেটার চেক করে টার্নিংয়ের দিক পরিবর্তন নিশ্চিত করুন।\n   • স্বয়ংক্রিয় মেকানিজম চলাকালে ডিজিটাল প্রোট্র্যাক্টর দিয়ে প্লাস্টিক ট্রে-এর কোণ (৩৮-৪৫°) মেপে দেখুন।",
        "৩. টার্নিং ত্রুটির লক্ষণ:\n   • প্রারম্ভিক ভ্রূণ মৃত্যু বৃদ্ধি (০-৭ দিন)।\n   • লেট ভ্রূণ মৃত্যু বৃদ্ধি।\n   • উল্টো মাথা সহ ভ্রূণের ভুল অবস্থান বৃদ্ধি।\n   • কাঁচা অ্যালবুমেন মাখা আঠালো (Sticky) বাচ্চা।",
        "৪. টার্নিং বন্ধ হওয়ার সম্ভাব্য কারণসমূহ:\n   • ট্রলি মেকানিজমের সাথে সঠিকভাবে লক না হওয়া।\n   • ট্রলির চাকা ক্ষয় হয়ে অসামঞ্জস্য তৈরি হওয়া।\n   • টার্নিং সেন্সর বা মাইক্রোসুইচ নষ্ট হওয়া।\n   • সফটওয়্যার ত্রুটি বা প্রোগ্রামিং ভুল।\n   • নিউমেটিক এয়ার বা বিদ্যুৎ সংযোগ বন্ধ থাকা।\n   • টার্নিং এ্যাকচুয়েটর বা সিলিন্ডার ত্রুটিপূর্ণ হওয়া।"
      ],
      sopsEn: [
        "Check setter tilt direction 3 times daily at odd-hour intervals.",
        "Verify plastic tray turning angle reaches 38–45° using an angle protractor.",
        "Immediately test pneumatic cylinder and sensors if trays fail to alternate."
      ],
      sopsBn: [
        "প্রতিদিন বিজোড়-ঘণ্টার বিরতিতে ৩ বার সেটারের ডিমের হেলে থাকার দিক চেক করুন।",
        "ডিজিটাল প্রোট্র্যাক্টর দিয়ে প্লাস্টিক ট্রের কোণ ৩৮–৪৫° পৌঁছাচ্ছে কিনা নিশ্চিত করুন।",
        "ট্রে না ঘুরলে সাথে সাথে নিউমেটিক সিলিন্ডার, এয়ার চাপ ও সেন্সর টেস্ট করুন।"
      ],
    ),

    // 7. SPIDES Technology
    FineTuningItem(
      id: "spides_technology",
      titleEn: "SPIDES (Hatchability Improvement Technology)",
      titleBn: "স্পাইডস (হ্যাচেবিলিটি উন্নয়ন প্রযুক্তি)",
      subtitlePrefixEn: "🔎 Overview",
      subtitlePrefixBn: "🔎 ওভারভিউ",
      subtitleTextEn: "Short period incubation during egg storage for prolonged stored eggs (>7d)",
      subtitleTextBn: "দীর্ঘ সংরক্ষিত ডিমের (>৭ দিন) হ্যাচেবিলিটি বজায় রাখতে স্পাইডস প্রযুক্তি",
      icon: Icons.auto_awesome_rounded,
      descriptionEn:
          "SPIDES (Short Period of Incubation During Egg Storage) restores hatchability and chick quality when hatching eggs are stored longer than 7 days.",
      descriptionBn:
          "SPIDES (সংরক্ষণকালে স্বল্পমেয়াদী ইনকিউবেশন) প্রযুক্তি ৭ দিনের বেশি ডিম জমিয়ে রাখার ফলে হ্যাচেবিলিটি হ্রাস পাওয়া রোধ করে।",
      keyPointsEn: [
        "Indication: Apply SPIDES when egg storage duration exceeds 7 days (up to 21 days storage).",
        "Procedure: Warm stored eggs up to incubation temperature (37.5°C / 99.5°F for 3 to 6 hours) every 4–5 days of storage.",
        "Cooling Phase: Cool eggs slowly back down to storage room temperature (15–18°C) after heating.",
        "Benefits: Gains 4–8% higher hatchability, reduces late dead-in-shell mortality, narrows hatch window, and improves chick uniformity."
      ],
      keyPointsBn: [
        "ব্যবহারের ক্ষেত্র: ডিমের সংরক্ষণকাল ৭ দিনের বেশি (সর্বোচ্চ ২১ দিন পর্যন্ত) হলে SPIDES প্রয়োগ করুন।",
        "পদ্ধতি: সংরক্ষণের প্রতি ৪–৫ দিন পর পর ডিমকে ৩ থেকে ৬ ঘণ্টার জন্য ইনকিউবেশন তাপমাত্রায় (৩৭.৫°সে) প্রাক-উ উত্তপ্ত করুন।",
        "শীতলীকরণ পর্যায়: গরম করার পর ডিমকে ধীরে ধীরে পুনরায় সংরক্ষণাগারের স্বাভাবিক তাপমাত্রায় (১৫–১৮°সে) নামিয়ে আনুন।",
        "সুবিধা: হ্যাচেবিলিটি ৪–৮% বৃদ্ধি পায়, লেট ডেড-ইন-শেল মৃত্যু কমে, হ্যাচ উইন্ডো ছোট হয় ও বাচ্চার ইউনিফরমিটি বাড়ে।"
      ],
      sopsEn: [
        "Schedule SPIDES treatment on Day 4 and Day 9 for eggs stored over 10 days.",
        "Ensure egg shell temperature reaches at least 32°C (90°F) during treatment.",
        "Cool eggs down at a controlled rate of 0.5°C per hour post-treatment."
      ],
      sopsBn: [
        "১০ দিনের বেশি সংরক্ষিত ডিমের জন্য ৪র্থ ও ৯ম দিনে SPIDES চিকিৎসা নির্ধারণ করুন।",
        "চিকিৎসাকালে ডিমের খোসার তাপমাত্রা অন্তত ৩২°সে (৯০°ফা) স্পর্শ করেছে কিনা তা নিশ্চিত করুন।",
        "চিকিৎসা শেষে প্রতি ঘণ্টায় ০.৫°সে হারে ডিম ধীরে ধীরে ঠান্ডা করুন।"
      ],
    ),

    // 8. Complete Incubation Guide Outline
    FineTuningItem(
      id: "incubation_guide_outline",
      titleEn: "Complete Incubation Guide Outline",
      titleBn: "সম্পূর্ণ ইনকিউবেশন গাইড আউটলাইন",
      subtitlePrefixEn: "🔎 Overview",
      subtitlePrefixBn: "🔎 ওভারভিউ",
      subtitleTextEn: "Egg handling, setter (1-18d), transfer, hatcher (19-21d) & chick handling",
      subtitleTextBn: "ডিম হ্যান্ডলিং, সেটার (১-১৮ দিন), ট্রান্সফার, হ্যাচার (১৯-২১ দিন) ও বাচ্চা হ্যান্ডলিং",
      icon: Icons.assignment_rounded,
      descriptionEn:
          "Master step-by-step master SOP outline covering egg collection, transport, storage, setter programs, candling, transfer, hatcher programs, and post-hatch chick processing.",
      descriptionBn:
          "ডিম সংগ্রহ, পরিবহন, স্টোরেজ, সেটার প্রোগ্রামিং, ক্যান্ডলিং, ট্রান্সফার, হ্যাচার নিয়ন্ত্রণ এবং ফোটার পর বাচ্চা প্রসেসিংয়ের পূর্ণাঙ্গ মাস্টার আউটলাইন।",
      keyPointsEn: [
        "1. Egg Handling:\n   • At breeder farm & transport to hatchery\n   • Receipt & quality control (grading/weight)\n   • Repack in setter trays and trolleys\n   • Pre-storage incubation (SPIDES) & storage\n   • Disinfection & dry fumigation",
        "2. Incubation in Setter (Day 1–18):\n   • Single-stage vs Multi-stage systems\n   • Incubation program setter (temperature, humidity, ventilation & turning angle)",
        "3. Egg Transfer (Day 18):\n   • Candling (clear egg & early dead removal)\n   • Transfer to hatcher baskets",
        "4. Incubation in Hatcher (Day 19–21):\n   • Incubation program hatcher (RH elevation & temp drop)\n   • Application of disinfectants during hatching period",
        "5. Chick Handling (Day 21+):\n   • Take-off & grading (chick score assessment)\n   • Sexing & vaccination (spray/subcutaneous)\n   • Infra-red beak treatment\n   • Holding, transport & farm unloading/brooding"
      ],
      keyPointsBn: [
        "১. ডিম হ্যান্ডলিং (Egg Handling):\n   • ব্রিডার ফার্মে ও হ্যাচারিতে পরিবহন\n   • রিসিভ ও কোয়ালিটি কন্ট্রোল (গ্রেডিং/ওজন)\n   • সেটার ট্রে ও ট্রলিতে রিবক্সিং\n   • প্রাক-সংরক্ষণ ইনকিউবেশন (SPIDES) ও স্টোরেজ\n   • ডিসইনফেকশন ও ফিউমিগেশন",
        "২. সেটার ইনকিউবেশন (১-১৮ দিন):\n   • সিঙ্গেল-স্টেজ বনাম মাল্টি-স্টেজ সিস্টেম\n   • সেটার ইনকিউবেশন প্রোগ্রাম (তাপমাত্রা, আর্দ্রতা, বায়ুসঞ্চালন ও টার্নিং)",
        "৩. ডিম ট্রান্সফার (১৮তম দিন):\n   • ক্যান্ডলিং (অনুর্বর ও মৃত ডিম অপসারণ)\n   • হ্যাচার বাসকেটে ডিম স্থানান্তর",
        "৪. হ্যাচার ইনকিউবেশন (১৯-২১ দিন):\n   • হ্যাচার ইনকিউবেশন প্রোগ্রাম (আর্দ্রতা বাড়ানো ও তাপমাত্রা নামানো)\n   • হ্যাচিং চলাকালীন ডিসইনফেকট্যান্ট প্রয়োগ",
        "৫. বাচ্চা প্রসেসিং ও হ্যান্ডলিং (২১+ দিন):\n   • টেক-অফ ও গ্রেডিং (বাচ্চার মান নির্ধারণ)\n   • সেক্সিং ও টিকাদান (স্প্রে/ইনজেকশন)\n   • ইনফ্রা-রেড ঠোঁট ছাঁটাই (IRBT)\n   • হোল্ডিং, পরিবহন ও খামারে ব্রুডিং সেটিং"
      ],
      sopsEn: [
        "Follow the 5 incubation stages systematically for every hatch batch.",
        "Ensure strict biosecurity and temperature monitoring at each transfer step.",
        "Audit chick quality indicators (vent temp, navel score, reflex) before farm dispatch."
      ],
      sopsBn: [
        "প্রতিটি হ্যাচ ব্যাচের জন্য ইনকিউবেশনের ৫টি ধাপ ধারাবাহিকভাবে মেনে চলুন।",
        "প্রতিটি ট্রান্সফার ধাপে কঠোর বায়োসিকিউরিটি ও তাপমাত্রা মনিটরিং নিশ্চিত করুন।",
        "খামারে পাঠানোর আগে বাচ্চার গুণমান সূচক (ভেন্ট temp, নাভির অবস্থা, রিফ্লেক্স) অডিট করুন।"
      ],
    ),

    // 9. Golden Rules for a Hatchery
    FineTuningItem(
      id: "golden_rules_hatchery",
      titleEn: "Golden Rules for a Hatchery",
      titleBn: "হ্যাচারি পরিচালনার গোল্ডেন রুলস (Golden Rules)",
      subtitlePrefixEn: "🔎 Overview",
      subtitlePrefixBn: "🔎 ওভারভিউ",
      subtitleTextEn: "Essential rules for egg room, setter, transfer, hatcher, chick handling & truck",
      subtitleTextBn: "ডিম রুম, সেটার, ট্রান্সফার, হ্যাচার, বাচ্চা রুম ও ট্রাকের গুরুত্বপূর্ণ নিয়মাবলী",
      icon: Icons.star_rounded,
      descriptionEn:
          "Strict golden rules covering climate control, hygiene, positive air pressure, and chick comfort across all hatchery operations from egg receiving to dispatch transport.",
      descriptionBn:
          "ডিম গ্রহণ থেকে পরিবহন পর্যন্ত হ্যাচারির সকল রুমে তাপমাত্রা, আর্দ্রতা, বায়ুচাপ, পরিচ্ছন্নতা এবং বাচ্চার কমফোর্ট বজায় রাখার গোল্ডেন রুলস।",
      keyPointsEn: [
        "1. Egg Storage Room:\n   • Do not clean room and equipment when hatching eggs are present.\n   • Check temperature & humidity daily against recommendation.",
        "2. Setter Room & Setters:\n   • Inlet air must meet climate specs; clean floor daily; keep positive air pressure.\n   • Check machine function; machine must be dry before loading; adjust setpoints; load incomplete setters correctly.",
        "3. Transfer Room:\n   • Room temp 21–27°C (70–81°F); avoid direct air draught on eggs; keep doors closed.\n   • Never pull out more than 2 trolleys at the same time.",
        "4. Hatcher Room & Hatchers:\n   • Ensure recommended inlet air; dry, clean & doors closed.\n   • Pre-warm machines to set point before loading; verify set points.",
        "5. Chick Handling & Dispatch Rooms:\n   • Handling room: 24–27°C (75–81°F), 40–65% RH; max 2 trolleys pulled at once.\n   • Dispatch room: 24–27°C (75–81°F), 55–70% RH; avoid draughts; never place chick boxes directly on floor; monitor chick behavior.",
        "6. Chick Truck & Dispatch:\n   • Pre-cool/warm truck to 24–27°C (75–81°F); ensure truck is dry, cleaned & disinfected.\n   • Tie chick boxes securely & eliminate transit delays."
      ],
      keyPointsBn: [
        "১. ডিম স্টোরেজ রুম:\n   • ডিম থাকা অবস্থায় রুম বা সরঞ্জাম পরিষ্কার করবেন না।\n   • প্রতিদিন তাপমাত্রা ও আর্দ্রতা মেপে রেকর্ডের সাথে মেলান।",
        "২. সেটার রুম ও সেটার মেশিন:\n   • ইনলেট বাতাস সঠিক রাখুন; প্রতিদিন মেঝে জীবাণুমুক্ত করুন; পজিটিভ এয়ার প্রেশার বজায় রাখুন।\n   • লোডের আগে মেশিন শুকনো ও পরীক্ষা করে নিন; অসমাপ্ত সেটার সঠিকভাবে লোড করুন।",
        "৩. ট্রান্সফার রুম:\n   • রুম তাপমাত্রা ২১–২৭°সে (৭০–৮১°ফা); ডিমের ওপর সরাসরি বাতাসের ঝাপটা এড়ান; দরজা বন্ধ রাখুন।\n   • একসাথে ২টির বেশি ট্রলি বের করবেন না।",
        "৪. হ্যাচার রুম ও হ্যাচার মেশিন:\n   • ইনলেট বাতাস নিয়ন্ত্রণ করুন; রুম শুকনো রাখুন; দরজা বন্ধ রাখুন।\n   • ডিম রাখার আগে মেশিন শুকিয়ে নির্দিষ্ট তাপমাত্রায় প্রি-ওয়ার্ম করুন।",
        "৫. বাচ্চা হ্যান্ডলিং ও ডিসপ্যাচ রুম:\n   • হ্যান্ডলিং রুম: ২৪–২৭°সে, ৪০–৬৫% আর্দ্রতা; একসাথে সর্বোচ্চ ২ ট্রলি টেনে বের করুন।\n   • ডিসপ্যাচ রুম: ২৪–২৭°সে, ৫৫–৭০% আর্দ্রতা; সরাসরি বাতাস এড়ান; মেঝের ওপর সরাসরি বক্স রাখবেন না; বাচ্চার আচরণ লক্ষ্য করুন।",
        "৬. বাচ্চা পরিবহন ট্রাক:\n   • লোডের আগে ট্রাকের তাপমাত্রা ২৪–২৭°সে (৭৫–৮১°ফা) তে রাখুন; ট্রাক শুকনো ও জীবাণুমুক্ত রাখুন।\n   • বক্স ভালোভাবে বেঁধে নিন এবং পরিবহনে দেরি এড়ান।"
      ],
      sopsEn: [
        "Audit every room temperature, humidity, and door seal daily.",
        "Enforce strict 'max 2 trolleys out' rule during transfer and hatch pull.",
        "Verify truck climate conditions prior to loading chick boxes."
      ],
      sopsBn: [
        "প্রতিদিন প্রতিটি রুমের তাপমাত্রা, আর্দ্রতা ও দরজার সিল অডিট করুন।",
        "ট্রান্সফার ও টেক-অফের সময় কড়াভাবে 'সর্বোচ্চ ২টি ট্রলি বের করার' নিয়ম মানুন।",
        "বাচ্চা লোড করার আগে পরিবহন ট্রাকের পরিবেশ যাচাই করুন।"
      ],
    ),

    // 10. Egg Handling in the Breeder Farm
    FineTuningItem(
      id: "breeder_farm_egg_handling",
      titleEn: "Egg Handling in the Breeder Farm",
      titleBn: "ব্রিডার ফার্মে ডিম হ্যান্ডলিং (Breeder Farm SOP)",
      subtitlePrefixEn: "🔎 Overview",
      subtitlePrefixBn: "🔎 ওভারভিউ",
      subtitleTextEn: "Nest hygiene, collection frequency, cooling rates (41°C to 22-25°C) & storage",
      subtitleTextBn: "নেস্ট স্বাস্থ্যবিধি, সংগ্রহ ফ্রিকোয়েন্সি, শীতলীকরণ (৪১°সে থেকে ২২-২৫°সে) ও স্টোরেজ",
      icon: Icons.inventory_2_rounded,
      descriptionEn:
          "Proper egg handling practices at the breeder farm preserve early blastoderm viability, prevent embryonic damage, and minimize bacterial contamination prior to hatchery arrival.",
      descriptionBn:
          "ব্রিডার ফার্মে সঠিক ডিম হ্যান্ডলিং প্রারম্ভিক ভ্রূণের স্থায়িত্ব বজায় রাখে, আঘাতজনিত ক্ষতি রোধ করে এবং হ্যাচারিতে পাঠানোর আগে ব্যাকটেরিয়ার সংক্রমণ কমায়।",
      keyPointsEn: [
        "1. Nest Environment & Hygiene:\n   • Ensure sufficient, comfortable & easily accessible nest space; avoid direct light and draughts into nests.\n   • Keep nests clean at all times; perform extra nest hygiene at least once per week.",
        "2. Collection & Sanitation:\n   • Wash & disinfect hands before each collection; collect eggs at least 4 times daily.\n   • Avoid shocks/jolting to protect fragile embryo & prevent hairline shell cracks.",
        "3. Controlled Cooling Rate:\n   • Cool eggs uniformly from 41°C (106°F hen body temp) down to 22–25°C (72–77°F) over approx 6 hours.\n   • Avoid both excessively fast and too slow cooling.",
        "4. Sorting & Traying:\n   • Separate non-hatching eggs (double yolks, cracks) and floor eggs from clean hatching eggs.\n   • Record hatching vs non-hatching egg counts daily.\n   • Place hatching eggs on trays with sharp end down (blunt air-cell end UP).",
        "5. Packaging & Farm Storage:\n   • Pack egg trays into boxes after eggs reach 22–25°C (72–77°F).\n   • Store in farm egg storage room under recommended climate conditions.\n   • Monitor and record storage room temperature/RH daily; calibrate meters regularly."
      ],
      keyPointsBn: [
        "১. নেস্ট পরিবেশ ও স্বাস্থ্যবিধি:\n   • পর্যাপ্ত, আরামদায়ক ও সহজগম্য নেস্টের ব্যবস্থা করুন; সরাসরি আলো ও বাতাস এড়ান।\n   • নেস্ট সবসময় পরিষ্কার রাখুন; প্রতি সপ্তাহে অন্তত ১ বার গভীর নেস্ট হাইজিন সম্পন্ন করুন।",
        "২. ডিম সংগ্রহ ও স্যানিটেশন:\n   • প্রতিবার সংগ্রহের আগে হাত ধোবেন ও জীবাণুমুক্ত করবেন; দিনে অন্তত ৪ বার ডিম সংগ্রহ করুন।\n   • সূক্ষ্ম ভ্রূণ রক্ষা ও ফাটল রোধে ডিমের ঝাকুনি বা আঘাত এড়ান।",
        "৩. নিয়ন্ত্রিত শীতলীকরণ (Cooling Rate):\n   • মুরগির শরীরের ৪১°সে (১০৬°ফা) থেকে ২২-২৫°সে (৭২-৭৭°ফা) তাপমাত্রায় প্রায় ৬ ঘণ্টার মধ্যে সুষমভাবে ডিম ঠান্ডা হতে দিন।\n   • অতিরিক্ত দ্রুত বা অতিরিক্ত ধীরগতির শীতলীকরণ বর্জন করুন।",
        "৪. বাছাই ও ট্রেতে সাজানো:\n   • ভালো ডিম থেকে অন-ফোটা ডিম (দ্বিকুষুম, ফাটা) এবং ফ্লোর ডিম আলাদা রাখুন।\n   • প্রতিদিনের ফার্ম রেকর্ডে ফোটার ডিম ও বাতিল ডিমের সংখ্যা লিখে রাখুন।\n   • ট্রেতে ডিমের সূক্ষ্ম মাথা নিচে এবং মোটা মাথা (এয়ার সেল) ওপরে রাখুন।",
        "৫. প্যাকেজিং ও ফার্ম স্টোরেজ:\n   • ডিমের তাপমাত্রা ২২-২৫°সে পৌঁছানোর পর বক্সের ভেতর ট্রে রাখুন।\n   • হ্যাচারিতে পাঠানোর আগ পর্যন্ত সুনির্দিষ্ট তাপমাত্রায় ফার্ম ডিম রুমে রাখুন।\n   • প্রতিদিন রুমের তাপমাত্রা/আর্দ্রতা রেকর্ড করুন এবং থার্মোমিটার পরীক্ষা করুন।"
      ],
      sopsEn: [
        "Enforce 4+ daily egg collections with mandatory hand sanitization.",
        "Monitor the 6-hour egg cooling curve from 41°C to 22–25°C.",
        "Strictly set eggs sharp end DOWN on all trays."
      ],
      sopsBn: [
        "বাধ্যতামূলক হাত জীবাণুমুক্তকরণ সহ দিনে ৪+ বার ডিম সংগ্রহ করুন।",
        "৪১°সে থেকে ২২-২৫°সে ডিমের ৬ ঘণ্টার কুলিং কার্ভ পর্যবেক্ষণ করুন।",
        "ট্রেতে ডিম রাখার সময় কঠোরভাবে ডিমের সূক্ষ্ম মাথা নিচে রাখুন।"
      ],
    ),

    // 11. Egg Storage Room Climate Conditions
    FineTuningItem(
      id: "egg_storage_climate_conditions",
      titleEn: "Egg Storage Room Climate Conditions",
      titleBn: "ডিম সংরক্ষণ কক্ষের জলবায়ু ও তাপমাত্রা (Egg Storage Matrix)",
      subtitlePrefixEn: "🔎 Overview",
      subtitlePrefixBn: "🔎 ওভারভিউ",
      subtitleTextEn: "Temperature, humidity & egg orientation standards based on storage duration",
      subtitleTextBn: "সংরক্ষণকালের ওপর ভিত্তি করে তাপমাত্রা, আর্দ্রতা ও ডিমের পজিশনিং মানদণ্ড",
      icon: Icons.ac_unit_rounded,
      descriptionEn:
          "Maintaining precise temperature, relative humidity, and egg orientation in relation to storage duration is crucial to preserve embryonic cell viability and prevent albumen degradation.",
      descriptionBn:
          "সংরক্ষণকালের ওপর ভিত্তি করে ডিম সংরক্ষণ কক্ষের তাপমাত্রা, আপেক্ষিক আর্দ্রতা এবং পজিশনিং নিখুঁত রাখা ভ্রূণের জীবনক্ষমতা বজায় রাখার জন্য অত্যন্ত জরুরি।",
      keyPointsEn: [
        "1. Short Storage (0–3 Days):\n   • Temperature: 18–21°C (64–70°F)\n   • Relative Humidity: 75–85%\n   • Egg Orientation: Blunt end UP",
        "2. Medium Storage (4–7 Days):\n   • Temperature: 15–17°C (59–63°F)\n   • Relative Humidity: 75–85%\n   • Egg Orientation: Blunt end UP",
        "3. Long Storage (8–10 Days):\n   • Temperature: 12–14°C (54–57°F)\n   • Relative Humidity: 80–85%\n   • Egg Orientation: Blunt end UP",
        "4. Extended Storage (>10 Days):\n   • Temperature: 12–14°C (54–57°F)\n   • Relative Humidity: 80–85%\n   • Egg Orientation: Preferably SMALL end UP (upside down) & turn eggs an uneven number of times per day"
      ],
      keyPointsBn: [
        "১. স্বল্পমেয়াদী স্টোরেজ (০–৩ দিন):\n   • তাপমাত্রা: ১৮–২১°সে (৬৪–৭০°ফা)\n   • আপেক্ষিক আর্দ্রতা: ৭৫–৮৫%\n   • ডিমের পজিশন: মোটা মাথা ওপরে (Blunt end UP)",
        "২. মাঝারি স্টোরেজ (৪–৭ দিন):\n   • তাপমাত্রা: ১৫–১৭°সে (৫৯–৬৩°ফা)\n   • আপেক্ষিক আর্দ্রতা: ৭৫–৮৫%\n   • ডিমের পজিশন: মোটা মাথা ওপরে (Blunt end UP)",
        "৩. দীর্ঘ স্টোরেজ (৮–১০ দিন):\n   • তাপমাত্রা: ১২–১৪°সে (৫৪–৫৭°ফা)\n   • আপেক্ষিক আর্দ্রতা: ৮০–৮৫%\n   • ডিমের পজিশন: মোটা মাথা ওপরে (Blunt end UP)",
        "৪. অতিরিক্ত দীর্ঘ স্টোরেজ (>১০ দিন):\n   • তাপমাত্রা: ১২–১৪°সে (৫৪–৫৭°ফা)\n   • আপেক্ষিক আর্দ্রতা: ৮০–৮৫%\n   • ডিমের পজিশন: পছন্দসই সূক্ষ্ম মাথা ওপরে (Small end UP) এবং দিনে বিজোড় সংখ্যক বার ডিম টার্নিং করা"
      ],
      sopsEn: [
        "Adjust storage room thermostat and humidifier settings according to expected storage days.",
        "For eggs stored over 10 days, tilt trays or turn uneven times daily to prevent embryo contact with shell membrane.",
        "Pre-warm stored eggs gradually before setting into warm incubators to avoid sweating."
      ],
      sopsBn: [
        "প্রত্যাশিত স্টোরেজ দিনের ওপর ভিত্তি করে রুমের থার্মোস্ট্যাট ও হিউমিডিফায়ার সেট করুন।",
        "১০ দিনের বেশি স্টোরেজের ডিমের ক্ষেত্রে ট্রে কাত করুন বা বিজোড় সংখ্যক বার ঘুরিয়ে দিন।",
        "সেটারে দেওয়ার আগে সংরক্ষিত ডিমের ঘাম (Sweating) রোধে ধীরে ধীরে তা দিয়ে স্বাভাবিক তাপে আনুন।"
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isEng = widget.isEnglish;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF121212) : const Color(0xFFF2F5F8),
      appBar: AppBar(
        backgroundColor: const Color(0xFF00695C),
        elevation: 0,
        centerTitle: true,
        foregroundColor: Colors.white,
        title: Text(
          isEng ? "Hatchery Fine Tuning" : "ইনকিউবেটর টিউনিং (Fine Tuning)",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.assignment_rounded),
            tooltip: isEng ? "Operation Guide" : "পরিচালনা গাইড",
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => HatcheryOperationGuideScreen(isEnglish: isEng),
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        itemCount: _items.length,
        itemBuilder: (context, index) {
          final item = _items[index];
          return _buildFineTuningCard(context, item, isEng, isDark);
        },
      ),
    );
  }

  Widget _buildFineTuningCard(
    BuildContext context,
    FineTuningItem item,
    bool isEng,
    bool isDark,
  ) {
    final title = isEng ? item.titleEn : item.titleBn;
    final prefix = isEng ? item.subtitlePrefixEn : item.subtitlePrefixBn;
    final subtitleText = isEng ? item.subtitleTextEn : item.subtitleTextBn;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.3 : 0.05),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () => _showItemDetailsBottomSheet(context, item, isEng, isDark),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Left Blue Square Icon Container
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: const Color(0xFF81D4FA).withValues(alpha: 0.4),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Icon(
                      item.icon,
                      color: const Color(0xFF0288D1),
                      size: 24,
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                // Text Column
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white : const Color(0xFF1E293B),
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Text(
                            prefix,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF0288D1),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              subtitleText,
                              style: TextStyle(
                                fontSize: 12,
                                color: isDark ? Colors.white60 : Colors.grey.shade600,
                                decoration: TextDecoration.underline,
                                decorationStyle: TextDecorationStyle.dotted,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Icon(
                  Icons.chevron_right_rounded,
                  color: isDark ? Colors.white54 : Colors.grey.shade400,
                  size: 24,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showItemDetailsBottomSheet(
    BuildContext context,
    FineTuningItem item,
    bool isEng,
    bool isDark,
  ) {
    final title = isEng ? item.titleEn : item.titleBn;
    final description = isEng ? item.descriptionEn : item.descriptionBn;
    final keyPoints = isEng ? item.keyPointsEn : item.keyPointsBn;
    final sops = isEng ? item.sopsEn : item.sopsBn;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: isDark ? const Color(0xFF1E1E1E) : Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.82,
          minChildSize: 0.5,
          maxChildSize: 0.95,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Handle bar
                  Center(
                    child: Container(
                      width: 40,
                      height: 5,
                      decoration: BoxDecoration(
                        color: isDark ? Colors.white30 : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xFF00695C).withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(item.icon, color: const Color(0xFF00695C), size: 28),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: isDark ? Colors.white : const Color(0xFF00695C),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Description Box
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: isDark ? const Color(0xFF2C2C2C) : const Color(0xFFE0F2F1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFF00695C).withValues(alpha: 0.3),
                      ),
                    ),
                    child: Text(
                      description,
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.4,
                        color: isDark ? Colors.white70 : const Color(0xFF004D40),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Key Points Section
                  Text(
                    isEng ? "Key Technical Parameters & Guidelines" : "মূল কারিগরি সূচক ও নির্দেশিকা",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : const Color(0xFF1E293B),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ...keyPoints.map((point) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("🔹 ", style: TextStyle(fontSize: 14)),
                            Expanded(
                              child: Text(
                                point,
                                style: TextStyle(
                                  fontSize: 13.5,
                                  height: 1.35,
                                  color: isDark ? Colors.white70 : Colors.grey.shade800,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),

                  const SizedBox(height: 16),

                  // SOPs Section
                  Text(
                    isEng ? "Actionable SOPs" : "কার্যকরী প্রমিত পরিচালন পদ্ধতি (SOP)",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : const Color(0xFF1E293B),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ...sops.map((sop) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("✅ ", style: TextStyle(fontSize: 14)),
                            Expanded(
                              child: Text(
                                sop,
                                style: TextStyle(
                                  fontSize: 13.5,
                                  height: 1.35,
                                  color: isDark ? Colors.white70 : Colors.grey.shade800,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                  const SizedBox(height: 24),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
