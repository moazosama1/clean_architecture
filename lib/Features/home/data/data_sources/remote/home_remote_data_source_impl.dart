import 'package:clean_architecture/Features/home/data/data_sources/remote/home_remote_data_source.dart';
import 'package:clean_architecture/Features/home/data/models/book_model/book_model.dart';
import 'package:clean_architecture/Features/home/domain/entities/book_entities.dart';
import 'package:clean_architecture/constants.dart';
import 'package:clean_architecture/core/api/api_service.dart';
import 'package:clean_architecture/core/api/url_books.dart';
import 'package:clean_architecture/core/functions/save_box_data.dart';

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});
  @override
  Future<List<BookEntities>> fetchFeaturedBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
        endPoint: "${UrlBooks.featureBooks}&startIndex=${pageNumber * 10}");
    var response = BookModel.fromJson(data);
    List<BookEntities> bookList = response.items?.toList() ?? [];
    savedBoxData(bookList, kFeaturedBox);
    return bookList;
  }

  @override
  Future<List<BookEntities>> fetchNewestBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
        endPoint: "${UrlBooks.newestBooks}&startIndex=${pageNumber * 10}");
    var response = BookModel.fromJson(data);
    List<BookEntities> bookList = response.items?.toList() ?? [];
    savedBoxData(bookList, kNewestBox);
    return bookList;
  }
}
