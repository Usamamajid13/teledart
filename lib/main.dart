import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';
import 'package:teledart_example1/constants.dart';
import 'home_screen.dart';

Future<void> main() async {
  runApp(const MyApp());
  final username =
      (await Telegram('5634428377:AAHtZc4wLjLDBxF_ncBs7NapjD-fkerBFTU').getMe())
          .username;

  var teledart = TeleDart(
      '5634428377:AAHtZc4wLjLDBxF_ncBs7NapjD-fkerBFTU', Event(username!));

  teledart.start();
  teledart.onChannelPost().listen((event) {
    message = event.text;
  });
  teledart
      .onMessage(entityType: 'bot_command', keyword: 'start')
      .listen((messages) => message = messages.text.toString());
  teledart
      .onMessage(entityType: 'bot_command', keyword: 'javed')
      .listen((messages) {
    message = messages.text.toString();
  });

  teledart
      .onMessage(entityType: 'bot_command', keyword: 'info')
      .listen((messages) {
    message = messages.text.toString();
  });

  teledart.onCommand('USDTBTC').listen((messages) {
    message = messages.text.toString();
  });

  teledart.onMessage().listen((messages) {
    message = messages.text.toString();
  });
  teledart.onBold().listen((event) {
    message = event.text;
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: HomeScreen(),
    );
  }
}
