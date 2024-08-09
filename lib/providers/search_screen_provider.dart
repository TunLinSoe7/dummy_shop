  import 'package:dummyShop/data/model/search_query_model.dart';
import 'package:dummyShop/data/model/search_query_model_impl.dart';
import 'package:dummyShop/data/vos/search_history/search_history.dart';
import 'package:dummyShop/network/data_agent/product_data_agent.dart';
  import 'package:dummyShop/network/data_agent/product_data_agent_impl.dart';
import 'package:dummyShop/persistent/search_query_dao/search_query_dao.dart';
import 'package:dummyShop/persistent/search_query_dao/search_query_dao_impl.dart';
  import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

  import '../data/vos/product_vo.dart';

  class SearchScreenProvider extends ChangeNotifier{
    bool isLoading = false;
    bool _isDispose = false;
    final TextEditingController _searchTextController = TextEditingController();
    TextEditingController get searchTextController=>_searchTextController;
    final ProductDataAgent _dataAgent = ProductDataAgentImpl();
    //final SearchQueryModel _searchQueryModel = SearchQueryModelImpl();

    List<ProductsVO>? search;
    List<String>? searchQuery;

    void updateSearchText(String text) {
      _searchTextController.text = text;
      notifyListeners();
    }

    List<SearchHistory> _recentSearches = [];

    List<SearchHistory> get recentSearches => _recentSearches;

    SearchHistoryProvider() {
      _loadSearchHistory();
    }

    Future<void> _loadSearchHistory() async {
      var box = await Hive.openBox<SearchHistory>('search_history');
      _recentSearches = box.values.toList();
      notifyListeners();
    }

    Future<void> addSearchQuery(String query) async {
      var box = await Hive.openBox<SearchHistory>('search_history');
      var existingQuery = box.values
          .where((search) => search.query?.toLowerCase() == query.toLowerCase())
          .toList();

      if (existingQuery.isEmpty) {
        var searchQuery = SearchHistory(query);
        await box.add(searchQuery);
        _recentSearches.add(searchQuery);
        notifyListeners();
      }
    }
    Future<void> fetchSearchProducts(String query)async{
      try{
        isLoading = true;
        notifyListeners();
        await _dataAgent.fetchProductsSearch(query).then((value) {
          if(value !=null){
            search = value;
            isLoading  = false;
            notifyListeners();
          }
        });
      }catch(e){
        throw Exception('Failed to load search$e');
      }
      notifyListeners();
    }
    @override
    void dispose() {
      searchTextController.dispose();
      super.dispose();
    }

    @override
    void notifyListeners() {
      if(!_isDispose){
        super.notifyListeners();
      }
    }
  }