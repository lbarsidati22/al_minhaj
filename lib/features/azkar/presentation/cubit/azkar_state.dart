part of 'azkar_cubit.dart';

sealed class AzkarState {}

final class AzkarInitial extends AzkarState {}

final class AzkarLoading extends AzkarState {}

final class AzkarLoaded extends AzkarState {
  final List<AzkarModel> azkarList;

  AzkarLoaded({required this.azkarList});
}

final class AzkarError extends AzkarState {
  final String message;

  AzkarError({required this.message});
}
