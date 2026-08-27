import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../services/poultry_service.dart';
import '../../model/banner_model.dart';
import '../../model/announcement_model.dart';
import '../../model/market_price_model.dart';
import '../../model/daily_card_model.dart';
import '../../model/article.dart';
import '../../controller/riverpod_providers.dart';
import '../widgets/marquee_ticker.dart';
import '../widgets/article_grid_widget.dart';
import '../screens/calculators_screen.dart';
import '../screens/production_cost_screen.dart';
import '../screens/farm_management_screen.dart';
import '../screens/vaccine_info_screen.dart';
import '../screens/poultry_diseases_screen.dart';

class HomeTab extends ConsumerStatefulWidget {
  final bool isEnglish;
  final VoidCallback onOpenDetection;
  final int subTabIndex;
  final ValueChanged<int>? onSubTabChanged;

  const HomeTab({
    super.key,
    required this.isEnglish,
    required this.onOpenDetection,
    this.subTabIndex = 0,
    this.onSubTabChanged,
  });

  @override
  ConsumerState<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends ConsumerState<HomeTab> {
  final PoultryService _poultryService = PoultryService();
  final PageController _bannerController = PageController();
  late PageController _subPageController;
  Timer? _bannerTimer;
  int _currentBannerIndex = 0;

  @override
  void initState() {
    super.initState();
    _subPageController = PageController(initialPage: widget.subTabIndex);
  }

  @override
  void didUpdateWidget(covariant HomeTab oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.subTabIndex != widget.subTabIndex) {
      if (_subPageController.hasClients &&
          _subPageController.page?.round() != widget.subTabIndex) {
        _subPageController.animateToPage(
          widget.subTabIndex,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeInOutCubic,
        );
      }
    }
  }

  void _startBannerAutoSlide(int totalPages) {
    _bannerTimer?.cancel();
    if (totalPages <= 1) return;
    _bannerTimer = Timer.periodic(const Duration(seconds: 4), (_) {
      if (!mounted || !_bannerController.hasClients) return;
      _currentBannerIndex = (_currentBannerIndex + 1) % totalPages;
      _bannerController.animateToPage(
        _currentBannerIndex,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _bannerTimer?.cancel();
    _bannerController.dispose();
    _subPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEng = widget.isEnglish;
    final selectedSubTabIndex = ref.watch(navigationProvider).homeSubTabIndex;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 8),
        // Top Tab Navigation Bar
        _buildSubTabBar(isEng, selectedSubTabIndex),

        const SizedBox(height: 4),

        // Sub Tab Content PageView with Smooth Animations
        Expanded(
          child: PageView(
            controller: _subPageController,
            physics: const BouncingScrollPhysics(),
            onPageChanged: (index) {
              ref.read(navigationProvider.notifier).setHomeSubTab(index);
              if (widget.onSubTabChanged != null) {
                widget.onSubTabChanged!(index);
              }
            },
            children: [
              // Page 0: Default Home Dashboard
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(height: 12),
                    // 1. Dynamic Banner Carousel
                    _buildBannerSection(),

                    const SizedBox(height: 16),
                    // 2. Date / Country / Time Card
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: _buildDateTimeCard(isEng),
                    ),

                    const SizedBox(height: 20),
                    // 3. Today's Wholesale Market Section
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: _buildMarketSection(isEng),
                    ),

                    const SizedBox(height: 24),
                    // 5. Six Feature Cards Grid
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: _buildFeatureCardsGrid(context, isEng),
                    ),

                    const SizedBox(height: 24),
                    // 6. Live General Articles & Guides Section
                    _buildGeneralArticlesSection(isEng),
                    const SizedBox(height: 100),
                  ],
                ),
              ),

              // Page 1: Parents Stock Grid
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(height: 12),
                    _buildSectionHeader(
                      title: isEng ? "Parents Stock Articles" : "প্যারেন্টস স্টক নিবন্ধ",
                      subtitle: isEng
                          ? "Breeder flock management, genetics & nutrition guides"
                          : "ব্রিডার স্টক ব্যবস্থাপনা, প্রজনন ও খাদ্য নির্দেশিকা",
                      icon: Icons.pets_rounded,
                      color: Colors.indigo,
                    ),
                    StreamBuilder<List<Article>>(
                      stream: _poultryService.getArticlesStream(category: 'parents_stock'),
                      builder: (context, snapshot) {
                        final liveArticles = snapshot.data;
                        final articles = (liveArticles != null && liveArticles.isNotEmpty)
                            ? liveArticles
                            : Article.parentsStockArticles;
                        return ArticleGridWidget(
                          articles: articles,
                          isEnglish: isEng,
                          categoryTag: isEng ? "Parents Stock" : "প্যারেন্টস স্টক",
                          categoryColor: Colors.indigo,
                        );
                      },
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),

              // Page 2: Hatchery Grid
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(height: 12),
                    _buildSectionHeader(
                      title: isEng ? "Hatchery Articles" : "হ্যাচারি নিবন্ধ",
                      subtitle: isEng
                          ? "Incubation parameters, egg candling & DOC care"
                          : "ইনকিউবেশন, ডিম ক্যান্ডলিং ও একদিনের বাচ্চার পরিচর্যা",
                      icon: Icons.egg_rounded,
                      color: Colors.orange.shade800,
                    ),
                    StreamBuilder<List<Article>>(
                      stream: _poultryService.getArticlesStream(category: 'hatchery'),
                      builder: (context, snapshot) {
                        final liveArticles = snapshot.data;
                        final articles = (liveArticles != null && liveArticles.isNotEmpty)
                            ? liveArticles
                            : Article.hatcheryArticles;
                        return ArticleGridWidget(
                          articles: articles,
                          isEnglish: isEng,
                          categoryTag: isEng ? "Hatchery" : "হ্যাচারি",
                          categoryColor: Colors.orange.shade800,
                        );
                      },
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSubTabBar(bool isEng, int selectedSubTabIndex) {
    final tabs = [
      {
        'title': isEng ? "Default" : "ডিফল্ট",
        'icon': Icons.space_dashboard_rounded,
      },
      {
        'title': isEng ? "Parents Stock" : "প্যারেন্টস স্টক",
        'icon': Icons.pets_rounded,
      },
      {
        'title': isEng ? "Hatchery" : "হ্যাচারি",
        'icon': Icons.egg_rounded,
      },
    ];

    final isDark = Theme.of(context).brightness == Brightness.dark;
    final Color selectedColor = selectedSubTabIndex == 0
        ? Colors.teal
        : (selectedSubTabIndex == 1 ? Colors.indigo : Colors.orange.shade800);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      height: 48,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isDark
              ? Colors.teal.withOpacity(0.3)
              : Colors.teal.withOpacity(0.18),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withOpacity(0.3)
                : Colors.teal.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final itemWidth = (constraints.maxWidth - 8) / 3;

          return Stack(
            children: [
              // Smooth sliding background pill
              AnimatedPositioned(
                duration: const Duration(milliseconds: 320),
                curve: Curves.easeInOutCubic,
                left: 4 + (selectedSubTabIndex * itemWidth),
                top: 4,
                width: itemWidth,
                height: 40,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  decoration: BoxDecoration(
                    color: selectedColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: selectedColor.withOpacity(0.35),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                ),
              ),

              // Tab item labels & icons
              Row(
                children: List.generate(tabs.length, (index) {
                  final item = tabs[index];
                  final isSelected = selectedSubTabIndex == index;

                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        _subPageController.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 350),
                          curve: Curves.easeInOutCubic,
                        );
                      },
                      behavior: HitTestBehavior.opaque,
                      child: Container(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AnimatedScale(
                              duration: const Duration(milliseconds: 250),
                              scale: isSelected ? 1.1 : 1.0,
                              child: Icon(
                                item['icon'] as IconData,
                                size: 16,
                                color: isSelected
                                    ? Colors.white
                                    : (isDark
                                        ? Colors.white70
                                        : Colors.grey.shade700),
                              ),
                            ),
                            const SizedBox(width: 6),
                            Flexible(
                              child: AnimatedDefaultTextStyle(
                                duration: const Duration(milliseconds: 200),
                                style: TextStyle(
                                  fontSize: isSelected ? 12.5 : 12,
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.w600,
                                  color: isSelected
                                      ? Colors.white
                                      : (isDark
                                          ? Colors.white70
                                          : Colors.grey.shade700),
                                ),
                                child: Text(
                                  item['title'] as String,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSectionHeader({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color, color.withOpacity(0.8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white, size: 26),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- 1. DYNAMIC BANNER ---
  Widget _buildBannerSection() {
    return StreamBuilder<List<BannerItem>>(
      stream: _poultryService.getBannersStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: 180,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          );
        }

        final banners = snapshot.data ?? [];
        if (banners.isEmpty) return const SizedBox.shrink();

        WidgetsBinding.instance.addPostFrameCallback((_) {
          _startBannerAutoSlide(banners.length);
        });

        return Column(
          children: [
            SizedBox(
              height: 230,
              child: PageView.builder(
                controller: _bannerController,
                itemCount: banners.length,
                onPageChanged: (index) => _currentBannerIndex = index,
                itemBuilder: (context, index) {
                  final banner = banners[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            CachedNetworkImage(
                              imageUrl: banner.imageUrl,
                              fit: BoxFit.cover,
                              placeholder: (ctx, url) => Container(color: Colors.teal.shade50),
                              errorWidget: (ctx, url, err) => Container(
                                color: Colors.teal.shade100,
                                child: const Icon(Icons.broken_image, size: 40, color: Colors.teal),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.black.withOpacity(0.65),
                                    Colors.transparent,
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                              ),
                            ),
                            if (banner.title.isNotEmpty || banner.description.isNotEmpty)
                              Positioned(
                                bottom: 16,
                                left: 16,
                                right: 16,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (banner.title.isNotEmpty)
                                      Text(
                                        banner.title,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    if (banner.description.isNotEmpty)
                                      Text(
                                        banner.description,
                                        style: const TextStyle(
                                          color: Colors.white70,
                                          fontSize: 12,
                                        ),
                                        maxLines: 2,
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
                },
              ),
            ),
            const SizedBox(height: 8),
            SmoothPageIndicator(
              controller: _bannerController,
              count: banners.length,
              effect: ExpandingDotsEffect(
                activeDotColor: Colors.teal,
                dotColor: Colors.teal.shade100,
                dotHeight: 7,
                dotWidth: 7,
                expansionFactor: 3,
              ),
            ),
          ],
        );
      },
    );
  }

  // --- 2. DATE / COUNTRY / TIME / DAILY CARD ---
  Widget _buildDateTimeCard(bool isEng) {
    final now = ref.watch(currentTimeProvider).asData?.value ?? DateTime.now();

    final bnMonths = [
      'জানুয়ারি', 'ফেব্রুয়ারি', 'মার্চ', 'এপ্রিল', 'মে', 'জুন',
      'জুলাই', 'আগস্ট', 'সেপ্টেম্বর', 'অক্টোবর', 'নভেম্বর', 'ডিসেম্বর'
    ];

    String dateStr = isEng
        ? "${now.day} ${_getEngMonth(now.month)} ${now.year}"
        : "${_toBnNum(now.day)} ${bnMonths[now.month - 1]} ${_toBnNum(now.year)}";

    int hour = now.hour;
    int minute = now.minute;
    String period = isEng
        ? (hour >= 12 ? "PM" : "AM")
        : (hour < 6 ? "রাত" : (hour < 12 ? "সকাল" : (hour < 16 ? "দুপুর" : (hour < 18 ? "বিকেল" : "সন্ধ্যা/রাত"))));
    
    int displayHour = hour % 12;
    if (displayHour == 0) displayHour = 12;
    String minStr = minute < 10 ? "0$minute" : "$minute";
    
    String timeStr = isEng
        ? "$displayHour:$minStr $period"
        : "$period ${_toBnNum(displayHour)}:${_toBnNum(minute)}";

    return StreamBuilder<DailyCardInfo>(
      stream: _poultryService.getDailyCardStream(),
      builder: (context, snapshot) {
        final info = snapshot.data;
        final country = info?.country.isNotEmpty == true ? info!.country : (isEng ? "Bangladesh" : "বাংলাদেশ");
        final tip = info?.dailyTip ?? '';
        final weather = info?.weather ?? '';

        return Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.teal.withOpacity(0.2)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.redAccent, size: 20),
                      const SizedBox(width: 6),
                      Text(
                        country,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today_rounded, color: Colors.teal, size: 18),
                      const SizedBox(width: 6),
                      Text(
                        info?.dateText.isNotEmpty == true ? info!.dateText : dateStr,
                        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.access_time_rounded, color: Colors.orange, size: 18),
                      const SizedBox(width: 6),
                      Text(
                        info?.timeText.isNotEmpty == true ? info!.timeText : timeStr,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.teal),
                      ),
                    ],
                  ),
                ],
              ),
              if (tip.isNotEmpty || weather.isNotEmpty) ...[
                const Divider(height: 16),
                Row(
                  children: [
                    const Icon(Icons.lightbulb_outline_rounded, color: Colors.amber, size: 18),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        tip.isNotEmpty ? tip : weather,
                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.teal),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  Widget _buildGeneralArticlesSection(bool isEng) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(
          title: isEng ? "Poultry Management Articles" : "পোল্ট্রি ব্যবস্থাপনা নিবন্ধ ও গাইড",
          subtitle: isEng
              ? "Expert advice, seasonal care & nutrition guides"
              : "বিশেষজ্ঞদের পরামর্শ, পুষ্টি ব্যবস্থাপনা ও পরিচর্যা নির্দেশিকা",
          icon: Icons.menu_book_rounded,
          color: Colors.teal,
        ),
        StreamBuilder<List<Article>>(
          stream: _poultryService.getArticlesStream(category: 'general'),
          builder: (context, snapshot) {
            final liveArticles = snapshot.data;
            final articles = (liveArticles != null && liveArticles.isNotEmpty)
                ? liveArticles
                : Article.mockArticles;
            return ArticleGridWidget(
              articles: articles,
              isEnglish: isEng,
              categoryTag: isEng ? "General Guide" : "পোল্ট্রি গাইড",
              categoryColor: Colors.teal,
            );
          },
        ),
      ],
    );
  }

  String _getEngMonth(int m) {
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return months[m - 1];
  }

  String _toBnNum(int n) {
    const bnNums = ['০', '১', '২', '৩', '৪', '৫', '৬', '৭', '৮', '৯'];
    return n.toString().split('').map((c) {
      int idx = int.tryParse(c) ?? -1;
      return idx != -1 ? bnNums[idx] : c;
    }).join('');
  }

  // --- 3. DYNAMIC ANNOUNCEMENT ---
  Widget _buildAnnouncementSection(bool isEng) {
    return StreamBuilder<List<AnnouncementItem>>(
      stream: _poultryService.getAnnouncementsStream(),
      builder: (context, snapshot) {
        final announcements = snapshot.data ?? [];
        if (announcements.isEmpty) return const SizedBox.shrink();

        final msg = announcements.map((a) => a.message).join('    ||    ');

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.amber.shade50,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.amber.shade300),
          ),
          child: Row(
            children: [
              const Icon(Icons.campaign_rounded, color: Colors.amber, size: 22),
              const SizedBox(width: 8),
              Expanded(
                child: MarqueeTicker(
                  text: msg,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.amber.shade900,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String _selectedMarketCategory = 'all';
  String _selectedLivestockSubCategory = 'all';

  // --- 3. TODAY'S WHOLESALE MARKET SECTION ---
  Widget _buildMarketSection(bool isEng) {
    final marketFilter = ref.watch(homeMarketFilterProvider);
    final selectedCategory = marketFilter.category;
    final selectedSubCategory = marketFilter.subCategory;

    return StreamBuilder<List<MarketCategoryPrice>>(
      stream: _poultryService.getMarketPricesStream(),
      builder: (context, snapshot) {
        final categories = snapshot.data ?? [];

        final combinedMarqueeText = categories.isEmpty
            ? (isEng ? "Loading market prices..." : "আজকের বাজার দর লোড হচ্ছে...")
            : categories.map((c) => "${isEng ? c.titleEn : c.titleBn}: ${c.marqueeText}").join("   •   ");

        return Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          const Icon(Icons.storefront_rounded, color: Colors.teal),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              isEng ? "Today's Wholesale Market Price" : "আজকের পাইকারি বাজার",
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.teal.shade50,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        isEng ? "Live Updates" : "লাইভ আপডেট",
                        style: const TextStyle(fontSize: 11, color: Colors.teal, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // --- UNIFIED SYNCHRONIZED MARQUEE BANNER ---
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.amber.shade50.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.amber.shade300),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.campaign_rounded, color: Colors.amber, size: 20),
                      const SizedBox(width: 6),
                      Expanded(
                        child: MarqueeTicker(
                          text: combinedMarqueeText,
                          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black87),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),

                if (categories.isEmpty)
                  const Center(child: CircularProgressIndicator())
                else ...[
                  // --- 1. CATEGORY SELECTOR CHIPS ---
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ChoiceChip(
                          label: Text(isEng ? "All" : "সবকটি"),
                          selected: selectedCategory == 'all',
                          selectedColor: Colors.teal,
                          labelStyle: TextStyle(
                            color: selectedCategory == 'all' ? Colors.white : Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                          onSelected: (val) {
                            if (val) {
                              ref.read(homeMarketFilterProvider.notifier).setCategory('all');
                            }
                          },
                        ),
                        const SizedBox(width: 6),
                        ...categories.map((cat) {
                          final title = isEng ? cat.titleEn : cat.titleBn;
                          final isSelected = selectedCategory == cat.id;
                          return Padding(
                            padding: const EdgeInsets.only(right: 6.0),
                            child: ChoiceChip(
                              label: Text(title),
                              selected: isSelected,
                              selectedColor: Colors.teal,
                              labelStyle: TextStyle(
                                color: isSelected ? Colors.white : Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                              onSelected: (val) {
                                if (val) {
                                  ref.read(homeMarketFilterProvider.notifier).setCategory(cat.id);
                                }
                              },
                            ),
                          );
                        }),
                      ],
                    ),
                  ),

                  // --- 2. LIVESTOCK SUB-CATEGORY SELECTOR (IF CHICKEN IS SELECTED) ---
                  if (selectedCategory == 'chicken') ...[
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.teal.shade50.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.tune_rounded, size: 16, color: Colors.teal),
                              const SizedBox(width: 6),
                              Text(
                                isEng ? "Select Livestock Breed / Type:" : "মুরগির জাত / সাব-ক্যাটাগরি বাছুন:",
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.teal),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                _buildSubCategoryChip("all", isEng ? "All Breeds" : "সব জাত", isEng, selectedSubCategory),
                                _buildSubCategoryChip("ব্রয়লার", "ব্রয়লার", isEng, selectedSubCategory),
                                _buildSubCategoryChip("সোনালী", "সোনালী", isEng, selectedSubCategory),
                                _buildSubCategoryChip("দেশি", "দেশি", isEng, selectedSubCategory),
                                _buildSubCategoryChip("লেয়ার", "লেয়ার", isEng, selectedSubCategory),
                                _buildSubCategoryChip("কক", "কক/ককরেল", isEng, selectedSubCategory),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],

                  const SizedBox(height: 12),

                  // --- 3. CATEGORY CONTENT RENDER ---
                  if (selectedCategory == 'all')
                    Column(
                      children: categories.map((cat) => _buildMarketCategoryRow(cat, isEng)).toList(),
                    )
                  else ...[
                    ...categories
                        .where((cat) => cat.id == selectedCategory)
                        .map((cat) => _buildDetailedCategoryView(cat, isEng, selectedSubCategory)),
                  ],
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSubCategoryChip(String id, String label, bool isEng, String selectedSubCategory) {
    final isSelected = selectedSubCategory == id;
    return Padding(
      padding: const EdgeInsets.only(right: 6.0),
      child: FilterChip(
        label: Text(label),
        selected: isSelected,
        selectedColor: Colors.teal.shade700,
        labelStyle: TextStyle(
          color: isSelected ? Colors.white : Colors.teal.shade900,
          fontWeight: FontWeight.bold,
          fontSize: 11,
        ),
        onSelected: (val) {
          ref.read(homeMarketFilterProvider.notifier).setSubCategory(val ? id : 'all');
        },
      ),
    );
  }

  Widget _buildDetailedCategoryView(MarketCategoryPrice cat, bool isEng, String selectedSubCategory) {
    var filteredItems = cat.items;
    if (cat.id == 'chicken' && selectedSubCategory != 'all') {
      filteredItems = cat.items
          .where((i) => i.name.toLowerCase().contains(selectedSubCategory.toLowerCase()))
          .toList();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildMarketCategoryRow(cat, isEng),
        const SizedBox(height: 8),
        if (filteredItems.isEmpty)
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              isEng ? "No items found for selected filter." : "বাছাইকৃত সাব-ক্যাটাগরির কোনো দাম পাওয়া যায়নি।",
              style: TextStyle(color: Colors.grey[600], fontSize: 13),
            ),
          )
        else
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: filteredItems.map((item) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.teal.shade50.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.teal.shade200),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      item.name,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        "৳ ${item.price} / ${item.unit}",
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
      ],
    );
  }

  Widget _buildMarketCategoryRow(MarketCategoryPrice cat, bool isEng) {
    final title = isEng ? cat.titleEn : cat.titleBn;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Theme.of(context).dividerColor),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 110,
              child: Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.teal),
              ),
            ),
            Container(height: 16, width: 1, color: Colors.grey.shade400),
            const SizedBox(width: 8),
            Expanded(
              child: MarqueeTicker(
                text: cat.marqueeText,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- 5. SIX FEATURE CARDS GRID ---
  Widget _buildFeatureCardsGrid(BuildContext context, bool isEng) {
    final List<Map<String, dynamic>> features = [
      {
        "title": isEng ? "Calculations" : "হিসাব নিকাশ",
        "icon": Icons.calculate_rounded,
        "color": Colors.purple,
        "onTap": () => Navigator.push(context, MaterialPageRoute(builder: (_) => CalculatorsScreen(isEnglish: isEng))),
      },
      {
        "title": isEng ? "Production Cost" : "উৎপাদন খরচ",
        "icon": Icons.analytics_rounded,
        "color": Colors.green.shade700,
        "onTap": () => Navigator.push(context, MaterialPageRoute(builder: (_) => ProductionCostScreen(isEnglish: isEng))),
      },
      {
        "title": isEng ? "Farm Management" : "খামার ব্যবস্থাপনা",
        "icon": Icons.home_work_rounded,
        "color": Colors.brown,
        "onTap": () => Navigator.push(context, MaterialPageRoute(builder: (_) => FarmManagementScreen(isEnglish: isEng))),
      },
      {
        "title": isEng ? "Vaccine Information" : "ভ্যাকসিন তথ্য",
        "icon": Icons.vaccines_rounded,
        "color": Colors.blue,
        "onTap": () => Navigator.push(context, MaterialPageRoute(builder: (_) => VaccineInfoScreen(isEnglish: isEng))),
      },
      {
        "title": isEng ? "Disease Detection" : "রোগ নির্ণয়",
        "icon": Icons.document_scanner_rounded,
        "color": Colors.teal,
        "onTap": widget.onOpenDetection, // Connects directly to AI Disease Detection!
      },
      {
        "title": isEng ? "Poultry Diseases" : "রোগ বালাই",
        "icon": Icons.coronavirus_rounded,
        "color": Colors.redAccent,
        "onTap": () => Navigator.push(context, MaterialPageRoute(builder: (_) => PoultryDiseasesScreen(isEnglish: isEng))),
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isEng ? "Poultry Services & Tools" : "খামার সেবা ও সেবাসমূহ",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textTheme.titleMedium?.color,
          ),
        ),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: features.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.35,
          ),
          itemBuilder: (context, index) {
            final f = features[index];
            final Color col = f["color"] as Color;

            return InkWell(
              onTap: f["onTap"] as VoidCallback,
              borderRadius: BorderRadius.circular(16),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: col.withOpacity(0.25)),
                  boxShadow: [
                    BoxShadow(
                      color: col.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 22,
                      backgroundColor: col.withOpacity(0.12),
                      child: Icon(f["icon"] as IconData, color: col, size: 24),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      f["title"] as String,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: Theme.of(context).textTheme.bodyMedium?.color,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
