import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tendollar_app/login.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  PageController pageController = PageController();
  Timer? _timer;
  int currentPageIndex = 0;

  startAnimate() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (currentPageIndex < 3) {
        pageController.nextPage(
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInOut,
        );
      } else {
        pageController.animateToPage(
          0,
          duration: Duration(milliseconds: 200),
          curve: Curves.bounceOut,
        );
      }
    });
  }

  @override
  initState() {
    startAnimate();
    super.initState();
  }

  @override
  void dispose() {
    print("AM close");
    pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  List<Map> onboardingData = [
    {
      "title": "Welcome to 10dollar!",
      "subTitle":
          "Get ready to dive into the vibrant world of music! Connect with fellow musicians, showcase your talent, and earn rewards for your creativity.",
      "image": "assets/images/onboarding1.png",
    },
    {
      "title": "Discover & Share Your Music",
      "subTitle": """Explore a diverse range of musical styles and genres. 
Share your own tracks, videos, and updates 
with the community to gain exposure and feedback.
""",
      "image": "assets/images/onboarding2.png",
    },
    {
      "title": "Engage with Your Audience",
      "subTitle": """Receive real-time feedback from your peers. 
Upload videos for voting and watch your popularity soar. 
Win weekly prizes for being the top-voted artist!
""",
      "image": "assets/images/onboarding3.png",
    },

    {
      "title": "Stake Your Claim",
      "subTitle": """Put your faith in your fellow musicians! Stake on
 videos you believe in, and earn rewards when they succeed. 
Be part of the excitement and support the community.""",
      "image": "assets/images/onboarding4.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 150),
          SizedBox(
            height: 550,
            child: PageView.builder(
              controller: pageController,
              itemCount: onboardingData.length,
              onPageChanged: (value) {
                setState(() {
                  currentPageIndex = value;
                });
              },
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    spacing: 20,
                    children: [
                      Image.asset(onboardingData[index]['image']),
                      Text(
                        onboardingData[index]["title"],
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: "Kreon",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        onboardingData[index]["subTitle"],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Kreon",
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 5,
            children: [
              for (int i = 0; i < onboardingData.length; i++)
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: i <= currentPageIndex
                        ? Color(0xff7DF9FF)
                        : Colors.grey,
                  ),
                ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: () {
                if (currentPageIndex < 3) {
                  pageController.nextPage(
                    duration: Duration(milliseconds: 200),
                    curve: Curves.bounceIn,
                  );
                } else {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                }
              },
              child: Container(
                height: 60,
                width: 60,
                margin: EdgeInsets.only(right: 20, top: 40),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff7DF9FF),
                ),
                child: Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
