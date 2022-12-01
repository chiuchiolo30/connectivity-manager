import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:processing_data/connectivity/ui/bloc/connectivity_bloc.dart';
import 'package:processing_data/injection_container.dart';

import 'connectivity/ui/screens/screens.dart';

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  await setup();

  runApp(
    BlocProvider(
      create: (_) => sl.get<ConnectivityBloc>(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityBloc, ConnectivityState>(
      builder: (context, state) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MyHomeScreen(title: 'Manage connectivity status'),
        );
      },
    );
  }
}
