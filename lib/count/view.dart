import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider.dart';

class CountPage extends StatelessWidget {
  const CountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => CountProvider(),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    // context.read<T>() :直接返回T，而不去監聽它的變化
    final provider = context.read<CountProvider>();

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("Provider demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${provider.count}',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              // context.watch<T>() :讓 widget 去監聽共享資料 T 的變化
              '${context.watch<CountProvider>().count}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => provider.increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
