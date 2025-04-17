import 'package:clean_architecture/Features/home/domain/entities/book_entities.dart';
import 'package:hive/hive.dart';

void savedBoxData(List<BookEntities> bookList, String boxName) {
  var box = Hive.box<BookEntities>(boxName);
  box.addAll(bookList);
}
