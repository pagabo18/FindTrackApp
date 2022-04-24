// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:music_finder/components/mysongs/bloc/mysongs_bloc.dart';

// import 'package:music_finder/pages/songs/mysongsItem.dart';
import 'package:url_launcher/url_launcher.dart';

class MySongspage extends StatefulWidget {
  MySongspage({Key? key}) : super(key: key);

  @override
  State<MySongspage> createState() => MsongsState();
}

class MsongsState extends State<MySongspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Padding(
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
                                      final url = "https://lis.tn/Warriors";
                                      launch(url);
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
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Image.network(
                        "https://i.scdn.co/image/d3acaeb069f37d8e257221f7224c813c5fa6024e"),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: MediaQuery.of(context).size.height -
                          MediaQuery.of(context).size.width -
                          300,
                      width: MediaQuery.of(context).size.width,
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
                            style:
                                TextStyle(color: Colors.white70, fontSize: 20),
                          ),
                          Text(
                            "02:32",
                            style:
                                TextStyle(color: Colors.white70, fontSize: 20),
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
                                    "La cancion ya no estará en favoritos ¿Quieres continuar?"),
                                actions: [
                                  TextButton(
                                      onPressed: () {},
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
        ),
      ],
    ));
  }
}




// class MsongsState extends State<MySongspage> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<MysongsBloc, MysongsState>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           if (state is SuccessStateMysongs) {
//             return Scaffold(
//               appBar: AppBar(),
//               body: ListView.builder(
//                   itemCount: state.MySongs.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return MysongsItem(dataSongs: state.MySongs[index]);
//                   }),
//             );
//           } else {
//             return Center(child: CircularProgressIndicator());
//           }
//         });
//   }
// }
