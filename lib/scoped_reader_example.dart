import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _currentIndex = ScopedProvider<int>((ref) {
  throw UnimplementedError();
});

class ScopedProviderPage extends ConsumerWidget {
  const ScopedProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ScopedProvider"),
        centerTitle: true,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return ProviderScope(
              overrides: [_currentIndex.overrideWithValue(index)],
              child: const ListElement(),
            );
          },
        ),
      ),
    );
  }
}

class ListElement extends ConsumerWidget {
  const ListElement({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return ListTile(
      leading: const Icon(Icons.format_list_numbered),
      title: Text(watch(_currentIndex).toString()),
    );
  }
}
