import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StateRiverpod extends StatelessWidget {
  const StateRiverpod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _StateRiverpod();
  }
}

class _StateRiverpod extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(title: const Text("StateRiverPod")),
      body: Text("${counter.value}"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider).incrementCounter();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

final counterProvider = ChangeNotifierProvider(
  (_) => _Counter(),
);

class _Counter extends ValueNotifier<int> {
  _Counter() : super(0);

  void incrementCounter() {
    value++;
  }
}
