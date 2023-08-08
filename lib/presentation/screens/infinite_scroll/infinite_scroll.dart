import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const name = 'infinite_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imagesIds = [1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.removePadding(
          removeBottom: true,
          removeTop: true,
          context: context,
          child: ListView.builder(
              itemCount: imagesIds.length,
              itemBuilder: (context, index) => FadeInImage(
                  width: double.maxFinite,
                  height: 300,
                  fit: BoxFit.cover,
                  placeholder:
                      const AssetImage('assets/Images/jar-loading.gif'),
                  //${imagesIds[index]}
                  image: NetworkImage(
                      'https://picsum.photos/id/${imagesIds[index]}/200/300')))),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: const Icon(Icons.arrow_back_ios),
      ),
    );
  }
}
