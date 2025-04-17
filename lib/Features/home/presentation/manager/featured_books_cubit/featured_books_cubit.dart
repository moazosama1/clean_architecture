import 'package:bloc/bloc.dart';
import 'package:clean_architecture/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:clean_architecture/Features/home/presentation/manager/featured_books_cubit/featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit({required this.fetchFeaturedBooksUseCase})
      : super(FeaturedBooksInitial());
  final FetchFeaturedBooksUseCase fetchFeaturedBooksUseCase;

  Future<void> fetchFeaturedBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(FeaturedBooksLoading());
    } else {
      emit(FeaturedBooksPaginationLoading());
    }
    var books = await fetchFeaturedBooksUseCase.call(pageNumber);
    books.fold(
      (failure) {
        if (pageNumber == 0) {
          emit(FeaturedBooksFailure(errorMessage: failure.errorMessage));
        } else {
          emit(FeaturedBooksPaginationFailure(
              errorMessage: failure.errorMessage));
        }
      },
      (books) {
        emit(FeaturedBooksSuccess(books: books));
      },
    );
  }
}
