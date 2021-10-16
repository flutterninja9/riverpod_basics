import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_basics/cat_fact/presentation/providers/fact_provider.dart';

class CatFactUI extends StatelessWidget {
  const CatFactUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Random Cat Facts"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Consumer(
            builder: (context, watch, child) {
              return watch(factProvider).when(
                initial: () => const Text("Press the button below"),
                loaded: (fact) => Text(fact.fact),
                loading: () => const CircularProgressIndicator(),
                failure: (f) =>
                    f.map(server: (_) => Text("Server Failure Occured!")),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read(factProvider.notifier).getRandomCatFact();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
