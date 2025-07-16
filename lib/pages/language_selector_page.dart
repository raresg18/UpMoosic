import 'package:flutter/material.dart';

class LanguageSelectorPage extends StatelessWidget {
  const LanguageSelectorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Selectează Limba')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                print('Română selectată');
              },
              child: const Text('Română'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print('English selected');
              },
              child: const Text('English'),
            ),
          ],
        ),
      ),
    );
  }
}
