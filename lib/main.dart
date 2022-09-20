import 'dart:io' show Platform;

import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';
import 'package:teledart/model.dart';

Future<void> main() async {
  final envVars = Platform.environment;
  final username =
      (await Telegram('5634428377:AAHtZc4wLjLDBxF_ncBs7NapjD-fkerBFTU')
              .getMe()
              .catchError((e) {
    print(e);
  }))
          .username;
  print(username);
  var teledart = TeleDart(
      '5634428377:AAHtZc4wLjLDBxF_ncBs7NapjD-fkerBFTU', Event(username!));
  print(teledart);
  // In case you decided to use webhook.
  // var webhook = await Webhook.createHttpsWebhok(
  //     Telegram(envVars['BOT_TOKEN']!),
  //     envVars['HOST_URL']!,
  //     envVars['BOT_TOKEN']!,
  //     io.File(envVars['CERT_PATH']!),
  //     io.File(envVars['KEY_PATH']!),
  //     port: int.parse(envVars['BOT_PORT']!));
  // var teledart = TeleDart(envVars['BOT_TOKEN']!, Event(username!), fetcher: webhook);

  teledart.start();
  print(teledart.getChat(5433092010).then((value) => print(value.toString())));
  print(teledart.getChatMemberCount(5433092010).then((value) => print(value)));
  // You can listen to messages like this
  teledart
      .onMessage(entityType: 'bot_command', keyword: 'start')
      .listen((message) => teledart.sendMessage(message.chat.id, 'I am Usama'));
  teledart
      .onMessage(entityType: 'bot_command', keyword: 'javed')
      .listen((message) {
    teledart.sendMessage(message.chat.id, 'Talking about Javed Rafique');
    print(message.text.toString());
  });

  teledart
      .onMessage(entityType: 'bot_command', keyword: 'info')
      .listen((message) {
    teledart.sendMessage(message.chat.id, 'I am usama from Dejure.');
    print(message.text.toString());
  });

  // Sick of boilerplates? Reply messages like below, nice and tidy
  // Short hands also available for answer query methods
  teledart.onCommand('USDTBTC').listen((message) {
    message.reply('Do you want to convert USDT to BITCOIN?');
    print(message.text.toString());
  });

  // You can also utilise regular expressions
  // teledart
  //     .onCommand(RegExp('hello', caseSensitive: false))
  //     .listen((message) => message.reply('hi!'));

  // You can even filter streams with stream processing methods
  // See: https://www.dartlang.org/tutorials/language/streams#methods-that-modify-a-stream
  // teledart
  //     .onMessage(keyword: 'dart')
  //     .where((message) => message.text?.contains('telegram') ?? false)
  //     .listen((message) => message.replyPhoto(
  //  io.File('example/dash_paper_plane.png'),
  // 'https://raw.githubusercontent.com/DinoLeung/TeleDart/master/example/dash_paper_plane.png',
  // caption: 'This is how Dash found the paper plane'));

  // Inline mode.
  // teledart.onInlineQuery().listen((inlineQuery) => inlineQuery.answer([
  //       InlineQueryResultArticle(
  //           id: 'ping',
  //           title: 'ping',
  //           input_message_content: InputTextMessageContent(
  //               message_text: '*pong*', parse_mode: 'MarkdownV2')),
  //       InlineQueryResultArticle(
  //           id: 'ding',
  //           title: 'ding',
  //           input_message_content: InputTextMessageContent(
  //               message_text: '*_dong_*', parse_mode: 'MarkdownV2')),
  //     ]));
}
