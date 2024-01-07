import 'package:flutter/material.dart';
class pagee extends StatefulWidget {
  const pagee({super.key});

  @override
  State<pagee> createState() => _pageeState();
}

class _pageeState extends State<pagee> {
  @override
  Widget build(BuildContext context) {
    void _showCardDialog(BuildContext context) {
      showDialog(context: context, builder: (BuildContext context){
        return AlertDialog(
          content: Card(
            child: Text('chats'),
          ),
        );

      },
      );
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){
          
        }, icon: Icon(Icons.menu)),
        title: Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Hello',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.02,
                  color: Color.fromRGBO(70, 156, 255, 0.612),
                ),
              ),
              SizedBox(width:  MediaQuery.of(context).size.width * 0.005),
              Text(
                'BRUNO,',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.02,
                  color: Color.fromRGBO(70, 156, 255, 0.612),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width:  MediaQuery.of(context).size.width * 0.005),
              Text(
                'welcome back!',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.02,
                  color: Color.fromRGBO(70, 156, 255, 0.612),
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_outlined, color: Colors.black),
          ),
          Container(
            decoration: BoxDecoration(
              color:  Color.fromRGBO(70, 156, 255, 0.612)
            ),
            
            child: MyPopupMenuButton())
        ],
        toolbarHeight: 80.0, // Adjust the height as needed
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.width * 0.02,),
            Container(
              margin: EdgeInsets.only(left:  MediaQuery.of(context).size.width * 0.1,right: MediaQuery.of(context).size.width * 0.1),
              child: Text('Networking',
              style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.03,
                      color: Colors.black,
                    ),),
            ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.01,),
            Container(
              margin: EdgeInsets.only(left:  MediaQuery.of(context).size.width * 0.1,right:  MediaQuery.of(context).size.width * 0.1),
              height:MediaQuery.of(context).size.width * 0.06,
              child: Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: MediaQuery.of(context).size.width * 0.002, color:Colors.black),
                ),
                elevation: MediaQuery.of(context).size.width * 0.008,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Write mail to investor to invest more!',
                    hintStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.02,
                      color: Colors.black,
                    ),
                  ),
                
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.02,),
            Container(
              height: 500,
              margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.1,right: MediaQuery.of(context).size.width * 0.1),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: MediaQuery.of(context).size.width * 0.002,
                )
              ),
            ),
            
            Align(
              alignment: Alignment.bottomRight,
              child: IconButton(onPressed: (){
              _showCardDialog(context);
              }, icon: Icon(Icons.chat_bubble, size: MediaQuery.of(context).size.width * 0.03,))),
              
      
          ],
        ),
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
                fontSize: 16,
                fontWeight: FontWeight.bold,
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}
