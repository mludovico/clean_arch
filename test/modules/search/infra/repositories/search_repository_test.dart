import 'package:clean_arch/modules/search/domain/entities/result_search.dart';
import 'package:clean_arch/modules/search/domain/errors/errors.dart';
import 'package:clean_arch/modules/search/infra/datasource/interface_search_datasource.dart';
import 'package:clean_arch/modules/search/infra/models/result_search_model.dart';
import 'package:clean_arch/modules/search/infra/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SearchDatasourceMock extends Mock implements ISearchDataSource {}

void main() {
  final datasource = SearchDatasourceMock();
  final repository = SearchRepository(datasource);

  test('Deve retornar uma lista de reultsearchmodel', () async {
    when(datasource.getSearch(any))
        .thenAnswer((_) async => <ResultSearchModel>[]);
    final result = await repository.search('Marcelo');
    expect(result | null, isA<List<ResultSearch>>());
  });

  test('Deve retornar uma exception se o datasource falhar', () async {
    when(datasource.getSearch(any)).thenThrow(Exception());
    final result = await repository.search('Marcelo');
    expect(result.fold(id, id), isA<DatasourceError>());
  });
}
