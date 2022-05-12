import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/api/pharm.dart';

var profile = {
  "name": "Sangvaleap",
  "image": "https://avatars.githubusercontent.com/u/86506519?v=4",
  "email": "sangvaleap.vanny@gmail.com"
};

List<String> albumImages = [
  "https://images.unsplash.com/photo-1598928636135-d146006ff4be?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1505692952047-1a78307da8f2?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1618221118493-9cfa1a1c00da?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1571508601891-ca5e7a713859?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
];
//Pharm studentService = Pharm();

class feature {
  final String name, address, status, duty;
  feature(this.name, this.address, this.status, this.duty);
}

List features = [
  {
    "id": 100,
    "name": "Basma Clinic",
    "image":
        "https://th.bing.com/th/id/R.0a06733de26c157b50cd2d72f3aac3c0?rik=E0URZZA9LzL%2fAg&pid=ImgRaw&r=0",
    "drname": "Dr.Ali Ahmad",
    "location": "Nablus Sufyan Street",
    "is_favorited": false,
    "description":
        "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
  },
  {
    "id": 101,
    "name": "Junior Suite",
    "image":
        "https://th.bing.com/th/id/OIP.7rRbg7vE9yE0UxOERG1t3AHaFk?pid=ImgDet&w=1800&h=1353&rs=1",
    "drname": "Dr.Ali Ahmad",
    "location": "Phnom Penh",
    "is_favorited": true,
    "description":
        "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
  },
];
