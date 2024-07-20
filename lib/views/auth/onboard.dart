import 'package:agri/theme/theme.dart';
import 'package:agri/widgets/carousal_onboard.dart';
import 'package:flutter/material.dart';

class OnboardPage extends StatefulWidget {
  static const routeID = '/onboardPage';
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(
          horizontal: 22,
          vertical: 10,
        ),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
          ),
          child: const Text(
            "GET STARTED",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w900,
              color: MyColors.accentColor,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 22,
                vertical: 12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.network(
                          "https://uxwing.com/wp-content/themes/uxwing/download/brands-and-social-media/google-gemini-icon.png",
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          "Powered by Gemini",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: const TextSpan(children: [
                      TextSpan(
                        text: "Hello,\n",
                        style: TextStyle(
                          fontFamily: "Rubik",
                          height: 1.5,
                          wordSpacing: 0.5,
                          fontSize: 18,
                          color: MyColors.primaryColor,
                        ),
                      ),
                      TextSpan(
                        text: "I am Agri,",
                        style: TextStyle(
                          fontFamily: "Rubik",
                          height: 1.5,
                          wordSpacing: 0.5,
                          fontSize: 28,
                          color: MyColors.accentColor,
                        ),
                      ),
                      TextSpan(
                        text: "\na highly advanced agricultural bot.\n",
                        style: TextStyle(
                          fontFamily: "Rubik",
                          height: 1.5,
                          wordSpacing: 0.5,
                          fontSize: 18,
                          color: MyColors.primaryColor,
                        ),
                      ),
                      TextSpan(
                        text:
                            "I am here to assist you with your farming needs.",
                        style: TextStyle(
                          fontFamily: "Rubik",
                          height: 1.5,
                          wordSpacing: 0.5,
                          fontSize: 18,
                          color: MyColors.primaryColor,
                        ),
                      ),
                    ]),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const SizedBox(
                    width: 260,
                    child: Text(
                      "I offer expertise in crop health, soil condition, and pest management. Here’s what I can do:",
                      style: TextStyle(
                        color: MyColors.primaryColor,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 180,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                ),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: carouselData
                      .map((item) => CarouselItemWidget(item: item))
                      .toList(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
