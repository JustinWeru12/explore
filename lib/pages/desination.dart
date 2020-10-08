import 'package:explore/constants/constants.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:slider_button/slider_button.dart';

class DestinationPage extends StatefulWidget {
  final String image, destination, country, abbrev;
  final double rating;

  const DestinationPage(
      {Key key,
      this.image,
      this.destination,
      this.country,
      this.abbrev,
      this.rating})
      : super(key: key);
  @override
  _DestinationPageState createState() => _DestinationPageState();
}

class _DestinationPageState extends State<DestinationPage> {
  IconData icon = Icons.favorite_border;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  kPrimaryColor.withOpacity(0.7),
                  kSecondaryColor,
                ],
              )),
            ),
          ),
          Image.asset(
            widget.image,
            height: size.height * 0.3,
            width: size.width,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment(0, -0.95),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: kTextColor,
                      size: 35,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
                IconButton(
                    icon: Icon(icon, color: Colors.red, size: 35),
                    onPressed: () {
                      setState(() {
                        if (icon == Icons.favorite) {
                          icon = Icons.favorite_border;
                        } else {
                          icon = Icons.favorite;
                        }
                      });
                    })
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                height: size.height * 0.8,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        kPrimaryColor,
                        kSecondaryColor,
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    )),
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                            text: widget.destination
                                                .toUpperCase(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline4
                                                .copyWith(
                                                  fontSize: 22,
                                                  color: kTextColor,
                                                )),
                                        TextSpan(
                                            text: "\n" + widget.country,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline4
                                                .copyWith(
                                                  fontSize: 20,
                                                  color: kTextColor,
                                                )),
                                      ],
                                    ),
                                  ),
                                  Flag(widget.abbrev,
                                      height: 30, width: 50, fit: BoxFit.fill),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                labels(size, Icons.shopping_basket, "48\$",
                                    "Price"),
                                labels(size, Icons.watch, "2 Hours", "Duration")
                              ],
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Description.",
                                  textAlign: TextAlign.left,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4
                                      .copyWith(
                                        fontSize: 25,
                                        color: kTextColor,
                                      ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: RichText(
                                textAlign: TextAlign.justify,
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: "\nEveryone should visit " +
                                            widget.destination,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4
                                            .copyWith(
                                              fontSize: 16,
                                              color: kBackgroundColor,
                                            )),
                                    TextSpan(
                                        text:
                                            " at least once in their lifetime to enjoy the culture.Travel gives us many amazing experiences, but perhaps less obvious is the effect our travels have on the places and people we visit. In Travel Well, we explore how sustainable travel can be a force for good for all involved – good for the environment, for the local people, and for ourselves.",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4
                                            .copyWith(
                                              fontSize: 16,
                                              color: kBackgroundColor,
                                            )),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 18.0, horizontal: 8.0),
                                child: Text(
                                  "Gallery.",
                                  textAlign: TextAlign.left,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4
                                      .copyWith(
                                        fontSize: 25,
                                        color: kTextColor,
                                      ),
                                ),
                              ),
                            ),
                            SingleChildScrollView(
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      FeatureCard(
                                        width: size.width * 0.45,
                                        height: size.width * 0.35,
                                        image: "assets/images/vietnam.jpg",
                                      ),
                                      FeatureCard(
                                        width: size.width * 0.45,
                                        height: size.width * 0.35,
                                        image: "assets/images/thai.jpg",
                                      ),
                                    ],
                                  ),
                                  FeatureCard(
                                    width: size.width * 0.45,
                                    height: size.width * 0.7,
                                    image: "assets/images/japan.jpg",
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ]),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _buildMenu()
          )
        ],
      ),
    );
  }

  Widget labels(size, icon, text, subtext) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.03),
      padding: EdgeInsets.all(kDefaultPadding / 2),
      height: 100,
      width: 200,
      decoration: BoxDecoration(
        color: kBackgroundColor.withOpacity(0.8),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            offset: Offset(5, 10),
            blurRadius: 15,
            color: Colors.black,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 62,
            width: 62,
            decoration: BoxDecoration(
              color: kBackgroundColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(icon),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: text,
                    style: Theme.of(context).textTheme.headline4.copyWith(
                          fontSize: 22,
                          color: kTextColor,
                        )),
                TextSpan(
                    text: "\n$subtext",
                    style: Theme.of(context).textTheme.headline4.copyWith(
                          fontSize: 18,
                          color: kPrimaryColor,
                        )),
              ],
            ),
          ),
          Container()
        ],
      ),
    );
  }

  Widget _buildMenu() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SliderButton(
      height: 50,
      width: 150,
      vibrationFlag: false,
      buttonSize: 40,
      dismissible: false,
      backgroundColor: kBackgroundColor,
      buttonColor: kTextColor,
      action: () {},
      label: Text(
        "Book Now",
        style: TextStyle(
            color: kPrimaryColor,
            fontWeight: FontWeight.w700,
            fontSize: 17),
      ),
      icon: const Icon(
        Icons.arrow_forward_ios,
        color: kPrimaryColor,
        size: 30.0,
      )),
    );
  }
}

class FeatureCard extends StatelessWidget {
  const FeatureCard({
    Key key,
    this.image,
    this.width,
    this.height,
  }) : super(key: key);
  final String image;
  final double width, height;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding / 2,
      ),
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(image),
        ),
      ),
    );
  }
}
