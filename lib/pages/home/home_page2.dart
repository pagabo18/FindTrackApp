import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../auth/bloc/auth_bloc.dart';
// import '../../components/mysongs/bloc/mysongs_bloc.dart';
import '../../components/record/bloc/record_bloc.dart';

import '../../components/songList/SongList_item.dart';
import '../songs/mysongs_page.dart';

class HomePage2 extends StatefulWidget {
  HomePage2({Key? key}) : super(key: key);

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Escuchadas"),
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (builder) => AlertDialog(
                            content: Text(
                                "El elemento se agregará a tus favoritos ¿Quieres continuar"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    // BlocProvider.of<MysongsBloc>(context).add(GetMysongs());
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MySongspage()));
                                  },
                                  child: Text("Continuar")),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Cancelar")),
                            ],
                          ));
                },
                icon: Icon(Icons.favorite))
          ],
        ),
        backgroundColor: Colors.grey[900],
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                  "https://i.scdn.co/image/d3acaeb069f37d8e257221f7224c813c5fa6024e"),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Warriors",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Warriors",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "Imagine Dragons",
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            ),
            SizedBox(
              height: 30,
            ),
            Divider(
              color: Colors.grey[900],
            ),
            Text("Abrir con"),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    launch(
                        "https://open.spotify.com/album/6rRFeV6xigfNyPoZ6YqcoW?highlight=spotify:track:1sWeSMifj6Z6kZyI6z3bRc");
                  },
                  icon: Icon(Icons.music_note),
                  iconSize: 40,
                ),
                IconButton(
                  onPressed: () {
                    launch("https://lis.tn/Warriors");
                  },
                  icon: Icon(Icons.podcasts),
                  iconSize: 40,
                ),
                IconButton(
                  onPressed: () {
                    launch(
                        "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview118/v4/65/07/f5/6507f5c5-dba8-f2d5-d56b-39dbb62a5f60/mzaf_1124211745011045566.plus.aac.p.m4a");
                  },
                  icon: Icon(Icons.apple),
                  iconSize: 40,
                ),
              ],
            )
          ],
        ));
  }
}
