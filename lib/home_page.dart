import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const url3 =
    'https://whc.unesco.org/uploads/thumbs/site_0798_0006-1000-627-20120827171714.jpg';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> images = [
    "https://khoanh24.com/uploads/w750//2016/11/17/20-hinh-nen-thanh-pho-tuyet-dep-full-hd582d84de6dd35_719d169e572fa7eec38f6b92988ead69.jpg",
    "https://gcs.tripi.vn/public-tripi/tripi-feed/img/474068FYW/anh-nen-dep-thanh-pho-ve-dem_022600898.jpg",
    "https://img6.thuthuatphanmem.vn/uploads/2022/02/09/anh-bia-dep-thanh-pho-ho-chi-minh_031024011.jpg",
    "https://antimatter.vn/wp-content/uploads/2022/04/hinh-nen-thanh-pho-ve-dem.jpg"
  ];

  int index = 0;
  String imageCurrent = "https://khoanh24.com/uploads/w750//2016/11/17/20-hinh-nen-thanh-pho-tuyet-dep-full-hd582d84de6dd35_719d169e572fa7eec38f6b92988ead69.jpg";


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
    return Stack(alignment: Alignment.center, children: [
      Image.network(
        imageCurrent,
        width: double.infinity,
        height: 200,
        fit: BoxFit.cover,
      ),
      Positioned(
          left: 15,
          bottom: 15,
          child: IconButton(
            onPressed: () {
              print('Hello bay');
              setState(() {
                if(index == 0 ){
                  imageCurrent = images[images.length-1];
                  index = images.length-1;
                  return;
                }
                if(index < images.length -1){
                  imageCurrent= images[0];
                  index = 0;
                  return;
                }
                index--;
                imageCurrent= images[index-1];
                
              });
            },
            icon: Icon(
              Icons.arrow_circle_left,
              size: 40,
              color: Colors.lightBlue,
            ),
          )),
      Positioned(
          bottom: 15,
          child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.heart_broken,
                size: 50,
                color: Colors.amber,
              ))),
      Positioned(
          right: 15,
          bottom: 15,
          child: IconButton(
            onPressed: () {
              setState(() {
                if(index >= images.length -2){
                  imageCurrent = images[0];
                  index = 0;
                  return;
                }
                index++;
                imageCurrent= images[index+1];
              });
            },
            icon: Icon(
              Icons.arrow_circle_right,
              size: 40,
              color: Colors.lightBlue,
            ),
          )),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    print('index: ${index}');

    return Scaffold(
      appBar: AppBar(
        title: Text('Example'),
      ),
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
