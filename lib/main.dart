import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:montra_app_a1/modules/home/presentation/bloc/recent_transaction/recent_transaction_bloc.dart';
import 'package:montra_app_a1/modules/navigation/presentation/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => RecentTransactionBloc()
                  ..add(const RecentTransactionEvent.getTransaction())),
          ],
          child: MaterialApp(
            home: const NavigationScreen(),
            debugShowCheckedModeBanner: false,
          ));
}
