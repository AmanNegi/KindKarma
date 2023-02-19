import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kindkarma/data/api.dart';
import 'package:kindkarma/pages/auth.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

void main() {
    final wsUrl = Uri.parse('ws://$BASE_URL');
  var channel = WebSocketChannel.connect(wsUrl);

  channel.stream.listen((message) {
    channel.sink.add('Received Message! $message');
    // channel.sink.close(status.goingAway);
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KindKarma',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      home: const AuthPage(),
      // home: const HomePage(),
    );
  }
}
