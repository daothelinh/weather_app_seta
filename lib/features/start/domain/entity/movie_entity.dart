import '../../data/model/list_movie.dart';

// class ListMovieEntity {
//   List<MovieEntity> list;
//   ListMovieEntity({required this.list});

//   factory ListMovieEntity.fromModel(ListMovie list) =>
//       ListMovieEntity(list: );
// }

class MovieEntity {
  String id;
  String title;
  String year;
  String image;
  String imDbRating;

  MovieEntity(
      {required this.id,
      required this.title,
      required this.year,
      required this.image,
      required this.imDbRating});

  factory MovieEntity.fromModel(Items items) => MovieEntity(
      id: items.id!,
      title: items.title!,
      year: items.year!,
      image: items.image!,
      imDbRating: items.imDbRating!);
}
