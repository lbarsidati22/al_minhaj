import 'package:al_minhaj/core/utils/theme/app_font_styles.dart';
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
        'https://filedn.com/lB8bgDEsPWLVIlRdbAmCPRm/%D8%A7%D9%84%D8%B9%D9%84%D9%88%D9%85%20%D8%A7%D9%84%D8%B4%D8%B1%D8%B9%D9%8A%D8%A9/%D8%A7%D9%84%D9%81%D9%82%D9%87/%D9%85%D9%86%20%D8%AF%D8%B1%D9%88%D8%B3%20%D8%A7%D9%84%D8%A3%D8%B3%D8%A6%D9%84%D8%A9%20%D9%80%20%D9%85%D8%AD%D9%85%D8%AF%20%D9%88%D9%84%D8%AF%20%D8%B3%D9%8A%D8%AF%20%D9%8A%D8%AD%D9%8A/252%20%D8%AF%D8%B1%D9%88%D8%B3%20%D8%A7%D9%84%D8%A3%D8%B3%D8%A6%D9%84%D8%A9%20%D9%80%20%D9%85%D8%AD%D9%85%D8%AF%20%D9%88%D9%84%D8%AF%20%D8%B3%D9%8A%D8%AF%20%D9%8A%D8%AD%D9%8A%20%D9%80%20%D8%A7%D9%84%D9%85%D9%88%D8%B3%D9%88%D8%B9%D8%A9%20%D8%A7%D9%84%D8%B4%D9%86%D9%82%D9%8A%D8%B7%D9%8A%D8%A9.mp3',
      );
      _duration = _audioPlayer.duration?.inSeconds ?? 1;
      _audioPlayer.positionStream.listen((position) {
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
                if (_audioPlayer.playerState.playing) {
                  _audioPlayer.pause();
                } else {
                  _audioPlayer.play();
                }
              },
              icon: Icon(
                _audioPlayer.playerState.playing
                    ? Icons.pause
                    : Icons.play_arrow,
                size: 30,

                color: Colors.white,
                //  size: 28,
              ),
            ),
          ),
          SizedBox(width: 2.widthPercent(context)),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.end,
              children: [
                Text(
                  S.of(context).runMohadra,
                  style: AppFontStyles.styleBold13(
                    context,
                  ).copyWith(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),

                Expanded(
                  child: Text(
                    S.of(context).cheikhAudio,
                    style:
                        AppFontStyles.styleRegular13(
                          context,
                        ).copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 0.5.widthPercent(context)),
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(
              'https://echourouqmedia.net/sites/default/files/1_222.jpg',
            ),
          ),
        ],
      ),
    );
  }
}
