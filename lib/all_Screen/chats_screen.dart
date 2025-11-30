import 'package:flutter/material.dart';
import 'package:whatsapp_ui/all_Screen/call_screen.dart';
import 'package:whatsapp_ui/all_Screen/camera_screen.dart';
import 'package:whatsapp_ui/all_Screen/individual_details_screen.dart';
import 'package:whatsapp_ui/all_Screen/status_screen.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  List<Map> listMapData = [
    {
      "name": 'Razaul Kabir',
      "description": "I am flutter new app developer. Now, i am finding the job . I am little bit nervous to join the job.",
      "is_it_me": true,
      'message':"hello,how are you?",
      "age": 24,
      "Address": "Dhaka",
    },
    {
      "name": 'Hanson Kabir',
      "description": "I am not flutter app developer",
      "is_it_me": false,
      'message':"I am fine and you?",
      "age": 23,
      "Address": "Dhaka",
    },
    {
      "name": 'Hasan ahmed',
      "description": "immigrant",
      "is_it_me": true,
      'message':"i am also fine. How are doing this day!",
      "age": 25,
      "Address": "suiden",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          title: Text(
            "WhatsApp",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.white),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search, color: Colors.white, size: 24),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert, color: Colors.white, size: 24),
            ),
          ],
          bottom: TabBar(
            unselectedLabelColor: Colors.white.withOpacity(.5),
            labelColor: Colors.white,
            indicatorColor: Colors.white,

            tabs: [
              Tab(icon: Icon(Icons.camera_alt)),
              Tab(text: "CHATS"),
              // Tab(
              //   child: Row(
              //     children: [
              //       Text("CHATS"),
              //       Spacer(),
              //       CircleAvatar(
              //         backgroundColor: Colors.white,
              //         foregroundColor: Colors.black,
              //
              //         child: Text("2"),
              //       ),
              //     ],
              //   ),
              // ),
              Tab(text: 'STATUS',),
              Tab(text: 'CALLS',),
            ],
          ),
        ),
          body: TabBarView(
              children: [
                //tabLength 1
                CameraScreen(),

                //tabLength 2
                ListView.builder(
                  itemCount: listMapData.length,
                  itemBuilder: (context, index) {
                    final data=listMapData[index];
                    //print(data);
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      horizontalTitleGap: 0,
                      onTap: (){
                        Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            IndividualDetailsScreen(
                                name: '${data['name']}',
                              listMapFetchData: listMapData,

                            ),
                      ),
                    );
                  },
                  leading: CircleAvatar(
                        backgroundImage: AssetImage("assets/images/logo2.png"),
                        radius: 45,
                      ),
                      title: Text(
                        "${data["name"]}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      subtitle: Text(
                        "${data['description']} ",maxLines: 1,overflow:TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.grey),
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("12:05", style: TextStyle(color: Colors.green)),
                          Spacer(),
                          CircleAvatar(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                            radius: 13,
                            child: Text("2"),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                //tabLength 3
                StatusScreen(),
                //tabLength 4
                CallScreen(),
              ])
      ),
    );
  }
}
