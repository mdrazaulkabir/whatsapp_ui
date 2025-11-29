import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String,dynamic>>data=[
    {
      "name":'Razaul Kabir',
      "description":"I am flutter app developer",
      "goodStudent":true,
      "age":24,
      "Address":"Dhaka"
    },
    {
      "name":'Hanson Kabir',
      "description":"I am not flutter app developer",
      "goodStudent":false,
      "age":23,
      "Address":"Dhaka"
    },
    {
      "name":'Hasan ahmed',
      "description":"immigrant",
      "goodStudent":true,
      "age":25,
      "Address":"suiden"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text(
          "WhatsApp",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
          Icon(Icons.search, color: Colors.white, size: 24),
          Icon(Icons.more_vert, color: Colors.white, size: 24),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/images/logo2.png"),
              radius: 50,

            ),
            title: Text(
              "Name",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            subtitle: Text("this is subtitle ",style: TextStyle(color: Colors.grey),),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("12:05",style: TextStyle(color: Colors.green),),
                CircleAvatar(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  child: Text("2"),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
