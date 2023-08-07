import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons_screen';
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons screen'),
        leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: _ButtonsView(),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.access_alarm_outlined),
                label: const Text('Elevated button')),
            FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.sailing_outlined),
                label: const Text('Filled button')),
            OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.assignment),
                label: const Text('Outlined button')),
            TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.assignment),
                label: const Text('Text button')),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.watch_off),
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.deepPurple),
                iconColor: MaterialStatePropertyAll(Colors.white),
              ),
            ),
            _CustomButton()
          ],
        ),
      ),
    );
  }
}

class _CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: () {},
          splashColor: Colors.red,
          child: const Padding(
            padding: EdgeInsets.all(10),
            child: Text('Custom button'),
          ),
        ));
  }
}
