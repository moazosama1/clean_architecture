import 'package:clean_architecture/Features/home/domain/entities/book_entities.dart';
import 'package:flutter/material.dart';

@immutable
abstract class FeaturedBooksState {}

class FeaturedBooksInitial extends FeaturedBooksState {}

class FeaturedBooksLoading extends FeaturedBooksState {}

class FeaturedBooksPaginationLoading extends FeaturedBooksState {}

class FeaturedBooksPaginationFailure extends FeaturedBooksState {
  final String errorMessage;

  FeaturedBooksPaginationFailure({required this.errorMessage});
}

class FeaturedBooksSuccess extends FeaturedBooksState {
  final List<BookEntities> books;

  FeaturedBooksSuccess({required this.books});
}

class FeaturedBooksFailure extends FeaturedBooksState {
  final String errorMessage;

  FeaturedBooksFailure({required this.errorMessage});
}
