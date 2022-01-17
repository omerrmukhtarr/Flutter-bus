import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Src/Route.dart';
import 'Src/Provider/name_provider.dart';
import 'Src/Service/auth_service.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    
  ).then((value) => print('initialized'));

  runApp(
    MultiProvider(
      child: const Routing(),
      providers: [
        ChangeNotifierProvider(create: (context) => TheNameProvider()),
        ChangeNotifierProvider(create: (context) => AuthService()),
      ],
    ),
  );
}
