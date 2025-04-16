import 'package:clean_architecture/Features/home/data/data_sources/local/home_local_data_source.dart';
import 'package:clean_architecture/Features/home/domain/entities/book_entities.dart';
import 'package:clean_architecture/constants.dart';
import 'package:hive/hive.dart';

class HomeLocalDataSourceImpl extends HomeLocalDatasource {
  @override
  List<BookEntities> fetchFeaturedBooks() {
    var box = Hive.box<BookEntities>(kFeaturedBox);
    return box.values.toList();
  }

  @override
  List<BookEntities> fetchNewestBooks() {
    var box = Hive.box<BookEntities>(kNewestBox);
    return box.values.toList();
  }
}
