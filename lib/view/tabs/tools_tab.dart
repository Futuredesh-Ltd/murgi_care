import 'package:flutter/material.dart';
import '../widgets/fcr_calculator_dialog.dart';
import '../widgets/space_planner_dialog.dart';
import '../widgets/growth_chart.dart';
import '../../model/article.dart';
import '../article_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class ToolsTab extends StatelessWidget {
  final bool isEnglish;

  const ToolsTab({super.key, required this.isEnglish});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Smart Poultry Tools
          _buildGuideHeader(
            context,
            isEnglish,
            Icons.calculate_rounded,
            isEnglish ? "Smart Poultry Tools" : "স্মার্ট পোল্ট্রি টুলস",
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildToolCard(
                  icon: Icons.speed_rounded,
                  title: isEnglish ? "FCR Check" : "এফসিআর চেক",
                  color: Colors.purple,
                  onTap: () => _showFCRCalculator(context, isEnglish),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildToolCard(
                  icon: Icons.grid_view_rounded,
                  title: isEnglish ? "Capacity" : "ধারণক্ষমতা",
                  color: Colors.deepOrange,
                  onTap: () => _showSpacePlanner(context, isEnglish),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),

          // Poultry Management Quick Guide
          _buildGuideHeader(
            context,
            isEnglish,
            Icons.menu_book_rounded,
            isEnglish ? "Management Guide" : "ব্যবস্থাপনা গাইড",
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 110,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildGuideCard(
                  context,
                  icon: Icons.analytics_outlined,
                  title: isEnglish ? "Growth" : "বৃদ্ধি",
                  color: Colors.orange,
                  onTap: () => _showGrowthChart(context, isEnglish),
                ),
                _buildGuideCard(
                  context,
                  icon: Icons.vaccines_outlined,
                  title: isEnglish ? "Vaccines" : "ভ্যাকসিন",
                  color: Colors.redAccent,
                  onTap: () => _showVaccineSchedule(context, isEnglish),
                ),
                _buildGuideCard(
                  context,
                  icon: Icons.restaurant_menu_outlined,
                  title: isEnglish ? "Feeding" : "খাদ্য",
                  color: Colors.blue,
                  onTap: () => _showFeedingGuide(context, isEnglish),
                ),
                _buildGuideCard(
                  context,
                  icon: Icons.wb_sunny_outlined,
                  title: isEnglish ? "Temp" : "তাপমাত্রা",
                  color: Colors.teal,
                  onTap: () => _showTempGuide(context, isEnglish),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),

          // Quick Disease Prevention Tips
          _buildGuideHeader(
            context,
            isEnglish,
            Icons.shield_outlined,
            isEnglish ? "Quick Prevention Tips" : "দ্রুত প্রতিরোধ টিপস",
          ),
          const SizedBox(height: 12),
          _buildPreventionTipTile(
            context,
            icon: Icons.cleaning_services_rounded,
            title: isEnglish ? "Daily Cleaning" : "প্রতিদিন পরিষ্কার",
            subtitle: isEnglish
                ? "Clean feeders & drinkers daily"
                : "খাবার ও পানির পাত্র প্রতিদিন পরিষ্কার করুন",
            color: Colors.blue,
            onTap: () => _showPreventionDetail(context, isEnglish, "cleaning"),
          ),
          _buildPreventionTipTile(
            context,
            icon: Icons.people_outline_rounded,
            title: isEnglish ? "Limit Visitors" : "ভিজিটর নিয়ন্ত্রণ",
            subtitle: isEnglish
                ? "Restrict unnecessary visits"
                : "অপ্রয়োজনীয় লোকজনের প্রবেশ নিয়ন্ত্রণ করুন",
            color: Colors.purple,
            onTap: () => _showPreventionDetail(context, isEnglish, "visitors"),
          ),
          _buildPreventionTipTile(
            context,
            icon: Icons.sick_outlined,
            title: isEnglish ? "Isolate Sick Birds" : "অসুস্থ মুরগি আলাদা করুন",
            subtitle: isEnglish
                ? "Separate sick birds immediately"
                : "অসুস্থ মুরগিকে তাৎক্ষণিক আলাদা করুন",
            color: Colors.redAccent,
            onTap: () => _showPreventionDetail(context, isEnglish, "isolation"),
          ),
          const SizedBox(height: 32),

          // --- Blog / Knowledge Base Section ---
          _buildGuideHeader(
            context,
            isEnglish,
            Icons.article_rounded,
            isEnglish ? "Poultry Knowledge Base" : "পোল্ট্রি ব্লগ",
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Article.mockArticles.length,
              itemBuilder: (context, index) {
                final article = Article.mockArticles[index];
                return _buildArticleCard(context, article, isEnglish);
              },
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  // --- UI Components ---
  Widget _buildGuideHeader(BuildContext context, bool isEnglish, IconData icon, String title) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.teal),
        const SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textTheme.titleMedium?.color,
          ),
        ),
      ],
    );
  }

  Widget _buildToolCard({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: color.withOpacity(0.2)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: color,
                  fontSize: 13,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGuideCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: color.withOpacity(0.2)),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 5),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPreventionTipTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: Theme.of(context).dividerColor),
      ),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.1),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        subtitle: Text(subtitle, style: const TextStyle(fontSize: 12)),
        trailing: const Icon(Icons.chevron_right_rounded),
      ),
    );
  }

  Widget _buildArticleCard(
    BuildContext context,
    Article article,
    bool isEnglish,
  ) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ArticleScreen(article: article, isEnglish: isEnglish),
        ),
      ),
      child: Container(
        width: 250,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Theme.of(context).dividerColor),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              child: Hero(
                tag: 'article_image_${article.id}',
                child: CachedNetworkImage(
                  imageUrl: article.imageUrl,
                  height: 110,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: 110,
                      width: double.infinity,
                      color: Colors.white,
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    height: 110,
                    width: double.infinity,
                    color: Colors.grey.shade300,
                    child: const Icon(
                      Icons.image_not_supported,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isEnglish ? article.titleEn : article.titleBn,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "${article.author} • ${article.readTime}",
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
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

  void _showFCRCalculator(BuildContext context, bool isEnglish) {
    showDialog(
      context: context,
      builder: (_) => FcrCalculatorDialog(isEnglish: isEnglish),
    );
  }

  void _showSpacePlanner(BuildContext context, bool isEnglish) {
    showDialog(
      context: context,
      builder: (_) => SpacePlannerDialog(isEnglish: isEnglish),
    );
  }

  void _showGrowthChart(BuildContext context, bool isEnglish) {
    _showSheet(context, isEnglish ? "Growth Tracking" : "বৃদ্ধি ট্র্যাকিং", [
      GrowthChart(isEnglish: isEnglish),
    ]);
  }

  void _showVaccineSchedule(BuildContext context, bool isEnglish) {
    _showSheet(context, isEnglish ? "Vaccination List" : "টিকাদান তালিকা", [
      _listRow(
        "Day 1",
        isEnglish ? "IB (Live) - Eye Drop" : "আইবি (লাইভ) - চোখে ড্রপ",
      ),
      _listRow(
        "Day 3-5",
        isEnglish ? "ND/Ranikhet - Eye Drop" : "রানীক্ষেত - চোখে ড্রপ",
      ),
      _listRow(
        "Day 10-12",
        isEnglish ? "IBD/Gumboro - Eye Drop" : "গামবোরো - চোখে ড্রপ",
      ),
      _listRow(
        "Day 22-24",
        isEnglish ? "ND/Ranikhet - Water" : "রানীক্ষেত - পানির সাথে",
      ),
    ]);
  }

  void _showFeedingGuide(BuildContext context, bool isEnglish) {
    _showSheet(context, isEnglish ? "Feeding Rules" : "খাদ্যের নিয়ম", [
      _listRow("0-14 Days", isEnglish ? "Pre-Starter" : "প্রি-স্টার্টার"),
      _listRow("15-28 Days", isEnglish ? "Starter" : "স্টার্টার"),
      _listRow("29+ Days", isEnglish ? "Grower/Finisher" : "গ্রোয়ার/ফিনিশার"),
    ]);
  }

  void _showTempGuide(BuildContext context, bool isEnglish) {
    _showSheet(context, isEnglish ? "Temp Guide" : "তাপমাত্রা গাইড", [
      _listRow("Week 1", "32-35°C (90-95°F)"),
      _listRow("Week 2", "29-32°C (85-90°F)"),
      _listRow("Week 3", "26-29°C (80-85°F)"),
      _listRow("Week 4+", "21-24°C (70-75°F)"),
    ]);
  }

  void _showPreventionDetail(
    BuildContext context,
    bool isEnglish,
    String type,
  ) {
    String title = "";
    List<Widget> content = [];

    if (type == "cleaning") {
      title = isEnglish ? "Daily Cleaning Routine" : "প্রতিদিনের পরিষ্কার";
      content = [
        _listRow(
          isEnglish ? "Feeders & Drinkers" : "খাবার ও পানির পাত্র",
          isEnglish ? "Clean every day" : "প্রতিদিন পরিষ্কার",
        ),
        _listRow(
          isEnglish ? "Disinfect" : "জীবাণুনাশক",
          isEnglish
              ? "Use approved disinfectant weekly"
              : "সপ্তাহে একবার জীবাণুনাশক ব্যবহার করুন",
        ),
      ];
    } else if (type == "visitors") {
      title = isEnglish ? "Visitor & Biosecurity" : "ভিজিটর নিয়ন্ত্রণ";
      content = [
        _listRow(
          isEnglish ? "Footbath" : "ফুটবাথ",
          isEnglish ? "Use at entrance" : "প্রবেশপথে ব্যবহার করুন",
        ),
        _listRow(
          isEnglish ? "Restriction" : "নিয়ম",
          isEnglish ? "Minimize unnecessary entry" : "অপ্রয়োজনীয় প্রবেশ কমান",
        ),
      ];
    } else if (type == "isolation") {
      title = isEnglish ? "Sick Bird Isolation" : "অসুস্থ মুরগি আলাদা করা";
      content = [
        _listRow(
          isEnglish ? "Immediate Action" : "তাৎক্ষণিক পদক্ষেপ",
          isEnglish ? "Isolate sick birds" : "অসুস্থ মুরগি আলাদা করুন",
        ),
        _listRow(
          isEnglish ? "Monitoring" : "পর্যবেক্ষণ",
          isEnglish ? "Observe symptoms" : "লক্ষণ পর্যবেক্ষণ করুন",
        ),
      ];
    }

    _showSheet(context, title, content);
  }

  void _showSheet(BuildContext context, String title, List<Widget> children) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (_) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              ...children,
            ],
          ),
        ),
      ),
    );
  }

  Widget _listRow(String t1, String t2) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(t1, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(t2),
        ],
      ),
    );
  }
}
