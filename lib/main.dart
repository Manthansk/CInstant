import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:instant_messenger_app/helper/authenticate.dart';
import 'package:instant_messenger_app/helper/helperfunctions.dart';
import 'package:instant_messenger_app/localization/demo_localization.dart';
import 'package:instant_messenger_app/localization/language_constants.dart';
import 'package:instant_messenger_app/views/aboutus.dart';
import 'package:instant_messenger_app/views/chatRoomsScreen.dart';
import 'package:instant_messenger_app/views/settings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  const MyApp({Key key}) : super(key: key);
  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(newLocale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool userIsLoggedIn = false;

  Locale _locale;
  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        this._locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  void initState() {
    getLoggedInState();
    super.initState();
  }

  getLoggedInState() async {
    await HelperFunctions.getUserLoggedInSharedPreference().then((value) {
      setState(() {
        userIsLoggedIn = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_locale == null) {
      return Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return MaterialApp(
        title: 'Instant Chat',
        debugShowCheckedModeBanner: false,
        routes: {
          '/aboutus': (context) => AboutPage(),
          '/settings': (context) => Settings(),
        },
        theme: ThemeData(
          primaryColor: Colors.red,
          accentColor: Color(0xFFFEF9EB),
          scaffoldBackgroundColor: Color(0xFFFFCDD2),
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        locale: _locale,
        supportedLocales: [
          Locale("en", "US"),
          Locale("pa", "IN"),
          Locale("gu", "IN"),
          Locale("hi", "IN"),
          Locale("mr", "IN")
        ],
        localizationsDelegates: [
          DemoLocalization.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale.languageCode &&
                supportedLocale.countryCode == locale.countryCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
        home: userIsLoggedIn != null
            ? userIsLoggedIn
                ? ChatRoom()
                : Authenticate()
            : Container(
                child: Center(
                  child: Authenticate(),
                ),
              ),
      );
    }
  }
}
