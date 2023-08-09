import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const name = 'infinite_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  final ScrollController scrollController = ScrollController();
  bool loadingImages = false;
  bool isMounted = true;

  List<int> imagesIds = [1, 2, 3, 4, 5];

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels + 600 >=
          scrollController.position.maxScrollExtent) {
        loadImages();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  Future loadImages() async {
    if (!loadingImages) {
      loadingImages = true;
      //setState(() {});
      await Future.delayed(const Duration(seconds: 2));
      addImages();
      loadingImages = false;
      setState(() {});
      if (isMounted) {
        setState(() {});
      }
    }
  }

  void addImages() {
    final lastId = imagesIds.last;
    imagesIds.addAll([1, 2, 3, 4, 5].map((id) => lastId + id));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.removePadding(
          removeBottom: true,
          removeTop: true,
          context: context,
          child: ListView.builder(
              controller: scrollController,
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
