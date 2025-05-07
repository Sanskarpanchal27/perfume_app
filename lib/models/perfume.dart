class Perfume {
  final String name;
  final double price;
  final String image;
  final String description;

  int count;

  Perfume({
    required this.name,
    required this.price,
    required this.image,
    required this.description,
    this.count = 0,
  });
}
