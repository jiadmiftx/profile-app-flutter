import 'package:flutter/material.dart';
import 'package:profile_app/common/constants.dart';
import 'package:profile_app/providers/auth.dart';
import 'package:profile_app/screens/login_screen.dart';
import 'package:profile_app/screens/profile_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (ctx) => Auth())],
      builder: (context, child) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: kColorScheme,
          primaryColor: kOxfordWhite,
          primarySwatch: Colors.grey,
          appBarTheme: AppBarTheme(
            color: kRichWhite,
            iconTheme: IconThemeData(
              color: kDavysGrey,
            ),
          ),
          scaffoldBackgroundColor: kOxfordWhite,
          textTheme: kTextTheme,
          backgroundColor: kOxfordWhite,
          // brightness: Brightness.light,
          iconTheme: IconThemeData(
            color: kDavysGrey,
          ),
        ),
        home: LoginScreen(),
        routes: {
          LoginScreen.route: (ctx) => LoginScreen(),
          ProfileScreen.route: (ctx) => ProfileScreen()
        },
      ),
    );
  }
}
