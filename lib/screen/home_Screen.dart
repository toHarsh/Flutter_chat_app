import 'package:chat_app/widget/category_selctor.dart';
import 'package:chat_app/widget/recent_chats.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/widget/favourite_contacts.dart';
class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu),
          iconSize: 30.0,
          color: Colors.white,
          onPressed: ()=>{}
          ),
        title: Text('Chats',
        style: TextStyle(
          fontSize:28.0,
          fontWeight: FontWeight.bold,
          )
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
          icon: Icon(Icons.search),
          iconSize: 30.0,
          color: Colors.white,
          onPressed: () =>{},
          ),
        ],
      ),
      body: Column(
        children:<Widget>[
          CategorySelector(),
          new Expanded(
                child: Container(
                decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                )
              ),
              child: Column(
                children: <Widget>[
                  FavouriteContacts(),
                  RecentChats(),
                ],
              ),
            ),
          )
        ]
      ),
    );
  }
}

