import 'package:flutter/material.dart';
import 'package:scania_project/src/app/modules/home_page/home_page.dart';
import 'package:scania_project/src/app/modules/login_page/login_page.dart';
import 'package:scania_project/src/app/modules/vehicles_pages/vehicles_page.dart';
import 'package:scania_project/src/utils/export.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text('Account Name'),
            accountEmail: Text('account.email@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 15, 19, 60),
              child: ClipOval(
                child: Icon(Icons.person, size: 50),
              ),
            ),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 15, 19, 60),
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage('images/teste.jpg')),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => HomePage()),
                ),
              )
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.time_to_leave),
            title: const Text(vehicles),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => VehiclesListPage()),
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            title: const Text('Exit'),
            leading: const Icon(Icons.exit_to_app),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => LoginPage()),
                ),
              )
            },
          ),
        ],
      ),
    );
  }
}
