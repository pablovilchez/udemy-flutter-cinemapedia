import 'package:cinemapedia/config/constants/environment.dart';
import 'package:dio/dio.dart';

import '../../domain/datasources/movie_datasource.dart';
import '../../domain/entities/movie.dart';

class MoviedbDatasourceImpl extends MovieDataSource {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Environment.theMovieDbApiKey,
      'language': 'es-ES',
    },
  ));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing');
    final List<Movie> movies = [];

    return movies;
  }
}
