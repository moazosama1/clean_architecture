import 'package:clean_architecture/Features/home/domain/entities/book_entities.dart';
import 'package:flutter/material.dart';

@immutable
abstract class NewestBooksState {}

class NewestBooksInitial extends NewestBooksState {}

class NewestBooksLoading extends NewestBooksState {}

class NewestBooksPaginationLoading extends NewestBooksState {}

class NewestBooksPaginationFailure extends NewestBooksState {
  final String errorMessage;

  NewestBooksPaginationFailure({required this.errorMessage});
}

class NewestBooksSuccess extends NewestBooksState {
  final List<BookEntities> books;

  NewestBooksSuccess({required this.books});
}

class NewestBooksFailure extends NewestBooksState {
  final String errorMessage;

  NewestBooksFailure({required this.errorMessage});
}
