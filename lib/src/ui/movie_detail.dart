import 'package:flutter/material.dart';

class MovieDetail extends StatefulWidget {
  final posterUrl;
  final description;
  final releaseDate;
  final String title;
  final String voteAverage;
  final int movieId;

  MovieDetail({
      this.title,
      this.posterUrl,
      this.description,
      this.releaseDate,
      this.voteAverage,
      this.movieId,
  });

  @override
  State<StatefulWidget> createState() {
    return _MovieDetailState(
      
    );
  }
  // _MovieDetailState createState() => _MovieDetailState(
  //   title: title,
  //   posterUrl: posterUrl,

  // );
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
