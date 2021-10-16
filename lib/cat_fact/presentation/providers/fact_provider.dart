// Data source
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_basics/cat_fact/data/data_sources/cat_fact_remote_data_source.dart';
import 'package:riverpod_basics/cat_fact/data/repository_impl/cat_fact_repository.dart';
import 'package:riverpod_basics/cat_fact/domain/domain.dart';
import 'package:riverpod_basics/cat_fact/presentation/presentation.dart';
import 'package:riverpod_basics/cat_fact/presentation/providers/fact_state_notifier.dart';

// Data source
final _dioProvider = Provider<Dio>((ref) => Dio());

final _catFactDataSourceProvider = Provider<ICatFactRemoteDataSource>((ref) {
  return ICatFactRemoteDataSource(ref.read(_dioProvider));
});

// Repository
final _factRepositoryProvider = Provider<ICatFactRepository>((ref) {
  return CatFactRepository(ref.read(_catFactDataSourceProvider));
});

// Usecase
final getRandomJokeProvider = Provider<GetRandomCatFact>((ref) {
  return GetRandomCatFact(ref.read(_factRepositoryProvider));
});

// State notifier [For UI]
final factProvider = StateNotifierProvider<CatFactNotifier, FactState>((ref) {
  return CatFactNotifier(ref.read(getRandomJokeProvider));
});
