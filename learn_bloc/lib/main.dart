import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class CounterCubit extends Cubit<int> {
  CounterCubit({this.initialData = 0}) : super(initialData);

  int initialData;

  void tambahData() {
    emit(state + 1);
  }

  void kurangData() {
    emit(state - 1);
  }
}

class HomePage extends StatelessWidget {
  CounterCubit myCounter = CounterCubit(initialData: 99);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit Apps'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder(
            initialData: myCounter.initialData,
            stream: myCounter.stream,
            builder: (context, snapshot) {
              // if (snapshot.connectionState == ConnectionState.waiting) {
              //   return const Text(
              //     'Loading...',
              //     style: TextStyle(fontSize: 50),
              //   );
              // } else {
              return Text(
                '${snapshot.data}',
                style: const TextStyle(fontSize: 50),
              );
              // }
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {
                    myCounter.kurangData();
                  },
                  icon: const Icon(Icons.remove)),
              IconButton(
                  onPressed: () {
                    myCounter.tambahData();
                  },
                  icon: const Icon(Icons.add)),
            ],
          )
        ],
      ),
    );
  }
}
