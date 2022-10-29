import 'package:dio/dio.dart';


class PostApi{
  final url='https://adnan-rest-api.herokuapp.com/states';
  Future<Response> postApi(Map<String,dynamic>postdata) async{
      Response response;
      var dio = Dio();
      response= await dio.post(url,data:postdata );
      return response;
}
}