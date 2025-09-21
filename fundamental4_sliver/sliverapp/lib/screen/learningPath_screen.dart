import 'package:flutter/material.dart';
import 'package:sliverapp/data/kelasOnline.dart';
import 'package:sliverapp/utils/sliver_header_delegate.dart';
import 'package:sliverapp/widget/listitem.dart';

class LearningpathScreen extends StatelessWidget {
  const LearningpathScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverAppBar.medium(title: Text("Learning Path Kelas")),
            header(context, "Flutter Dev"),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Listitem(data: multiplatformPath[index]),
                childCount: multiplatformPath.length,
              ),
            ),
            header(context, "Android FLutter Dev"),
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Listitem(data: androidPath[index]),
                childCount: androidPath.length,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            ),
            header(context, "ios Flutter Dev"),
            SliverList.builder(
              itemCount: iosPath.length,
              itemBuilder: 
                (context, index) => Listitem(data: iosPath[index]),
              ),
          ],
        ),
      ),
    );
  }

  SliverPersistentHeader header(BuildContext context, String teks) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverHeaderDelegate(
        maxHeight: 150,
        minHeight: 60,
        anak: Container(
          color: Theme.of(context).colorScheme.primary,
          child: Center(child: Text(teks)),
        ),
      ),
    );
  }
}
