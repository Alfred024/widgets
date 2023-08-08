import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, plane, boat, subarine }

class _UiControlsViewState extends State<_UiControlsView> {
  bool switchState = false;
  Transportation selectedTransport = Transportation.car;

  bool optionCheckbox = false;
  bool optionCheckbox2 = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      //physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
            title: const Text('SwitchTile widget'),
            subtitle: const Text(
                'The switch tile itself does not maintain any state. Instead, when the state of the switch changes, the widget calls the [onChanged] callback.'),
            value: switchState,
            onChanged: (value) => setState(() {
                  switchState = !switchState;
                })),
        ExpansionTile(
          title: const Text('Expansion Tile Widget'),
          children: [
            RadioListTile(
                title: const Text('By car'),
                subtitle: const Text('This is the subtitle property'),
                value: Transportation.car,
                groupValue: selectedTransport,
                onChanged: ((value) => setState(() {
                      selectedTransport = Transportation.car;
                    }))),
            RadioListTile(
                title: const Text('By plane'),
                subtitle: const Text('This is the subtitle property'),
                value: Transportation.plane,
                groupValue: selectedTransport,
                onChanged: ((value) => setState(() {
                      selectedTransport = Transportation.plane;
                    }))),
            RadioListTile(
                title: const Text('By subarine'),
                subtitle: const Text('This is the subtitle property'),
                value: Transportation.subarine,
                groupValue: selectedTransport,
                onChanged: ((value) => setState(() {
                      selectedTransport = Transportation.subarine;
                    }))),
            RadioListTile(
                title: const Text('By boat'),
                subtitle: const Text('This is the subtitle property'),
                value: Transportation.boat,
                groupValue: selectedTransport,
                onChanged: ((value) => setState(() {
                      selectedTransport = Transportation.boat;
                    }))),
            CheckboxListTile(
                title: const Text('Checkbox 1'),
                subtitle: const Text('Checkbox Widget'),
                value: optionCheckbox,
                onChanged: ((value) => setState(() {
                      optionCheckbox = !optionCheckbox;
                    }))),
            CheckboxListTile(
                title: const Text('Checkbox 2'),
                subtitle: const Text('Checkbox Widget'),
                value: optionCheckbox2,
                onChanged: ((value) => setState(() {
                      optionCheckbox2 = !optionCheckbox2;
                    }))),
          ],
        ),
      ],
    );
  }
}
