// mail_content.dart
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


import 'package:http/http.dart' as http;

class MailContent extends StatefulWidget {
  @override
  _MailContentState createState() => _MailContentState();
}

class _MailContentState extends State<MailContent> {
  TextEditingController _questionController = TextEditingController();
  String resp = 'Please wait while we get you a message format.........';

  Future<void> askGPT(String question) async {
    print('hello');
    var response = await http.post(
      Uri.parse('https://api.openai.com/v1/completions'), // Replace with your GPT API endpoint
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${dotenv.env['chat_gpt_api']}', // Accessing API key from .env file
      },
      body: jsonEncode({"model":"gpt-3.5-turbo-instruct",
        "prompt" : question,
        "max_tokens" : 600,
      }),
    );

    print('Response Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        resp = data['choices'][0]['text'];
        print('i got $resp');
      });
    } else {
      print('Failed to fetch response from GPT API');
    }
  }


  @override
  var t=false;
  Widget build(BuildContext context) {
    return Column(
      children: [
        //networkingTitle
        Text(
          'Networking',
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.height * 0.05,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        //textfield
        Container(
          width: MediaQuery.of(context).size.width * .35,
          child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: MediaQuery.of(context).size.width * 0.002,
                color: Colors.black,
              ),
            ),
            elevation: MediaQuery.of(context).size.width * 0.008,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5 / 7,
              width: MediaQuery.of(context).size.width * 2 / 5,
              child: TextField(
                controller: _questionController,
                maxLines: null,
                // controller: widget.emailController,
                decoration: InputDecoration(
                  hintText:
                      '  Your focus, our words – elevate your investment pitch effortlessly.',
                  hintStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                    color: Colors.black,

                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {

                      setState(() {
                        //response='Loading.....';
                        String question = _questionController.text;
                        if (question.isNotEmpty) {
                          question="Hey Chat GPT help me write a cold mail in less than 300 word proper format"
                              "and in an eye catchy manner to get reply from my investor while "
                              "keeping these things also in mind"+question;
                          askGPT(question);
                          _questionController.clear();
                        }
                        //print('$resp');
                        t = true;
                        //    widget.isSendIconClicked = true;
                      });
                      // Add your logic for send icon button here
                      // Set isSendIconClicked to true and update the state accordingly
                    },
                  ),
                ),
              ),
            ),
          ),
        ),

        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        //boxForContent
        if (t==true)
          Container(
            height: MediaQuery.of(context).size.height * 1.2 / 2,
            width: MediaQuery.of(context).size.width * .35,
            //boxForContent,
            //boxForContent
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: SingleChildScrollView(
                child: Text(
                  " $resp",
                ),
              ),
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: MediaQuery.of(context).size.width * 0.002,
              ),
            ),
          ),
        if (t==false)
          Container(
            height: MediaQuery.of(context).size.height * 1.2 / 2,
            width: MediaQuery.of(context).size.width * .35,
            //boxForContent,
            //boxForContent
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text("  "),
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: MediaQuery.of(context).size.width * 0.002,
              ),
            ),
          ),

        Align(
          alignment: Alignment.bottomRight,
          child: IconButton(
            onPressed: () {
              _showCardDialog(context);
            },
            icon: Icon(
              Icons.chat_bubble,
              size: MediaQuery.of(context).size.width * 0.03,
            ),
          ),
        ),
      ],
    );
  }

  void _showCardDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Card(
            child: Text('chats'),
          ),
        );
      },
    );
  }
}
