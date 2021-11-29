import 'package:hasura_connect/hasura_connect.dart';
import 'package:simple_graphql_query/models/book_model.dart';
import 'package:simple_graphql_query/utils/hasura_helper.dart';

class BooksProvider {
  static Future<List<BooksModel>> fetAllAds() async {
    //document
    String docQuery = """
      query {
        books {
          author
          book_name
          pages
          created_at
        }
      }
    """;
    //get query
    var r = await HasuraHelper.hasuraConn().query(docQuery);
    List<BooksModel> ads = (r['data']['books'] as List)
        .map((value) => BooksModel.fromJson(value))
        .toList();
    return ads;
  }

  static Future<Snapshot<List<BooksModel>>> subAllBook() async {
    //document
    String docQuery = """
      subscription {
        books {
          author
          book_name
          pages
          created_at
        }
      }
    """;
    //get subscription
    var connector = HasuraHelper.hasuraConn();
    Snapshot snapshot = await connector.subscription(docQuery);
    return snapshot.map((data) {
  
      return BooksModel.fromJsonList(data["data"]["books"]);
    });
  }
}
