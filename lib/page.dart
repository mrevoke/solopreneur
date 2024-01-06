import 'package:flutter/material.dart';
class pagee extends StatelessWidget {
  const pagee({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: Drawer(),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Hello', style: TextStyle(
              fontSize: MediaQuery.of(context).size.width*0.02,
              color: Color.fromRGBO(70, 156, 255, 0.612),
            ),),
            SizedBox(width: 5,),
            Text('BRUNO,' ,style: TextStyle(
              fontSize: MediaQuery.of(context).size.width*0.02,
              color: Color.fromRGBO(70, 156, 255, 0.612),
              fontWeight: FontWeight.bold,
            ),),
            SizedBox(width: 5,),
            Text('welcome back!',style: TextStyle(
              fontSize: MediaQuery.of(context).size.width*0.02,
              color: Color.fromRGBO(70, 156, 255, 0.612),
            ),)
          ],
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.notifications_outlined,color: Colors.black,),
        
          ),
      
         
        ],
      ),
     
    );
  }
}