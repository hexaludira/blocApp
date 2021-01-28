import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/item_model.dart';

class MovieApiProvider {
  Client client = Client();
  final _apiKey =  '59254545c02f9642d954b317582d54a9';

  Future<ItemModel> fetchMovieList() async {
    print("entered");
    final response = await client.get("http://api.themoviedb.org/3/movie/popular?api_keys=$_apiKey");
    print (response.body.toString());

    if(response.statusCode == 200) {
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}