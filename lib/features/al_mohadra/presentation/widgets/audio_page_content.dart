import 'package:al_minhaj/core/models/all_media_model.dart';
import 'package:al_minhaj/core/utils/theme/app_theme.dart';
import 'package:al_minhaj/core/widgets/sized_box.dart';
import 'package:al_minhaj/features/al_mohadra/presentation/widgets/audio_animate_drop.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class AudiosPageContent extends StatefulWidget {
  const AudiosPageContent({
    super.key,
    required this.data,
    required this.dataIndex,
    required this.count,
  });

  final Data data;
  final int dataIndex;
  final int count;

  @override
  State<AudiosPageContent> createState() =>
      _AudiosPageContentState();
}

class _AudiosPageContentState
    extends State<AudiosPageContent>
    with AutomaticKeepAliveClientMixin {
  bool isPressed = false;
  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return Column(
      // mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isPressed = !isPressed;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 11,
              horizontal: 12,
            ),
            decoration: BoxDecoration(
              color: AppTheme.isDark(context)
                  ? Color(0xff577b9b)
                  : Color(0xff966a4a),
              borderRadius: BorderRadius.circular(18),
              border: Border(
                left: BorderSide(
                  color: Theme.of(
                    context,
                  ).colorScheme.onPrimaryContainer,
                  width: 5,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        overflow:
                            TextOverflow.ellipsis,
                        maxLines: 1,
                        widget.data.title ??
                            'no title here',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(
                              fontWeight:
                                  FontWeight.w700,
                              color: Colors.white,
                            ),
                      ),
                      SizedBox(
                        width: 1.heightPercent(
                          context,
                        ),
                      ),
                      Text(
                        widget.data.description ??
                            'no Description here',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(
                              fontWeight:
                                  FontWeight.w500,
                              color: Colors
                                  .grey
                                  .shade300,
                            ),

                        overflow:
                            TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 2.widthPercent(context),
                ),
                AnimatedRotation(
                  turns: isPressed ? 0.25 : 0.0,
                  duration: const Duration(
                    milliseconds: 300,
                  ),
                  child: Icon(
                    size: 30,
                    IconsaxPlusBold.arrow_down,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        AudiosAnimatedDrop(
          isPressed: isPressed,
          dataIndex: widget.dataIndex,
          count: widget.count,
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
