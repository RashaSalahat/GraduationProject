
import 'package:hotel_booking/pages/pages.dart';
import 'package:hotel_booking/screens/screens.dart';
import 'package:hotel_booking/themechat.dart';
import 'package:hotel_booking/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/widgets/widgets.dart';
class HomeScreenChat extends StatefulWidget {
  const HomeScreenChat({Key? key, required this.title}) : super(key: key);

  final String title;
  final pages=const[
    MessagesPage(),
    CallsPage(),
    NotificationsPage(),
    ContactsPage()
  ];

  @override
  State<HomeScreenChat> createState() => _HomeScreenChat();
}

class _HomeScreenChat extends State<HomeScreenChat> {

var index=0;
var label1='Messages';
  void _incrementCounter() {

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title:Text(label1,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),) ,
        leadingWidth:54 ,
        leading: const BackButton(color: Colors.black),
        actions: [Padding(
          padding: const EdgeInsets.only(right: 24.0),
          child: Avatar.small(url:Helpers.randomPictureUrl()),
        )],
      ) ,
      body:  const HomeScreenChat(title: 'Flutter Demo Home Page').pages[index],
      bottomNavigationBar:  _BottomNavigationBar(
          onItemSelected:(i) {
            setState(() {
              index=i;
              if(index==0){
                label1='Messages';
              }
              else if(index==1){
                label1='Calls';
              }
             else if(index==2){
                label1='Notifications';
              }
              else if(index==3){
                label1='Contact';
              }
            });
            print(index);
            print(label1);
          }

      ),
    );
  }
}
class _BottomNavigationBar extends StatefulWidget{
  const _BottomNavigationBar ({Key?key, required this.onItemSelected}):super(key:key);
  final ValueChanged<int> onItemSelected;

  @override
  State<_BottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<_BottomNavigationBar> {
  var SelectedIndex=0;
  void handleItemSelected(int index){
     widget.onItemSelected(index);
     setState(() {
       SelectedIndex=index;
     });
  }
  @override
  Widget build(BuildContext context){
    final brightness=Theme.of(context).brightness;
    return Card(
      color :(brightness==Brightness.light)?Colors.transparent:null,
      elevation: 0,
      child: SafeArea(
          top: false,
          bottom: true,
          child:Padding(
            padding: EdgeInsets.only(top: 16,right: 8,left: 8),
              child :Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _NavigationBarItem(label: 'Messages',icon:CupertinoIcons.bubble_left_bubble_right_fill,index: 0,onTap:handleItemSelected,isSelected:SelectedIndex==0,),
               //  _NavigationBarItem(label: 'Calls',icon: CupertinoIcons.phone_fill,index: 1,onTap: handleItemSelected ,isSelected:SelectedIndex==1),
               //  Padding(
               //    padding: const EdgeInsets.symmetric(horizontal: 8.0),
               //    child: GlowingActionButton(color: AppColors.secondary, icon: CupertinoIcons.add, onPressed: (){
               //      print('TODO new message');
               //    }),
               //  ),
               // _NavigationBarItem(label: 'Notifications',icon: CupertinoIcons.bell_solid,index: 2, onTap:handleItemSelected ,isSelected:SelectedIndex==2),
               _NavigationBarItem(label: 'Contact',icon: CupertinoIcons.person_2_fill,index: 3,onTap:handleItemSelected ,isSelected:SelectedIndex==3),
              ]))),
      margin: EdgeInsets.all(0.0),
    );
  }

  onTap() {}
}
class _NavigationBarItem extends StatelessWidget{
  const _NavigationBarItem ({Key?key,required this.label,required this.icon, required this.index, required this.onTap, required this.isSelected}):super(key:key);
 final ValueChanged<int> onTap;
  final String label;
  final IconData icon;
  final int index;
  final bool isSelected;
  @override
  Widget build(BuildContext context){
    return  GestureDetector(
      behavior: HitTestBehavior.opaque,
        onTap:() {
          onTap(index);
        },
        child:  SizedBox(
          width: 70,
          //  height: 60,
            child:Column(
              mainAxisSize: MainAxisSize.min,
              children: [Icon(icon,size: 20,color:isSelected?AppColors.secondary:null,),
                const SizedBox(height: 8,),
                Text(label,style:
                isSelected?  const TextStyle(fontSize: 11,color: AppColors.secondary,fontWeight: FontWeight.bold):const TextStyle(fontSize: 11),)],))
    ); }
}




