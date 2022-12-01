
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:processing_data/connectivity/ui/bloc/connectivity_bloc.dart';
import 'package:processing_data/helpers/helpers.dart';
import 'package:processing_data/injection_container.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key, required this.title});

  final String title;

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {

  @override
  void initState() {
    sl.get<ConnectivityBloc>().add(StartFollowingConnectivity());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityBloc, ConnectivityState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(connectivity[state.connectionStatus] ?? FontAwesomeIcons.xmark, size: 60,),
                const SizedBox(height: 10,),
                 Text(
                  internetAccess[state.internetAccess]!, style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
