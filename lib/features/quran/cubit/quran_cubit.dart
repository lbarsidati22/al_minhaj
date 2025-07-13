import 'package:al_minhaj/features/home/presentation/views/home_view.dart';
import 'package:al_minhaj/features/quran/presentation/views/sura_list_screen.dart';
import 'package:al_minhaj/features/quran/presentation/widgets/sura_details_screen.dart';
import 'package:al_minhaj/navigation_key.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit() : super(QuranInitial());

  // void changeSceneToList() {
  //   emit(ChangeSceneChangedToList());
  // }

  // void changeSceneToPage({required int surahNumber}) {
  //   emit(
  //     ChangeSceneChangedToQuranPage(
  //       surahNumber: surahNumber,
  //     ),
  //   );
  // }
  void changeSceneToList() {
    navigatorKey.currentState!
        .pushNamedAndRemoveUntil(
          SuraListScreen.routeName,
          (route) {
            return route.settings.name ==
                HomeView.routeName;
          },
        );

    emit(ChangeSceneChangedToList());
  }

  void changeSceneToPage({required int surahNumber}) {
    navigatorKey.currentState!.pushNamed(
      SuraDetailsScreen.routeName,
      arguments: surahNumber,
    );

    emit(ChangeSceneChangedToQuranPage());
  }
}
