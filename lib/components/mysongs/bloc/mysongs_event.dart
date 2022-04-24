part of 'mysongs_bloc.dart';

abstract class MysongsEvent extends Equatable {
  const MysongsEvent();

  @override
  List<Object> get props => [];
}

class DeleteMysongs extends MysongsEvent {
  final Map<String, dynamic> DeleteSong;
  DeleteMysongs({required this.DeleteSong});

  @override
  List<Object> get props => [DeleteSong];
}

class GetMysongs extends MysongsEvent {}
