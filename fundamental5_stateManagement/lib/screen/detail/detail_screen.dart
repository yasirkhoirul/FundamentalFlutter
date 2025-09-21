import 'package:flutter/material.dart';
import 'package:tourism_app/model/tourism.dart';

class DetailScreen extends StatelessWidget {
  final Tourism tourism;

  const DetailScreen({
    super.key,
    required this.tourism,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tourism Detail"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.network(
                tourism.image,
                fit: BoxFit.cover,
              ),
              const SizedBox.square(dimension: 16),
              // todo-09: change the text style
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tourism.name,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        Text(
                          tourism.address,
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.favorite,
                        color: Colors.pink,
                      ),
                      const SizedBox.square(dimension: 4),
                      Text(
                        tourism.like.toString(),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Bookmarkwidget(bookmarkturis: tourism,)
                    ],
                  ),
                ],
              ),
              const SizedBox.square(dimension: 16),
              Text(
                tourism.description,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Bookmarkwidget extends StatefulWidget {
  final Tourism bookmarkturis;
  const Bookmarkwidget({super.key,required this.bookmarkturis});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Bookmarkwidget();
  }
}

class _Bookmarkwidget extends State<Bookmarkwidget> {
  late bool iscklicked;
  @override
  void initState() {
    // TODO: implement initState
    final bookmarkinlist = bookmark.where((element)=> element.id == widget.bookmarkturis.id );
    if(bookmarkinlist.isEmpty){
      iscklicked =  false;
    }else{
      iscklicked = true;
    }

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return IconButton(
        onPressed: () {
          setState(() {
            if(iscklicked){
              bookmark.removeWhere((element) => element.id == widget.bookmarkturis.id,);
            }else{
              bookmark.add(widget.bookmarkturis);
            }
            iscklicked = !iscklicked;
          });
        },
        icon: iscklicked
            ? const Icon(Icons.bookmark)
            : const Icon(Icons.bookmark_outline));
  }
}
