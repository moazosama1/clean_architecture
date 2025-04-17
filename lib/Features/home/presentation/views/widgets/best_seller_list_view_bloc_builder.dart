import 'package:clean_architecture/Features/home/domain/entities/book_entities.dart';
import 'package:clean_architecture/Features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:clean_architecture/Features/home/presentation/manager/newest_books_cubit/newest_books_state.dart';
import 'package:clean_architecture/Features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:clean_architecture/core/utils/custom_snack_bar_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListViewBlocBuilder extends StatefulWidget {
  const BestSellerListViewBlocBuilder({
    super.key,
  });

  @override
  State<BestSellerListViewBlocBuilder> createState() =>
      _BestSellerListViewBlocBuilderState();
}

class _BestSellerListViewBlocBuilderState
    extends State<BestSellerListViewBlocBuilder> {
  List<BookEntities> bookSaved = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksState>(
      listener: (context, state) {
        if (state is NewestBooksSuccess) {
          bookSaved.addAll(state.books);
        }
        if(state is NewestBooksPaginationFailure){
          customSnackBarError(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        if (state is NewestBooksSuccess ||
            state is NewestBooksPaginationLoading ||
            state is NewestBooksPaginationFailure) {
          return BestSellerListView(
            books: bookSaved,
          );
        } else if (state is NewestBooksFailure) {
          return Text(state.errorMessage);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
