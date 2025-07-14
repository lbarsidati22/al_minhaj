import 'package:al_minhaj/core/cubit/all_media_cubit.dart';
import 'package:al_minhaj/core/widgets/sized_box.dart';
import 'package:al_minhaj/features/al_mohadra/presentation/widgets/audio_page_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MahdraAudioTab extends StatelessWidget {
  const MahdraAudioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllMediaCubit, AllMediaState>(
      builder: (context, state) {
        if (state is GetAudiosLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetAudiosLoaded) {
          final dataList = context
              .read<AllMediaCubit>()
              .allMediaModel
              .data;
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
            ),
            child: ListView.separated(
              itemBuilder: (context, index) =>
                  AudiosPageContent(
                    data: dataList[index],
                    dataIndex: index,
                    count: dataList[index]
                        .attachments!
                        .length,
                  ),
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 2.heightPercent(context),
                );
              },
              itemCount: dataList!.length,
            ),
          );
        } else {
          return const Center(
            child:
                CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }
}
