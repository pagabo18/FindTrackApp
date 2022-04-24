import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'songlist_event.dart';
part 'songlist_state.dart';

class SonglistBloc extends Bloc<SongListEvent, SongListState> {
  SonglistBloc() : super(InitialSongList()) {
    on<AddSong>;
  }
}
