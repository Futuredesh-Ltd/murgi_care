import 'package:flutter/material.dart';

class EmbryoStageItem {
  final int day;
  final String titleEn;
  final String titleBn;
  final String imagePath;
  final List<String> shortBullets;
  final List<String> detailBullets;

  const EmbryoStageItem({
    required this.day,
    required this.titleEn,
    required this.titleBn,
    required this.imagePath,
    required this.shortBullets,
    required this.detailBullets,
  });
}

class EmbryonicStagesScreen extends StatefulWidget {
  final bool isEnglish;

  const EmbryonicStagesScreen({super.key, required this.isEnglish});

  @override
  State<EmbryonicStagesScreen> createState() => _EmbryonicStagesScreenState();
}

class _EmbryonicStagesScreenState extends State<EmbryonicStagesScreen> {
  int _selectedFilter = 0; // 0: All, 1: Week 1, 2: Week 2, 3: Week 3

  static const List<EmbryoStageItem> _stages = [
    // --- WEEK 1 ---
    EmbryoStageItem(
      day: 1,
      titleEn: "Day 1 - Early Blastoderm",
      titleBn: "Day 1 - Early Blastoderm",
      imagePath: "assets/embryo_day_1.png",
      shortBullets: [
        "Embryo কুসুমের উপর ভাসমান অবস্থায় থাকে",
        "Blastoderm ডোনাট আকৃতি নেয় (central zone clear)",
      ],
      detailBullets: [
        "Embryo কুসুমের উপর ভাসমান অবস্থায় থাকে",
        "Blastoderm ডোনাট আকৃতি নেয় (central zone clear)",
        "Primitive streak তৈরি হয়ে body axis শুরু হয়",
        "Head ও spinal cord এর প্রাথমিক গঠন শুরু হয়",
        "ভবিষ্যৎ organ development এর ভিত্তি তৈরি হয়",
      ],
    ),
    EmbryoStageItem(
      day: 2,
      titleEn: "Day 2 - Blood Formation",
      titleBn: "Day 2 - Blood Formation",
      imagePath: "assets/embryo_day_2.png",
      shortBullets: [
        "Heart tube তৈরি হয়ে beat শুরু হয় (critical stage)",
        "Blood vessel yolk এর সাথে সংযুক্ত হয়",
      ],
      detailBullets: [
        "Heart tube তৈরি হয়ে beat শুরু হয় (critical stage)",
        "Blood vessel yolk এর সাথে সংযুক্ত হয়",
        "Embryo C-shape নেয়",
        "Amnion গঠন শুরু হয় (protective membrane)",
        "Circulatory system develop হতে থাকে",
      ],
    ),
    EmbryoStageItem(
      day: 3,
      titleEn: "Day 3 - Heart & Circulation",
      titleBn: "Day 3 - Heart & Circulation",
      imagePath: "assets/embryo_day_3.png",
      shortBullets: [
        "Heart clearly beating এবং circulation active",
        "Blood vessel network পুরো yolk এ ছড়িয়ে পড়ে",
      ],
      detailBullets: [
        "Heart clearly beating এবং circulation active",
        "Blood vessel network পুরো yolk এ ছড়িয়ে পড়ে",
        "Eyes dark spot হিসেবে visible হয়",
        "Wing ও leg bud শুরু হয়",
        "Embryo movement শুরু হতে পারে",
      ],
    ),
    EmbryoStageItem(
      day: 4,
      titleEn: "Day 4 - Eye & Brain Development",
      titleBn: "Day 4 - Eye & Brain Development",
      imagePath: "assets/embryo_day_4.png",
      shortBullets: [
        "Brain দ্রুত বৃদ্ধি পায়",
        "Eyes বড় হয়ে pigment develop হয়",
      ],
      detailBullets: [
        "Brain দ্রুত বৃদ্ধি পায়",
        "Eyes বড় হয়ে pigment develop হয়",
        "Tongue ও skeletal system develop শুরু",
        "Blood circulation আরও দ্রুত হয়",
        "Body curvature স্পষ্ট হয়",
      ],
    ),
    EmbryoStageItem(
      day: 5,
      titleEn: "Day 5 - Organ Formation",
      titleBn: "Day 5 - Organ Formation",
      imagePath: "assets/embryo_day_5.png",
      shortBullets: [
        "Brain growth খুব দ্রুত হয়",
        "Beak এর প্রাথমিক গঠন শুরু হয়",
      ],
      detailBullets: [
        "Brain growth খুব দ্রুত হয়",
        "Beak এর প্রাথমিক গঠন শুরু হয়",
        "Limb (ডানা ও পা) স্পষ্ট দেখা যায়",
        "Sex differentiation শুরু হতে পারে",
        "Internal organ formation এগিয়ে যায়",
      ],
    ),
    EmbryoStageItem(
      day: 6,
      titleEn: "Day 6 - Movement & Beak",
      titleBn: "Day 6 - Movement & Beak",
      imagePath: "assets/embryo_day_6.png",
      shortBullets: [
        "Beak স্পষ্ট হয়ে ওঠে",
        "Voluntary movement শুরু হয়",
      ],
      detailBullets: [
        "Beak স্পষ্ট হয়ে ওঠে",
        "Voluntary movement শুরু হয়",
        "Wing ও leg আরও বড় হয়",
        "Egg tooth develop শুরু",
        "Embryo bird-like shape নিতে থাকে",
      ],
    ),
    EmbryoStageItem(
      day: 7,
      titleEn: "Day 7 - Comb & Structure",
      titleBn: "Day 7 - Comb & Structure",
      imagePath: "assets/embryo_day_7.png",
      shortBullets: [
        "Comb develop শুরু হয়",
        "Wings ও legs লম্বা হয়",
      ],
      detailBullets: [
        "Comb develop শুরু হয়",
        "Wings ও legs লম্বা হয়",
        "Egg tooth স্পষ্ট দেখা যায়",
        "Eyes prominent হয়",
        "Body structure আরও পরিষ্কার হয়",
      ],
    ),

    // --- WEEK 2 ---
    EmbryoStageItem(
      day: 8,
      titleEn: "Day 8 - Feather Start",
      titleBn: "Day 8 - Feather Start",
      imagePath: "assets/embryo_day_8.png",
      shortBullets: [
        "Feather follicles তৈরি হয়",
        "Ear opening দেখা যায়",
      ],
      detailBullets: [
        "Feather follicles তৈরি হয়",
        "Ear opening দেখা যায়",
        "Body outline আরও স্পষ্ট হয়",
        "Upper ও lower beak সমান হয়",
        "Embryo bird-এর মতো দেখতে শুরু করে",
      ],
    ),
    EmbryoStageItem(
      day: 9,
      titleEn: "Day 9 - Bird Shape",
      titleBn: "Day 9 - Bird Shape",
      imagePath: "assets/embryo_day_9.png",
      shortBullets: [
        "Claws (নখ) develop হয়",
        "Feather গঠন শুরু হয়",
      ],
      detailBullets: [
        "Claws (নখ) develop হয়",
        "Feather গঠন শুরু হয়",
        "Embryo সম্পূর্ণ bird shape নেয়",
        "Mouth opening তৈরি হয়",
        "Movement বৃদ্ধি পায়",
      ],
    ),
    EmbryoStageItem(
      day: 10,
      titleEn: "Day 10 - Feather Growth",
      titleBn: "Day 10 - Feather Growth",
      imagePath: "assets/embryo_day_10.png",
      shortBullets: [
        "Down feather দেখা যায়",
        "Beak ও egg tooth শক্ত হয়",
      ],
      detailBullets: [
        "Down feather দেখা যায়",
        "Beak ও egg tooth শক্ত হয়",
        "Feather coverage বাড়ে",
        "Body size দ্রুত বৃদ্ধি পায়",
        "Chick-like appearance বাড়ে",
      ],
    ),
    EmbryoStageItem(
      day: 11,
      titleEn: "Day 11 - Eyelids & Growth",
      titleBn: "Day 11 - Eyelids & Growth",
      imagePath: "assets/embryo_day_11.png",
      shortBullets: [
        "Eyelids চোখ ঢেকে ফেলে",
        "Tail feather দেখা যায়",
      ],
      detailBullets: [
        "Eyelids চোখ ঢেকে ফেলে",
        "Tail feather দেখা যায়",
        "Body mass দ্রুত বাড়ে",
        "Feather density বৃদ্ধি পায়",
        "Organ development প্রায় সম্পূর্ণ",
      ],
    ),
    EmbryoStageItem(
      day: 12,
      titleEn: "Day 12 - Bone & Scale",
      titleBn: "Day 12 - Bone & Scale",
      imagePath: "assets/embryo_day_12.png",
      shortBullets: [
        "Bone calcification শুরু হয়",
        "Toe nail ও scales develop হয়",
      ],
      detailBullets: [
        "Bone calcification শুরু হয়",
        "Toe nail ও scales develop হয়",
        "Feather coverage বাড়ে",
        "Skeleton শক্ত হতে শুরু করে",
        "Body proportion balanced হয়",
      ],
    ),
    EmbryoStageItem(
      day: 13,
      titleEn: "Day 13 - Body Completion",
      titleBn: "Day 13 - Body Completion",
      imagePath: "assets/embryo_day_13.png",
      shortBullets: [
        "Skeleton আরও শক্ত হয়",
        "Body shape প্রায় সম্পূর্ণ হয়",
      ],
      detailBullets: [
        "Skeleton আরও শক্ত হয়",
        "Body shape প্রায় সম্পূর্ণ হয়",
        "Comb ও wattles develop হয়",
        "Feather density বৃদ্ধি পায়",
        "Chick appearance স্পষ্ট হয়",
      ],
    ),
    EmbryoStageItem(
      day: 14,
      titleEn: "Day 14 - Positioning Start",
      titleBn: "Day 14 - Positioning Start",
      imagePath: "assets/embryo_day_14.png",
      shortBullets: [
        "Embryo position change শুরু করে",
        "Head air cell এর দিকে যেতে থাকে",
      ],
      detailBullets: [
        "Embryo position change শুরু করে",
        "Head air cell এর দিকে যেতে থাকে",
        "Body fully chick-like হয়",
        "Claws শক্ত হয়",
        "Hatch preparation শুরু হয়",
      ],
    ),

    // --- WEEK 3 ---
    EmbryoStageItem(
      day: 15,
      titleEn: "Day 15 - Rapid Growth",
      titleBn: "Day 15 - Rapid Growth",
      imagePath: "assets/embryo_day_15.png",
      shortBullets: [
        "Feathers পুরো body cover করে",
        "Internal organs প্রায় সম্পূর্ণ হয়",
      ],
      detailBullets: [
        "Feathers পুরো body cover করে",
        "Internal organs প্রায় সম্পূর্ণ হয়",
        "Growth দ্রুত হয়",
        "Yolk absorption শুরু হতে থাকে",
        "Chick hatch এর জন্য প্রস্তুত হতে থাকে",
      ],
    ),
    EmbryoStageItem(
      day: 16,
      titleEn: "Day 16 - Yolk Absorption",
      titleBn: "Day 16 - Yolk Absorption",
      imagePath: "assets/embryo_day_16.png",
      shortBullets: [
        "Yolk sac শরীরের দিকে ঢুকতে শুরু করে",
        "Embryo egg এর বেশিরভাগ অংশ দখল করে",
      ],
      detailBullets: [
        "Yolk sac শরীরের দিকে ঢুকতে শুরু করে",
        "Embryo egg এর বেশিরভাগ অংশ দখল করে",
        "Feather coverage সম্পূর্ণ হয়",
        "Body size দ্রুত বৃদ্ধি পায়",
        "Hatch preparation এগোয়",
      ],
    ),
    EmbryoStageItem(
      day: 17,
      titleEn: "Day 17 - Hatch Position",
      titleBn: "Day 17 - Hatch Position",
      imagePath: "assets/embryo_day_17.png",
      shortBullets: [
        "Head ডানার নিচে ঢুকে যায়",
        "Final hatching position নেয়",
      ],
      detailBullets: [
        "Head ডানার নিচে ঢুকে যায়",
        "Final hatching position নেয়",
        "Neck curved থাকে",
        "Beak air cell এর দিকে থাকে",
        "Internal system mature হয়",
      ],
    ),
    EmbryoStageItem(
      day: 18,
      titleEn: "Day 18 - Lockdown",
      titleBn: "Day 18 - Lockdown",
      imagePath: "assets/embryo_day_18.png",
      shortBullets: [
        "Air cell বড় হয়",
        "Embryo পুরো egg fill করে",
      ],
      detailBullets: [
        "Air cell বড় হয়",
        "Embryo পুরো egg fill করে",
        "Incubator এ turning বন্ধ করা হয়",
        "Hatch preparation final stage",
        "Movement কমে যায়",
      ],
    ),
    EmbryoStageItem(
      day: 19,
      titleEn: "Day 19 - Internal Pipping",
      titleBn: "Day 19 - Internal Pipping",
      imagePath: "assets/embryo_day_19.png",
      shortBullets: [
        "Chick air cell এ internal pipping করে",
        "Lungs activate হয়",
      ],
      detailBullets: [
        "Chick air cell এ internal pipping করে",
        "Lungs activate হয়",
        "Yolk sac শরীরের ভেতরে ঢুকে যায়",
        "Oxygen intake শুরু হয়",
        "Hatch খুব নিকটে আসে",
      ],
    ),
    EmbryoStageItem(
      day: 20,
      titleEn: "Day 20 - External Pipping",
      titleBn: "Day 20 - External Pipping",
      imagePath: "assets/embryo_day_20.png",
      shortBullets: [
        "Chick shell crack করে (external pip)",
        "Sound করতে শুরু করে",
      ],
      detailBullets: [
        "Chick shell crack করে (external pip)",
        "Sound করতে শুরু করে",
        "Active movement হয়",
        "Shell break করার চেষ্টা করে",
        "Hatch imminent হয়",
      ],
    ),
    EmbryoStageItem(
      day: 21,
      titleEn: "Day 21 - Hatching",
      titleBn: "Day 21 - Hatching",
      imagePath: "assets/embryo_day_21.png",
      shortBullets: [
        "Chick shell ভেঙে সম্পূর্ণ বের হয়",
        "Navel heal হয়",
      ],
      detailBullets: [
        "Chick shell ভেঙে সম্পূর্ণ বের হয়",
        "Navel heal হয়",
        "Body শুকিয়ে fluffy হয়",
        "স্বাধীনভাবে শ্বাস নেয়",
        "Normal movement শুরু করে",
      ],
    ),
  ];

  List<EmbryoStageItem> get _filteredStages {
    if (_selectedFilter == 1) {
      return _stages.where((s) => s.day >= 1 && s.day <= 7).toList();
    } else if (_selectedFilter == 2) {
      return _stages.where((s) => s.day >= 8 && s.day <= 14).toList();
    } else if (_selectedFilter == 3) {
      return _stages.where((s) => s.day >= 15 && s.day <= 21).toList();
    }
    return _stages;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isEng = widget.isEnglish;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF121212) : const Color(0xFFF2F5F8),
      appBar: AppBar(
        backgroundColor: const Color(0xFF00695C),
        elevation: 0,
        centerTitle: true,
        foregroundColor: Colors.white,
        title: Text(
          isEng ? "Embryonic Stages" : "ভ্রূণ বিকাশ পর্যায় (Day 1 - 21)",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: Column(
        children: [
          // Filter Chips Header
          Container(
            color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFilterChip(0, isEng ? "All (1-21)" : "সকল দিন (১-২১)", isDark),
                  const SizedBox(width: 8),
                  _buildFilterChip(1, isEng ? "Week 1 (1-7)" : "সপ্তাহ ১ (১-৭)", isDark),
                  const SizedBox(width: 8),
                  _buildFilterChip(2, isEng ? "Week 2 (8-14)" : "সপ্তাহ ২ (৮-১৪)", isDark),
                  const SizedBox(width: 8),
                  _buildFilterChip(3, isEng ? "Week 3 (15-21)" : "সপ্তাহ ৩ (১৫-২১)", isDark),
                ],
              ),
            ),
          ),

          // List of Stages
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              itemCount: _filteredStages.length,
              itemBuilder: (context, index) {
                final item = _filteredStages[index];
                return _buildStageCard(context, item, isDark);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(int index, String label, bool isDark) {
    final isSelected = _selectedFilter == index;
    return ChoiceChip(
      label: Text(
        label,
        style: TextStyle(
          fontSize: 13,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          color: isSelected ? Colors.white : (isDark ? Colors.white70 : Colors.grey.shade800),
        ),
      ),
      selected: isSelected,
      selectedColor: const Color(0xFF00695C),
      backgroundColor: isDark ? const Color(0xFF2C2C2C) : Colors.grey.shade200,
      elevation: isSelected ? 2 : 0,
      onSelected: (selected) {
        if (selected) {
          setState(() {
            _selectedFilter = index;
          });
        }
      },
    );
  }

  Widget _buildStageCard(
    BuildContext context,
    EmbryoStageItem item,
    bool isDark,
  ) {
    final title = widget.isEnglish ? item.titleEn : item.titleBn;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF00695C).withValues(alpha: 0.12),
          width: 1,
        ),
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
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => EmbryoDayDetailScreen(
                  item: item,
                  isEnglish: widget.isEnglish,
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Clean High-Res Cropped Screenshot Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    width: 110,
                    height: 85,
                    color: isDark ? Colors.grey.shade900 : Colors.grey.shade100,
                    child: Image.asset(
                      item.imagePath,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: Icon(Icons.image_not_supported_rounded, color: Colors.grey),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 12),

                // Right Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white : const Color(0xFF1E293B),
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 5),

                      // Day Badge Tag
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: const Color(0xFF00695C).withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.calendar_today_rounded,
                              size: 12,
                              color: Color(0xFF00695C),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "Day ${item.day}:",
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF00695C),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 6),

                      // Bullets
                      ...item.shortBullets.map(
                        (bp) => Padding(
                          padding: const EdgeInsets.only(bottom: 3),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "• ",
                                style: TextStyle(
                                  fontSize: 12.5,
                                  color: isDark ? Colors.white70 : Colors.grey.shade700,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  bp,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 12.5,
                                    height: 1.25,
                                    color: isDark ? Colors.white70 : Colors.grey.shade800,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EmbryoDayDetailScreen extends StatelessWidget {
  final EmbryoStageItem item;
  final bool isEnglish;

  const EmbryoDayDetailScreen({
    super.key,
    required this.item,
    required this.isEnglish,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final title = isEnglish ? item.titleEn : item.titleBn;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF121212) : const Color(0xFFF2F5F8),
      appBar: AppBar(
        backgroundColor: const Color(0xFF00695C),
        elevation: 0,
        centerTitle: true,
        foregroundColor: Colors.white,
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Top Card with Screenshot Image
            Container(
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
              padding: const EdgeInsets.all(16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  constraints: const BoxConstraints(maxHeight: 250),
                  color: isDark ? Colors.black26 : Colors.grey.shade100,
                  child: Image.asset(
                    item.imagePath,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 180,
                      color: Colors.grey.shade200,
                      child: const Icon(Icons.image_not_supported_rounded, size: 50, color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Bottom Description Card
            Container(
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
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today_rounded,
                        size: 18,
                        color: Color(0xFF00695C),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "Day ${item.day}:",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white : const Color(0xFF1E293B),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  ...item.detailBullets.map(
                    (bp) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "• ",
                            style: TextStyle(
                              fontSize: 15,
                              color: isDark ? Colors.white70 : Colors.grey.shade800,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              bp,
                              style: TextStyle(
                                fontSize: 14.5,
                                height: 1.35,
                                color: isDark ? Colors.white70 : Colors.grey.shade800,
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
          ],
        ),
      ),
    );
  }
}
