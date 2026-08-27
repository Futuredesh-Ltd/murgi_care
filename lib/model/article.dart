class Article {
  final String id;
  final String category;
  final String titleEn;
  final String titleBn;
  final String author;
  final String readTime;
  final String imageUrl;
  final String contentEn;
  final String contentBn;

  Article({
    required this.id,
    this.category = 'general',
    required this.titleEn,
    required this.titleBn,
    required this.author,
    required this.readTime,
    required this.imageUrl,
    required this.contentEn,
    required this.contentBn,
  });

  Article copyWithCategory(String newCategory) {
    return Article(
      id: id,
      category: newCategory,
      titleEn: titleEn,
      titleBn: titleBn,
      author: author,
      readTime: readTime,
      imageUrl: imageUrl,
      contentEn: contentEn,
      contentBn: contentBn,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'titleEn': titleEn,
      'titleBn': titleBn,
      'author': author,
      'readTime': readTime,
      'imageUrl': imageUrl,
      'contentEn': contentEn,
      'contentBn': contentBn,
      'createdAt': DateTime.now().toIso8601String(),
    };
  }

  factory Article.fromMap(String id, Map<String, dynamic> map) {
    return Article(
      id: id,
      category: map['category'] ?? 'general',
      titleEn: map['titleEn'] ?? '',
      titleBn: map['titleBn'] ?? '',
      author: map['author'] ?? 'MurgiCare',
      readTime: map['readTime'] ?? '5 min read',
      imageUrl: map['imageUrl'] ?? '',
      contentEn: map['contentEn'] ?? '',
      contentBn: map['contentBn'] ?? '',
    );
  }

  static List<Article> mockArticles = [
    Article(
      id: "1",
      titleEn: "5 Ways to Boost Egg Production",
      titleBn: "ডিম উৎপাদন বৃদ্ধির ৫টি উপায়",
      author: "MurgiCare Experts",
      readTime: "4 min read",
      imageUrl: "https://images.unsplash.com/photo-1548550023-2bdb3c5beed7?auto=format&fit=crop&q=80&w=1000",
      contentEn: '''Increasing your flock's egg production doesn't happen overnight, but following proper management techniques can drastically improve your yield over time.

1. High-Quality Feed
A laying hen needs about 16% to 18% protein in her diet along with essential calcium. Ensure you are providing laying mash rather than standard grower feed.

2. Proper Lighting
Hens need about 14-16 hours of daily light to maintain active egg production. During winter, consider installing a timed artificial light source in the coop.

3. Reduce Stress
Predators, extreme heat, or overcrowding can immediately stop a hen from laying. Keep your coop secure and well-ventilated.

4. Fresh Water Access
An egg is 75% water. If layers are deprived of water for just a few hours, egg production can drop for weeks.

5. Calcium Supplements
Provide crushed oyster shells on the side to give them the extra calcium required for strong eggshells.''',
      contentBn: '''আপনার খামারে ডিমের উৎপাদন বাড়ানো রাতারাতি সম্ভব নয়, তবে সঠিক ব্যবস্থাপনার মাধ্যমে ভালো ফলন পাওয়া যায়।

১. উন্নত মানের খাবার
একটি ডিম পাড়া মুরগির খাবারে ১৬% থেকে ১৮% প্রোটিন এবং পর্যাপ্ত ক্যালসিয়াম থাকা প্রয়োজন।

২. পর্যাপ্ত আলো
ডিম উৎপাদনের জন্য মুরগির দৈনিক ১৪-১৬ ঘণ্টা আলোর প্রয়োজন। শীতকালে কৃত্রিম আলোর ব্যবস্থা করুন।

৩. মানসিক চাপ কমানো
শিকারী প্রাণী, অতিরিক্ত গরম বা অতিরিক্ত ভিড় মুরগির ডিম পাড়া বন্ধ করে দিতে পারে। 

৪. বিশুদ্ধ পানি
একটি ডিমের ৭৫% পানি। কয়েক ঘণ্টা পানি না পেলে উৎপাদন কয়েক সপ্তাহের জন্য বন্ধ হতে পারে।

৫. ক্যালসিয়াম সরবরাহ
ডিমের খোসা শক্ত করতে আলাদা পাত্রে ঝিনুকের গুঁড়া বা ক্যালসিয়াম সরবরাহ করুন।''',
    ),
    Article(
      id: "2",
      titleEn: "Understanding Broiler Nutrition",
      titleBn: "ব্রয়লার পুষ্টি ব্যবস্থাপনা",
      author: "Dr. A. Rahman",
      readTime: "6 min read",
      imageUrl: "https://images.unsplash.com/photo-1518495973542-4542c06a5843?auto=format&fit=crop&q=80&w=1000",
      contentEn: '''Broiler nutrition is the cornerstone of a profitable poultry business. Formulating the perfect diet means understanding the energy and protein requirements at each stage of a bird's life.

Pre-Starter Phase (Day 0-14)
Chicks need a high protein content (up to 23%) to develop their immune system, organs, and skeletal structure rapidly. This feed is usually in crumble form to make it easy for small beaks to consume.

Starter Phase (Day 15-28)
Protein drops slightly to around 21%, while metabolic energy requirements increase. This phase focuses on rapid muscle development.

Grower/Finisher Phase (Day 29+)
Protein drops further down to 18%-19%, but the energy density hits its peak to facilitate fat deposition and maximize final body weight before harvest. Pellet feeding is highly recommended during this phase to reduce feed waste and improve FCR.''',
      contentBn: '''ব্রয়লার মুরগির পুষ্টি একটি লাভজনক পোল্ট্রি ব্যবসার মূলভিত্তি। প্রতিটি বয়সের স্তরে সঠিক পুষ্টি নিশ্চিত করা জরুরি।

প্রি-স্টার্টার পর্যায় (০-১৪ দিন)
বাচ্চাদের রোগ প্রতিরোধ ক্ষমতা ও হাড়ের গঠনের জন্য ২৩% প্রোটিনযুক্ত খাবার প্রয়োজন। 

স্টার্টার পর্যায় (১৫-২৮ দিন)
এই সময়ে প্রোটিনের পরিমাণ কিছুটা কমিয়ে ২১% করা হয়, তবে ক্যালরির চাহিদা বাড়ে। এই পর্যায়ে দ্রুত পেশী গঠিত হয়।

গ্রোয়ার/ফিনিশার পর্যায় (২৯+ দিন)
প্রোটিন ১৮%-১৯%-এ নামিয়ে আনা হয় এবং ক্যালরি সর্বোচ্চ মাত্রায় রাখা হয় যাতে মুরগির ওজন দ্রুত বৃদ্ধি পায়। এই পর্যায়ে পেলেট (Pellet) খাবার দিলে খাদ্যের অপচয় কমে এবং এফসিআর (FCR) ভালো হয়।''',
    ),
    Article(
      id: "3",
      titleEn: "Winter Care for Chickens",
      titleBn: "শীতকালে মুরগির যত্ন",
      author: "MurgiCare Experts",
      readTime: "5 min read",
      imageUrl: "https://images.unsplash.com/photo-1569058242252-623df46b5025?auto=format&fit=crop&q=80&w=1000",
      contentEn: '''Winter can be harsh on your flock. Preparing your coop before the first freeze is essential to prevent cold stress, frostbite, and respiratory diseases.

1. Draft-Free, Not Airtight
Close up holes where freezing drafts can hit the birds directly, but DO NOT seal the coop airtight. Ammonia buildup from droppings is more fatal than the cold itself.

2. Deep Litter Method
Allow pine shavings to accumulate on the floor. As droppings compost with the shavings, it generates natural heat from the floor up.

3. Combat Frostbite
Apply petroleum jelly (Vaseline) to the combs and wattles of breeds with large wattles to prevent frostbite.

4. Heated Waterers
Chickens cannot drink frozen water. Use a heated water base to keep water accessible 24/7.''',
      contentBn: '''শীতকাল মুরগির জন্য ঝুঁকিপূর্ণ হতে পারে। ঠান্ডা লাগা এবং শ্বাসকষ্টজনিত রোগ থেকে বাঁচাতে আগাম প্রস্তুতি নিন।

১. বাতাস চলাচল 
সরাসরি ঠান্ডা বাতাস যেন না ঢোকে সেদিকে খেয়াল রাখুন, তবে ঘর পুরোপুরি বায়ুরোধী করবেন না। ঘরের গ্যাস বের হওয়ার ব্যবস্থা থাকতে থাকতে হবে।

২. ডিপ লিটার পদ্ধতি
মেঝেতে কাঠের গুঁড়া ব্যবহার করুন। এটি ধীরে ধীরে কম্পোস্ট হয়ে প্রাকৃতিকভাবে ঘর গরম রাখবে।

৩. ফ্রস্টবাইট প্রতিরোধ
বড় ঝুটিওয়ালা মুরগির ঝুটিতে ভ্যাসলিন লাগিয়ে দিন, এতে ফ্রস্টবাইট হবে না।

৪. কুসুম গরম পানি
মুরগি বরফ ঠান্ডা পানি খেতে পারে না। প্রয়োজনে দিনে কয়েকবার হালকা গরম পানি সরবরাহ করুন।''',
    ),
  ];

  static List<Article> parentsStockArticles = [
    Article(
      id: "ps_1",
      titleEn: "Cobb 500 Parent Stock Management Guide",
      titleBn: "কব্ব ৫০০ প্যারেন্টস স্টক ব্যবস্থাপনা নির্দেশিকা",
      author: "Dr. S. Hossain",
      readTime: "7 min read",
      imageUrl: "https://images.unsplash.com/photo-1548550023-2bdb3c5beed7?auto=format&fit=crop&q=80&w=1000",
      contentEn: '''Managing Cobb 500 Parent Stock efficiently requires strict adherence to body weight targets, lighting schedules, and precision feeding.

1. Rearing Phase Target Weights
Uniformity is critical. Weekly sampling of at least 5% of the flock ensures that feed allocations match the growth curve precisely without over-fattening pullets.

2. Male to Female Ratio
Maintain an initial male-to-female mating ratio of 9% to 10%. Routinely evaluate male physical condition, spur development, and body weight to replace unproductive roosters.

3. Lighting Program
Controlled light intensity (up to 14-16 hours per day during lay phase) stimulates optimum egg production and maintains peak lay duration.

4. Nesting Hygiene & Floor Egg Prevention
Provide clean, dust-free nest boxes (1 nest per 4-5 hens). Collect eggs at least 4 to 6 times daily to keep hatchable eggs clean and pristine.''',
      contentBn: '''কব্ব ৫০০ প্যারেন্টস স্টক দক্ষতার সাথে পরিচালনা করার জন্য দেহের সঠিক ওজন, আলোর সময়সূচী এবং নিখুঁত খাদ্য ব্যবস্থাপনার ওপর গুরুত্ব দেওয়া প্রয়োজন।

১. লালন-পালন পর্যায়ে ওজনের সমতা
পাখির ওজনের সমতা বজায় রাখা অত্যন্ত জরুরি। প্রতি সপ্তাহে অন্তত ৫% পাখির ওজন মেপে খাদ্যের পরিমাণ নির্ধারণ করুন।

২. মোরগ ও মুরগির অনুপাত
প্রাথমিক পর্যায়ে ৯% থেকে ১০% মোরগ রাখুন। মোরগের শারীরিক ফিটনেস নিয়মিত পরীক্ষা করুন।

৩. আলোক ব্যবস্থাপনা
ডিম পাড়ার সময় দৈনিক ১৪-১৬ ঘণ্টা আলোর ব্যবস্থা করুন যা ডিমের উৎপাদন সর্বোচ্চ রাখতে সাহায্য করে।

৪. বাসা এবং ডিমের পরিচ্ছন্নতা
প্রতি ৪-৫ টি মুরগির জন্য ১টি করে পরিষ্কার নেস্ট বক্স রাখুন। দিনে ৪-৬ বার ডিম সংগ্রহ করুন।''',
    ),
    Article(
      id: "ps_2",
      titleEn: "Ross 308 Breeder Care & Feed Guidelines",
      titleBn: "রস ৩০৮ ব্রিডার পরিচর্যা ও খাদ্য নির্দেশিকা",
      author: "Poultry Tech Team",
      readTime: "6 min read",
      imageUrl: "https://images.unsplash.com/photo-1518495973542-4542c06a5843?auto=format&fit=crop&q=80&w=1000",
      contentEn: '''Ross 308 breeders require specialized care to balance female egg yield with male fertility throughout the production cycle.

1. Separate Sex Feeding (SSF)
Use separate feeding systems for males and females to prevent roosters from consuming hen feed, which causes excessive male weight gain and decreased mating efficiency.

2. Peak Egg Laying Nutrition
Ensure layer feed contains adequate crude protein (16.5%), calcium (3.2%-3.5%), and available phosphorus to maintain shell integrity.

3. Water Quality & Sanitation
Continuous access to clean, sanitized drinking water with optimal pH (6.0 - 6.8) is essential for optimum nutrient absorption.

4. Biosecurity Controls
Strict biosecurity at farm entry gates, footwear sanitation dip, and shower-in facilities prevent vertical transmission of MG/MS pathogens.''',
      contentBn: '''রস ৩০৮ ব্রিডারে ডিমের উচ্চ উৎপাদন এবং মোরগের উর্বরতা বজায় রাখতে বিশেষ পরিচর্যা প্রয়োজন।

১. আলাদা খাদ্য ব্যবস্থা (Separate Sex Feeding)
মোরগ ও মুরগির খাদ্য ব্যবস্থা আলাদা রাখুন যাতে মোরগ অতিরিক্ত ভারী না হয়ে যায় এবং প্রজনন ক্ষমতা ঠিক থাকে।

২. ডিম পাড়ার সময়ে পুষ্টি
খাদ্যে পর্যাপ্ত প্রোটিন (১৬.৫%) এবং ক্যালসিয়াম (৩.২%-৩.৫%) নিশ্চিত করুন যাতে ডিমের খোসা শক্ত হয়।

৩. বিশুদ্ধ পানি সরবরাহ
পিএইচ (৬.০ - ৬.৮) নিয়ন্ত্রিত বিশুদ্ধ পানি সরবরাহ নিশ্চিত করুন।

৪. বায়োসিকিউরিটি বা জৈব নিরাপত্তা
ফার্মের প্রবেশদ্বারে জুতোর জীবাণুমুক্তকরণ ও কঠোর জৈব নিরাপত্তা বজায় রাখুন।''',
    ),
    Article(
      id: "ps_3",
      titleEn: "Parent Stock Biosecurity & Vaccination Protocols",
      titleBn: "প্যারেন্টস স্টক বায়োসিকিউরিটি ও টিকাদান প্রোটোকল",
      author: "Dr. K. Ahmed",
      readTime: "8 min read",
      imageUrl: "https://images.unsplash.com/photo-1569058242252-623df46b5025?auto=format&fit=crop&q=80&w=1000",
      contentEn: '''A robust vaccination schedule and strict biosecurity program protect parent stock from devastating viral and bacterial outbreaks.

1. Vaccination Timelines
Administer primary vaccinations for ND, IB, IBD (Gumboro), Reovirus, Fowl Pox, and Salmonella before 18 weeks of age. Apply killed oil-emulsion boosters prior to lay start.

2. Maternal Antibody Transfer
Properly vaccinated parent stock transmit strong maternal antibodies to day-old chicks, shielding them during the critical first week of life.

3. Air Quality & Ventilation
Maintain tunnel ventilation with evaporative cooling pads to manage ambient temperature and prevent heat stress during hot summer months.

4. Pest & Rodent Eradication
Implement strict rodent baiting programs around breeder house perimeters to prevent Salmonella Enteritidis infection.''',
      contentBn: '''একটি কার্যকর টিকাদান সময়সূচী এবং বায়োসিকিউরিটি প্যারেন্টস স্টককে মারাত্মক রোগ থেকে রক্ষা করে।

১. সময়মত টিকাদান
১৮ সপ্তাহ বয়সের আগেই রানীক্ষেত, আইবি, গামবোরো, ফাউল পক্স ও সালমোনেলার প্রাথমিক ভ্যাকসিন সম্পন্ন করুন।

২. মাতৃজনিত এন্টিবডি (Maternal Antibody)
সঠিকভাবে টিকাপ্রাপ্ত প্যারেন্টস স্টক একদিনের বাচ্চার দেহে শক্তিশালী এন্টিবডি সঞ্চারিত করে।

৩. বাতাস চলাচল ও তাপমাত্রা
গ্রীষ্মকালে হিট স্ট্রোক এড়াতে টানেল ভেন্টিলেশন ও কুলিং প্যাডের মাধ্যমে ঘর ঠান্ডা রাখুন।

৪. ইঁদুর ও ক্ষতিকর প্রাণী নিয়ন্ত্রণ
ঘর এবং চারপাশের এলাকায় ইঁদুর ও পোকা দমনে নিয়মিত ব্যবস্থা গ্রহণ করুন।''',
    ),
    Article(
      id: "ps_4",
      titleEn: "Optimizing Breeder Flock Hatchability & Shell Quality",
      titleBn: "ব্রিডার ফ্লকের ডিমের হ্যাচেবিলিটি ও শেলের মান বৃদ্ধি",
      author: "MurgiCare Specialists",
      readTime: "5 min read",
      imageUrl: "https://images.unsplash.com/photo-1582722872445-44dc5f7e3c8f?auto=format&fit=crop&q=80&w=1000",
      contentEn: '''High hatchability starts in the breeder house with excellent shell quality and proper egg handling.

1. Calcium & Trace Minerals
Incorporate coarse limestone grit in late afternoon feeding to provide sustained calcium release during nighttime shell formation.

2. Egg Storage Temperature & Humidity
Store hatching eggs at 15°C - 18°C (59°F - 64°F) with 75%-80% relative humidity to prevent embryo dehydration during farm storage.

3. Sanitation of Hatchable Eggs
Fumigate or sanitize eggs within 2 hours of collection. Never wash hatching eggs with cold water as it forces bacteria through shell pores.

4. Rejecting Defective Eggs
Strictly sort out cracked, misshapen, dirty, or double-yolked eggs before shipping to the hatchery.''',
      contentBn: '''উচ্চ হ্যাচেবিলিটি নিশ্চিত করতে ডিমের খোসার মান ও সঠিক ডিম সংরক্ষণ অত্যন্ত গুরুত্বপূর্ণ।

১. ক্যালসিয়াম ও ট্রেস মিনারেল
বিকালে মোটা দানার লাইমস্টোন বা চুনাপাথর খাদ্যে যুক্ত করুন যাতে রাতে খোসা গঠনের সময় ক্যালসিয়াম পাওয়া যায়।

২. ডিমের তাপমাত্রা ও আর্দ্রতা
ডিম ১৫°সে - ১৮°সে তাপমাত্রায় এবং ৭৫%-৮০% আর্দ্রতায় সংরক্ষণ করুন।

৩. জীবাণুমুক্তকরণ
সংগ্রহের ২ ঘণ্টার মধ্যে হ্যাচিং ডিম স্যানিটাইজ করুন। ঠান্ডা পানি দিয়ে ডিম ধুবেন না।

৪. ত্রুটিযুক্ত ডিম বর্জন
ফাটা, ময়লা বা অস্বাভাবিক আকারের ডিম ইনকিউবেটরে দেওয়ার আগে আলাদা করুন।''',
    ),
  ];

  static List<Article> hatcheryArticles = [
    Article(
      id: "h_1",
      titleEn: "Incubation Temperature & Humidity Masterclass",
      titleBn: "ইনকিউবেশন তাপমাত্রা ও আর্দ্রতা নিয়ন্ত্রণ গাইড",
      author: "Hatchery Specialist R. Karim",
      readTime: "8 min read",
      imageUrl: "https://images.unsplash.com/photo-1500595046743-cd271d694d30?auto=format&fit=crop&q=80&w=1000",
      contentEn: '''Precision control of incubator environmental parameters is the single most critical factor determining chick hatchability and quality.

1. Setter Temperature & Relative Humidity
Maintain multi-stage setter temperature at 99.5°F (37.5°C) with 53%-55% RH. Embryo development is highly sensitive to overheating; even 1°F excess can cause malformations.

2. Automatic Egg Turning
Turn eggs 45 degrees hourly during the first 18 days of incubation. Turning prevents the embryo from adhering to the inner shell membrane.

3. Transfer to Hatcher (Day 18)
Move eggs from setter to hatcher trays at Day 18. Adjust hatcher temperature to 98.5°F (36.9°C) and raise humidity to 65%-70% RH to facilitate shell pipping.

4. Moisture Loss Control
Target an egg weight loss of 11%-12% from setter loading to Day 18 transfer to ensure proper air cell formation.''',
      contentBn: '''ইনকিউবেটরের পরিবেশগত তাপমাত্রা ও আর্দ্রতার নিখুঁত নিয়ন্ত্রণ বাচ্চার মান ও হ্যাচেবিলিটি নির্ধারণ করে।

১. সেটারের তাপমাত্রা ও আর্দ্রতা
সেটারে ৯৯.৫° ফারেনহাইট (৩৭.৫° সেলসিয়াস) তাপমাত্রা এবং ৫৩%-৫৫% আর্দ্রতা বজায় রাখুন। অতিরিক্ত গরম ভ্রূণের ক্ষতি করে।

২. স্বয়ংক্রিয় ডিম ঘোরানো (Turning)
প্রথম ১৮ দিন প্রতি ঘণ্টায় ৪৫ ডিগ্রি কোণে ডিম ঘোরান যাতে ভ্রূণ খোসার ভিতরের মেমব্রেনে আটকে না যায়।

৩. হ্যাচারে স্থানান্তর (১৮ তম দিন)
১৮ তম দিনে ডিম সেটার থেকে হ্যাচারে স্থানান্তর করুন। তাপমাত্রা ৯৮.৫° ফারেনহাইট এবং আর্দ্রতা ৬৫%-৭০%-এ উন্নীত করুন।

৪. ওজনের আর্দ্রতা হ্রাস
১৮ তম দিন পর্যন্ত ডিমের ওজনের ১১%-১২% আর্দ্রতা হ্রাস পাওয়া আদর্শ এয়ার সেল গঠনের নির্দেশক।''',
    ),
    Article(
      id: "h_2",
      titleEn: "Egg Candling & Embryonic Analysis Protocols",
      titleBn: "ডিম ক্যান্ডলিং ও ভ্রূণ বিকাশ পরীক্ষা পদ্ধতি",
      author: "Eng. M. Rahman",
      readTime: "6 min read",
      imageUrl: "https://images.unsplash.com/photo-1516467508483-a7212febe31a?auto=format&fit=crop&q=80&w=1000",
      contentEn: '''Egg candling provides invaluable real-time insights into flock fertility, incubator performance, and embryonic mortality stages.

1. Day 7 Candling
Perform the first candling at Day 7 to identify infertile (clear) eggs and early embryonic mortality (blood rings). Remove infertiles to optimize airflow.

2. Day 14 Moisture Cell Check
Verify air cell size progression. Small air cells indicate high humidity, while oversized air cells point to insufficient humidity.

3. Day 18 Pre-Transfer Break-Out
Conduct breakout analysis on unhatched or clear eggs to determine if losses are caused by breeder nutrition, incubation temperature spikes, or bacterial infections.

4. High-Intensity LED Candlers
Use cool-light LED candling lamps to avoid heating up live embryos during inspection.''',
      contentBn: '''ডিম ক্যান্ডলিংয়ের মাধ্যমে ব্রিডার ফার্মের উর্বরতা এবং ইনকিউবেটরের পারফরম্যান্স সহজেই মূল্যায়ন করা যায়।

১. ৭ম দিনে ক্যান্ডলিং
৭ম দিনে প্রথম ক্যান্ডলিং করে অনূর্বর ডিম এবং ব্লাড রিংযুক্ত মৃত ভ্রূণ ডিম সরাতে হবে।

২. ১৪তম দিনে এয়ার সেল পরীক্ষা
ডিমের এয়ার সেল বা বাতাসের ঘর ঠিকমতো বড় হচ্ছে কিনা তা পর্যবেক্ষণ করুন।

৩. ১৮তম দিনে ব্রেক-আউট অ্যানালাইসিস
ফুটেনি এমন ডিম পরীক্ষা করে মৃত্যুর কারণ (পুষ্টির অভাব, অতিরিক্ত গরম বা ব্যাকটেরিয়া) চিহ্নিত করুন।

৪. হাই-ইনটেনসিটি এলইডি ক্যান্ডলার
ভ্রূণ গরম হওয়া রোধ করতে উচ্চক্ষমতার কোল্ড-লাইট এলইডি ক্যান্ডলার ব্যবহার করুন।''',
    ),
    Article(
      id: "h_3",
      titleEn: "Sanitation & Bio-Safety Standards in Modern Hatcheries",
      titleBn: "আধুনিক হ্যাচারিতে জীবাণুমুক্তকরণ ও বায়ো-সেফটি মানদণ্ড",
      author: "Dr. F. Yasmin",
      readTime: "7 min read",
      imageUrl: "https://images.unsplash.com/photo-1584308666744-24d5c474f2ae?auto=format&fit=crop&q=80&w=1000",
      contentEn: '''Preventing bacterial and fungal contamination in the hatchery is vital for producing healthy, disease-free chicks with high early survival rates.

1. One-Way Work Flow
Design hatchery traffic so clean areas (egg receiving, setter rooms) never cross paths with dirty areas (hatcher room, chick processing, waste disposal).

2. Air Pressure Gradients
Maintain positive air pressure in clean setter areas relative to hatcher and waste rooms to prevent airborne spore transmission.

3. Formaldehyde & Fogging Protocols
Enforce automated disinfectant misting and sanitization cycles in hatchers immediately following chick removal.

4. Swab Testing & Microbial Monitoring
Regularly swab setter walls, hatcher trays, and ventilation ducts for Pseudomonas, Aspergillus, and Salmonella colonies.''',
      contentBn: '''হ্যাচারিতে ব্যাকটেরিয়াল ও ফাঙ্গাল সংক্রমণ রোধ একদিনের বাচ্চার বাঁচ হার বৃদ্ধির পূর্বশর্ত।

১. একমুখী কর্মপ্রবাহ (One-Way Workflow)
হ্যাচারির ডিজাইন এমন হতে হবে যেন পরিষ্কার এলাকা (ডিম গ্রহণ, সেটার) এবং নোংরা এলাকা (হ্যাচার, বর্জ্য নিষ্কাশন) আলাদা থাকে।

২. বায়ুমণ্ডলীয় চাপ নিয়ন্ত্রণ (Air Pressure)
সেটার কক্ষে ধনাত্মক বায়ুচাপ বজায় রাখুন যাতে হ্যাচার বা বর্জ্য কক্ষের দূষিত বাতাস না আসতে পারে।

৩. স্বয়ংক্রিয় ফগিং ও স্প্রে
বাচ্চা সরানোর পরপরই হ্যাচার ট্রে এবং ইউনিট জীবাণুমুক্তকরণ স্প্রে ও ধোঁয়া দিয়ে পরিষ্কার করুন।

৪. সোয়াব টেস্ট (Swab Testing)
নিয়মিত সেটার এবং হ্যাচারের দেয়াল থেকে মেঝের সোয়াব টেস্ট করে জীবাণুর উপস্থিতি পরীক্ষা করুন।''',
    ),
    Article(
      id: "h_4",
      titleEn: "Day-Old Chick (DOC) Grading, Vaccination & Transport",
      titleBn: "একদিনের বাচ্চা বাছাই, টিকাদান ও পরিবহন গাইড",
      author: "MurgiCare Hatchery Operations",
      readTime: "5 min read",
      imageUrl: "https://images.unsplash.com/photo-1563281577-a7be47e20db9?auto=format&fit=crop&q=80&w=1000",
      contentEn: '''Delivering vigorous, healthy chicks to poultry farmers requires rigorous Pasgar score grading, subcutaneous vaccination, and climate-controlled transport.

1. Chick Quality Grading (Pasgar Score)
Assess chicks for navel closure, alert eyes, unabsorbed yolk sacs, legs quality, and activity level. Reject unhealed or weak chicks.

2. In-Ovo & Day-1 Vaccination
Administer automated spray vaccines for Newcastle Disease (ND) and Infectious Bronchitis (IB), or subcutaneous injections for Marek's disease.

3. Chick Holding Room Conditions
Keep chick holding rooms at 24°C - 26°C (75°F - 78°F) with 60% RH and gentle air circulation to prevent chick chilling or overheating.

4. Environmentally Controlled Vehicles
Transport chicks in insulated vans equipped with dual heating/cooling units and ventilation monitoring to ensure zero mortality during transit.''',
      contentBn: '''খামারীদের কাছে সুস্থ ও সবল বাচ্চা পৌঁছাতে বাচ্চা গ্রেডিং, স্প্রে ভ্যাক্সিনেশন এবং শীতাতপ নিয়ন্ত্রিত পরিবহন অত্যাবশ্যক।

১. বাচ্চার মান বাছাই (Pasgar Score)
বাচ্চার নাভি শুকানো, চোখের উজ্জ্বলতা, পায়ের চামড়ার খসখসে ভাব এবং চপলতা পরীক্ষা করে প্রথম শ্রেণীর বাচ্চা বাছাই করুন।

২. প্রথম দিনের টিকাদান
রানীক্ষেত (ND) ও সংক্রামক ব্রঙ্কাইটিসের (IB) জন্য স্প্রে ভ্যাকসিন এবং মারেক্স রোগের জন্য ইনজেকশন নিশ্চিত করুন।

৩. হোল্ডিং রুমের পরিবেশ
বাচ্চা রাখার ঘর ২৪°সে - ২৬°সে তাপমাত্রা এবং ৬০% আর্দ্রতায় রাখুন।

৪. নিয়ন্ত্রিত পরিবহন যান
পরিবহনের সময় মৃত্যু হার শূন্য রাখতে ভেন্টিলেশন ও তাপমাত্রা নিয়ন্ত্রিত গাড়িতে বাচ্চা পরিবহন করুন।''',
    ),
  ];
}

