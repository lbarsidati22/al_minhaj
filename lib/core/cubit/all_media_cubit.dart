import 'dart:developer';

import 'package:al_minhaj/core/models/all_media_model.dart';
import 'package:al_minhaj/core/services/all_media_services.dart';
import 'package:al_minhaj/core/values/app_constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'all_media_state.dart';

class AllMediaCubit extends Cubit<AllMediaState> {
  AllMediaCubit() : super(AllMediaInitial());
  AllMediaModel allMediaModel = AllMediaModel();

  Future<void> getAudio() async {
    try {
      emit(GetAudiosLoading());
      final data = await AllMediaServices()
          .getAllMedia(
            media: AppConstants.audiosPath,
          );
      if (data != null) {
        allMediaModel = AllMediaModel.fromJson(data);
        log(allMediaModel.data![0].title.toString());
        emit(
          GetAudiosLoaded(
            allMediaModel: allMediaModel,
          ),
        );
      } else {
        emit(GetAudiosError());
      }
    } on DioException catch (e) {
      emit(GetAudiosError(error: e.message));
    } catch (e) {
      emit(GetAudiosError(error: e.toString()));
    }
  }

  Future<void> getVideos() async {
    try {
      emit(GetVideosLoading());
      final data = await AllMediaServices()
          .getAllMedia(
            media: AppConstants.videosPath,
          );
      if (data != null) {
        allMediaModel = AllMediaModel.fromJson(data);
        log(allMediaModel.data![0].title.toString());
        emit(
          GetVideosLoaded(
            allMediaModel: allMediaModel,
          ),
        );
      } else {
        emit(GetVideosError());
      }
    } on DioException catch (e) {
      emit(GetVideosError(error: e.message));
    } catch (e) {
      emit(GetVideosError(error: e.toString()));
    }
  }
}
