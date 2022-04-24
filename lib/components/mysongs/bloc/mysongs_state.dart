part of 'mysongs_bloc.dart';

abstract class MysongsState extends Equatable {
  const MysongsState();

  @override
  List<Object> get props => [];
}

class InitialMysongs extends MysongsState {}

class LoadingStateMysongs extends MysongsState {}

class ErrorStateMySongs extends MysongsState {}

class DeleteSuccessStateMySongs extends MysongsState {}

class SuccessStateMysongs extends MysongsState {
  final List<dynamic> MySongs;

  SuccessStateMysongs({required this.MySongs});

  @override
  List<Object> get props => [MySongs];
}
