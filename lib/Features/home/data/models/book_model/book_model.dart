import 'item.dart';

class BookModel {
  String? kind;
  num? totalItems;
  List<BookItem>? items;

  BookModel({this.kind, this.totalItems, this.items});

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        kind: json['kind'] as String?,
        totalItems: json['totalItems'] as num?,
        items: (json['items'] as List<dynamic>?)
            ?.map((e) => BookItem.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'kind': kind,
        'totalItems': totalItems,
        'items': items?.map((e) => e.toJson()).toList(),
      };
}
