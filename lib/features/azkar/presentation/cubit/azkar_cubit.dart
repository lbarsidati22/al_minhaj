import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:al_minhaj/features/azkar/data/repos/azkar_repo.dart';
import 'package:al_minhaj/features/azkar/model/azkar_model.dart';

part 'azkar_state.dart';

class AzkarCubit extends Cubit<AzkarState> {
  AzkarRepo azkarRepo;
  AzkarCubit({required this.azkarRepo})
    : super(AzkarInitial());

  Future<void> getAzkar({
    required String type,
    required int id,
  }) async {
    emit(AzkarLoading());
    try {
      final azkar = await azkarRepo.getAzkar(
        type: type,
        id: id,
      );
      emit(AzkarLoaded(azkarList: azkar));
      log(azkar.length.toString());
    } catch (e) {
      emit(AzkarError(message: e.toString()));
    }
  }
}
