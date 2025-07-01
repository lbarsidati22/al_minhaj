import 'package:al_minhaj/core/utils/theme/app_font_styles.dart';
import 'package:flutter/material.dart';

class TimerNextPray extends StatelessWidget {
  const TimerNextPray({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white.withOpacity(0.0),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'الظهر',
                style:
                    AppFontStyles.styleBold16(
                      context,
                    ).copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                '11:45',
                style:
                    AppFontStyles.styleRegular28(
                      context,
                    ).copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                'الصلاة التالية: العصر',
                style:
                    AppFontStyles.styleBold14(
                      context,
                    ).copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                '2:50 مساءً',
                style:
                    AppFontStyles.styleBold14(
                      context,
                    ).copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// has error
// import 'dart:async';

// import 'package:adhan/adhan.dart';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:intl/intl.dart';

// class TimerNextPray extends StatefulWidget {
//   const TimerNextPray({super.key});

//   @override
//   State<TimerNextPray> createState() =>
//       _TimerNextPrayState();
// }

// class _TimerNextPrayState
//     extends State<TimerNextPray> {
//   PrayerTimes? prayerTimes;
//   Prayer? nextPrayer;
//   Coordinates? coordinates;
//   String? errorMessage;

//   Timer? timer;

//   @override
//   void initState() {
//     super.initState();
//     _initLocationAndPrayerTimes();

//     // تحديث كل دقيقة
//     timer = Timer.periodic(
//       const Duration(minutes: 1),
//       (_) {
//         if (coordinates != null) {
//           _calculatePrayerTimes(coordinates!);
//         }
//       },
//     );
//   }

//   @override
//   void dispose() {
//     timer?.cancel();
//     super.dispose();
//   }

//   Future<void> _initLocationAndPrayerTimes() async {
//     try {
//       // التحقق وطلب إذن الموقع
//       LocationPermission permission =
//           await Geolocator.checkPermission();
//       if (permission == LocationPermission.denied) {
//         permission =
//             await Geolocator.requestPermission();
//       }
//       if (permission ==
//           LocationPermission.deniedForever) {
//         setState(() {
//           errorMessage =
//               'تم رفض إذن الموقع بشكل دائم. يرجى تفعيل الإذن يدوياً.';
//         });
//         return;
//       }

//       // جلب الموقع الحالي
//       Position position =
//           await Geolocator.getCurrentPosition(
//             desiredAccuracy: LocationAccuracy.high,
//           );

//       coordinates = Coordinates(
//         position.latitude,
//         position.longitude,
//       );

//       _calculatePrayerTimes(coordinates!);
//     } catch (e) {
//       setState(() {
//         errorMessage = 'حدث خطأ أثناء جلب الموقع: $e';
//       });
//     }
//   }

//   void _calculatePrayerTimes(Coordinates coordinates) {
//     final params = CalculationMethod
//         .muslim_world_league
//         .getParameters();
//     final date = DateComponents.from(DateTime.now());

//     prayerTimes = PrayerTimes(
//       coordinates,
//       date,
//       params,
//     );

//     nextPrayer = prayerTimes!.nextPrayer();

//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (errorMessage != null) {
//       return Text(
//         errorMessage!,
//         style: const TextStyle(color: Colors.red),
//         textAlign: TextAlign.center,
//       );
//     }

//     if (prayerTimes == null || nextPrayer == null) {
//       return const CircularProgressIndicator();
//     }

//     final nextPrayerName = _getPrayerName(nextPrayer!);
//     final nextPrayerTime = prayerTimes!.timeForPrayer(
//       nextPrayer!,
//     )!;
//     final formattedNextPrayerTime = DateFormat.jm()
//         .format(nextPrayerTime);

//     final currentPrayer = _getCurrentPrayer(
//       prayerTimes!,
//     );
//     final currentPrayerTime = prayerTimes!
//         .timeForPrayer(currentPrayer)!;
//     final formattedCurrentPrayerTime = DateFormat.jm()
//         .format(currentPrayerTime);

//     final currentPrayerName = _getPrayerName(
//       currentPrayer,
//     );

//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16),
//         color: Colors.white.withOpacity(0.1),
//       ),
//       padding: const EdgeInsets.symmetric(
//         horizontal: 24,
//         vertical: 16,
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Text(
//                 currentPrayerName,
//                 style: const TextStyle(fontSize: 18),
//               ),
//               Text(
//                 formattedCurrentPrayerTime,
//                 style: const TextStyle(fontSize: 18),
//               ),
//               const SizedBox(height: 8),
//               Text(
//                 'الصلاة التالية: $nextPrayerName',
//                 style: const TextStyle(fontSize: 18),
//               ),
//               Text(
//                 formattedNextPrayerTime,
//                 style: const TextStyle(fontSize: 18),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   // دالة ترجع اسم الصلاة بالعربي بناءً على نوع الصلاة Prayer
//   String _getPrayerName(Prayer prayer) {
//     switch (prayer) {
//       case Prayer.fajr:
//         return 'الفجر';
//       case Prayer.sunrise:
//         return 'الشروق';
//       case Prayer.dhuhr:
//         return 'الظهر';
//       case Prayer.asr:
//         return 'العصر';
//       case Prayer.maghrib:
//         return 'المغرب';
//       case Prayer.isha:
//         return 'العشاء';
//       default:
//         return '';
//     }
//   }

//   // دالة ترجع الصلاة الحالية (نوع Prayer) بناءً على الوقت
//   Prayer _getCurrentPrayer(PrayerTimes prayerTimes) {
//     final now = DateTime.now();

//     if (now.isAfter(prayerTimes.isha)) {
//       return Prayer.isha;
//     } else if (now.isAfter(prayerTimes.maghrib)) {
//       return Prayer.maghrib;
//     } else if (now.isAfter(prayerTimes.asr)) {
//       return Prayer.asr;
//     } else if (now.isAfter(prayerTimes.dhuhr)) {
//       return Prayer.dhuhr;
//     } else if (now.isAfter(prayerTimes.fajr)) {
//       return Prayer.fajr;
//     } else {
//       return Prayer.fajr;
//     }
//   }
// }
