part of 'post_cubit.dart';


abstract class PostState {}

class PostInitial extends PostState {}
class PostLoading extends PostState {}
class PostLoaded extends PostState {}
class PostFailed extends PostState {}
