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
}
