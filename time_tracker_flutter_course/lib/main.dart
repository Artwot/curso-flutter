import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app/services/auth.dart';
import 'app/landing_page.dart';

// Definir el método principal de la aplicación
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Inicializar Firebase
  print("Conexión a Firebase");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
      create: (context) => Auth(),
      child: MaterialApp(
        title: 'Time Tracker',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        // Llamar a la la página de Sign In
        home: LandingPage(),
      ),
    );
  }
}
