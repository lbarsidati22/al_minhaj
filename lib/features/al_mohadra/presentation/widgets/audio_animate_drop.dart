import 'package:al_minhaj/core/cubit/all_media_cubit.dart';
import 'package:al_minhaj/core/widgets/sized_box.dart';
import 'package:al_minhaj/features/al_mohadra/presentation/widgets/audio_player_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AudiosAnimatedDrop extends StatelessWidget {
  const AudiosAnimatedDrop({
    super.key,
    required this.isPressed,
    required this.dataIndex,
    required this.count,
    // required this.index,
  });
  final int dataIndex;
  final int count;

  final bool isPressed;

  // final int index;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      alignment: Alignment.center,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
      reverseDuration: const Duration(
        milliseconds: 600,
      ),
      child: isPressed
          ? Column(
              children: [
                SizedBox(
                  height: 3.heightPercent(context),
                ),
                BlocBuilder<
                  AllMediaCubit,
                  AllMediaState
                >(
                  builder: (context, state) {
                    return ListView.separated(
                      shrinkWrap: true,
                      physics:
                          const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) =>
                          AudioPlayerContainer(
                            attachments: context
                                .read<AllMediaCubit>()
                                .allMediaModel
                                .data![dataIndex]
                                .attachments![index],
                          ),
                      separatorBuilder:
                          (context, index) =>
                              SizedBox(
                                height: 2
                                    .heightPercent(
                                      context,
                                    ),
                              ),
                      itemCount: count,
                    );
                  },
                ),
              ],
            )
          : const SizedBox(),
    );
  }
}
