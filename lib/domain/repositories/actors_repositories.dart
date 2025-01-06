import '../entities/actor.dart';

abstract class ActorsReporitory {
  Future<List<Actor>> getActorsByMovie(String movieId);
}