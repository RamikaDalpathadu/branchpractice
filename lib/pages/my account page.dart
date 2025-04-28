import 'package:flutter/material.dart';

class MyAccountInterface extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Account'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(title: Text('Edit Profile'), trailing: Icon(Icons.edit)),
          ListTile(title: Text('My Goals'), trailing: Icon(Icons.flag)),
          ListTile(title: Text('Delete Account'), trailing: Icon(Icons.delete)),
          ListTile(title: Text('Change Password'), trailing: Icon(Icons.lock)),
          Divider(),
          ListTile(
            title: Text('Log Out', style: TextStyle(color: const Color.fromARGB(255, 38, 224, 153))),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
