import 'package:flutter/material.dart';
import '../../model/article.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class ArticleScreen extends StatelessWidget {
  final Article article;
  final bool isEnglish;

  const ArticleScreen({
    super.key,
    required this.article,
    required this.isEnglish,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(context),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Meta Info
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.teal.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          isEnglish ? "Knowledge Base" : "নলেজ বেস",
                          style: const TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Icon(Icons.schedule_rounded, size: 14, color: Colors.grey[500]),
                      const SizedBox(width: 4),
                      Text(
                        article.readTime,
                        style: TextStyle(color: Colors.grey[500], fontSize: 13),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  
                  // Title
                  Text(
                    isEnglish ? article.titleEn : article.titleBn,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Author Segment
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.teal,
                        radius: 16,
                        child: Icon(Icons.person, color: Colors.white, size: 20),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        article.author,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Divider(),
                  const SizedBox(height: 24),

                  // Content
                  Text(
                    isEnglish ? article.contentEn : article.contentBn,
                    style: TextStyle(
                      fontSize: 17,
                      height: 1.7,
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 280.0,
      floating: false,
      pinned: true,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_rounded),
        style: IconButton.styleFrom(
          backgroundColor: Colors.black.withOpacity(0.3),
          foregroundColor: Colors.white,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            Hero(
              tag: 'article_image_${article.id}',
              child: CachedNetworkImage(
                imageUrl: article.imageUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    color: Colors.white,
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  color: Colors.teal.shade200,
                  child: const Icon(Icons.broken_image, size: 50, color: Colors.white),
                ),
              ),
            ),
            // Gradient to ensure back button is visible
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.transparent,
                    Colors.black.withOpacity(0.4),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
