part of 'record_bloc.dart';

class Listening extends RecordEvent {}

abstract class RecordEvent extends Equatable {
  const RecordEvent();

  @override
  List<Object> get props => [];
}

class LoadingRecord extends RecordEvent {}

class SendRecord extends RecordEvent {
  final Map<String, dynamic> SaveRecord;

  SendRecord({required this.SaveRecord});

  @override
  List<Object> get props => [SaveRecord];
}
