import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const cards = <Map<String, dynamic>>[
  {'elevation': 0.0, 'label': 'Elevation 0'},
  {'elevation': 1.0, 'label': 'Elevation 1'},
  {'elevation': 2.0, 'label': 'Elevation 2'},
  {'elevation': 3.0, 'label': 'Elevation 3'},
  {'elevation': 4.0, 'label': 'Elevation 4'},
  {'elevation': 5.0, 'label': 'Elevation 5'},
];

class CardsScreen extends StatelessWidget {
  static const String name = 'cards_screen';
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards screen'),
        leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: const _CardsView(),
    );
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        ...cards.map((card) => _CardType1(
              label: card['label'],
              elevation: card['elevation'],
            )),
        ...cards.map((card) => _CardType2(
              label: card['label'],
              elevation: card['elevation'],
            )),
        ...cards.map((card) => _CardType3(
              label: card['label'],
              elevation: card['elevation'],
            )),
        const SizedBox(
          height: 50,
        ),
      ],
    ));
  }
}

class _CardType1 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType1({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            //Align(),
            SizedBox(
              //width: double.maxFinite,
              child: Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_vert_outlined,
                        color: Colors.deepPurpleAccent,
                      ))),
            ),
            SizedBox(
              //width: double.maxFinite,
              child: Align(alignment: Alignment.bottomLeft, child: Text(label)),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardType2 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType2({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape:
          const RoundedRectangleBorder(side: BorderSide(color: Colors.black38)),
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            //Align(),
            SizedBox(
              //width: double.maxFinite,
              child: Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_vert_outlined,
                        color: Colors.deepPurpleAccent,
                      ))),
            ),
            SizedBox(
              //width: double.maxFinite,
              child: Align(alignment: Alignment.bottomLeft, child: Text(label)),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardType3 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType3({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      color: Theme.of(context).colorScheme.background,
      elevation: elevation,
      child: Stack(
        children: [
          //Align(),
          Image.network(
            'https://picsum.photos/id/1/600/250',
            height: 300,
            fit: BoxFit.cover,
          ),
          SizedBox(
            //width: double.maxFinite,
            child: Align(
                alignment: Alignment.topRight,
                child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(20))),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.more_vert_outlined,
                          color: Colors.deepPurpleAccent,
                        )))),
          ),
        ],
      ),
    );
  }
}
