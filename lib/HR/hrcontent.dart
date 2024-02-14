import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:solopreneuer/widgets/InfoCard.dart';

class hrcontent extends StatefulWidget {
  @override
  _hrcontentState createState() => _hrcontentState();
}

class _hrcontentState extends State<hrcontent> {
  List<Map<String, dynamic>> searchResults = [];
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16.0),
        color: Colors.grey[200],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      labelText: 'Search by Skill',
                      suffixIcon:  IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    // Fetch and display users with the specified skill
                    fetchUsersBySkill(searchController.text);
                  },
                ),
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (value) {
                      // Fetch and display users with the specified skill
                      fetchUsersBySkill(value);
                    },
                  ),
                ),
               
              ],
            ),
            SizedBox(height: 16.0),
            Container(
              width: MediaQuery.of(context).size.width / 4,
              height: MediaQuery.of(context).size.height / 1.3,
              child: Expanded(
                child: ListView.builder(
                  itemCount: searchResults.length,
                  itemBuilder: (context, index) {
                    return InfoCard.fromMap(searchResults[index]);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> fetchUsersBySkill(String skill) async {
    if (skill.isEmpty) {
      return;
    }

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('employees')
        .where('skills', isEqualTo: skill)
        .get();

    setState(() {
      searchResults = querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    });
  }
}
