part of 'songlist_bloc.dart';

abstract class SongListState extends Equatable {
  const SongListState();

  @override
  List<Object> get props => [];
}

class InitialSongList extends SongListState {}

class UploadingStateSongList extends SongListState {}

class ErrorStateSongList extends SongListState {}

class SuccessStateSongList extends SongListState {}
