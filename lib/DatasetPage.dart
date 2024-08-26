import 'package:flutter/material.dart';

class DatasetPage extends StatelessWidget {
  const DatasetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dataset Page'),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: const Text(
          'This is the Dataset Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
