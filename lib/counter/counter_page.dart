import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final countProvider = StateProvider<int>((ref) => 0, name: 'counter');

class CounterPage extends ConsumerWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return ProviderListener(
      provider: countProvider,
      onChange: (context, StateController<int> provider) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Value changed to ${provider.state.toString()}"),
            duration: const Duration(milliseconds: 200),
          ),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Counter App"),
          centerTitle: true,
        ),
        body: Center(
          child: Text(
            watch(countProvider).state.toString(),
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read(countProvider).state++;
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class ClockNotifier extends StateNotifier<DateTime> {
  ClockNotifier() : super(DateTime.now()) {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      state = DateTime.now();
    });
  }

  late final Timer _timer;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

final clockProvider = StateNotifierProvider<ClockNotifier, DateTime>((ref) {
  return ClockNotifier();
});

class ClockPage extends ConsumerWidget {
  ClockPage({Key? key}) : super(key: key);

  String _getParsedDatTime(DateTime dateTime) {
    return DateFormat.Hms().format(dateTime);
  }

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final value = watch(clockProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Clock App"),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          _getParsedDatTime(value),
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
