import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebaseapplication/ui/auth/login_screen.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final List<Map<String, String>> mockPosts = [
    {
      'author': 'User-xy78z',
      'content': 'This is the first post content. Excited to share this!',
      'imageUrl': 'https://rimage.gnst.jp/livejapan.com/public/article/detail/a/00/02/a0002532/img/basic/a0002532_main.jpg',
      'profileImageUrl': 'https://nexusbc.in/wp-content/uploads/2020/10/pexels-photo-875862.png',
    },
    {
      'author': 'User-24r43',
      'content': 'Had a great day exploring the city!',
      'imageUrl': 'https://handluggageonly.co.uk/wp-content/uploads/2019/03/6I9A2690.jpg',
      'profileImageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtzqAdKus01QKR66Dim1ZFtGhpYh6Be_YZGg&s',
    },
    {
      'author': 'User-12gfe (You)',
      'content': 'Loving the new Flutter features in the latest release!',
      'imageUrl': 'https://cdn.cssauthor.com/wp-content/uploads/2022/08/FlutLab.jpg?strip=all&lossy=1&ssl=1',
      'profileImageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoiOoK1tdo-HU3ynNiYL3de9sm6pmzJ3bk3Q&s',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text('Posts'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await _auth.signOut();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
          )
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: mockPosts.length,
        itemBuilder: (context, index) {
          var post = mockPosts[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(post['profileImageUrl']!),
                        backgroundColor: Colors.transparent,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        post['author']!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  if (post['imageUrl'] != null)
                    Image.network(post['imageUrl']!),
                  const SizedBox(height: 10),
                  Text(
                    post['content']!,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.thumb_up_alt_outlined),
                        onPressed: () {
                          // Handle like action
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.comment_outlined),
                        onPressed: () {
                          // Handle comment action
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
