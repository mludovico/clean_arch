import 'dart:convert';

import 'package:clean_arch/modules/search/domain/errors/errors.dart';
import 'package:clean_arch/modules/search/external/datasources/github_datasource.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../utils/mockdata.dart';

class DioMock extends Mock implements Dio {}

void main() {
  final dio = DioMock();
  final datasource = GitHubDatasource(dio);

  test('deve retornar uma lista de ResultSearchModel', () {
    when(dio.get(any)).thenAnswer((_) async => Response(
          data: jsonDecode(githubData),
          statusCode: 200,
        ));
    final future = datasource.getSearch('blah');
    expect(future, completes);
  });

  test('deve retornar um DatasourceError se o codigo não for 200', () {
    when(dio.get(any)).thenAnswer((_) async => Response(
          data: null,
          statusCode: 401,
        ));
    final future = datasource.getSearch('blah');
    expect(future, throwsA(isA<DatasourceError>()));
  });

  test('deve retornar uma Exception se tiver um erro no dio', () {
    when(dio.get(any)).thenThrow(Exception());
    final future = datasource.getSearch('blah');
    expect(future, throwsA(isA<Exception>()));
  });
}
