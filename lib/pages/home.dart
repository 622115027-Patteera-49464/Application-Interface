import 'dart:convert';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.account_circle_outlined,
              size: 35,
              color: Colors.black,
            ),
            Image.asset('assets/icons/twitter_icon_white.png',
                fit: BoxFit.contain, width: 35, height: 35),
            Image.asset('assets/icons/sparkle.png',
                fit: BoxFit.contain, width: 35, height: 35),
          ],
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
          child: FutureBuilder(
        builder: (context, snapshot) {
          var data = json.decode(snapshot.data.toString());
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Tweet(
                  data[index]['profile'],
                  data[index]['name'],
                  data[index]['username'],
                  data[index]['time'],
                  data[index]['content'],
                  data[index]['comment'],
                  data[index]['retweet'],
                  data[index]['liked'],
                  data[index]['checkLike']);
            },
            itemCount: data.length,
          );
        },
        future:
            DefaultAssetBundle.of(context).loadString('assets/data/data.json'),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xFF48a3e2),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget Tweet(
      String profile,
      String name,
      String username,
      String time,
      String content,
      String comment,
      String retweet,
      String liked,
      bool checkLike) {
    return Container(
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Colors.black12, width: 0.7))),
      child: Row(
        children: [
          Column(
            children: [
              Align(
                  alignment: Alignment.topCenter,
                  child: CircleAvatar(
                      radius: 22, backgroundImage: NetworkImage(profile)))
            ],
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                SizedBox(width: 20),
                Text(name,
                    style: TextStyle(fontFamily: "Chirp_bold", fontSize: 15)),
                SizedBox(width: 6),
                Text(username,
                    style: TextStyle(fontFamily: "Chirp_thin", fontSize: 15)),
                Text(" • " + time,
                    style: TextStyle(fontFamily: "Chirp_thin", fontSize: 14)),
                SizedBox(width: MediaQuery.of(context).size.width - 330),
                Icon(
                  Icons.keyboard_control,
                  size: 15,
                  color: Colors.grey[350],
                )
              ],
            ),
            Padding(padding: EdgeInsets.all(2)),
            Row(
              children: [
                SizedBox(width: 20),
                Text(content,
                    style: TextStyle(fontFamily: "Chirp", fontSize: 14))
              ],
            ),
            Padding(padding: EdgeInsets.all(3)),
            Row(
              children: [
                SizedBox(width: 20),
                Icon(
                  Icons.messenger_outline_rounded,
                  color: Colors.grey,
                  size: 16.0,
                ),
                SizedBox(width: 7),
                Text(comment,
                    style: TextStyle(fontFamily: "Chirp_thin", fontSize: 12)),
                SizedBox(width: 35),
                Image.asset('assets/icons/retweet.png', width: 18),
                SizedBox(width: 7),
                Text(retweet,
                    style: TextStyle(
                        fontFamily: "Chirp_thin",
                        fontSize: 12,
                        color: Color(0xFF1eba7f))),
                SizedBox(width: 35),
                checkLike
                    ? Row(
                        children: [
                          Icon(
                            Icons.favorite_rounded,
                            color: Colors.pink,
                            size: 16.0,
                          ),
                          SizedBox(width: 7),
                          Text(liked,
                              style: TextStyle(
                                  color: Colors.pink,
                                  fontFamily: "Chirp_thin",
                                  fontSize: 12))
                        ],
                      )
                    : Row(children: [
                        Icon(
                          Icons.favorite_outline_rounded,
                          color: Colors.grey,
                          size: 16.0,
                        ),
                        SizedBox(width: 7),
                        Text(liked,
                            style: TextStyle(
                                color: Colors.grey,
                                fontFamily: "Chirp_thin",
                                fontSize: 12))
                      ]),
                SizedBox(width: 35),
                Image.asset('assets/icons/share.png', width: 16)
              ],
            )
          ]),
        ],
      ),
    );
  }
}
