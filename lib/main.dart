import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_implementation/Counter_Bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bloc Implementation',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (BuildContext context) => CounterBloc(0),
        child: CounterApp(),
      ),
    );
  }
}

class CounterApp extends StatelessWidget {
  CounterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, int>(
              builder: (BuildContext context, int state) {
            return Text(
              "Counter Value: $state",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            );
          }),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Text('Increment'),
                onPressed: () => _counterBloc.add(CounterEvents.increment),
              ),
              ElevatedButton(
                child: Text('Decrement'),
                onPressed: () => _counterBloc.add(CounterEvents.decrement),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
