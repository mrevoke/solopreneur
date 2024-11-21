// mail_content.dart
import 'dart:convert';
import 'dart:developer';

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
      Uri.parse('https://api.openai.com/v1/completions'),
      // Replace with your GPT API endpoint
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${dotenv.env['chat_gpt_api']}',
        // Accessing API key from .env file
      },
      body: jsonEncode({"model": "gpt-4o-mini",
        "prompt": question,
        "max_tokens": 600,
      }),
    );

    //print('Response Status Code: ${response.statusCode}');
    //cprint('Response Body: ${response.body}');
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        resp = data['choices'][0]['text'];
        //print('i got $resp');
      });
    } else {
      print('Failed to fetch response from GPT API');
    }
  }

  Future sendEmail(String name, String email, String emailContent) async {
    final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
    const serviceId = "service_crxu9n9";
    const templateId = "template_9jnm1ni";
    const userId = "JZIkQgu9SDh1isUcJ";
    List<String> lines = emailContent.split('\n');
    String subject = '';
    print("heyyyy");
    log(email);
    String remainingContent = '';
    for (int i = 0; i < lines.length; i++) {
      if (lines[i].trim().startsWith('Subject:')) {
        subject = lines[i].trim().substring('Subject:'.length).trim();
        remainingContent = lines.sublist(i + 1).join('\n').trim();
        break;
      }
    }
    final response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode({
          "service_id": serviceId,
          "template_id": templateId,
          "user_id": userId,
          "template_params": {
            "name": name,
            "email": email,
            "subject": subject,
            "message": remainingContent,
          }
        })
    );
    return response.statusCode;
  }

  @override
  var t = false;

  Widget build(BuildContext context) {
    return Column(
      children: [
        //networkingTitle
        Text(
          'Networking',
          style: TextStyle(
            fontSize: MediaQuery
                .of(context)
                .size
                .height * 0.05,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: MediaQuery
              .of(context)
              .size
              .height * 0.01,
        ),
        //textfield
        Container(
          width: MediaQuery
              .of(context)
              .size
              .width * .35,
          child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.002,
                color: Colors.black,
              ),
            ),
            elevation: MediaQuery
                .of(context)
                .size
                .width * 0.008,
            child: Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.5 / 7,
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 2 / 5,
              child: TextField(
                controller: _questionController,
                maxLines: null,
                // controller: widget.emailController,
                decoration: InputDecoration(
                  hintText:
                  '  Your focus, our words – elevate your investment pitch effortlessly.',
                  hintStyle: TextStyle(
                    fontSize: MediaQuery
                        .of(context)
                        .size
                        .height * 0.02,
                    color: Colors.black,

                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      setState(() {
                        //response='Loading.....';
                        String question = _questionController.text;
                        if (question.isNotEmpty) {
                          question =
                              "Hey Chat GPT I am Bruno Fernandez and i own a company named Bruno Co. help me write a cold mail in less than 400 word proper format"
                                  "and in an eye catchy manner to get reply from my investor while "
                                  "keeping these things also in mind" +
                                  question + " also include subject with email";
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
          height: MediaQuery
              .of(context)
              .size
              .height * 0.02,
        ),
        //boxForContent
        if (t == true)
          Container(
            height: MediaQuery
                .of(context)
                .size
                .height * 1.2 / 2,
            width: MediaQuery
                .of(context)
                .size
                .width * .35,
            // boxForContent,
            // boxForContent
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: SingleChildScrollView(
                    child: Text(
                      "$resp"
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: IconButton(
                      onPressed: () {
                        _showCardDialog(context);
                      },
                      icon: Icon(
                        Icons.send,
                        size: MediaQuery
                            .of(context)
                            .size
                            .width * 0.02,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.002,
              ),
            ),
          ),
        if (t == false)
          Container(
            height: MediaQuery
                .of(context)
                .size
                .height * 1.2 / 2,
            width: MediaQuery
                .of(context)
                .size
                .width * .35,
            // boxForContent,
            // boxForContent
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text("  "),
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.002,
              ),
            ),
          ),

      ],
    );
  }

  void _showCardDialog(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController nameController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Send Email'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                String email = emailController.text;
                String name = nameController.text;
                Navigator.pop(context);
                print("Email: $email, Name: $name");
                sendEmail(name, email, resp);
              },
              child: Text('Send'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}

