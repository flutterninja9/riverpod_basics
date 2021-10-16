import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class User {
  User(this.id, this.name, this.address);

  final String address;
  final int id;
  final String name;

  @override
  String toString() => 'User(address: $address, id: $id, name: $name)';
}

class Database {
  Stream<User> getUserData(int id) async* {
    yield User(id, "Test Name", "Test Adresss");
  }
}

final dataBaseProvider = Provider<Database>((ref) {
  return Database();
});

final userStreamProvider =
    StreamProvider.autoDispose.family<User, int>((ref, id) {
  /// Because database provider isn't static,
  /// It provides a stream so it needs to be watched
  final db = ref.watch(dataBaseProvider);
  return db.getUserData(id);
});

class RvPodFamilyPage extends ConsumerWidget {
  const RvPodFamilyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final userStream = watch(userStreamProvider(12));
    return Scaffold(
      appBar: AppBar(
        title: const Text("Family Example"),
        centerTitle: true,
      ),
      body: Center(
        child: userStream.when(
          data: (user) => Text(user.toString()),
          loading: () => const CircularProgressIndicator(),
          error: (e, s) => Text(e.toString()),
        ),
      ),
    );
  }
}
