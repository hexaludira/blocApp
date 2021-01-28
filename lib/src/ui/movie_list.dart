import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../blocs/movies_bloc.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  @override
  void initState(){
    super.initState();
    bloc.fetchAllMovies();
  }

  @override
  void dispose(){
    super.dispose();
    bloc.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ,
    );
  }
}