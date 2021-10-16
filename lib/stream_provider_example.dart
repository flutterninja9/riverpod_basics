import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tStreamProvider = StreamProvider<String>(
  (ref) {
    return Stream.fromFuture(
      Future.delayed(
        const Duration(seconds: 2),
        () {
          return "Ninja Pasta!";
        },
      ),
    );
  },
);

class StreamProviderPage extends ConsumerWidget {
  const StreamProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Future Provider"),
        centerTitle: true,
      ),
      body: Center(
        child: watch(tStreamProvider).when(
          data: (value) => Text(value),
          loading: () => const CircularProgressIndicator(),
          error: (e, s) => Text(e.toString()),
        ),
      ),
    );
  }
}
