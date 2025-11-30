import 'package:flutter/material.dart';

class IndividualDetailsScreen extends StatefulWidget {
  final String name;  //separated take because one reason // line 33 in AppBar
   final String images ;
  final List<Map> listMapFetchData;

  const IndividualDetailsScreen({
    super.key,
    required this.name,
    required this.listMapFetchData,
    required this.images
  });

  @override
  State<IndividualDetailsScreen> createState() =>
      _IndividualDetailsScreenState();
}

class _IndividualDetailsScreenState extends State<IndividualDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        titleSpacing: 0,
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            backgroundImage: AssetImage(widget.images),
            radius: 25,
          ),
          title: Text(
            "${widget.name}",// here name can't possible to take by listMapFetchData because we can't access index number in appBar. That's way separately take name individual by listTile
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text("online"),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.videocam_sharp, color: Colors.white, size: 24),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.call, color: Colors.white, size: 24),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert, color: Colors.white, size: 24),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: widget.listMapFetchData.length,
                itemBuilder: (context,index){
                  final data= widget.listMapFetchData[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: data['is_it_me']? CrossAxisAlignment.start:CrossAxisAlignment.end,
                  children: [
                    Container(
                      // height: MediaQuery.of(context).size.height*.07,
                      // width: MediaQuery.of(context).size.width*.5,
                      padding:EdgeInsets.all(15),
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width*0.7,
                      ),
                      decoration: BoxDecoration(
                        color:data['is_it_me']? Colors.greenAccent:Colors.lightBlueAccent,
                        borderRadius:data['is_it_me']?
                        BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15)):
                        BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15)),

                      ),
                      //child: Center(child: Text("${data['message']}")), //for Center widt can identify clearly that's way always take center
                      child: Text("${data['message']}"),

                    ),
                  ],
                ),
              );
            }),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal:8,vertical: 6),
            child: Row(children: [
              IconButton(onPressed: (){}, icon:Icon(Icons.emoji_emotions_outlined)),
              IconButton(onPressed: (){}, icon:Icon(Icons.file_open_outlined)),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.grey,
                      hintText: "Type a message",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none
                      )
                  ),
                ),
              ),
              IconButton(onPressed: (){}, icon: Icon(Icons.keyboard_voice_rounded))
            ],),
          ),
        ],
      )
    );
  }
}
