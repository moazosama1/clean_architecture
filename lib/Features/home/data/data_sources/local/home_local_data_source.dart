import 'package:clean_architecture/Features/home/domain/entities/book_entities.dart';

abstract class HomeLocalDatasource {
  List<BookEntities> fetchFeaturedBooks();
  List<BookEntities> fetchNewestBooks();
}
