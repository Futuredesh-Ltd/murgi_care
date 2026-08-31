import 'package:flutter/material.dart';

class ManagementArticleSection {
  final String titleBn;
  final String titleEn;
  final List<String> pointsBn;
  final List<String> pointsEn;

  ManagementArticleSection({
    required this.titleBn,
    required this.titleEn,
    required this.pointsBn,
    required this.pointsEn,
  });
}

class FarmManagementItem {
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
  final List<ManagementArticleSection> sections;
  final String summaryTitleBn;
  final String summaryTitleEn;
  final String summaryQuoteBn;
  final String summaryQuoteEn;
  final String summarySubBn;
  final String summarySubEn;

  FarmManagementItem({
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

class FarmManagementScreen extends StatelessWidget {
  final bool isEnglish;

  const FarmManagementScreen({super.key, required this.isEnglish});

  static final List<FarmManagementItem> _items = [
    // -------------------------------------------------------------
    // Article 1: Biosecurity (খামারের জৈব নিরাপত্তা)
    // -------------------------------------------------------------
    FarmManagementItem(
      id: "biosecurity",
      titleBn: "খামারের জৈব নিরাপত্তা",
      titleEn: "Farm Biosecurity",
      descBn:
          "খামারের জৈব নিরাপত্তা: ফার্মের বায়োসিকিউরিটি (Biosecurity) আসলে পোল্ট্রি ফার্মের “জীবন বাঁচানোর ঢাল”। যত ভালো বায়োসিকিউরিটি মানা যায়, তত কম রোগ হয়,...",
      descEn:
          "Farm Biosecurity is the life-saving shield for poultry farming. Strict biosecurity prevents disease, boosts production, and reduces medicine costs...",
      imagePath: "assets/biosecurity.jpg",
      introBn:
          "ফার্মের বায়োসিকিউরিটি (Biosecurity) আসলে পোল্ট্রি ফার্মের “জীবন বাঁচানোর ঢাল”। যত ভালো বায়োসিকিউরিটি মানা যায়, তত কম রোগ হয়, উৎপাদন বাড়ে এবং অপ্রয়োজনীয় ওষুধ-ভ্যাকসিনের খরচও কমে। এবার আরও বিস্তারিতভাবে ধাপে ধাপে ব্যাখ্যা দিচ্ছি।",
      introEn:
          "Farm Biosecurity is essentially the life-saving shield of a poultry farm. The better the biosecurity, the fewer the disease outbreaks, the higher the yield, and the lower the expenses on unnecessary medicines and vaccines. Here is a step-by-step detailed breakdown.",
      sectionHeaderBn: "🔰 বায়োসিকিউরিটির বিস্তারিত আলোচনা:",
      sectionHeaderEn: "🔰 Detailed Discussion on Biosecurity:",
      sections: [
        ManagementArticleSection(
          titleBn: "১. ফার্ম ডিজাইন ও লোকেশন:",
          titleEn: "1. Farm Design & Location:",
          pointsBn: [
            "•ফার্ম যেন জনবসতি, হাট-বাজার, হাসপাতাল, অন্য ফার্ম থেকে দূরে হয়।",
            "•চারদিকে বেড়া দেওয়া (Boundary fencing) বাধ্যতামূলক।",
            "•ফার্মে প্রবেশের একটিমাত্র মূল গেট থাকবে।",
            "•ফার্মের ভেতরে গাছপালা থাকলেও অতিরিক্ত ঝোপঝাড় যেন না থাকে, কারণ এগুলোতে ইঁদুর, সাপ, মশা-বাহিত প্যাথোজেন লুকায়।",
          ],
          pointsEn: [
            "•Keep the farm far from residential areas, markets, hospitals, and other farms.",
            "•Boundary fencing around the farm perimeter is mandatory.",
            "•Maintain only one main entrance gate for strict access monitoring.",
            "•Avoid dense bushes inside farm premises as they shelter rodents, snakes, and mosquito-borne pathogens.",
          ],
        ),
        ManagementArticleSection(
          titleBn: "২. প্রবেশ নিয়ন্ত্রণ:",
          titleEn: "2. Access Control:",
          pointsBn: [
            "•প্রবেশপথে ডিসইনফেকশন ট্রে বা ফুট ডিপিং পিট থাকতে হবে, যাতে ব্লিচিং পাউডার/ফরমালিন মিশ্রিত পানি থাকে।",
            "•যে কেউ ঢুকবে, তাকে অবশ্যই বুট, কোট, হেড কভার পরিবর্তন করতে হবে।",
            "•বাইরের লোক (ক্রেতা, প্রতিবেশী, ড্রাইভার ইত্যাদি) ফার্মে প্রবেশ না করতে দেওয়া।",
            "•গাড়ির চাকা জীবাণুমুক্ত করা জরুরি, কারণ ফিড ট্রাক বা অন্য যানবাহন থেকে রোগজীবাণু আসতে পারে।",
          ],
          pointsEn: [
            "•Install a disinfection foot-dip bath containing bleaching powder/formalin solution at entrance.",
            "•Anyone entering must change into farm boots, coat, and head cover.",
            "•Restrict unauthorized entry of outsiders (buyers, neighbors, drivers, etc.).",
            "•Sanitize vehicle tires at the gate to prevent disease transmission via feed trucks or transport.",
          ],
        ),
        ManagementArticleSection(
          titleBn: "৩. খাদ্য ও পানির নিরাপত্তা:",
          titleEn: "3. Feed & Water Safety:",
          pointsBn: [
            "•খাদ্য (Feed) অবশ্যই নির্ভরযোগ্য কোম্পানি থেকে কিনতে হবে।",
            "•ফিড স্টোর রুমে ইঁদুর, পাখি, বিড়াল-কুকুর ঢুকতে না পারে।",
            "•পানি ফার্মে আসার আগে ক্লোরিনেশন বা পটাশ অ্যালাম দিয়ে জীবাণুমুক্ত করতে হবে।",
            "•প্রতিদিন ড্রিঙ্কার পরিষ্কার করতে হবে।",
          ],
          pointsEn: [
            "•Procure poultry feed exclusively from trusted, reliable manufacturers.",
            "•Seal feed storage rooms to prevent access by rodents, birds, cats, or dogs.",
            "•Treat drinking water with chlorination or alum before supplying to birds.",
            "•Clean and sanitize drinkers daily.",
          ],
        ),
        ManagementArticleSection(
          titleBn: "৪. পাখি ও কীটপতঙ্গ নিয়ন্ত্রণ:",
          titleEn: "4. Wild Bird & Pest Control:",
          pointsBn: [
            "•শেডে বন্যপাখি ঢুকতে না পারে – এজন্য ছাদ, জানালা ও ভেন্টে নেট ব্যবহার করতে হবে।",
            "•ইঁদুর নিয়ন্ত্রণের জন্য ট্র্যাপ ও রডেন্টিসাইড ব্যবহার করতে হবে।",
            "•মাছি-মশা নিয়ন্ত্রণের জন্য নিয়মিত স্প্রে বা বায়োলজিক্যাল কন্ট্রোল ব্যবহার করতে হবে।",
          ],
          pointsEn: [
            "•Install mesh wire on roofs, windows, and vents to exclude wild birds.",
            "•Use traps and rodenticides for effective rat control.",
            "•Use regular disinfectant sprays or biological controls for flies and mosquitoes.",
          ],
        ),
        ManagementArticleSection(
          titleBn: "৫. শেড ম্যানেজমেন্ট:",
          titleEn: "5. Shed Management:",
          pointsBn: [
            "•All-in All-out system মেনে চলতে হবে।",
            " o একই বয়সের মুরগি এক শেডে থাকবে।",
            " o এক ব্যাচ বিক্রি হলে শেড ফাঁকা করে জীবাণুমুক্ত করার পর নতুন ব্যাচ ঢুকাতে হবে।",
            "•লিটার শুকনো রাখতে হবে; ভিজে গেলে সাথে সাথে পরিবর্তন করতে হবে।",
            "•শেডে ভেন্টিলেশন থাকতে হবে, যাতে গ্যাস জমে না থাকে।",
            "•নিয়মিত ডিসইনফেকশন স্প্রে করতে হবে (কোয়াটারনারি অ্যামোনিয়াম, গ্লুট্যারালডিহাইড, ফরমালিন ইত্যাদি)।",
          ],
          pointsEn: [
            "•Strictly practice the 'All-in All-out' management system.",
            " o Keep birds of the same age group in one shed.",
            " o Vacate, clean, and sanitize the shed completely before placing a new batch.",
            "•Keep litter dry; replace wet litter spots immediately.",
            "•Ensure proper cross ventilation to prevent toxic ammonia gas build-up.",
            "•Periodically spray approved disinfectants (Quaternary ammonium, Glutaraldehyde, Formalin, etc.).",
          ],
        ),
        ManagementArticleSection(
          titleBn: "৬. অসুস্থ ও মৃত মুরগির ব্যবস্থাপনা:",
          titleEn: "6. Sick & Dead Bird Management:",
          pointsBn: [
            "•অসুস্থ মুরগি আলাদা খোপে (Isolation pen) রাখতে হবে।",
            "•মৃত মুরগি দ্রুত পুঁতে ফেলা বা ইনসিনারেটরে পোড়ানো উচিত।",
            "•মৃতদেহ বাইরে ফেলে রাখা যাবে না, এতে রোগ ছড়ায়।",
          ],
          pointsEn: [
            "•Isolate sick birds immediately in a dedicated isolation pen.",
            "•Promptly bury dead birds in deep pits or incinerate them.",
            "•Never leave bird carcasses exposed outdoors as it spreads infection.",
          ],
        ),
        ManagementArticleSection(
          titleBn: "৭. মানবসম্পদ ব্যবস্থাপনা:",
          titleEn: "7. Human Resource & Health Hygiene:",
          pointsBn: [
            "•কর্মচারীদের জন্য আলাদা ওয়ার্ক ক্লোথস, বুট, মাস্ক থাকতে হবে।",
            "•প্রতিদিন কাজের আগে ও পরে হাত-পা ধোয়া ও স্যানিটাইজার ব্যবহার করতে হবে।",
            "•কর্মীদের স্বাস্থ্য পরীক্ষা নিয়মিত করতে হবে (যাতে কোনো রোগ থেকে পাখির মধ্যে না ছড়ায়)।",
            "•কাজের রুটিন: প্রথমে বাচ্চার খোপ → মাঝ বয়সের খোপ → প্রাপ্তবয়স্ক খোপ → অসুস্থ খোপ (সবশেষে)",
          ],
          pointsEn: [
            "•Provide dedicated work clothes, boots, and masks for farm workers.",
            "•Workers must wash hands/feet and sanitize before and after work.",
            "•Conduct regular health checks for staff to prevent zoonotic transmission.",
            "•Daily work sequence: Chick shed → Grower shed → Adult shed → Isolation pen (last).",
          ],
        ),
        ManagementArticleSection(
          titleBn: "৮. ভ্যাকসিন ও ওষুধ ব্যবস্থাপনা:",
          titleEn: "8. Vaccine & Medication Management:",
          pointsBn: [
            "•ভ্যাকসিন অবশ্যই কোল্ড চেইন মেনে সংরক্ষণ করতে হবে (২-৮° সেলসিয়াস)।",
            "•নির্দিষ্ট সময়ে ভ্যাকসিন দিতে হবে (ভ্যাকসিন সিডিউল অনুযায়ী)।",
            "•ডাক্তার ছাড়া অযথা অ্যান্টিবায়োটিক ব্যবহার করা যাবে না।",
          ],
          pointsEn: [
            "•Store vaccines strictly under cold chain conditions (2-8°C).",
            "•Administer vaccines on schedule according to expert vaccination guidelines.",
            "•Never misuse antibiotics without a qualified veterinarian's prescription.",
          ],
        ),
        ManagementArticleSection(
          titleBn: "৯. ফার্ম রেকর্ড কিপিং:",
          titleEn: "9. Farm Record Keeping:",
          pointsBn: [
            "•দৈনিক খাদ্য খরচ, পানি গ্রহণ, ডিম উৎপাদন/বৃদ্ধির হার, মৃত্যুহার সব নথিভুক্ত করতে হবে।",
            "•কোন ভ্যাকসিন কবে দেওয়া হলো, কোন ওষুধ কবে ব্যবহার হলো – লিখে রাখা জরুরি।",
          ],
          pointsEn: [
            "•Record daily feed intake, water usage, growth rate/egg production, and mortality.",
            "•Maintain logs for vaccination dates, medicines, and dosage history.",
          ],
        ),
        ManagementArticleSection(
          titleBn: "১০. পরিষ্কার-পরিচ্ছন্নতা ও ডাউন টাইম:",
          titleEn: "10. Cleaning & Downtime:",
          pointsBn: [
            "•একটি ব্যাচ শেষ হওয়ার পর অন্তত ২-৩ সপ্তাহ শেড খালি রাখা দরকার, যাতে জীবাণু নষ্ট হয়।",
            "•খালি শেডে:",
            " o লিটার ফেলে দেওয়া",
            " o মেঝে ও দেয়াল জীবাণুনাশক দিয়ে ধোয়া",
            " o চুন ছিটানো",
            " o একবার ফরমালিন ফিউমিগেশন করা",
          ],
          pointsEn: [
            "•Allow at least 2-3 weeks of downtime between batches to kill pathogens.",
            "•In the vacant shed:",
            " o Remove and dispose of old litter",
            " o Wash floors and walls with disinfectant detergent",
            " o Apply lime wash on walls and floor",
            " o Perform formalin fumigation prior to chick arrival",
          ],
        ),
      ],
      summaryTitleBn: "📌 সংক্ষেপে নিয়মগুলোকে বলা হয়:",
      summaryTitleEn: "📌 In summary, the core biosecurity golden rules are:",
      summaryQuoteBn: '"Don’t bring it, Don’t spread it, Don’t keep it"',
      summaryQuoteEn: '"Don’t bring it, Don’t spread it, Don’t keep it"',
      summarySubBn: "(রোগ ফার্মে ঢুকতে দেবে না, ছড়াতে দেবে না, টিকে থাকতে দেবে না)",
      summarySubEn: "(Don't let disease enter the farm, don't let it spread, don't let it persist)",
    ),

    // -------------------------------------------------------------
    // Article 2: Shed Cleaning & Disinfection (শেড পরিষ্কার এবং জীবাণুমুক্তকরণ)
    // -------------------------------------------------------------
    FarmManagementItem(
      id: "shed_cleaning",
      titleBn: "শেড পরিষ্কার এবং জীবাণুমুক্তকরণ",
      titleEn: "Shed Cleaning & Disinfection",
      descBn:
          "শেড পরিষ্কার ও জীবাণুমুক্তকরণ: শেড পরিষ্কার ও জীবাণুমুক্তকরণ (Cleaning & Disinfection – C&D) হলো ফার্মের বায়োসিকিউরিটির সবচেয়ে গুরুত্বপূর্ণ ধাপ। য...",
      descEn:
          "Shed Cleaning & Disinfection (C&D) is a vital step in farm biosecurity. Deep clean and sanitize before introducing new chick batches...",
      imagePath: "assets/shed_cleaning.jpg",
      introBn:
          "শেড পরিষ্কার ও জীবাণুমুক্তকরণ (Cleaning & Disinfection – C&D) হলো ফার্মের বায়োসিকিউরিটির সবচেয়ে গুরুত্বপূর্ণ ধাপ। যদি শেড সঠিকভাবে পরিষ্কার ও জীবাণুমুক্ত না করা হয়, তাহলে পুরনো ব্যাচের রোগজীবাণু (ভাইরাস, ব্যাকটেরিয়া, ককসিডিয়া, ছত্রাক ইত্যাদি) নতুন ব্যাচের বাচ্চায় রোগ ছড়াতে পারে।",
      introEn:
          "Cleaning & Disinfection (C&D) is the most critical step in farm biosecurity. Failure to sanitize properly allows pathogens (viruses, bacteria, coccidia, fungi) from previous flocks to infect new chick batches.",
      sectionHeaderBn: "🔰 শেড পরিষ্কার ও জীবাণুমুক্তকরণ ধাপ:",
      sectionHeaderEn: "🔰 Shed Cleaning & Disinfection Steps:",
      sections: [
        ManagementArticleSection(
          titleBn: "১. বাচ্চা/পাখি বের করার পরপরই:",
          titleEn: "1. Immediately After Depopulation:",
          pointsBn: [
            "•সব মুরগি/হাঁস বিক্রি বা স্থানান্তর করতে হবে।",
            "•সব খাবার (Feed), পানি, লিটার, ডিম, যন্ত্রপাতি সরিয়ে ফেলতে হবে।",
            "•মৃত বা অসুস্থ পাখি থাকলে তা সঠিকভাবে (পুঁতে ফেলা বা পোড়ানো) নিষ্পত্তি করতে হবে।",
          ],
          pointsEn: [
            "•Sell or transfer all old birds/chicks from the shed.",
            "•Remove all remaining feed, water, litter, eggs, and equipment.",
            "•Safely dispose of dead or sick birds by burial or burning.",
          ],
        ),
        ManagementArticleSection(
          titleBn: "২. শুকনো পরিষ্কার (Dry Cleaning):",
          titleEn: "2. Dry Cleaning:",
          pointsBn: [
            "•লিটার/বিছানা সম্পূর্ণ বের করে ফেলতে হবে।",
            "•ফিডার, ড্রিঙ্কার, পাইপ, ভেন্টিলেটর, ফ্যান, জানালা – সব শুকনো ময়লা ঝেড়ে পরিষ্কার করতে হবে।",
            "•ধুলো, পালক, মল যেন কোথাও না থাকে।",
          ],
          pointsEn: [
            "•Completely remove all litter/bedding materials from the floor.",
            "•Sweep off dry dirt from feeders, drinkers, pipes, ventilators, fans, and windows.",
            "•Ensure no dust, feathers, or dried manure remain anywhere.",
          ],
        ),
        ManagementArticleSection(
          titleBn: "৩. ভিজা পরিষ্কার (Wet Cleaning):",
          titleEn: "3. Wet Cleaning:",
          pointsBn: [
            "•মেঝে, দেয়াল, ছাদ, যন্ত্রপাতি পরিষ্কার পানিতে ভালোভাবে ধুতে হবে।",
            "•গরম পানি ব্যবহার করলে চর্বি ও মল ভালোভাবে দূর হবে।",
            "•ডিটারজেন্ট বা সাবান জাতীয় ক্লিনার ব্যবহার করা যেতে পারে, যাতে জমে থাকা মল, চর্বি, ফিড কণা ভেঙে যায়।",
            "•পরিষ্কারের সময় উপরে থেকে নিচে, ভেতর থেকে বাইরে নিয়ম মেনে ধুতে হবে।",
          ],
          pointsEn: [
            "•Wash floors, walls, roof, and equipment thoroughly with clean water.",
            "•Using hot water effectively breaks down grease and dried manure.",
            "•Use detergent or soap cleaners to dissolve organic residues and feed particles.",
            "•Follow washing direction from top to bottom, inside to outside.",
          ],
        ),
        ManagementArticleSection(
          titleBn: "৪. জীবাণুনাশক প্রয়োগ (Disinfection):",
          titleEn: "4. Disinfection Application:",
          pointsBn: [
            "সাধারণত ব্যবহৃত জীবাণুনাশক:",
            "•Formalin (Formaldehyde 2–3%) → খুব কার্যকর, তবে ব্যবহার ঝুঁকিপূর্ণ (মাস্ক/হাতমোজা দরকার)।",
            "•Bleaching Powder (ক্যালসিয়াম হাইপোক্লোরাইট 2–4%) → সস্তা ও কার্যকর।",
            "•Potassium Permanganate + Formalin → ফিউমিগেশনে ব্যবহৃত হয়।",
            "•Quaternary Ammonium Compounds (QACs) → নিরাপদ, নিয়মিত ব্যবহারযোগ্য।",
            "•Glutaraldehyde + QAC মিশ্রণ → ভাইরাস ও ব্যাকটেরিয়া দুটোর বিরুদ্ধেই ভালো কাজ করে।",
            "👉 জীবাণুনাশক স্প্রে করার সময়:",
            "•মেঝে, দেয়াল, খুঁটি, ফ্যান, ছাদ, কোণ সব ভিজে যাওয়া পর্যন্ত স্প্রে করতে হবে।",
            "•ফিডার-ড্রিঙ্কার আলাদা করে ৩০ মিনিট জীবাণুনাশক দ্রবণে ভিজিয়ে রাখতে হবে।",
            "•কমপক্ষে ২–৩ বার জীবাণুনাশক ব্যবহার করতে হবে, প্রতি ৩–৪ দিন পরপর।",
          ],
          pointsEn: [
            "Commonly Used Disinfectants:",
            "•Formalin (Formaldehyde 2–3%) → Highly effective, but handle with PPE mask & gloves.",
            "•Bleaching Powder (Calcium Hypochlorite 2–4%) → Economical and effective.",
            "•Potassium Permanganate + Formalin → Used for fumigation.",
            "•Quaternary Ammonium Compounds (QACs) → Safe for regular usage.",
            "•Glutaraldehyde + QAC Combination → Excellent against both viruses & bacteria.",
            "👉 Key Precautions during Spraying:",
            "•Thoroughly drench floors, walls, pillars, fans, roofs, and corners.",
            "•Soak feeders & drinkers separately in disinfectant solution for 30 minutes.",
            "•Apply disinfectant 2-3 times at intervals of 3-4 days.",
          ],
        ),
        ManagementArticleSection(
          titleBn: "৫. ফিউমিগেশন (Fumigation):",
          titleEn: "5. Fumigation:",
          pointsBn: [
            "শেড সম্পূর্ণ শুকানোর পর ফরমালিন + পটাশ (KMnO₄) দিয়ে ফিউমিগেশন করা যায়।",
            "👉 স্ট্যান্ডার্ড রেশিও:",
            "•Formalin (40%) – 35 মি.লি.",
            "•Potassium Permanganate (KMnO₄) – 17.5 গ্রাম",
            "•পানি – 500 মি.লি.",
            "(প্রতি ১ ঘনমিটার শেড স্পেসের জন্য)",
            "পদ্ধতি:",
            "•সব জানালা-দরজা বন্ধ করে দিতে হবে।",
            "•মিশ্রণটা মাটির পাত্রে নিয়ে শেডের মধ্যে রাখতে হবে।",
            "•১২–২৪ ঘণ্টা শেড বন্ধ থাকবে।",
            "•পরে সব জানালা খুলে বাতাস চলাচল করতে দিতে হবে।",
          ],
          pointsEn: [
            "After complete drying, perform fumigation using Formalin + Potassium Permanganate (KMnO₄).",
            "👉 Standard Ratio:",
            "•Formalin (40%) – 35 ml",
            "•Potassium Permanganate (KMnO₄) – 17.5 g",
            "•Water – 500 ml",
            "(Per 1 cubic meter of shed space)",
            "Procedure:",
            "•Seal all doors and windows completely.",
            "•Place the chemical mixture inside earthen pots inside the shed.",
            "•Keep shed sealed shut for 12-24 hours.",
            "•Afterward, open windows to ventilate fumes.",
          ],
        ),
        ManagementArticleSection(
          titleBn: "৬. শুকানো (Drying & Downtime):",
          titleEn: "6. Drying & Downtime:",
          pointsBn: [
            "•শেড কমপক্ষে ১০–১৪ দিন খালি রাখতে হবে (ডাউন টাইম)।",
            "•এই সময়ে সূর্যের আলো ও বাতাস চলাচল জীবাণু ধ্বংসে সহায়তা করে।",
            "•প্রয়োজনে মেঝেতে চুন (Lime powder) ছিটিয়ে দেওয়া যেতে পারে।",
          ],
          pointsEn: [
            "•Allow at least 10-14 days of downtime with the shed vacant.",
            "•Natural sunlight and air cross-ventilation kill remaining micro-organisms.",
            "•Optionally dust agricultural lime powder across the concrete floor.",
          ],
        ),
        ManagementArticleSection(
          titleBn: "৭. চূড়ান্ত প্রস্তুতি:",
          titleEn: "7. Final Preparation:",
          pointsBn: [
            "•নতুন বাচ্চা আনার ১–২ দিন আগে আবার হালকা জীবাণুনাশক স্প্রে করতে হবে।",
            "•ফিডার, ড্রিঙ্কার আবার পরিষ্কার পানি দিয়ে ধুতে হবে।",
            "•তারপরেই শেডে নতুন লিটার বিছানো ও তাপ/আলো/পানি/ফিড প্রস্তুত করা যাবে।",
          ],
          pointsEn: [
            "•Re-spray a light disinfectant layer 1-2 days before chick arrival.",
            "•Rinse feeders and drinkers again with clean drinking water.",
            "•Proceed to spread fresh litter and setup brooder heating, lights, water, and feed.",
          ],
        ),
      ],
      summaryTitleBn: "✅ মূলকথা:",
      summaryTitleEn: "✅ Key Takeaway:",
      summaryQuoteBn:
          "শেড পরিষ্কার ও জীবাণুমুক্তকরণ মানে শুধু ময়লা সরানো নয়, বরং রোগজীবাণুর সব উৎস ধ্বংস করা।",
      summaryQuoteEn:
          "Shed cleaning & disinfection means eliminating all pathogen sources, not just removing dirt.",
      summarySubBn:
          "নিয়মিত ও সঠিকভাবে করলে নিউক্যাসল, গামবোরো, ককসিডিওসিস, স্যালমোনেলা, কলেরাও – এসব রোগ অনেকটাই নিয়ন্ত্রণে থাকে।",
      summarySubEn:
          "Strict adherence prevents major outbreaks of Newcastle, Gumboro, Coccidiosis, Salmonella, and Fowl Cholera.",
    ),

    // -------------------------------------------------------------
    // Article 3: Fumigation & Brooding Setup (শেড ফিউমিগেশন এবং ব্রুডিং হাউস তৈরি)
    // -------------------------------------------------------------
    FarmManagementItem(
      id: "fumigation_brooding",
      titleBn: "শেড ফিউমিগেশন এবং ব্রুডিং হাউস তৈরি",
      titleEn: "Shed Fumigation & Brooding Setup",
      descBn:
          "শেড ফিউমিগেশন এবং ব্রুডিং হাউস তৈরি: বাচ্চা পালনের শেড (Brooding House) ভালোভাবে প্রস্তুত করা এবং ফিউমিগেশন করা—এটা সফল ব্রুডিং এর সবচেয়ে গুরুত্বপূর্ণ ধা...",
      descEn:
          "Preparing and fumigating the Brooding House is the vital first step for successful early chick development and flock success...",
      imagePath: "assets/fumigation_brooding.jpg",
      introBn:
          "বাচ্চা পালনের শেড (Brooding House) ভালোভাবে প্রস্তুত করা এবং ফিউমিগেশন করা—এটা সফল ব্রুডিং এর সবচেয়ে গুরুত্বপূর্ণ ধাপ। যদি শেড প্রস্তুত ঠিকমতো না হয়, তাহলে বাচ্চারা ঠান্ডা/গরমে কষ্ট পায়, রোগজীবাণুতে আক্রান্ত হয়, এবং মৃত্যুহার বেড়ে যায়।",
      introEn:
          "Preparing and fumigating the Brooding House is the cornerstone of brooding success. Inadequate preparation leads to environmental stress, disease outbreaks, and high chick mortality.",
      sectionHeaderBn: "🔰 শেড ফিউমিগেশন ও ব্রুডিং হাউস প্রস্তুতকরণ ধাপ:",
      sectionHeaderEn: "🔰 Steps for Shed Fumigation & Brooding Setup:",
      sections: [
        ManagementArticleSection(
          titleBn: "১. পুরনো শেড খালি ও পরিষ্কার করা:",
          titleEn: "1. Vacating & Cleaning Old Shed:",
          pointsBn: [
            "•পুরনো ব্যাচের সব পাখি, ফিড, লিটার, ফিডার, ড্রিঙ্কার সরিয়ে ফেলুন।",
            "•মেঝে, দেয়াল, ছাদ সব ময়লা, পালক, ধুলো ঝাড়ুন।",
            "•পুরনো লিটার বের করে ফেলুন এবং সঠিকভাবে ফেলে দিন।",
          ],
          pointsEn: [
            "•Remove all old birds, feed, litter, feeders, and drinkers.",
            "•Sweep off dust, feathers, and cobwebs from floor, walls, and ceiling.",
            "•Dispose of old litter properly at a safe distance.",
          ],
        ),
        ManagementArticleSection(
          titleBn: "২. শেড ধোয়া ও জীবাণুমুক্ত করা:",
          titleEn: "2. Washing & Sanitizing Shed:",
          pointsBn: [
            "•মেঝে ও দেয়াল গরম পানি ও ডিটারজেন্ট/সাবান দিয়ে ভালোভাবে ধুতে হবে।",
            "•এরপর ব্লিচিং পাউডার/ফরমালিন/গ্লুট্যারালডিহাইড জাতীয় স্প্রে করে ১-২ দিন শুকিয়ে নিন।",
          ],
          pointsEn: [
            "•Wash floors and walls thoroughly with hot water and detergent.",
            "•Spray bleaching powder/formalin/glutaraldehyde solution and dry for 1-2 days.",
          ],
        ),
        ManagementArticleSection(
          titleBn: "৩. শেড ফিউমিগেশন (Fumigation):",
          titleEn: "3. Shed Fumigation:",
          pointsBn: [
            "ফিউমিগেশন হলো ফরমালিন ও পটাশ (KMnO₄) ব্যবহার করে পুরো শেডকে জীবাণুমুক্ত করার পদ্ধতি।",
            "🧪 ফিউমিগেশনের স্ট্যান্ডার্ড রেশিও (প্রতি ১ ঘনমিটার বাতাসের জন্য):",
            "•Formalin (40%) = 35 মি.লি.",
            "•Potassium Permanganate (KMnO₄) = 17.5 গ্রাম",
            "•পানি = 500 মি.লি. (প্রয়োজনে)",
            "⚙️ ফিউমিগেশন করার নিয়ম:",
            "1. সব জানালা, দরজা, ভেন্টিলেশন বন্ধ করুন।",
            "2. মাটির হাঁড়ি বা বালতিতে প্রথমে KMnO₄ দিন, তার উপর ধীরে ধীরে ফরমালিন ঢালুন।",
            " → সঙ্গে সঙ্গে ধোঁয়া উঠতে শুরু করবে।",
            "3. দ্রুত বের হয়ে শেড বাইরে থেকে বন্ধ করে দিন।",
            "4. কমপক্ষে ১২–২৪ ঘণ্টা শেড বন্ধ রাখতে হবে।",
            "5. পরে দরজা-জানালা খুলে বাতাস চলাচল করতে দিতে হবে।",
            "👉 সতর্কতা: ফিউমিগেশন করার সময় কেউ শেডে ঢুকবেন না। গ্লাভস, মাস্ক, চশমা ব্যবহার করবেন।",
          ],
          pointsEn: [
            "Fumigation uses Formalin & Potassium Permanganate (KMnO₄) gas to sterilize the shed.",
            "🧪 Standard Fumigation Ratio (per 1 cubic meter air space):",
            "•Formalin (40%) = 35 ml",
            "•Potassium Permanganate (KMnO₄) = 17.5 g",
            "•Water = 500 ml (if needed)",
            "⚙️ Procedure:",
            "1. Close and seal all windows, doors, and vents.",
            "2. Place KMnO₄ in an earthen pot first, then slowly pour Formalin over it.",
            " → Heavy gas smoke will immediately evolve.",
            "3. Exit quickly and lock the shed from the outside.",
            "4. Keep the shed sealed for at least 12-24 hours.",
            "5. Open doors and windows afterward to ventilate residual gas.",
            "👉 Warning: Nobody should enter during fumigation. Always wear mask, gloves, and protective goggles.",
          ],
        ),
        ManagementArticleSection(
          titleBn: "৪. শেড শুকানো ও ডাউনটাইম:",
          titleEn: "4. Shed Drying & Downtime:",
          pointsBn: [
            "•শেড ১০–১৪ দিন খালি রেখে বাতাস ও সূর্যের আলো লাগাতে হবে।",
            "•প্রয়োজনে মেঝেতে চুন (Lime powder) ছিটিয়ে দেওয়া যেতে পারে।",
            "•নতুন বাচ্চা আনার ১–২ দিন আগে আবার হালকা জীবাণুনাশক স্প্রে করতে হবে।",
          ],
          pointsEn: [
            "•Leave shed vacant for 10-14 days to expose floor to sunlight and fresh air.",
            "•Optionally dust hydrated lime powder over the concrete floor.",
            "•Spray a light disinfectant layer 1-2 days before chick placement.",
          ],
        ),
        ManagementArticleSection(
          titleBn: "৫. ব্রুডিং হাউস (Brooding House) প্রস্তুত করা:",
          titleEn: "5. Preparing the Brooding House:",
          pointsBn: [
            "📌 ভেতরের ব্যবস্থা:",
            "1. লিটার:",
            "o মেঝেতে পরিষ্কার, শুকনো ধানের তুষ বা কাঠের গুঁড়ো ৩–৪ ইঞ্চি পুরু করে বিছাতে হবে।",
            "o লিটার যেন একদম শুকনো থাকে, ভিজলে সাথে সাথে বদলাতে হবে।",
            "2. তাপের ব্যবস্থা:",
            "o ব্রুডার (গ্যাস ব্রুডার, কয়লা/বাল্ব ব্রুডার, হিটার) প্রস্তুত করতে হবে।",
            "o ১ম সপ্তাহে তাপমাত্রা ৩২–৩৫° সেলসিয়াস রাখতে হবে।",
            "o প্রতি সপ্তাহে ২–৩° করে কমাতে হবে।",
            "3. চক্রাকার গার্ড/বৃত্ত (Chick Guard):",
            "o বাচ্চারা প্রথম দিকে যাতে ঠান্ডা বাতাসে না যায়, এজন্য বৃত্তাকার কার্ডবোর্ড/টিন/বাঁশ দিয়ে ঘের তৈরি করতে হবে।",
            "o প্রথম সপ্তাহে প্রতি ১০০ বাচ্চার জন্য প্রায় ১.৫–২ মিটার ব্যাসের গার্ড ব্যবহার করতে হবে।",
            "o ৭–১০ দিন পর ধীরে ধীরে খুলে দিতে হবে।",
            "4. আলো:",
            "o প্রথম সপ্তাহে ২৪ ঘণ্টা হালকা আলো থাকতে হবে।",
            "o পরের দিকে ধীরে ধীরে ১৬ ঘণ্টা আলো রাখা যায় (লেয়ারে)।",
            "5. ফিডার ও ড্রিঙ্কার:",
            "o বাচ্চা ঢোকার আগে পর্যাপ্ত ফিডার-ড্রিঙ্কার সাজিয়ে রাখতে হবে।",
            "o প্রথম সপ্তাহে কাগজের উপর ফিড ছিটিয়ে দিতে হবে যাতে সহজে খেতে পারে।",
            "o পানি হালকা গরম (২০–২৫° C) রাখা ভালো।",
            "6. ভ্যাকসিনেশন ও স্বাস্থ্য সুরক্ষা:",
            "o ভ্যাকসিনের সময়সূচি আগে থেকে প্রস্তুত রাখতে হবে।",
            "o প্রতিদিন বাচ্চার স্বাস্থ্য পর্যবেক্ষণ করতে হবে।",
          ],
          pointsEn: [
            "📌 Internal Arrangements:",
            "1. Litter Bedding:",
            "o Spread clean, dry rice husk or wood shavings 3-4 inches thick on the floor.",
            "o Litter must stay completely dry; replace wet patches instantly.",
            "2. Heating System:",
            "o Setup gas brooders, electric brooders, or heaters in advance.",
            "o Maintain week 1 temperature at 32-35°C (90-95°F).",
            "o Reduce temperature by 2-3°C each subsequent week.",
            "3. Circular Chick Guard:",
            "o Create circular cardboard/tin/bamboo guards to shield chicks from cold drafts.",
            "o Provide 1.5-2 meter diameter guard space per 100 chicks during week 1.",
            "o Gradually expand and remove guards after 7-10 days.",
            "4. Lighting:",
            "o Provide continuous light for 24 hours during week 1.",
            "o Reduce lighting duration gradually to 16 hours for layer flocks.",
            "5. Feeders & Drinkers:",
            "o Arrange sanitized feeders and drinkers before chicks arrive.",
            "o Scatter starter feed on paper sheets during the first week.",
            "o Provide warm drinking water (20-25°C).",
            "6. Vaccination & Health Security:",
            "o Prepare flock vaccination charts in advance.",
            "o Monitor chick health, crop fill, and vitality daily.",
          ],
        ),
        ManagementArticleSection(
          titleBn: "৬. চূড়ান্ত চেকলিস্ট (বাচ্চা ঢোকানোর আগের দিন):",
          titleEn: "6. Final Pre-Arrival Checklist:",
          pointsBn: [
            "•লিটার বিছানো ✔",
            "•ব্রুডার চালিয়ে তাপমাত্রা চেক ✔",
            "•ফিডার-ড্রিঙ্কার বসানো ✔",
            "•আলো ও বায়ু চলাচল চেক ✔",
            "•জীবাণুমুক্তকরণ শেষে হালকা স্প্রে ✔",
          ],
          pointsEn: [
            "•Litter spreading completed ✔",
            "•Brooder pre-heated & temperature verified ✔",
            "•Feeders and drinkers sanitized & filled ✔",
            "•Lighting and ventilation checked ✔",
            "•Final disinfectant misting completed ✔",
          ],
        ),
      ],
      summaryTitleBn: "✅ সংক্ষেপে:",
      summaryTitleEn: "✅ In Summary:",
      summaryQuoteBn:
          "শেড খালি করে → পরিষ্কার → জীবাণুমুক্তকরণ (স্প্রে + ফিউমিগেশন) → শুকানো → নতুন ব্রুডিং হাউস সেটআপ",
      summaryQuoteEn:
          "Vacate Shed → Deep Clean → Disinfect & Fumigate → Downtime Drying → Setup New Brooding House",
      summarySubBn: "",
      summarySubEn: "",
    ),

    // -------------------------------------------------------------
    // Article 4: Brooding Care (ব্রুডিং এর সময় করণীয়)
    // -------------------------------------------------------------
    FarmManagementItem(
      id: "brooding_care",
      titleBn: "ব্রুডিং এর সময় করণীয়",
      titleEn: "Brooding Care & Management",
      descBn:
          "ব্রুডিং এর সময় করণীয়: ব্রুডিং (Brooding) হলো ডে-ওল্ড চিক (DOC) বা সদ্য ফোটা বাচ্চাকে শেডে আনার পর সঠিক তাপমাত্রা, খাবার-পানি, আলো, বাতাস এবং সুরক্ষা দিয়ে বড় করার প্রাথমিক ধাপ।",
      descEn:
          "Brooding involves providing optimal temperature, starter nutrition, clean water, and care for day-old chicks during early growth...",
      imagePath: "assets/brooding_care.jpg",
      introBn:
          "ব্রুডিং (Brooding) হলো ডে-ওল্ড চিক (DOC) বা সদ্য ফোটা বাচ্চাকে শেডে আনার পর সঠিক তাপমাত্রা, খাবার-পানি, আলো, বাতাস এবং সুরক্ষা দিয়ে বড় করার প্রাথমিক ধাপ। সাধারণত প্রথম ৩–৪ সপ্তাহ পর্যন্ত ব্রুডিং করতে হয় (প্রজাতি ও মরসুমভেদে সময় কম-বেশি হতে পারে)। এই সময়ে যত্ন ঠিকমতো না নিলে বাচ্চার মৃত্যু, অসুস্থতা, ডগমগে বৃদ্ধি, পরবর্তী ডিম বা মাংস উৎপাদনে ক্ষতি হয়।",
      introEn:
          "Brooding is the art and science of raising day-old chicks (DOC) during their first 3-4 weeks by regulating temperature, feed, water, light, ventilation, and health security. Improper brooding management causes high early mortality, stunted growth, and reduced lifetime flock yield.",
      sectionHeaderBn: "🔰 ব্রুডিং কালে করণীয় বিষয়গুলো:",
      sectionHeaderEn: "🔰 Key Brooding Guidelines & Actions:",
      sections: [
        ManagementArticleSection(
          titleBn: "১. শেড প্রস্তুতি:",
          titleEn: "1. Shed Preparation:",
          pointsBn: [
            "•বাচ্চা ঢোকার ৭–১০ দিন আগে শেড জীবাণুমুক্ত ও ফিউমিগেশন করতে হবে।",
            "•লিটার (ধানের তুষ/কাঠের গুঁড়ো) ৩–৪ ইঞ্চি পুরু করে বিছাতে হবে।",
            "•মেঝে যেন শুকনো ও পরিষ্কার থাকে।",
            "•ব্রুডিং গার্ড (চিক গার্ড) বসিয়ে গোলাকার ঘের তৈরি করতে হবে।",
          ],
          pointsEn: [
            "•Disinfect and fumigate the shed 7-10 days prior to chick arrival.",
            "•Spread clean rice husk or wood shavings litter 3-4 inches thick.",
            "•Ensure concrete floor is thoroughly clean and dry.",
            "•Set up circular chick guards to prevent cold drafts and corner huddling.",
          ],
        ),
        ManagementArticleSection(
          titleBn: "২. তাপমাত্রা নিয়ন্ত্রণ:",
          titleEn: "2. Temperature Control:",
          pointsBn: [
            "•ব্রুডিংয়ের সবচেয়ে গুরুত্বপূর্ণ অংশ হলো তাপ।",
            "•প্রথম সপ্তাহে ৩২–৩৫° C রাখতে হবে।",
            "•প্রতি সপ্তাহে তাপমাত্রা ২–৩° C করে কমাতে হবে।",
            "•বাচ্চাদের অবস্থান দেখে তাপ ঠিক আছে কি না বোঝা যায়:",
            " o 🔥 তাপ কম হলে → বাচ্চারা একসাথে হিটার/ব্রুডারের কাছে জড়ো হয়।",
            " o ❄️ তাপ বেশি হলে → বাচ্চারা দেয়ালের দিকে ছড়িয়ে যায়, হাঁপায়।",
            " o ✅ তাপ ঠিক হলে → বাচ্চারা সমানভাবে শেডে ছড়িয়ে থাকে।",
          ],
          pointsEn: [
            "•Temperature control is the single most critical factor during brooding.",
            "•Maintain 32-35°C (90-95°F) during the first week.",
            "•Reduce temperature by 2-3°C each subsequent week.",
            "•Chick distribution reveals temperature accuracy:",
            " o 🔥 Too cold → Chicks huddle tightly under the brooder lamp.",
            " o ❄️ Too hot → Chicks spread out to outer walls and pant heavily.",
            " o ✅ Ideal temp → Chicks disperse evenly and remain active across the area.",
          ],
        ),
        ManagementArticleSection(
          titleBn: "৩. আলো (Light):",
          titleEn: "3. Lighting Management:",
          pointsBn: [
            "•প্রথম ৩ দিন ২৪ ঘণ্টা আলো রাখতে হবে (খাবার-পানি খুঁজে পেতে সাহায্য করে)।",
            "•এরপর ধীরে ধীরে ১২ ঘণ্টা আলো + ১২ ঘণ্টা অন্ধকারে আনা যায় (লেয়ারের জন্য)।",
            "•আলো খুব উজ্জ্বল না হয়ে হালকা সাদা বা হলুদ হলে ভালো।",
          ],
          pointsEn: [
            "•Provide 24-hour light during the first 3 days to help chicks locate feed/water.",
            "•Gradually transition to 12 hours light + 12 hours dark for layer pullets.",
            "•Use soft white or warm yellow lighting rather than overly harsh glare.",
          ],
        ),
        ManagementArticleSection(
          titleBn: "৪. খাবার (Feed):",
          titleEn: "4. Feed Management:",
          pointsBn: [
            "•বাচ্চা আনার পরপরই গ্লুকোজ মিশ্রিত পানি দিতে হবে।",
            "•প্রথম দিন কাগজ বা প্লাস্টিকের উপর ফিড ছড়িয়ে দিতে হবে।",
            "•পরে ট্রে/ফিডার ব্যবহার করতে হবে।",
            "•প্রতি ৫০ বাচ্চার জন্য কমপক্ষে ১টি করে ফিডার রাখা উচিত।",
            "•স্টার্টার ফিড (প্রোটিন ২০–২২%, এনার্জি ২৮০০–২৯০০ Kcal/kg) ব্যবহার করতে হবে।",
          ],
          pointsEn: [
            "•Provide glucose-supplemented drinking water immediately upon arrival.",
            "•Scatter starter feed on paper sheets/plastic trays during Day 1.",
            "•Transition to standard feeder trays progressively.",
            "•Provide at least 1 feeder tray per 50 chicks.",
            "•Feed high-grade starter mash (Protein 20-22%, Energy 2800-2900 Kcal/kg).",
          ],
        ),
        ManagementArticleSection(
          titleBn: "৫. পানি (Water):",
          titleEn: "5. Water Management:",
          pointsBn: [
            "•বাচ্চা আসার সাথে সাথেই পরিষ্কার ও হালকা গরম পানি দিতে হবে (২০–২৫° C)।",
            "•পানিতে ভিটামিন-সি, সেলাইন প্রথম ৩–৫ দিন দেওয়া ভালো।",
            "•ড্রিঙ্কার সংখ্যা → প্রতি ৫০ বাচ্চার জন্য ১টি ড্রিঙ্কার।",
            "•পানি প্রতিদিন ২–৩ বার পরিবর্তন করতে হবে।",
          ],
          pointsEn: [
            "•Supply clean, lukewarm drinking water (20-25°C) upon arrival.",
            "•Supplement water with Vitamin-C and electrolytes during the first 3-5 days.",
            "•Drinker ratio → Provide at least 1 drinker per 50 chicks.",
            "•Replenish and sanitize drinkers 2-3 times daily.",
          ],
        ),
        ManagementArticleSection(
          titleBn: "৬. বায়ু চলাচল (Ventilation):",
          titleEn: "6. Ventilation:",
          pointsBn: [
            "•শেডে পর্যাপ্ত তাজা বাতাস ঢুকতে হবে, তবে ঠান্ডা বাতাস যেন সরাসরি বাচ্চার শরীরে না লাগে।",
            "•অ্যামোনিয়া গ্যাস জমতে দেওয়া যাবে না (লিটার শুকনো রাখতে হবে)।",
            "•হিটারের কাছে ধোঁয়া যেন না জমে।",
          ],
          pointsEn: [
            "•Ensure adequate fresh air exchange without exposing chicks to cold drafts.",
            "•Prevent toxic ammonia gas accumulation by keeping litter strictly dry.",
            "•Ensure heating appliances do not emit carbon monoxide or smoke.",
          ],
        ),
        ManagementArticleSection(
          titleBn: "৭. স্বাস্থ্য ব্যবস্থাপনা:",
          titleEn: "7. Flock Health Security:",
          pointsBn: [
            "•ভ্যাকসিন সময়মতো দিতে হবে (ND, IBD, IB ইত্যাদি)।",
            "•প্রতিদিন বাচ্চার স্বাস্থ্য পর্যবেক্ষণ করতে হবে (খাওয়ার ইচ্ছা, মল, আচরণ)।",
            "•অসুস্থ বাচ্চা দ্রুত আলাদা করতে হবে।",
            "•মৃত বাচ্চা সঙ্গে সঙ্গে পুঁতে ফেলা/পোড়ানো দরকার।",
          ],
          pointsEn: [
            "•Administer vaccinations on schedule (Newcastle ND, Gumboro IBD, IB).",
            "•Monitor flock appetite, droppings, and behavioral activity daily.",
            "•Isolate weak or sick chicks promptly.",
            "•Dispose of dead chick carcasses by deep burial or incineration.",
          ],
        ),
        ManagementArticleSection(
          titleBn: "৮. লিটার ম্যানেজমেন্ট:",
          titleEn: "8. Litter Management:",
          pointsBn: [
            "•লিটার শুকনো রাখতে হবে।",
            "•ভিজে গেলে বা জমাট বাঁধলে সেই অংশ বদলাতে হবে।",
            "•লিটার নিয়মিত উল্টাতে হবে যাতে গ্যাস জমে না।",
          ],
          pointsEn: [
            "•Keep bedding litter dry and friable.",
            "•Remove and replace wet or caked litter spots immediately.",
            "•Rake litter regularly to dissipate moisture and prevent ammonia gas.",
          ],
        ),
        ManagementArticleSection(
          titleBn: "৯. গার্ড/বৃত্ত (Chick Guard):",
          titleEn: "9. Chick Guard:",
          pointsBn: [
            "•প্রথমেই বাচ্চারা যাতে গরম জায়গা থেকে বাইরে চলে না যায়, এজন্য চিক গার্ড ব্যবহার করতে হবে।",
            "•ধীরে ধীরে (৭–১০ দিন পর) গার্ড খুলে দিতে হবে।",
          ],
          pointsEn: [
            "•Set up circular guards to keep chicks near heat, feed, and water sources.",
            "•Expand guard radius progressively and remove after 7-10 days.",
          ],
        ),
        ManagementArticleSection(
          titleBn: "১০. দৈনিক ব্যবস্থাপনা:",
          titleEn: "10. Daily Routine Management:",
          pointsBn: [
            "•সকালে–বিকেলে তাপমাত্রা মেপে দেখা।",
            "•খাবার–পানির পর্যাপ্ততা পরীক্ষা করা।",
            "•লিটার শুকনো আছে কিনা দেখা।",
            "•মৃত বাচ্চা সরানো।",
            "•রেকর্ডবুক-এ খাবার খরচ, মৃত্যুহার, স্বাস্থ্য পরিস্থিতি নথিভুক্ত করা।",
          ],
          pointsEn: [
            "•Check and log morning and evening temperatures.",
            "•Inspect feed and water availability multiple times daily.",
            "•Verify litter dryness and crop fullness.",
            "•Remove any dead chicks immediately.",
            "•Document daily feed intake, mortality, and health observations in farm logs.",
          ],
        ),
      ],
      summaryTitleBn: "✅ সংক্ষেপে ব্রুডিংয়ের মূল ৫টি স্তম্ভ:",
      summaryTitleEn: "✅ In Summary, 5 Pillars of Brooding:",
      summaryQuoteBn:
          "তাপ (Heat), আলো (Light), খাবার (Feed), পানি (Water), বায়ু (Air) এই ৫টি ঠিকঠাক হলে ব্রুডিং সফল হয়, মৃত্যুহার কমে এবং ভবিষ্যৎ উৎপাদন বাড়ে।",
      summaryQuoteEn:
          "Managing Heat, Light, Feed, Water, and Air ensures brooding success, minimal mortality, and maximum lifetime flock yield.",
      summarySubBn: "",
      summarySubEn: "",
    ),

    // -------------------------------------------------------------
    // Article 5: Lighting Management (লাইটিং ম্যানেজমেন্ট)
    // -------------------------------------------------------------
    FarmManagementItem(
      id: "lighting_management",
      titleBn: "লাইটিং ম্যানেজমেন্ট",
      titleEn: "Lighting Management",
      descBn:
          "লাইটিং ম্যানেজমেন্ট: ফার্মে লাইটিং ম্যানেজমেন্ট (Lighting Management) একটি অত্যন্ত গুরুত্বপূর্ণ বিষয়। মুরগির বৃদ্ধি, উৎপাদন ক্ষমতা, ডিম উৎপাদন, রোগ প্রতিরোধ ক্ষমতা এবং আচরণের উপর আলো (Light) সরাসরি প্রভাব ফেলে।",
      descEn:
          "Lighting management directly regulates bird growth rate, feed intake efficiency, immune health, and layer egg production cycles...",
      imagePath: "assets/lighting_management.jpg",
      introBn:
          "ফার্মে লাইটিং ম্যানেজমেন্ট (Lighting Management) একটি অত্যন্ত গুরুত্বপূর্ণ বিষয়। মুরগির বৃদ্ধি, উৎপাদন ক্ষমতা, ডিম উৎপাদন, রোগ প্রতিরোধ ক্ষমতা এবং আচরণের উপর আলো (Light) সরাসরি প্রভাব ফেলে। এখানে লাইটিং ব্যবস্থাপনা সম্পর্কে বিস্তারিত দেওয়া হলো:",
      introEn:
          "Lighting Management is a crucial factor in poultry farming. Light directly influences growth rate, feed conversion, egg laying cycles, immune defense, and bird behavior. Here is a detailed guide:",
      sectionHeaderBn: "🔰 লাইটিং ব্যবস্থাপনার মূল গাইডলাইন:",
      sectionHeaderEn: "🔰 Core Lighting Management Guidelines:",
      sections: [
        ManagementArticleSection(
          titleBn: "১. আলো (Light) এর ভূমিকা:",
          titleEn: "1. Role of Light:",
          pointsBn: [
            "•আলো খাবার গ্রহণ ও পানীয়ের খাওয়ার অভ্যাস বাড়ায়।",
            "•হরমোনের নিঃসরণে সাহায্য করে, ফলে বৃদ্ধি ও ডিম উৎপাদন নিয়ন্ত্রণ হয়।",
            "•রাতের অন্ধকারে পর্যাপ্ত বিশ্রাম হয়, এতে রোগ প্রতিরোধ ক্ষমতা বাড়ে।",
            "•ডিমপাড়া মুরগীর ক্ষেত্রে লাইটের সময়কাল ও ইনটেনসিটি (উজ্জ্বলতা) ডিম উৎপাদনে গুরুত্বপূর্ণ ভূমিকা রাখে।",
          ],
          pointsEn: [
            "•Light stimulates feed and water consumption habits.",
            "•Regulates essential hormone secretions controlling growth and egg laying.",
            "•Adequate darkness provides essential rest, boosting immunity.",
            "•Light duration and lux intensity directly dictate layer productivity.",
          ],
        ),
        ManagementArticleSection(
          titleBn: "২. ব্রয়লার মুরগীতে লাইট ম্যানেজমেন্ট:",
          titleEn: "2. Broiler Lighting Management:",
          pointsBn: [
            "✅ প্রথম ৭ দিন (ব্রুডিং পিরিয়ড):",
            "•২৩ ঘণ্টা আলো + ১ ঘণ্টা অন্ধকার দেওয়া উত্তম।",
            "•আলো নরম (dim) হতে হবে যাতে বাচ্চারা খাবার ও পানির সাথে সহজে অভ্যস্ত হয়।",
            "✅ ৮–২১ দিন:",
            "•২০ ঘণ্টা আলো + ৪ ঘণ্টা অন্ধকার।",
            "•ধীরে ধীরে আলো কমাতে হবে যাতে বাচ্চারা বিশ্রাম নিতে পারে।",
            "✅ ২২ দিন থেকে মার্কেট পর্যন্ত:",
            "•১৬–১৮ ঘণ্টা আলো + ৬–৮ ঘণ্টা অন্ধকার।",
            "•এতে বাচ্চাদের হাড় মজবুত হয়, লেগ সমস্যা কমে এবং স্ট্রেস কম হয়।",
          ],
          pointsEn: [
            "✅ First 7 Days (Brooding Period):",
            "•Provide 23 hours light + 1 hour darkness.",
            "•Use soft/dim lighting to help chicks locate feed and water easily.",
            "✅ Days 8–21:",
            "•Provide 20 hours light + 4 hours darkness.",
            "•Gradually reduce light duration to allow rest.",
            "✅ Day 22 to Market:",
            "•Provide 16-18 hours light + 6-8 hours darkness.",
            "•Promotes bone strength, reduces leg weakness, and lowers stress.",
          ],
        ),
        ManagementArticleSection(
          titleBn: "৩. লেয়ার মুরগীতে লাইট ম্যানেজমেন্ট:",
          titleEn: "3. Layer Hen Lighting Management:",
          pointsBn: [
            "✅ গ্রোয়ার পিরিয়ড (০–১৬ সপ্তাহ):",
            "•৮–১০ ঘণ্টা আলো যথেষ্ট।",
            "•অতিরিক্ত আলো দিলে মুরগী আগেভাগে পরিপক্ক হয়ে যায় এবং ডিম উৎপাদন কমে।",
            "✅ প্রি-লেয়িং পিরিয়ড (১৭–১৯ সপ্তাহ):",
            "•ধীরে ধীরে আলো বাড়াতে হবে।",
            "•প্রতিদিন ৩০ মিনিট করে আলো বাড়ানো ভালো।",
            "✅ প্রোডাকশন পিরিয়ড (২০ সপ্তাহ থেকে ৬৫ সপ্তাহ):",
            "•স্থায়ীভাবে ১৪–১৬ ঘণ্টা আলো দিতে হবে।",
            "•১৬ ঘণ্টার বেশি আলো দেওয়া যাবে না, এতে ডিম উৎপাদন কমে যায়।",
          ],
          pointsEn: [
            "✅ Rearing/Grower Phase (Weeks 0–16):",
            "•8-10 hours of light is sufficient.",
            "•Excessive light causes precocious sexual maturity and reduces total egg production.",
            "✅ Pre-Laying Phase (Weeks 17–19):",
            "•Gradually stimulate with increased light.",
            "•Increase light by 30 minutes weekly.",
            "✅ Production Phase (Weeks 20 to 65+):",
            "•Maintain 14-16 hours of daily light continuously.",
            "•Do not exceed 16 hours, as excessive light suppresses laying cycles.",
          ],
        ),
        ManagementArticleSection(
          titleBn: "৪. আলো (Light Intensity) এর মান:",
          titleEn: "4. Light Intensity (Lux Level):",
          pointsBn: [
            "•ব্রয়লার: ২০ লাক্স (প্রথম সপ্তাহ), পরে কমিয়ে ৫–১০ লাক্স করা হয়।",
            "•লেয়ার: ব্রুডিং এ ২০–৩০ লাক্স, গ্রোয়ারে ৫ লাক্স, প্রোডাকশনে ১০–১৫ লাক্স রাখা উচিত।",
            "•ডিম সংগ্রহের সময় বেশি আলোতে মুরগী শান্ত থাকে।",
          ],
          pointsEn: [
            "•Broilers: 20 Lux during Week 1, then reduce to 5-10 Lux.",
            "•Layers: 20-30 Lux in brooding, 5 Lux in grower, 10-15 Lux in production.",
            "•Maintain bright light during egg collection to keep hens calm.",
          ],
        ),
        ManagementArticleSection(
          titleBn: "৫. লাইটের ধরণ:",
          titleEn: "5. Types of Bulbs & Lights:",
          pointsBn: [
            "•ইনক্যান্ডেসেন্ট বাল্ব: কম কার্যকর, বিদ্যুৎ খরচ বেশি।",
            "•ফ্লুরোসেন্ট বাল্ব (CFL): মাঝারি মানের আলো, বিদ্যুৎ সাশ্রয়ী।",
            "•LED লাইট: সবচেয়ে ভালো, বিদ্যুৎ সাশ্রয়ী, সঠিক ইনটেনসিটি ও সময় নিয়ন্ত্রণ করা সহজ।",
          ],
          pointsEn: [
            "•Incandescent Bulbs: Inefficient, high power consumption.",
            "•Fluorescent (CFL): Moderate efficiency, energy saving.",
            "•LED Lights: Optimal choice, highly energy efficient, easily dimmable, long lifespan.",
          ],
        ),
        ManagementArticleSection(
          titleBn: "৬. লাইট ম্যানেজমেন্টের সতর্কতা:",
          titleEn: "6. Lighting Precautions:",
          pointsBn: [
            "•হঠাৎ আলো নিভে গেলে মুরগী ভয় পেতে পারে, ব্যাকআপ পাওয়ার ব্যবস্থা রাখতে হবে।",
            "•আলো ধীরে ধীরে বাড়ানো ও কমানো উচিত (ডিম পাড়া পাখির ক্ষেত্রে বিশেষ গুরুত্বপূর্ণ)।",
            "•শেডে আলো সমানভাবে পড়া উচিত, কোন জায়গা অন্ধকার বা অতিরিক্ত উজ্জ্বল থাকা যাবে না।",
          ],
          pointsEn: [
            "•Sudden power outages cause flock panic; maintain power backups.",
            "•Increase/decrease light duration gradually (especially critical for layers).",
            "•Ensure uniform light dispersion throughout shed; eliminate dark shadows.",
          ],
        ),
      ],
      summaryTitleBn: "✅ সংক্ষেপে:",
      summaryTitleEn: "✅ In Summary:",
      summaryQuoteBn:
          "বয়স এবং জাত (ব্রয়লার/লেয়ার) অনুযায়ী আলোর সময়কাল ও তীব্রতা মেনে চললে মুরগির বৃদ্ধি দ্রুত হয়, ক্যানিবালিজম রোধ হয় এবং ডিম উৎপাদন সর্বোচ্চ পর্যায়ে পৌঁছায়।",
      summaryQuoteEn:
          "Tailoring lighting duration and intensity to bird age and breed maximizes growth, prevents cannibalism, and optimizes peak egg yield.",
      summarySubBn: "",
      summarySubEn: "",
    ),

    // -------------------------------------------------------------
    // Article 6: Litter Management (লিটার ম্যানেজমেন্ট)
    // -------------------------------------------------------------
    FarmManagementItem(
      id: "litter_management",
      titleBn: "লিটার ম্যানেজমেন্ট",
      titleEn: "Litter Management",
      descBn:
          "লিটার ম্যানেজমেন্ট: লিটার ম্যানেজমেন্ট (Litter Management) পোল্ট্রি ফার্মের অন্যতম গুরুত্বপূর্ণ বিষয়। সঠিকভাবে লিটার পরিচালনা না করলে গ্যাস (অ্যামোনিয়া), রোগজীবাণু, ভেজা পরিবেশ, পায়ের ক্ষত, শ্বাসকষ্টসহ নানা সমস্যা হয়।",
      descEn:
          "Effective litter management prevents ammonia fumes, footpad dermatitis, breast blisters, and respiratory illness in poultry...",
      imagePath: "assets/litter_management.jpg",
      introBn:
          "লিটার ম্যানেজমেন্ট (Litter Management) পোল্ট্রি ফার্মের অন্যতম গুরুত্বপূর্ণ বিষয়। সঠিকভাবে লিটার পরিচালনা না করলে গ্যাস (অ্যামোনিয়া), রোগজীবাণু, ভেজা পরিবেশ, পায়ের ক্ষত, শ্বাসকষ্টসহ নানা সমস্যা হয়। তাই নিচে লিটার ব্যবস্থাপনা বিস্তারিতভাবে দেওয়া হলো:",
      introEn:
          "Managing bedding litter dryness and quality is essential for preventing noxious ammonia gas, footpad lesions, and respiratory outbreaks. Here is a detailed guide:",
      sectionHeaderBn: "🔰 লিটার ব্যবস্থাপনার বিস্তারিত গাইডলাইন:",
      sectionHeaderEn: "🔰 Detailed Litter Management Guidelines:",
      sections: [
        ManagementArticleSection(
          titleBn: "১. লিটার কি?",
          titleEn: "1. What is Litter?",
          pointsBn: [
            "•লিটার হলো শেডের মেঝেতে বিছানো শুকনো, নরম ও শোষণ ক্ষমতাসম্পন্ন উপকরণ, যেখানে মুরগি হাঁটে, বসে এবং মলত্যাগ করে।",
          ],
          pointsEn: [
            "•Litter is clean, dry, soft, moisture-absorbent bedding material spread on the poultry floor where birds walk, rest, and defecate.",
          ],
        ),
        ManagementArticleSection(
          titleBn: "২. ভালো লিটারের গুণাবলী:",
          titleEn: "2. Characteristics of Good Litter:",
          pointsBn: [
            "•শুকনো, ঝুরঝুরে ও নরম হতে হবে।",
            "•পানি শোষণ ক্ষমতা বেশি হতে হবে।",
            "•ধূলোবালি কম থাকতে হবে।",
            "•সহজে পাওয়া যায় এমন সস্তা উপকরণ হতে হবে।",
          ],
          pointsEn: [
            "•Must be dry, friable, and soft.",
            "•Must have high moisture absorption capacity.",
            "•Must be low in dust and toxic fungal contaminants.",
            "•Should be readily available and economical.",
          ],
        ),
        ManagementArticleSection(
          titleBn: "৩. লিটার হিসেবে যা ব্যবহার করা যায়:",
          titleEn: "3. Suitable Litter Materials:",
          pointsBn: [
            "•করাতের গুঁড়া (Sawdust)",
            "•কাঠের টুকরো (Wood shavings)",
            "•ধানের তুষ (Rice husk)",
            "•কাটা খড় (Chopped straw)",
            "•সূর্যমুখী/চালকুমড়ার খোসা ইত্যাদি",
            "👉 সবচেয়ে বেশি ব্যবহৃত হয়: ধানের তুষ ও করাতের গুঁড়া",
          ],
          pointsEn: [
            "•Sawdust",
            "•Wood shavings",
            "•Rice husk",
            "•Chopped straw",
            "•Sunflower/gourd husks",
            "👉 Most Commonly Used: Rice husk and wood shavings",
          ],
        ),
        ManagementArticleSection(
          titleBn: "৪. লিটারের পুরুত্ব:",
          titleEn: "4. Litter Depth:",
          pointsBn: [
            "•গ্রীষ্মকালে: ২–৩ ইঞ্চি",
            "•শীতকালে: ৪–৫ ইঞ্চি",
            "•বাচ্চা বড় হওয়ার সাথে সাথে প্রয়োজনে নতুন শুকনো লিটার যোগ করতে হবে।",
          ],
          pointsEn: [
            "•Summer depth: 2-3 inches",
            "•Winter depth: 4-5 inches",
            "•Add fresh dry litter top-ups as birds grow.",
          ],
        ),
        ManagementArticleSection(
          titleBn: "৫. লিটার ব্যবস্থাপনা ধাপসমূহ:",
          titleEn: "5. Litter Management Phases:",
          pointsBn: [
            "(ক) শেড প্রস্তুত করার সময়:",
            "•শেড জীবাণুমুক্ত করার পর শুকনো মেঝেতে চুন ছিটাতে হবে।",
            "•তারপর সমানভাবে লিটার বিছাতে হবে।",
            "(খ) ব্রুডিং পিরিয়ডে (০–৭ দিন):",
            "•লিটার সবসময় শুকনো রাখতে হবে।",
            "•পানি ছিটকে পড়লে সাথে সাথে ভিজা অংশ তুলে শুকনো লিটার দিতে হবে।",
            "•প্রথম সপ্তাহে বাচ্চার উপর নির্ভর করে লিটার পরিবর্তনের প্রয়োজন বেশি হয়।",
            "(গ) গ্রোয়ার ও প্রোডাকশনে:",
            "•প্রতিদিন ২–৩ বার লিটার নাড়িয়ে ঝুরঝুরে রাখতে হবে।",
            "•ভিজা অংশ বের করে শুকনো নতুন লিটার দিতে হবে।",
            "•১০–১৫ দিনে একবার পুরো লিটার চেক করতে হবে।",
          ],
          pointsEn: [
            "(A) Shed Preparation Phase:",
            "•Dust agricultural lime over dry concrete after disinfection.",
            "•Spread litter evenly across the floor.",
            "(B) Brooding Phase (Days 0–7):",
            "•Keep litter strictly dry at all times.",
            "•Scoop out water spills immediately and top up dry litter.",
            "•Frequent spot-cleaning is required during Week 1.",
            "(C) Grower & Laying Phase:",
            "•Rake litter 2-3 times daily to keep it friable and aerated.",
            "•Remove wet patches and replace with fresh dry bedding.",
            "•Conduct full litter quality inspections every 10-15 days.",
          ],
        ),
        ManagementArticleSection(
          titleBn: "৬. লিটার ব্যবস্থাপনায় সমস্যার সমাধান:",
          titleEn: "6. Litter Problem Troubleshooting:",
          pointsBn: [
            "•ভিজা লিটার হলে:",
            " o পানির লাইন ও ড্রিঙ্কার লিক করছে কিনা চেক করুন।",
            " o ভিজি লিটার সরিয়ে নতুন শুকনো লিটার দিন।",
            " o ভেন্টিলেশন বাড়ান যাতে আর্দ্রতা কমে।",
            "•অ্যামোনিয়ার গন্ধ হলে:",
            " o শেডে বায়ু চলাচল বাড়ান।",
            " o ভিজি লিটার পরিবর্তন করুন।",
            " o প্রয়োজনে লিটারে চুন (lime) বা বিশেষ রাসায়নিক (litter conditioner) ব্যবহার করুন।",
            "•কেক (Cake) তৈরি হলে:",
            " o শক্ত হয়ে যাওয়া অংশ সরিয়ে ফেলুন।",
            " o নতুন শুকনো লিটার দিন।",
          ],
          pointsEn: [
            "•For Wet Litter:",
            " o Inspect water lines and drinkers for leaks.",
            " o Remove wet litter patches and replenish with dry bedding.",
            " o Increase shed ventilation to reduce humidity.",
            "•For Ammonia Fumes:",
            " o Increase cross-ventilation airflow.",
            " o Replace damp litter immediately.",
            " o Apply hydrated lime or commercial litter conditioners to bind ammonia.",
            "•For Litter Caking:",
            " o Scrape off hardened crusty caked layers.",
            " o Add fresh dry litter top-up.",
          ],
        ),
        ManagementArticleSection(
          titleBn: "৭. লিটার অপসারণ ও পুনর্ব্যবহার:",
          titleEn: "7. Litter Removal & Reuse:",
          pointsBn: [
            "•১ ব্যাচ শেষ হলে সম্পূর্ণ লিটার সরিয়ে ফেলতে হবে।",
            "•নতুন ব্যাচ আনার আগে শেড জীবাণুমুক্ত করতে হবে।",
            "•পুরনো লিটার জৈব সার হিসেবে ব্যবহার করা যায়।",
          ],
          pointsEn: [
            "•Completely evacuate old litter after flock depopulation.",
            "•Sanitize and disinfect shed prior to new chick entry.",
            "•Compost old litter for use as high-grade organic crop fertilizer.",
          ],
        ),
      ],
      summaryTitleBn: "✅ সংক্ষেপে:",
      summaryTitleEn: "✅ In Summary:",
      summaryQuoteBn:
          "লিটার শুকনো রাখা = রোগমুক্ত ফার্ম। লিটার প্রতিদিন নাড়ানো এবং সঠিক আর্দ্রতা বজায় রাখা পোল্ট্রি ফার্মে সফলতার অন্যতম চাবিকাঠি।",
      summaryQuoteEn:
          "Dry litter equals a disease-free farm. Daily raking and moisture control are the ultimate keys to poultry success.",
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
          isEnglish ? "Farm Management Guide" : "খামার ব্যবস্থাপনা",
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
          return _buildManagementCard(context, item);
        },
      ),
    );
  }

  Widget _buildManagementCard(BuildContext context, FarmManagementItem item) {
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
              builder: (_) => FarmManagementArticleDetailScreen(
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
                        Icons.image_outlined,
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
// Full Article Detail Screen (Matches User's Screenshots Exactly)
// ============================================================================
class FarmManagementArticleDetailScreen extends StatelessWidget {
  final FarmManagementItem item;
  final bool isEnglish;

  const FarmManagementArticleDetailScreen({
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
                      Icons.image_outlined,
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

                  // Section Header Title (e.g. 🔰 লিটার ব্যবস্থাপনার বিস্তারিত গাইডলাইন:)
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
                            const Text(
                              "🟢 ",
                              style: TextStyle(fontSize: 14),
                            ),
                            Expanded(
                              child: Text(
                                secTitle,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF2E7D32),
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
                              pt.startsWith("✅");
                          final isSubPhase = pt.startsWith("(") &&
                              (pt.contains("ক)") ||
                                  pt.contains("খ)") ||
                                  pt.contains("গ)") ||
                                  pt.contains("A)") ||
                                  pt.contains("B)") ||
                                  pt.contains("C)"));
                          final isSubBullet = pt.trim().startsWith("o");
                          final isHeaderLine = !pt.startsWith("•") &&
                              !isSubBullet &&
                              !isSubPhase &&
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
                          } else if (isSubPhase) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  top: 8, bottom: 4, left: 2),
                              child: Text(
                                pt,
                                style: const TextStyle(
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1B5E20),
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
