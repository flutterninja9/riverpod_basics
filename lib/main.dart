import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_basics/providers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Logger extends ProviderObserver {
  @override
  void didUpdateProvider(ProviderBase provider, Object? newValue) {
    if (newValue is StateController<int>) {
      print("${provider.name},${provider.runtimeType} | ${newValue.state}");
    }
    super.didUpdateProvider(provider, newValue);
  }
}

final sharedPrefrenceProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final _sharedPref = await SharedPreferences.getInstance();
  runApp(
    ProviderScope(
      observers: [
        Logger(),
      ],
      overrides: [
        sharedPrefrenceProvider.overrideWithValue(_sharedPref),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Riverpod Basics"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListTile(
              leading: const Icon(Icons.person),
              title: Consumer(
                builder: (context, watch, child) {
                  return Consumer(
                    builder: (context, watch, child) {
                      return watch(userProvider).when(
                        data: (name) => Text(name),
                        loading: () => const LinearProgressIndicator(),
                        error: (e, s) => Text(e.toString()),
                      );
                    },
                  );
                },
              ),
            ),
            ListTile(
              leading: const Icon(Icons.timer),
              title: Consumer(
                builder: (context, watch, child) {
                  return Text(
                    "Counter state",
                  );
                },
              ),
              trailing: Consumer(
                builder: (context, watch, child) {
                  return Text(
                    watch(counterController).toString(),
                  );
                },
              ),
            ),
            ListTile(
              leading: const Icon(Icons.timer_3),
              title: Consumer(
                builder: (context, watch, child) {
                  return Text(
                    "Async Counter state",
                  );
                },
              ),
              trailing: Consumer(
                builder: (context, watch, child) {
                  return watch(counterAsyncController).when(
                    data: (count) => Text(count.toString()),
                    loading: () => const MiniLoader(),
                    error: (e, s) => Text(e.toString()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            heroTag: 'add',
            onPressed: () {
              context.read(counterController.notifier).add();
              context.read(counterAsyncController.notifier).add();
            },
            child: const Icon(Icons.add),
          ),
          SizedBox(width: 22),
          FloatingActionButton(
            heroTag: 'add',
            onPressed: () {
              context.read(counterController.notifier).subtract();
              context.read(counterAsyncController.notifier).subtract();
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

class MiniLoader extends StatelessWidget {
  const MiniLoader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 15, width: 15, child: const LinearProgressIndicator());
  }
}
