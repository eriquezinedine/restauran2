import 'package:restaurapp2/core/model/category.dart';

class Product {
  Product({
    required this.id,
    required this.nombre,
    required this.category,
    required this.price,
    required this.img,
    this.count = 1,
    this.description = 'Papitas',
    this.note,
  });

  final String id;
  final String nombre;
  final Category category;
  final int price;
  final String img;
  final String? note;
  final String description;
  int count;

  Product copyWith({
    String? id,
    String? nombre,
    Category? category,
    int? price,
    String? img,
    String? description,
    String? comment,
    int? count,
  }) {
    return Product(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      category: category ?? this.category,
      price: price ?? this.price,
      count: count ?? this.count,
      img: img ?? this.img,
      description: description ?? this.description,
      note: comment ?? this.note,
    );
  }
}
