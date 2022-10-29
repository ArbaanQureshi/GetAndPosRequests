import 'dart:math';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:getandpost/Model/Model.dart';
import 'package:getandpost/Reposotory/PostApi.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  final PApi = PostApi();

  PostCubit() : super(PostInitial());

  void postCubit(ModelApi data) async {
    emit(PostLoading());

    PApi.postApi(data.toJson()).catchError((e) {
      emit(PostFailed());
    }).then((value) => {
          if (value != null)
            {
              if (value.statusCode == 200)
                {emit(PostLoaded())}
              else
                {emit(PostFailed())}
            }
        });
  }
}
