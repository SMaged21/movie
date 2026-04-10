import 'package:equatable/equatable.dart';

class BelongsToCollection extends Equatable {
  final int? id;
  final String? name;
  final String? posterPath;
  final String? backdropPath;

  const BelongsToCollection({
    this.id,
    this.name,
    this.posterPath,
    this.backdropPath,
  });

  factory BelongsToCollection.fromJson(Map<String, dynamic> json) {
    return BelongsToCollection(
      id: json['id'] as int?,
      name: json['name'] as String?,
      posterPath: json['poster_path'] as String?,
      backdropPath: json['backdrop_path'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'poster_path': posterPath,
    'backdrop_path': backdropPath,
  };

  @override
  List<Object?> get props => [id, name, posterPath, backdropPath];
}
