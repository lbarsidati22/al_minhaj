import 'package:al_minhaj/features/azkar/data/api/azkar_api.dart';
import 'package:al_minhaj/features/azkar/model/azkar_model.dart';

class AzkarRepo {
  AzkarApi azkarApi;
  AzkarRepo({required this.azkarApi});

  Future<List<AzkarModel>> getAzkar({
    required String type,
    required int id,
  }) async {
    final response = await azkarApi.getAzkar(
      type: type,
      id: id,
    );
    return response
        .map((e) => AzkarModel.fromJson(e))
        .toList();
  }
}
