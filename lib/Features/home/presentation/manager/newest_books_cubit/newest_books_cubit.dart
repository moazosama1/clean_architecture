import 'package:bloc/bloc.dart';
import 'package:clean_architecture/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:clean_architecture/Features/home/presentation/manager/newest_books_cubit/newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit({required this.fetchNewestBooksUseCase})
      : super(NewestBooksInitial());
  final FetchNewestBooksUseCase fetchNewestBooksUseCase;

  Future<void> fetchNewestBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(NewestBooksLoading());
    } else {
      emit(NewestBooksPaginationLoading());
    }
    var books = await fetchNewestBooksUseCase.call(pageNumber);
    books.fold(
      (failure) {
        if (pageNumber == 0) {
          emit(NewestBooksFailure(errorMessage: failure.errorMessage));
        } else {
          emit(
              NewestBooksPaginationFailure(errorMessage: failure.errorMessage));
        }
      },
      (books) {
        emit(NewestBooksSuccess(books: books));
      },
    );
  }
}
