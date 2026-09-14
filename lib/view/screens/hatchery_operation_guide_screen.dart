import 'package:flutter/material.dart';

class OperationGuideItem {
  final String id;
  final String titleEn;
  final String titleBn;
  final String subtitleEn;
  final String subtitleBn;
  final IconData icon;
  final String descriptionEn;
  final String descriptionBn;
  final List<String> keyStepsEn;
  final List<String> keyStepsBn;
  final List<String> parametersEn;
  final List<String> parametersBn;

  const OperationGuideItem({
    required this.id,
    required this.titleEn,
    required this.titleBn,
    required this.subtitleEn,
    required this.subtitleBn,
    required this.icon,
    required this.descriptionEn,
    required this.descriptionBn,
    required this.keyStepsEn,
    required this.keyStepsBn,
    required this.parametersEn,
    required this.parametersBn,
  });
}

class HatcheryOperationGuideScreen extends StatefulWidget {
  final bool isEnglish;

  const HatcheryOperationGuideScreen({super.key, required this.isEnglish});

  @override
  State<HatcheryOperationGuideScreen> createState() =>
      _HatcheryOperationGuideScreenState();
}

class _HatcheryOperationGuideScreenState
    extends State<HatcheryOperationGuideScreen> {
  static const List<OperationGuideItem> _items = [
    // 1. Egg Receiving
    OperationGuideItem(
      id: "egg_receiving",
      titleEn: "Egg Receiving",
      titleBn: "Egg Receiving / ডিম গ্রহণ",
      subtitleEn: "Egg receiving from farm & initial inspection",
      subtitleBn: "ফার্ম থেকে হ্যাচিং ডিম গ্রহণ ও প্রাথমিক যাচাই",
      icon: Icons.unarchive_rounded,
      descriptionEn:
          "The first crucial step of hatchery operations is properly receiving hatching eggs from breeder farms. Transport vehicles should be climate-controlled with inside temperature kept at 20–23°C.",
      descriptionBn:
          "হ্যাচারি অপারেশনের প্রথম গুরুত্বপূর্ণ ধাপ হলো ফার্ম থেকে আসা হ্যাচিং ডিম সঠিকভাবে গ্রহণ করা। ডিম সাধারণত temperature controlled vehicle-এ আনা উচিত। গাড়ির ভিতরের তাপমাত্রা 20–23°C রাখা ভালো।",
      keyStepsEn: [
        "1. Spray vehicle wheels and lower portions with disinfectant before entering the hatchery.",
        "2. Inspect vehicle temperature, humidity, and check for egg sweating before unloading.",
        "3. Keep eggs from each breeder flock in separate trays or boxes. Record receiving time, flock number, laying date, total egg quantity, and vehicle condition."
      ],
      keyStepsBn: [
        "1. গাড়ি হ্যাচারিতে প্রবেশের আগে wheel ও lower portion disinfectant spray করতে হবে।",
        "2. ডিম unload করার আগে vehicle-এর temperature, humidity এবং egg sweating আছে কিনা দেখতে হবে।",
        "3. প্রতিটি breeder flock-এর ডিম আলাদা tray বা box-এ রাখা উচিত। Receiving time, flock number, laying date, total egg quantity এবং vehicle condition record করতে হবে।"
      ],
      parametersEn: [
        "Vehicle Target Temp: 20°C–23°C",
        "Biosecurity: Spray wheels & lower chassis",
        "Record Keeping: Log time, flock #, laying date, quantity & vehicle status"
      ],
      parametersBn: [
        "যানবাহন টার্গেট তাপমাত্রা: ২০°সে–২৩°সে",
        "বায়োসিকিউরিটি: চাকা ও নিচের অংশ স্প্রে জীবাণুমুক্তকরণ",
        "রেকর্ড সংরক্ষণ: সময়, ফ্ল্যাক নম্বর, ডিম পাড়ার তারিখ, পরিমাণ ও অবস্থা রেকর্ড"
      ],
    ),

    // 2. Fumigation
    OperationGuideItem(
      id: "fumigation",
      titleEn: "Fumigation",
      titleBn: "Fumigation / ফিউমিগেশন",
      subtitleEn: "Rapid disinfection after egg receiving",
      subtitleBn: "ডিম গ্রহণের পর দ্রুত জীবাণুমুক্তকরণ",
      icon: Icons.sanitizer_rounded,
      descriptionEn:
          "Fumigation should be performed as soon as possible after unloading eggs to reduce eggshell surface pathogen load.",
      descriptionBn:
          "ডিম unload করার পর যত দ্রুত সম্ভব fumigation করতে হবে। এর উদ্দেশ্য হলো eggshell surface-এর জীবাণু কমানো।",
      keyStepsEn: [
        "1. Use Paraformaldehyde 10 gm per cubic meter. Burning time is typically 20 minutes.",
        "2. Run ceiling fans during burning so that gas spreads uniformly throughout the chamber.",
        "3. After 20 minutes, exhaust gas using exhaust fans. Avoid excessive fumigation to prevent embryo damage."
      ],
      keyStepsBn: [
        "1. Paraformaldehyde 10 gm per cubic meter হিসেবে ব্যবহার করা যায়। Burning time সাধারণত 20 minutes।",
        "2. Burning চলাকালীন ceiling fan চালু রাখতে হবে যাতে gas সমানভাবে ছড়িয়ে যায়।",
        "3. 20 minutes শেষে exhaust fan দিয়ে gas বের করে দিতে হবে। অতিরিক্ত fumigation করা যাবে না, কারণ এতে embryo damage হতে পারে।"
      ],
      parametersEn: [
        "Dosage Standard: 10g Paraformaldehyde / m³",
        "Burning Duration: 20 Minutes (fans ON)",
        "Exhaust Protocol: Full exhaust fan gas evacuation"
      ],
      parametersBn: [
        "মাত্রা মানদণ্ড: ১০g প্যারাফরমালডিহাইড / ঘনমিটার",
        "বার্নিং সময়কাল: ২০ মিনিট (ফ্যান চালু)",
        "গ্যাস নিষ্কাশন: এক্সজস্ট ফ্যান চালিয়ে গ্যাস অপসারণ"
      ],
    ),

    // 3. Cold Room Storage
    OperationGuideItem(
      id: "cold_room_storage",
      titleEn: "Cold Room Storage",
      titleBn: "Cold Room Storage / কোল্ড রুম স্টোরেজ",
      subtitleEn: "Egg storage at correct temperature & humidity",
      subtitleBn: "ডিম সঠিক তাপমাত্রা ও আর্দ্রতায় সংরক্ষণ",
      icon: Icons.ac_unit_rounded,
      descriptionEn:
          "After fumigation, store eggs in cold room arranged flock-wise with tags. Tags should state flock number, laying date, and egg quantity.",
      descriptionBn:
          "Fumigation শেষে ডিম cold room-এ রাখতে হবে। ডিম flock-wise সাজাতে হবে এবং প্রতিটি flock-এর জন্য tag ব্যবহার করতে হবে। Tag-এ flock number, laying date এবং egg quantity লেখা থাকবে।",
      keyStepsEn: [
        "1. Maintain cold room temperature at 65–68°F (18.3–20°C) and relative humidity at 75–80%.",
        "2. Maintain a 2–3 inch gap between boxes and a 3–4 inch gap from walls.",
        "3. Ensure proper air circulation. High temperature fluctuations cause egg sweating, embryo weakness, and reduced hatchability."
      ],
      keyStepsBn: [
        "1. Cold room temperature 65–68°F এবং humidity 75–80% রাখা ভালো।",
        "2. Box to box distance 2–3 inch এবং wall থেকে 3–4 inch gap রাখতে হবে।",
        "3. Air circulation ভালো রাখতে হবে। বেশি temperature fluctuation হলে egg sweating, embryo weakness এবং hatchability কমে যেতে পারে।"
      ],
      parametersEn: [
        "Temperature Range: 65°F–68°F (18.3°C–20.0°C)",
        "Relative Humidity Target: 75%–80%",
        "Gap Standards: 2–3 in (box-to-box), 3–4 in (wall-to-box)"
      ],
      parametersBn: [
        "তাপমাত্রা সীমা: ৬৫°ফা–৬৮°ফা (১৮.৩°সে–২০.০°সে)",
        "আপেক্ষিক আর্দ্রতা লক্ষ্যমাত্রা: ৭৫%–৮০%",
        "ফাঁকা মানদণ্ড: ২–৩ ইঞ্চি (বক্স থেকে বক্স), ৩–৪ ইঞ্চি (দেয়াল থেকে বক্স)"
      ],
    ),

    // 4. Sorting
    OperationGuideItem(
      id: "sorting",
      titleEn: "Sorting",
      titleBn: "Sorting / ডিম বাছাই",
      subtitleEn: "Separating good & bad eggs before setting",
      subtitleBn: "সেটিংয়ের আগে ভালো ও খারাপ ডিম আলাদা করা",
      icon: Icons.filter_alt_rounded,
      descriptionEn:
          "Bring eggs from cold room to sorting room to select good quality settable eggs. Place eggs on setter trays with blunt end upward.",
      descriptionBn:
          "Cold room থেকে ডিম sorting room-এ এনে ভালো মানের settable egg বাছাই করতে হবে। ডিম setter tray-তে blunt end upward করে বসাতে হবে।",
      keyStepsEn: [
        "1. Reject cracked, dirty, double yolk, small size, poor shell, misshapen, and abnormal eggs. Setting these eggs reduces hatchability and increases contamination risk.",
        "2. Generally, Grade A egg weight is over 53 gm, while Grade B is considered 45–52 gm.",
        "3. Place selected eggs on setter trays with blunt end (air cell) facing UP."
      ],
      keyStepsBn: [
        "1. Cracked, dirty, double yolk, small size, poor shell, misshapen এবং abnormal egg বাদ দিতে হবে। এই ধরনের ডিম set করলে hatchability কমে এবং contamination risk বাড়ে।",
        "2. সাধারণভাবে A grade egg weight 53 gm-এর বেশি এবং B grade 45–52 gm ধরা যায়।",
        "3. বাছাইকৃত ডিম ট্রেতে বসানোর সময় মোটা মাথা (Blunt end) ওপরে রেখে সেট করুন।"
      ],
      parametersEn: [
        "Grade A Weight: > 53 gm",
        "Grade B Weight: 45 – 52 gm",
        "Orientation Standard: Blunt end UP (air cell top)"
      ],
      parametersBn: [
        "গ্রেড-এ ওজন: > ৫৩ গ্রাম",
        "গ্রেড-বি ওজন: ৪৫ – ৫২ গ্রাম",
        "পজিশন মানদণ্ড: মোটা মাথা ওপরে (Blunt end UP)"
      ],
    ),

    // 5. Pre-heating
    OperationGuideItem(
      id: "pre_heating",
      titleEn: "Pre-heating",
      titleBn: "Pre-heating / প্রি-হিটিং",
      subtitleEn: "Gradually warming eggs before setting",
      subtitleBn: "সেটিংয়ের আগে ডিম ধীরে ধীরে গরম করা",
      icon: Icons.thermostat_auto_rounded,
      descriptionEn:
          "Cold room should not transfer eggs directly into the setter. Pre-heating reduces condensation and minimizes embryo thermal shock.",
      descriptionBn:
          "Cold room থেকে সরাসরি setter-এ ডিম দেওয়া উচিত নয়। আগে pre-heating করলে condensation কমে এবং embryo shock কম হয়।",
      keyStepsEn: [
        "Pre-heating is typically conducted for 6–8 hours.",
        "Maintain temperature at 75–80°F (24–27°C) and humidity at 65–70%.",
        "Improper pre-heating causes uneven hatch, egg sweating, and hatchability problems."
      ],
      keyStepsBn: [
        "Pre-heating সাধারণত 6–8 hours করা যায়।",
        "Temperature 75–80°F এবং humidity 65–70% রাখা ভালো।",
        "Pre-heating ঠিকভাবে না হলে uneven hatch, egg sweating এবং hatchability problem দেখা দিতে পারে।"
      ],
      parametersEn: [
        "Duration Target: 6–8 Hours",
        "Temperature Standard: 75°F–80°F (23.9°C–26.7°C)",
        "Humidity Standard: 65%–70% RH"
      ],
      parametersBn: [
        "সময়কাল লক্ষ্যমাত্রা: ৬–৮ ঘণ্টা",
        "তাপমাত্রা মানদণ্ড: ৭৫°ফা–৮০°ফা",
        "আর্দ্রতা মানদণ্ড: ৬৫%–৭০% আপেক্ষিক আর্দ্রতা"
      ],
    ),

    // 6. Setting
    OperationGuideItem(
      id: "setting",
      titleEn: "Setting",
      titleBn: "Setting / সেটিং",
      subtitleEn: "Loading eggs into setter machine & starting incubation",
      subtitleBn: "Setter machine-এ ডিম বসানো ও incubation শুরু",
      icon: Icons.tune_rounded,
      descriptionEn:
          "Start setter machine 4–6 hours before setting to verify temperature, humidity, turning system, damper, and alarm system. Take sample egg weights from upper, middle, and lower trolley trays before locking trolleys into incubator.",
      descriptionBn:
          "Setting-এর 4–6 hours আগে setter machine চালু করে temperature, humidity, turning system, damper এবং alarm system check করতে হবে।",
      keyStepsEn: [
        "1. Start setter machine 4–6 hours before setting to check temperature, humidity, turning system, damper, and alarm system.",
        "2. Take sample egg weights from upper, middle, and lower trolley trays during setting. Lock trolley in incubator and keep doors closed.",
        "3. Adjust incubation profile based on season, flock age, and chicken type. In continuous setting, set-off is typically done on the 19th day."
      ],
      keyStepsBn: [
        "1. Setting-এর 4–6 hours আগে setter machine চালু করে temperature, humidity, turning system, damper এবং alarm system check করতে হবে।",
        "2. Setting-এর সময় trolley-এর upper, middle এবং lower tray থেকে sample egg weight নিতে হবে। এরপর trolley incubator-এ বসিয়ে lock করতে হবে এবং door close করে machine চালু রাখতে হবে।",
        "3. Season, flock age এবং chicken type অনুযায়ী incubation profile adjust করতে হবে। Continuous setting হলে সাধারণত 19th day-এ set-off করা হয়।"
      ],
      parametersEn: [
        "Pre-run Verification: 4–6 Hours before setting",
        "Weight Sampling: Upper, Middle & Lower trays",
        "Continuous Set-off: Typically 19th Day"
      ],
      parametersBn: [
        "প্রাক-চালনা পরীক্ষা: সেটিংয়ের ৪–৬ ঘণ্টা আগে",
        "ওজন নমুনা: ওপরের, মাঝের ও নিচের ট্রে",
        "কন্টিনিউয়াস সেট-অফ: সাধারণত ১৯তম দিন"
      ],
    ),

    // 7. Transfer
    OperationGuideItem(
      id: "transfer",
      titleEn: "Transfer",
      titleBn: "Transfer / ট্রান্সফার",
      subtitleEn: "Transferring eggs from setter to hatcher",
      subtitleBn: "Setter থেকে hatcher-এ ডিম স্থানান্তর",
      icon: Icons.swap_horiz_rounded,
      descriptionEn:
          "Candling eggs at 18.5 days, checking egg weight loss, removing infertile and rotten eggs, and transferring live eggs into clean pre-warmed hatcher trays.",
      descriptionBn:
          "সাধারণত 18.5 days incubation শেষে egg setter থেকে hatcher-এ transfer করা হয়। কাজটি দ্রুত ও smooth হতে হবে, যাতে egg cooling না হয়।",
      keyStepsEn: [
        "Maintain Transfer room temperature at 80–90°F; ensure hatcher trays are clean, dry, and pre-warmed.",
        "Weigh sample trays to calculate egg weight loss since setting.",
        "Target Weight Loss: Young flock: 9–10%, Prime flock: 10–12%, Old flock: 12–13%.",
        "Candle eggs to remove infertile, early dead, and rotten eggs (discard rotten eggs into disinfectant container)."
      ],
      keyStepsBn: [
        "Transfer room temperature 80–90°F রাখা ভালো। Hatcher tray clean, dry এবং pre-warmed হতে হবে।",
        "Setting-এর সময় যে tray-এর weight নেওয়া হয়েছিল, transfer-এর সময় একই tray-এর weight নিয়ে egg weight loss হিসাব করতে হবে।",
        "Young flock: 9–10%, Prime flock: 10–12%, Old flock: 12–13% weight loss সাধারণত ভালো।",
        "Candling করে infertile, early dead, rotten egg remove করা যায়। Rotten egg disinfectant container-এ ফেলতে হবে।"
      ],
      parametersEn: [
        "Incubation Duration at Transfer: 18.5 Days (444 hours)",
        "Transfer Room Temp: 80°F–90°F (26.7°C–32.2°C)",
        "Ideal Weight Loss Target: 10%–12% (Prime flock)"
      ],
      parametersBn: [
        "ট্রান্সফার সময়: ১৮.৫ দিন (৪৪৪ ঘণ্টা)",
        "ট্রান্সফার রুম তাপমাত্রা: ৮০°ফা–৯০°ফা",
        "আদর্শ ওজন হ্রাস: ১০%–১২% (প্রাইম ফ্ল্যাক)"
      ],
    ),

    // 8. Chick Pull
    OperationGuideItem(
      id: "chick_pull",
      titleEn: "Chick Pull",
      titleBn: "Chick Pull / বাচ্চা বের করা",
      subtitleEn: "Pulling chicks out at the right time",
      subtitleBn: "সঠিক সময়ে বাচ্চা বের করা",
      icon: Icons.launch_rounded,
      descriptionEn:
          "Chicken egg total incubation period is 504 ± 4 hours. Timing chick pull is critical: late pull causes dehydration, while early pull results in immature chicks.",
      descriptionBn:
          "Chicken egg-এর total incubation period সাধারণত 504 ± 4 hours। Layer egg broiler egg-এর তুলনায় কিছুটা বেশি সময় নিতে পারে। Pull out time খুব গুরুত্বপূর্ণ। দেরিতে pull করলে chick dehydration হয়, আর খুব আগে pull করলে immature chick পাওয়া যায়।",
      keyStepsEn: [
        "1. Egg shells will remain relatively clean.",
        "2. Approx 5% of chicks may still have slight dampness at the back of the neck.",
        "3. Chick yield should typically be 66–68% of initial egg weight.",
        "4. Excessively dry chicks indicate late pull-out timing."
      ],
      keyStepsBn: [
        "সঠিক pull time বোঝার লক্ষণ:",
        "1. Egg shell তুলনামূলক clean থাকবে।",
        "2. প্রায় 5% chick-এর neck-এর পেছনে সামান্য dampness থাকতে পারে।",
        "3. Chick yield সাধারণত egg weight-এর 66–68% হবে।",
        "4. Chick বেশি শুকিয়ে গেলে pull time late হয়েছে বোঝা যায়।"
      ],
      parametersEn: [
        "Total Incubation Period: 504 ± 4 hours",
        "Chick Yield Target: 66%–68% of initial egg weight",
        "Neck Dampness Indicator: ~5% chicks slightly damp"
      ],
      parametersBn: [
        "মোট ইনকিউবেশন সময়: ৫০৪ ± ৪ ঘণ্টা",
        "চিক ইল্ড লক্ষ্যমাত্রা: ৬৬%–৬৮% (প্রারম্ভিক ডিমের ওজনের)",
        "নেক ড্যাম্পনেস নির্দেশক: ~৫% বাচ্চার ঘাড়ে সামান্য ভেজা ভাব"
      ],
    ),

    // 9. Grading
    OperationGuideItem(
      id: "grading",
      titleEn: "Grading",
      titleBn: "Grading / বাচ্চা গ্রেডিং",
      subtitleEn: "Checking chick quality & determining grade",
      subtitleBn: "বাচ্চার মান যাচাই ও গ্রেড নির্ধারণ",
      icon: Icons.fact_check_rounded,
      descriptionEn:
          "After chick pull, separate chicks from debris and perform grading. Broilers are graded A, B, C; Layers are graded A and C. C grade chicks are usually culled. Avoid rough handling during grading.",
      descriptionBn:
          "Chick pull করার পর chicks-কে debris থেকে আলাদা করে grading করতে হবে। Broiler chick সাধারণত A, B, C grade এবং Layer chick A ও C grade করা যায়। C grade chick সাধারণত cull করা হয়। Grading-এর সময় rough handling করা যাবে না।",
      keyStepsEn: [
        "Characteristics of Grade A Chick:",
        "• Active and alert behavior",
        "• Minimum weight approx 33 gm",
        "• Navel clean, dry, and fully healed",
        "• No lameness or blindness defects",
        "• No black button navel defects",
        "C grade chicks are culled. Handle all chicks gently."
      ],
      keyStepsBn: [
        "A grade chick-এর বৈশিষ্ট্য:",
        "- Active ও alert",
        "- Minimum weight প্রায় 33 gm",
        "- Navel dry ও healed",
        "- Lameness বা blindness নেই",
        "- Black button নেই",
        "C grade chick সাধারণত cull করা হয়। Grading-এর সময় rough handling করা যাবে না।"
      ],
      parametersEn: [
        "Broiler Grades: A, B, C (Layer: A, C)",
        "Grade A Min Weight: ~33 gm",
        "Culling Standard: Cull Grade C & defective chicks"
      ],
      parametersBn: [
        "ব্রয়লার গ্রেড: A, B, C (লেয়ার: A, C)",
        "গ্রেড-এ সর্বনিম্ন ওজন: ~৩৩ গ্রাম",
        "কালিং মানদণ্ড: গ্রেড সি ও বিকলাঙ্গ বাচ্চা বাতিল"
      ],
    ),

    // 10. Vaccination
    OperationGuideItem(
      id: "vaccination",
      titleEn: "Vaccination",
      titleBn: "Vaccination / ভ্যাকসিনেশন",
      subtitleEn: "DOC vaccine preparation & application",
      subtitleBn: "DOC vaccine preparation ও প্রয়োগ",
      icon: Icons.vaccines_rounded,
      descriptionEn:
          "For layer DOCs, Marek's disease vaccine and HVT-AIV vaccines are administered at the hatchery. Vaccines are stored in liquid nitrogen at -196°C.",
      descriptionBn:
          "Layer DOC-এর ক্ষেত্রে hatchery-তেই Marek’s disease vaccine এবং প্রয়োজন অনুযায়ী HVT-AIV vaccine দেওয়া যায়। Vaccine সাধারণত liquid nitrogen-এ -196°C temperature-এ সংরক্ষণ করা হয়।",
      keyStepsEn: [
        "1. Keep vaccine preparation room clean, contamination-free, and ensure materials are sterilized. Maintain digital water bath at 26–27°C.",
        "2. Perform vaccine thawing, mixing, and diluent preparation with extreme care. Standard dose is 0.2 ml per chick via subcutaneous route.",
        "3. Change needles at specified intervals and gently agitate the vaccine bag periodically during administration."
      ],
      keyStepsBn: [
        "1. Vaccine preparation room clean ও contamination-free হতে হবে। Materials sterilized থাকতে হবে। Digital water bath 26–27°C temperature-এ রাখতে হবে।",
        "2. Vaccine thawing, mixing এবং diluent-এর সাথে preparation খুব সতর্কতার সাথে করতে হবে। সাধারণ dose 0.2 ml per chick subcutaneous route।",
        "3. Needle নির্দিষ্ট interval-এ change করতে হবে এবং vaccine bag মাঝে মাঝে agitate করতে হবে।"
      ],
      parametersEn: [
        "Storage Temp: -196°C (Liquid Nitrogen)",
        "Thawing Water Bath: 26°C–27°C",
        "Dose & Route: 0.2 ml per chick (Subcutaneous)"
      ],
      parametersBn: [
        "সংরক্ষণ তাপমাত্রা: -১৯৬°সে (লিকুইড নাইট্রোজেন)",
        "গলানো ওয়াটার বাথ: ২৬°সে–২৭°সে",
        "ডোজ ও রুট: ০.২ ml প্রতি বাচ্চা (সাবকিউটেনিয়াস)"
      ],
    ),

    // 11. Sanitation
    OperationGuideItem(
      id: "sanitation",
      titleEn: "Sanitation",
      titleBn: "Sanitation",
      subtitleEn: "Hatchery cleanliness & disinfection protocols",
      subtitleBn: "হ্যাচারির পরিষ্কার-পরিচ্ছন্নতা ও জীবাণুনাশক ব্যবস্থা",
      icon: Icons.cleaning_services_rounded,
      descriptionEn:
          "Executing strict bio-security, daily hall washdown, high-pressure equipment disinfection, and swab testing.",
      descriptionBn:
          "কঠোর বায়োসিকিউরিটি, দৈনিক ফ্লোর ধোয়া, উচ্চ-চাপের সরঞ্জাম জীবাণুমুক্তকরণ এবং সোয়াব টেস্ট সম্পাদন।",
      keyStepsEn: [
        "Wash and foam-disinfect setter halls, hatcher rooms, and chick boxes daily.",
        "Use high-pressure hot water washers (>60°C) with approved broad-spectrum disinfectants.",
        "Maintain strict directional workflow: Clean area (Eggs) ➔ Dirty area (Chick waste).",
        "Take monthly microbiological swab samples to verify zero Aspergillus or Salmonella contamination."
      ],
      keyStepsBn: [
        "সেটার হল, হ্যাচার রুম এবং বাচ্চার বক্স প্রতিদিন ফোম-ডিসইনফেকট্যান্ট দিয়ে ধৌত করুন।",
        "অনুমোদিত ডিসইনফেকট্যান্ট সহ উচ্চ-চাপের গরম পানি (>৬০°সে) ওয়াশার ব্যবহার করুন।",
        "একমুখী বায়োসিকিউরিটি ওয়ার্কফ্লো মানুন: পরিষ্কার এলাকা (ডিম) ➔ ময়লা এলাকা (বর্জ্য)।",
        "অ্যাসপারগিলাস বা সালমোনেলা সংক্রমণ মুক্ত কিনা নিশ্চিত করতে প্রতি মাসে সোয়াব নমুনা পরীক্ষা করুন।"
      ],
      parametersEn: [
        "Disinfectant Water Temp: >60°C",
        "Swab Count Target: <10 CFU/cm²",
        "Workflow: Strict one-way clean-to-dirty"
      ],
      parametersBn: [
        "জীবাণুনাশক পানির তাপমাত্রা: >৬০°সে",
        "সোয়াব কাউন্ট লক্ষ্যমাত্রা: <১০ CFU/cm²",
        "ওয়ার্কফ্লো: কঠোর একমুখী পরিষ্কার-থেকে-ময়লা"
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
          isEng ? "Hatchery Operation Guide" : "হ্যাচারি পরিচালনা গাইড (Operation Guide)",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        itemCount: _items.length,
        itemBuilder: (context, index) {
          final item = _items[index];
          return _buildOperationCard(context, item, isEng, isDark);
        },
      ),
    );
  }

  Widget _buildOperationCard(
    BuildContext context,
    OperationGuideItem item,
    bool isEng,
    bool isDark,
  ) {
    final title = isEng ? item.titleEn : item.titleBn;
    final subtitleText = isEng ? item.subtitleEn : item.subtitleBn;

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
          onTap: () => _showDetailsBottomSheet(context, item, isEng, isDark),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : const Color(0xFF1E293B),
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitleText,
                  style: TextStyle(
                    fontSize: 13,
                    color: isDark ? Colors.white60 : Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showDetailsBottomSheet(
    BuildContext context,
    OperationGuideItem item,
    bool isEng,
    bool isDark,
  ) {
    final title = isEng ? item.titleEn : item.titleBn;
    final description = isEng ? item.descriptionEn : item.descriptionBn;
    final keySteps = isEng ? item.keyStepsEn : item.keyStepsBn;
    final parameters = isEng ? item.parametersEn : item.parametersBn;

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

                  // Key Steps Section
                  Text(
                    isEng ? "Standard Operating Steps (SOP)" : "প্রমিত পরিচালনা ধাপসমূহ (SOP)",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : const Color(0xFF1E293B),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ...keySteps.map((step) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("🔹 ", style: TextStyle(fontSize: 14)),
                            Expanded(
                              child: Text(
                                step,
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

                  // Parameters Section
                  Text(
                    isEng ? "Key Technical Standards & Target Parameters" : "মূল কারিগরি সূচক ও টার্গেট পরামিতি",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : const Color(0xFF1E293B),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ...parameters.map((param) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("✅ ", style: TextStyle(fontSize: 14)),
                            Expanded(
                              child: Text(
                                param,
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
