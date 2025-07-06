part of 'tesbih_cubit.dart';

class TesbihState {
  final List<TesbihModel> items;
  final int selectedIndex;

  TesbihState({
    required this.items,
    this.selectedIndex = 0,
  });

  @override
  // ignore: override_on_non_overriding_member
  List<Object> get props => [items, selectedIndex];

  TesbihState copyWith({
    List<TesbihModel>? items,
    int? selectedIndex,
  }) {
    return TesbihState(
      items: items ?? this.items,
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}
