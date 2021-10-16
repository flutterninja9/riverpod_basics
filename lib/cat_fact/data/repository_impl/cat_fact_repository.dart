import 'package:dartz/dartz.dart';
import 'package:riverpod_basics/cat_fact/data/data_sources/cat_fact_remote_data_source.dart';
import 'package:riverpod_basics/cat_fact/domain/entity/fact.dart';
import 'package:riverpod_basics/cat_fact/domain/repository/i_cat_fact_repository.dart';
import 'package:riverpod_basics/cat_fact/shared/failures.dart';

class CatFactRepository implements ICatFactRepository {
  CatFactRepository(this._remoteDataSource);

  final ICatFactRemoteDataSource _remoteDataSource;

  @override
  Future<Either<CatFactFailure, Fact>> getFact() async {
    try {
      final failureOrFact = await _remoteDataSource.getFact();
      return right(failureOrFact.toDomain());
    } catch (e) {
      return left(CatFactFailure.server(e.toString()));
    }
  }
}
