import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mpesa_flutter_plugin/mpesa_flutter_plugin.dart';
import 'package:nyumba/Screens/Out/home_page.dart';
import 'package:nyumba/provider/notification_state.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';

import 'constants/keys.dart';
import 'cubit/google_sign/google_sign_in_cubit.dart';
import 'firebase_options.dart';
import 'locator.dart';
/*
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}*/

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setUpLocator();
  MpesaFlutterPlugin.setConsumerKey(kConsumerKey);
  MpesaFlutterPlugin.setConsumerSecret(kConsumerSecret);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GoogleSignInCubit(),
      child: OverlaySupport.global(
        child: ChangeNotifierProvider<NotificationState>(
          create: (context) => NotificationState(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const HomPage(),
            title: 'Email and password login ',
            theme: ThemeData(
              primarySwatch: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
