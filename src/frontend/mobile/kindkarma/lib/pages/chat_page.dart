import 'package:flutter/material.dart';
import 'package:kindkarma/globals.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Group Chat"),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 60,
            left: 0,
            right: 0,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              reverse: true,
              children: [
                const SizedBox(height: 20),
                _getReceivedMessageWidget(
                    "Yes, you will receive an acknowledgement certificate"),
                _getSelfMessageWidget(
                    "Okay, will we be getting an acknowledgement certificate regarding this."),
                _getReceivedMessageWidget(
                    "Sure, It will be organized in the 1st Week of May"),
                _getSelfMessageWidget(
                    "Hello, can you share the data regarding the volunteering event "),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 5.0,
                    spreadRadius: 3.0,
                    offset: const Offset(0.0, -5.0),
                  )
                ],
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        onTap: () async {},
                        cursorRadius: const Radius.circular(20.0),
                        decoration: const InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.only(
                              left: 10.0, right: 10.0, bottom: 5.0),
                          hintText: "Type your message.",
                          alignLabelWithHint: true,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    tooltip: 'Send',
                    icon: Icon(
                      Icons.send,
                      color: accentColor,
                    ),
                    onPressed: () async {},
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _getSelfMessageWidget(String message) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              constraints: BoxConstraints(maxWidth: getWidth(context) * 0.7),
              padding: const EdgeInsets.only(
                top: 15.0,
                left: 15.0,
                right: 10.0,
                bottom: 5.0,
              ),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  color: accentColor,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 2.0,
                        color: Colors.black.withOpacity(0.05),
                        offset: const Offset(0.0, 0.0),
                        spreadRadius: 1.0)
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(message, style: const TextStyle(color: Colors.white)),
                  const SizedBox(
                    height: 5.0,
                  ),
                  const Text("Just now",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w500)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _getReceivedMessageWidget(String message) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 5.0,
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            constraints: BoxConstraints(maxWidth: getWidth(context) * 0.7),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(20.0),
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                color: Theme.of(context).scaffoldBackgroundColor,
                border: Border.all(
                  color: accentColor,
                )),
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Container(
                padding: const EdgeInsets.only(
                  top: 15.0,
                  left: 10.0,
                  right: 15.0,
                  bottom: 5.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(message),
                    const SizedBox(
                      height: 5.0,
                    ),
                    const Text(
                      "A few moments ago",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
