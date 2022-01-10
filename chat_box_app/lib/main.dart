
import 'package:chat_box_app/logic/auth_service.dart';
import 'package:chat_box_app/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    
  ).then((value) => print('initialized'));
  runApp(
    MultiProvider(
      child: const Routes(),
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
      ],
    ),
  );
}