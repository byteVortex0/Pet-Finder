import 'package:dio/dio.dart';
import 'package:pet_finder/features/pets_home/data/models/pets.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

const String baseUrl = 'https://api.thecatapi.com/';

@RestApi(baseUrl: baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("v1/breeds")
  Future<List<Pets>> getAllPets(
    @Query("limit") int limit,
    @Query("page") int page,
  );
}
