import 'package:flutter/material.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final customSnackBar = SnackBar(
      content: const Text('Snackbor cutomized'),
      duration: const Duration(seconds: 1),
      action: SnackBarAction(label: 'ACTION', onPressed: () {}),
    );
    ScaffoldMessenger.of(context).showSnackBar(customSnackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbar'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Show snackbar'),
        icon: const Icon(Icons.select_all),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
