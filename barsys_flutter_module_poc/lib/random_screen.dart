import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RandomScreen extends StatelessWidget {
  const RandomScreen({
    required this.data,
    super.key,
  });

  final int data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => SystemNavigator.pop(),
        ),
        title: const Text('Random'),
      ),
      body: Center(
        child: ListView(
          children: [
            ...List.generate(
              data,
              (index) => Text('index: $index'),
            ),
          ],
        ),
      ),
    );
  }
}
