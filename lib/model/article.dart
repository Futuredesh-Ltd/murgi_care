class Article {
  final String id;
  final String titleEn;
  final String titleBn;
  final String author;
  final String readTime;
  final String imageUrl;
  final String contentEn;
  final String contentBn;

  Article({
    required this.id,
    required this.titleEn,
    required this.titleBn,
    required this.author,
    required this.readTime,
    required this.imageUrl,
    required this.contentEn,
    required this.contentBn,
  });

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
সরাসরি ঠান্ডা বাতাস যেন না ঢোকে সেদিকে খেয়াল রাখুন, তবে ঘর পুরোপুরি বায়ুরোধী করবেন না। ঘরের গ্যাস বের হওয়ার ব্যবস্থা থাকতে হবে।

২. ডিপ লিটার পদ্ধতি
মেঝেতে কাঠের গুঁড়া ব্যবহার করুন। এটি ধীরে ধীরে কম্পোস্ট হয়ে প্রাকৃতিকভাবে ঘর গরম রাখবে।

৩. ফ্রস্টবাইট প্রতিরোধ
বড় ঝুটিওয়ালা মুরগির ঝুটিতে ভ্যাসলিন লাগিয়ে দিন, এতে ফ্রস্টবাইট হবে না।

৪. কুসুম গরম পানি
মুরগি বরফ ঠান্ডা পানি খেতে পারে না। প্রয়োজনে দিনে কয়েকবার হালকা গরম পানি সরবরাহ করুন।''',
    ),
  ];
}
