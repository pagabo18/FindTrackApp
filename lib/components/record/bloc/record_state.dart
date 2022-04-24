part of 'record_bloc.dart';

abstract class RecordState extends Equatable {
  const RecordState();

  @override
  List<Object> get props => [];
}

class InitialRecord extends RecordState {}

class LoadingStateRecord extends RecordState {}

class ErrorStateRecord extends RecordState {}

class SuccessStateRecord extends RecordState {
  final Map<String, dynamic> RecordJson;

  SuccessStateRecord({required this.RecordJson});

  @override
  List<Object> get props => [RecordJson];
}
