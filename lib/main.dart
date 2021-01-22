import 'package:flutter/material.dart';
import 'package:blocApp/counter_bloc.dart';
import 'package:rxdart/rxdart.dart';

void main() {
  runApp(BlocApp());
}

class BlocApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocHome(),
    );
  }
}

class BlocHome extends StatefulWidget {
  @override
  _BlocHomeState createState() => _BlocHomeState();
}

class _BlocHomeState extends State<BlocHome> {
  CounterBloc _counterBloc = CounterBloc(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contoh BloC with RxDart'),
      ),
      body: SafeArea(
        child: Center(
          child: StreamBuilder<int>(
            stream: _counterBloc.counterObservable,
            builder: (context, snapshot) {
              return Text(
                "${snapshot.data}",
                style: Theme.of(context).textTheme.headline3,
              );
            },
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            child: Icon(Icons.add), 
            onPressed: () {
              _counterBloc.increment();
            }
          ),
          SizedBox(height: 16.0,),
          FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed: () {
              _counterBloc.decrement();
            }
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _counterBloc.dispose();
    super.dispose();
  }

}
