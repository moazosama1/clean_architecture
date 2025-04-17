import 'package:clean_architecture/Features/home/data/data_sources/local/home_local_data_source.dart';
import 'package:clean_architecture/Features/home/data/data_sources/remote/home_remote_data_source.dart';
import 'package:clean_architecture/Features/home/domain/entities/book_entities.dart';
import 'package:clean_architecture/Features/home/domain/repos/home_repo.dart';
import 'package:clean_architecture/core/errors/failure.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/src/either.dart';

class HomeRepoImpl extends HomeRepo {
  HomeLocalDatasource homeLocalDataSource;
  HomeRemoteDataSource homeRemoteDataSource;
  HomeRepoImpl(
      {required this.homeLocalDataSource, required this.homeRemoteDataSource});
  @override
  Future<Either<Failure, List<BookEntities>>> fetchFeaturedBooks(
      {int pageNumber = 0}) async {
    try {
      var booksSaved =
          homeLocalDataSource.fetchFeaturedBooks(pageNumber: pageNumber);
      if (booksSaved.isNotEmpty) {
        return Right(booksSaved);
      }
      var books =
          await homeRemoteDataSource.fetchFeaturedBooks(pageNumber: pageNumber);
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDio(e));
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntities>>> fetchNewestBooks(
      {int pageNumber = 0}) async {
    try {
      var booksSaved =
          homeLocalDataSource.fetchNewestBooks(pageNumber: pageNumber);
      if (booksSaved.isNotEmpty) {
        return Right(booksSaved);
      }
      var books =
          await homeRemoteDataSource.fetchNewestBooks(pageNumber: pageNumber);
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDio(e));
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
