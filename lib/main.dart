import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parallax Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double rateZero = 0;
  double rateOne = 0;
  double rateTwo = 0;
  double rateThree = 0;
  double rateFour = 0;
  double rateFive = 0;
  double rateSix = 0;
  double rateSeven = 0;
  double rateEight = 90;

  String asset = '';
  // double top = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   title: Text(''),
      // ),
      body: NotificationListener(
        onNotification: (value) {
          if(value is ScrollUpdateNotification) {
            //only if scroll update notification is triggered
            setState(() {
              rateEight -= value.scrollDelta! / 1; 
              rateSeven -= value.scrollDelta! / 1.5; 
              rateSix -= value.scrollDelta! / 2; 
              rateFive -= value.scrollDelta! / 2.5; 
              rateFour -= value.scrollDelta! / 3; 
              rateThree -= value.scrollDelta! / 3.5; 
              rateTwo -= value.scrollDelta! / 4; 
              rateOne -= value.scrollDelta! / 4.5; 
              rateZero -= value.scrollDelta! / 5; 
            });
          }
          return true;
        },
        child: Stack(
          children: [
            ParallaxWidget(top: rateZero, asset: "parallax0"),
            ParallaxWidget(top: rateOne, asset: "parallax1"),
            ParallaxWidget(top: rateTwo, asset: "parallax2"),
            ParallaxWidget(top: rateThree, asset: "parallax3"),
            ParallaxWidget(top: rateFour, asset: "parallax4"),
            ParallaxWidget(top: rateFive, asset: "parallax5"),
            ParallaxWidget(top: rateSix, asset: "parallax6"),
            ParallaxWidget(top: rateSeven, asset: "parallax7"),
            ParallaxWidget(top: rateEight, asset: "parallax8"),
            ListView(
              children: <Widget>[
                Container(
                  height: 600,
                  color: Colors.transparent,
                ),
                Container(
                  color: const Color(0xff210002),
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 70),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Parallax In",
                        style: TextStyle(
                            fontSize: 30,
                            fontFamily: "MontSerrat-ExtraLight",
                            letterSpacing: 1.8,
                            color: Color(0xffffaf00)),
                      ),
                      Text(
                        "Flutter",
                        style: TextStyle(
                            fontSize: 51,
                            fontFamily: "MontSerrat-Regular",
                            letterSpacing: 1.8,
                            color: Color(0xffffaf00)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 190,
                        child: Divider(
                          height: 1,
                          color: Color(0xffffaf00),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Made By",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Montserrat-Extralight",
                          letterSpacing: 1.3,
                          color: Color(0xffffaf00),
                        ),
                      ),
                      Text(
                        "Prem Singh",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Montserrat-Regular",
                          letterSpacing: 1.8,
                          color: Color(0xffffaf00),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        )
        )
    );
  }
}

class ParallaxWidget extends StatelessWidget {
  const ParallaxWidget({super.key, required this.top, required this.asset});

  final double top;
  final String asset;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      top: top,
      child: SizedBox(
        height: 550,
        width: MediaQuery.of(context).size.width,
        child: Image.asset("assets/images/$asset.png", fit: BoxFit.cover),
      ),
    );
  }
}
