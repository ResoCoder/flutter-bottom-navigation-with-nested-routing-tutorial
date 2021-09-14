import 'package:flutter/material.dart';

class Post {
  static final posts = [
    Post(Colors.amberAccent, 'Post 1', 1),
    Post(Colors.blue, 'Post 2', 2),
    Post(Colors.pinkAccent, 'Post 3', 3),
  ];
  final Color color;
  final String title;
  final int id;

  Post(this.color, this.title, this.id);
}

class User {
  static final users = [
    User(Colors.amberAccent, 1),
    User(Colors.blue, 2),
    User(Colors.pinkAccent, 3),
  ];
  final Color color;
  final int id;

  User(this.color, this.id);
}
