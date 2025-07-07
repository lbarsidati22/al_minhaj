import 'package:al_minhaj/core/widgets/build_app_bar.dart';
import 'package:al_minhaj/generated/l10n.dart';
import 'package:flutter/material.dart';

class AhadithScreen extends StatelessWidget {
  const AhadithScreen({super.key});
  static const String routeName = 'AhadithScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: S.of(context).hadethname,
        context: context,
      ),
      body: Center(child: Text('Ahadith')),
    );
  }
}
