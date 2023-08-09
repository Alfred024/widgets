import 'package:animate_do/animate_do.dart';
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
  bool loadingWidgets = false;
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
    if (!loadingWidgets) {
      loadingWidgets = true;
      //Este set state especificamente permite ejecutar el ícono que muestra carga de imágenes.
      setState(() {});
      await Future.delayed(const Duration(seconds: 2));
      addImages();
      loadingWidgets = false;
      setState(() {});
      if (isMounted) {
        setState(() {});
      }
    }
  }

  Future refreshImages() async {
    if (isMounted) {
      Future.delayed(const Duration(seconds: 1));
      int currentId = imagesIds.last;
      loadingWidgets = true;
      imagesIds.clear();
      imagesIds.add(currentId + 1);
      addImages();
      loadingWidgets = false;
      setState(() {});
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
            child: RefreshIndicator(
              onRefresh: refreshImages,
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
                          'https://picsum.photos/id/${imagesIds[index]}/200/300'))),
            )),
        floatingActionButton: loadingWidgets
            ? SpinPerfect(
                infinite: true, child: const Icon(Icons.refresh_rounded))
            : FloatingActionButton(
                onPressed: () => context.pop(),
                child: const Icon(Icons.arrow_back_ios),
              ));
  }
}
