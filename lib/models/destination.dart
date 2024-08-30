class Destination {
  final String name;
  final String imageUrl;
  final String description;
  bool isFavorite;

  Destination({
    required this.name,
    required this.imageUrl,
    required this.description,
    this.isFavorite = false,
  });
}
