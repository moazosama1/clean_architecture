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
  Future<Either<Failure, List<BookEntities>>> fetchFeaturedBooks() async {
    try {
      var booksSaved = homeLocalDataSource.fetchFeaturedBooks();
      if (booksSaved.isNotEmpty) {
        return Right(booksSaved);
      }
      var books = await homeRemoteDataSource.fetchFeaturedBooks();
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDio(e));
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntities>>> fetchNewestBooks() async {
    try {
      var booksSaved = homeLocalDataSource.fetchNewestBooks();
      if (booksSaved.isNotEmpty) {
        return Right(booksSaved);
      }
      var books = await homeRemoteDataSource.fetchNewestBooks();
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDio(e));
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
