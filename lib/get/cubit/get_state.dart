part of 'get_cubit.dart';

sealed class GetState extends Equatable {
  const GetState();

  @override
  List<Object> get props => [];
}

final class GetInitial extends GetState {}

final class GetLoading extends GetState {}

final class GetLoaded extends GetState {}

final class GetError extends GetState {}
