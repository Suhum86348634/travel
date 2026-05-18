import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel/theme/app_colors.dart';
import 'package:travel/theme/app_text_styles.dart';
import 'package:travel/widgets/day_counter.dart';
import '../../providers/detail_provider.dart';
import '../../widgets/custom_button.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DetailProvider>();
    final trip = provider.selectedTrip;
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    if (trip == null) {
      return const Scaffold(body: Center(child: Text("No trip selected")));
    }

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                width: double.infinity,
                child: Image.network(trip.imageUrl, fit: BoxFit.cover),
              ),
              Positioned(
                top: 50,
                left: 16,
                child: CircleAvatar(
                  backgroundColor: cs.surface.withValues(alpha: 0.85),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: cs.onSurface),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
            ],
          ),

          Expanded(
            child: Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: cs.surface,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Название
                          Text(trip.title, style: tt.headlineLarge),

                          const SizedBox(height: 4),

                          // Локация
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                size: 14,
                                color: cs.primary,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                trip.location,
                                style: tt.bodySmall?.copyWith(
                                  color: cs.onSurface.withValues(alpha: 0.6),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 8),

                          // Рейтинг
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: AppColors.rating,
                                size: 18,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                "${trip.rating}",
                                style: AppTextStyles.rating.copyWith(
                                  color: cs.onSurface,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 20),

                          // Количество дней
                          Row(
                            children: [
                              DayCounter(
                                icon: Icons.remove,
                                onPressed: provider.decreaseDays,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                ),
                                child: Text(
                                  "${provider.days}",
                                  style: tt.titleLarge,
                                ),
                              ),
                              DayCounter(
                                icon: Icons.add,
                                onPressed: provider.increaseDays,
                              ),
                              const SizedBox(width: 16),
                              Icon(
                                Icons.access_time,
                                size: 16,
                                color: cs.onSurface.withValues(alpha: 0.6),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                "${provider.days} Days",
                                style: tt.bodyMedium?.copyWith(
                                  color: cs.onSurface.withValues(alpha: 0.6),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 20),

                          // Описание
                          Text("Description", style: tt.headlineMedium),
                          const SizedBox(height: 8),
                          Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                            "Dignissim eget amet viverra eget fames rhoncus...",
                            style: tt.bodyMedium?.copyWith(
                              color: cs.onSurface.withValues(alpha: 0.7),
                            ),
                          ),

                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ),

                  // ── Bottom bar: цена + кнопка ───────────────────
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          "\$400",
                          style: AppTextStyles.price.copyWith(
                            color: cs.primary,
                          ),
                        ),
                      ),
                      Text(
                        "/ Package",
                        style: tt.bodySmall?.copyWith(
                          color: cs.onSurface.withValues(alpha: 0.5),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        flex: 3,
                        child: CustomButton(text: "Book Now", onPressed: () {}),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
