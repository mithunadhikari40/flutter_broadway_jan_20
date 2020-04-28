import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("The title",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          actions: [
            FlatButton(
              child: Text("About",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              onPressed: () {},
            ),
            SizedBox(
              width: 20,
            ),
            FlatButton(
              child: Text("Episodes",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              onPressed: () {},
            ),
            SizedBox(
              width: 20,
            ),
          ]),
      body: Column(
        children: [_buildBody(context)],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Card(
              margin: EdgeInsets.all(16),
              elevation: 4,
              child: Column(
                children: [
                  Text(
                    "Kathmandu",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SelectableText(
                    """Kathmandu, Nepal's capital, is set in a valley surrounded by the Himalayan mountains. At the heart of theold city’s mazelike alleys is Durbar Square, which becomes frenetic during Indra Jatra, a religious festival featuring masked dances.Many of the city's historic sites were damaged or destroyed by a 2015 earthquake.Durbar Square's palace, Hanuman Dhoka,and Kasthamandap, a wooden Hindu temple, are being rebuilt.""",
                    style: TextStyle(fontSize: 16, height: 1.30),
                    showCursor: true,
                    autofocus: true,
                    dragStartBehavior: DragStartBehavior.start,

                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: FlatButton(
              child: Text(
                "Visit Place",
                style: TextStyle(fontSize: 18),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context){
                    return AlertDialog(
                      title: Text("Kathmandu"),
                      content: Text("Kathmandu is capital city of Nepal"),
                      actions: [
                       FlatButton(
              child: Text("Ok",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text("Cancel",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
                      ],
                    );
                  }
                );
              },
              color: Colors.blue,
            ),
          )
        ],
      ),
    );
  }

  // Widget _buildNavigationBar() {
  //   return Container(
  //     height: 80,
  //     child: Card(
  //       elevation: 8,
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           Expanded(
  //             child: Container(
  //               child: Text("Home page"),
  //               padding: EdgeInsets.only(left: 16),
  //             ),
  //           ),
  //           Row(
  //             mainAxisSize: MainAxisSize.min,
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               Text("About"),
  //               Text("Other"),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
