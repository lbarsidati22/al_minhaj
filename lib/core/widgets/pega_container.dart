import 'package:al_minhaj/features/azkar/model/azkar_model.dart';
import 'package:flutter/material.dart';

class PajeContainer extends StatelessWidget {
  final AzkarModel? azkarModel;
  final String text;

  const PajeContainer({
    super.key,
    this.azkarModel,
    this.text = 'No Text Here',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 16,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(
          context,
        ).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        azkarModel?.aRABICTEXT ?? text,
        style: Theme.of(
          context,
        ).textTheme.displayMedium,
      ),
    );
  }
}
