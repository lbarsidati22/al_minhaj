import 'package:al_minhaj/core/widgets/build_app_bar.dart';
import 'package:al_minhaj/features/ahadith/data/ahadith_model.dart';
import 'package:flutter/material.dart';

class AhadithDetails extends StatefulWidget {
  final HadithModel hadithModel;
  const AhadithDetails({
    super.key,
    required this.hadithModel,
  });
  static const routeName = '/AhadithDetails';

  @override
  State<AhadithDetails> createState() =>
      _AhadithDetailsState();
}

class _AhadithDetailsState
    extends State<AhadithDetails> {
  @override
  Widget build(BuildContext context) {
    final model = widget.hadithModel;
    return Container(
      decoration: BoxDecoration(),
      child: Scaffold(
        appBar: buildAppBar(
          title: model.title,
          context: context,
        ),

        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Card(
            color: Color(0xff785546),
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Theme.of(
                  context,
                ).colorScheme.onPrimaryContainer,
              ),
            ),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    textDirection: TextDirection.rtl,
                    model.Content[index],
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                    textAlign: TextAlign.center,
                  ),
                );
              },
              itemCount: model.Content.length,
            ),
          ),
        ),
      ),
    );
  }
}
