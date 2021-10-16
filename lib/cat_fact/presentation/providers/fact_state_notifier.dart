import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_basics/cat_fact/domain/domain.dart';
import 'package:riverpod_basics/cat_fact/presentation/presentation.dart';

class CatFactNotifier extends StateNotifier<FactState> {
  CatFactNotifier(this._getRandomCatFact) : super(FactState.initial());

  final GetRandomCatFact _getRandomCatFact;

  Future<void> getRandomCatFact() async {
    state = FactState.loading();
    final failureOrResult = await _getRandomCatFact();
    state = failureOrResult.fold(
      (f) => state = FactState.failure(f),
      (fact) => state = FactState.loaded(fact),
    );
  }
}
