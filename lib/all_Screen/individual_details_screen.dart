import 'package:flutter/material.dart';

class IndividualDetailsScreen extends StatefulWidget {
  final String name;
  // final String name ;
  final List<Map> listMapFetchData;

  const IndividualDetailsScreen({
    super.key,
    required this.name,
    required this.listMapFetchData
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
            backgroundImage: AssetImage("assets/images/logo2.png"),
            radius: 25,
          ),
          title: Text(
            "${widget.name}",
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
      body: ListView.builder(
          itemCount: widget.listMapFetchData.length,
          itemBuilder: (context,index){
            final data= widget.listMapFetchData[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: data['is_it_me']? MainAxisAlignment.start:MainAxisAlignment.end,
            children: [
              Container(
                height: MediaQuery.of(context).size.height*.07,
                width: MediaQuery.of(context).size.width*.5,
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
                // child: Center(child: Text("${widget.message}")),
                child: Center(child: Text("${data['message']}")),

              ),
            ],
          ),
        );
      })
    );
  }
}
