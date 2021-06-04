import 'package:clean_arch/modules/search/domain/entities/result_search.dart';
import 'package:clean_arch/modules/search/domain/errors/errors.dart';
import 'package:clean_arch/modules/search/domain/repositories/interface_search_repository.dart';
import 'package:clean_arch/modules/search/infra/datasource/interface_search_datasource.dart';
import 'package:dartz/dartz.dart';

class SearchRepository implements ISearchRepository {
  final ISearchDataSource datasource;
  SearchRepository(this.datasource);

  @override
  Future<Either<IFailureSearch, List<ResultSearch>>> search(
      String? searchText) async {
    try {
      final result = await datasource.getSearch(searchText);
      return Right(result);
    } on Exception catch (e) {
      return Left(DatasourceError());
    }
  }
}
