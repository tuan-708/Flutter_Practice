import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const url3 =
    'https://whc.unesco.org/uploads/thumbs/site_0798_0006-1000-627-20120827171714.jpg';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  Row header() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Oeschinen Lake Campground',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
            Text(
              'Kanderssteg, Switzerland',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        Spacer(),
        Icon(
          Icons.star,
          color: Colors.amber,
        ),
        Text('9.6')
      ],
    );
  }

  Row icons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.phone,
              color: Colors.blue,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'CALL',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.near_me,
              color: Colors.blue,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'ROUTE',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.share,
              color: Colors.blue,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'SHARE',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget imageSection() {
    return Stack(children: [
      Image.network(
        url3,
        width: double.infinity,
        height: 200,
        fit: BoxFit.cover,
      ),
      Positioned(
        left: 15,
        bottom: 15,
        child: Text(
          'Picture 1',
          style: TextStyle(
            fontSize: 20, 
            fontWeight: FontWeight.w700,
            color: Colors.white
          ),
        ),
      ),
      Positioned(
          right: 15,
          bottom: 15,
          child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite,
                size: 50,
                color: Colors.red,
              )))
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        imageSection(),
        Padding(
          padding: EdgeInsets.all(16),
          child: header(),
        ),
        Padding(
          padding: EdgeInsets.all(16),
          child: icons(),
        ),
        Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Laboris quis anim commodo sit irure anim minim sint enim. Proident duis aute culpa fugiat exercitation velit et aute labore exercitation. Elit ut cupidatat quis amet tempor cillum exercitation aliqua eu irure. Incididunt commodo sint non nisi nostrud exercitation id veniam aute laboris. Dolor commodo anim nisi consectetur qui culpa amet voluptate officia sit adipisicing dolore.',
            textAlign: TextAlign.justify,
          ),
        )
      ]),
    );
  }
}
