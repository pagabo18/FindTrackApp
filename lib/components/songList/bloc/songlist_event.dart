part of 'songlist_bloc.dart';

abstract class SongListEvent extends Equatable {
  const SongListEvent();

  @override
  List<Object> get props => [];
}

class AddSong extends SongListEvent {
  final Map<String, dynamic> SongData;
  AddSong({required this.SongData});
  @override
  List<Object> get props => [SongData];
}
