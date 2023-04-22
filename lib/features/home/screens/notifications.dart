import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  static const routeName = 'ResetPassword';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        forceMaterialTransparency: true,
        title: Text(
          'Notifications',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 5, // replace with actual notification count
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                  'https://via.placeholder.com/150'), // replace with actual image URL
            ),
            title: Text(
              'Notification Title $index', // replace with actual notification title
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'Notification Message $index', // replace with actual notification message
              style: TextStyle(fontSize: 14),
            ),
            trailing: Text(
              '3d ago', // replace with actual timestamp
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            onTap: () {
              // TODO: Implement notification tap logic
            },
          );
        },
      ),
    );
  }
}
