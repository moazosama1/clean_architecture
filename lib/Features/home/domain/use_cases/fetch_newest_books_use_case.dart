import 'package:clean_architecture/Features/home/domain/entities/book_entities.dart';
import 'package:clean_architecture/Features/home/domain/repos/home_repo.dart';
import 'package:clean_architecture/core/errors/failure.dart';
import 'package:clean_architecture/core/use_cases/call_pram.dart';
import 'package:either_dart/src/either.dart';

class FetchNewestBooksUseCase extends UseCaseCallPram<List<BookEntities>, int> {
  final HomeRepo homeRepo;
  FetchNewestBooksUseCase({required this.homeRepo});
  @override
  Future<Either<Failure, List<BookEntities>>> call([int pageNumber = 0]) async {
    return await homeRepo.fetchNewestBooks(pageNumber: pageNumber);
  }
}
