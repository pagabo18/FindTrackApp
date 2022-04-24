import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

part 'mysongs_event.dart';
part 'mysongs_state.dart';

class MysongsBloc extends Bloc<MysongsEvent, MysongsState> {
  MysongsBloc() : super(InitialMysongs()) {
    on<GetMysongs>(mySongs);
  }

  FutureOr<void> mySongs(GetMysongs event, Emitter emit) async {
    emit(LoadingStateMysongs());
    try {
      var a_User = await FirebaseFirestore.instance
          .collection("a_user")
          .doc("${FirebaseAuth.instance.currentUser!.uid}");
      var itemsUser = await a_User.get();
      List<dynamic> itemsIds = itemsUser.data()?["a_favotires"] ?? [];
      emit(SuccessStateMysongs(MySongs: itemsIds));
    } catch (error) {
      emit(ErrorStateMySongs());
      print("No se encontraron las canciones: $error");
    }
  }
}
