import 'package:dio/dio.dart';
import 'dart:developer';

class GetApi {
  final Url='https://adnan-rest-api.herokuapp.com/states';
  Future<Response> getApi() async {
    Response response;
    var dio = Dio();
    log(Url);
    response = await dio.get(Url);
    try{
      if(response.statusCode==200){
        return response;
      }else{
        throw('something went wrong${response.statusCode}');
      }
    }catch(e){
      rethrow;
    }
  }
}
