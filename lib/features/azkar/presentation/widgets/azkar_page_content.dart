import 'package:al_minhaj/core/utils/theme/app_font_styles.dart';
import 'package:al_minhaj/features/azkar/presentation/cubit/azkar_cubit.dart';
import 'package:al_minhaj/features/azkar/presentation/widgets/azkar_animated_drop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AzkarPageContent extends StatefulWidget {
  const AzkarPageContent({super.key});

  @override
  State<AzkarPageContent> createState() =>
      _AzkarPageContentState();
}

class _AzkarPageContentState
    extends State<AzkarPageContent> {
  final List<Map<String, dynamic>> azkartypes = [
    {"name": "أذكار الصباح والمساء", "id": 27},
    {"name": "أذكار النوم", "id": 28},
    {"name": "أذكار الاستيقاظ من النوم", "id": 1},
    {"name": "الذكر قبل الوضوء", "id": 8},
    {"name": "الذكر بعد الفراغ من الوضوء", "id": 9},
    {"name": "الذكر عند الخروج من المنزل", "id": 10},
    {"name": "الذكر عند دخول المنزل", "id": 11},
    {"name": "الأذكار بعد السلام من الصلاة", "id": 25},
  ];
  int? expandedIndex;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: azkartypes.map((type) {
          int index = azkartypes.indexOf(type);
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (expandedIndex == index) {
                        expandedIndex = null;
                      } else {
                        expandedIndex = index;
                      }
                      if (expandedIndex != null) {
                        context.read<AzkarCubit>().getAzkar(
                          type: type["name"],
                          id: type["id"],
                        );
                      }
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                      color: Theme.of(
                        context,
                      ).colorScheme.primary,
                    ),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(
                            16.0,
                          ),
                          child: Text(
                            type["name"],
                            style:
                                AppFontStyles.styleBold16(
                                  context,
                                ).copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.secondary,
                                ),
                          ),
                        ),
                        AnimatedRotation(
                          turns: expandedIndex == index
                              ? 0.25
                              : 0.0,
                          duration: const Duration(
                            milliseconds: 300,
                          ),
                          child: Icon(
                            Icons.arrow_drop_down,
                            size: 30,
                            color: Theme.of(
                              context,
                            ).colorScheme.secondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (expandedIndex == index)
                AzkarAnimatedDrop(typeId: type["id"]),
            ],
          );
        }).toList(),
      ),
    );
  }
}
