import 'package:hasura_connect/hasura_connect.dart';
import 'package:simple_graphql_query/utils/app_utils.dart';

class HasuraHelper{
  
  static HasuraConnect hasuraConn(){
    HasuraConnect hasuraConnect = HasuraConnect(AppUtils.hasuraEndpoint, headers: {
      "x-hasura-admin-secret" : "yoursecret"
    });
    return hasuraConnect;
  }
}