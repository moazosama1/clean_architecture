import 'package:clean_architecture/Features/home/domain/entities/book_entities.dart';
import 'package:clean_architecture/core/errors/failure.dart';
import 'package:either_dart/either.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntities>>> fetchFeaturedBooks(
      {required int pageNumber});
  Future<Either<Failure, List<BookEntities>>> fetchNewestBooks(
      {required int pageNumber});
}
