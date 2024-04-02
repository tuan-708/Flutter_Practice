import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()));
}

class SocialMediaButton extends StatelessWidget {
  final bool filled;
  final IconData? icon;

  const SocialMediaButton({
    super.key,
    this.filled = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(4.0),
      margin: EdgeInsets.all(4),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          color: filled ? Colors.blue : null,
          shape: BoxShape.circle,
          border: Border.all(
              color: filled ? Colors.lightBlueAccent : Colors.black54)),
      child: Icon(
        icon,
        color: filled ? Colors.white : Colors.black54,
      ),
    );
  }
}

class FollowerSection extends StatelessWidget {
  const FollowerSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue.shade100,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 120,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  height: 60,
                  width: 200,
                  child: Stack(
                    children: [
                      Positioned(
                          left: 0,
                          child: Center(
                            child: Container(
                              padding: const EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image.asset(
                                  'assets/images/avatar.png',
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          )),
                        Positioned(
                          left: 40,
                          child: Center(
                            child: Container(
                              padding: const EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image.asset(
                                  'assets/images/avatar.png',
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          )),
                        Positioned(
                          left:80,
                          child: Center(
                            child: Container(
                              padding: const EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image.asset(
                                  'assets/images/avatar.png',
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          )),
                        Positioned(
                          left:120,
                          child: Center(
                            child: Container(
                              padding: const EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image.asset(
                                  'assets/images/avatar.png',
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          )),
                    ],
                  )),
              Text('240 FOLLOWER YOU KNOW',
                  style: TextStyle(
                    color: Colors.grey,
                  ))
            ]),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  Column backgroundSection() {
    return Column(children: [
      Image.asset(
        'assets/images/background.jpeg',
        width: double.infinity,
        height: 250,
        fit: BoxFit.cover,
      ),
    ]);
  }

  Stack wrapProfile() {
    return Stack(children: [
      Positioned(
          left: 20,
          right: 20,
          bottom: 20,
          top: 100,
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Name(),
                    Description(),
                    ListSocial(),
                    FollowInformation(),
                    FollowerSection()
                  ],
                )),
          )),
      roundProfileImage(),
    ]);
  }

  Padding Name() {
    return Padding(
      padding: EdgeInsets.only(top: 70),
      child: Text(
        'Sơn Tùng MTP',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
    );
  }

  Padding Description() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Text(
        'Ca sĩ nổi tiếng nhất Việt Nam',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      ),
    );
  }

  Container FollowInformation() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: const [
                Text(
                  '240',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Đang theo dõi',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: const [
                Text(
                  '5.000.000',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Người theo dõi',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container ListSocial() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          SocialMediaButton(filled: true, icon: Icons.facebook),
          SocialMediaButton(filled: false, icon: Icons.near_me),
          SocialMediaButton(filled: false, icon: Icons.share),
          SocialMediaButton(filled: false, icon: Icons.email),
        ],
      ),
    );
  }

  Positioned roundProfileImage() {
    return Positioned(
        left: 0,
        right: 0,
        top: 50,
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(3.0),
            decoration:
                BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Image.asset(
                'assets/images/avatar.png',
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade50,
      body: Stack(children: [backgroundSection(), wrapProfile()]),
    );
  }
}
