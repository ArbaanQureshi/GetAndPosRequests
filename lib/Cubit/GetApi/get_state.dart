part of 'get_cubit.dart';

@immutable
abstract class GetState {}

class GetInitial extends GetState {}
class GetLoading extends GetState {}
class GetFailed extends GetState {}
class GetLoaded extends GetState {
  List<ModelApi> getModelAPi;
  GetLoaded(this.getModelAPi);
}
