import 'package:al_minhaj/core/widgets/build_app_bar.dart';
import 'package:al_minhaj/features/all_ad3ye/data/ad3ya_json.dart';
import 'package:al_minhaj/features/all_ad3ye/presentation/widgets/ad3ye_page_content.dart';
import 'package:al_minhaj/generated/l10n.dart';
import 'package:flutter/material.dart';

class AlAd3yaScreen extends StatefulWidget {
  const AlAd3yaScreen({super.key});
  static const String routeName = 'AlAd3yaScreen';

  @override
  State<AlAd3yaScreen> createState() =>
      _AlAd3yaScreenState();
}

class _AlAd3yaScreenState extends State<AlAd3yaScreen> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: S.of(context).supplications,
        context: context,
      ),
      body: PageView.builder(
        itemCount: ad3yaList.length,
        physics: ClampingScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            pageIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return Ad3yePageContent(index: index);
        },
      ),
    );
  }
}
