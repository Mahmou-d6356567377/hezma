
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiService{
  final Dio _dio;
  ApiService(this._dio);

  Future <Map<String , dynamic>> get ({required String  url , @required String? token }) async{
   Map<String, String > headers = {};
    if(token != null){
      headers.addAll({'Authorization': 'Bearer $token'});
    }
   var response = await _dio.get(url , options:  Options(headers: headers),) ;
  
    return response.data;
   }



Future <Map<String , dynamic>> post ({required String  url , @required String? token }) async{
   Map<String, String > headers = {};
    if(token != null){
      headers.addAll({'Authorization': 'Bearer $token'});
    }
   var response = await _dio.post(url , options:  Options(headers: headers),) ;
    return response.data;
   }
}