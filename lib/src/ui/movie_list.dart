import 'package:blocApp/src/ui/movie_detail.dart';
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
      appBar: AppBar(
        title: Text("Popular Movies"),
      ),
      body: StreamBuilder(
        stream: bloc.allMovies,
        builder: (context, AsyncSnapshot<ItemModel> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator(),);
        },
      ),
    );
  }

  Widget buildList (AsyncSnapshot<ItemModel> snapshot) {
    return GridView.builder(
      itemCount: snapshot.data.results.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
      itemBuilder: (BuildContext context, int index) {
        return GridTile(
          child: InkResponse(
            enableFeedback: true,
            child: Image.network("https://image.tmdb.org/t/p/w185${snapshot.data.results[index].poster_path}", fit: BoxFit.cover,),
            onTap: () => openDetailPage(snapshot.data, index),
          ),
        );
      }
    );
  }

  openDetailPage (ItemModel data, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return MovieDetail(
          title: data.results[index].title,
          posterUrl: data.results[index].backdrop_path,
          description: data.results[index].,
        );
      })
    )
  }
}