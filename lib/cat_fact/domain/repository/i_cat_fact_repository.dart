import 'package:dartz/dartz.dart';
import 'package:riverpod_basics/cat_fact/domain/domain.dart';
import 'package:riverpod_basics/cat_fact/shared/failures.dart';

abstract class ICatFactRepository {
  Future<Either<CatFactFailure, Fact>> getFact();
}
