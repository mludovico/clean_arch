import 'package:clean_arch/modules/search/domain/entities/result_search.dart';
import 'package:clean_arch/modules/search/domain/errors/errors.dart';
import 'package:clean_arch/modules/search/domain/repositories/interface_search_repository.dart';
import 'package:clean_arch/modules/search/domain/usecases/interface_search_by_text.dart';
import 'package:dartz/dartz.dart';

class SearchByText implements ISearchByText {

  final ISearchRepository repository;
  SearchByText(this.repository);

  @override
  Future<Either<IFailureSearch, List<ResultSearch>>> call(String? searchText) async {
    if (searchText == null || searchText.isEmpty)
      return Left(InvalidTextError());
    final result = await repository.search(searchText);
    return result;
  }
}