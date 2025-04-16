import 'package:clean_architecture/Features/home/domain/entities/book_entities.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntities>> fetchFeaturedBooks();
  Future<List<BookEntities>> fetchNewestBooks();
}
