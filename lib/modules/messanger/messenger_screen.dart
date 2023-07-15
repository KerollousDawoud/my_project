// ignore_for_file: implementation_imports, unnecessary_import, unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MessengerScreen extends StatelessWidget {
  const MessengerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        titleSpacing: 20,
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.blue,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              'Chats',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.camera_alt,
                size: 16,
                color: Colors.white,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.edit,
                size: 16,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[300],
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Search',
                      style: TextStyle(),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 103,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context , index) => bulidStoryItem(),
                  separatorBuilder: (context , index) => SizedBox(
                    width: 20),
                  itemCount: 10,
                  ),
              ),
              SizedBox(
                height: 10,
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context , index) => buildChatItem(), 
                separatorBuilder: (context , index) => SizedBox(
                  height: 20,), 
                itemCount: 30)
            ],
          ),
        ),
      ),
    );
  }

  Widget buildChatItem() => Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.blue,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  bottom: 4,
                  end: 4,
                ),
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  bottom: 7,
                  end: 7,
                ),
                child: CircleAvatar(
                  radius: 7,
                  backgroundColor: Colors.green,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Kerollous Dawoud',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Hi! How are you broo what are you doing now Hi! How are you broo what are you doing now Hi! How are you broo what are you doing now',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        width: 7,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Text('02 : 30 PM'),
                  ],
                ),
              ],
            ),
          ),
        ],
      );

  Widget bulidStoryItem() => Container(
        width: 60,
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.blue,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    bottom: 4,
                    end: 4,
                  ),
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    bottom: 7,
                    end: 7,
                  ),
                  child: CircleAvatar(
                    radius: 7,
                    backgroundColor: Colors.green,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'kerollous Dawoud Aziz',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      );

}
