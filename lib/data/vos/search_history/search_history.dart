import 'package:hive/hive.dart';

part 'search_history.g.dart';

@HiveType(typeId: 0)
class SearchHistory {
  @HiveField(0)
  final String? query;

  SearchHistory(this.query);
}