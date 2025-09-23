import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logger/web.dart';
import 'package:tourism_app/api/data/apiservice.dart';
import 'package:tourism_app/api/model/tourism.dart';
import 'package:provider/provider.dart';
import 'package:tourism_app/provider/detail/bookmark_provider.dart';

class DetailScreen extends StatefulWidget {
  final int idtourism;

  const DetailScreen({
    super.key,
    required this.idtourism,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<Detialtourism> dataapi;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataapi = Apiservice().getDetailTOurism(widget.idtourism);
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tourism Detail"),
      ),
      body: FutureBuilder(
          future: dataapi,
          builder: (context, snapshot) {
            return switch (snapshot.connectionState) {
            
              ConnectionState.waiting => const Center(child: CircularProgressIndicator()),
              ConnectionState.done => () {
                  if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  } else {
                    
                    final place = snapshot.data!.place;
                    return SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Image.network(
                              place.image,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        place.name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineLarge,
                                      ),
                                      Text(
                                        place.address,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge
                                            ?.copyWith(
                                                fontWeight: FontWeight.w400),
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
                                      place.like.toString(),
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    ChangeNotifierProvider(
                                      create: (context) =>
                                          BookmarkIconprovider(),
                                      child: Bookmarkwidget(
                                        bookmarkturis: place,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox.square(dimension: 16),
                            Text(
                              place.description,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                }(),
              _ => const SizedBox(),
            };
          }),
    );
  }
}

class Bookmarkwidget extends StatefulWidget {
  final Tourism bookmarkturis;
  const Bookmarkwidget({super.key, required this.bookmarkturis});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Bookmarkwidget();
  }
}

class _Bookmarkwidget extends State<Bookmarkwidget> {
  @override
  void initState() {
    // TODO: implement initState
    final bookmarklist = context.read<BookmarkProvider>();
    final bookmarkicons = context.read<BookmarkIconprovider>();

    // memanfaatkan Future.microtask untuk menjalankan aksi mengubah state di
    // Provider atau yang berhubungan dengan proses asinkron.
    // Method microtask ini akan segera dijalankan setelah proses sinkron dieksekusi. Hal ini dapat
    // menjaga jalannya kode sinkron dan menghindari potensi terjadinya error saat ada proses asinkron.
    Future.microtask(
      () {
        final tourismlist =
            bookmarklist.checkBookmark(widget.bookmarkturis); //melakukan check
        bookmarkicons.setisbookmarked =
            tourismlist; //mengisi state icon dengan hasil diatas
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return IconButton(
      onPressed: () {
        final bookmarklistprovider = context.read<BookmarkProvider>();
        final bookmarkiconprovider = context.read<BookmarkIconprovider>();
        final isbookamrk = bookmarkiconprovider.isbookmarked;
        if (isbookamrk) {
          bookmarklistprovider.removebookmark(widget.bookmarkturis);
        } else {
          bookmarklistprovider.addbookmark(widget.bookmarkturis);
        }
        bookmarkiconprovider.setisbookmarked = !isbookamrk;
      },
      icon: Icon(context.watch<BookmarkIconprovider>().isbookmarked
          ? Icons.bookmark
          : Icons.bookmark_outline),
    );
  }
}

class BookmarkIconprovider extends ChangeNotifier {
  bool _isbookmarked = false;

  bool get isbookmarked => _isbookmarked;

  set setisbookmarked(bool data) {
    _isbookmarked = data;
    notifyListeners();
  }
}
