import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nyumba/Screens/Out/Login_screen.dart';

import 'cubit/google_sign/google_sign_in_cubit.dart';

/*Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}*/
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GoogleSignInCubit(),
      child: MaterialApp(
        home: const LoginScreen(),
        title: 'Email and password login ',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
      ),
    );
  }
}
