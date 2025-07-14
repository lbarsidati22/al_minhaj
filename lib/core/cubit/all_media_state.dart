part of 'all_media_cubit.dart';

sealed class AllMediaState {}

final class AllMediaInitial extends AllMediaState {}

class GetVideosLoading extends AllMediaState {}

class GetVideosLoaded extends AllMediaState {
  final AllMediaModel allMediaModel;

  GetVideosLoaded({required this.allMediaModel});
}

class GetVideosError extends AllMediaState {
  final String? error;

  GetVideosError({this.error});
}

class GetAudiosLoading extends AllMediaState {}

class GetAudiosLoaded extends AllMediaState {
  final AllMediaModel allMediaModel;

  GetAudiosLoaded({required this.allMediaModel});
}

class GetAudiosError extends AllMediaState {
  final String? error;

  GetAudiosError({this.error});
}
