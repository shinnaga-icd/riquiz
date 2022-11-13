import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screen/state_stateful.dart';
import 'screen/state_provide.dart';
import 'screen/state_riverpod.dart';

void main() {
  const app = MaterialApp(
    home: Root(),
  );

  //
  const scope = ProviderScope(
    child: app,
  );
  runApp(scope);
}

final indexProvider = StateProvider((ref) {
  return 0;
});

// プロバイダー
class Root extends ConsumerWidget {
  const Root({KConsumerWidget});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(indexProvider);

    // BottomNavigationBarの中身
    const items = [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "test"),
      BottomNavigationBarItem(
          icon: Icon(Icons.account_box_outlined), label: "test"),
      BottomNavigationBarItem(icon: Icon(Icons.subject), label: "test"),
    ];

    // BottomNavigationBarを実装
    final bar = BottomNavigationBar(
      items: items,
      currentIndex: index,
      onTap: (index) {
        ref.read(indexProvider.notifier).state = index;
      },
    );

    // body部に表示するコンテンツ
    final pages = [
      StateStateful(),
      StateProvide(),
      StateRiverpod(),
    ];

    return Scaffold(
      body: pages[index],
      bottomNavigationBar: bar,
    );
  }
}
