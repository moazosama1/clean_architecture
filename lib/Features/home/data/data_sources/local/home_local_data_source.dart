import 'package:clean_architecture/Features/home/domain/entities/book_entities.dart';

abstract class HomeLocalDatasource {
  List<BookEntities> fetchFeaturedBooks({int pageNumber = 0});
  List<BookEntities> fetchNewestBooks({int pageNumber = 0});
}
