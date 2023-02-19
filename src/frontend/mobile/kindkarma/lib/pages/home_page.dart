import 'package:flutter/material.dart';
import 'package:kindkarma/data/api.dart';
import 'package:kindkarma/globals.dart';
import 'package:kindkarma/widgets/AnimatedBackground.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            right: -0.5 * getWidth(context),
            top: -0.2 * getHeight(context),
            child: AnimatedBackground(color: accentColor),
          ),
          Positioned.fill(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                        left: 15.0, right: 15.0, top: kToolbarHeight),
                    child: Text(
                      "Available Events",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  FutureBuilder(
                    future: getAllEvents(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data != null) {
                          if (snapshot.data!.isNotEmpty) {
                            List data = snapshot.data ?? [];
                            return ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.all(15.0),
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                var item = data[index];
                                return __getItem(context, item);
                              },
                            );
                          } else {
                            return const Center(
                                child: Text("No data available"));
                          }
                        }
                      }

                      if (snapshot.hasError) {
                        return Center(
                            child: Text("Error Occured ${snapshot.error}"));
                      }

                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container __getItem(BuildContext context, item) {
    print(item);
    return Container(
      margin: const EdgeInsets.only(bottom: 15.0),
      // height: 0.2 * getHeight(context),
      decoration: BoxDecoration(
          color: accentColor,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 11.0,
              spreadRadius: 2.0,
            ),
          ]),
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item['name'],
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 20,
            ),
          ),
          Text(
            item['description'],
            style: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontWeight: FontWeight.w800,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8.0),
          const Text(
            "Organized By",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 5.0),
          Wrap(
            spacing: 5.0,
            children: [...item["organizers"]]
                .map((e) => Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 0.05 * getWidth(context),
                        vertical: 0.0075 * getHeight(context),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Text(
                        e,
                        style: TextStyle(color: accentColor),
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
