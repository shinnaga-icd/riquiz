import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StateProvide extends StatelessWidget {
  const StateProvide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // WidgetをChangeNotifierProviderで囲む
    return ChangeNotifierProvider(
      create: (_) => CounterViewModel(), // 状態
      child: _StateProvider(), // Widget
    );
  }
}

// 普通にWidgetを作成、状態はcontext.watchから取得
class _StateProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CounterViewModel>();
    return Scaffold(
      appBar: AppBar(title: const Text("Provider")),
      // valueが取れない
      body: Text('${viewModel.value}'),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CounterViewModel>().incrementCounter();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

// ValueNotifierで単一変数の状態を管理
class CounterViewModel extends ValueNotifier<int> {
  CounterViewModel() : super(0);

  void incrementCounter() {
    value++;
  }
}
