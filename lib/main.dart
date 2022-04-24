import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth/bloc/auth_bloc.dart';
import 'components/mysongs/bloc/mysongs_bloc.dart';
import 'components/record/bloc/record_bloc.dart';
import 'components/songList/bloc/songlist_bloc.dart';
import 'pages/home/home_page.dart';
import 'pages/login/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()..add(VerifyAuthEvent())),
        BlocProvider(create: (context) => MysongsBloc()..add(GetMysongs())),
        BlocProvider(create: (context) => RecordBloc()),
        BlocProvider(create: (context) => SonglistBloc()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.dark(),
      ),
      title: 'FindTrackApp',
      home: BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
        if (state is AuthErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("No se pudo iniciar sesión"),
          ));
        }
      }, builder: (context, state) {
        if (state is SignOutSuccessState) {
          return LoginPage();
        } else if (state is AuthErrorState) {
          return LoginPage();
        } else if (state is UnAuthState) {
          return LoginPage();
        } else if (state is AuthSuccessState) {
          return HomePage();
        } else {
          return Center(
            child: CircularProgressIndicator(color: Colors.blueAccent),
          );
        }
      }),
    );
  }
}
