import 'package:flutter/material.dart';
import 'package:solopreneuer/finance/bar_graph.dart';

class BargraphContainer extends StatefulWidget {
  const BargraphContainer({Key? key}) : super(key: key);

  @override
  State<BargraphContainer> createState() => _BargraphContainerState();
}

class _BargraphContainerState extends State<BargraphContainer> {
  List<double> amountSummary = [10, 15, 20, 30]; // Initialize 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.4 / 7),
          Text(
            'Money Flow',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height / 25,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 3 / 7,
            width: 500,
            child: MyBarGraph(
              amountSummary: amountSummary,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showEditDialog(context);
        },
        child: Icon(Icons.edit),
      ),
    );
  }

  void _showEditDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Edit Amounts"),
          content: SingleChildScrollView(
            child: Column(
              children: List.generate(
                amountSummary.length,
                (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Amount $index', // Label for the TextField
                    ),
                    onChanged: (value) {
                      setState(() {
                        amountSummary[index] = double.tryParse(value) ?? 0.0;
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }
}
