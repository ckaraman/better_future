import 'package:better_future/pages/forms/education_register_form.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class EducationsPage extends StatefulWidget {
  const EducationsPage({Key? key}) : super(key: key);

  @override
  _EducationsPageState createState() => _EducationsPageState();
}

CarouselController _carouselController = CarouselController();

class _EducationsPageState extends State<EducationsPage> {
  int _current = 0;

  final List<dynamic> _pages = [
    {
      'title': 'Güneş Enerjisi',
      'image': "https://wallpaperaccess.com/full/1663640.jpg",
    },
    {
      'title': 'Rüzgar Enerjisi',
      'image':
          "http://wonderfulengineering.com/wp-content/uploads/2014/09/wind-turbine-pictures-2.jpg",
    },
    {
      'title': 'Hidroelektrik Enerji',
      'image':
          'https://media.istockphoto.com/photos/seebe-hydroelectric-dam-near-exshaw-at-night-picture-id687333564?k=20&m=687333564&s=612x612&w=0&h=0ccqKUw3sGCG7PacdyKZGUJfwTk1Y3w8lp7dg4EKbk8=',
    },
    {
      'title': 'Jeotermal Enerji',
      'image':
          'https://www.enerjiportali.com/wp-content/uploads/2019/03/termik-santral10.png',
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          fit: StackFit.expand,
          children: [
            //Image.network(_pages[_current]['image'], fit: BoxFit.fill),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                      Colors.grey.shade50.withOpacity(1),
                      Colors.grey.shade50.withOpacity(1),
                      Colors.grey.shade50.withOpacity(1),
                      Colors.grey.shade50.withOpacity(1),
                      Colors.grey.shade50.withOpacity(0.0),
                      Colors.grey.shade50.withOpacity(0.0),
                      Colors.grey.shade50.withOpacity(0.0),
                      Colors.grey.shade50.withOpacity(0.0),
                    ])),
              ),
            ),
            Positioned(
              bottom: 50,
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 500.0,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.70,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
                carouselController: _carouselController,
                items: _pages.map((movie) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Image.network(movie['image'],
                                      fit: BoxFit.fitHeight),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                movie['title'],
                                style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              // rating
                              const SizedBox(height: 20),
                              Container(
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    textStyle: const TextStyle(fontSize: 20),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const EducationRegisterForm()));
                                  },
                                  child: const Text(
                                    'Konuyu Seç',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              AnimatedOpacity(
                                duration: const Duration(milliseconds: 500),
                                opacity: _current == _pages.indexOf(movie)
                                    ? 1.0
                                    : 0.0,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [],
                                  ),
                                ),
                              ),
                            ],
                          ));
                    },
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
