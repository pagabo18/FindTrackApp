import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_finder/pages/home/home_page2.dart';

import '../../auth/bloc/auth_bloc.dart';
// import '../../components/mysongs/bloc/mysongs_bloc.dart';
import '../../components/record/bloc/record_bloc.dart';

import '../../components/songList/SongList_item.dart';
import '../songs/mysongs_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool flag = false;
  String logo = "assets/musiclogo.png";

  @override
  Widget build(BuildContext context) {
    {
      return Scaffold(
        backgroundColor: Color.fromARGB(255, 27, 27, 27),
        body: Padding(
          padding: EdgeInsets.only(top: 150.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                  child: Text(
                "Tocar aquí para escuchar",
                style: TextStyle(color: Colors.white60, fontSize: 25),
              )),
              SizedBox(
                height: 100,
              ),
              Container(
                child: AvatarGlow(
                  glowColor: Colors.blue,
                  endRadius: 120,
                  animate: flag,
                  child: Material(
                    elevation: 8.0,
                    shape: CircleBorder(),
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            flag = true;
                          });
                        },
                        child: Image(
                          image: AssetImage(logo),
                          width: 128,
                        ),
                      ),
                      radius: 90,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      // BlocProvider.of<MysongsBloc>(context).add(GetMysongs());
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MySongspage()));
                    },
                    icon: CircleAvatar(
                      child: Icon(Icons.favorite),
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white60,
                    ),
                    iconSize: 50,
                  ),
                  IconButton(
                    onPressed: () {
                      // BlocProvider.of<MysongsBloc>(context).add(GetMysongs());
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage2()));
                    },
                    icon: CircleAvatar(
                      child: Icon(Icons.music_note),
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white60,
                    ),
                    iconSize: 50,
                  ),
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (builder) => AlertDialog(
                          actions: [
                            TextButton(
                              child: Text("Cancelar"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: Text("Cerrar sesión"),
                              onPressed: () {
                                Navigator.of(context).pop();
                                BlocProvider.of<AuthBloc>(context)
                                  ..add(SignOutEvent());
                              },
                            ),
                          ],
                          title: Text("Aviso, cerrará sesión"),
                          content: Text(
                              "esta acción lo mandará a login, quiere continuar?"),
                        ),
                      );
                    },
                    icon: CircleAvatar(
                      child: Icon(Icons.power_settings_new),
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white60,
                    ),
                    iconSize: 50,
                  )
                ],
              ),
            ],
          ),
        ),
      );
    }
  }
}
