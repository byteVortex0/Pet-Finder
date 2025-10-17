import 'package:pet_finder/core/service/api/error/api_result.dart';
import 'package:pet_finder/features/pets_home/data/models/pets.dart';

import '../../../../core/service/api/api_service.dart';
import '../../../../core/service/api/error/error_handler.dart';

class GetAllPetsRepo {
  final ApiService apiService;

  GetAllPetsRepo(this.apiService);

  Future<ApiResult<List<Pets>>> getAllPets(int limit, int page) async {
    try {
      final response = await apiService.getAllPets(limit, page);
      return Success(response);
    } catch (e) {
      final failure = await ErrorHandler.handle(e);
      return Failure(failure.errorModel);
    }
  }
}
