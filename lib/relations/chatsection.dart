import 'package:flutter/material.dart';

class ChatSection extends StatefulWidget {
  final String recipientName;
  final String subject;

  ChatSection({required this.recipientName, required this.subject});

  @override
  _ChatSectionState createState() => _ChatSectionState();
}

class _ChatSectionState extends State<ChatSection> {
  @override
  Widget build(BuildContext context) {
    return Container(height: MediaQuery.of(context).size.height*0.7/14,
      width: MediaQuery.of(context).size.width * 2.5 / 7,
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.03,
      ),
      child: Row(
        children: [
          CircleAvatar(radius:MediaQuery.of(context).size.height *0.3/14 ,
            // Replace with the default profile picture icon
            child: Icon(Icons.account_circle),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.01),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
              Text(
                widget.recipientName,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.02,
                ),
              ),
               Text(
                widget.subject,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.015,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Spacer(),
          IconButton(iconSize: MediaQuery.of(context).size.height *0.25/9,
            icon: Icon(Icons.close),
            onPressed: () {
              // Add your logic to close the chat section
            },
          ),
        ],
      ),
    );
  }
}
