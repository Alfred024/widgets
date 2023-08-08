import 'package:flutter/material.dart';

class Slide {
  final String title;
  final String caption;
  final String img;

  Slide({required this.title, required this.caption, required this.img});
}

final slides = <Slide>[
  Slide(
      title: 'Paso 1',
      caption: 'Este es el paso 1 del tutorial de la app',
      img: 'assets/Images/1.png'),
  Slide(
      title: 'Paso 2',
      caption: 'Después sigue el paso 2',
      img: 'assets/Images/2.png'),
  Slide(
      title: 'Paso 3',
      caption: 'Por último terminamso el tutorial en el paso 3',
      img: 'assets/Images/3.png'),
];

class AppTutorialScreen extends StatelessWidget {
  static const name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tutorial'),
      ),
      body: PageView(
        children: [
          ...slides.map((slideX) => (_SlidePage(
                slide: slideX,
              )))
        ],
      ),
    );
  }
}

class _SlidePage extends StatelessWidget {
  final Slide slide;
  const _SlidePage({super.key, required this.slide});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.all(10),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(slide.title),
            Text(slide.caption),
            Image(image: AssetImage(slide.img))
          ],
        ),
      ),
    );
  }
}
