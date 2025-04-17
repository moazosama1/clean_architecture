import 'package:clean_architecture/Features/home/data/data_sources/local/home_local_data_source.dart';
import 'package:clean_architecture/Features/home/domain/entities/book_entities.dart';
import 'package:clean_architecture/constants.dart';
import 'package:hive/hive.dart';

class HomeLocalDataSourceImpl extends HomeLocalDatasource {
  @override
  List<BookEntities> fetchFeaturedBooks({int pageNumber = 0}) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;
    var box = Hive.box<BookEntities>(kFeaturedBox);
    int length = box.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    } else {
      return box.values.toList().sublist(startIndex, endIndex);
    }
  }

  @override
  List<BookEntities> fetchNewestBooks({int pageNumber = 0}) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;
    var box = Hive.box<BookEntities>(kNewestBox);
    int length = box.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    } else {
      return box.values.toList().sublist(startIndex, endIndex);
    }
  }
}
