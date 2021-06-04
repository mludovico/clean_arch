import 'package:clean_arch/modules/search/domain/entities/result_search.dart';

abstract class ISearchDataSource {
  Future<List<ResultSearch>> getSearch(String? text);
}
