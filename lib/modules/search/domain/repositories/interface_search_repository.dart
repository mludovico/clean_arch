import 'package:clean_arch/modules/search/domain/entities/result_search.dart';
import 'package:clean_arch/modules/search/domain/errors/errors.dart';
import 'package:dartz/dartz.dart';

abstract class ISearchRepository {
  Future<Either<IFailureSearch, List<ResultSearch>>> search(String? searchText);
}