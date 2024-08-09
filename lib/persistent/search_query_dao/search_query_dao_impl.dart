// import 'package:dummyShop/data/vos/search_history/search_history.dart';
// import 'package:dummyShop/persistent/search_query_dao/search_query_dao.dart';
// import 'package:hive_flutter/hive_flutter.dart';
//
// class SearchQueryDAOImpl extends SearchQueryDAO{
//   SearchQueryDAOImpl._();
//   static final SearchQueryDAOImpl _singleton = SearchQueryDAOImpl._();
//   factory SearchQueryDAOImpl()=>_singleton;
//
//
//   Box<SearchHistory> _box()=>Hive.box('BoxNameForQuery');
//
//   @override
//   Future<void> addSearchQuery(String query) async{
//     final searchHistoryItem = SearchHistory(query);
//     await _box().add(searchHistoryItem);
//   }
//
//   @override
//   Future<void> clearSearchHistory()async {
//     await _box().clear();
//   }
//
//   @override
//   List<SearchHistory>? getSearchQueries() {
//     return _box().values.toList();
//   }
//
// }