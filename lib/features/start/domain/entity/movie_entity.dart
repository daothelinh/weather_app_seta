class ListMovie {
  List<MovieEntity> list;
  ListMovie({required this.list});
}

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
}
