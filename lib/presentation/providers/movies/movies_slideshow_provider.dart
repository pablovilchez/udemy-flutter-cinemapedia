import 'package:cinemapedia/presentation/providers/movies/movies_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/movie.dart';

final moviesSlideshowProvider = Provider<List<Movie>>((ref) {
  final nowPlayingProvider = ref.watch(nowPlayingMoviesProvider);

  if (nowPlayingProvider.isEmpty) return [];

  return nowPlayingProvider.sublist(0, 6);
});