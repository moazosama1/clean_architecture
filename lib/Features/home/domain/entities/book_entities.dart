import 'package:hive/hive.dart';
part 'book_entities.g.dart';
@HiveType(typeId: 0)
class BookEntities extends HiveObject{
  @HiveField(0)
  final String? bookId;
  @HiveField(1)
  final String? image;
  @HiveField(2)
  final String? title;
  @HiveField(3)
  final String? authorName;
  @HiveField(4)
  final num? price;
  @HiveField(5)
  final num? rating;

  BookEntities(
      {required this.image,
      required this.bookId,
      required this.title,
      required this.authorName,
      required this.price,
      required this.rating});
}
