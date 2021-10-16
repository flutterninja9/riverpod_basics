import 'package:dartz/dartz.dart';
import 'package:riverpod_basics/cat_fact/domain/domain.dart';
import 'package:riverpod_basics/cat_fact/domain/repository/i_cat_fact_repository.dart';
import 'package:riverpod_basics/cat_fact/shared/failures.dart';

class GetRandomCatFact {
  GetRandomCatFact(this._repository);

  final ICatFactRepository _repository;

  Future<Either<CatFactFailure, Fact>> call() async {
    return await _repository.getFact();
  }
}
