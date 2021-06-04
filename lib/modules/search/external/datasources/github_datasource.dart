import 'package:clean_arch/modules/search/domain/entities/result_search.dart';
import 'package:clean_arch/modules/search/domain/errors/errors.dart';
import 'package:clean_arch/modules/search/infra/datasource/interface_search_datasource.dart';
import 'package:clean_arch/modules/search/infra/models/result_search_model.dart';
import 'package:dio/dio.dart';

extension on String {
  urlEncode() {
    return this.replaceAll(' ', '+');
  }
}

class GitHubDatasource implements ISearchDataSource {
  final Dio dio;
  GitHubDatasource(this.dio);

  @override
  Future<List<ResultSearch>> getSearch(String? text) async {
    final response = await dio
        .get('https://api.github.com/search/users?q=${text!.urlEncode()}');
    if (response.statusCode == 200) {
      final list = (response.data['items'] as List)
          .map((e) => ResultSearchModel.fromMap(e))
          .toList();
      return list;
    } else {
      throw DatasourceError();
    }
  }
}
