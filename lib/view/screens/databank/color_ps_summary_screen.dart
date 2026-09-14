import 'package:flutter/material.dart';

class ColorPSArticleItem {
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

  const ColorPSArticleItem({
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

class ColorPSSummaryScreen extends StatelessWidget {
  final bool isEnglish;

  const ColorPSSummaryScreen({super.key, required this.isEnglish});

  static const List<ColorPSArticleItem> articles = [
    // 1. Technical Data, Sasso Color PS (SA51A)
    ColorPSArticleItem(
      id: "sasso_sa51a_technical_data",
      titleEn: "Technical Data, Sasso Color PS (SA51A)",
      titleBn: "সাসো কালার পিএস (SA51A) টেকনিক্যাল ডাটা",
      subtitleBn: "CHARACTERISTICS (SA51A)",
      subtitleEn: "CHARACTERISTICS (SA51A)",
      snippetBn: "1. Live weight at 20 weeks = 1440 g | 2. Live weight at 24 weeks = 1737 g...",
      snippetEn: "1. Live weight at 20 weeks = 1440 g | 2. Live weight at 24 weeks = 1737 g...",
      imagePath: "assets/ps_color.jpg",
      detailsEn: [
        "📌 CHARACTERISTICS (SA51A):\n1. Live weight at 20 weeks = 1440 g\n2. Live weight at 24 weeks = 1737 g\n3. Live weight at 66 weeks = 2184 g\n4. No. of eggs at 66 weeks = 247\n5. No. of hatching eggs at 66 weeks = 239",
        "📊 MORTALITY & FEED CONSUMPTION METRICS:\n6. Mortality rate 0-20 weeks = 2.5%\n7. Mortality rate 21-66 weeks = 5.5%\n8. Total consumption for 0-65 weeks = 45.8 kg\n9. Consumption per DOC 0-66 weeks = 217 g",
        "⚠️ EARLY BROODING FEEDING ADVICE (FIRST 21 DAYS):\nBe careful during the first 21 days, gradually increase the amount of feed distributed. Ration must always be a function of growth.\n\n👉 Sasso SA51A delivers robust growth, high egg numbers, and premium chick quality."
      ],
      detailsBn: [
        "📌 বৈশিষ্ট্য ও ওজন মানদণ্ড (SA51A)ঃ\n১. ২০ সপ্তাহে জীবন্ত ওজন = ১৪৪০ গ্রাম\n২. ২৪ সপ্তাহে জীবন্ত ওজন = ১৭৩৭ গ্রাম\n৩. ৬৬ সপ্তাহে জীবন্ত ওজন = ২১৮৪ গ্রাম\n৪. ৬৬ সপ্তাহে মোট ডিমের সংখ্যা = ২৪৭ টি\n৫. ৬৬ সপ্তাহে হ্যাচিং ডিমের সংখ্যা = ২৩৯ টি",
        "📊 মরটালিটি হার ও খাদ্য গ্রহণ মানদণ্ডঃ\n৬. ০-২০ সপ্তাহে মরটালিটি হার = ২.৫%\n৭. ২১-৬৬ সপ্তাহে মরটালিটি হার = ৫.৫%\n৮. ০-৬৫ সপ্তাহে মোট ফিড গ্রহণ = ৪৫.৮ কেজি\n৯. ০-৬৬ সপ্তাহে প্রতি ডিওসি বাচ্চার ফিড = ২১৭ গ্রাম",
        "⚠️ প্রথম ২১ দিনের ফিডিং পরামর্শঃ\nপ্রথম ২১ দিন বিশেষ সতর্কতা অবলম্বন করুন এবং ফিডের পরিমাণ ধীরে ধীরে বাড়ান। রেশনের পরিমাণ সবসময় দৈহিক বৃদ্ধির সাথে সামঞ্জস্য রেখে নির্ধারণ করতে হবে।\n\n👉 সাসো SA51A উন্নত দৈহিক বৃদ্ধি, চমৎকার ডিম উৎপাদন ও সেরা বাচ্চার মান নিশ্চিত করে।"
      ],
      keyPointsEn: [
        "1. Live Weights: 1440g at 20 wks | 1737g at 24 wks | 2184g at 66 wks",
        "2. Production Yield: 247 total eggs & 239 hatching eggs at 66 weeks",
        "3. Feed Consumption: 45.8 kg total feed (0-65 wks) | 217g feed per DOC (0-66 wks)",
        "4. First 21 Days Rule: Gradually increase feed; ration must be a function of growth"
      ],
      keyPointsBn: [
        "১. জীবন্ত ওজন: ২০ সপ্তাহে ১৪৪০g | ২৪ সপ্তাহে ১৭৩৭g | ৬৬ সপ্তাহে ২১৮৪g",
        "২. ডিম উৎপাদন: ৬৬ সপ্তাহে ২৪৭টি মোট ডিম & ২৩৯টি হ্যাচিং ডিম",
        "৩. ফিড ব্যবহার: ০-৬৫ সপ্তাহে ৪৫.৮ কেজি মোট ফিড | ০-৬৬ সপ্তাহে ২১৭g ফিড/DOC",
        "৪. ১ম ২১ দিন নিয়ম: ফিডের পরিমাণ ধীরে ধীরে বাড়ানো; রেশন সবসময় ওজনের সাথে সামঞ্জস্য রাখা"
      ],
    ),

    // 2. Technical Data, Sasso Color PS (SA31A)
    ColorPSArticleItem(
      id: "sasso_sa31a_technical_data",
      titleEn: "Technical Data, Sasso Color PS (SA31A)",
      titleBn: "সাসো কালার পিএস (SA31A) টেকনিক্যাল ডাটা",
      subtitleBn: "CHARACTERISTICS (SA31A)",
      subtitleEn: "CHARACTERISTICS (SA31A)",
      snippetBn: "1. Live weight at 20 weeks = 1650 g | 2. Live weight at 24 weeks = 1935 g...",
      snippetEn: "1. Live weight at 20 weeks = 1650 g | 2. Live weight at 24 weeks = 1935 g...",
      imagePath: "assets/ps_color.jpg",
      detailsEn: [
        "📌 CHARACTERISTICS (SA31A):\n1. Live weight at 20 weeks = 1650 g\n2. Live weight at 24 weeks = 1935 g\n3. Live weight at 66 weeks = 2349 g\n4. No. of eggs at 66 weeks = 241\n5. No. of hatching eggs at 66 weeks = 235",
        "📊 MORTALITY & FEED CONSUMPTION METRICS:\n6. Mortality rate 0-20 weeks = 2.5%\n7. Mortality rate 21-66 weeks = 5.5%\n8. Total consumption for 0-65 weeks = 46.7 kg\n9. Consumption per DOC 0-66 weeks = 226 g",
        "⚠️ EARLY BROODING FEEDING ADVICE (FIRST 21 DAYS):\nBe careful during the first 21 days, gradually increase the amount of feed distributed. Ration must always be a function of growth.\n\n👉 Sasso SA31A provides heavier body weight and robust dual-purpose chick progeny."
      ],
      detailsBn: [
        "📌 বৈশিষ্ট্য ও ওজন মানদণ্ড (SA31A)ঃ\n১. ২০ সপ্তাহে জীবন্ত ওজন = ১৬৫০ গ্রাম\n২. ২৪ সপ্তাহে জীবন্ত ওজন = ১৯৩৫ গ্রাম\n৩. ৬৬ সপ্তাহে জীবন্ত ওজন = ২৩৪৯ গ্রাম\n৪. ৬৬ সপ্তাহে মোট ডিমের সংখ্যা = ২৪১ টি\n৫. ৬৬ সপ্তাহে হ্যাচিং ডিমের সংখ্যা = ২৩৫ টি",
        "📊 মরটালিটি হার ও খাদ্য গ্রহণ মানদণ্ডঃ\n৬. ০-২০ সপ্তাহে মরটালিটি হার = ২.৫%\n৭. ২১-৬৬ সপ্তাহে মরটালিটি হার = ৫.৫%\n৮. ০-৬৫ সপ্তাহে মোট ফিড গ্রহণ = ৪৬.৭ কেজি\n৯. ০-৬৬ সপ্তাহে প্রতি ডিওসি বাচ্চার ফিড = ২২৬ গ্রাম",
        "⚠️ প্রথম ২১ দিনের ফিডিং পরামর্শঃ\nপ্রথম ২১ দিন বিশেষ সতর্কতা অবলম্বন করুন এবং ফিডের পরিমাণ ধীরে ধীরে বাড়ান। রেশনের পরিমাণ সবসময় দৈহিক বৃদ্ধির সাথে সামঞ্জস্য রেখে নির্ধারণ করতে হবে।\n\n👉 সাসো SA31A ভারী দৈহিক কাঠামো এবং অত্যন্ত মজবুত বাচ্চা উৎপাদন করে।"
      ],
      keyPointsEn: [
        "1. Live Weights: 1650g at 20 wks | 1935g at 24 wks | 2349g at 66 wks",
        "2. Production Yield: 241 total eggs & 235 hatching eggs at 66 weeks",
        "3. Feed Consumption: 46.7 kg total feed (0-65 wks) | 226g feed per DOC (0-66 wks)",
        "4. First 21 Days Rule: Gradually increase feed; ration must be a function of growth"
      ],
      keyPointsBn: [
        "১. জীবন্ত ওজন: ২০ সপ্তাহে ১৬৫০g | ২৪ সপ্তাহে ১৯৩৫g | ৬৬ সপ্তাহে ২৩৪৯g",
        "২. ডিম উৎপাদন: ৬৬ সপ্তাহে ২৪১টি মোট ডিম & ২৩৫টি হ্যাচিং ডিম",
        "৩. ফিড ব্যবহার: ০-৬৫ সপ্তাহে ৪৬.৭ কেজি মোট ফিড | ০-৬৬ সপ্তাহে ২২৬g ফিড/DOC",
        "৪. ১ম ২১ দিন নিয়ম: ফিডের পরিমাণ ধীরে ধীরে বাড়ানো; রেশন সবসময় ওজনের সাথে সামঞ্জস্য রাখা"
      ],
    ),

    // 3. Tips for Sasso PS management (SA51A Female and T line males)
    ColorPSArticleItem(
      id: "sasso_ps_management_tips",
      titleEn: "Tips for Sasso PS management (SA51A Female and T line males)",
      titleBn: "সাসো পিএস ব্যবস্থাপনা টিপস (SA51A স্ত্রী ও T লাইন মোরগ)",
      subtitleBn: "TIPS IN GROWING PERIOD:",
      subtitleEn: "TIPS IN GROWING PERIOD:",
      snippetBn: "1) 1st-4th week ad-libitum feed. 2) Feed rations: Starter, Grower-1, Grower-2, Pre-breeder...",
      snippetEn: "1) 1st-4th week ad-libitum feed. 2) Feed rations: Starter, Grower-1, Grower-2, Pre-breeder...",
      imagePath: "assets/ps_color.jpg",
      detailsEn: [
        "📌 TIPS IN GROWING PERIOD:\n1) From 1st week to 4th week: Ad-libitum feed for female and male.\n2) Sasso Breeder Rations (Crumble):\n   • Starter (0-4th week)\n   • Grower-1 (5-10th week)\n   • Grower-2 (11-16th week)\n   • Pre-breeder (17th week to 5% lay)\n   (Follow recommended nutrient specs).\n3) Grading: 100% grading at week-04, week-09, and week-17 or during transfer.\n4) Skip Feeding: 5/2 program from 5th week to 18th week.\n5) Week 10-15: Achieve target body weight adjusting feed weekly.\n6) Week 16 to Start of Lay: Weekly feed increase as per actual body weight in different pens (large, medium, small).\n7) Lighting: Light intensity 10 lux from 2nd to 20th week.",

        "🥚 TIPS IN LAYING PERIOD:\n1) Laying Rations (Crumble):\n   • Pre-breeder (17th week to 5% lay)\n   • Layer-1 (6% lay to 35th week)\n   • Layer-2 (36th week to end of lay)\n   At week 19: Switch from 5/2 to 7/7 (everyday) feeding program. Total weekly feed = (week-18 feed) + 1g.\n2) Production Increment Feed: From 5% lay, for every 10% egg increase, add 5g feed. Peak feed = 125g at 70-80% lay.\n3) Liver Tonic: Weeks 22-30: 4-6 hours daily in water. Week 31+: Twice a week.",

        "🌾 HOW TO DECREASE FEED:\n• After reaching 55g egg weight, decrease feed 1g every 2 weeks.\n• Alternatively, decrease based on egg weight: after peak, for every 1g egg weight increase, decrease feed by 1.5g to 2g (depending on body weight & egg production).",

        "💡 LIGHT STIMULATION:\n• At 0.50% egg production: Increase light by 1 hr & intensity from 10 lux to 30 lux.\n• Next week: Increase light by 1 hr & intensity to 60 lux.\n• Thereafter: Increase light 1 hr every week up to a maximum of 15 to 15½ hours for life.",

        "🐓 MALE MIXING & RATIOS:\n• Start mixing when 7/7 feeding begins, 30 minutes before light off.\n• Mix 3%-4% males initially. If compatible, add 1% weekly up to max 7% males.\n• T-Line Male Ratio:\n   - 65-70%: T44 (Red male)\n   - 20-25%: TR (T Rainbow - red & black spotted male)\n   - 10%: T77 (Fully black male)\n\n👉 Rigorous adherence to growing, lighting, and male mixing guidelines guarantees maximum fertility and egg production."
      ],
      detailsBn: [
        "📌 গ্রোইং পর্যায়ের নির্দেশিকা (১ম - ২০তম সপ্তাহ)ঃ\n১) ১ম থেকে ৪থ সপ্তাহঃ স্ত্রী ও মোরগ উভয়কে উন্মুক্ত (ad-libitum) ফিড দিতে হবে।\n২) সাসো ব্রিডার রেশনসূচি (ক্রাম্বল ফিড)ঃ\n   • স্টার্টার (০-৪থ সপ্তাহ)\n   • গ্রোয়ার-১ (৫-১০ম সপ্তাহ)\n   • গ্রোয়ার-২ (১১-১৬তম সপ্তাহ)\n   • প্রি-ব্রিডার (১৭তম সপ্তাহ থেকে ৫% উৎপাদন)\n   (অনুমোদিত নিউট্রিয়েন্ট স্পেক অনুসরণ করুন)।\n৩) গ্রেডিংঃ ৪থ, ৯ম এবং ১৭তম সপ্তাহে (বা ট্রান্সফারের সময়) ১০০% গ্রেডিং করুন।\n৪) স্কিপ ফিডিংঃ ৫ম থেকে ১৮তম সপ্তাহ পর্যন্ত ৫/২ স্কিপ ফিডিং প্রোগ্রাম চালান।\n৫) ১০ম - ১৫তম সপ্তাহঃ সাপ্তাহিক ফিড সমন্বয় করে সঠিক দৈহিক ওজন অর্জন করুন।\n৬) ১৬তম সপ্তাহ - লেয়িং শুরুঃ বিভিন্ন পেনের (বড়, মাঝারি, ছোট) প্রকৃত ওজনের ভিত্তিতে ফিড বাড়ান।\n৭) লাইটিংঃ ২য় থেকে ২০তম সপ্তাহ পর্যন্ত আলোর তীব্রতা ১০ লাক্স রাখুন।",

        "🥚 লেয়িং পর্যায়ের নির্দেশিকাঃ\n১) লেয়িং ফিড রেশন (ক্রাম্বল)ঃ\n   • প্রি-ব্রিডার (১৭তম সপ্তাহ থেকে ৫% লে)\n   • লেয়ার-১ (৬% লে থেকে ৩৫তম সপ্তাহ)\n   • লেয়ার-২ (৩৬তম সপ্তাহ থেকে লেয়িং শেষ)\n   ১৯তম সপ্তাহে ৫/২ থেকে ৭/৭ (দৈনিক) ফিডিং প্রোগ্রামে পরিবর্তন করুন। মোট সাপ্তাহিক ফিড = (১৮তম সপ্তাহের ফিড) + ১ গ্রাম।\n২) উৎপাদন বৃদ্ধিতে ফিডঃ ৫% উৎপাদন থেকে প্রতি ১০% ডিম বৃদ্ধিতে ৫ গ্রাম ফিড বাড়ান। ৭০-৮০% উৎপাদনে পিক ফিড হবে ১২৫ গ্রাম।\n৩) লিভার টনিকঃ ২২-৩০ সপ্তাহ প্রতিদিন ৪-৬ ঘণ্টা পানিতে; ৩১তম সপ্তাহ থেকে সপ্তাহে ২ দিন।",

        "🌾 খাবার কমানোর নিয়মাবলী (HOW TO DECREASE FEED)ঃ\n• ডিমের ওজন ৫৫ গ্রাম পৌঁছানোর পর প্রতি ২ সপ্তাহে ১ গ্রাম ফিড কমান।\n• অথবা ডিমের ওজনের ওপর ভিত্তি করেঃ পিকের পর ডিমের ওজন ১ গ্রাম বাড়লে ১.৫ - ২ গ্রাম ফিড কমান (যা দৈহিক ওজন ও উৎপাদনের ওপর নির্ভর করবে)।",

        "💡 লাইট স্টিমুলেশন (LIGHT STIMULATION)ঃ\n• ০.৫০% ডিম উৎপাদনেঃ আলো ১ ঘণ্টা এবং তীব্রতা ১০ লাক্স থেকে ৩০ লাক্স বাড়ান।\n• পরবর্তী সপ্তাহেঃ আলো ১ ঘণ্টা এবং তীব্রতা ৬০ লাক্স করুন।\n• এরপর থেকেঃ প্রতি সপ্তাহে ১ ঘণ্টা করে বাড়িয়ে আজীবন সর্বোচ্চ ১৫ থেকে ১৫.৫ ঘণ্টা আলো বজায় রাখুন।",

        "🐓 মোরগ মিশ্রণ ও T-লাইন অনুপাত (MALE MIXING & RATIOS)ঃ\n• ৭/৭ ফিডিং শুরু হলে আলো নেভানোর ৩০ মিনিট পূর্বে মোরগ মেশানো শুরু করুন।\n• প্রথমে ৩%-৪% মোরগ মেশান। মেল-ফিমেল সম্পর্ক ঠিক থাকলে প্রতি সপ্তাহে ১% বাড়িয়ে সর্বোচ্চ ৭% মোরগ মেশান।\n• T-লাইন মোরগের অনুপাতঃ\n   - ৬৫-৭০%: T44 (লাল মোরগ)\n   - ২০-২৫%: TR (T রেইনবো - লাল ও কালো ছোপ ছোপ মোরগ)\n   - ১০%: T77 (সম্পূর্ণ কালো মোরগ)\n\n👉 সঠিক গ্রোইং, লাইটিং ও মোরগ মিশ্রণ নীতি মেনে চললে সর্বোচ্চ ফার্টিলিটি ও হ্যাচেবিলিটি নিশ্চিত হয়।"
      ],
      keyPointsEn: [
        "1. Growing Rations & Skip Feeding: Crumble feeds (Starter, Grower 1-2, Pre-breeder); 5/2 skip feeding from 5th to 18th week",
        "2. Laying & Peak Feed: 7/7 feeding at 19th wk; +5g feed per 10% lay increase up to 125g peak feed at 70-80% production",
        "3. Lighting Schedule: At 0.5% lay boost 1 hr & 30 lux; next week 60 lux; add 1 hr weekly up to 15-15.5 hrs max",
        "4. Male Mixing Strategy: Start 30 min before light off at 3-4% ratio; weekly +1% up to 7% max (T44 65-70%, TR 20-25%, T77 10%)"
      ],
      keyPointsBn: [
        "১. গ্রোইং ফিড ও স্কিপ ফিডিং: ক্রাম্বল ফিড (স্টার্টার, গ্রোয়ার ১-২, প্রি-ব্রিডার); ৫-১৮ সপ্তাহে ৫/২ স্কিপ ফিডিং",
        "২. লেয়িং ও পিক ফিড: ১৯ সপ্তাহে ৭/৭ ফিডিং; প্রতি ১০% উৎপাদনে +৫g ফিড; ৭০-৮০% লেয়িংয়ে পিক ফিড ১২৫ গ্রাম",
        "৩. লাইটিং প্রোগ্রাম: ০.৫% উৎপাদনে ১ ঘণ্টা ও ৩০ লাক্স; পরবর্তী সপ্তাহে ৬০ লাক্স; প্রতি সপ্তাহে ১ ঘণ্টা বাড়িয়ে সর্বোচ্চ ১৫-১৫.৫ ঘণ্টা",
        "৪. মোরগ মিশ্রণ ও অনুপাত: আলো নেভানোর ৩০ মি. পূর্বে ৩-৪% মোরগ মেশানো; প্রতি সপ্তাহে +১% থেকে সর্বোচ্চ ৭% (T44 ৬৫-৭০%, TR ২০-২৫%, T77 ১০%)"
      ],
    ),

    // 4. Technical Data, Hubbard Color PS (JA 57 Ki)
    ColorPSArticleItem(
      id: "hubbard_ja57ki_technical_data",
      titleEn: "Technical Data, Hubbard Color PS (JA 57 Ki)",
      titleBn: "হাবার্ড কালার পিএস (JA 57 Ki) টেকনিক্যাল ডাটা",
      subtitleBn: "CHARACTERISTICS (JA 57 Ki)",
      subtitleEn: "CHARACTERISTICS (JA 57 Ki)",
      snippetBn: "1. Age at 5% production = 23 week | 2. Live weight at 5% production = 1790 g...",
      snippetEn: "1. Age at 5% production = 23 week | 2. Live weight at 5% production = 1790 g...",
      imagePath: "assets/ps_color.jpg",
      detailsEn: [
        "📌 CHARACTERISTICS (JA 57 Ki):\n1. Age at 5% production = 23 week\n2. Live weight at 5% production = 1790 g\n3. Production Peak (%) = 92.5%\n4. No. of eggs at 64 weeks = 222\n5. No. of hatching eggs at 64 weeks = 211",
        "📊 PEAK & EGG WEIGHT SPECS:\n6. Age at production peak = 28 weeks\n7. Egg weight at 27 weeks = 54 g\n\n👉 Hubbard JA 57 Ki combines exceptional laying peak performance with heavy egg production output."
      ],
      detailsBn: [
        "📌 বৈশিষ্ট্য মানদণ্ড (JA 57 Ki)ঃ\n১. ৫% উৎপাদনে বয়স = ২৩ সপ্তাহ\n২. ৫% উৎপাদনে জীবন্ত ওজন = ১৭৯০ গ্রাম\n৩. পিক ডিম উৎপাদন (%) = ৯২.৫%\n৪. ৬৪ সপ্তাহে মোট ডিমের সংখ্যা = ২২২ টি\n৫. ৬৪ সপ্তাহে হ্যাচিং ডিমের সংখ্যা = ২১১ টি",
        "📊 পিক বয়স ও ডিমের ওজন মানদণ্ডঃ\n৬. পিক ডিম উৎপাদনের বয়স = ২৮ সপ্তাহ\n৭. ২৭ সপ্তাহে ডিমের ওজন = ৫৪ গ্রাম\n\n👉 হাবার্ড JA 57 Ki উচ্চ ডিম উৎপাদন ক্ষমতা ও চমৎকার পিকের সেরা সমন্বয় ঘটাতে সক্ষম।"
      ],
      keyPointsEn: [
        "1. Production Milestones: Age at 5% lay = 23 wks | Peak (92.5%) at 28 wks",
        "2. Target Weight at 5% Lay: 1790 g live weight",
        "3. Production Yield: 222 total eggs & 211 hatching eggs at 64 weeks",
        "4. Egg Weight Standard: 54 g egg weight at 27 weeks"
      ],
      keyPointsBn: [
        "১. ডিম উৎপাদনের মাইলফলক: ২৩ সপ্তাহে ৫% ডিম | ২৮ সপ্তাহে পিক (৯২.৫%)",
        "২. ৫% উৎপাদনে ওজন: ১৭৯০ গ্রাম জীবন্ত ওজন",
        "৩. মোট ডিম উৎপাদন: ৬৪ সপ্তাহে ২২২টি মোট ডিম & ২১১টি হ্যাচিং ডিম",
        "৪. ডিমের ওজন মানদণ্ড: ২৭ সপ্তাহে ৫৪ গ্রাম ডিমের ওজন"
      ],
    ),

    // 5. Technical Data, Hubbard Color PS (REDBRO MINI)
    ColorPSArticleItem(
      id: "hubbard_redbro_mini_technical_data",
      titleEn: "Technical Data, Hubbard Color PS (REDBRO MINI)",
      titleBn: "হাবার্ড কালার পিএস (REDBRO MINI) টেকনিক্যাল ডাটা",
      subtitleBn: "CHARACTERISTICS (REDBRO MINI)",
      subtitleEn: "CHARACTERISTICS (REDBRO MINI)",
      snippetBn: "1. Age at 5% production = 22/23 week | 2. Live weight at 5% production = 1870 g...",
      snippetEn: "1. Age at 5% production = 22/23 week | 2. Live weight at 5% production = 1870 g...",
      imagePath: "assets/ps_color.jpg",
      detailsEn: [
        "📌 CHARACTERISTICS (REDBRO MINI):\n1. Age at 5% production = 22/23 week\n2. Live weight at 5% production = 1870 g\n3. Production Peak (%) = 86.3%\n4. No. of eggs at 64 weeks = 193\n5. No. of hatching eggs at 64 weeks = 181",
        "📊 PEAK & EGG WEIGHT SPECS:\n6. Age at production peak = 28 weeks\n7. Egg weight at 27 weeks = 52 g\n\n👉 Redbro Mini offers superior feed conversion, compact housing density, and efficient chick output."
      ],
      detailsBn: [
        "📌 বৈশিষ্ট্য মানদণ্ড (REDBRO MINI)ঃ\n১. ৫% উৎপাদনে বয়স = ২২/২৩ সপ্তাহ\n২. ৫% উৎপাদনে জীবন্ত ওজন = ১৮৭০ গ্রাম\n৩. পিক ডিম উৎপাদন (%) = ৮৬.৩%\n৪. ৬৪ সপ্তাহে মোট ডিমের সংখ্যা = ১৯৩ টি\n৫. ৬৪ সপ্তাহে হ্যাচিং ডিমের সংখ্যা = ১৮১ টি",
        "📊 পিক বয়স ও ডিমের ওজন মানদণ্ডঃ\n৬. পিক ডিম উৎপাদনের বয়স = ২৮ সপ্তাহ\n৭. ২৭ সপ্তাহে ডিমের ওজন = ৫২ গ্রাম\n\n👉 রেডব্রো মিনি সর্বোচ্চ খাদ্য দক্ষতা, কম শেড স্পেস ও সাশ্রয়ী বাচ্চা উৎপাদন নিশ্চিত করে।"
      ],
      keyPointsEn: [
        "1. Production Milestones: Age at 5% lay = 22/23 wks | Peak (86.3%) at 28 wks",
        "2. Target Weight at 5% Lay: 1870 g live weight",
        "3. Production Yield: 193 total eggs & 181 hatching eggs at 64 weeks",
        "4. Egg Weight Standard: 52 g egg weight at 27 weeks"
      ],
      keyPointsBn: [
        "১. ডিম উৎপাদনের মাইলফলক: ২২/২৩ সপ্তাহে ৫% ডিম | ২৮ সপ্তাহে পিক (৮৬.৩%)",
        "২. ৫% উৎপাদনে ওজন: ১৮৭০ গ্রাম জীবন্ত ওজন",
        "৩. মোট ডিম উৎপাদন: ৬৪ সপ্তাহে ১৯৩টি মোট ডিম & ১৮১টি হ্যাচিং ডিম",
        "৪. ডিমের ওজন মানদণ্ড: ২৭ সপ্তাহে ৫২ গ্রাম ডিমের ওজন"
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
          isEng ? "Color PS Summary" : "কালার পিএস সারসংক্ষেপ",
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
    ColorPSArticleItem item,
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
              builder: (_) => ColorPSArticleDetailScreen(
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
                        color: isDark ? Colors.white : Colors.black87,
                        height: 1.25,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      isEng ? item.subtitleEn : item.subtitleBn,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF00838F),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      isEng ? item.snippetEn : item.snippetBn,
                      style: TextStyle(
                        fontSize: 12,
                        color: isDark ? Colors.grey.shade400 : Colors.grey.shade700,
                        height: 1.3,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 6),

              // Forward Arrow Icon
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
                color: isDark ? Colors.grey.shade500 : Colors.grey.shade400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ColorPSArticleDetailScreen extends StatelessWidget {
  final ColorPSArticleItem item;
  final bool isEnglish;

  const ColorPSArticleDetailScreen({
    super.key,
    required this.item,
    required this.isEnglish,
  });

  @override
  Widget build(BuildContext context) {
    final isEng = isEnglish;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final detailsList = isEng ? item.detailsEn : item.detailsBn;
    final keyPointsList = isEng ? item.keyPointsEn : item.keyPointsBn;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF121212) : const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: Text(
          isEng ? item.titleEn : item.titleBn,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF00838F),
        elevation: 0.5,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Header Image Banner
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                item.imagePath,
                width: double.infinity,
                height: 170,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 150,
                  color: Colors.teal.shade200,
                  child: const Center(
                    child: Icon(Icons.pets_rounded, size: 60, color: Colors.teal),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Main Title & Subtitle Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF1E293B) : Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isEng ? item.titleEn : item.titleBn,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : const Color(0xFF0F172A),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    isEng ? item.subtitleEn : item.subtitleBn,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF00838F),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Key Summary Highlights Card
            if (keyPointsList.isNotEmpty) ...[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: isDark
                        ? [const Color(0xFF004D40), const Color(0xFF00695C)]
                        : [const Color(0xFFE0F2F1), const Color(0xFFB2DFDB)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: const Color(0xFF00838F).withValues(alpha: 0.4),
                    width: 1.5,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.stars_rounded,
                          color: Color(0xFF00838F),
                          size: 24,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          isEng ? "Key Highlights & Targets" : "প্রধান সারসংক্ষেপ ও লক্ষ্যমাত্রা",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: isDark ? Colors.white : const Color(0xFF004D40),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ...keyPointsList.map(
                      (kp) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("• ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF00838F))),
                            Expanded(
                              child: Text(
                                kp,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: isDark ? Colors.white70 : const Color(0xFF004D40),
                                  height: 1.35,
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
              const SizedBox(height: 16),
            ],

            // Section Details List
            ...List.generate(detailsList.length, (idx) {
              final secText = detailsList[idx];
              return Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF1E293B) : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isDark
                        ? Colors.grey.shade800
                        : Colors.grey.shade200,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.03),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Badge Number
                    Container(
                      width: 28,
                      height: 28,
                      decoration: const BoxDecoration(
                        color: Color(0xFF00838F),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          "${idx + 1}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),

                    // Section Content Text
                    Expanded(
                      child: Text(
                        secText,
                        style: TextStyle(
                          fontSize: 14,
                          height: 1.5,
                          color: isDark ? Colors.grey.shade200 : Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
