import 'package:flutter/foundation.dart';
import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';

Future<void> main() async {
  final username =
      (await Telegram('5634428377:AAHtZc4wLjLDBxF_ncBs7NapjD-fkerBFTU')
              .getMe()
              .catchError((e) {
    if (kDebugMode) {
      print(e);
    }
  }))
          .username;
  if (kDebugMode) {
    print(username);
  }
  var teledart = TeleDart(
      '5634428377:AAHtZc4wLjLDBxF_ncBs7NapjD-fkerBFTU', Event(username!));
  if (kDebugMode) {
    print(teledart);
  }

  teledart.start();

  teledart
      .onMessage(entityType: 'bot_command', keyword: 'start')
      .listen((message) => teledart.sendMessage(message.chat.id, 'I am Usama'));
  teledart
      .onMessage(entityType: 'bot_command', keyword: 'javed')
      .listen((message) {
    teledart.sendMessage(message.chat.id, 'Talking about Javed Rafique');
    if (kDebugMode) {
      print(message.text.toString());
    }
  });

  teledart
      .onMessage(entityType: 'bot_command', keyword: 'info')
      .listen((message) {
    teledart.sendMessage(message.chat.id, 'I am usama from Dejure.');
    if (kDebugMode) {
      print(message.text.toString());
    }
  });

  teledart.onCommand('USDTBTC').listen((message) {
    message.reply('hello');
  });

  teledart.onMessage().listen((message) {
    teledart.sendMessage(message.chat.id, "hi Usama");
    if (kDebugMode) {
      print(message.text);
    }
  });
  teledart.onBold().listen((event) {
    if (kDebugMode) {
      print(event.text);
    }
  });
}
