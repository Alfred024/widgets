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

  void openDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Alert dialog'),
              content: const Text(
                  'Este es un método de flutter que despliega un Widget que notifica algo. '),
              actions: [
                TextButton(onPressed: () {}, child: const Text('Salir')),
                FilledButton(onPressed: () {}, child: const Text('Aceptar'))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbar'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
                onPressed: () {
                  showAboutDialog(
                      context: context,
                      applicationName: 'Show about dialog',
                      children: [
                        const Text(
                            'Displays an [AboutDialog], which describes the application and provides a button to show licenses for software used by the application.')
                      ]);
                },
                child: const Text('Show licenses')),
            FilledButton.tonal(
                onPressed: () => openDialog(context),
                child: const Text('Alert dialog')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Show snackbar'),
        icon: const Icon(Icons.select_all),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
