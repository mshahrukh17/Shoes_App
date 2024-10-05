import '../export/AllExport.dart';

class ShoeModel {
  final String image;
  final String brand;
  final String name;
  Color color;
  final int price;
  var size;
  ShoeModel({
    required this.image,
    required this.brand,
    required this.name,
    required this.price,
    required this.color,
    this.size,
  });

  void removeAt(int index) {}
}

class Brands {
  final String brand;
  Brands({
    required this.brand,
  });
}
