import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChallengeScreen extends StatelessWidget {
  const ChallengeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cloud Quest'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => FirebaseAuth.instance.signOut(),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Signed in as: ${user?.email ?? user?.uid}'),
          const SizedBox(height: 20),
          Text(
            "Today's Challenge",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          const Text('Challenge prompt will load here.'),
          const SizedBox(height: 24),

          FilledButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Complete button clicked!')),
              );
            },
            child: const Text('Complete Challenge'),
          ),

          const Divider(height: 40),

          Text(
            'Ask the Quest Coach',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          TextField(
            maxLength: 300,
            decoration: const InputDecoration(
              labelText: 'Ask for a hint...',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 8),
          OutlinedButton(onPressed: () {}, child: const Text('Get Hint')),
        ],
      ),
    );
  }
}
