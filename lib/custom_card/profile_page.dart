import 'package:demoproject/custom_card/profile_card.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final VoidCallback toggleTheme;

  const ProfilePage({super.key, required this.toggleTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Custom Widget'),
          // backgroundColor: const Color.fromARGB(255, 255, 202, 219),
          actions: [
            IconButton(
              icon: Icon(
                // Change icon based on theme
                Theme.of(context).brightness == Brightness.dark
                    ? Icons.light_mode
                    : Icons.dark_mode,
              ),
              onPressed: toggleTheme, // Toggle theme on press
            ),
          ],
        ),
        body: const Center(
          child: ProfileCard(
            name: 'Kanhokluck Nimnaul',
            position: 'Programmer',
            email: 'nimnaul_k@silpakorn.edu',
            phoneNumber: '0968815526',
            imageUrl:
                'https://static1.cbrimages.com/wordpress/wp-content/uploads/2022/12/anya-forger-heh.jpg',
          ),
        ));
  }
}
