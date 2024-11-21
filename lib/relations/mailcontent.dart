import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class MailContent extends StatefulWidget {
  @override
  _MailContentState createState() => _MailContentState();
}

class _MailContentState extends State<MailContent> {
  TextEditingController _questionController = TextEditingController();
  String resp = 'Please wait while we get you a message format...';
  bool isLoading = false;

  Future<void> askGPT(String question) async {
    setState(() => isLoading = true);

    try {
      final response = await http.post(
        Uri.parse('https://api.openai.com/v1/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${dotenv.env['chat_gpt_api']}',
        },
        body: jsonEncode({
          "model": "gpt-4o-mini",
          "prompt": question,
          "max_tokens": 600,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          resp = data['choices'][0]['text'];
        });
      } else {
        setState(() {
          resp = 'Error fetching response: ${response.body}';
        });
      }
    } catch (e) {
      setState(() {
        resp = 'An error occurred: $e';
      });
    } finally {
      setState(() => isLoading = false);
    }
  }

  Future<int> sendEmail(String name, String email, String emailContent) async {
    final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
    const serviceId = "service_crxu9n9";
    const templateId = "template_9jnm1ni";
    const userId = "JZIkQgu9SDh1isUcJ";

    List<String> lines = emailContent.split('\n');
    String subject = '';
    String message = '';

    for (int i = 0; i < lines.length; i++) {
      if (lines[i].trim().startsWith('Subject:')) {
        subject = lines[i].substring('Subject:'.length).trim();
        message = lines.sublist(i + 1).join('\n').trim();
        break;
      }
    }

    final response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "service_id": serviceId,
          "template_id": templateId,
          "user_id": userId,
          "template_params": {
            "name": name,
            "email": email,
            "subject": subject,
            "message": message,
          }
        }));

    return response.statusCode;
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
                final email = emailController.text.trim();
                final name = nameController.text.trim();
                Navigator.pop(context);

                if (email.isNotEmpty && name.isNotEmpty) {
                  sendEmail(name, email, resp);
                }
              },
              child: Text('Send'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Networking',
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.height * 0.05,
            color: Colors.black,
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
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
            child: TextField(
              controller: _questionController,
              maxLines: null,
              decoration: InputDecoration(
                hintText:
                    'Your focus, our words – elevate your investment pitch effortlessly.',
                hintStyle: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.02,
                  color: Colors.black,
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    final question = _questionController.text.trim();
                    if (question.isNotEmpty) {
                      askGPT(
                          "Hey ChatGPT, I am Bruno Fernandez, and I own a company named Bruno Co. Help me write a cold mail in less than 400 words in a proper format and eye-catching manner to get a reply from my investor. Include the following details: $question. Also, include the subject with the email.");
                      _questionController.clear();
                    }
                  },
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        Container(
          height: MediaQuery.of(context).size.height * 1.2 / 2,
          width: MediaQuery.of(context).size.width * .35,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: MediaQuery.of(context).size.width * 0.002,
            ),
          ),
          child: Stack(
            children: [
              if (isLoading)
                Center(child: CircularProgressIndicator())
              else
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: SingleChildScrollView(child: Text(resp)),
                ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () => _showCardDialog(context),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
