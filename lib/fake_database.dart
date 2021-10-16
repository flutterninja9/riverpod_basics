import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Not to be used by ui of app
/// [providers.dart] is there for this purpose
final databaseProvider = Provider<FakeDatabase>((ref) => FakeDatabase());

class FakeDatabase {
  int? fakeDatabase;

  Future<String> getUserData() async {
    return Future.delayed(
      const Duration(seconds: 3),
      () => 'Radhey Mohan Sharma',
    );
  }

  Future<void> initDatabase() async {
    Future.delayed(const Duration(seconds: 3), () {
      fakeDatabase = 0;
    });
  }

  Future<int> increment() async {
    return Future.delayed(
      const Duration(seconds: 3),
      () {
        return fakeDatabase = fakeDatabase! + 1;
      },
    );
  }

  Future<int> decrement() async {
    return Future.delayed(
      const Duration(seconds: 3),
      () {
        return fakeDatabase = fakeDatabase! - 1;
      },
    );
  }
}
