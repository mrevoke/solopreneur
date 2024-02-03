import 'package:flutter/material.dart';
import 'package:solopreneuer/Employee/labeltext.dart';
import 'package:solopreneuer/relations/mailsection.dart';

import '../relations/chatsection.dart';

class employee extends StatefulWidget {
  const employee({super.key});

  @override
  State<employee> createState() => _employeeState();
}

class _employeeState extends State<employee> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:BoxDecoration(
        gradient: LinearGradient(
          colors: [const Color.fromARGB(255, 238, 238, 238)!, Colors.white], // Adjust colors as needed
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
     // color: Color.fromARGB(255, 226, 241, 247),
      width: MediaQuery.sizeOf(context).width,
      child: Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //MailContent(),expande
                  
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     SizedBox(height:MediaQuery.of(context).size.height *0.055 ,),
    
                      const LabeledTextField(labelText: "Full Name", hintText: "Type here"),
                     SizedBox(height:MediaQuery.of(context).size.height *0.022 ,),
                      const LabeledTextField(labelText: "Phone Number", hintText: "Type here"),
                     SizedBox(height:MediaQuery.of(context).size.height *0.022 ,),
                      const LabeledTextField(labelText: "DOB", hintText: "Type here"),
                     SizedBox(height:MediaQuery.of(context).size.height *0.022 ,),
                      const LabeledTextField(labelText: "Profile Links", hintText: "Type here"),
                     SizedBox(height:MediaQuery.of(context).size.height *0.022 ,),
                      const LabeledTextField(labelText: "Ready To Relocate", hintText: "Type here"),
                     SizedBox(height:MediaQuery.of(context).size.height *0.022 ,),
                      const LabeledTextField(labelText: "Preffered Location", hintText: "Type here"),
                     SizedBox(height:MediaQuery.of(context).size.height *0.022 ,),
                      const LabeledTextField(labelText: "Current Salary", hintText: "Type here"),
                     SizedBox(height:MediaQuery.of(context).size.height *0.022 ,),
                      const LabeledTextField(labelText: "Experience", hintText: "Type here"),
                     SizedBox(height:MediaQuery.of(context).size.height *0.022 ,),
                      const LabeledTextField(labelText: "Skills", hintText: "Type here"),
                     SizedBox(height:MediaQuery.of(context).size.height *0.022 ,),
                  
                    ],
                  ),        Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     SizedBox(height:MediaQuery.of(context).size.height *0.055 ,),
    
                      const LabeledTextField(labelText: "Email", hintText: "Type here"),
                     SizedBox(height:MediaQuery.of(context).size.height *0.022 ,),
                      const LabeledTextField(labelText: "Current Company", hintText: "Type here"),
                     SizedBox(height:MediaQuery.of(context).size.height *0.022 ,),
                      const LabeledTextField(labelText: "Graduation Date", hintText: "Type here"),
                     SizedBox(height:MediaQuery.of(context).size.height *0.022 ,),
                      const LabeledTextField(labelText: "Profile Link 2", hintText: "Type here"),
                     SizedBox(height:MediaQuery.of(context).size.height *0.022 ,),
                      const LabeledTextField(labelText: "Have Visa", hintText: "Type here"),
                     SizedBox(height:MediaQuery.of(context).size.height *0.022 ,),
                      const LabeledTextField(labelText: "Current Location", hintText: "Type here"),
                     SizedBox(height:MediaQuery.of(context).size.height *0.022 ,),
                      const LabeledTextField(labelText: "Expected Salary", hintText: "Type here"),
                     SizedBox(height:MediaQuery.of(context).size.height *0.022 ,),
                      const LabeledTextField(labelText: "Gender", hintText: "Type here"),
                     SizedBox(height:MediaQuery.of(context).size.height *0.022 ,),
                      const LabeledTextField(labelText: "Notice Period", hintText: "Type here"),
                     SizedBox(height:MediaQuery.of(context).size.height *0.022 ,),
                  
                    ],
                  ), 
            ///////add herecontain
            Container(height: MediaQuery.sizeOf(context).height*0.9,
      decoration: BoxDecoration(
        color: Colors.white, // Set your desired background color
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: const [
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
         
          ChatSection(recipientName: "Supplier", subject: "Updates"),
            SizedBox(height:MediaQuery.of(context).size.height*0.09/7 ,),
          ChatSection(recipientName: "Investor", subject: "investments!"),
          //ChatSection(recipientName: "NYC client", subject: "Payment due"),
            SizedBox(height:MediaQuery.of(context).size.height*0.09/7 ,),
          ChatSection(recipientName: "U.S client", subject: "Enquiry"),
            SizedBox(height:MediaQuery.of(context).size.height*0.09/7 ,),
          ChatSection(recipientName: "Team A", subject: "Progress"),
            SizedBox(height:MediaQuery.of(context).size.height*0.09/7 ,),
          ChatSection(recipientName: "Team B", subject: "Progress"),
            SizedBox(height:MediaQuery.of(context).size.height*0.09/7 ,),
          ChatSection(recipientName: "NYC client", subject: "Payments done"),
            SizedBox(height:MediaQuery.of(context).size.height*0.09/7 ,),
          ChatSection(recipientName: "U.S client", subject: "Business eqry"),
            SizedBox(height:MediaQuery.of(context).size.height*0.2/7 ,),
      
        ],
        ),
      ),
    )
    
                ],
              ),
    );
  }
}