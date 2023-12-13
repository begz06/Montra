import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:montra_app_a1/modules/navigation/presentation/home.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) => MaterialApp(
        navigatorKey: _navigatorKey,
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          // _navigator.pushReplacement(fade(page: NavigationScreen()));
          // switch (state.authStatus) {
          //
          //   case AuthenticationStatus.authenticated:
          //     _navigator.pushReplacement(fade(page: NavigationScreen()));
          //     break;
          //   case AuthenticationStatus.unauthenticated:
          //     _navigator.pushReplacement(fade(page: LoginScreen()));
          //     break;
          //   case AuthenticationStatus.unknown:
          //     _navigator.pushReplacement(fade(page: LoginScreen()));
          //     break;
          //   case AuthenticationStatus.noNetworkConnection:
          //     _navigator.pushReplacement(fade(page: ConnectionScreen()));
          // }

          return 
               const NavigationScreen();
        },
        onGenerateRoute: (_) {
          return MaterialPageRoute(
              builder: (c) => const Scaffold(
                    body: Center(
                      child: CupertinoActivityIndicator(),
                    ),
                  ));
        },
      );
}