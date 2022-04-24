import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:music_finder/tokken/tokken.dart';
import 'package:record/record.dart';

part 'record_event.dart';
part 'record_state.dart';

class RecordBloc extends Bloc<RecordEvent, RecordState> {
  RecordBloc() : super(InitialRecord()) {
    on<Listening>(rec);
  }

  FutureOr<void> rec(Listening event, Emitter emit) async {
    try {
      final rec = Record();
      if (!await rec.hasPermission()) {
        emit(ErrorStateRecord());
        return;
      }
      await rec.start();
      await Future.delayed(Duration(seconds: 6));
      String? Song = await rec.stop();
      print("recording");

      if (Song != null) {
        print("recorded");
        File sendSong = new File(Song);
        String songBytes = base64Encode(sendSong.readAsBytesSync());
        final Uri API = Uri.parse("https://api.audd.io/");
        Map<String, String> urlParameters = {
          'api_token': TOKKEN,
          'audio': songBytes,
          'return': 'apple_music,spotify',
        };

        final response = await http.post(API, body: urlParameters);
        if (response.statusCode == 200) {
          final songData = await jsonDecode(response.body)["result"];
          emit(SuccessStateRecord(RecordJson: {
            "artist": songData["artist"],
            "title": songData["title"],
            "album": songData["album"],
            "timecode": songData["timecode"],
            "song_link": songData["song_link"],
            "apple_music": songData["apple_music"],
            "spotify": songData["spotify"]["external_urls"]["spotify"],
            "albumImage": songData["spotify"]["album"]["images"][0]["url"]
          }));
        }
      } else {
        emit(ErrorStateRecord());
        return;
      }
    } catch (error) {
      print("no se encontró la cancion: $error");
      emit(ErrorStateRecord());
    }
  }
}
