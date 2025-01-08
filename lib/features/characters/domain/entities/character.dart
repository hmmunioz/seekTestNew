import 'package:equatable/equatable.dart';

class Character extends Equatable {
  final String id;
  final String name;
  final String status;
  final String species;
  final String gender;
  final String image;

  const Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.image,
  });

  factory Character.fromDynamic(dynamic e) {
    return Character(
      id: e['id'] as String,
      name: e['name'] as String,
      status: e['status'] as String,
      species: e['species'] as String,
      gender: e['gender'] as String,
      image: e['image'] as String,
    );
  }

  @override
  List<Object?> get props => [id, name, status, species, gender, image];
}
