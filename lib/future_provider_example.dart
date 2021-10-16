import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tFutureProvider = FutureProvider<String>((ref) {
  return Future.delayed(const Duration(seconds: 2), () {
    return "Ninja Pasta!";
  });
});

final covidDataProvider = FutureProvider<String>((ref) async {
  final cancelToken = CancelToken();
  ref.onDispose(() => cancelToken.cancel());
  final _dioResponse = await Dio().get(
    "https://api.covidtracking.com/v1/us/current.json",
    cancelToken: cancelToken,
  );
  return _dioResponse.toString();
});

class FutureProviderPage extends ConsumerWidget {
  const FutureProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Future Provider"),
        centerTitle: true,
      ),
      body: Center(
        child: watch(covidDataProvider).when(
          data: (value) => Text(value),
          loading: () => const CircularProgressIndicator(),
          error: (e, s) => Text(e.toString()),
        ),
      ),
    );
  }
}
