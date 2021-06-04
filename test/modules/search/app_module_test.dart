import 'dart:convert';

import 'package:clean_arch/app_module.dart';
import 'package:clean_arch/modules/search/domain/entities/result_search.dart';
import 'package:clean_arch/modules/search/domain/usecases/interface_search_by_text.dart';
import 'package:clean_arch/modules/search/domain/usecases/search_by_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

import 'utils/mockdata.dart';

class DioMock extends Mock implements Dio {}

void main() async {
  final dio = DioMock();
  setupLocators(dio);

  test('Deve recuperar o usecase sem erro', () {
    final usecase = GetIt.I<ISearchByText>();
    expect(usecase, isA<SearchByText>());
  });

  test('Deve trazer uma lista de ResultSearch', () async {
    when(dio.get(any)).thenAnswer((_) async => Response(
          data: jsonDecode(githubData),
          statusCode: 200,
        ));
    final usecase = GetIt.I<ISearchByText>();
    final result = await usecase('Marcelo');
    expect(result | null, isA<List<ResultSearch>>());
  });
}
