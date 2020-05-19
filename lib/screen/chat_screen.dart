import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/models/user_model.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget{
  final User user;

  ChatScreen({this.user});
  @override 
  _ChatScreenState createState() => _ChatScreenState();
  
}

class _ChatScreenState extends State<ChatScreen>{

  

  _buildMessage(Message message,bool isMe){

    final Container msg =
      Container(
          width: MediaQuery.of(context).size.width*0.75,
          margin: isMe?EdgeInsets.only(left:80.0,top:8.0,bottom:8.0)
          :EdgeInsets.only(top:8.0,bottom:8.0),
          padding: EdgeInsets.symmetric(horizontal:25.0,vertical:15.0),
          
          decoration: BoxDecoration(
            color: isMe?Colors.grey[400]:Colors.grey[100],
            borderRadius: isMe?BorderRadius.only(
              topLeft: Radius.circular(15.0),
              bottomLeft: Radius.circular(15.0),
            ) :BorderRadius.only(
              topRight: Radius.circular(15.0),
              bottomRight: Radius.circular(15.0),
            )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(message.time,
              style: TextStyle(
                fontSize:16.0,
                fontWeight:FontWeight.w600,
                color: Colors.blueGrey,
              ),
            ),
              Text(message.text,
              style: TextStyle(
                fontSize:16.0,
                fontWeight:FontWeight.w600,
                color: Colors.black,
              ),),
            ],
          ) ,
        );
        if(isMe){
          return msg;
        }

    return Row(
      children: <Widget>[
        msg,
        IconButton(
          icon: message.isLiked ?Icon(Icons.favorite):Icon(Icons.favorite_border),
          iconSize: 30.0, 
          color: message.isLiked?Colors.red: Colors.black,
          onPressed: (){},
        ),
      ],
    );
  }

  _buildMessageComposer(){
      return Container(
        padding:EdgeInsets.symmetric(horizontal: 8.0),
        height:70.0,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.photo),
              iconSize: 25.0, 
              color: Theme.of(context).primaryColor,
              onPressed: (){},
            ),
            Expanded(
              child: TextField(
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration.collapsed
                (hintText: "Send a Message....",
                ),
              ),
              ),
            IconButton(
              icon: Icon(Icons.send),
              iconSize: 25.0, 
              color: Theme.of(context).primaryColor,
              onPressed: (){},
            ),
          ],
        ),
      );
    }

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.user.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28.0,
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
          icon: Icon(Icons.more_horiz),
          iconSize: 30.0,
          color: Colors.white,
          onPressed: ()=>{}
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => Focus.of(context).unfocus(),
              child: Column(
          children: <Widget>[
            Expanded(
                child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: ClipRRect(
                  borderRadius:BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                    child: ListView.builder(
                    reverse: true,
                    padding: EdgeInsets.only(top:15.0),
                    itemCount:messages.length,
                    itemBuilder: (BuildContext context,int index){
                      final Message message=messages[index];
                      final bool isMe=message.sender.id==currentUser.id;
                      return _buildMessage(message,isMe);
                    }
                  ),
                ),
              ),
            ),
            _buildMessageComposer(),
          ],
        ),
      ),
    );
  }
}