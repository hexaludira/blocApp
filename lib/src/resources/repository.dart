import 'dart:async';
import 'package:blocApp/src/models/trailer_model.dart';

import 'movie_api_provider.dart';
import '../models/item_model.dart';

//Kelas untuk menjembatani BloC
class Repository{
  final moviesApiProvider = MovieApiProvider();

  Future<ItemModel> fetchAllMovies() => moviesApiProvider.fetchMovieList();

  Future<TrailerModel> fetchTrailer(int movieId) => moviesApiProvider.fetchTrailer(movieId);
}