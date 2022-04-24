import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_finder/components/songList/bloc/songlist_bloc.dart';

class SongList extends StatefulWidget {
  final Map<String, dynamic> songData;

  SongList({Key? key, required this.songData}) : super(key: key);

  @override
  State<SongList> createState() => _SongListState();
}

class _SongListState extends State<SongList> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SonglistBloc, SongListState>(
      listener: (context, state) {
        if (state is SuccessStateSongList) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              "Agregando la canción...",
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.white,
          ));
        } else if (state is UploadingStateSongList) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              "Procesando...",
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.white,
          ));
        } else if (state is ErrorStateSongList) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Color.fromARGB(255, 54, 54, 54),
            content: Text("Se encuentra en favoritos"),
          ));
        }
      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: Text("Favoritos"),
              actions: [
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (builder) => AlertDialog(
                                content: Text(
                                    "El elemento se agregará a tus favoritos agregado a tus favoritos ¿Quieres continuar"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        BlocProvider.of<SonglistBloc>(context)
                                            .add(AddSong(
                                                SongData: widget.songData));
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
            backgroundColor: Color.fromARGB(255, 70, 70, 70),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child:
                      Image.network(widget.songData["albumImage"].toString()),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  widget.songData["title"].toString(),
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.songData["album"].toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.songData["artist"].toString(),
                  style: TextStyle(color: Color.fromARGB(255, 133, 132, 132)),
                ),
                SizedBox(
                  height: 30,
                ),
                Divider(
                  color: Color.fromARGB(255, 112, 111, 111),
                ),
                Text("Abrir con"),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MaterialButton(
                        onPressed: () {
                          if (widget.songData["spotify"] != null) {
                            launch(widget.songData["spotify"].toString());
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Cancion no encontrada en spotify"),
                              backgroundColor: Colors.purple,
                            ));
                          }
                        },
                        child: Tooltip(
                            message: "Abrir con Spotify",
                            child: Image.asset("assets/spotify.png"))),
                    IconButton(
                      onPressed: () {
                        if (widget.songData["song_link"] != null) {
                          launch(widget.songData["song_link"].toString());
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Cancion no encontrada"),
                            backgroundColor: Colors.purple,
                          ));
                        }
                      },
                      icon: Icon(Icons.podcasts),
                      iconSize: 40,
                    ),
                    IconButton(
                      onPressed: () {
                        if (widget.songData["apple_music"] != null) {
                          launch(
                              widget.songData["apple_music"]["url"].toString());
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Cancion no encontrada en apple"),
                            backgroundColor: Colors.purple,
                          ));
                        }
                      },
                      icon: Icon(Icons.apple),
                      iconSize: 40,
                    ),
                  ],
                )
              ],
            ));
      },
    );
  }
}





// Scaffold(
//             appBar: AppBar(
//               title: Text("Favoritos"),
//               actions: [
//                 IconButton(
//                     onPressed: () {
//                       showDialog(
//                           context: context,
//                           builder: (builder) => AlertDialog(
//                                 content: Text(
//                                     "El elemento se agregará a tus favoritos agregado a tus favoritos ¿Quieres continuar"),
//                                 actions: [
//                                   TextButton(
//                                       onPressed: () {
//                                         Navigator.of(context).pop();
//                                         BlocProvider.of<SonglistBloc>(context)
//                                             .add(AddSong(
//                                                 SongData: widget.songData));
//                                       },
//                                       child: Text("Continuar")),
//                                   TextButton(
//                                       onPressed: () {
//                                         Navigator.of(context).pop();
//                                       },
//                                       child: Text("Cancelar")),
//                                 ],
//                               ));
//                     },
//                     icon: Icon(Icons.favorite))
//               ],
//             ),
//             backgroundColor: Color.fromARGB(255, 70, 70, 70),
//             body: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Container(
//                   width: MediaQuery.of(context).size.width,
//                   child:
//                       Image.network(widget.songData["albumImage"].toString()),
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 Text(
//                   widget.songData["title"].toString(),
//                   style: TextStyle(
//                     fontSize: 25,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   widget.songData["album"].toString(),
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 Text(
//                   widget.songData["artist"].toString(),
//                   style: TextStyle(color: Color.fromARGB(255, 133, 132, 132)),
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 Divider(
//                   color: Color.fromARGB(255, 112, 111, 111),
//                 ),
//                 Text("Abrir con"),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     MaterialButton(
//                         onPressed: () {
//                           if (widget.songData["spotify"] != null) {
//                             launch(widget.songData["spotify"].toString());
//                           } else {
//                             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                               content: Text("Cancion no encontrada en spotify"),
//                               backgroundColor: Colors.purple,
//                             ));
//                           }
//                         },
//                         child: Tooltip(
//                             message: "Abrir con Spotify",
//                             child: Image.asset("assets/spotify.png"))),
//                     IconButton(
//                       onPressed: () {
//                         if (widget.songData["song_link"] != null) {
//                           launch(widget.songData["song_link"].toString());
//                         } else {
//                           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                             content: Text("Cancion no encontrada"),
//                             backgroundColor: Colors.purple,
//                           ));
//                         }
//                       },
//                       icon: Icon(Icons.podcasts),
//                       iconSize: 40,
//                     ),
//                     IconButton(
//                       onPressed: () {
//                         if (widget.songData["apple_music"] != null) {
//                           launch(
//                               widget.songData["apple_music"]["url"].toString());
//                         } else {
//                           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                             content: Text("Cancion no encontrada en apple"),
//                             backgroundColor: Colors.purple,
//                           ));
//                         }
//                       },
//                       icon: Icon(Icons.apple),
//                       iconSize: 40,
//                     ),
//                   ],
//                 )
//               ],
//             ));