import 'package:al_minhaj/core/widgets/build_app_bar.dart';
import 'package:al_minhaj/features/al_mohadra/presentation/widgets/mahdra_audio_tab.dart';
import 'package:al_minhaj/features/al_mohadra/presentation/widgets/mahdra_video_tab.dart';
import 'package:al_minhaj/features/drawer/widgets/custom_tap_bar.dart';
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              CustomTapBar(
                tab1Name: 'الصوتيات',
                tab2Name: 'الفيديوهات',
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    MahdraAudioTab(),
                    MahdraVideoTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
