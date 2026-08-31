import 'package:flutter/material.dart';

class VaccineArticleSection {
  final String titleBn;
  final String titleEn;
  final List<String> pointsBn;
  final List<String> pointsEn;

  VaccineArticleSection({
    required this.titleBn,
    required this.titleEn,
    required this.pointsBn,
    required this.pointsEn,
  });
}

class VaccineInfoItem {
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
  final List<VaccineArticleSection> sections;
  final String summaryTitleBn;
  final String summaryTitleEn;
  final String summaryQuoteBn;
  final String summaryQuoteEn;
  final String summarySubBn;
  final String summarySubEn;

  VaccineInfoItem({
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

class VaccineInfoScreen extends StatelessWidget {
  final bool isEnglish;

  const VaccineInfoScreen({super.key, required this.isEnglish});

  static final List<VaccineInfoItem> _items = [
    // -------------------------------------------------------------
    // Article 1: Vaccine Schedule (ভ্যাক্সিনেশন শিডিউল)
    // -------------------------------------------------------------
    VaccineInfoItem(
      id: "vaccine_schedule",
      titleBn: "ভ্যাক্সিনেশন শিডিউল",
      titleEn: "Vaccination Schedule",
      descBn:
          "VACCINE SCHEDULE:\n🐓 ব্রয়লার/কালার/সোনালী মুরগীর ভ্যাকসিন সূচী:\nব্রয়লার সাধারণত ৩০–৩৫ দিনে, কালার মুরগী সাধারণত ৪০–৪৫ দিনে বাজারজাত হয়, তাই এর ভ্যাকসিন প্রোগ্রাম তুলনামূলক ছোট।",
      descEn:
          "VACCINE SCHEDULE:\n🐓 Complete vaccination timeline for Broiler, Color/Sonali, Layer, and Breeder poultry flocks...",
      imagePath: "assets/vaccine_schedule.jpg",
      introBn:
          "VACCINE SCHEDULE:\n\n🐓 ব্রয়লার, সোনালী, লেয়ার ও ব্রিডার মুরগির পূর্ণাঙ্গ ভ্যাকসিন সময়সূচী খামারকে মরণঘাতী ভাইরাসের আক্রমণ থেকে রক্ষা করে। নিচে বিস্তারিত প্রজাতিভিত্তিক সময়সূচী দেওয়া হলো:",
      introEn:
          "VACCINE SCHEDULE:\n\n🐓 Comprehensive breed-wise vaccination schedule for Broiler, Layer, and Breeder flocks. Following this timeline protects your farm from lethal viral outbreaks.",
      sectionHeaderBn: "🔰 প্রজাতিভিত্তিক টিকাদান সময়সূচী:",
      sectionHeaderEn: "🔰 Breed-Wise Vaccination Timelines:",
      sections: [
        VaccineArticleSection(
          titleBn: "🐓 ব্রয়লার/কালার/সোনালী মুরগীর ভ্যাকসিন সূচী:",
          titleEn: "🐓 Broiler / Color / Sonali Schedule:",
          pointsBn: [
            "ব্রয়লার সাধারণত ৩০–৩৫ দিনে, কালার মুরগী সাধারণত ৪০–৪৫ দিনে বাজারজাত হয়, তাই এর ভ্যাকসিন প্রোগ্রাম তুলনামূলক ছোট।",
            "•প্রথম দিনেই (হ্যাচারিতে বা শেডে আনার পরপর) → নিউক্যাসেল ডিজিজ (ND) ও ইনফেকশাস ব্রঙ্কাইটিস (IB) ড্রপ বা স্প্রে আকারে দেওয়া হয়।",
            "•৯–১১ দিনে → গামবোরো (IBD) ভ্যাকসিন দেওয়া হয়।",
            "•১৬–১৮ দিনে → আবারও গামবোরো রিপিট করা হয়।",
            "•২১–২৪ দিনে → নিউক্যাসেল আবারও দেওয়া ভালো।",
          ],
          pointsEn: [
            "Broilers are marketed at 30-35 days and color birds at 40-45 days, so their vaccination program is shorter.",
            "•Day 1 (Hatchery or arrival) → Newcastle Disease (ND) & Infectious Bronchitis (IB) eye drop or spray.",
            "•Days 9–11 → Gumboro (IBD) vaccine.",
            "•Days 16–18 → Repeat Gumboro (IBD) booster.",
            "•Days 21–24 → Repeat Newcastle (ND) booster.",
          ],
        ),
        VaccineArticleSection(
          titleBn: "🐓 লেয়ার মুরগীর ভ্যাকসিন সূচী:",
          titleEn: "🐓 Layer Flock Schedule:",
          pointsBn: [
            "লেয়ার দীর্ঘদিন ডিম উৎপাদনের জন্য রাখা হয়, তাই ভ্যাকসিন সূচী অনেক বড় ও পরিপূর্ণ।",
            "•১ম দিন → নিউক্যাসেল + আইবি (ড্রপ বা স্প্রে)।",
            "•৫–৭ দিন → নিউক্যাসেল ডিজিজ (ND) ও ইনফেকশাস ব্রঙ্কাইটিস কিল্ড।",
            "•৯–১১ দিন → গামবোরো প্রথম ডোজ।",
            "•১৬–১৮ দিন → গামবোরো দ্বিতীয় ডোজ।",
            "•২১ দিন → নিউক্যাসেল ডিজিজ (ND)।",
            "•২৮ দিন → বার্ডফ্লু (H9N2)।",
            "•৫ সপ্তাহ বয়সে → ফাউল পক্স ভ্যাকসিন (চামড়ায় ফোঁটা দিয়ে দেওয়া হয়)।",
            "•৬ সপ্তাহ বয়সে → ফাউল কলেরা প্রয়োগ করা হয়।",
            "•৭ সপ্তাহ বয়সে → নিউক্যাসেল ডিজিজ (ND) ও ইনফেকশাস ব্রঙ্কাইটিস (IB) লাইভ ও কিল্ড ভ্যাকসিন একসাথে প্রয়োগ করা হয়।",
            "•৮ সপ্তাহ বয়সে → করাইজা ভ্যাকসিন প্রয়োগ করা হয়।",
            "•১০ সপ্তাহ → ফাউল কলেরা বুস্টার প্রয়োগ করা হয়।",
            "•১২ সপ্তাহ বয়সে → নিউক্যাসেল ডিজিজ (ND) ও ইনফেকশাস ব্রঙ্কাইটিস (IB) লাইভ ভ্যাকসিন প্রয়োগ করা হয়।",
            "•১৪ সপ্তাহে → বার্ডফ্লু (H9N2) বুস্টার প্রয়োগ করা হয়।",
            "•১৬ সপ্তাহ বয়সে → ND+IB+EDS কিল্ড ভ্যাকসিন দেওয়া হয়।",
            "•১৭ সপ্তাহ বয়সে → নিউক্যাসেল ডিজিজ (ND) ও ইনফেকশাস ব্রঙ্কাইটিস (IB) লাইভ ভ্যাকসিন প্রয়োগ করা হয়।",
            "👉 লেয়ার মুরগীর জন্য ভ্যাকসিনের সূচী সাধারণত ডিম দেওয়া শুরু হওয়ার আগে সম্পূর্ণ করতে হয়। এরপর প্রতি ১ মাস পরপর নিউক্যাসেল ডিজিজ (ND) ও ইনফেকশাস ব্রঙ্কাইটিস (IB) লাইভ ভ্যাকসিন প্রয়োগ করা হয়।",
          ],
          pointsEn: [
            "Layers are maintained for long laying cycles, so their vaccine schedule is comprehensive.",
            "•Day 1 → ND + IB (Eye drop or spray).",
            "•Days 5–7 → Newcastle (ND) & Infectious Bronchitis (IB) Killed.",
            "•Days 9–11 → Gumboro 1st Dose.",
            "•Days 16–18 → Gumboro 2nd Dose.",
            "•Day 21 → Newcastle Disease (ND).",
            "•Day 28 → Avian Influenza (H9N2).",
            "•Week 5 → Fowl Pox (Wing web puncture).",
            "•Week 6 → Fowl Cholera.",
            "•Week 7 → Newcastle (ND) & IB Live + Killed combined.",
            "•Week 8 → Infectious Coryza vaccine.",
            "•Week 10 → Fowl Cholera Booster.",
            "•Week 12 → Newcastle (ND) & IB Live.",
            "•Week 14 → Avian Influenza (H9N2) Booster.",
            "•Week 16 → ND+IB+EDS Killed Trio vaccine.",
            "•Week 17 → Newcastle (ND) & IB Live.",
            "👉 Layer vaccine schedule must be completed before egg production begins. Thereafter, administer ND + IB Live every month.",
          ],
        ),
        VaccineArticleSection(
          titleBn: "🐓 ব্রিডার মুরগীর ভ্যাকসিন সূচী:",
          titleEn: "🐓 Breeder Flock Schedule:",
          pointsBn: [
            "ব্রিডার মুরগী হলো সেইসব মুরগী যাদের থেকে ফার্টাইল ডিম সংগ্রহ করে হ্যাচারিতে বাচ্চা তৈরি হয়। তাই এগুলোর ভ্যাকসিন সবচেয়ে পরিপূর্ণ ও দীর্ঘ মেয়াদি হতে হয়।",
            "•১ম দিন → নিউক্যাসেল + আইবি (ড্রপ বা স্প্রে)।",
            "•৫–৭ দিন → নিউক্যাসেল ডিজিজ (ND) ও ইনফেকশাস ব্রঙ্কাইটিস কিল্ড।",
            "•৯–১১ দিন → গামবোরো প্রথম ডোজ।",
            "•১৪ দিন → রিও (Rio) live ভ্যাকসিন প্রয়োগ করা হয়।",
            "•১৬–১৮ দিন → গামবোরো দ্বিতীয় ডোজ।",
            "•২১ দিন → নিউক্যাসেল ডিজিজ (ND)।",
            "•২৮ দিন → বার্ডফ্লু (H9N2)।",
            "•৫ সপ্তাহ বয়সে → ফাউল পক্স ভ্যাকসিন (চামড়ায় ফোঁটা দিয়ে দেওয়া হয়)।",
            "•৬ সপ্তাহ বয়সে → ফাউল কলেরা প্রয়োগ করা হয়।",
            "•৭ সপ্তাহ বয়সে → নিউক্যাসেল ডিজিজ (ND) ও ইনফেকশাস ব্রঙ্কাইটিস (IB) লাইভ ও কিল্ড ভ্যাকসিন একসাথে প্রয়োগ করা হয়।",
            "•৮ সপ্তাহ বয়সে → করাইজা ভ্যাকসিন প্রয়োগ করা হয়।",
            "•৯ সপ্তাহ বয়সে → চিকেন এনিমিয়া ভাইরাস (CAV) ভ্যাকসিন প্রয়োগ করা হয়।",
            "•১০ সপ্তাহে → ফাউল কলেরা বুস্টার প্রয়োগ করা হয়।",
            "•১২ সপ্তাহ বয়সে → নিউক্যাসেল ডিজিজ (ND) ও ইনফেকশাস ব্রঙ্কাইটিস (IB) লাইভ ভ্যাকসিন প্রয়োগ করা হয়।",
            "•১৪ সপ্তাহে → বার্ডফ্লু (H9N2) বুস্টার প্রয়োগ করা হয়।",
            "•১৬ সপ্তাহ বয়সে → EDS ভ্যাকসিন প্রয়োগ করা হয়।",
            "•১৭ সপ্তাহ বয়সে → নিউক্যাসেল ডিজিজ (ND) ও ইনফেকশাস ব্রঙ্কাইটিস (IB) লাইভ ভ্যাকসিন প্রয়োগ করা হয়।",
            "•১৮ সপ্তাহ বয়সে → ND+IB+IBD+RIO কিল্ড ভ্যাকসিন দেওয়া হয়।",
            "•২২ সপ্তাহ বয়সে → নিউক্যাসেল ডিজিজ (ND) ও ইনফেকশাস ব্রঙ্কাইটিস (IB) লাইভ ভ্যাকসিন প্রয়োগ করা হয়।",
            "👉 ব্রিডার মুরগীর জন্য ভ্যাকসিনের সূচী সাধারণত ডিম দেওয়া শুরু হওয়ার আগে সম্পূর্ণ করতে হয়। এছাড়া এলাকা ভিত্তিক কিছু ভ্যাকসিন সংযোজন বা বিয়োজন হতে পারে। এরপর প্রতি ১ মাস পরপর নিউক্যাসেল ডিজিজ (ND) ও ইনফেকশাস ব্রঙ্কাইটিস (IB) লাইভ ভ্যাকসিন প্রয়োগ করা হয়।",
          ],
          pointsEn: [
            "Breeders produce fertile hatching eggs; hence they require the most comprehensive long-term protection.",
            "•Day 1 → ND + IB (Eye drop or spray).",
            "•Days 5–7 → Newcastle (ND) & IB Killed.",
            "•Days 9–11 → Gumboro 1st Dose.",
            "•Day 14 → Reovirus (Rio) Live vaccine.",
            "•Days 16–18 → Gumboro 2nd Dose.",
            "•Day 21 → Newcastle (ND).",
            "•Day 28 → Avian Influenza (H9N2).",
            "•Week 5 → Fowl Pox (Wing web puncture).",
            "•Week 6 → Fowl Cholera.",
            "•Week 7 → ND & IB Live + Killed combined.",
            "•Week 8 → Infectious Coryza vaccine.",
            "•Week 9 → Chicken Anemia Virus (CAV).",
            "•Week 10 → Fowl Cholera Booster.",
            "•Week 12 → ND & IB Live.",
            "•Week 14 → Avian Influenza (H9N2) Booster.",
            "•Week 16 → Egg Drop Syndrome (EDS) vaccine.",
            "•Week 17 → ND & IB Live.",
            "•Week 18 → ND+IB+IBD+RIO Killed 4-way vaccine.",
            "•Week 22 → Newcastle (ND) & IB Live.",
            "👉 Breeder schedules should be completed prior to onset of lay. Afterward, administer ND + IB Live monthly.",
          ],
        ),
        VaccineArticleSection(
          titleBn: "📌 কিছু গুরুত্বপূর্ণ নিয়ম:",
          titleEn: "📌 Important Rules & Guidelines:",
          pointsBn: [
            "1. সব ভ্যাকসিন কোল্ড চেইন (২-৮° সেলসিয়াসে) সংরক্ষণ করতে হবে।",
            "2. ভ্যাকসিন মেশানোর পর দ্রুত ব্যবহার করতে হবে—অতিরিক্ত সময় রাখা যাবে না।",
            "3. পানির মাধ্যমে ভ্যাকসিন দিলে পানি যেন ক্লোরিন বা জীবাণুমুক্ত থাকে এবং আগে থেকে ২ ঘণ্টা না খাইয়ে দেওয়া ভালো।",
            "4. টিকা দেওয়ার পর মুরগীকে কিছুটা সময় বিশ্রাম দিতে হবে।",
            "5. প্রয়োগের পদ্ধতি ভ্যাকসিনের ধরন অনুযায়ী ভিন্ন হয়—কোনোটা চোখ/নাফে ড্রপ, কোনোটা পানির মাধ্যমে, আবার কোনোটা ইনজেকশনে দিতে হয়।",
          ],
          pointsEn: [
            "1. Store all vaccines strictly under cold chain conditions (2–8°C).",
            "2. Use reconstituted vaccine rapidly; do not hold solution for extended periods.",
            "3. Ensure drinking water is chlorine-free; deprive birds of water for 2 hours prior.",
            "4. Allow birds quiet rest following vaccine administration.",
            "5. Follow appropriate route per vaccine (Eye/nasal drop, drinking water, or injection).",
          ],
        ),
      ],
      summaryTitleBn: "✅ সংক্ষেপে:",
      summaryTitleEn: "✅ In Summary:",
      summaryQuoteBn:
          "ভ্যাকসিনসূচী সময়মতো মেনে চললে খামারে মরণঘাতী ভাইরাসের আক্রমণ রোধ হয় এবং ফার্ম লাভজনক থাকে।",
      summaryQuoteEn:
          "Adhering strictly to vaccination charts prevents viral outbreaks and secures farm investment.",
      summarySubBn: "",
      summarySubEn: "",
    ),

    // -------------------------------------------------------------
    // Article 2: Live Vaccines (লাইভ ভ্যাকসিন)
    // -------------------------------------------------------------
    VaccineInfoItem(
      id: "live_vaccine",
      titleBn: "লাইভ ভ্যাকসিন",
      titleEn: "Live Vaccines",
      descBn:
          "LIVE VACCINES:\n🐓 লাইভ ভ্যাকসিন (Live Vaccine) হলো এমন একধরনের ভ্যাকসিন যেখানে জীবিত কিন্তু দুর্বল (attenuated) অবস্থায় থাকা ভাইরাস বা ব্যাকটেরিয়া ব্যবহার করা হয়। এরা আসল জীবাণুর মতোই শরীরে প্রবেশ করে কিন্তু রোগ সৃষ্টি করতে পারে না...",
      descEn:
          "LIVE VACCINES:\n🐓 Live vaccines contain attenuated live microorganisms that rapidly induce mucosal & systemic immunity...",
      imagePath: "assets/live_vaccine.jpg",
      introBn:
          "LIVE VACCINES:\n\n🐓 লাইভ ভ্যাকসিন (Live Vaccine) হলো এমন একধরনের ভ্যাকসিন যেখানে জীবিত কিন্তু দুর্বল (attenuated) অবস্থায় থাকা ভাইরাস বা ব্যাকটেরিয়া ব্যবহার করা হয়। এরা আসল জীবাণুর মতোই শরীরে প্রবেশ করে কিন্তু রোগ সৃষ্টি করতে পারে না (অথবা খুব হালকা উপসর্গ হতে পারে)। তবে এরা শরীরে প্রাকৃতিক সংক্রমণের মতো প্রতিরোধ ব্যবস্থা (immune response) তৈরি করে।\n\nলাইভ ভ্যাকসিন মানে হলো আসল জীবাণুকে দুর্বল করে শরীরে দেওয়া, যাতে রোগ না হয়ে শরীর শিখে নেয় কিভাবে আসল জীবাণুর সাথে লড়াই করতে হবে।",
      introEn:
          "LIVE VACCINES:\n\n🐓 Live attenuated vaccines contain live viruses or bacteria weakened in lab conditions so they cause no active illness while stimulating rapid, long-lasting mucosal and cell-mediated immunity.",
      sectionHeaderBn: "🔰 লাইভ ভ্যাকসিনের বিস্তারিত আলোচনা ও প্রয়োগবিধি:",
      sectionHeaderEn: "🔰 Live Vaccine Features, Administration & Warnings:",
      sections: [
        VaccineArticleSection(
          titleBn: "১. লাইভ ভ্যাকসিনের বৈশিষ্ট্য:",
          titleEn: "1. Characteristics of Live Vaccines:",
          pointsBn: [
            "1. জীবাণু জীবিত থাকে কিন্তু দুর্বল করা হয়।",
            "2. শরীরের ভেতরে সীমিতভাবে বংশবৃদ্ধি করতে পারে।",
            "3. দ্রুত ও শক্তিশালী ইমিউন প্রতিক্রিয়া তৈরি করে।",
            "4. তুলনামূলকভাবে কম ডোজেই দীর্ঘমেয়াদী সুরক্ষা দেয়।",
          ],
          pointsEn: [
            "1. Pathogens remain alive but are artificially attenuated.",
            "2. Capable of limited replication within host tissue.",
            "3. Induces rapid and robust immune response.",
            "4. Provides long-lasting protection with low dosage.",
          ],
        ),
        VaccineArticleSection(
          titleBn: "২. লাইভ ভ্যাকসিনের সুবিধা:",
          titleEn: "2. Advantages of Live Vaccines:",
          pointsBn: [
            "•রোগ প্রতিরোধ ক্ষমতা শক্তিশালী হয়।",
            "•একবার দেওয়ায় অনেক সময় দীর্ঘমেয়াদী সুরক্ষা মেলে।",
            "•পানির মাধ্যমে, চোখ/নাফে ড্রপ, স্প্রে – নানা উপায়ে দেওয়া যায়।",
          ],
          pointsEn: [
            "•Strongly stimulates active immune defense.",
            "•Single dose frequently provides long-term immunity.",
            "•Versatile routes: drinking water, eye/nasal drops, or spray mist.",
          ],
        ),
        VaccineArticleSection(
          titleBn: "৩. লাইভ ভ্যাকসিনের অসুবিধা:",
          titleEn: "3. Disadvantages of Live Vaccines:",
          pointsBn: [
            "•অসুস্থ বা দুর্বল বাচ্চাকে দিলে ঝুঁকি বাড়তে পারে।",
            "•সংরক্ষণে বিশেষ যত্ন দরকার (২°-৮°C কোল্ড চেইন)।",
            "•ব্যবহার করার সাথে সাথেই শেষ করতে হয়, রেখে দেওয়া যায় না।",
            "•খুব কম ক্ষেত্রে দুর্বল ভাইরাস আবার রোগ সৃষ্টি করতে পারে।",
          ],
          pointsEn: [
            "•Higher risk if administered to weak or diseased birds.",
            "•Requires strict cold chain maintenance (2°-8°C).",
            "•Must be consumed rapidly upon reconstitution; cannot be stored.",
            "•Rare risk of viral reversion or vaccine reaction.",
          ],
        ),
        VaccineArticleSection(
          titleBn: "৪. মুরগির জন্য লাইভ ভ্যাকসিনের উদাহরণ:",
          titleEn: "4. Examples of Live Poultry Vaccines:",
          pointsBn: [
            "•নিউক্যাসেল ডিজিজ (Ranikhet/NDV) – B1, F strain, LaSota strain",
            "•গামবোরো (Infectious Bursal Disease / IBD)",
            "•ইনফেকশাস ব্রঙ্কাইটিস (IB)",
            "•ফাউল পক্স",
          ],
          pointsEn: [
            "•Newcastle Disease (Ranikhet/NDV) – B1, F strain, LaSota strain",
            "•Gumboro (Infectious Bursal Disease / IBD)",
            "•Infectious Bronchitis (IB)",
            "•Fowl Pox",
          ],
        ),
        VaccineArticleSection(
          titleBn: "৫. লাইভ ভ্যাকসিনের প্রয়োগ পদ্ধতি:",
          titleEn: "5. Application Methods:",
          pointsBn: [
            "•পানির সাথে মিশিয়ে খাওয়ানো",
            "•চোখ বা নাকে ড্রপ দেওয়া",
            "•স্প্রে করে দেওয়া",
            "•উইং ওয়েব ইনজেকশন (ফাউল পক্সের ক্ষেত্রে)",
          ],
          pointsEn: [
            "•Drinking water administration",
            "•Eye or nasal drop instillation",
            "•Coarse spray misting",
            "•Wing-web puncture (for Fowl Pox)",
          ],
        ),
        VaccineArticleSection(
          titleBn: "⚠️ সতর্কতা:",
          titleEn: "⚠️ Key Warnings & Precautions:",
          pointsBn: [
            "•অসুস্থ বা দুর্বল বাচ্চাকে ভ্যাকসিন দেওয়া উচিত নয়।",
            "•অ্যান্টিবায়োটিক বা ভেটেরিনারি ওষুধ চলাকালীন ভ্যাকসিন না দেওয়া ভালো।",
            "•ভ্যাকসিন খোলার পর সাথে সাথেই ব্যবহার করতে হবে, বেশি সময় রাখা যাবে না।",
            "•ভ্যাকসিন অবশ্যই কোল্ড চেইন (২°-৮°C) এ সংরক্ষণ করতে হবে।",
            "•ভ্যাকসিন দেওয়ার সময় পরিষ্কার পানির ব্যবহার জরুরি।",
            "•পানিতে ভ্যাকসিন মিশালে আগে দুধের গুঁড়া (skimmed milk powder) মিশিয়ে নিতে হয়, এতে ভাইরাস সক্রিয় থাকে।",
            "•ভ্যাকসিন প্রয়োগের আগে মুরগিকে ১–২ ঘণ্টা পানি না দিয়ে তৃষ্ণার্ত রাখা ভালো।",
            "•ভ্যাকসিন খাওয়ানো বা দেওয়ার পর অন্তত ১ ঘণ্টা যেন অন্য কোনো পানি বা খাবার না পায়।",
          ],
          pointsEn: [
            "•Do NOT vaccinate sick, weak, or stressed chicks.",
            "•Avoid vaccinating while birds are undergoing antibiotic treatment.",
            "•Use immediately upon opening; do not store mixed solution.",
            "•Maintain uninterrupted cold chain storage (2°-8°C).",
            "•Use pure, sanitizer-free clean water.",
            "•Add skimmed milk powder to water before vaccine to stabilize viruses.",
            "•Deprive birds of water for 1-2 hours prior to vaccination.",
            "•Withhold un-treated water/feed for at least 1 hour after vaccine consumption.",
          ],
        ),
        VaccineArticleSection(
          titleBn: "🐓 মুরগির জন্য লাইভ ভ্যাকসিন শিডিউলের উদাহরণ:",
          titleEn: "🐓 Live Vaccine Schedule Example:",
          pointsBn: [
            "•১–৫ দিন বয়সে → NDV (B1 বা F strain)",
            "•৯–১১ দিন বয়সে → IBD (গামবোরো)",
            "•১৬–১৮ দিন বয়সে → IBD (২য় ডোজ)",
            "•২১ দিন বয়সে → NDV (LaSota)",
            "•৬–৮ সপ্তাহে → ফাউল পক্স (উইং ওয়েব পদ্ধতি)",
            "•৬–৮ সপ্তাহে → NDV + IB (বুস্টার)",
            "•প্রতি ২–৩ মাস পরপর → NDV (LaSota বুস্টার)",
          ],
          pointsEn: [
            "•Days 1–5 → NDV (B1 or F strain)",
            "•Days 9–11 → IBD (Gumboro)",
            "•Days 16–18 → IBD (2nd Dose)",
            "•Day 21 → NDV (LaSota)",
            "•Weeks 6–8 → Fowl Pox (Wing web puncture)",
            "•Weeks 6–8 → NDV + IB (Booster)",
            "•Every 2–3 months → NDV (LaSota Booster)",
          ],
        ),
      ],
      summaryTitleBn: "✅ গুরুত্বপূর্ণ পরামর্শ:",
      summaryTitleEn: "✅ Key Advice:",
      summaryQuoteBn:
          "লাইভ ভ্যাকসিন গোলানোর পর ২ ঘণ্টার মধ্যে খাইয়ে শেষ করতে হবে, না হলে ভাইরাসের কার্যকারিতা নষ্ট হয়ে যায়।",
      summaryQuoteEn:
          "Reconstituted live vaccines must be consumed within 2 hours to maintain viral potency.",
      summarySubBn: "",
      summarySubEn: "",
    ),

    // -------------------------------------------------------------
    // Article 3: Killed Vaccines (কিল্ড ভ্যাকসিন)
    // -------------------------------------------------------------
    VaccineInfoItem(
      id: "killed_vaccine",
      titleBn: "কিল্ড ভ্যাকসিন",
      titleEn: "Killed Vaccines",
      descBn:
          "KILLED VACCINE:\n🐓 কিল্ড ভ্যাকসিন (Killed or Inactivated Vaccine in Poultry):\nকিল্ড ভ্যাকসিন হলো এমন ভ্যাকসিন যেখানে ভাইরাস বা ব্যাকটেরিয়াকে সম্পূর্ণভাবে মেরে ফেলা বা নিষ্ক্রিয় (inactivate) করা হয়...",
      descEn:
          "KILLED VACCINE:\n🐓 Inactivated oil-emulsion vaccines provide solid, long-duration antibody titers for mature layers and breeders...",
      imagePath: "assets/killed_vaccine.jpg",
      introBn:
          "KILLED VACCINE:\n\n🐓 কিল্ড ভ্যাকসিন (Killed or Inactivated Vaccine in Poultry):\n\nকিল্ড ভ্যাকসিন হলো এমন ভ্যাকসিন যেখানে ভাইরাস বা ব্যাকটেরিয়াকে সম্পূর্ণভাবে মেরে ফেলা বা নিষ্ক্রিয় (inactivate) করা হয়। এরা আর বংশবৃদ্ধি করতে পারে না, তবে শরীরে ঢুকে রোগ প্রতিরোধ ক্ষমতা তৈরি করে।\n\nকিল্ড ভ্যাকসিন হলো মৃত জীবাণুর ভ্যাকসিন। এটা নিরাপদ, দীর্ঘমেয়াদী সুরক্ষা দেয়, তবে প্রয়োগে বেশি পরিশ্রম ও খরচ লাগে, আর প্রতিরোধ ক্ষমতা ধীরে তৈরি হয়।",
      introEn:
          "KILLED VACCINES:\n\n🐓 Inactivated or killed vaccines contain chemically killed pathogens. They provide high, stable, long-lasting antibody titers without any risk of viral shed.",
      sectionHeaderBn: "🔰 কিল্ড ভ্যাকসিনের বৈশিষ্ট্য, সুবিধা-অসুবিধা ও প্রয়োগবিধি:",
      sectionHeaderEn: "🔰 Killed Vaccine Features, Pros, Cons & Guidelines:",
      sections: [
        VaccineArticleSection(
          titleBn: "১. কিল্ড ভ্যাকসিনের বৈশিষ্ট্য:",
          titleEn: "1. Characteristics of Killed Vaccines:",
          pointsBn: [
            "1. জীবাণু সম্পূর্ণ মৃত থাকে (কোনো ঝুঁকি নেই যে আবার রোগ সৃষ্টি করবে)।",
            "2. শরীরে বংশবৃদ্ধি করতে পারে না।",
            "3. সাধারণত ইনজেকশনের মাধ্যমে দেওয়া হয়।",
            "4. প্রতিরোধ ক্ষমতা তৈরি হতে সময় বেশি লাগে এবং সাধারণত একাধিক ডোজ প্রয়োজন হয়।",
            "5. অনেক সময় অ্যাডজুভেন্ট (adjuvant) মিশিয়ে দেওয়া হয় যাতে ইমিউন প্রতিক্রিয়া বেশি হয়।",
          ],
          pointsEn: [
            "1. Pathogen is completely dead; zero risk of disease outbreak.",
            "2. Cannot replicate inside bird tissue.",
            "3. Administered via parenteral injection.",
            "4. Takes longer to induce peak immunity; multiple doses often required.",
            "5. Formulated with oil-emulsion adjuvants to enhance antibody response.",
          ],
        ),
        VaccineArticleSection(
          titleBn: "২. কিল্ড ভ্যাকসিনের সুবিধা:",
          titleEn: "2. Advantages of Killed Vaccines:",
          pointsBn: [
            "•খুব নিরাপদ, কারণ জীবাণু সম্পূর্ণ মৃত।",
            "•গর্ভবতী পাখি বা ডিম পাড়ার সময়ও দেওয়া যায়।",
            "•দীর্ঘমেয়াদী ইমিউনিটি তৈরি হয়, বিশেষ করে ব্রিডার ও লেয়ার মুরগির জন্য।",
          ],
          pointsEn: [
            "•Extremely safe since microorganisms are inactive.",
            "•Safe to administer during active laying phase.",
            "•Induces long-lasting immunity ideal for layer & breeder flocks.",
          ],
        ),
        VaccineArticleSection(
          titleBn: "৩. কিল্ড ভ্যাকসিনের অসুবিধা:",
          titleEn: "3. Disadvantages of Killed Vaccines:",
          pointsBn: [
            "•তুলনামূলকভাবে খরচ বেশি।",
            "•শুধু ইনজেকশনের মাধ্যমে প্রয়োগ করতে হয় (পরিশ্রম বেশি লাগে)।",
            "•প্রতিরোধ ক্ষমতা তৈরি হতে সময় বেশি লাগে।",
            "•অনেক সময় বুস্টার ডোজ প্রয়োজন হয়।",
          ],
          pointsEn: [
            "•Comparatively higher vaccine cost.",
            "•Labor intensive as each bird requires manual injection.",
            "•Slower initial antibody response development.",
            "•Often requires priming booster doses.",
          ],
        ),
        VaccineArticleSection(
          titleBn: "৪. মুরগির জন্য কিল্ড ভ্যাকসিনের উদাহরণ:",
          titleEn: "4. Examples of Killed Poultry Vaccines:",
          pointsBn: [
            "•নিউক্যাসেল ডিজিজ কিল্ড ভ্যাকসিন (NDV)",
            "•গামবোরো কিল্ড ভ্যাকসিন (IBD)",
            "•ইনফেকশাস ব্রঙ্কাইটিস কিল্ড ভ্যাকসিন (IB)",
            "•এভিয়ান ইনফ্লুয়েঞ্জা কিল্ড ভ্যাকসিন (AI)",
            "•ফাউল কলেরা কিল্ড ভ্যাকসিন",
            "•এগ ড্রপ সিন্ড্রোম (EDS) কিল্ড ভ্যাকসিন",
          ],
          pointsEn: [
            "•Newcastle Disease Killed Vaccine (NDV)",
            "•Gumboro Killed Vaccine (IBD)",
            "•Infectious Bronchitis Killed Vaccine (IB)",
            "•Avian Influenza Killed Vaccine (AI)",
            "•Fowl Cholera Killed Vaccine",
            "•Egg Drop Syndrome (EDS) Killed Vaccine",
          ],
        ),
        VaccineArticleSection(
          titleBn: "৫. কিল্ড ভ্যাকসিন প্রয়োগের নিয়ম:",
          titleEn: "5. Application Rules & Guidelines:",
          pointsBn: [
            "•সাধারণত ইনজেকশন (subcutaneous বা intramuscular) দেওয়া হয়।",
            "•ব্রয়লার মুরগিতে খুব একটা ব্যবহার হয় না, কারণ এদের জীবনকাল ছোট।",
            "•ব্রিডার ও লেয়ার মুরগিতে বেশি ব্যবহার হয়, যাতে ডিম পাড়ার সময় ও তাদের ছানার জন্য প্রতিরোধ ক্ষমতা থাকে।",
            "•ভ্যাকসিন দেওয়ার আগে পাখি সুস্থ আছে কিনা তা নিশ্চিত করতে হবে।",
          ],
          pointsEn: [
            "•Administered via subcutaneous (neck) or intramuscular (breast/thigh) injection.",
            "•Rarely used in broilers due to short commercial lifespan.",
            "•Widely used in layers and breeders for maternal antibody transfer and long-term protection.",
            "•Ensure birds are in prime health prior to injection.",
          ],
        ),
      ],
      summaryTitleBn: "✅ মূল কথা:",
      summaryTitleEn: "✅ Key Takeaway:",
      summaryQuoteBn:
          "কিল্ড ভ্যাকসিন হলো দীর্ঘমেয়াদী প্রতিরক্ষার বিশ্বস্ত ভিত্তি। সঠিকভাবে রুম টেম্পারেচারে এনে ইনজেকশন দিলে লেয়ার ও ব্রিডার ফার্মে সর্বোচ্চ অ্যান্টিবডি লেভেল নিশ্চিত হয়।",
      summaryQuoteEn:
          "Killed vaccines provide a reliable foundation for long-term flock protection when administered at room temperature.",
      summarySubBn: "",
      summarySubEn: "",
    ),

    // -------------------------------------------------------------
    // Article 4: Things To Do During Vaccination (ভ্যাকসিন দেওয়ার সময় করণীয়)
    // -------------------------------------------------------------
    VaccineInfoItem(
      id: "vaccination_dos",
      titleBn: "ভ্যাকসিন দেওয়ার সময় করণীয়",
      titleEn: "Things To Do During Vaccination",
      descBn:
          "DOING DURING VACCINATION (LIVE/KILLED):\n🐓 লাইভ ও কিল্ড ভ্যাকসিন দেওয়ার সময় আবশ্যকীয় করণীয় নিয়মাবলী\nসংরক্ষণ, প্রস্তুতি, প্রয়োগ পদ্ধতি ও ভ্যাকসিনের পরের সতর্কতা...",
      descEn:
          "DOING DURING VACCINATION (LIVE/KILLED):\n🐓 Step-by-step guidelines for storage, preparation, application, and post-vaccination care for Live and Killed vaccines...",
      imagePath: "assets/vaccination_dos.jpg",
      introBn:
          "DOING DURING VACCINATION (LIVE/KILLED):\n\n🐓 পোল্ট্রি ফার্মে লাইভ ও কিল্ড ভ্যাকসিন দেওয়ার সময় সঠিক নিয়মকানুন পালন না করলে টিকাদান ব্যর্থ হতে পারে। নিচে বিস্তারিত করণীয় আলোচনা করা হলো:",
      introEn:
          "DOING DURING VACCINATION (LIVE/KILLED):\n\n🐓 Mandatory step-by-step procedures for storing, preparing, administering, and caring for poultry after Live and Killed vaccinations.",
      sectionHeaderBn: "🔰 ভ্যাকসিনের ধরন অনুযায়ী প্রয়োগ নির্দেশাবলী:",
      sectionHeaderEn: "🔰 Vaccine Type Specific Protocols:",
      sections: [
        VaccineArticleSection(
          titleBn: "🐓 লাইভ ভ্যাকসিন দেওয়ার সময় করণীয়",
          titleEn: "🐓 Live Vaccine Protocol:",
          pointsBn: [
            "✅ সংরক্ষণ:",
            "•২°–৮°C তাপমাত্রায় (কোল্ড চেইন) রাখতে হবে।",
            "•ব্যবহার করার আগে পর্যন্ত বরফের মধ্যে রাখা ভালো।",
            "•খোলার পর সঙ্গে সঙ্গে ব্যবহার করতে হবে।",
            "✅ প্রস্তুতি:",
            "•ভ্যাকসিন মেশানোর জন্য পরিষ্কার ঠান্ডা পানি ব্যবহার করতে হবে।",
            "•পানিতে আগে দুধের গুঁড়া (skim milk powder) মেশালে ভ্যাকসিন বেশি সময় সক্রিয় থাকে।",
            "•প্রয়োগের আগে মুরগিকে ১–২ ঘণ্টা পানি না দিয়ে তৃষ্ণার্ত রাখতে হবে।",
            "✅ প্রয়োগ পদ্ধতি:",
            "•চোখে/নাকে ড্রপ, পানির মাধ্যমে বা স্প্রে করে দেওয়া হয়।",
            "•সব মুরগি যেন একসাথে ভ্যাকসিন পায়, তা নিশ্চিত করতে হবে।",
            "✅ ভ্যাকসিনের পর:",
            "•ভ্যাকসিন দেওয়ার পর ১–২ ঘণ্টা যেন অন্য পানি না পায়।",
            "•প্রয়োগের পর কিছু মৃদু উপসর্গ (কাশি, হাঁচি) হতে পারে, এতে ভয় নেই।",
          ],
          pointsEn: [
            "✅ Storage:",
            "•Maintain 2°-8°C cold chain temperature.",
            "•Keep vials packed in ice until immediately prior to use.",
            "•Use immediately upon opening bottle.",
            "✅ Preparation:",
            "•Use clean, chilled water for mixing.",
            "•Add skimmed milk powder to stabilize virus activity in solution.",
            "•Deprive birds of drinking water for 1-2 hours before giving vaccine.",
            "✅ Application:",
            "•Administer via eye/nasal drop, drinking water, or spray.",
            "•Ensure 100% of birds receive solution simultaneously.",
            "✅ Post-Vaccination Care:",
            "•Withhold un-treated water for 1-2 hours after vaccine.",
            "•Mild coughing or sneezing may occur briefly; no cause for alarm.",
          ],
        ),
        VaccineArticleSection(
          titleBn: "🐓 কিল্ড ভ্যাকসিন দেওয়ার সময় করণীয়",
          titleEn: "🐓 Killed Vaccine Protocol:",
          pointsBn: [
            "✅ সংরক্ষণ:",
            "•২°–৮°C তাপমাত্রায় রাখতে হবে, জমে যাওয়া একদম চলবে না।",
            "•ব্যবহারের আগে ঘরের তাপমাত্রায় কিছুক্ষণ রেখে নিতে হয়।",
            "✅ প্রস্তুতি:",
            "•বোতল ব্যবহার করার আগে ভালোভাবে ঝাঁকাতে হবে (কারণ এতে তেল/অ্যাডজুভেন্ট মেশানো থাকে)।",
            "•জীবাণুমুক্ত সিরিঞ্জ ও সূচ ব্যবহার করতে হবে।",
            "✅ প্রয়োগ পদ্ধতি:",
            "•সাধারণত ইনজেকশনের মাধ্যমে (subcutaneous – গলায় চামড়ার নিচে, বা intramuscular – উরুতে পেশির ভেতরে) দেওয়া হয়।",
            "•প্রতিটি মুরগিকে আলাদা করে ধরতে হবে।",
            "✅ ভ্যাকসিনের পর:",
            "•ইনজেকশনের স্থানে সামান্য ফোলা হতে পারে, ভয় নেই।",
            "•ভ্যাকসিন দেওয়ার পর মুরগি যেন অতিরিক্ত গরম বা ঠান্ডায় না পড়ে।",
            "•ভ্যাকসিনের পর ২–৩ দিন অন্য কোনো ভ্যাকসিন বা ওষুধ না দেওয়া ভালো।",
          ],
          pointsEn: [
            "✅ Storage:",
            "•Maintain 2°-8°C temperature; strictly avoid freezing.",
            "•Warm bottle to room temperature before administration.",
            "✅ Preparation:",
            "•Shake bottle vigorously prior to injection to mix oil emulsion.",
            "•Use sterile needles and syringes exclusively.",
            "✅ Application:",
            "•Administer via subcutaneous (neck skin) or intramuscular (thigh muscle) injection.",
            "•Handle and restrain each bird individually.",
            "✅ Post-Vaccination Care:",
            "•Minor swelling at injection site is normal.",
            "•Protect birds from extreme thermal heat or cold draft stress.",
            "•Avoid giving other medicines or vaccines for 2-3 days post-injection.",
          ],
        ),
        VaccineArticleSection(
          titleBn: "📌 সাধারণ সতর্কতা (লাইভ ও কিল্ড উভয়ের জন্য)",
          titleEn: "📌 General Precautions (For Both Live & Killed):",
          pointsBn: [
            "1. অসুস্থ বা দুর্বল মুরগিকে ভ্যাকসিন দেওয়া যাবে না।",
            "2. ভ্যাকসিন দেওয়ার সময় খামারে পরিচ্ছন্নতা বজায় রাখতে হবে।",
            "3. ভ্যাকসিনের মেয়াদ দেখে নিতে হবে।",
            "4. ভ্যাকসিন খোলার পর ফ্রিজে রেখে পরবর্তীতে ব্যবহার করা যাবে না।",
            "5. ভ্যাকসিন দেওয়ার ৫–৭ দিন আগে বা পরে কোনো ধরনের অ্যান্টিবায়োটিক ব্যবহার না করাই ভালো।",
          ],
          pointsEn: [
            "1. Never vaccinate sick, weak, or diseased birds.",
            "2. Maintain strict farm hygiene and sanitation during vaccination.",
            "3. Always inspect vaccine expiry dates prior to application.",
            "4. Never re-refrigerate opened vials for future usage.",
            "5. Avoid using antibiotics 5-7 days before or after vaccination.",
          ],
        ),
      ],
      summaryTitleBn: "✅ সংক্ষেপে মূল পার্থক্য:",
      summaryTitleEn: "✅ Quick Summary Comparison:",
      summaryQuoteBn:
          "লাইভ ভ্যাকসিন: পানিতে বা ড্রপে দেওয়া হয়, দ্রুত সুরক্ষা দেয়, কিন্তু খুব সতর্কভাবে কোল্ড চেইন ও পরিষ্কার পানির ব্যবস্থা করতে হয়।",
      summaryQuoteEn:
          "Live Vaccine: Administered via water/drops, fast acting, requires strict cold chain and pure water.",
      summarySubBn:
          "কিল্ড ভ্যাকসিন: ইনজেকশনে দেওয়া হয়, নিরাপদ, দীর্ঘমেয়াদী ইমিউনিটি দেয়, তবে বেশি শ্রম ও খরচসাপেক্ষ।",
      summarySubEn:
          "Killed Vaccine: Administered via injection, safe, long-lasting immunity, but labor-intensive.",
    ),

    // -------------------------------------------------------------
    // Article 5: Common Vaccination Mistakes (ভ্যাকসিন দেওয়ার সময় সাধারণ ভুলসমূহ)
    // -------------------------------------------------------------
    VaccineInfoItem(
      id: "vaccination_mistakes",
      titleBn: "ভ্যাকসিন দেওয়ার সময় সাধারণ ভুলসমূহ",
      titleEn: "Common Vaccination Mistakes",
      descBn:
          "COMMON MISTAKE DURING VACCINATION:\n🐓 পোল্ট্রি ফার্মে ভ্যাকসিন ব্যবস্থাপনা (Vaccination Management) সবচেয়ে গুরুত্ব...",
      descEn:
          "COMMON MISTAKE DURING VACCINATION:\n🐓 Critical mistakes in storage, mixing, dosage, and water chlorine that cause vaccine failure...",
      imagePath: "assets/vaccination_mistakes.jpg",
      introBn:
          "COMMON MISTAKE DURING VACCINATION:\n\n🐓 পোল্ট্রি ফার্মে ছোট ছোট ভুল পুরো টিকাদান কর্মসূচিকে ব্যর্থ করে দিতে পারে। নিচে সাধারণ কিন্তু মারাত্মক ভুলগুলো আলোচনা করা হলো যাতে আপনি সচেতন থাকতে পারেন।",
      introEn:
          "COMMON MISTAKE DURING VACCINATION:\n\n🐓 Seemingly minor oversights during vaccine storage, water preparation, and handling lead to total vaccine failure. Learn these common pitfalls to safeguard your farm.",
      sectionHeaderBn: "🔰 টিকাদানে সচরাচর ঘটে যাওয়া মারাত্মক ভুলসমূহ:",
      sectionHeaderEn: "🔰 Critical Errors to Avoid:",
      sections: [
        VaccineArticleSection(
          titleBn: "১. পানি ও কেমিক্যালজনিত ভুল:",
          titleEn: "1. Water & Chemical Mistakes:",
          pointsBn: [
            "•ক্লোরিনযুক্ত ট্যাপের পানি দিয়ে ভ্যাকসিন গোলানো (ক্লোরিন জীবন্ত ভাইরাস মেরে ফেলে)।",
            "•ভ্যাকসিন দেওয়ার পাত্র বা ড্রিঙ্কার জীবাণুনাশক দিয়ে ধোয়ার পর ভালোভাবে না শুকিয়ে ভ্যাকসিন দেওয়া।",
            "•অসময়ে অতিরিক্ত তাপদাহে পানি গরম অবস্থায় ভ্যাকসিন মেশানো।",
          ],
          pointsEn: [
            "•Using chlorinated tap water (Chlorine destroys live vaccine viruses instantly).",
            "•Washing drinkers with chemical disinfectants right before filling vaccine water.",
            "•Mixing live vaccines in hot water during midday heat.",
          ],
        ),
        VaccineArticleSection(
          titleBn: "২. হ্যান্ডলিং ও কোল্ড চেইন ভাঙার ভুল:",
          titleEn: "2. Storage & Handling Errors:",
          pointsBn: [
            "•ফ্রিজ থেকে বের করে খোলা রোদে থার্মোফ্লাস্ক ছাড়া দীর্ঘক্ষণ ফেলে রাখা।",
            "•ভ্যাকসিনের শিশি (Vial) খালি হাতে গরম অবস্থায় ধরা।",
            "•অসুস্থ, গামবোরো বা ককসিডিয়া আক্রান্ত মুরগিতে জোড় করে টিকা দেয়া।",
            "•ভ্যাকসিনের মেয়াদ (Expiry date) চেক না করে ব্যবহার করা।",
          ],
          pointsEn: [
            "•Breaking cold chain by carrying vials without ice packs in hot weather.",
            "•Holding vaccine vials in warm bare hands, raising solution temperature.",
            "•Vaccinating sick flocks already suffering from Gumboro or Coccidiosis.",
            "•Failing to check vaccine expiration dates prior to reconstitution.",
          ],
        ),
      ],
      summaryTitleBn: "⚠️ সতর্কতা:",
      summaryTitleEn: "⚠️ Warning:",
      summaryQuoteBn:
          "ক্লোরিনযুক্ত পানিতে লাইভ ভ্যাকসিন দিলে ১০০% ভাইরাস মারা যায়, ফলে টিকা দেওয়া না দেওয়া সমান কথা।",
      summaryQuoteEn:
          "Chlorinated water destroys 100% of live vaccine viruses. Always neutralize water first!",
      summarySubBn: "",
      summarySubEn: "",
    ),

    // -------------------------------------------------------------
    // Article 6: Key to Vaccination Success (ভ্যাকসিন সফল করার জন্য করণীয়)
    // -------------------------------------------------------------
    VaccineInfoItem(
      id: "vaccination_success",
      titleBn: "ভ্যাকসিন সফল করার জন্য করণীয়",
      titleEn: "Key to Vaccination Success",
      descBn:
          "VACCINATION SUCCESS:\n🐓 মুরগির ভ্যাকসিন সফল করার জন্য করণীয়:\n১. মুরগির স্বাস্থ্য ও অবস্থা নিশ্চিত করা, কোল্ড চেইন, প্রয়োগবিধি, চেকলিস্ট...",
      descEn:
          "VACCINATION SUCCESS:\n🐓 Proactive strategies to guarantee high antibody titers and 100% vaccination success...",
      imagePath: "assets/vaccination_success.jpg",
      introBn:
          "VACCINATION SUCCESS:\n\n🐓 মুরগির ভ্যাকসিন সফল করার জন্য করণীয়:\nভ্যাকসিন প্রয়োগের আগে, চলাকালীন ও পরে কিছু সুনির্দিষ্ট নিয়ম মেনে চললে ভ্যাকসিনের সর্বোচ্চ কার্যকারিতা পাওয়া যায় এবং খামারে ১০০% রোগ প্রতিরোধ ক্ষমতা তৈরি হয়। নিচে বিস্তারিত আলোচনা ও সাক্সেস চেকলিস্ট দেওয়া হলো:",
      introEn:
          "VACCINATION SUCCESS:\n\n🐓 Comprehensive guide and operational checklist to guarantee maximum antibody response and 100% vaccination success for your flock.",
      sectionHeaderBn: "🔰 ভ্যাকসিন সফল করার মূল গাইডলাইন ও চেকলিস্ট:",
      sectionHeaderEn: "🔰 Vaccination Success Guidelines & Checklist:",
      sections: [
        VaccineArticleSection(
          titleBn: "১. মুরগির স্বাস্থ্য ও অবস্থা নিশ্চিত করাঃ",
          titleEn: "1. Flock Health & Condition:",
          pointsBn: [
            "•ভ্যাকসিন দেওয়ার সময় মুরগি সম্পূর্ণ সুস্থ থাকতে হবে।",
            "•অসুস্থ, দুর্বল বা অতিরিক্ত স্ট্রেসে থাকা মুরগিকে ভ্যাকসিন দেওয়া উচিত নয়।",
            "•ভ্যাকসিন দেওয়ার আগে ও পরে স্ট্রেস (transport, heat, overcrowding) এড়িয়ে চলতে হবে।",
          ],
          pointsEn: [
            "•Birds must be completely healthy during vaccination.",
            "•Do NOT vaccinate sick, weak, or stressed birds.",
            "•Avoid transport, heat, and overcrowding stress before and after vaccination.",
          ],
        ),
        VaccineArticleSection(
          titleBn: "২. ভ্যাকসিনের সংরক্ষণ (Cold Chain)ঃ",
          titleEn: "2. Cold Chain Storage Protocol:",
          pointsBn: [
            "•সব ভ্যাকসিন ২°–৮°C তাপমাত্রায় রাখতে হবে।",
            "•বরফের সাথে কুল বক্সে বহন করতে হবে।",
            "•ভ্যাকসিন কখনোই ফ্রিজারে জমে যাবে না।",
            "•ভ্যাকসিন খোলার পর সঙ্গে সঙ্গে ব্যবহার করতে হবে।",
          ],
          pointsEn: [
            "•Store all vaccines strictly at 2°-8°C temperature.",
            "•Transport in insulated cool boxes with ice packs.",
            "•Never allow vaccines to freeze solid.",
            "•Use immediately upon opening bottle.",
          ],
        ),
        VaccineArticleSection(
          titleBn: "৩. ভ্যাকসিন প্রয়োগের সঠিক নিয়মঃ",
          titleEn: "3. Correct Administration Rules:",
          pointsBn: [
            "•লাইভ ভ্যাকসিনঃ",
            " o পরিষ্কার ঠাণ্ডা পানিতে গুঁড়া দুধ (skimmed milk) মিশিয়ে ভ্যাকসিন দিতে হবে।",
            " o ভ্যাকসিন দেওয়ার আগে মুরগিকে ১–২ ঘণ্টা পানি না দিয়ে রাখতে হবে, যাতে তারা তৃষ্ণার্ত হয়।",
            " o ভ্যাকসিন দেওয়ার সময় ৩০–৬০ মিনিটের মধ্যে সব মুরগি যেন পানি/ড্রপ/স্প্রে পায় তা নিশ্চিত করতে হবে।",
            "•কিল্ড ভ্যাকসিনঃ",
            " o বোতল ব্যবহার করার আগে ভালোভাবে ঝাঁকাতে হবে।",
            " o জীবাণুমুক্ত সিরিঞ্জ ও সূচ ব্যবহার করতে হবে।",
            " o গলার চামড়ার নিচে (subcutaneous) অথবা উরুর পেশিতে (intramuscular) ইনজেকশন দিতে হবে।",
          ],
          pointsEn: [
            "•Live Vaccine:",
            " o Mix in clean chilled water with skimmed milk powder stabilizer.",
            " o Deprive birds of water for 1-2 hours beforehand to induce thirst.",
            " o Ensure all birds consume water/drops/spray within 30-60 minutes.",
            "•Killed Vaccine:",
            " o Shake bottle thoroughly prior to administration.",
            " o Use sterilized needle and syringe exclusively.",
            " o Inject subcutaneously (neck skin) or intramuscularly (thigh muscle).",
          ],
        ),
        VaccineArticleSection(
          titleBn: "৪. ভ্যাকসিন দেওয়ার পরিবেশঃ",
          titleEn: "4. Vaccination Environment:",
          pointsBn: [
            "•খামার পরিষ্কার-পরিচ্ছন্ন রাখতে হবে।",
            "•অতিরিক্ত গরম বা ঠাণ্ডার সময় ভ্যাকসিন না দেওয়া ভালো।",
            "•খামারে পর্যাপ্ত বাতাস চলাচল ও আলো-অন্ধকারের সঠিক ব্যবস্থা রাখতে হবে।",
          ],
          pointsEn: [
            "•Maintain clean farm conditions.",
            "•Avoid vaccinating during extreme heat or cold waves.",
            "•Ensure proper airflow, ventilation, and lighting controls.",
          ],
        ),
        VaccineArticleSection(
          titleBn: "৫. ভ্যাকসিন দেওয়ার আগে ও পরে সতর্কতাঃ",
          titleEn: "5. Pre & Post Vaccination Precautions:",
          pointsBn: [
            "•ভ্যাকসিন দেওয়ার আগে বা পরে ৫–৭ দিন অ্যান্টিবায়োটিক ব্যবহার না করা ভালো।",
            "•ভ্যাকসিন দেওয়ার পর মুরগিকে পর্যাপ্ত পানি ও খাবার দিতে হবে।",
            "•প্রয়োজনে ভিটামিন-ইলেক্ট্রোলাইট (যেমন ভিটামিন C, ইলেক্ট্রোলাইট পাউডার) দেওয়া যেতে পারে, এতে স্ট্রেস কমে।",
          ],
          pointsEn: [
            "•Avoid antibiotics 5-7 days before or after vaccination.",
            "•Provide clean drinking water and feed after vaccination.",
            "•Supplement with Vitamin-C and electrolyte powder to reduce stress.",
          ],
        ),
        VaccineArticleSection(
          titleBn: "৬. ভ্যাকসিনের সময়সূচি (Schedule) মেনে চলাঃ",
          titleEn: "6. Adhering to Vaccine Schedule:",
          pointsBn: [
            "•সঠিক বয়সে ভ্যাকসিন না দিলে রোগ প্রতিরোধ ক্ষমতা তৈরি হয় না।",
            "•কোন ভ্যাকসিন কবে দিতে হবে তা আগে থেকেই পরিকল্পনা করতে হবে।",
          ],
          pointsEn: [
            "•Immunity fails if vaccines are delayed beyond recommended age.",
            "•Plan vaccination dates in advance according to breed chart.",
          ],
        ),
        VaccineArticleSection(
          titleBn: "📌 সংক্ষেপে (ভ্যাকসিন সফল করতে হলে):",
          titleEn: "📌 Summary (For Vaccine Success):",
          pointsBn: [
            "👉 ভ্যাকসিন সফল করতে হলেঃ",
            "1. মুরগি সুস্থ থাকতে হবে।",
            "2. কোল্ড চেইন ঠিক রাখতে হবে।",
            "3. সঠিক নিয়মে প্রয়োগ করতে হবে।",
            "4. খামারে পরিচ্ছন্নতা ও কম স্ট্রেস নিশ্চিত করতে হবে।",
            "5. ভ্যাকসিন শিডিউল মেনে চলতে হবে।",
          ],
          pointsEn: [
            "👉 For 100% Vaccination Success:",
            "1. Birds must be healthy.",
            "2. Cold chain must remain intact.",
            "3. Administer via correct technique.",
            "4. Maintain clean, low-stress environment.",
            "5. Follow vaccination schedule strictly.",
          ],
        ),
        VaccineArticleSection(
          titleBn: "✅ ভ্যাকসিন সাক্সেস চেকলিস্ট (মুরগির জন্য):",
          titleEn: "✅ Vaccination Success Checklist:",
          pointsBn: [
            "🐥 ভ্যাকসিন দেওয়ার আগেঃ",
            "•মুরগি সুস্থ আছে কিনা চেক করা",
            "•খামার পরিষ্কার রাখা",
            "•ভ্যাকসিন সঠিক তাপমাত্রায় (২°–৮°C) সংরক্ষিত আছে কিনা দেখা",
            "•পর্যাপ্ত ঠাণ্ডা পানি ও দুধের গুঁড়া (লাইভ ভ্যাকসিনের জন্য) প্রস্তুত রাখা",
            "•সিরিঞ্জ/ড্রপার/স্প্রে মেশিন পরিষ্কার আছে কিনা দেখা",
            "•মুরগিকে ১–২ ঘণ্টা পানি না দিয়ে রাখা (লাইভ ভ্যাকসিন হলে)",
            "💉 ভ্যাকসিন দেওয়ার সময়ঃ",
            "•ভ্যাকসিন খোলার সাথে সাথে ব্যবহার শুরু করা",
            "•ভ্যাকসিন ভালোভাবে মিশিয়ে দেওয়া (কিল্ড হলে বোতল ঝাঁকানো, লাইভ হলে দুধের পানিতে মেশানো)",
            "•সব মুরগি সমানভাবে ভ্যাকসিন পাচ্ছে কিনা নিশ্চিত করা",
            "•লাইভ ভ্যাকসিন ৩০–৬০ মিনিটের মধ্যে শেষ করা",
            "•কিল্ড ভ্যাকসিন জীবাণুমুক্ত সিরিঞ্জ দিয়ে সঠিক স্থানে ইনজেকশন দেওয়া",
            "🐓 ভ্যাকসিন দেওয়ার পরেঃ",
            "•মুরগিকে পর্যাপ্ত পানি ও খাবার দেওয়া",
            "•৫–৭ দিন কোনো অ্যান্টিবায়োটিক না দেওয়া",
            "•প্রয়োজনে ভিটামিন ও ইলেক্ট্রোলাইট দেওয়া",
            "•অতিরিক্ত ঠাণ্ডা/গরম/স্ট্রেস থেকে বাঁচানো",
            "•মুরগির মধ্যে কোনো অস্বাভাবিক প্রতিক্রিয়া হচ্ছে কিনা পর্যবেক্ষণ করা",
          ],
          pointsEn: [
            "🐥 Before Vaccination:",
            "•Verify overall bird health & fitness",
            "•Clean and sanitize farm area",
            "•Confirm 2°-8°C vaccine cold chain storage",
            "•Prepare chilled water & skimmed milk powder (for live vaccines)",
            "•Check syringe/dropper/spray equipment cleanliness",
            "•Deprive birds of water for 1-2 hours (for live vaccines)",
            "💉 During Vaccination:",
            "•Begin administration immediately upon opening bottle",
            "•Mix vaccine thoroughly (Shake killed bottle, mix live with milk water)",
            "•Ensure equal vaccine access across the flock",
            "•Finish live vaccine solution within 30-60 minutes",
            "•Inject killed vaccine into precise site using sterile needle",
            "🐓 After Vaccination:",
            "•Provide abundant clean water and feed",
            "•Avoid antibiotics for 5-7 days post-vaccine",
            "•Supplement with anti-stress vitamins & electrolytes",
            "•Shield flock from thermal heat/cold stress",
            "•Monitor flock for adverse post-vaccine reactions",
          ],
        ),
      ],
      summaryTitleBn: "✅ মূলকথা:",
      summaryTitleEn: "✅ Golden Principle:",
      summaryQuoteBn:
          "সুস্থ মুরগি + অক্ষত কোল্ড চেইন + সঠিক প্রয়োগ + সাক্সেস চেকলিস্ট অনুসরণ = ১০০% রোগ প্রতিরোধ ক্ষমতা!",
      summaryQuoteEn:
          "Healthy flock + Intact cold chain + Precise administration + Checklist adherence = 100% Success!",
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
          isEnglish ? "Vaccine Information" : "ভ্যাকসিন সম্পর্কিত",
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
          return _buildVaccineCard(context, item);
        },
      ),
    );
  }

  Widget _buildVaccineCard(BuildContext context, VaccineInfoItem item) {
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
              builder: (_) => VaccineArticleDetailScreen(
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
                        Icons.vaccines_outlined,
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
// Vaccine Article Detail Screen (Matches User's Screenshots & Farm Management)
// ============================================================================
class VaccineArticleDetailScreen extends StatelessWidget {
  final VaccineInfoItem item;
  final bool isEnglish;

  const VaccineArticleDetailScreen({
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
                      Icons.vaccines_outlined,
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

                  // Section Header Title (e.g. 🔰 ভ্যাকসিন সফল করার মূল গাইডলাইন ও চেকলিস্ট:)
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
                                      secTitle.startsWith("✅")
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
                              pt.startsWith("🐥") ||
                              pt.startsWith("💉") ||
                              pt.startsWith("🐓");
                          final isNumbered = RegExp(r'^\d+\.').hasMatch(pt);
                          final isSubBullet = pt.trim().startsWith("o");
                          final isHeaderLine = !pt.startsWith("•") &&
                              !isSubBullet &&
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
                          } else if (isSubBullet) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 4, left: 16, right: 4),
                              child: Text(
                                pt,
                                style: TextStyle(
                                  fontSize: 13.5,
                                  color: Colors.grey.shade900,
                                  height: 1.4,
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
