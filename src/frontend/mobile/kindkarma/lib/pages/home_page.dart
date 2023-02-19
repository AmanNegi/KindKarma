import 'package:flutter/material.dart';
import 'package:kindkarma/data/api.dart';
import 'package:kindkarma/globals.dart';
import 'package:kindkarma/pages/add_event.dart';
import 'package:kindkarma/pages/chat_page.dart';
import 'package:kindkarma/responsive.dart';
import 'package:kindkarma/widgets/AnimatedBackground.dart';
import 'package:kindkarma/widgets/action_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        child: Column(children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  accentColor,
                  darkColor,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            accountName: const Text("Aster"),
            accountEmail: const Text("asterjoules@gmail.com"),
          ),
          ListTile(
            dense: true,
            minLeadingWidth: 20,
            leading: const Icon(
              Icons.add,
              color: Colors.grey,
            ),
            title: const Text(
              "Add Volunteering Event",
              style: TextStyle(fontSize: 14),
            ),
            onTap: () {
              goToPage(context, const AddEventPage()).then((value) {
                setState(() {});
              });
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Divider(),
          ),
          ListTile(
            dense: true,
            minLeadingWidth: 20,
            leading: const Icon(
              Icons.chat_outlined,
              color: Colors.grey,
            ),
            title: const Text("Chats"),
            onTap: () {
              goToPage(context, const ChatPage());
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Divider(),
          ),
          ListTile(
            dense: true,
            minLeadingWidth: 20,
            leading: const Icon(
              Icons.person_outline,
              color: Colors.grey,
            ),
            title: const Text("Profile"),
            onTap: () {},
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Divider(),
          ),
          const Spacer(),
          Center(
            child: Text(
              "MHacks",
              style: TextStyle(
                color: accentColor,
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const Center(
            child: Text(
              "Made By Team: HackDevs",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 10),
        ]),
      ),
      body: Stack(
        children: [
          Positioned(
            right: Responsive.isMobile(context)
                ? -0.5 * getWidth(context)
                : 0.2 * getWidth(context),
            top: -0.2 * getHeight(context),
            child: AnimatedBackground(color: accentColor),
          ),
          Positioned(
            left: Responsive.isMobile(context) ? 0 : 0.2 * getWidth(context),
            right: Responsive.isMobile(context) ? 0 : 0.2 * getWidth(context),
            bottom: 0,
            top: 0,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 15.0, top: kToolbarHeight),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.menu,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            scaffoldKey.currentState!.openDrawer();
                          },
                        ),
                        const Text(
                          "Available Events",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 25,
                          ),
                        ),
                      ],
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
            runSpacing: 5.0,
            spacing: 5.0,
            children: [...item["organizers"]]
                .map((e) => Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 0.05 * getWidth(context),
                        vertical: 0.0075 * getHeight(context),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Text(
                        e,
                        style: TextStyle(color: accentColor),
                      ),
                    ))
                .toList(),
          ),
          const SizedBox(height: 20),
          ActionButton(
            isFilled: false,
            fillColor: Colors.white,
            text: "Chat",
            onPressed: () {
              goToPage(context, const ChatPage());
            },
          ),
        ],
      ),
    );
  }
}
