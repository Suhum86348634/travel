import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CardItem extends StatelessWidget {
  final String title;
  final double? rating;
  final String imageUrl;
  final bool isLoading;

  const CardItem({
    super.key,
    required this.title,
    required this.rating,
    required this.imageUrl,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (isLoading) {
      return const _ShimmerCard();
    }

    return AspectRatio(
      aspectRatio: 1,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Positioned.fill(child: Image.network(imageUrl, fit: BoxFit.cover)),

            Positioned.fill(
              child: Container(color: Colors.black.withOpacity(0.25)),
            ),

            Positioned(
              left: 12,
              right: 12,
              bottom: 12,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 45, 64, 38).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "⭐ $rating",
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.white70,
                      ),
                    ),
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

class _ShimmerCard extends StatelessWidget {
  const _ShimmerCard();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return AspectRatio(
      aspectRatio: 1,
      child: Shimmer.fromColors(
        baseColor: isDark
            ? theme.colorScheme.surface.withOpacity(0.6)
            : theme.colorScheme.primary.withOpacity(0.15),

        highlightColor: isDark
            ? theme.colorScheme.surface.withOpacity(0.3)
            : theme.colorScheme.primary.withOpacity(0.05),

        period: const Duration(milliseconds: 1200),

        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  color: isDark
                      ? theme.colorScheme.surface
                      : theme.colorScheme.primary.withOpacity(0.1),
                ),
              ),
              Positioned(
                left: 12,
                right: 12,
                bottom: 12,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 194, 233, 170).withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 14,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 184, 224, 164).withOpacity(0.8),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        height: 12,
                        width: 80,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 235, 214, 181).withOpacity(0.7),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}