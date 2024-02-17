import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

//expires
class financial_page extends StatefulWidget {
  const financial_page({super.key});

  @override
  State<financial_page> createState() => _financial_pageState();
}

class _financial_pageState extends State<financial_page> {
  final _openAI = OpenAI.instance.build(
      token: dotenv.env['chat_gpt_api'],
      baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 5)),
      enableLog: true);

  final ChatUser currUser = ChatUser(id: '1', firstName: 'fahmid');
  final ChatUser gptUser = ChatUser(id: '2', firstName: 'Intelligent AI');

  List<ChatMessage> all_messages = <ChatMessage>[];

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * (5.5 / 7),
        child: DashChat(
          currentUser: currUser, // who is currently sending the message
          onSend: (ChatMessage message_typed) {
            // when message 'm' is sent
            getChatResponse(message_typed);
          },
          messages: all_messages,
        ));
  }

  Future<void> getChatResponse(ChatMessage message_typed) async {
    setState(() {
      all_messages.insert(0, message_typed); // as recent at the bottom
    });

    List<Messages> messageHistory = all_messages.reversed.map((message_typed) {
      if (message_typed.user == currUser) {
        return Messages(
            role: Role.user,
            content:
                "now roleplay like a top class financial advisor and give me financial tips don't reply any query other than the financial question " +
                    message_typed.text);
      } else {
        return Messages(role: Role.assistant, content: message_typed.text);
      }
    }).toList();

    final req = ChatCompleteText(
      model: GptTurbo0301ChatModel(),
      messages: messageHistory,
      maxToken: 100,
    );
    final response = await _openAI.onChatCompletion(request: req);

    for (var element in response!.choices) {
      if (element.message != null) {
        print(element.message!.content);
        setState(() {
          all_messages.insert(
            0,
            ChatMessage(
                user: gptUser,
                createdAt: DateTime.now(),
                text: element.message!.content),
          );
        });
      }
    }
  }
}
