import 'package:bloc/bloc.dart';
import 'package:getandpost/Reposotory/GetApi.dart';
import 'package:meta/meta.dart';

import '../../Model/Model.dart';

part 'get_state.dart';

class GetCubit extends Cubit<GetState> {
  final _getapi = GetApi();

  GetCubit() : super(GetInitial());

  void getCubitApi() async{
    List<ModelApi> data =[];
    await _getapi.getApi().then((value) {
        var json = value.data;
        data=List<ModelApi>.from(json.map((e)=>ModelApi.fromJson(e)));
    });
    emit(GetLoaded(data));
  }
}
