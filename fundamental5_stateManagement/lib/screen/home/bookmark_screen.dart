import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism_app/provider/detail/bookmark_provider.dart';
import 'package:tourism_app/screen/home/tourism_card_widget.dart';
import 'package:tourism_app/static/navigation_route.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bookmark List"),
      ),
      body: Consumer<BookmarkProvider>(builder: (context, value, child) {
        final bookmarklist = value.bookmark;
        return switch (bookmarklist.isEmpty) {
          true => const Center(
              child: Text("no bookmark"),
            ),
          _ => ListView.builder(
              itemBuilder: (context, index) => TourismCard(
                tourism: bookmarklist[index],
                onTap: () => Navigator.pushNamed(
                    context, NavigationRoute.detailRoute.name,
                    arguments: bookmarklist[index]),
              ),
              itemCount: bookmarklist.length,
            )
        };
      }),
    );
  }
}
