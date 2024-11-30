import 'package:dio/dio.dart';

import 'package:cinemapedia/config/constants/environment.dart';
import '../../domain/datasources/movies_datasource.dart';

import 'package:cinemapedia/infrastructure/mappers/movie_mapper.dart';
import '../models/moviedb/moviedb_response.dart';
import '../../domain/entities/movie.dart';

class MoviedbDatasource extends MoviesDataSource {
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
    final moviedbResponse = MovieDbResponse.fromJson(response.data);
    final List<Movie> movies = moviedbResponse.results
        .map((e) => MovieMapper.moviedbToEntity(e))
        .toList();

    return movies;
  }
}
