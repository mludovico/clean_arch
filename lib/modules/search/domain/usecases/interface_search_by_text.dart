import 'package:clean_arch/modules/search/domain/entities/result_search.dart';
import 'package:clean_arch/modules/search/domain/errors/errors.dart';
import 'package:dartz/dartz.dart';

abstract class ISearchByText {
  Future<Either<IFailureSearch, List<ResultSearch>>> call(String? searchText);
}