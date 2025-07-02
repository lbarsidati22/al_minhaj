import 'package:al_minhaj/core/utils/theme/app_font_styles.dart';
import 'package:al_minhaj/core/utils/theme/app_theme.dart';
import 'package:al_minhaj/core/widgets/sized_box.dart';
import 'package:al_minhaj/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class TodayVerseCardAudio extends StatefulWidget {
  const TodayVerseCardAudio({super.key});

  @override
  State<TodayVerseCardAudio> createState() =>
      _TodayVerseCardAudioState();
}

class _TodayVerseCardAudioState
    extends State<TodayVerseCardAudio> {
  late AudioPlayer _audioPlayer;
  // ignore: unused_field
  int _currentPosition = 0;
  // ignore: unused_field
  int _duration = 1;
  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _initalizePlayer();
  }

  Future<void> _initalizePlayer() async {
    try {
      await _audioPlayer.setUrl(
        'https://d1.islamhouse.com/data/ar/ih_sounds/chain_02/shar7-mosnd-manask-osaime/ar-01-shar7-mosnd-manask-osaime.mp3',
      );
      _duration =
          _audioPlayer.duration?.inSeconds ?? 1;
      _audioPlayer.positionStream.listen((
        position,
      ) {
        setState(() {
          _currentPosition = position.inSeconds;
        });
      });
    } catch (e) {
      print('error loading audio: $e');
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  // String _formatTime(int seconds) {
  //   final minutes = (seconds ~/ 60)
  //       .toString()
  //       .padLeft(2, '0');
  //   final secs = (seconds % 60)
  //       .toString()
  //       .padLeft(2, '0');
  //   return '$minutes:$secs';
  // }

  @override
  Widget build(BuildContext context) {
    // int remainingTime =
    //     _duration - _currentPosition;
    return Container(
      height: 8.heightPercent(context),
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.blueGrey.shade400,
      ),

      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Theme.of(
              context,
            ).colorScheme.onPrimary,
            child: IconButton(
              onPressed: () {
                if (_audioPlayer
                    .playerState
                    .playing) {
                  _audioPlayer.pause();
                } else {
                  _audioPlayer.play();
                }
              },
              icon: Icon(
                _audioPlayer.playerState.playing
                    ? Icons.pause
                    : Icons.play_arrow,
                color: Theme.of(
                  context,
                ).colorScheme.primary,
                //  size: 28,
              ),
            ),
          ),
          SizedBox(
            width: 2.widthPercent(context),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.end,
              children: [
                Text(
                  S.of(context).runMohadra,
                  style:
                      AppFontStyles.styleBold16(
                        context,
                      ).copyWith(
                        color:
                            AppTheme.isDark(
                              context,
                            )
                            ? Colors.white
                            : Colors.black,
                      ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(
                  height: 0.6.heightPercent(
                    context,
                  ),
                ),
                Text(
                  S.of(context).cheikhAudio,
                  style:
                      AppFontStyles.styleRegular14(
                        context,
                      ).copyWith(
                        fontWeight:
                            FontWeight.w500,
                        color:
                            AppTheme.isDark(
                              context,
                            )
                            ? Colors.white
                            : Colors.black,
                      ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 1.widthPercent(context),
          ),
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(
              'assets/images/alafasy.png',
            ),
          ),
        ],
      ),
    );
  }
}
