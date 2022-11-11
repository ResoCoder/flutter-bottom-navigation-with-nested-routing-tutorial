// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bottom_navigation_with_nested_routing_tutorial/widgets.dart';

class Post {
  static final posts = [
    Post(Colors.white, 'Pago en línea', 1),
    Post(Colors.white, 'Pago anticipado', 2),
    Post(Colors.white, 'Check-In', 3),
    Post(Colors.white, 'Check-Out', 4),
  ];
  final Color color;
  final String title;
  final int id;

  Post(this.color, this.title, this.id);
}

class User {
  static final users = [
    User(Colors.white, 'Placeholder', 1),
  ];
  final Color color;
  final String username;
  final int id;

  User(this.color, this.username, this.id);
}

class Parqueo {
  static final parqueos = [
    ParqueoWidget(
        parqueoColor: Colors.white,
        parqueoId: 0,
        numeroParqueo: 8,
        cupoParqueo: 15,
        tiempoParqueo: 20),
    ParqueoWidget(
        parqueoColor: Colors.white,
        parqueoId: 1,
        numeroParqueo: 9,
        cupoParqueo: 6,
        tiempoParqueo: 10),
    ParqueoWidget(
        parqueoColor: Colors.white,
        parqueoId: 2,
        numeroParqueo: 10,
        cupoParqueo: 30,
        tiempoParqueo: 23),
    ParqueoWidget(
        parqueoColor: Colors.white,
        parqueoId: 3,
        numeroParqueo: 12,
        cupoParqueo: 12,
        tiempoParqueo: 15),
  ];
  final Color color;
  final int id;
  final int cupos;
  final int tiempo;

  Parqueo(this.color, this.id, this.cupos, this.tiempo);
}
