import 'package:flutter/material.dart';

class HatcheryTroubleItem {
  final String id;
  final String titleEn;
  final String titleBn;
  final String descriptionEn;
  final String descriptionBn;
  final List<String> causesEn;
  final List<String> causesBn;
  final List<String> solutionsEn;
  final List<String> solutionsBn;
  final List<String>? preventionEn;
  final List<String>? preventionBn;
  final String imageUrl;

  const HatcheryTroubleItem({
    required this.id,
    required this.titleEn,
    required this.titleBn,
    required this.descriptionEn,
    required this.descriptionBn,
    required this.causesEn,
    required this.causesBn,
    required this.solutionsEn,
    required this.solutionsBn,
    this.preventionEn,
    this.preventionBn,
    required this.imageUrl,
  });
}

class HatcheryTroubleshootingScreen extends StatelessWidget {
  final bool isEnglish;

  const HatcheryTroubleshootingScreen({super.key, required this.isEnglish});

  static const List<HatcheryTroubleItem> items = [
    // 1. Blood and Meat Spots
    HatcheryTroubleItem(
      id: "blood_meat_spots",
      titleEn: "Eggs Containing Blood and Meat Spots",
      titleBn: "ডিম রক্তের দাগ বা গোশতের চাকা যুক্ত",
      descriptionEn:
          "Blood spots are small deposits of blood, usually found on or near the yolk. Meat spots are small red, brown, grey, or white tissue-like particles found inside the egg. They reduce egg grading quality, although properly cooked eggs are generally not a food-safety problem.",
      descriptionBn:
          "রক্তের বিন্দু হলো কুসুমের গায়ে বা পাশে থাকা ছোট রক্তের জমাট দাগ। মাংসের স্পট হলো ডিমের ভেতরে থাকা ছোট লাল, বাদামী, ধূসর বা সাদা টিস্যুর মতো কণা। এগুলো ডিমের গ্রেডিং বা গুণমান কমিয়ে দেয়, যদিও সঠিকভাবে রান্না করা ডিম খাবারের জন্য ক্ষতিকর নয়।",
      causesEn: [
        "Rupture of small blood vessels during ovulation.",
        "Minor injury or irritation of the ovary or oviduct.",
        "Infectious Bronchitis or other conditions affecting reproductive-tract health.",
        "Deficiency or imbalance of Vitamin A, Vitamin K, Biotin, Magnesium, or other nutrients.",
        "Moldy feed or feed contaminated with mycotoxins.",
        "Sudden stress caused by vaccination, catching, loud noise, predators, or abrupt management changes.",
        "Interrupted drinking-water supply.",
        "Incorrect lighting schedule, continuous lighting, or sudden changes in light duration or intensity.",
        "Heat stress or sudden temperature fluctuation.",
        "Increasing flock age.",
        "A small genetic or strain-related predisposition.",
        "Meat spots may develop from degenerated blood spots or sloughed oviduct tissue."
      ],
      causesBn: [
        "ডিম্বস্ফোটনের (Ovulation) সময় সূক্ষ্ম রক্তনালী ছিঁড়ে যাওয়া।",
        "ডিম্বাশয় (Ovary) বা ডিম্বনালীতে (Oviduct) মৃদু আঘাত বা ইরিটেশন।",
        "ইনফেকশাস ব্রঙ্কাইটিস (IB) বা প্রজননতন্ত্রের স্বাস্থ্য প্রভাবিত করে এমন রোগ।",
        "ভিটামিন এ, ভিটামিন কে, বায়োটিন, ম্যাগনেসিয়াম বা অন্যান্য পুষ্টির অভাব ও ভারসাম্যহীনতা।",
        "ছত্রাকযুক্ত বা মাইকোটক্সিন দ্বারা দূষিত খাবার।",
        "টিকাদান, মুরগি ধরা, বিকট শব্দ, শিকারী প্রাণী বা হঠাৎ খামার ব্যবস্থাপনার পরিবর্তনের কারণে মানসিক চাপ।",
        "পানের পানির সরবরাহে বাধা বা বিঘ্ন সৃষ্টি হওয়া।",
        "ভুল লাইটিং শিডিউল, একটানা আলো দেওয়া বা লাইটের তীব্রতা ও মেয়াদের হঠাৎ পরিবর্তন।",
        "হিট স্ট্রেস বা শেডের তাপমাত্রার দ্রুত উঠানামা।",
        "মুরগির ঝাঁকের বয়স বৃদ্ধি পাওয়া।",
        "নির্দিষ্ট ব্রিড বা স্ট্রেইনের বংশগত জেনেটিক প্রবণতা।",
        "রক্তের স্পট ক্ষয়ে গিয়ে বা ডিম্বনালীর খোসা টিস্যু খসে পড়ে মিট স্পট তৈরি হওয়া।"
      ],
      solutionsEn: [
        "Review flock health and the Infectious Bronchitis vaccination program.",
        "Check feed quality, storage conditions, and mycotoxin risk.",
        "Review the vitamin and mineral specification with a poultry nutritionist.",
        "Maintain an uninterrupted supply of clean drinking water.",
        "Reduce unnecessary handling and other sudden stressors.",
        "Correct lighting, ventilation, and temperature-management problems.",
        "Record the percentage of affected eggs by flock age and production stage."
      ],
      solutionsBn: [
        "ফ্ল্যাকের স্বাস্থ্য ও ইনফেকশাস ব্রঙ্কাইটিস (IB) ভ্যাক্সিনেশন প্রোগ্রাম পুনর্নিরীক্ষণ করুন।",
        "খাবারের গুণগত মান, সংরক্ষণ পরিস্থিতি ও মাইকোটক্সিনের ঝুঁকি পরীক্ষা করুন।",
        "পোল্ট্রি পুষ্টিবিদের পরামর্শে খাবারের ভিটামিন ও মিনারেল মাত্রা যাচাই করুন।",
        "সবসময় বিশুদ্ধ সুপেয় পানির নিরবচ্ছিন্ন সরবরাহ নিশ্চিত করুন।",
        "অপ্রয়োজনীয় মুরগি ধরাছোঁড়া ও হঠাৎ তৈরি হওয়া স্ট্রেস কমিয়ে আনুন।",
        "শেডের লাইটিং, বায়ুসঞ্চালন ও তাপমাত্রা ব্যবস্থাপনা সমস্যা ঠিক করুন।",
        "ফ্ল্যাকে কত শতাংশ ডিমে এই সমস্যা হচ্ছে তার বয়স ও স্টেজ অনুযায়ী রেকর্ড রাখুন।"
      ],
      preventionEn: [
        "Use a balanced breeder or layer ration from reliable ingredients.",
        "Store feed in a dry, clean, and well-ventilated area.",
        "Follow a stable lighting program without sudden changes.",
        "Maintain good disease prevention, biosecurity, and vaccination practices.",
        "Minimize flock disturbance, especially during the afternoon and night."
      ],
      preventionBn: [
        "বিশ্বস্ত উপাদান দিয়ে তৈরি সুষম ব্রিডার বা লেয়ার ফিড ব্যবহার করুন।",
        "শুকনো, পরিষ্কার ও পর্যাপ্ত আলো-বাতাসযুক্ত স্থানে খাবার সংরক্ষণ করুন।",
        "কোনো আকস্মিক পরিবর্তন ছাড়া একটি স্থিতিশীল আলো প্রদান কর্মসূচি অনুসরণ করুন।",
        "উত্তম রোগ প্রতিরোধ, জৈবনিরাপত্তা (Biosecurity) ও টিকাদান নিশ্চিত করুন।",
        "বিশেষ করে দুপুর ও রাতের বেলা মুরগির ঘরে যেকোনো ধরনের বিরক্তি বা বিঘ্ন সর্বনিম্ন রাখুন।"
      ],
      imageUrl: "https://img.freepik.com/free-vector/cute-chicken-sitting-egg-cartoon-vector-icon-illustration-animal-nature-icon-concept-isolated_138676-5084.jpg",
    ),

    // 2. Infertility
    HatcheryTroubleItem(
      id: "infertility",
      titleEn: "Infertility",
      titleBn: "অনুর্বর বা আনফার্টিলাইজড ডিম (Infertility)",
      descriptionEn:
          "Infertility means that an egg was not successfully fertilized. It must be distinguished from very early embryonic death by breakout examination.",
      descriptionBn:
          "অনুর্বরতা বা ইনফার্টিলিটি বলতে বোঝায় ডিমটি সফলভাবে নিষিক্ত হয়নি। ব্রেকআউট পরীক্ষার মাধ্যমে প্রারম্ভিক ভ্রূণ মৃত্যুর সাথে এটিকে আলাদাভাবে চিহ্নিত করতে হবে।",
      causesEn: [
        "Too few, too many, inactive, poorly selected, or sterile males.",
        "Incorrect male-to-female ratio.",
        "Old males or excessive decline in mating activity.",
        "Poor male and female body weight, condition, or flock uniformity.",
        "Leg, foot, skeletal, or breast problems reducing mating ability.",
        "Heat stress and seasonal reduction in mating activity.",
        "Disease affecting reproductive performance.",
        "Inadequate feeder or drinker space and excessive competition.",
        "Poor-quality or nutritionally imbalanced breeder feed.",
        "Incorrect spiking, intra-spiking, or male-replacement management."
      ],
      causesBn: [
        "খুব কম, খুব বেশি, নিষ্ক্রিয়, নিম্নমানের নির্বাচিত বা বন্ধ্যা মোরগ।",
        "ভুল নর-মাদী (মোরগ-মুরগি) অনুপাত।",
        "বয়স্ক মোরগ বা প্রজনন কার্যক্রমে অতিরিক্ত হ্রাস পাওয়া।",
        "মোরগ ও মুরগির নিম্নমানের শরীরের ওজন, দৈহিক অবস্থা বা ফ্ল্যাকে অনিয়মিত ইউনিফর্মিটি।",
        "পা, পায়ের পাতা, কঙ্কালতন্ত্র বা বুকের সমস্যার কারণে মিলনের সামর্থ্য কমে যাওয়া।",
        "হিট স্ট্রেস ও ঋতুভিত্তিক প্রজনন আগ্রহ হ্রাস পাওয়া।",
        "প্রজনন কর্মক্ষমতাকে প্রভাবিত করে এমন ব্যাধি বা রোগ আক্রমণ।",
        "অপ্রতুল ফিডার বা ড্রিংকার স্পেস এবং খাবারে অতিরিক্ত প্রতিযোগিতা।",
        "নিম্নমানের বা পুষ্টির ভারসাম্যহীন ব্রিডার ফিড।",
        "ভুল স্পাইকিং, ইন্ট্রা-স্পাইকিং বা মোরগ প্রতিস্থাপন ব্যবস্থাপনা।"
      ],
      solutionsEn: [
        "Confirm infertility by fresh-egg breakout or early candling breakout.",
        "Check the active male percentage and male-to-female ratio.",
        "Remove weak, overweight, underweight, lame, or inactive males.",
        "Correct body-weight and uniformity problems gradually.",
        "Review feed allocation, feeder space, water access, and mating activity.",
        "Reduce heat stress and improve ventilation.",
        "Investigate disease when fertility drops suddenly."
      ],
      solutionsBn: [
        "তাজা ডিম ব্রেকআউট বা প্রারম্ভিক ক্যান্ডলিং ব্রেকআউট করে অনুর্বরতা নিশ্চিত করুন।",
        "সক্রিয় মোরগের শতাংশ এবং নর-মাদী অনুপাত যাচাই করুন।",
        "দুর্বল, অতিরিক্ত ওজনের, কম ওজনের, খুঁড়িয়ে চলা বা নিষ্ক্রিয় মোরগ ছাঁটাই (Cull) করুন।",
        "শরীরের ওজন ও ইউনিফর্মিটি সমস্যা ধীরে ধীরে ঠিক করুন।",
        "ফিডের বরাদ্দ, ফিডার স্পেস, পানির সহজলভ্যতা ও মিলন কার্যক্রম পর্যবেক্ষণ করুন।",
        "হিট স্ট্রেস কমান এবং শেডের বায়ুসঞ্চালন উন্নত করুন।",
        "ফার্টিলিটি হঠাৎ কমে গেলে রোগ বা ব্যাধির তদন্ত করুন।"
      ],
      preventionEn: [
        "Monitor fertility and hatchability every week.",
        "Maintain breeder target body weight and uniformity.",
        "Follow the recommended male-management and spiking program.",
        "Maintain sound legs and feet through proper litter, nutrition, and stocking density."
      ],
      preventionBn: [
        "প্রতি সপ্তাহে ফার্টিলিটি ও হ্যাচেবিলিটি হার মনিটর করুন।",
        "ব্রিডার মোরগ-মুরগির টার্গেট বডি ওয়েট ও ইউনিফর্মিটি বজায় রাখুন।",
        "অনুমোদিত মোরগ ব্যবস্থাপনা ও স্পাইকিং প্রোগ্রাম অনুসরণ করুন।",
        "সঠিক লিটার, পুষ্টি ও স্টকিং ডেনসিটি বজায় রেখে পা ও পায়ের পাতার স্বাস্থ্য ঠিক রাখুন।"
      ],
      imageUrl: "https://img.freepik.com/free-vector/cute-rooster-holding-egg-cartoon-vector-icon-illustration-animal-nature-icon-concept-isolated_138676-5976.jpg",
    ),

    // 3. Died at Membrane Stage (Day 1–2)
    HatcheryTroubleItem(
      id: "died_membrane_stage",
      titleEn: "Died at Membrane Stage (Day 1–2)",
      titleBn: "ঝিল্লি বা মেমব্রেন পর্যায়ে ভ্রূণ মৃত্যু (১–২ দিন)",
      descriptionEn:
          "The embryo dies before clear blood-vessel development. This may be confused with infertility unless eggs are carefully examined.",
      descriptionBn:
          "স্পষ্ট রক্তনালী গঠিত হওয়ার আগেই ভ্রূণের মৃত্যু ঘটে। ডিম সাবধানে পরীক্ষা (ব্রেকআউট) না করা হলে এটি অনুর্বর ডিম বলে ভুল হতে পারে।",
      causesEn: [
        "Rough egg handling, vibration, impact, or transport damage.",
        "Excessive nest temperature combined with infrequent egg collection.",
        "Broodiness or prolonged exposure to warm conditions before collection.",
        "Prolonged, unstable, or incorrect egg-storage temperature and humidity.",
        "Failure to pre-warm stored eggs correctly before setting.",
        "Incorrect, excessive, or poorly controlled egg disinfection.",
        "Poor breeder nutrition or breeder disease."
      ],
      causesBn: [
        "অসাবধানতার সাথে ডিম নাড়াচাড়া, অতিরিক্ত ঝাঁকুনি, আঘাত বা পরিবহনজনিত ক্ষতি।",
        "নেস্টে অতিরিক্ত তাপমাত্রা এবং অনিয়মিত বা দেরিতে ডিম সংগ্রহ।",
        "কুঁড়ে হওয়া (Broodiness) বা সংগ্রহের পূর্বে দীর্ঘক্ষণ গরম পরিবেশে উন্মুক্ত থাকা।",
        "দীর্ঘদিন, অস্থির বা ভুল ডিম-সংরক্ষণ তাপমাত্রা ও আর্দ্রতা।",
        "সেটিংয়ের পূর্বে সংরক্ষিত ডিম সঠিকভাবে প্রি-ওয়ার্মিং (Pre-warming) করতে ব্যর্থ হওয়া।",
        "ভুল, অতিরিক্ত বা অনিয়ন্ত্রিত ডিম জীবাণুমুক্তকরণ পদ্ধতি।",
        "ব্রিডারের নিম্নমানের পুষ্টি অথবা ব্রিডার ফ্ল্যাকে রোগের প্রাদুর্ভাব।"
      ],
      solutionsEn: [
        "Review egg collection frequency, handling, transport, and storage records.",
        "Separate infertility from early mortality by breakout examination.",
        "Correct storage temperature, humidity, and pre-warming procedures.",
        "Calibrate disinfection concentration, exposure time, and equipment.",
        "Investigate breeder-flock health and nutrition if the problem persists."
      ],
      solutionsBn: [
        "ডিম সংগ্রহের পর্যায়কাল, নাড়াচাড়া, পরিবহন ও সংরক্ষণের রেকর্ড পরীক্ষা করুন।",
        "ব্রেকআউট পরীক্ষার মাধ্যমে অনুর্বর ডিম থেকে প্রারম্ভিক ভ্রূণ মৃত্যুকে পৃথকভাবে নিশ্চিত করুন।",
        "সংরক্ষণাগারের তাপমাত্রা, আর্দ্রতা এবং প্রি-ওয়ার্মিং পদ্ধতি সঠিকভাবে সামঞ্জস্য করুন।",
        "ডিইনফেকশন কেমিক্যালের ঘনত্ব, এক্সপোজার সময় ও সরঞ্জাম ক্যালিব্রেট করুন।",
        "সমস্যা বজায় থাকলে ব্রিডার ফ্ল্যাকের স্বাস্থ্য ও পুষ্টি নিয়ে বিস্তারিত তদন্ত করুন।"
      ],
      preventionEn: [
        "Collect eggs frequently and handle them gently.",
        "Keep nests clean, cool, and comfortable.",
        "Store eggs under stable recommended conditions.",
        "Use a validated egg-disinfection program."
      ],
      preventionBn: [
        "ঘনঘন ডিম সংগ্রহ করুন এবং সাবধানে যত্নসহকারে বহন করুন।",
        "ডিম পাড়ার নেস্ট বা বাসা পরিষ্কার, ঠান্ডা ও আরামদায়ক রাখুন।",
        "অনুমোদিত ও স্থিতিশীল পরিবেশে ডিম সংরক্ষণ নিশ্চিত করুন।",
        "একটি সঠিক ও যাচাইকৃত ডিম-জীবাণুমুক্তকরণ কর্মসূচি অনুসরণ করুন।"
      ],
      imageUrl: "https://img.freepik.com/free-vector/cute-chick-hatching-from-egg-cartoon-vector-icon-illustration-animal-nature-icon-concept-isolated_138676-5085.jpg",
    ),

    // 4. Died at Blood Ring Stage (Day 3–4)
    HatcheryTroubleItem(
      id: "died_blood_ring_stage",
      titleEn: "Died at Blood Ring Stage (Day 3–4)",
      titleBn: "ব্ল্যাড রিং বা রক্তবলয় পর্যায়ে ভ্রূণ মৃত্যু (৩–৪ দিন)",
      descriptionEn:
          "A blood ring indicates that circulation began but the embryo died during early development.",
      descriptionBn:
          "রক্তবলয় বা ব্লাড রিং নির্দেশ করে যে রক্ত সঞ্চালন শুরু হয়েছিল কিন্তু প্রারম্ভিক বিকাশের সময় ভ্রূণটি মারা গেছে।",
      causesEn: [
        "Chilled or overheated hatching eggs before setting.",
        "Incorrect setter temperature or significant temperature fluctuation.",
        "Incorrect egg disinfection or chemical injury.",
        "High numbers of floor eggs, cracked eggs, dirty eggs, or contaminated eggs.",
        "Bacterial or fungal contamination.",
        "Breeder disease or poor breeder immunity.",
        "Nutritional deficiency or imbalance.",
        "Turning failure or delayed turning.",
        "Prolonged or improper egg storage.",
        "Broodiness or pre-incubation in the nest.",
        "Moldy feed or mycotoxin exposure."
      ],
      causesBn: [
        "সেটিংয়ের পূর্বে ডিম অতিরিক্ত ঠান্ডা (Chilled) বা অতিরিক্ত গরম হওয়া।",
        "সেটারের ভুল তাপমাত্রা বা তাপমাত্রার বড় ধরনের তারতম্য।",
        "ভুল ডিম-জীবাণুমুক্তকরণ পদ্ধতি বা রাসায়নিক ক্ষতি।",
        "অতিরিক্ত ফ্লোর ডিম (মেঝেতে পাড়া ডিম), ফাটা ডিম, নোংরা ডিম বা দূষিত ডিমের উপস্থিতি।",
        "ব্যাকটেরিয়া বা ছত্রাকজনিত (Fungal) সংক্রমণ।",
        "ব্রিডারের রোগব্যাধি বা ব্রিডারের রোগ প্রতিরোধ ক্ষমতা কমে যাওয়া।",
        "পুষ্টির ঘাটতি বা পুষ্টির ভারসাম্যহীনতা।",
        "ডিম টার্নিং বা ঘুরানো বন্ধ থাকা কিংবা টার্নিংয়ে বিলম্ব হওয়া।",
        "অতিরিক্ত দীর্ঘদিন বা অনুপযুক্ত উপায়ে ডিম সংরক্ষণ।",
        "কুঁড়ে হওয়া বা বাসা/নেস্টে প্রাক-ইনকিউবেশন হওয়া।",
        "ছত্রাকযুক্ত বা মাইকোটক্সিনযুক্ত খাবার গ্রহণ।"
      ],
      solutionsEn: [
        "Calibrate setter temperature and check temperature uniformity.",
        "Review egg hygiene, floor-egg control, and sanitation.",
        "Verify turning start time, frequency, angle, and alarm history.",
        "Review storage duration and environmental records.",
        "Culture contaminated eggs when bacterial contamination is suspected.",
        "Review breeder nutrition, health, and feed quality."
      ],
      solutionsBn: [
        "সেটার তাপমাত্রা ক্যালিব্রেট করুন এবং সমভাবে তাপমাত্রা ছড়িয়ে পড়ছে কিনা পরীক্ষা করুন।",
        "ডিমের পরিচ্ছন্নতা, ফ্লোর-ডিম নিয়ন্ত্রণ ও স্যানিটেশন পদ্ধতি পর্যালোচনা করুন।",
        "টার্নিং শুরুর সময়, ফ্রিকোয়েন্সি, অ্যাঙ্গেল ও অ্যালার্ম হিস্ট্রি যাচাই করুন।",
        "সংরক্ষণের সময়কাল ও পরিবেশগত রেকর্ড পরীক্ষা করুন।",
        "ব্যাকটেরিয়া সংক্রমণ সন্দেহ হলে দূষিত ডিম কালচার টেস্ট করুন।",
        "ব্রিডারের পুষ্টি, স্বাস্থ্য ও ফিডের মান পুনর্নিরীক্ষণ করুন।"
      ],
      preventionEn: [
        "Set only clean, sound, correctly stored hatching eggs.",
        "Maintain stable setter temperature and reliable turning.",
        "Reduce floor eggs and sanitize equipment between batches.",
        "Monitor breeder disease and nutritional status."
      ],
      preventionBn: [
        "শুধুমাত্র পরিষ্কার, অক্ষত ও সঠিকভাবে সংরক্ষিত হ্যাচিং ডিম সেটিং দিন।",
        "সেটারের স্থিতিশীল তাপমাত্রা এবং নির্ভরযোগ্য টার্নিং বজায় রাখুন।",
        "ফ্লোর ডিম কমান এবং ব্যাচের মাঝে সরঞ্জাম জীবাণুমুক্ত করুন।",
        "ব্রিডারের রোগব্যাধি ও পুষ্টির অবস্থা মনিটর করুন।"
      ],
      imageUrl: "https://img.freepik.com/free-vector/cute-chick-standing-egg-cartoon-vector-icon-illustration-animal-nature-icon-concept-isolated_138676-5087.jpg",
    ),

    // 5. Died at Eye Stage (Day 5–7)
    HatcheryTroubleItem(
      id: "died_eye_stage",
      titleEn: "Died at Eye Stage (Day 5–7)",
      titleBn: "চোখ বিকাশ পর্যায়ে ভ্রূণ মৃত্যু (৫–৭ দিন)",
      descriptionEn:
          "Embryos die after visible eye development but before the middle stage of incubation.",
      descriptionBn:
          "চোখের রঞ্জক পদার্থ স্পষ্টভাবে দৃশ্যমান হওয়ার পর ইনকিউবেশনের মধ্যবর্তী ধাপে পৌঁছানোর আগেই ভ্রূণ মারা যায়।",
      causesEn: [
        "Incorrect setter temperature or uneven heat distribution.",
        "Turning failure, inadequate turning angle, or mechanical malfunction.",
        "Prolonged or improper egg storage.",
        "Breeder disease or vertically transmitted infection.",
        "Nutritional deficiency or imbalance.",
        "Egg contamination or poor sanitation.",
        "Inadequate ventilation or excessive carbon dioxide."
      ],
      causesBn: [
        "সেটারের ভুল তাপমাত্রা বা অসমান তাপ বণ্টন।",
        "ডিম টার্নিং বা ঘুরানো বন্ধ হওয়া, অপ্রতুল টার্নিং কোণ বা যান্ত্রিক ত্রুটি।",
        "অতিরিক্ত দীর্ঘ দিন ধরে বা অনুপযুক্ত উপায়ে ডিম সংরক্ষণ।",
        "ব্রিডারের রোগব্যাধি বা উল্লম্বভাবে (মা থেকে বাচ্চায়) সংক্রমিত রোগ।",
        "পুষ্টির ঘাটতি বা ভারসাম্যহীনতা।",
        "ডিমের জীবাণু দূষণ বা নিম্নমানের স্যানিটেশন।",
        "অপ্রতুল বায়ুসঞ্চালন বা বাতাসে অতিরিক্ত কার্বন ডাই অক্সাইডের উপস্থিতি।"
      ],
      solutionsEn: [
        "Check calibrated temperature at egg level in different machine locations.",
        "Inspect turning equipment, alarms, angle, and frequency.",
        "Review storage age and storage-room records.",
        "Investigate breeder health, feed quality, and sanitation.",
        "Perform routine residue breakout to identify patterns by machine and flock."
      ],
      solutionsBn: [
        "মেশিনের বিভিন্ন অবস্থানে ডিমের লেভেলে নিখুঁত তাপমাত্রা মাপুন।",
        "টার্নিং সরঞ্জাম, অ্যালার্ম, অ্যাঙ্গেল এবং ফ্রিকোয়েন্সি পরিদর্শন করুন।",
        "ডিম সংরক্ষণের বয়স এবং সংরক্ষণ রুমের পরিবেশগত রেকর্ড পর্যালোচনা করুন।",
        "ব্রিডারের স্বাস্থ্য, ফিডের গুণমান এবং স্যানিটেশন নিয়ে বিস্তারিত তদন্ত করুন।",
        "মেশিন ও ফ্ল্যাক অনুযায়ী নির্দিষ্ট প্যাটার্ন চিহ্নিত করতে নিয়মিত রেসিডিউ ব্রেকআউট টেস্ট পরিচালনা করুন।"
      ],
      preventionEn: [
        "Maintain correct setter temperature, turning, ventilation, and sanitation.",
        "Avoid excessive storage and temperature fluctuation.",
        "Maintain balanced breeder nutrition and disease control."
      ],
      preventionBn: [
        "সেটারের সঠিক তাপমাত্রা, টার্নিং, বায়ুসঞ্চালন ও স্যানিটেশন বজায় রাখুন।",
        "অতিরিক্ত দীর্ঘ সংরক্ষণ ও তাপমাত্রার দ্রুত উঠানামা এড়িয়ে চলুন।",
        "ব্রিডারের সুষম পুষ্টি নিশ্চিত করুন ও রোগব্যাধি নিয়ন্ত্রণ বজায় রাখুন।"
      ],
      imageUrl: "https://img.freepik.com/free-vector/cute-chick-wearing-egg-shell-hat-cartoon-icon-illustration_138676-2829.jpg",
    ),

    // 6. Died from Egg-Tooth Stage to Yolk-Sac Absorption (Day 8–14)
    HatcheryTroubleItem(
      id: "died_egg_tooth_yolk_stage",
      titleEn: "Died from Egg-Tooth Stage until Start of Yolk-Sac Absorption (Day 8–14)",
      titleBn: "ডিম-দাঁত থেকে কুসুম শোষণের শুরু পর্যন্ত ভ্রূণ মৃত্যু (৮–১৪ দিন)",
      descriptionEn:
          "This is middle-stage embryonic mortality occurring after major structures have formed but before the final preparation for hatch.",
      descriptionBn:
          "এটি মধ্যবর্তী-পর্যায়ের (Middle-stage) ভ্রূণ মৃত্যু যা প্রধান প্রধান কাঠামোগুলো গঠিত হওয়ার পর কিন্তু ফোটার চূড়ান্ত প্রস্তুতির পূর্বে ঘটে।",
      causesEn: [
        "Incorrect or uneven incubation temperature.",
        "Eggs kept too long outside the setter during candling or transfer-related work.",
        "Poor ventilation of the setter or setter room.",
        "Incorrect setter humidity and abnormal egg-weight loss.",
        "Turning failure or insufficient turning angle.",
        "Prolonged or improper egg storage.",
        "Breeder disease or egg contamination.",
        "Nutritional deficiency or imbalance.",
        "Machine hot spots, blocked airflow, or incorrect trolley loading."
      ],
      causesBn: [
        "ভুল বা অসমান ইনকিউবেশন তাপমাত্রা।",
        "ক্যান্ডলিং বা ট্রান্সফারের কাজের সময় সেটারের বাইরে ডিম অতিরিক্ত সময় রাখা।",
        "সেটার বা সেটার রুমের নিম্নমানের বায়ুসঞ্চালন।",
        "সেটারের ভুল আর্দ্রতা ও ডিমের অস্বাভাবিক ওজন হ্রাস (Weight loss)।",
        "ডিম টার্নিং বন্ধ থাকা বা অপর্যাপ্ত টার্নিং কোণ।",
        "দীর্ঘদিন ধরে বা অনুপযুক্ত উপায়ে ডিম সংরক্ষণ।",
        "ব্রিডারের রোগব্যাধি বা ডিমের সংক্রামিত দূষণ।",
        "পুষ্টির ঘাটতি বা ভারসাম্যহীনতা।",
        "মেশিনের হট স্পট, অবরুদ্ধ বাতাস চলাচলের পথ বা ট্রলি লোডিংয়ের ভুল।"
      ],
      solutionsEn: [
        "Check temperature distribution and airflow throughout the setter.",
        "Minimize time eggs remain outside controlled incubation conditions.",
        "Measure egg-weight loss and adjust humidity based on actual results.",
        "Verify turning equipment and trolley loading.",
        "Review breeder health, nutrition, and egg-storage duration."
      ],
      solutionsBn: [
        "পুরো সেটার জুড়ে তাপমাত্রা বণ্টন এবং বাতাসের প্রবাহ পরীক্ষা করুন।",
        "নিয়ন্ত্রিত ইনকিউবেশন পরিবেশের বাইরে ডিম রাখার সময় সর্বনিম্ন করুন।",
        "ডিমের ওজন হ্রাস মেপে প্রকৃত ফলাফলের ওপর ভিত্তি করে আর্দ্রতা সামঞ্জস্য করুন।",
        "টার্নিং সরঞ্জাম এবং ট্রলি লোডিং সঠিকভাবে যাচাই করুন।",
        "ব্রিডারের স্বাস্থ্য, পুষ্টি এবং ডিম সংরক্ষণের সময়কাল পর্যালোচনা করুন।"
      ],
      preventionEn: [
        "Calibrate incubation sensors and perform regular machine mapping.",
        "Maintain correct ventilation and loading patterns.",
        "Monitor egg-weight loss by flock and egg age.",
        "Keep candling and transfer procedures efficient."
      ],
      preventionBn: [
        "ইনকিউবেশন সেন্সরগুলো ক্যালিব্রেট করুন এবং নিয়মিত মেশিন ম্যাপিং করুন।",
        "সঠিক বায়ুসঞ্চালন এবং ট্রলি লোডিং প্যাটার্ন বজায় রাখুন।",
        "ফ্ল্যাক এবং ডিমের বয়স অনুযায়ী ডিমের ওজন হ্রাস মনিটর করুন।",
        "ক্যান্ডলিং এবং ট্রান্সফারের কাজ দ্রুত ও দক্ষ উপায়ে সম্পাদন করুন।"
      ],
      imageUrl: "https://img.freepik.com/free-vector/cute-chick-hatching-egg-cartoon-vector-icon-illustration_138676-2082.jpg",
    ),

    // 7. Death of Chicks before Internal Pipping
    HatcheryTroubleItem(
      id: "death_before_internal_pipping",
      titleEn: "Death of Chicks before Internal Pipping",
      titleBn: "অভ্যন্তরীণ পিপিংয়ের (Internal Pipping) পূর্বে বাচ্চার মৃত্যু",
      descriptionEn:
          "The embryo reaches the late stage of development but dies before breaking through the inner shell membrane into the air cell.",
      descriptionBn:
          "ভ্রূণটি বিকাশের শেষ পর্যায়ে পৌঁছায় কিন্তু ডিমের ভেতরের মেমব্রেন ছিদ্র করে এয়ার সেলে (বাতাসের প্রকোষ্ঠে) ঢোকার আগেই মারা যায়।",
      causesEn: [
        "Insufficient or incorrect turning during setter incubation.",
        "Incorrect incubation temperature or humidity.",
        "Eggs set with the small end upward.",
        "Abnormal air-cell position or detached air cell.",
        "Excessive setter humidity causing inadequate egg-weight loss.",
        "Poor ventilation and excessive carbon dioxide.",
        "Incorrect transfer time or rough transfer handling.",
        "Nutritional deficiency, breeder disease, or embryo malposition."
      ],
      causesBn: [
        "সেটারে ইনকিউবেশনের সময় অপ্রতুল বা ভুল টার্নিং।",
        "ভুল ইনকিউবেশন তাপমাত্রা বা আর্দ্রতা।",
        "ডিম উল্টো করে স্থাপন (সরু মাথা উপরে দিয়ে সেটিং)।",
        "অস্বাভাবিক এয়ার-সেল অবস্থান বা মেমব্রেন থেকে এয়ার-সেল আলগা হওয়া।",
        "অতিরিক্ত সেটার আর্দ্রতা যার ফলে অপ্রতুল ডিমের ওজন হ্রাস।",
        "নিম্নমানের বায়ুসঞ্চালন এবং বাতাসে অতিরিক্ত কার্বন ডাই অক্সাইড।",
        "ভুল ট্রান্সফার সময়কাল বা ট্রান্সফারের সময় অসাবধানতাহীন নাড়াচাড়া।",
        "পুষ্টির ঘাটতি, ব্রিডারের রোগব্যাধি বা ভ্রূণের ভুল অবস্থান (Malposition)।"
      ],
      solutionsEn: [
        "Check egg setting position and tray loading.",
        "Verify turning angle, frequency, and machine function.",
        "Measure egg-weight loss and air-cell development.",
        "Check setter ventilation, carbon dioxide, and temperature uniformity.",
        "Review transfer timing and handling procedures."
      ],
      solutionsBn: [
        "ডিম সেটিংয়ের অবস্থান (মোটা মাথা উপরে) ও ট্রে লোডিং পরীক্ষা করুন।",
        "টার্নিংয়ের কোণ, ফ্রিকোয়েন্সি ও মেশিনের কার্যকারিতা যাচাই করুন।",
        "ডিমের ওজন হ্রাস ও এয়ার সেলের বৃদ্ধি পরিমাপ করুন।",
        "সেটারের বায়ুসঞ্চালন, কার্বন ডাই অক্সাইড ও তাপমাত্রার সমতা পরীক্ষা করুন।",
        "হ্যাচারে ট্রান্সফারের সময় নির্ধারণ ও নাড়াচাড়ার পদ্ধতি পর্যালোচনা করুন।"
      ],
      preventionEn: [
        "Set eggs large end upward.",
        "Maintain correct turning until transfer.",
        "Use egg-weight loss and air-cell size to guide humidity.",
        "Maintain stable temperature and adequate ventilation."
      ],
      preventionBn: [
        "ডিমের মোটা মাথা (Broad end) সবসময় উপরে রেখে সেটিং দিন।",
        "হ্যাচারে ট্রান্সফারের পূর্ব পর্যন্ত সঠিক টার্নিং বজায় রাখুন।",
        "আর্দ্রতা নিয়ন্ত্রণের নির্দেশনা হিসেবে ডিমের ওজন হ্রাস ও এয়ার সেলের আকার ব্যবহার করুন।",
        "স্থিতিশীল তাপমাত্রা এবং পর্যাপ্ত বায়ুসঞ্চালন নিশ্চিত করুন।"
      ],
      imageUrl: "https://img.freepik.com/free-vector/cute-chicken-laying-egg-cartoon-icon-illustration_138676-2827.jpg",
    ),

    // 8. Death of Chicks after External Pipping
    HatcheryTroubleItem(
      id: "death_after_external_pipping",
      titleEn: "Death of Chicks after External Pipping",
      titleBn: "বাহ্যিক পিপিংয়ের (External Pipping) পর বাচ্চার মৃত্যু",
      descriptionEn:
          "The chick breaks the shell but dies before completing the hatch.",
      descriptionBn:
          "বাচ্চা ডিমের বাইরের খোসা ফাটিয়ে ফেলে (External Pipping) কিন্তু সম্পূর্ণ ডিমের খোসা কেটে বের হওয়া শেষ করার আগেই মারা যায়।",
      causesEn: [
        "Incorrect incubation temperature or humidity.",
        "Low hatcher humidity causing shell membranes to dry and stick to the chick.",
        "Excessively high humidity delaying normal drying and respiration.",
        "Poor hatcher ventilation or excessive carbon dioxide.",
        "Insufficient turning during setter incubation.",
        "Eggs incubated upside down or abnormal air-cell position.",
        "Short periods of excessively high or low temperature.",
        "Premature opening of the hatcher door and loss of humidity.",
        "Weak chicks caused by breeder nutrition, disease, contamination, or prolonged storage."
      ],
      causesBn: [
        "ভুল ইনকিউবেশন তাপমাত্রা বা আর্দ্রতা।",
        "হ্যাচারের কম আর্দ্রতা যার ফলে ডিমের খোসার মেমব্রেন শুকিয়ে বাচ্চার গায়ে আটকে যায়।",
        "অতিরিক্ত বেশি আর্দ্রতা যা স্বাভাবিক শুকানো ও শ্বাসপ্রশ্বাসে বিলম্ব ঘটায়।",
        "হ্যাচারের নিম্নমানের বায়ুসঞ্চালন বা বাতাসে অতিরিক্ত কার্বন ডাই অক্সাইড।",
        "সেটারে ইনকিউবেশনের সময় অপ্রতুল ডিম টার্নিং।",
        "ডিম উল্টো করে (সরু মাথা উপরে) ইনকিউবেশন বা অস্বাভাবিক এয়ার-সেল অবস্থান।",
        "স্বল্প সময়ের জন্য অতিরিক্ত উচ্চ বা নিম্ন তাপমাত্রা।",
        "সময়ের আগেই হ্যাচারের দরজা বারবার খোলা এবং আর্দ্রতা কমে যাওয়া।",
        "ব্রিডারের পুষ্টির ঘাটতি, রোগব্যাধি, সংক্রামক দূষণ বা দীর্ঘদিন সংরক্ষণের কারণে দুর্বল বাচ্চা।"
      ],
      solutionsEn: [
        "Check hatcher temperature, humidity, airflow, and carbon dioxide.",
        "Avoid unnecessary door opening during the hatch window.",
        "Examine membranes: dry membranes suggest low humidity; wet chicks may suggest excessive humidity or poor ventilation.",
        "Review setter turning, egg orientation, transfer, and storage history.",
        "Investigate breeder health and nutrition when late dead-in-shell remains high."
      ],
      solutionsBn: [
        "হ্যাচার রুম ও মেশিনের তাপমাত্রা, আর্দ্রতা, বাতাস চলাচলের গতি ও কার্বন ডাই অক্সাইড মেপে দেখুন।",
        "হ্যাচ উইন্ডো চলাকালীন অনাবশ্যক হ্যাচার দরজা খোলা এড়িয়ে চলুন।",
        "ডিমের ঝিল্লি পরীক্ষা করুন: শুষ্ক মেমব্রেন কম আর্দ্রতা নির্দেশ করে; ভিজা বাচ্চা অতিরিক্ত আর্দ্রতা বা দুর্বল বায়ুসঞ্চালন ইঙ্গিত দেয়।",
        "সেটারের টার্নিং, ডিমের দিক (Orientation), ট্রান্সফার ও ডিম সংরক্ষণের ইতিহাস পর্যালোচনা করুন।",
        "লেট ডেড-ইন-শেল (Late dead-in-shell) বেশি থাকলে ব্রিডারের স্বাস্থ্য ও পুষ্টি নিয়ে তদন্ত করুন।"
      ],
      preventionEn: [
        "Maintain stable hatcher conditions and adequate fresh air.",
        "Avoid abrupt humidity loss during external pipping.",
        "Transfer eggs gently and at the correct developmental stage.",
        "Use routine breakout analysis to separate malposition, contamination, and incubation causes."
      ],
      preventionBn: [
        "হ্যাচারে স্থিতিশীল পরিবেশগত অবস্থা এবং পর্যাপ্ত তাজা বাতাস সরবরাহ নিশ্চিত করুন।",
        "এক্সটার্নাল পিপিং চলাকালীন হঠাৎ আর্দ্রতা হ্রাস পাওয়া রোধ করুন।",
        "সঠিক প্রজনন ও বিকাশ পর্যায়ে সাবধানে কোমলভাবে ডিম হ্যাচারে ট্রান্সফার করুন।",
        "ভুল অবস্থান (Malposition), জীবাণু সংক্রমণ ও ইনকিউবেশনজনিত কারণগুলো পৃথক করতে নিয়মিত ব্রেকআউট বিশ্লেষণ ব্যবহার করুন।"
      ],
      imageUrl: "https://img.freepik.com/free-vector/cute-chick-breaking-egg-shell-cartoon-icon-illustration_138676-2830.jpg",
    ),

    // 9. Delayed Hatch
    HatcheryTroubleItem(
      id: "delayed_hatch",
      titleEn: "Delayed Hatch",
      titleBn: "বিলম্বিত হ্যাচ বা দেরিতে বাচ্চা ফোটা (Delayed Hatch)",
      descriptionEn:
          "The hatch begins or finishes later than the planned pull time, often with a wide hatch window.",
      descriptionBn:
          "হ্যাচিং নির্ধারণ করা টেক-অফ সময়ের চেয়ে দেরিতে শুরু হয় বা শেষ হয়, প্রায়শই দীর্ঘ হ্যাচ উইন্ডো তৈরি করে।",
      causesEn: [
        "Low average setter temperature.",
        "Low hatcher temperature.",
        "Uneven machine temperature, hot spots, or cold spots.",
        "Prolonged egg storage.",
        "Incorrect storage temperature or inadequate pre-warming.",
        "Large eggs or eggs from older breeder flocks.",
        "Incorrect setting time or inaccurate hatch planning.",
        "Excessive cooling during candling or transfer.",
        "Poor ventilation or overloaded machines."
      ],
      causesBn: [
        "সেটারের গড় তাপমাত্রা কম থাকা।",
        "হ্যাচারের কম তাপমাত্রা।",
        "মেশিনের তাপমাত্রা অসমান থাকা, হট স্পট বা কোল্ড স্পট থাকা।",
        "অতিরিক্ত দীর্ঘদিন ডিম সংরক্ষণ।",
        "ভুল সংরক্ষণ তাপমাত্রা বা অপ্রতুল প্রি-ওয়ার্মিং (Pre-warming)।",
        "বড় আকারের ডিম বা বয়স্ক ব্রিডার ফ্ল্যাকের ডিম।",
        "ভুল সেটিং সময় নির্ধারণ বা ভুল হ্যাচ পরিকল্পনা।",
        "ক্যান্ডলিং বা ট্রান্সফারের সময় ডিম অতিরিক্ত ঠান্ডা হয়ে যাওয়া।",
        "নিম্নমানের বায়ুসঞ্চালন বা মেশিনে অতিরিক্ত লোডিং।"
      ],
      solutionsEn: [
        "Verify actual machine temperature with a calibrated instrument.",
        "Check temperature uniformity across trolleys and trays.",
        "Review egg age, pre-warming, setting time, and transfer records.",
        "Reduce unnecessary egg cooling during handling.",
        "Compare hatch timing by breeder flock, egg size, and storage duration."
      ],
      solutionsBn: [
        "ক্যালিব্রেট করা যন্ত্র দিয়ে মেশিনের প্রকৃত তাপমাত্রা যাচাই করুন।",
        "ট্রলি ও ট্রে জুড়ে তাপমাত্রার সমতা পরীক্ষা করুন।",
        "ডিমের বয়স, প্রি-ওয়ার্মিং, সেটিং সময় ও ট্রান্সফার রেকর্ড পর্যালোচনা করুন।",
        "নাড়াচাড়ার সময় ডিম অনাবশ্যক ঠান্ডা হওয়া হ্রাস করুন।",
        "ব্রিডার ফ্ল্যাক, ডিমের আকার ও সংরক্ষণের সময়কাল অনুযায়ী হ্যাচ টাইম তুলনা করুন।"
      ],
      preventionEn: [
        "Calibrate machines regularly and map temperature distribution.",
        "Use consistent egg-storage and pre-warming procedures.",
        "Plan setting time according to flock age, egg age, and machine type.",
        "Monitor hatch-window data for every batch."
      ],
      preventionBn: [
        "নিয়মিত মেশিন ক্যালিব্রেট করুন এবং তাপমাত্রা বণ্টন মানচিত্র (Mapping) পরীক্ষা করুন।",
        "ধারাবাহিক ডিম-সংরক্ষণ ও প্রি-ওয়ার্মিং পদ্ধতি ব্যবহার করুন।",
        "ফ্ল্যাকের বয়স, ডিমের বয়স ও মেশিনের ধরন অনুযায়ী সেটিং সময় নির্ধারণ করুন।",
        "প্রতিটি ব্যাচের হ্যাচ-উইন্ডো ডেটা মনিটর করুন।"
      ],
      imageUrl: "https://img.freepik.com/free-vector/cute-chick-sitting-nest-cartoon-icon-illustration_138676-2828.jpg",
    ),

    // 10. Premature or Early Hatch
    HatcheryTroubleItem(
      id: "premature_early_hatch",
      titleEn: "Premature or Early Hatch",
      titleBn: "অকাল বা সময়ের আগেই বাচ্চা ফোটা (Early Hatch)",
      descriptionEn:
          "Chicks hatch too early and may remain in the hatcher too long before pull, increasing dehydration and chick-weight loss.",
      descriptionBn:
          "বাচ্চা নির্ধারিত সময়ের অনেক আগেই ফোটে এবং টেক-অফের আগে দীর্ঘক্ষণ হ্যাচারে আটকে থাকতে পারে, যার ফলে পানিশূন্যতা ও বাচ্চার ওজন হ্রাস বৃদ্ধি পায়।",
      causesEn: [
        "High average setter temperature.",
        "High hatcher temperature.",
        "Small eggs or eggs from young breeder flocks.",
        "Eggs warmed for too long before setting.",
        "Incorrect setting time.",
        "Machine hot spots or overloaded airflow paths."
      ],
      causesBn: [
        "সেটারের গড়ে উচ্চ তাপমাত্রা।",
        "হ্যাচারের অতিরিক্ত উচ্চ তাপমাত্রা।",
        "ছোট আকারের ডিম বা নতুন কচি ব্রিডার ফ্ল্যাকের ডিম।",
        "সেটিংয়ের পূর্বে ডিম অতিরিক্ত দীর্ঘ সময় প্রি-ওয়ার্মিং করা।",
        "ভুল সেটিং সময় নির্ধারণ।",
        "মেশিনের হট স্পট বা অবরুদ্ধ বায়ুপ্রবাহের পথ।"
      ],
      solutionsEn: [
        "Check calibrated setter and hatcher temperature.",
        "Review pre-warming duration and actual setting time.",
        "Compare hatch timing with breeder age and egg size.",
        "Check machine loading and temperature distribution."
      ],
      solutionsBn: [
        "ক্যালিব্রেট করা সেটার ও হ্যাচারের তাপমাত্রা মেপে দেখুন।",
        "প্রি-ওয়ার্মিংয়ের সময়কাল ও প্রকৃত সেটিং সময় পর্যালোচনা করুন।",
        "ব্রিডারের বয়স ও ডিমের আকারের সাথে হ্যাচ টাইমিং তুলনা করুন।",
        "মেশিনের লোডিং ও তাপমাত্রা বণ্টন পরীক্ষা করুন।"
      ],
      preventionEn: [
        "Maintain correct and uniform incubation temperature.",
        "Adjust hatch planning for small eggs and young flocks.",
        "Monitor the hatch window and chick temperature at pull."
      ],
      preventionBn: [
        "সঠিক ও সমতাপূর্ণ ইনকিউবেশন তাপমাত্রা বজায় রাখুন।",
        "ছোট ডিম ও কচি ফ্ল্যাকের জন্য হ্যাচ পরিকল্পনা সামঞ্জস্য করুন।",
        "হ্যাচ উইন্ডো এবং টেক-অফের সময় বাচ্চার শরীরের তাপমাত্রা মনিটর করুন।"
      ],
      imageUrl: "https://img.freepik.com/free-vector/cute-baby-chick-cartoon-icon-illustration_138676-2826.jpg",
    ),

    // 11. Sticky Chicks
    HatcheryTroubleItem(
      id: "sticky_chicks",
      titleEn: "Sticky Chicks",
      titleBn: "আঠালো বা চটচটে বাচ্চা (Sticky Chicks)",
      descriptionEn:
          "Sticky chicks have wet or adhesive down, shell membrane or albumen adhering to the body, and may struggle to complete hatch.",
      descriptionBn:
          "আঠালো বাচ্চার শরীরে ভেজা বা চটচটে পালক, ডিমের মেমব্রেন বা কাঁচা অ্যালবুমেন (ডিমের সাদা অংশ) লেগে থাকে এবং সম্পূর্ণ ফোটা শেষ করতে কষ্ট হতে পারে।",
      causesEn: [
        "Low temperature during the late incubation or hatching period.",
        "Excessive hatcher humidity.",
        "Inadequate ventilation or air circulation in the hatcher.",
        "Turning failure during setter incubation.",
        "Prolonged egg storage.",
        "Incorrect egg-weight loss before transfer.",
        "Poor-quality, contaminated, or cracked eggs.",
        "Very large eggs or eggs from older breeder flocks."
      ],
      causesBn: [
        "ইনকিউবেশনের শেষ বা হ্যাচিং সময়কালে কম তাপমাত্রা।",
        "হ্যাচারের অতিরিক্ত বেশি আর্দ্রতা।",
        "হ্যাচারে অপ্রতুল বায়ুসঞ্চালন বা বাতাসের কম প্রবাহ।",
        "সেটারে ইনকিউবেশনের সময় ডিম টার্নিং বন্ধ থাকা।",
        "অতিরিক্ত দীর্ঘদিন ডিম সংরক্ষণ।",
        "ট্রান্সফারের পূর্বে ডিমের ভুল ওজন হ্রাস (Weight loss)।",
        "নিম্নমানের, জীবাণুযুক্ত বা ফাটা ডিম।",
        "অত্যন্ত বড় আকারের ডিম বা বয়স্ক ব্রিডার ফ্ল্যাকের ডিম।"
      ],
      solutionsEn: [
        "Check hatcher temperature, humidity, airflow, and damper operation.",
        "Measure egg-weight loss and review setter humidity.",
        "Verify turning records and machine alarms.",
        "Review storage duration, egg sanitation, and breeder-flock age.",
        "Avoid overcrowding hatcher baskets."
      ],
      solutionsBn: [
        "হ্যাচার তাপমাত্রা, আর্দ্রতা, বাতাসের প্রবাহ ও ড্যাম্পার পরিচালনা মেপে দেখুন।",
        "ডিমের ওজন হ্রাস মেপে সেটার আর্দ্রতা সামঞ্জস্য করুন।",
        "টার্নিং রেকর্ড ও মেশিনের অ্যালার্ম হিস্ট্রি যাচাই করুন।",
        "সংরক্ষণের সময়কাল, ডিমের পরিচ্ছন্নতা ও ব্রিডার ফ্ল্যাকের বয়স পর্যালোচনা করুন।",
        "হ্যাচার বাস্কেটে অতিরিক্ত গাদাগাদি এড়িয়ে চলুন।"
      ],
      preventionEn: [
        "Maintain correct egg-weight loss and stable late-incubation conditions.",
        "Provide adequate ventilation throughout the hatch.",
        "Use clean, sound eggs and avoid excessive storage.",
        "Maintain correct turning until transfer."
      ],
      preventionBn: [
        "ডিমের সঠিক ওজন হ্রাস এবং শেষের দিকের ইনকিউবেশনে স্থিতিশীল অবস্থা বজায় রাখুন।",
        "পুরো হ্যাচিং চলাকালীন পর্যাপ্ত বায়ুসঞ্চালন নিশ্চিত করুন।",
        "পরিষ্কার, অক্ষত ডিম ব্যবহার করুন এবং অতিরিক্ত দীর্ঘদিন জমা রাখা এড়িয়ে চলুন।",
        "ট্রান্সফারের আগে পর্যন্ত সঠিক টার্নিং বজায় রাখুন।"
      ],
      imageUrl: "https://img.freepik.com/free-vector/cute-chicken-waving-hand-cartoon-vector-icon-illustration-animal-nature-icon-concept-isolated_138676-5086.jpg",
    ),

    // 12. Dry or Dehydrated Chicks
    HatcheryTroubleItem(
      id: "dry_dehydrated_chicks",
      titleEn: "Dry or Dehydrated Chicks",
      titleBn: "শুকনো বা ডিহাইড্রেটেড বাচ্চা (Dehydrated Chicks)",
      descriptionEn:
          "Affected chicks appear small, thin, dry, noisy, with stiff shanks and tight skin due to excessive moisture loss post-hatch.",
      descriptionBn:
          "বাচ্চা আকারে ছোট, শুকনো, পাতলা, পায়ের চামড়া টানটান ও ভাঁজ হয়ে যায় এবং ফোটার পর অতিরিক্ত আর্দ্রতা হারিয়ে চেঁচামেচি করে।",
      causesEn: [
        "Chicks kept inside hatcher too long after hatching completes.",
        "Low relative humidity in setter or hatcher rooms.",
        "Excessive holding time in hot, dry chick holding rooms."
      ],
      causesBn: [
        "বাচ্চা ফোটার পর দীর্ঘক্ষণ গরম হ্যাচারে রেখে দেওয়া।",
        "সেটার বা হ্যাচার রুমে অতিরিক্ত কম আপেক্ষিক আর্দ্রতা।",
        "গরম ও শুষ্ক হোল্ডিং রুমে অতিরিক্ত সময় বাচ্চা আটকে রাখা।"
      ],
      solutionsEn: [
        "Pull chicks promptly when 95% are dry (avoid holding in hatcher).",
        "Maintain 50-55% RH in setter and 60-65% RH in hatcher.",
        "Keep chick holding room at 23-25°C and 65% RH with good airflow."
      ],
      solutionsBn: [
        "৯৫% বাচ্চা শুকানোর সাথে সাথে হ্যাচার থেকে টেক-অফ করুন।",
        "সেটারে ৫০–৫৫% এবং হ্যাচারে ৬০–৬৫% আপেক্ষিক আর্দ্রতা রাখুন।",
        "চিলড্রেন/হোল্ডিং রুমের তাপমাত্রা ২৩–২৫°সে এবং আর্দ্রতা ৬৫% রাখুন।"
      ],
      imageUrl: "https://img.freepik.com/free-vector/cute-hen-sitting-nest-cartoon-vector-icon-illustration_138676-5838.jpg",
    ),

    // 13. Unhealed Navels
    HatcheryTroubleItem(
      id: "unhealed_navels",
      titleEn: "Unhealed Navels",
      titleBn: "অসম্পূর্ণ বা কাঁচা নাভি (Unhealed Navels)",
      descriptionEn:
          "The navel opening is not completely closed or healed at chick pull. It may be moist, open, or associated with a small scab.",
      descriptionBn:
          "বাচ্চা টেক-অফের সময় নাভির ছিদ্র সম্পূর্ণ বন্ধ বা শুষ্ক হয় না। এটি ভিজা, খোলা বা ছোট ক্ষতের মতো ছালের (Scab) সাথে যুক্ত থাকতে পারে।",
      causesEn: [
        "Low incubation temperature causing delayed development.",
        "High humidity or insufficient egg-weight loss.",
        "Late hatch or wide hatch window.",
        "Poor hatcher ventilation.",
        "Incorrect transfer timing.",
        "Contamination of eggs, trays, baskets, or hatchers.",
        "Large residual yolk or incomplete yolk-sac retraction."
      ],
      causesBn: [
        "কম ইনকিউবেশন তাপমাত্রা যার ফলে শারীরিক বিকাশ বিলম্বিত হয়।",
        "উচ্চ আর্দ্রতা বা অপ্রতুল ডিমের ওজন হ্রাস।",
        "বিলম্বিত হ্যাচিং বা দীর্ঘ হ্যাচ উইন্ডো।",
        "হ্যাচারের নিম্নমানের বায়ুসঞ্চালন।",
        "ভুল সময়ে হ্যাচারে ডিম ট্রান্সফার।",
        "ডিম, ট্রে, বাস্কেট বা হ্যাচার মেশিনের জীবাণু দূষণ।",
        "বড় অবশিষ্টাংশ কুসুম বা অসম্পূর্ণ কুসুম থলি পেটের ভেতরে যাওয়া।"
      ],
      solutionsEn: [
        "Check setter and hatcher temperature profiles.",
        "Review egg-weight loss, humidity, and transfer time.",
        "Improve hatcher ventilation and sanitation.",
        "Separate and assess chicks with open, wet, or infected navels.",
        "Investigate bacterial contamination when navel problems are accompanied by mortality or odor."
      ],
      solutionsBn: [
        "সেটার ও হ্যাচারের তাপমাত্রা প্রোফাইল পরীক্ষা করুন।",
        "ডিমের ওজন হ্রাস, আর্দ্রতা এবং ট্রান্সফারের সময় পর্যালোচনা করুন।",
        "হ্যাচারের বায়ুসঞ্চালন ও স্যানিটেশন ব্যবস্থার উন্নয়ন করুন।",
        "খোলা, ভিজা বা সংক্রামিত নাভিযুক্ত বাচ্চা আলাদা করুন এবং মূল্যায়ন করুন।",
        "নাভির সমস্যার সাথে বাচ্চার মৃত্যু বা দুর্গন্ধ থাকলে ব্যাকটেরিয়া সংক্রমণ তদন্ত করুন।"
      ],
      preventionEn: [
        "Maintain correct incubation temperature and moisture loss.",
        "Transfer at the correct stage and maintain clean hatcher baskets.",
        "Apply strict hatchery cleaning, disinfection, and chick-quality monitoring."
      ],
      preventionBn: [
        "সঠিক ইনকিউবেশন তাপমাত্রা এবং পানির ওজন হ্রাস বজায় রাখুন।",
        "সঠিক প্রজনন ধাপে ট্রান্সফার করুন এবং পরিষ্কার হ্যাচার বাস্কেট বজায় রাখুন।",
        "হ্যাচারিতে কঠোর পরিচ্ছন্নতা, জীবাণুমুক্তকরণ এবং বাচ্চার মান মনিটর পরিচালনা করুন।"
      ],
      imageUrl: "https://img.freepik.com/free-vector/cute-chicken-cartoon-vector-icon-illustration_138676-2070.jpg",
    ),

    // 14. Protruding or Button Navels
    HatcheryTroubleItem(
      id: "protruding_button_navels",
      titleEn: "Protruding or Button Navels",
      titleBn: "বাইরে বের হওয়া নাভি বা বাটন নাভি (Button Navels)",
      descriptionEn:
          "A protruding navel or dark navel button occurs when the navel does not close smoothly and a small tissue or scab remains outside the abdominal wall.",
      descriptionBn:
          "নাভি মসৃণভাবে বন্ধ না হলে এবং পেটের দেয়ালের বাইরে ছোট টিস্যু বা মেমব্রেনের ছাল (Scab) থেকে গেলে বাইরে বের হওয়া নাভি বা কালো নাভির বোতাম (Navel Button) তৈরি হয়।",
      causesEn: [
        "High setter temperature, especially during late incubation.",
        "Temperature fluctuation.",
        "Excessive hatcher humidity or inadequate moisture loss.",
        "Poor ventilation and excessive carbon dioxide.",
        "Incorrect transfer time.",
        "Contamination and inflammation of the navel area."
      ],
      causesBn: [
        "সেটারের উচ্চ তাপমাত্রা, বিশেষ করে ইনকিউবেশনের শেষ পর্যায়ে।",
        "তাপমাত্রার দ্রুত উঠানামা বা তারতম্য।",
        "হ্যাচারের অতিরিক্ত আর্দ্রতা বা অপ্রতুল পানির ওজন হ্রাস।",
        "নিম্নমানের বায়ুসঞ্চালন এবং বাতাসে অতিরিক্ত কার্বন ডাই অক্সাইড।",
        "ভুল সময়ে হ্যাচারে ট্রান্সফার করা।",
        "নাভি অঞ্চলে জীবাণু সংক্রমণ ও প্রদাহ।"
      ],
      solutionsEn: [
        "Check late-stage embryo temperature and machine calibration.",
        "Review egg-weight loss and hatcher humidity.",
        "Improve ventilation and sanitation.",
        "Grade out chicks with severe, wet, open, or infected navels.",
        "Culture affected chicks when omphalitis is suspected."
      ],
      solutionsBn: [
        "শেষ ধাপে ভ্রূণের তাপমাত্রা এবং মেশিনের ক্যালিব্রেশন পরীক্ষা করুন।",
        "ডিমের ওজন হ্রাস এবং হ্যাচারের আর্দ্রতা পর্যালোচনা করুন।",
        "বায়ুসঞ্চালন এবং পরিচ্ছন্নতা ব্যবস্থার উন্নয়ন করুন।",
        "গুরুতর, ভিজা, খোলা বা সংক্রামিত নাভিযুক্ত বাচ্চা গ্রেড করে বাদ দিন।",
        "আমফ্যালাইটিস (Omphalitis / নাভি প্রদাহ) সন্দেহ হলে আক্রান্ত বাচ্চার নমুনা কালচার টেস্ট করুন।"
      ],
      preventionEn: [
        "Avoid high embryo temperature during the final days of incubation.",
        "Maintain correct humidity, ventilation, and transfer timing.",
        "Keep hatcher baskets and chick-processing areas hygienic."
      ],
      preventionBn: [
        "ইনকিউবেশনের শেষ দিনগুলোতে ভ্রূণের উচ্চ তাপমাত্রা এড়িয়ে চলুন।",
        "সঠিক আর্দ্রতা, বায়ুসঞ্চালন এবং ট্রান্সফার সময় বজায় রাখুন।",
        "হ্যাচার বাস্কেট এবং বাচ্চা প্রসেসিং এলাকা সবসময় হাইজিনিক ও জীবাণুমুক্ত রাখুন।"
      ],
      imageUrl: "https://img.freepik.com/free-vector/cute-chick-hatching-from-egg-cartoon-vector-icon-illustration-animal-nature-icon-concept-isolated_138676-5085.jpg",
    ),

    // 15. Chicks Too Small
    HatcheryTroubleItem(
      id: "chicks_too_small",
      titleEn: "Chicks Too Small",
      titleBn: "অতিরিক্ত ছোট আকারের বাচ্চা (Chicks Too Small)",
      descriptionEn:
          "Chicks are smaller or lighter than expected for the egg size and breeder age, lacking body mass and vigor.",
      descriptionBn:
          "ডিমের আকার বা ব্রিডারের বয়স অনুযায়ী বাচ্চা প্রয়োজনের তুলনায় অতিরিক্ত ছোট বা কম ওজনের হয়।",
      causesEn: [
        "Small hatching eggs set (<52g initial egg weight).",
        "Low humidity during incubation causing excessive weight loss (>14%).",
        "High setter temperature causing fast yolk depletion."
      ],
      causesBn: [
        "ছোট আকারের ডিম সেটিং দেওয়া (<৫২ গ্রাম প্রাথমিক ওজন)।",
        "ইনকিউবেশনে অতিরিক্ত কম আর্দ্রতা যার ফলে অতিরিক্ত পানি শুকিয়ে যাওয়া (>১৪%)।",
        "উচ্চ সেটার তাপমাত্রা যা কুসুম দ্রত শেষ করে ফেলে।"
      ],
      solutionsEn: [
        "Set standard hatching eggs (>52g for broilers, >50g for layers).",
        "Adjust setter humidity to achieve target 11-12% moisture loss.",
        "Avoid setter overheating above 37.8°C."
      ],
      solutionsBn: [
        "সঠিক ওজনের ডিম সেটিং দিন (ব্রয়লারের জন্য >৫২g)।",
        "১১–১২% কাঙ্ক্ষিত ওজন হ্রাসের জন্য সেটার আর্দ্রতা সামঞ্জস্য করুন।",
        "সেটার ৩৭.৮°সে এর উপরে অতিরিক্ত গরম হওয়া রোধ করুন।"
      ],
      imageUrl: "https://img.freepik.com/free-vector/cute-chick-standing-egg-cartoon-vector-icon-illustration-animal-nature-icon-concept-isolated_138676-5087.jpg",
    ),

    // 16. Large and Flabby Chicks (Poor Reflex)
    HatcheryTroubleItem(
      id: "large_flabby_chicks",
      titleEn: "Large and Flabby Chicks (Poor Reflex)",
      titleBn: "মোটা, ফুলা ও অলস বাচ্চা (Flabby Chicks / Poor Reflex)",
      descriptionEn:
          "Chicks appear large, soft, weak, slow to stand, and may have a large abdomen, poor reflex, or incomplete yolk absorption.",
      descriptionBn:
          "বাচ্চাগুলোকে দেখতে বড়, নরম, দুর্বল ও দাঁড়াতে ধীরগতির মনে হয় এবং এদের পেট বড় হওয়া, দুর্বল রিফ্লেক্স (উপুড় হয়ে থাকলে চিত হতে না পারা) বা অসম্পূর্ণ কুসুম শোষণ দেখা যেতে পারে।",
      causesEn: [
        "Low setter or hatcher temperature.",
        "High setter humidity and insufficient egg-weight loss.",
        "Poor hatcher ventilation.",
        "Late hatch or delayed development.",
        "Omphalitis or yolk-sac infection.",
        "Large eggs or eggs from older breeder flocks.",
        "Incorrect transfer timing or prolonged egg storage."
      ],
      causesBn: [
        "সেটার বা হ্যাচারের কম তাপমাত্রা।",
        "সেটারের অতিরিক্ত উচ্চ আর্দ্রতা এবং অপ্রতুল ডিমের ওজন হ্রাস (Weight loss)।",
        "হ্যাচারের নিম্নমানের বায়ুসঞ্চালন।",
        "বিলম্বিত হ্যাচিং বা ধীরগতির বিকাশ।",
        "আমফ্যালাইটিস (Omphalitis) বা কুসুম-থলির সংক্রমণ (Yolk-sac infection)।",
        "বড় আকারের ডিম বা বয়স্ক ব্রিডার ফ্ল্যাকের ডিম।",
        "ভুল সময়ে হ্যাচারে ডিম ট্রান্সফার বা দীর্ঘদিন ডিম সংরক্ষণ।"
      ],
      solutionsEn: [
        "Verify temperature profiles and machine calibration.",
        "Measure egg-weight loss and chick yield.",
        "Improve hatcher ventilation and sanitation.",
        "Examine navels and yolk sacs for infection.",
        "Review egg size, storage duration, and hatch timing."
      ],
      solutionsBn: [
        "তাপমাত্রা প্রোফাইল এবং মেশিনের ক্যালিব্রেশন যাচাই করুন।",
        "ডিমের ওজন হ্রাস এবং চিক ইল্ড (Chick yield) পরিমাপ করুন।",
        "হ্যাচারের বায়ুসঞ্চালন এবং পরিচ্ছন্নতা ব্যবস্থার উন্নয়ন করুন।",
        "সংক্রমণের জন্য নাভি ও কুসুম-থলি সাবধানে পরীক্ষা করুন।",
        "ডিমের আকার, সংরক্ষণের সময়কাল এবং হ্যাচ টাইমিং পর্যালোচনা করুন।"
      ],
      preventionEn: [
        "Maintain correct incubation temperature and moisture loss.",
        "Use strict sanitation and contamination-control procedures.",
        "Monitor chick reflex, navel quality, chick yield, and hatch window."
      ],
      preventionBn: [
        "সঠিক ইনকিউবেশন তাপমাত্রা এবং পানির ওজন হ্রাস বজায় রাখুন।",
        "কঠোর স্যানিটেশন এবং জীবাণু দূষণ নিয়ন্ত্রণ পদ্ধতি ব্যবহার করুন।",
        "বাচ্চার রিফ্লেক্স, নাভির গুণমান, চিক ইল্ড এবং হ্যাচ উইন্ডো মনিটর করুন।"
      ],
      imageUrl: "https://img.freepik.com/free-vector/cute-baby-chick-cartoon-icon-illustration_138676-2826.jpg",
    ),

    // 17. Weak Chicks
    HatcheryTroubleItem(
      id: "weak_chicks",
      titleEn: "Weak Chicks",
      titleBn: "দুর্বল ও নিষ্ক্রিয় বাচ্চা (Weak Chicks)",
      descriptionEn:
          "Weak chicks are inactive, slow to stand, have poor reflexes, or fail to respond normally during chick-quality assessment.",
      descriptionBn:
          "দুর্বল বাচ্চাগুলো অলস বা নিষ্ক্রিয় থাকে, খাড়া হয়ে দাঁড়াতে বিলম্ব করে, এদের রিফ্লেক্স দুর্বল থাকে অথবা বাচ্চা মূল্যায়নের সময় স্বাভাবিক সাড়াদানে ব্যর্থ হয়।",
      causesEn: [
        "High or low incubation temperature.",
        "Inadequate hatcher ventilation or excessive carbon dioxide.",
        "Incorrect humidity or abnormal egg-weight loss.",
        "Prolonged egg storage.",
        "Breeder nutritional deficiency or disease.",
        "Bacterial or fungal contamination.",
        "Early hatch, dehydration, or delayed chick pull.",
        "Rough chick handling or poor transport conditions."
      ],
      causesBn: [
        "উচ্চ বা কম ইনকিউবেশন তাপমাত্রা।",
        "হ্যাচারের অপ্রতুল বায়ুসঞ্চালন বা বাতাসে অতিরিক্ত কার্বন ডাই অক্সাইড।",
        "ভুল আর্দ্রতা বা অস্বাভাবিক ডিমের ওজন হ্রাস (Weight loss)।",
        "অতিরিক্ত দীর্ঘদিন ধরে ডিম সংরক্ষণ।",
        "ব্রিডারের পুষ্টির ঘাটতি বা রোগব্যাধি।",
        "ব্যাকটেরিয়া বা ছত্রাকজনিত (Fungal) সংক্রমণ।",
        "সময়ের আগেই ফোটা, পানিশূন্যতা বা বাচ্চা টেক-অফে বিলম্ব।",
        "অসাবধানতার সাথে বাচ্চা নাড়াচাড়া বা নিম্নমানের পরিবহন পরিবেশ।"
      ],
      solutionsEn: [
        "Check chick temperature, hatch timing, and chick yield.",
        "Review setter and hatcher temperature, humidity, and ventilation.",
        "Examine navels, yolk sacs, and signs of contamination.",
        "Review breeder health, nutrition, and egg-storage age.",
        "Correct holding-room and transport conditions."
      ],
      solutionsBn: [
        "বাচ্চার তাপমাত্রা, হ্যাচ টাইমিং এবং চিক ইল্ড (Chick yield) পরীক্ষা করুন।",
        "সেটার ও হ্যাচারের তাপমাত্রা, আর্দ্রতা এবং বায়ুসঞ্চালন পর্যালোচনা করুন।",
        "নাভি, কুসুম-থলি এবং সংক্রমণের লক্ষণ সাবধানে পরীক্ষা করুন।",
        "ব্রিডারের স্বাস্থ্য, পুষ্টি এবং ডিম সংরক্ষণের বয়স পর্যালোচনা করুন।",
        "হোল্ডিং রুম ও পরিবহন যানবাহনের পরিবেশগত অবস্থা সংশোধন করুন।"
      ],
      preventionEn: [
        "Maintain stable incubation and chick-handling conditions.",
        "Use sound breeder health, nutrition, and biosecurity programs.",
        "Monitor chick-quality scores for every hatch."
      ],
      preventionBn: [
        "স্থিতিশীল ইনকিউবেশন এবং বাচ্চার যত্ন সহকারে পরিচালনা বজায় রাখুন।",
        "উন্নত ব্রিডার স্বাস্থ্য, সঠিক পুষ্টি এবং জৈবনিরাপত্তা (Biosecurity) কর্মসূচি ব্যবহার করুন।",
        "প্রতিটি হ্যাচের জন্য বাচ্চার মান সূচক (Chick quality scores) মনিটর করুন।"
      ],
      imageUrl: "https://img.freepik.com/free-vector/cute-chick-sitting-nest-cartoon-icon-illustration_138676-2828.jpg",
    ),

    // 18. Crossed Beak
    HatcheryTroubleItem(
      id: "crossed_beak",
      titleEn: "Crossed Beak",
      titleBn: "আঁকাবাঁকা বা ক্রস ঠোঁট (Crossed Beak)",
      descriptionEn:
          "The upper and lower beak are not correctly aligned. The defect may interfere with eating and drinking when severe.",
      descriptionBn:
          "উপরের ও নিচের ঠোঁট সঠিকভাবে সারিবদ্ধ থাকে না। ত্রুটিটি গুরুতর হলে বাচ্চার খাবার ও পানি গ্রহণে ব্যাঘাত ঘটাতে পারে।",
      causesEn: [
        "Genetic or hereditary predisposition.",
        "Developmental abnormality during incubation.",
        "Nutritional imbalance in the breeder flock.",
        "Viral disease or other breeder-flock health problems.",
        "Incorrect incubation temperature in some cases."
      ],
      causesBn: [
        "বংশগত বা জেনেটিক প্রবণতা।",
        "ইনকিউবেশন চলাকালীন ভ্রূণের শারীরিক গঠনগত অস্বাভাবিকতা।",
        "ব্রিডার ফ্ল্যাকে পুষ্টির ভারসাম্যহীনতা।",
        "ভাইরাসজনিত ব্যাধি বা অন্যান্য ব্রিডার ফ্ল্যাকের স্বাস্থ্য সমস্যা।",
        "কিছু ক্ষেত্রে ভুল ইনকিউবেশন তাপমাত্রা।"
      ],
      solutionsEn: [
        "Record the incidence by breeder flock, male line, and hatch date.",
        "Review breeder nutrition and flock health.",
        "Check incubation-temperature records.",
        "Do not keep severely affected birds for breeding."
      ],
      solutionsBn: [
        "ব্রিডার ফ্ল্যাক, মেল লাইন এবং হ্যাচের তারিখ অনুযায়ী আক্রান্তের হার রেকর্ড করুন।",
        "ব্রিডারের পুষ্টি এবং ফ্ল্যাকের স্বাস্থ্য পর্যালোচনা করুন।",
        "ইনকিউবেশন তাপমাত্রার রেকর্ডগুলো পরীক্ষা করুন।",
        "গুরুতরভাবে আক্রান্ত পাখিগুলোকে প্রজননের (Breeding) জন্য রাখবেন না।"
      ],
      preventionEn: [
        "Avoid breeding from affected families or recurrent problem flocks.",
        "Maintain balanced breeder nutrition and stable incubation conditions.",
        "Investigate sudden increases for disease or incubation problems."
      ],
      preventionBn: [
        "আক্রান্ত পরিবার বা পুনরাবৃত্তি হওয়া সমস্যাযুক্ত ফ্ল্যাক থেকে বংশবৃদ্ধি এড়িয়ে চলুন।",
        "ব্রিডারের সুষম পুষ্টি এবং স্থিতিশীল ইনকিউবেশন অবস্থা বজায় রাখুন।",
        "আকস্মিক বৃদ্ধি ঘটলে রোগ বা ইনকিউবেশনজনিত সমস্যা নিয়ে তদন্ত করুন।"
      ],
      imageUrl: "https://img.freepik.com/free-vector/cute-chicken-waving-hand-cartoon-vector-icon-illustration-animal-nature-icon-concept-isolated_138676-5086.jpg",
    ),

    // 19. Missing Eye or Eye Abnormality
    HatcheryTroubleItem(
      id: "missing_eye_abnormality",
      titleEn: "Missing Eye or Eye Abnormality",
      titleBn: "চোখ না থাকা বা চোখের বিকৃতি (Missing Eye)",
      descriptionEn:
          "One or both eyes may be absent, poorly developed, closed, or visibly abnormal at hatch.",
      descriptionBn:
          "বাচ্চা ফোটার পর এক বা একাধিক চোখ অনুপস্থিত থাকতে পারে, অপূর্ণাঙ্গ গঠিত হতে পারে, চোখ বন্ধ থাকতে পারে অথবা স্পষ্টতই অস্বাভাবিক দেখাবে।",
      causesEn: [
        "Excessive temperature during very early setter incubation.",
        "Rough egg handling, impact, or vibration.",
        "Genetic or developmental abnormality.",
        "Breeder nutritional deficiency or disease.",
        "Chemical or toxic exposure in rare cases."
      ],
      causesBn: [
        "সেটারে প্রারম্ভিক ইনকিউবেশনের সময়ে অতিরিক্ত উচ্চ তাপমাত্রা।",
        "অসাবধানতার সাথে ডিম নাড়াচাড়া, আঘাত বা ঝাঁকুনি।",
        "বংশগত বা বিকাশজনিত শারীরিক অস্বাভাবিকতা।",
        "ব্রিডারের পুষ্টির ঘাটতি বা রোগব্যাধি।",
        "বিরল ক্ষেত্রে রাসায়নিক বা বিষাক্ত পদার্থের প্রকাশ (Exposure)।"
      ],
      solutionsEn: [
        "Review first-week incubation temperature records.",
        "Check egg handling, transport, and loading procedures.",
        "Record incidence by breeder flock and parent line.",
        "Review breeder nutrition and health when incidence increases.",
        "Do not retain affected birds for breeding."
      ],
      solutionsBn: [
        "প্রথম সপ্তাহের ইনকিউবেশন তাপমাত্রার রেকর্ডগুলো পর্যালোচনা করুন।",
        "ডিম বহন, পরিবহন এবং মেশিনে সেটিং লোডিং পদ্ধতি পরীক্ষা করুন।",
        "ব্রিডার ফ্ল্যাক এবং প্যারেন্ট লাইন অনুযায়ী আক্রান্তের হার রেকর্ড করুন।",
        "আক্রান্তের হার বৃদ্ধি পেলে ব্রিডারের পুষ্টি এবং স্বাস্থ্য পরীক্ষা করুন।",
        "আক্রান্ত পাখিগুলোকে প্রজননের (Breeding) জন্য রাখবেন না।"
      ],
      preventionEn: [
        "Prevent overheating during early incubation.",
        "Handle and transport eggs gently.",
        "Maintain breeder health and balanced nutrition."
      ],
      preventionBn: [
        "প্রারম্ভিক ইনকিউবেশনে ওভার-হিটিং বা অতিরিক্ত গরম হওয়া রোধ করুন।",
        "ডিম সাবধানে যত্নসহকারে বহন ও পরিবহন করুন।",
        "ব্রিডারের স্বাস্থ্য এবং সুষম পুষ্টি বজায় রাখুন।"
      ],
      imageUrl: "https://img.freepik.com/free-vector/cute-chick-wearing-egg-shell-hat-cartoon-icon-illustration_138676-2829.jpg",
    ),

    // 20. Twisted Neck or Stargazing
    HatcheryTroubleItem(
      id: "twisted_neck_stargazing",
      titleEn: "Twisted Neck or Stargazing",
      titleBn: "ঘাড় বাঁকা বা স্টারগেজিং (Twisted Neck / Stargazing)",
      descriptionEn:
          "The chick holds its head or neck in an abnormal position, sometimes looking upward or backward.",
      descriptionBn:
          "বাচ্চাটি তার মাথা বা ঘাড় অস্বাভাবিক ভঙ্গিমায় ধরে রাখে, কখনো কখনো উপরের দিকে (স্টারগেজিং) অথবা পিছনের দিকে তাকিয়ে থাকে।",
      causesEn: [
        "Breeder nutritional deficiency or imbalance, including vitamin-related problems.",
        "Incorrect incubation temperature.",
        "Developmental abnormality or malposition.",
        "Genetic predisposition.",
        "Infection, toxicity, or neurological disease in some cases."
      ],
      causesBn: [
        "ভিটামিন-সংক্রান্ত সমস্যা সহ ব্রিডারের পুষ্টির ঘাটতি বা ভারসাম্যহীনতা।",
        "ভুল ইনকিউবেশন তাপমাত্রা।",
        "শারীরিক বিকাশজনিত অস্বাভাবিকতা বা ভুল অবস্থান (Malposition)।",
        "বংশগত বা জেনেটিক প্রবণতা।",
        "কিছু ক্ষেত্রে জীবাণু সংক্রমণ, বিষাক্ততা বা স্নায়ুবিক রোগ (Neurological disease)।"
      ],
      solutionsEn: [
        "Record incidence by flock and hatch.",
        "Review breeder vitamin and mineral specification with a nutritionist.",
        "Check incubation-temperature uniformity.",
        "Submit affected chicks for veterinary examination when incidence is significant.",
        "Do not retain affected birds for breeding."
      ],
      solutionsBn: [
        "ফ্ল্যাক এবং হ্যাচ তারিখ অনুযায়ী আক্রান্তের হার রেকর্ড করুন।",
        "পোল্ট্রি পুষ্টিবিদের পরামর্শে ব্রিডারের ভিটামিন ও মিনারেল মাত্রা পর্যালোচনা করুন।",
        "ইনকিউবেশন তাপমাত্রার সমতা পরীক্ষা করুন।",
        "আক্রান্তের হার লক্ষণীয় হলে ক্ষতিগ্রস্ত বাচ্চাগুলোকে ভেটেরিনারি পরীক্ষার জন্য পাঠান।",
        "আক্রান্ত পাখিগুলোকে প্রজননের (Breeding) জন্য রাখবেন না।"
      ],
      preventionEn: [
        "Maintain balanced breeder nutrition and good feed quality.",
        "Maintain stable, uniform incubation temperature.",
        "Monitor breeder disease and toxin exposure."
      ],
      preventionBn: [
        "ব্রিডারের সুষম পুষ্টি এবং খাবারের উচ্চ গুণমান বজায় রাখুন।",
        "স্থিতিশীল ও সমতাপূর্ণ ইনকিউবেশন তাপমাত্রা বজায় রাখুন।",
        "ব্রিডারের রোগব্যাধি এবং টক্সিন বা বিষাক্ততার সংস্পর্শে আসা মনিটর করুন।"
      ],
      imageUrl: "https://img.freepik.com/free-vector/cute-rooster-crowing-cartoon-vector-icon-illustration_138676-5839.jpg",
    ),

    // 21. Crooked Toes
    HatcheryTroubleItem(
      id: "crooked_toes",
      titleEn: "Crooked Toes",
      titleBn: "বাঁকা আঙুল বা ক্রুকড টোজ (Crooked Toes)",
      descriptionEn:
          "One or more toes are bent, curled, or incorrectly positioned at hatch.",
      descriptionBn:
          "বাচ্চা ফোটার সময় পায়ের এক বা একাধিক আঙুল বাঁকা, কোঁকড়ানো বা ভুল অবস্থানে সারিবদ্ধ থাকে।",
      causesEn: [
        "Incorrect temperature during the last days in the setter or in the hatcher.",
        "Breeder nutritional deficiency or imbalance, especially vitamin-related problems.",
        "Genetic or developmental abnormality.",
        "Improper chick holding conditions or dehydration.",
        "Slippery surfaces after hatch may worsen the condition."
      ],
      causesBn: [
        "সেটারে শেষের দিনগুলোতে বা হ্যাচারে ভুল ইনকিউবেশন তাপমাত্রা।",
        "ব্রিডারের পুষ্টির ঘাটতি বা ভারসাম্যহীনতা, বিশেষ করে ভিটামিন-সংক্রান্ত সমস্যা।",
        "বংশগত বা শারীরিক গঠনগত অস্বাভাবিকতা।",
        "বাচ্চার অনুপযুক্ত হোল্ডিং পরিবেশ বা পানিশূন্যতা।",
        "ফোটার পর পিচ্ছিল মেঝে বা সারফেস অবস্থার অবনতি ঘটাতে পারে।"
      ],
      solutionsEn: [
        "Review late-incubation and hatcher temperature records.",
        "Check breeder nutrition and feed quality.",
        "Provide dry, non-slip surfaces during chick processing and brooding.",
        "Record incidence by breeder flock and machine.",
        "Do not keep severely affected birds for breeding."
      ],
      solutionsBn: [
        "ইনকিউবেশনের শেষ পর্যায় এবং হ্যাচারের তাপমাত্রার রেকর্ড পর্যালোচনা করুন।",
        "ব্রিডারের পুষ্টি এবং ফিডের মান পরীক্ষা করুন।",
        "বাচ্চা প্রসেসিং এবং ব্রুডিংয়ের সময় শুকনো ও না-পিচ্ছিল (Non-slip) সারফেস প্রদান করুন।",
        "ব্রিডার ফ্ল্যাক এবং মেশিন অনুযায়ী আক্রান্তের হার রেকর্ড করুন।",
        "গুরুতরভাবে আক্রান্ত পাখিগুলোকে প্রজননের (Breeding) জন্য রাখবেন না।"
      ],
      preventionEn: [
        "Maintain correct late-incubation temperature.",
        "Provide balanced breeder nutrition.",
        "Use non-slip chick-box and brooding surfaces."
      ],
      preventionBn: [
        "ইনকিউবেশনের শেষ পর্যায়ে সঠিক তাপমাত্রা বজায় রাখুন।",
        "ব্রিডারকে সুষম পুষ্টি প্রদান নিশ্চিত করুন।",
        "বাচ্চার বক্সে এবং ব্রুডিং এলাকায় অ্যান্টি-স্লিপ বা খসখসে ম্যাট/সারফেস ব্যবহার করুন।"
      ],
      imageUrl: "https://img.freepik.com/free-vector/cute-chick-hatching-egg-cartoon-vector-icon-illustration_138676-2082.jpg",
    ),

    // 22. Spraddled Legs
    HatcheryTroubleItem(
      id: "spraddled_legs",
      titleEn: "Spraddled Legs",
      titleBn: "পা ছড়ানো বা স্প্রেডলড লেগস (Spraddled Legs)",
      descriptionEn:
          "One or both legs extend sideways, preventing the chick from standing or walking normally.",
      descriptionBn:
          "এক বা উভয় পা দুই পাশে বিস্তৃত হয়ে ছড়িয়ে থাকে, যা বাচ্চাকে স্বাভাবিকভাবে দাঁড়াতে বা হাঁটতে বাধা দেয়।",
      causesEn: [
        "Smooth or slippery hatching trays, chick boxes, floors, or brooding paper.",
        "Rough handling or leg injury.",
        "Incorrect incubation temperature or humidity.",
        "Nutritional deficiency or poor skeletal development.",
        "Developmental or genetic abnormality."
      ],
      causesBn: [
        "হ্যাচিং ট্রে, বাচ্চার বক্স, মেঝে বা ব্রুডিং পেপার মসৃণ বা পিচ্ছিল হওয়া।",
        "অসাবধানতাহীন নাড়াচাড়া বা পায়ে আঘাত পাওয়া।",
        "ভুল ইনকিউবেশন তাপমাত্রা বা আর্দ্রতা।",
        "পুষ্টির ঘাটতি বা হাড়ের দুর্বল শারীরিক বিকাশ।",
        "শারীরিক বিকাশজনিত বা বংশগত (Genetic) ত্রুটি।"
      ],
      solutionsEn: [
        "Replace slippery tray, box, and floor surfaces with non-slip material.",
        "Review chick handling and conveyor systems.",
        "Check incubation conditions and breeder nutrition.",
        "Record incidence by hatch and equipment location.",
        "Do not keep severely affected birds for breeding."
      ],
      solutionsBn: [
        "পিচ্ছিল ট্রে, বক্স ও মেঝের উপরিভাগ অ্যান্টি-স্লিপ বা খসখসে উপাদান দিয়ে প্রতিস্থাপন করুন।",
        "বাচ্চা নাড়াচাড়া এবং কনভেয়র বেল্ট সিস্টেমগুলো পরীক্ষা করুন।",
        "ইনকিউবেশন পরিবেশগত অবস্থা এবং ব্রিডারের পুষ্টি পরীক্ষা করুন।",
        "হ্যাচ তারিখ ও সরঞ্জামের অবস্থান অনুযায়ী আক্রান্তের হার রেকর্ড করুন।",
        "গুরুতরভাবে আক্রান্ত পাখিগুলোকে প্রজননের (Breeding) জন্য রাখবেন না।"
      ],
      preventionEn: [
        "Use clean, dry, non-slip hatching and brooding surfaces.",
        "Handle chicks gently.",
        "Maintain balanced breeder nutrition and correct incubation conditions."
      ],
      preventionBn: [
        "পরিষ্কার, শুকনো এবং অ্যান্টি-স্লিপ হ্যাচিং ও ব্রুডিং ম্যাট/সারফেস ব্যবহার করুন।",
        "বাচ্চা খুব সাবধানে কোমলভাবে স্পর্শ ও নাড়াচাড়া করুন।",
        "ব্রিডারের সুষম পুষ্টি এবং সঠিক ইনকিউবেশন অবস্থা বজায় রাখুন।"
      ],
      imageUrl: "https://img.freepik.com/free-vector/cute-chick-breaking-egg-shell-cartoon-icon-illustration_138676-2830.jpg",
    ),

    // 23. Black Button Navel
    HatcheryTroubleItem(
      id: "black_button_navel",
      titleEn: "Black Button Navel",
      titleBn: "কালো বাটন নাভি (Black Button Navel)",
      descriptionEn:
          "A black button navel is a dry, dark, scab-like navel defect seen in day-old chicks. A small, dry, well-sealed button may have limited significance, but a large, raised, wet, open, inflamed, or foul-smelling navel indicates poor navel healing and increases the risk of yolk-sac infection and early chick mortality.",
      descriptionBn:
          "কালো বাটন নাভি হলো একদিনের বাচ্চার নাভিতে দেখা যাওয়া একটি শুকনো, কালো, মেমব্রেনের ছালের (Scab) মতো ত্রুটি। ছোট, শুকনো, ভালোভাবে বন্ধ হওয়া বোতামের তাৎপর্য সীমিত হতে পারে, কিন্তু বড়, উঁচু, ভিজা, খোলা, প্রদাহযুক্ত বা দুর্গন্ধযুক্ত নাভি দুর্বল নাভি নিরাময় নির্দেশ করে এবং কুসুম-থলি সংক্রমণ ও প্রারম্ভিক বাচ্চার মৃত্যুর ঝুঁকি বৃদ্ধি করে।",
      causesEn: [
        "Excessive embryo temperature during the final days of incubation.",
        "Incorrect or fluctuating setter and hatcher temperature.",
        "Excessive hatcher humidity or inadequate egg-weight loss.",
        "Poor ventilation or high carbon dioxide in the hatcher.",
        "Incorrect transfer time or delayed chick pull.",
        "Incomplete yolk-sac retraction and delayed navel closure.",
        "Contaminated hatching eggs, trays, baskets, hatchers, or chick-processing equipment.",
        "Poor egg-shell quality, dirty eggs, cracked eggs, or excessive floor eggs.",
        "Prolonged or improper egg storage.",
        "Breeder-flock disease, poor nutrition, or mycotoxin exposure.",
        "Bacterial contamination causing omphalitis or yolk-sac infection."
      ],
      causesBn: [
        "ইনকিউবেশনের শেষ দিনগুলোতে অতিরিক্ত ভ্রূণ তাপমাত্রা।",
        "সেটার ও হ্যাচারের ভুল বা উঠানামাকারী তাপমাত্রা।",
        "হ্যাচারের অতিরিক্ত আর্দ্রতা বা অপ্রতুল ডিমের ওজন হ্রাস (Weight loss)।",
        "হ্যাচারে নিম্নমানের বায়ুসঞ্চালন বা উচ্চ কার্বন ডাই অক্সাইড।",
        "ভুল ট্রান্সফার সময়কাল বা বাচ্চা টেক-অফে বিলম্ব।",
        "অসম্পূর্ণ কুসুম-থলি শোষণ এবং বিলম্বিত নাভি বন্ধ হওয়া।",
        "দূষিত হ্যাচিং ডিম, ট্রে, বাস্কেট, হ্যাচার বা বাচ্চা প্রসেসিং সরঞ্জাম।",
        "ডিমের নিম্নমানের খোসার মান, নোংরা ডিম, ফাটা ডিম বা অতিরিক্ত ফ্লোর ডিম।",
        "অতিরিক্ত দীর্ঘদিন বা অনুপযুক্ত উপায়ে ডিম সংরক্ষণ।",
        "ব্রিডার ফ্ল্যাকের রোগব্যাধি, নিম্নমানের পুষ্টি বা মাইকোটক্সিন বিষাক্ততা।",
        "আমফ্যালাইটিস (Omphalitis) বা কুসুম-থলি সংক্রমণকারী ব্যাকটেরিয়া দূষণ।"
      ],
      solutionsEn: [
        "Grade the defect by size, dryness, closure, swelling, redness, odor, and abdominal condition.",
        "Separate chicks with large, wet, open, swollen, inflamed, or foul-smelling navels.",
        "Check setter and hatcher temperature with calibrated instruments.",
        "Review egg-weight loss, humidity records, transfer time, hatch window, and chick pull time.",
        "Check hatcher ventilation, airflow, damper operation, and carbon-dioxide level.",
        "Review egg hygiene, floor-egg percentage, cracked eggs, sanitation, and disinfection procedures.",
        "Examine affected chicks for retained yolk, abnormal abdomen, dehydration, and omphalitis.",
        "Submit representative affected chicks and unhatched eggs for bacteriology when the incidence is high or early mortality increases.",
        "Record the percentage by breeder flock, machine, trolley, tray position, egg age, and hatch date."
      ],
      solutionsBn: [
        "আকার, শুষ্কতা, বন্ধ হওয়া, ফোলা ভাব, লালচে ভাব, দুর্গন্ধ ও পেটের অবস্থা অনুযায়ী ত্রুটির গ্রেডিং করুন।",
        "বড়, ভিজা, খোলা, ফোলা, প্রদাহযুক্ত বা দুর্গন্ধযুক্ত নাভিযুক্ত বাচ্চা আলাদা করুন।",
        "ক্যালিব্রেট করা যন্ত্র দিয়ে সেটার ও হ্যাচারের তাপমাত্রা মেপে দেখুন।",
        "ডিমের ওজন হ্রাস, আর্দ্রতার রেকর্ড, ট্রান্সফার সময়, হ্যাচ উইন্ডো ও টেক-অফ সময় পর্যালোচনা করুন।",
        "হ্যাচারের বায়ুসঞ্চালন, বাতাসের প্রবাহ, ড্যাম্পার পরিচালনা ও কার্বন ডাই অক্সাইডের মাত্রা পরীক্ষা করুন।",
        "ডিমের পরিচ্ছন্নতা, ফ্লোর ডিমের শতাংশ, ফাটা ডিম, স্যানিটেশন ও জীবাণুমুক্তকরণ পদ্ধতি পর্যালোচনা করুন।",
        "অবশিষ্টাংশ কুসুম, অস্বাভাবিক পেট, পানিশূন্যতা ও নাভি প্রদাহের জন্য আক্রান্ত বাচ্চা পরীক্ষা করুন।",
        "আক্রান্তের হার বেশি হলে বা প্রারম্ভিক মৃত্যু বাড়লে ব্যাকটেরিওলজি পরীক্ষার জন্য আক্রান্ত বাচ্চা ও অনফোটা ডিম জমা দিন।",
        "ব্রিডার ফ্ল্যাক, মেশিন, ট্রলি, ট্রে পজিশন, ডিমের বয়স ও হ্যাচের তারিখ অনুযায়ী শতাংশ রেকর্ড করুন।"
      ],
      preventionEn: [
        "Maintain correct and uniform embryo temperature throughout incubation.",
        "Control setter humidity according to actual egg-weight loss and air-cell development.",
        "Maintain adequate hatcher ventilation without unnecessary door opening.",
        "Transfer and pull chicks at the correct developmental stage.",
        "Use only clean, sound hatching eggs and minimize floor eggs.",
        "Apply strict cleaning and disinfection of trays, baskets, hatchers, chick rooms, and transport boxes.",
        "Maintain breeder-flock health, balanced nutrition, feed quality, and mycotoxin control.",
        "Monitor navel quality and first-seven-day mortality for every hatch.",
        "Key Points: Check setter & hatcher temp profile, egg-weight loss & air cell size, hatcher humidity/airflow/CO2, transfer & pull timing, egg hygiene & sanitation, navel closure & early mortality."
      ],
      preventionBn: [
        "পুরো ইনকিউবেশন জুড়ে সঠিক ও সমতাপূর্ণ ভ্রূণ তাপমাত্রা বজায় রাখুন।",
        "প্রকৃত ডিমের ওজন হ্রাস এবং এয়ার সেলের বৃদ্ধি অনুযায়ী সেটার আর্দ্রতা নিয়ন্ত্রণ করুন।",
        "অনাবশ্যক হ্যাচার দরজা না খুলে পর্যাপ্ত হ্যাচার বায়ুসঞ্চালন বজায় রাখুন।",
        "সঠিক শারীরিক বিকাশ পর্যায়ে ডিম ট্রান্সফার এবং বাচ্চা টেক-অফ করুন।",
        "শুধুমাত্র পরিষ্কার, অক্ষত হ্যাচিং ডিম ব্যবহার করুন এবং ফ্লোর ডিম সর্বনিম্ন রাখুন।",
        "ট্রে, বাস্কেট, হ্যাচার, বাচ্চা রুম এবং পরিবহন বক্সের কঠোর পরিচ্ছন্নতা ও জীবাণুমুক্তকরণ প্রয়োগ করুন।",
        "ব্রিডার ফ্ল্যাকের স্বাস্থ্য, সুষম পুষ্টি, খাবারের গুণমান এবং মাইকোটক্সিন নিয়ন্ত্রণ বজায় রাখুন।",
        "প্রতিটি হ্যাচের জন্য নাভির গুণমান এবং প্রথম ৭ দিনের মৃত্যুহার মনিটর করুন।",
        "বিশেষ দ্রষ্টব্য: সেটার-হ্যাচার তাপমাত্রা, ডিমের ওজন হ্রাস, আর্দ্রতা/CO2, ট্রান্সফার সময় ও নাভি নিরাময় নিয়মিত চেক করুন।"
      ],
      imageUrl: "https://img.freepik.com/free-vector/cute-rooster-holding-egg-cartoon-vector-icon-illustration-animal-nature-icon-concept-isolated_138676-5976.jpg",
    ),

    // 24. Head Above Right Wing
    HatcheryTroubleItem(
      id: "head_above_right_wing",
      titleEn: "Head Above Right Wing",
      titleBn: "ডান ডানার উপরে মাথা বা মেলপজিশন (Head Above Right Wing)",
      descriptionEn:
          "Normally, the embryo's head is positioned under the right wing before pipping. A head positioned above the right wing is a malposition that can prevent successful hatch.",
      descriptionBn:
          "স্বাভাবিক নিয়ম অনুযায়ী পিপিংয়ের পূর্বে ভ্রূণের মাথা ডান ডানার নিচে অবস্থিত থাকে। ডান ডানার উপরে মাথা থাকা হলো একটি ভুল অবস্থান (Malposition), যা সফল হ্যাচিংয়ে বাধা দিতে পারে।",
      causesEn: [
        "High setter temperature.",
        "Inadequate or incorrect turning.",
        "Eggs set in the wrong position.",
        "Abnormal air-cell position.",
        "Excessive egg storage or poor egg quality.",
        "Nutritional or developmental abnormality."
      ],
      causesBn: [
        "সেটারের অতিরিক্ত উচ্চ তাপমাত্রা।",
        "অপ্রতুল বা ভুল ডিম টার্নিং।",
        "ডিম ভুল অবস্থানে (যেমন সরু মাথা উপরে) সেটিং দেওয়া।",
        "অস্বাভাবিক এয়ার-সেল অবস্থান।",
        "অতিরিক্ত দীর্ঘদিন ডিম সংরক্ষণ বা ডিমের নিম্নমানের গুণগত মান।",
        "পুষ্টিগত বা শারীরিক বিকাশজনিত অস্বাভাবিকতা।"
      ],
      solutionsEn: [
        "Check setter temperature and temperature uniformity.",
        "Verify turning angle, frequency, and mechanical function.",
        "Confirm eggs are set large end upward.",
        "Review storage duration and air-cell condition.",
        "Record malposition percentage during hatch-residue breakout."
      ],
      solutionsBn: [
        "সেটার তাপমাত্রা এবং তাপমাত্রার সমতা পরীক্ষা করুন।",
        "টার্নিংয়ের কোণ, ফ্রিকোয়েন্সি ও যান্ত্রিক কার্যকারিতা যাচাই করুন।",
        "ডিমের মোটা মাথা (Broad end) সবসময় উপরে রেখে সেটিং দেওয়া নিশ্চিত করুন।",
        "সংরক্ষণের সময়কাল এবং এয়ার সেলের অবস্থা পর্যালোচনা করুন।",
        "হ্যাচ-রেসিডিউ ব্রেকআউট টেস্টের সময় ভুল অবস্থানের (Malposition) শতাংশ রেকর্ড করুন।"
      ],
      preventionEn: [
        "Maintain correct setter temperature and reliable turning.",
        "Set eggs in the correct orientation.",
        "Avoid prolonged storage and rough handling.",
        "Use routine breakout analysis to monitor malpositions."
      ],
      preventionBn: [
        "সেটারের সঠিক তাপমাত্রা এবং নির্ভরযোগ্য টার্নিং বজায় রাখুন।",
        "সঠিক অরিয়েন্টেশনে (দিকমুখী করে) ডিম সেটিং দিন।",
        "দীর্ঘদিন ডিম সংরক্ষণ এবং অসাবধানতাহীন নাড়াচাড়া এড়িয়ে চলুন।",
        "ভুল অবস্থান (Malposition) মনিটর করতে নিয়মিত ব্রেকআউট বিশ্লেষণ ব্যবহার করুন।"
      ],
      imageUrl: "https://img.freepik.com/free-vector/cute-rooster-holding-egg-cartoon-vector-icon-illustration-animal-nature-icon-concept-isolated_138676-5976.jpg",
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
          isEng ? "Hatchery Troubleshooting" : "হ্যাচারি ট্রাবলশুটিং",
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
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return _buildTroubleCard(context, item, isEng, isDark);
        },
      ),
    );
  }

  Widget _buildTroubleCard(
    BuildContext context,
    HatcheryTroubleItem item,
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
              builder: (_) => HatcheryTroubleshootingDetailScreen(
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
              // Circular Cartoon Image Thumbnail from Network
              Container(
                width: 76,
                height: 76,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isDark ? const Color(0xFF0F172A) : Colors.teal.shade50,
                  border: Border.all(
                    color: const Color(0xFF00838F).withValues(alpha: 0.4),
                    width: 2,
                  ),
                ),
                child: ClipOval(
                  child: Image.network(
                    item.imageUrl,
                    width: 76,
                    height: 76,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        color: Colors.teal.shade50,
                        child: const Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Color(0xFF00838F),
                          ),
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: Colors.teal.shade50,
                      child: const Icon(
                        Icons.egg_alt_rounded,
                        color: Color(0xFF00838F),
                        size: 38,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 14),

              // Title and Description
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isEng ? item.titleEn : item.titleBn,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: isDark ? Colors.white : const Color(0xFF0F172A),
                        height: 1.25,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      isEng ? "Description:" : "সংক্ষিপ্ত বিবরণঃ",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.grey.shade300 : const Color(0xFF334155),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      isEng ? item.descriptionEn : item.descriptionBn,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13,
                        height: 1.35,
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

class HatcheryTroubleshootingDetailScreen extends StatelessWidget {
  final HatcheryTroubleItem item;
  final bool isEnglish;

  const HatcheryTroubleshootingDetailScreen({
    super.key,
    required this.item,
    required this.isEnglish,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final title = isEnglish ? item.titleEn : item.titleBn;
    final description = isEnglish ? item.descriptionEn : item.descriptionBn;
    final causes = isEnglish ? item.causesEn : item.causesBn;
    final solutions = isEnglish ? item.solutionsEn : item.solutionsBn;
    final prevention = isEnglish ? item.preventionEn : item.preventionBn;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF121212) : const Color(0xFFF2F5F8),
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF00838F),
        elevation: 0.5,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Network Cartoon Image Card
            Card(
              elevation: 2,
              color: isDark ? const Color(0xFF1E293B) : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Row(
                  children: [
                    Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.teal.shade50,
                        border: Border.all(
                          color: const Color(0xFF00838F).withValues(alpha: 0.4),
                          width: 2,
                        ),
                      ),
                      child: ClipOval(
                        child: Image.network(
                          item.imageUrl,
                          width: 72,
                          height: 72,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Container(
                            color: Colors.teal.shade50,
                            child: const Icon(
                              Icons.egg_alt_rounded,
                              color: Color(0xFF00838F),
                              size: 36,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: isDark ? Colors.white : const Color(0xFF0F172A),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            isEnglish
                                ? "Hatchery Troubleshooting Guide"
                                : "হ্যাচারি ট্রাবলশুটিং নির্দেশিকা",
                            style: const TextStyle(
                              fontSize: 12.5,
                              color: Color(0xFF00838F),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 14),

            // Section 1: Overview & Description
            _buildDetailSectionCard(
              context: context,
              title: isEnglish ? "📌 Description & Overview" : "📌 বিবরণ ও ধারণা",
              isDark: isDark,
              child: Text(
                description,
                style: TextStyle(
                  fontSize: 14.5,
                  height: 1.45,
                  color: isDark ? Colors.grey.shade200 : const Color(0xFF1E293B),
                ),
              ),
            ),
            const SizedBox(height: 14),

            // Section 2: Probable Causes
            _buildDetailSectionCard(
              context: context,
              title: isEnglish ? "🔎 Probable Causes" : "🔎 সম্ভাব্য কারণসমূহ",
              isDark: isDark,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: causes
                    .map(
                      (cause) => Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("• ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.redAccent)),
                            Expanded(
                              child: Text(
                                cause,
                                style: TextStyle(
                                  fontSize: 14,
                                  height: 1.4,
                                  color: isDark
                                      ? Colors.grey.shade300
                                      : const Color(0xFF334155),
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
            const SizedBox(height: 14),

            // Section 3: Corrective Actions & Solutions
            _buildDetailSectionCard(
              context: context,
              title: isEnglish
                  ? "💡 Corrective Actions & Solutions"
                  : "💡 প্রতিকার ও সমাধান",
              isDark: isDark,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: solutions
                    .map(
                      (sol) => Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("✔ ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.teal)),
                            Expanded(
                              child: Text(
                                sol,
                                style: TextStyle(
                                  fontSize: 14,
                                  height: 1.4,
                                  color: isDark
                                      ? Colors.grey.shade300
                                      : const Color(0xFF334155),
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

            // Section 4: Prevention Measures
            if (prevention != null && prevention.isNotEmpty) ...[
              const SizedBox(height: 14),
              _buildDetailSectionCard(
                context: context,
                title: isEnglish
                    ? "🛡️ Prevention Measures"
                    : "🛡️ প্রতিষেধক ও প্রতিরোধমূলক ব্যবস্থা",
                isDark: isDark,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: prevention
                      .map(
                        (prev) => Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("🛡️ ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14)),
                              Expanded(
                                child: Text(
                                  prev,
                                  style: TextStyle(
                                    fontSize: 14,
                                    height: 1.4,
                                    color: isDark
                                        ? Colors.grey.shade300
                                        : const Color(0xFF334155),
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
            ],
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailSectionCard({
    required BuildContext context,
    required String title,
    required bool isDark,
    required Widget child,
  }) {
    return Card(
      elevation: 2,
      shadowColor: Colors.black.withValues(alpha: 0.08),
      color: isDark ? const Color(0xFF1E293B) : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: isDark ? Colors.tealAccent : const Color(0xFF00838F),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 1,
              color: isDark ? Colors.white12 : Colors.grey.shade200,
            ),
            const SizedBox(height: 12),
            child,
          ],
        ),
      ),
    );
  }
}
