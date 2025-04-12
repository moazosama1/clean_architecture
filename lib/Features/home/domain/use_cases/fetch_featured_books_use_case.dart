import 'package:clean_architecture/Features/home/domain/entities/book_entities.dart';
import 'package:clean_architecture/Features/home/domain/repos/home_repo.dart';
import 'package:clean_architecture/core/errors/failure.dart';
import 'package:clean_architecture/core/use_cases/call_no_pram.dart';
import 'package:either_dart/src/either.dart';

class FetchFeaturedBooksUseCase extends UseCaseCallNoPram<List<BookEntities>> {
  final HomeRepo homeRepo;
  FetchFeaturedBooksUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<BookEntities>>> call()async {
    return await homeRepo.fetchFeaturedBooks();
  }
}
