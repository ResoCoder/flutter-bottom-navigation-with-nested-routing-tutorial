// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bottom_navigation_with_nested_routing_tutorial/widgets.dart';
import 'dart:math';

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
Random random = Random();
            int randomNumber1 = random.nextInt(100);
            int randomNumber2 = random.nextInt(100);
            int randomNumber3 = random.nextInt(100);

class Parqueo {
  static final parqueos = [
    ParqueoWidget(
        parqueoColor: Colors.white,
        parqueoId: 0,
        numeroParqueo: 1,
        cupoParqueo: randomNumber1,
        tiempoParqueo: 20),
    ParqueoWidget(
        parqueoColor: Colors.white,
        parqueoId: 1,
        numeroParqueo: 2,
        cupoParqueo: randomNumber2,
        tiempoParqueo: 10),
    ParqueoWidget(
        parqueoColor: Colors.white,
        parqueoId: 2,
        numeroParqueo: 3,
        cupoParqueo: randomNumber3,
        tiempoParqueo: 23),
  ];
  final Color color;
  final int id;
  final int cupos;
  final int tiempo;

  Parqueo(this.color, this.id, this.cupos, this.tiempo);
}
