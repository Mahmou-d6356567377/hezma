
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hezma/Data/Errors/failures.dart';
import 'package:hezma/Data/Repo/my_account_screan_repos/terms_repo/terms_repo.dart';
import 'package:hezma/utils/API/api_service.dart';
import 'package:hezma/utils/constants.dart';

class TermsRepoImpl implements TermsRepo{
  final ApiService apiService;

  TermsRepoImpl(this.apiService);
  @override
  Future<Either<Failure, String>> fetchTerms() async{
   try {
      var result =  await apiService.get(url: '${baseURL}terms', token: 'token');
    var result1 = result['data'][0]['value'];
    return right(result1);
   } on DioException catch (e) {
     return left(ServerFailure(e.toString()));
   } catch (e) {
     return left(ServerFailure(e.toString()));
   }
  }

}