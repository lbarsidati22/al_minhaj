import 'package:al_minhaj/core/widgets/build_app_bar.dart';
import 'package:al_minhaj/generated/l10n.dart';
import 'package:flutter/material.dart';

class AlMohadraPage extends StatelessWidget {
  const AlMohadraPage({super.key});
  static const String routeName = 'AlMohadra';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: S.of(context).lectures,
        context: context,
      ),
      body: Center(child: Text('AlMohadra')),
    );
  }
}
