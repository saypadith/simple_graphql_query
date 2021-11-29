// To parse this JSON data, do
//
//     final booksModel = booksModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

BooksModel booksModelFromJson(String str) => BooksModel.fromJson(json.decode(str));

String booksModelToJson(BooksModel data) => json.encode(data.toJson());

class BooksModel {
    BooksModel({
        required this.author,
        required this.bookName,
        required this.pages,
        required this.createdAt,
    });

    String author;
    String bookName;
    int pages;
    DateTime createdAt;

    factory BooksModel.fromJson(Map<String, dynamic> json) => BooksModel(
        author: json["author"],
        bookName: json["book_name"],
        pages: json["pages"],
        createdAt: DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "author": author,
        "book_name": bookName,
        "pages": pages,
        "created_at": createdAt.toIso8601String(),
    };

   
  static List<BooksModel> fromJsonList(List list) {
    // if (list == null) return null;
    return list
        .map<BooksModel>((item) => BooksModel.fromJson(item))
        .toList();
  }
}
