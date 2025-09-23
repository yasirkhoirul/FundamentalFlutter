import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tourism_app/api/data/apiservice.dart';
import 'package:tourism_app/api/model/tourism.dart';
import 'package:tourism_app/screen/home/tourism_card_widget.dart';
import 'package:tourism_app/static/navigation_route.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<Tourismlist> dataapi;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataapi = Apiservice().getResponseTourism();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("${dataapi}"),
      ),
      body: FutureBuilder(
        future: dataapi,
        builder: (context, snapshot) {
          log("masuk future");
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Text("${snapshot.error}");
              } else {
                List data = snapshot.data!.place;
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final Tourism tourism = data[index];

                    return TourismCard(
                      tourism: tourism,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          NavigationRoute.detailRoute.name,
                          arguments: tourism.id,
                        );
                      },
                    );
                  },
                );
              }

            default :
              return const SizedBox(
                child: Text("tidak ada hasil"),
              );
          }
        },
      ),
    );
  }
}
