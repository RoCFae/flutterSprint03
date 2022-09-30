import 'package:flutter/material.dart';

class StandardCard extends StatelessWidget {
  final String? text;

  StandardCard({this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border:
            Border.all(color: const Color.fromARGB(255, 18, 19, 27), width: 2),
        color: const Color.fromARGB(255, 15, 19, 60),
      ),
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              text!,
              style: const TextStyle(
                  fontSize: 35, color: Color.fromARGB(255, 145, 34, 47)),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String? title;
  final String? description;
  final String? thirdText;

  CustomCard({this.title, this.description, this.thirdText});

  // ignore: empty_constructor_bodies
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 15, 19, 60),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: const Icon(
              Icons.time_to_leave,
              color: Color.fromARGB(255, 180, 70, 82),
              size: 40.0,
            ),
            title: Text(
              title!,
              style: const TextStyle(
                fontSize: 30.0,
                color: Color.fromARGB(255, 180, 70, 82),
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              description!,
              style: const TextStyle(
                fontSize: 18.0,
                color: Color.fromARGB(255, 180, 70, 82),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              thirdText!,
              style: const TextStyle(
                fontSize: 18.0,
                color: Color.fromARGB(255, 180, 70, 82),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  final String? name;
  final String? email;
  final String? cpf;

  UserCard({this.name, this.email, this.cpf});

  // ignore: empty_constructor_bodies
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 15, 19, 60),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: const Icon(
              Icons.person,
              color: Color.fromARGB(255, 180, 70, 82),
              size: 40.0,
            ),
            title: Text(
              name!,
              style: const TextStyle(
                fontSize: 30.0,
                color: Color.fromARGB(255, 180, 70, 82),
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              email!,
              style: const TextStyle(
                fontSize: 18.0,
                color: Color.fromARGB(255, 180, 70, 82),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              cpf!,
              style: const TextStyle(
                fontSize: 18.0,
                color: Color.fromARGB(255, 180, 70, 82),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
