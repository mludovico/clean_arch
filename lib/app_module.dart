import 'package:clean_arch/modules/search/domain/repositories/interface_search_repository.dart';
import 'package:clean_arch/modules/search/domain/usecases/interface_search_by_text.dart';
import 'package:clean_arch/modules/search/domain/usecases/search_by_text.dart';
import 'package:clean_arch/modules/search/external/datasources/github_datasource.dart';
import 'package:clean_arch/modules/search/infra/datasource/interface_search_datasource.dart';
import 'package:clean_arch/modules/search/infra/repositories/search_repository.dart';
import 'package:clean_arch/modules/search/presenter/search/search_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

setupLocators(Dio dio) {
  final getIt = GetIt.I;
  getIt.registerSingleton<Dio>(dio);
  getIt
      .registerSingleton<ISearchDataSource>(GitHubDatasource(getIt.get<Dio>()));
  getIt.registerSingleton<ISearchRepository>(
      SearchRepository(getIt.get<ISearchDataSource>()));
  getIt.registerSingleton<ISearchByText>(
      SearchByText(getIt.get<ISearchRepository>()));
  getIt.registerSingleton<SearchBloc>(SearchBloc(getIt.get<ISearchByText>()));
}
