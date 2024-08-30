
// ignore_for_file: avoid_print

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hezma/Data/Errors/failures.dart';
import 'package:hezma/Data/Repo/my_account_screan_repos/addresses_repo/addresses_repo.dart';
import 'package:hezma/Data/models/my_account_screan_models/addresses/data.dart';
import 'package:hezma/utils/API/api_service.dart';
import 'package:hezma/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddressesRepoImpl implements AddressesRepo {

 final  ApiService apiService ;

  AddressesRepoImpl(this.apiService);
  @override
  

  Future<Either<Failure, AddressData>> getAddresses() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token1 = pref.getString(sharedToken)!;
   try {
      var result =  await  apiService.get(url: '${baseURL}address', token: token1);
    List<AddressData> addressdata = result['data'];
      List<AddressData> dataAddresses  = [];

      for (var item in addressdata) {
          dataAddresses.add(item);
      }

      return right(dataAddresses as AddressData);
   }on DioException catch (e) {
     return left(ServerFailure(e.toString()));
   }catch (e) {
     return left(ServerFailure(e.toString()));
   }
  }



  @override
  Future<Either<Failure, String>> delAddresses({required int id}) async{
     SharedPreferences pref = await SharedPreferences.getInstance();
    String token1 = pref.getString(sharedToken)!;
    try {
       var result = await apiService.del(url: '${baseURL}address/delete/$id', token: token1, );
       String message = result['message'];
       print(message);
       return right(message);
    }on DioException catch (e) {
     return left(ServerFailure(e.toString()));
   }catch (e) {
     return left(ServerFailure(e.toString()));
   }
  }




  @override
  Future<Either<Failure, AddressData>> editAddresses({
    required String name ,
    required String address ,
    required String latitude,
    required String longitude,
    required String id,
  })  async{
     Map<String, dynamic> body = {
    'name':name,
    'address':address,
    'lat':latitude,
    'lng':longitude,
    };

         SharedPreferences pref = await SharedPreferences.getInstance();
         String token1 = pref.getString(sharedToken)!;

    try {
     var result = await apiService.post(url: '${baseURL}address/update/$id', token: token1, body: body);
     AddressData createdAddress = result['data'];
     return right(createdAddress);
    } on DioException catch (e) {
      return left(ServerFailure(e.toString()));
    }catch (e) {
      return left(ServerFailure(e.toString()));
    }

  }



  @override
  Future<Either<Failure, AddressData>> createAddresses({
    required String name ,
    required String districtId,
    required String address ,
    required String latitude,
    required String longitude,
  }) async{

    Map<String, dynamic> body = {
      'name':name , 
      'district_id': districtId,
      'address':address,
      'lat':latitude,
      'lng':longitude,
    };

       SharedPreferences pref = await SharedPreferences.getInstance();
       String token1 = pref.getString(sharedToken)!;

    try {
     var result = await apiService.post(url: '${baseURL}address/create', token: token1, body: body);
     AddressData createdAddress = result['data'];
     return right(createdAddress);
    } on DioException catch (e) {
      return left(ServerFailure(e.toString()));
    }catch (e) {
      return left(ServerFailure(e.toString()));
    }
    
  }

}