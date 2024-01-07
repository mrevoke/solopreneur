import 'package:flutter/material.dart';
import 'package:solopreneuer/relations/appbar.dart';
import 'package:solopreneuer/relations/chatsection.dart';
import 'package:solopreneuer/relations/mailcontent.dart';

class mailsection extends StatefulWidget {
  @override
  _MySingleContainerPageState createState() => _MySingleContainerPageState();
}

class _MySingleContainerPageState extends State<mailsection> {
  bool isSendIconClicked = false;
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 5.5 / 7,
      child: Column(
        children: [MyAppBar(),        SizedBox(height:MediaQuery.of(context).size.height*0.2/7 ,),

          Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MailContent(),
        ///////add herecontain
        Container(
  decoration: BoxDecoration(
    color: Colors.white, // Set your desired background color
    borderRadius: BorderRadius.circular(20.0),
    boxShadow: [
      BoxShadow(
        color: Colors.grey,
        spreadRadius: 2,
        blurRadius: 5,
        offset: Offset(0, 3),
      ),
    ],
  ),
  child: Container(alignment: Alignment.center,//height:MediaQuery.of(context).size.height * 4/7 ,
  width: MediaQuery.of(context).size.width * 2/7,
    child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //crossAxisAlignment: CrossAxisAlignment.start,
       children: [
        SizedBox(height:MediaQuery.of(context).size.height*0.15/7 ,),
     Text("Frequent Chats",style: TextStyle(fontSize:MediaQuery.of(context).size.height*0.25/7,fontWeight: FontWeight.bold ),),
        SizedBox(height:MediaQuery.of(context).size.height*0.15/7 ,),
      ChatSection(recipientName: "NYC client", subject: "Payment due"),
        SizedBox(height:MediaQuery.of(context).size.height*0.09/7 ,),
     
      ChatSection(recipientName: "NYC client", subject: "Payment due"),
        SizedBox(height:MediaQuery.of(context).size.height*0.09/7 ,),
      ChatSection(recipientName: "NYC client", subject: "Payment due"),
      //ChatSection(recipientName: "NYC client", subject: "Payment due"),
        SizedBox(height:MediaQuery.of(context).size.height*0.09/7 ,),
      ChatSection(recipientName: "NYC client", subject: "Payment due"),
        SizedBox(height:MediaQuery.of(context).size.height*0.09/7 ,),
      ChatSection(recipientName: "NYC client", subject: "Payment due"),
        SizedBox(height:MediaQuery.of(context).size.height*0.09/7 ,),
      ChatSection(recipientName: "NYC client", subject: "Payment due"),
        SizedBox(height:MediaQuery.of(context).size.height*0.09/7 ,),
      ChatSection(recipientName: "NYC client", subject: "Payment due"),
        SizedBox(height:MediaQuery.of(context).size.height*0.09/7 ,),
      ChatSection(recipientName: "NYC client", subject: "Payment due"),
        SizedBox(height:MediaQuery.of(context).size.height*0.2/7 ,),
  
    ],
    ),
  ),
)

            ],
          ),
        ],
      )
    );
  }

}
