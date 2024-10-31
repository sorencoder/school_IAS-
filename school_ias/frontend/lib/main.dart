import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:frontend/constant.dart';
import 'package:frontend/firebase_options.dart';
import 'package:frontend/logic/provider/CounterProvider.dart';
import 'package:frontend/logic/provider/authentication.dart';
import 'package:frontend/logic/provider/passwordvisibiltyprovider.dart';
import 'package:frontend/presentation/screens/homepage.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CounterProvier>(
            create: (context) => CounterProvier()),
        ChangeNotifierProvider<PasswordVisiblityProvider>(
            create: (context) => PasswordVisiblityProvider()),
        ChangeNotifierProvider<Authentication>(
            create: (context) => Authentication())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Themes.defaultTheme,
        home: const HomePage(),
      ),
    );
  }
}
