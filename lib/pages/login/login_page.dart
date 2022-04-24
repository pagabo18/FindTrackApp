import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_finder/auth/bloc/auth_bloc.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/backgroundmusic.gif"),
            fit: BoxFit.cover,
          )),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Container(
                child: Image(
                  image: AssetImage("assets/music.png"),
                  height: 300,
                  width: 300,
                ),
              ),
            ),
            SizedBox(
              height: 200,
            ),
            Center(
              child: MaterialButton(
                  hoverColor: Color.fromARGB(255, 12, 99, 13),
                  color: Color.fromARGB(255, 12, 99, 13),
                  height: 10,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.g_mobiledata_outlined,
                        color: Colors.amber[50],
                        size: 30,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Iniciar con Google",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  minWidth: MediaQuery.of(context).size.width - 60,
                  onPressed: () {
                    BlocProvider.of<AuthBloc>(context).add(GoogleAuthEvent());
                  }),
            ),
          ],
        )
      ]),
    );
  }
}
