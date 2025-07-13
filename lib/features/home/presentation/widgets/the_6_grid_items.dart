import 'package:al_minhaj/core/widgets/sized_box.dart';
import 'package:flutter/material.dart';

class The6GridItems extends StatelessWidget {
  const The6GridItems({
    super.key,
    required this.gridItems,
    required this.index,
  });

  final List<Map<String, dynamic>> gridItems;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (gridItems[index]['nav'] != null) {
          Navigator.pushNamed(
            context,
            gridItems[index]['nav']!,
            arguments: index == 3 ? 1 : null,
          );
        }
      },
      child: Container(
        padding: EdgeInsets.only(bottom: 2),
        decoration: BoxDecoration(
          color: Theme.of(
            context,
          ).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            Center(
              child: Image.asset(
                height: index == 2
                    ? 12.heightPercent(context)
                    : 9.heightPercent(context),
                gridItems[index]['icon'],
              ),
            ),
            SizedBox(
              height: 1.heightPercent(context),
            ),

            PositionedDirectional(
              bottom: 0,
              start: 0,
              end: 0,
              child: Text(
                gridItems[index]['label'],
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
