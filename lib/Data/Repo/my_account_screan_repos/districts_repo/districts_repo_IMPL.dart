import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hezma/Data/Errors/failures.dart';
import 'package:hezma/Data/Repo/my_account_screan_repos/districts_repo/districts_repo.dart';
import 'package:hezma/Data/models/my_account_screan_models/dirstrict_model/datum.dart';
import 'package:hezma/utils/API/api_service.dart';
import 'package:hezma/utils/constants.dart';

class DistrictsRepoImpl implements DistrictRepo {
  final ApiService apiService;

  DistrictsRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<DistrictModel>>> fetchDistrictPlaces() async {
    try {
      var response =
          await apiService.get(url: '${baseURL}districts', token: '');

      List<DistrictModel> districtPlaces = (response['data'] as List)
          .map((element) =>
              DistrictModel.fromJson(element as Map<String, dynamic>))
          .toList();

      print('Fetched districts successfully');
      return right(districtPlaces);
    } on DioException catch (e) {
      print('Fetching districts failed: $e');
      return left(ServerFailure(e.toString()));
    } catch (e) {
      print('Fetching districts failed: $e');
      return left(ServerFailure(e.toString()));
    }
  }
}
