import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(
              thickness: 0.3,
            ),
            // Profile Section
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.blueAccent,
                      child: Text('KW', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(height: 15,),
                    Text('Kristin Watson'),
                  ],
                ),

              ],
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.bookmark_outline_sharp),
              title: Text('My Orders'),
              onTap: () {},
              trailing: Icon(Icons.arrow_forward_ios_sharp),
            ),
            Divider(
              color: Colors.black,
              thickness: 0.1,
            ),
            // Settings Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text('SETTINGS', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('User profile'),
              onTap: () {},
              trailing: Icon(Icons.arrow_forward_ios_sharp),
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Allow push notifications'),
              subtitle: Text('Get updates on your sales, purchases, and key activities.'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text('Payment methods'),
              onTap: () {},
              trailing: Icon(Icons.arrow_forward_ios_sharp),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Delivery address'),
              onTap: () {},
              trailing: Icon(Icons.arrow_forward_ios_sharp),
            ),

            // Help Section
            SizedBox(height: 16),
            Divider(
              thickness: 0.1,
              color: Colors.black,
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text('HELP', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
