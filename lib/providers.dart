import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_basics/fake_database.dart';

/// User provider
final userProvider = FutureProvider<String>((ref) async {
  return await ref.read(databaseProvider).getUserData();
});

/// Counter provider via StateNotifier
final counterController =
    StateNotifierProvider<CounterNotifier, int>((ref) => CounterNotifier());

class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0);

  void add() {
    state++;
  }

  void subtract() {
    state--;
  }
}

/// ASYNC Statenotifier provider for states that doesn't need to be changes in realtime
final counterAsyncController =
    StateNotifierProvider<CounterAsyncNotifier, AsyncValue<int>>(
        (ref) => CounterAsyncNotifier(ref.read));

class CounterAsyncNotifier extends StateNotifier<AsyncValue<int>> {
  CounterAsyncNotifier(
    this.reader,
  ) : super(AsyncLoading()) {
    _init();
  }
  final Reader reader;
  Future<void> _init() async {
    await reader(databaseProvider).initDatabase();
    state = AsyncData(0);
  }

  Future<void> add() async {
    state = AsyncLoading();
    state = AsyncData<int>(await reader(databaseProvider).increment());
  }

  Future<void> subtract() async {
    state = AsyncLoading();
    state = AsyncData<int>(await reader(databaseProvider).decrement());
  }
}
