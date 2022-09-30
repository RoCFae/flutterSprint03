import 'package:flutter/material.dart';
import 'package:scania_project/src/app/components/side_bar.dart';
import 'package:scania_project/src/utils/export.dart';

class StandardPage extends StatelessWidget {
  final Widget body;
  final String pageTile;

  StandardPage({required this.body, required this.pageTile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text(
          pageTile,
          style: const TextStyle(color: Color.fromARGB(255, 180, 70, 82)),
        ),
        backgroundColor: const Color.fromARGB(255, 15, 19, 60),
        centerTitle: true,
      ),
      body: Padding(
          padding: EdgeInsets.only(
            left: PaddingSizes.introPageBorder,
            right: PaddingSizes.introPageBorder,
            top: PaddingSizes.introPageTop,
          ),
          child: SingleChildScrollView(
            child: body,
          )),
    );
  }
}

class AddPages extends StatelessWidget {
  final Widget body;
  final String pageTile;
  final Function()? onPressed;

  AddPages({required this.body, required this.pageTile, this.onPressed, required FloatingActionButton floatingActionButton});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text(
          pageTile,
          style: const TextStyle(color: Color.fromARGB(255, 180, 70, 82)),
        ),
        backgroundColor: const Color.fromARGB(255, 15, 19, 60),
        centerTitle: true,
      ),
      body: Padding(
          padding: EdgeInsets.only(
            left: PaddingSizes.introPageBorder,
            right: PaddingSizes.introPageBorder,
            top: PaddingSizes.introPageTop,
          ),
          child: SingleChildScrollView(
            child: body,
          )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 180, 70, 82),
        hoverColor: const Color.fromARGB(255, 94, 27, 35),
        onPressed: onPressed,
        child: const Icon(Icons.add),
      ),
    );
  }
}
