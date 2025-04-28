import 'package:flutter/material.dart';

class SettingInterface extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings'), centerTitle: true),
      body: ListView(
        children: [
          ListTile(title: Text('ACCOUNT')),
          ListTile(
            title: Text('Profile'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            title: Text('Notifications'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(),
          ListTile(title: Text('PREFERENCES')),
          SwitchListTile(
            title: Text('Music'),
            value: true,
            onChanged: (val) {},
          ),
          SwitchListTile(
            title: Text('Sounds'),
            value: true,
            onChanged: (val) {},
          ),
          ListTile(
            title: Text('More Settings'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(),
          ListTile(
            title: Text('Help'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            title: Text('About'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(),
          ListTile(
            title: Text(
              'Log Out',
              style: TextStyle(color: const Color.fromARGB(255, 7, 184, 110)),
            ),
            onTap: () {},
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.update), label: 'Update'),
        ],
      ),
    );
  }
}
