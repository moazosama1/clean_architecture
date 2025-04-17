import 'package:clean_architecture/Features/home/domain/entities/book_entities.dart';
import 'package:clean_architecture/Features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'best_seller_list_view_item.dart';

class BestSellerListView extends StatefulWidget {
  const BestSellerListView({super.key, required this.books});

  final List<BookEntities> books;
  @override
  State<BestSellerListView> createState() => _BestSellerListViewState();
}

class _BestSellerListViewState extends State<BestSellerListView> {
  final ScrollController _scrollController = ScrollController();
  int nextPage = 1;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() async {
      double maxScroll = _scrollController.position.maxScrollExtent;
      double currentScroll = _scrollController.position.pixels;
      double scrollPercentage = currentScroll / maxScroll;

      if (scrollPercentage >= 0.7) {
        if (!isLoading) {
          isLoading = true;
          await BlocProvider.of<NewestBooksCubit>(context)
              .fetchNewestBooks(pageNumber: nextPage++);
          isLoading = false;
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      itemCount: widget.books.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: BookListViewItem(
            bookItem: widget.books[index],
          ),
        );
      },
    );
  }
}
