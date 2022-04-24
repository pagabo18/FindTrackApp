import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:music_finder/components/mysongs/bloc/mysongs_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class MysongsItem extends StatefulWidget {
  final Map<String, dynamic> dataSongs;

  MysongsItem({Key? key, required this.dataSongs}) : super(key: key);

  @override
  State<MysongsItem> createState() => MysongsItemState();
}

class MysongsItemState extends State<MysongsItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (builder) => AlertDialog(
                          content: Text(
                              "Será redirigido a ver opciones para abrir la cancion ¿Quieres continuar?"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  launch("https://lis.tn/Warriors");
                                },
                                child: Text("Continuar")),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("Cancelar")),
                          ],
                          title: Text("Abrir Cancion"),
                        ));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(30.0)),
                child: Image.network(
                    "https://i.scdn.co/image/d3acaeb069f37d8e257221f7224c813c5fa6024e"),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blueAccent.withOpacity(0.7),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(24),
                      )),
                  child: Column(
                    children: [
                      Text(
                        "Warriors",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "imagine dragons",
                        style: TextStyle(color: Colors.white70, fontSize: 20),
                      ),
                      Text(
                        "Warriors",
                        style: TextStyle(color: Colors.white70, fontSize: 20),
                      ),
                      Text(
                        "02:32",
                        style: TextStyle(color: Colors.white70, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (builder) => AlertDialog(
                            title: Text("Eliminar de favoritos"),
                            content: Text(
                                "El elemento será eliminado de tus favoritos. ¿Quieres continuar?"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    BlocProvider.of<MysongsBloc>(context).add(
                                        DeleteMysongs(
                                            DeleteSong: widget.dataSongs));
                                    BlocProvider.of<MysongsBloc>(context)
                                        .add(GetMysongs());
                                  },
                                  child: Text("Eliminar")),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Cancelar")),
                            ],
                          ));
                },
                icon: Icon(Icons.favorite),
                color: Colors.white,
                iconSize: 40.0),
          ],
        ),
      ),
    );
  }
}


// class MysongsItemState extends State<MysongsItem> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(10.0),
//       child: Container(
//         child: Stack(
//           children: [
//             GestureDetector(
//               onTap: () {
//                 showDialog(
//                     context: context,
//                     builder: (builder) => AlertDialog(
//                           title: Text("Abrir Cancion"),
//                           content: Text(
//                               "Será redirigido a ver opciones para abrir la cancion ¿Quieres continuar?"),
//                           actions: [
//                             TextButton(
//                                 onPressed: () {
//                                   Navigator.of(context).pop();
//                                 },
//                                 child: Text("Cancelar")),
//                             TextButton(
//                                 onPressed: () {
//                                   Navigator.of(context).pop();
//                                   launchUrl(widget.dataSongs["song_link"]);
//                                 },
//                                 child: Text("Continuar")),
//                           ],
//                         ));
//               },
//               child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 decoration:
//                     BoxDecoration(borderRadius: BorderRadius.circular(25.0)),
//                 child: Image.network(widget.dataSongs["albumImage"]),
//               ),
//             ),
//             Positioned.fill(
//               child: Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: MediaQuery.of(context).size.height -
//                       MediaQuery.of(context).size.width -
//                       300,
//                   decoration: BoxDecoration(
//                       color: Colors.blueAccent.withOpacity(0.7),
//                       borderRadius: BorderRadius.only(
//                         topRight: Radius.circular(24),
//                       )),
//                   child: Column(
//                     children: [
//                       Text(
//                         widget.dataSongs["title"],
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 30,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       Text(
//                         widget.dataSongs["artist"],
//                         style: TextStyle(color: Colors.white60, fontSize: 20),
//                       ),
//                       Text(
//                         widget.dataSongs["timecode"],
//                         style: TextStyle(color: Colors.white60, fontSize: 20),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             IconButton(
//                 onPressed: () {
//                   showDialog(
//                       context: context,
//                       builder: (builder) => AlertDialog(
//                             title: Text("Eliminar de favoritos"),
//                             content: Text(
//                                 "El elemento será eliminado de tus favoritos. ¿Quieres continuar?"),
//                             actions: [
//                               TextButton(
//                                   onPressed: () {
//                                     Navigator.of(context).pop();
//                                     BlocProvider.of<MysongsBloc>(context).add(
//                                         DeleteMysongs(
//                                             DeleteSong: widget.dataSongs));
//                                     BlocProvider.of<MysongsBloc>(context)
//                                         .add(GetMysongs());
//                                   },
//                                   child: Text("Eliminar")),
//                               TextButton(
//                                   onPressed: () {
//                                     Navigator.of(context).pop();
//                                   },
//                                   child: Text("Cancelar")),
//                             ],
//                           ));
//                 },
//                 icon: Icon(Icons.favorite),
//                 color: Colors.white,
//                 iconSize: 40.0),
//           ],
//         ),
//       ),
//     );
//   }
// }
