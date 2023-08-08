import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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

class AppTutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  late final PageController pageViewController;
  bool endReached = false;

  @override
  void initState() {
    super.initState();
    pageViewController = PageController();
    pageViewController.addListener(() {
      final slidePage = pageViewController.page ?? 0;
      if (slidePage >= slides.length - 1.5) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tutorial'),
      ),
      body: Stack(children: [
        PageView(
          controller: pageViewController,
          children: [
            ...slides.map((slideX) => (_SlidePage(
                  slide: slideX,
                )))
          ],
        ),
        Positioned(
            right: 20,
            child: TextButton(
              onPressed: () => context.pop(),
              child: const Text(
                'Omitir',
                style: TextStyle(fontSize: 16),
              ),
            )),
        endReached
            ? Positioned(
                right: 20,
                bottom: 20,
                child: FilledButton(
                    onPressed: () {}, child: const Text('Ir a la App')))
            : const SizedBox(),
      ]),
    );
  }
}

class _SlidePage extends StatelessWidget {
  final Slide slide;
  const _SlidePage({required this.slide});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.all(10),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              slide.title,
              style: const TextStyle(fontSize: 35),
            ),
            Text(
              slide.caption,
              style: const TextStyle(fontSize: 15),
            ),
            Image(image: AssetImage(slide.img))
          ],
        ),
      ),
    );
  }
}
