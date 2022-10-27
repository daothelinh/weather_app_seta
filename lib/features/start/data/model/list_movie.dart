import 'package:freezed_annotation/freezed_annotation.dart';
part 'list_movie.freezed.dart';
part 'list_movie.g.dart';

@freezed
class Items with _$Items {
  const factory Items({
    final String? id,
    final String? rank,
    final String? title,
    final String? fullTitle,
    final String? year,
    final String? image,
    final String? crew,
    final String? imDbRating,
    final String? imDbRatingCount,
  }) = _Items;

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);
}

@freezed
class ListMovie with _$ListMovie {
  const factory ListMovie({
    final List<Items>? items,
    final String? errorMessage,
  }) = _ListMovie;

  factory ListMovie.fromJson(Map<String, dynamic> json) =>
      _$ListMovieFromJson(json);
}
