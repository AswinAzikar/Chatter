import 'package:flutter/material.dart';
import 'constants.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Map<String, dynamic>> chatList = [
    {
      "name": "Deadpool",
      "message": "All the dinosaurs feared the T-Rex.",
      "image": "images/deadpool.jpg",
      "time": "10:30 AM",
    },
    {
      "name": "Wolverine",
      "message": "Pain in A**.",
      "image": "images/Wolverine.jpg",
      "time": "11:45 AM",
    },
    // Add more chat items here
  ];

  int? tappedIndex;

  @override
  Widget build(BuildContext context) {
    var conheight = MediaQuery.of(context).size.height;
    var conwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: violy1,
      appBar: AppBar(
        title: Text(
          "chat_er",
          style: TextStyle(
            color: Colors.white,
            fontSize: conwidth * 0.08,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: violy1,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: whyte1,
              size: conwidth * 0.08,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.person_2,
              color: whyte1,
              size: conwidth * 0.08,
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        height: conheight,
        width: conwidth,
        decoration: BoxDecoration(
          color: whyte1,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: ListView.builder(
          itemCount: chatList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Stack(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        tappedIndex = index;
                      });
                      Future.delayed(Duration(milliseconds: 200), () {
                        setState(() {
                          tappedIndex = null;
                        });
                      });
                      print('${chatList[index]['name']} tapped!');
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: tappedIndex == index
                            ? Colors.grey.shade200
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              chatList[index]['image']!,
                              height: 70,
                              width: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: conwidth * 0.1,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  chatList[index]['name']!,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  chatList[index]['message']!,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      color: const Color.fromARGB(255, 89, 87, 87),
                      child: Text(
                        chatList[index]['time']!,
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
