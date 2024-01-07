// app_bar.dart

import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 1 / 14,
      child: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
        ),
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Hello',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.02,
                  color: Color.fromRGBO(70, 156, 255, 0.612),
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.005),
              Text(
                'BRUNO,',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.02,
                  color: Color.fromRGBO(70, 156, 255, 0.612),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.005),
              Text(
                'welcome back!',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.02,
                  color: Color.fromRGBO(70, 156, 255, 0.612),
                ),
              ),
            ],
          ),
        ),
        actions: [
          //notificationbutton
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_outlined, color: Colors.black),
          ),
          //useriddetails and login
          Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(70, 156, 255, 0.612),
            ),
            child: MyPopupMenuButton(),
          ),
        ],
        toolbarHeight:
            MediaQuery.of(context).size.height * 1 / 14, // Adjust the height as needed
      ),
    );
  }
}

class MyPopupMenuButton extends StatefulWidget {
  @override
  _MyPopupMenuButtonState createState() => _MyPopupMenuButtonState();
}

class _MyPopupMenuButtonState extends State<MyPopupMenuButton> {
  bool isAuthenticated = false; // Set to true if the user is authenticated

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (value) {
        if (value == 'login') {
          // Handle login action
          setState(() {
            isAuthenticated = true;
          });
        } else if (value == 'logout') {
          // Handle logout action
          setState(() {
            isAuthenticated = false;
          });
        }
      },
      itemBuilder: (BuildContext context) {
        return isAuthenticated
            ? [
                PopupMenuItem<String>(
                  value: 'logout',
                  child: Text('Logout'),
                ),
              ]
            : [
                PopupMenuItem<String>(
                  value: 'login',
                  child: Text('Login'),
                ),
              ];
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(
              'Bruno Fernandes',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.02,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
