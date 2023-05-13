import 'package:cdao/providers/firebasertdb_service.dart';
import 'package:cdao/providers/firestore_service.dart';
import 'package:cdao/providers/storage_service.dart';
import 'package:cdao/routes/route_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  await Firebase.initializeApp(
    options: 
    const FirebaseOptions(
      apiKey: "",
      authDomain: "",
      databaseURL: "",
      projectId: "",
      storageBucket: "",
      messagingSenderId: "",
      appId: ""
    ),
  );

  runApp(const CDAO());
}

class CDAO extends StatelessWidget {
  const CDAO({super.key});
  @override
  Widget build(BuildContext context) {
    var themeData = ThemeData(
      scaffoldBackgroundColor: Colors.black,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.orange,
      ).copyWith(
        secondary: Colors.blueGrey,
      ),
      textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: Colors.orange,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      buttonTheme: ButtonTheme.of(context).copyWith(
        buttonColor: Colors.orange,
        textTheme: ButtonTextTheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
    return MultiProvider(
      providers: [
        Provider<FirestoreService>(
          create: (context) => FirestoreService(),
        ),
        Provider<StorageService>(
          create: (context) => StorageService(),
        ),
        ChangeNotifierProvider<DB>(
          create: (context) => DB(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: CDAORouter.returnRouter(),
        title: 'Coffee DAO',
        theme: themeData,
      )
    );
  }
}
