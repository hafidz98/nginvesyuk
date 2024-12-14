import 'package:flutter/material.dart';
import 'package:nginvesyuk/feature/home/home_controller.dart';
import 'package:nginvesyuk/feature/home/home_repository.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final HomeController _homeController = HomeController(HomeRepository());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.deepPurpleAccent, // Set AppBar color
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white,), // Back button
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 48,
                backgroundColor: Colors.deepPurpleAccent,
                child: Icon(Icons.person, color: Colors.white, size: 64),
              ),
              const SizedBox(height: 24),
              Card.outlined(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.badge_outlined),
                        title: const Text('ID Investor'),
                        subtitle: FutureBuilder(
                          future: _homeController.getUserData(),
                          builder: (context, snapshot) => Text(
                            snapshot.connectionState == ConnectionState.done
                                ? _homeController.userData?.investorId ??
                                    'investor_id'
                                : 'investor_id',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const Divider(),
                      ListTile(
                        leading: const Icon(Icons.alternate_email),
                        title: const Text('Username'),
                        subtitle: FutureBuilder(
                          future: _homeController.getUserData(),
                          builder: (context, snapshot) => Text(
                            snapshot.connectionState == ConnectionState.done
                                ? _homeController.userData?.username ??
                                    'username'
                                : 'username',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const Divider(),
                      ListTile(
                        leading: const Icon(Icons.person_outline),
                        title: const Text('Nama'),
                        subtitle: FutureBuilder(
                          future: _homeController.getUserData(),
                          builder: (context, snapshot) => Text(
                            snapshot.connectionState == ConnectionState.done
                                ? _homeController.userData?.name ??
                                    'Nama Pengguna'
                                : 'Nama Pengguna',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
