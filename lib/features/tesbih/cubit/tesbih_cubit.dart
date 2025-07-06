import 'package:al_minhaj/features/tesbih/model/tesbih_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tesbih_state.dart';

class TesbihCubit extends Cubit<TesbihState> {
  TesbihCubit()
    : super(
        TesbihState(
          items: [
            TesbihModel(text: 'سبحان الله'),
            TesbihModel(text: 'الله اكبر'),
            TesbihModel(
              text: 'اَلْحَمْدُ لِلَّهِ',
            ),
            TesbihModel(
              text: 'لا إله إلا الله',
            ),
          ],
        ),
      );

  void selecItem(int index) {
    if (index >= 0 &&
        index < state.items.length) {
      emit(state.copyWith(selectedIndex: index));
    }
  }

  void incrementCount() {
    final currentItems = List<TesbihModel>.from(
      state.items,
    );
    var selectedIndex = state.selectedIndex;

    if (currentItems[selectedIndex].count <
        currentItems[selectedIndex].limit) {
      currentItems[selectedIndex] =
          currentItems[selectedIndex].copyWith(
            count:
                currentItems[selectedIndex]
                    .count +
                1,
          );
    } else {
      final nextIndex = currentItems.indexWhere(
        (item) => item.count < item.limit,
      );
      if (nextIndex != -1) {
        selectedIndex = nextIndex;
        currentItems[selectedIndex] =
            currentItems[selectedIndex].copyWith(
              count:
                  currentItems[selectedIndex]
                      .count +
                  1,
            );
      }
    }

    emit(
      state.copyWith(
        items: currentItems,
        selectedIndex: selectedIndex,
      ),
    );
  }

  void resetSelectedCount() {
    final currentItems = List<TesbihModel>.from(
      state.items,
    );
    currentItems[state.selectedIndex] =
        currentItems[state.selectedIndex]
            .copyWith(count: 0);
    emit(state.copyWith(items: currentItems));
  }
}
