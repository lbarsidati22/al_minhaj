part of 'quran_cubit.dart';

sealed class QuranState {}

final class QuranInitial extends QuranState {}

final class ChangeSceneInitial extends QuranState {}

final class ChangeSceneChangedToList
    extends QuranState {}

final class ChangeSceneChangedToQuranPage
    extends QuranState {}
