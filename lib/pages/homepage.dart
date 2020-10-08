import 'package:explore/constants/constants.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:explore/pages/desination.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TabController _tabController;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SingleChildScrollView(
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
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 35,
                  ),
                  search(size),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Discover.",
                      style: Theme.of(context).textTheme.headline2.copyWith(
                          color: kTextColor, fontFamily: "HelveticaNeueCyr"),
                    ),
                  ),
                  Container(
                    width: size.width * 0.7,
                    child: TabBar(
                        labelColor: kBackgroundColor,
                        indicatorColor: kBackgroundColor,
                        indicatorWeight: 5,
                        isScrollable: true,
                        unselectedLabelColor: Colors.white,
                        controller: _tabController,
                        labelStyle: Theme.of(context)
                            .textTheme
                            .headline4
                            .copyWith(
                                fontSize: 20,
                                color: kTextColor,
                                fontFamily: "HelveticaNeueCyr"),
                        tabs: [
                          Tab(
                            text: "Popular",
                          ),
                          Tab(
                            text: "Rating",
                          ),
                          Tab(
                            text: "Recent",
                          )
                        ]),
                  ),
                  Container(
                    height: size.width * 0.8,
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: [
                          DestinationCard(
                              image: "assets/images/spain.jpg",
                              destination: "Barcelona",
                              country: "Spain",
                              abbrev: 'ES',
                              rating: 4.5),
                          DestinationCard(
                              image: "assets/images/bali.jpg",
                              destination: "Bali",
                              country: "Indonesia",
                              abbrev: 'ID',
                              rating: 5),
                          DestinationCard(
                              image: "assets/images/street.jpg",
                              destination: "Venice",
                              country: "Italy",
                              abbrev: 'IT',
                              rating: 4.5),
                          DestinationCard(
                              image: "assets/images/japan.jpg",
                              destination: "Hokkaido",
                              country: "Japan",
                              abbrev: 'JP',
                              rating: 4.5),
                          DestinationCard(
                              image: "assets/images/ice.jpg",
                              destination: "Alaska",
                              country: "United States",
                              abbrev: 'US',
                              rating: 4.5),
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 5.0),
                    child: Text("Book With us",
                        style: Theme.of(context).textTheme.headline4.copyWith(
                            fontSize: 25,
                            color: kTextColor,
                            fontWeight: FontWeight.w600)),
                  ),
                  Container(
                    height: size.width * 0.68,
                    child: ListView(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: [
                          Services(
                            image: "assets/icons/cookie.svg",
                            service: "Food",
                            description:
                                "More than 1000 coffee shops and diners.",
                          ),
                          Services(
                            image: "assets/icons/flower.svg",
                            service: "Nature",
                            description:
                                "beautiful scenaries showing the best of Mother Natue.",
                          ),
                          Services(
                            image: "assets/icons/sun.svg",
                            service: "Sunny Beaches",
                            description:
                                "More than 500 Tropical Beaches at your reach.",
                          ),
                          Services(
                            image: "assets/icons/heart-icon.svg",
                            service: "Favorites",
                            description:
                                "Revisit destinations that were just too breath taking.",
                          ),
                          Services(
                            image: "assets/icons/user-icon.svg",
                            service: "Invite",
                            description:
                                "Invite your friends to join you in the next trip.",
                          ),
                          Services(
                            image: "assets/icons/more.svg",
                            service: "More",
                            description: "With so much morw to offer.",
                          )
                        ]),
                  )
                ]),
          ),
        ),
      ),
    );
  }

  Widget search(size) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          height: 54,
          width: size.width * 0.75,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 10),
                blurRadius: 50,
                color: kPrimaryColor.withOpacity(0.23),
              ),
            ],
          ),
          child: TextField(
            style: TextStyle(color: kPrimaryColor),
            autofocus: false,
            onChanged: (value) {},
            decoration: InputDecoration(
              hintText: "Search",
              hintStyle: TextStyle(
                fontSize: 20,
                color: kPrimaryColor.withOpacity(0.5),
              ),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              suffixIcon: Icon(
                Icons.search,
                size: 30,
                color: kBackgroundColor,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: kBackgroundColor,
                border: Border.all(color: kBackgroundColor),
                shape: BoxShape.circle,
                image:
                    DecorationImage(image: AssetImage("assets/images/1.png"))),
          ),
        ),
      ],
    );
  }
}

class DestinationCard extends StatelessWidget {
  const DestinationCard(
      {Key key,
      this.image,
      this.destination,
      this.country,
      this.abbrev,
      this.rating})
      : super(key: key);

  final String image, destination, country, abbrev;
  final double rating;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DestinationPage(
                      image: image,
                      destination: destination,
                      country: country,
                      abbrev: abbrev,
                      rating: rating,
                    )));
      },
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding / 2),
        child: Container(
          width: size.width * 0.5,
          height: size.width * 0.5,
          decoration: BoxDecoration(
            color: kTertiaryColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Image.asset(
                    image,
                    height: size.width * 0.5,
                    width: size.width * 0.5,
                    fit: BoxFit.cover,
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "$destination\n".toUpperCase(),
                              style: Theme.of(context).textTheme.button),
                          TextSpan(
                            text: "$country",
                            style: TextStyle(
                              color: kBackgroundColor.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Flag(abbrev, height: 30, width: 50, fit: BoxFit.fill),
                  ],
                ),
              ),
              Spacer(),
              Divider(color: kBackgroundColor),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 8.0, left: 5.0, right: 8.0),
                child: Row(
                  children: [
                    SmoothStarRating(
                        allowHalfRating: false,
                        onRated: (v) {},
                        starCount: 5,
                        rating: rating,
                        size: 25.0,
                        isReadOnly: true,
                        filledIconData: Icons.star,
                        halfFilledIconData: Icons.star_half,
                        color: Colors.orange,
                        spacing: 0.0),
                    Spacer(),
                    Text(rating.toString(),
                        style: Theme.of(context).textTheme.button),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Services extends StatelessWidget {
  final String image, service, description;

  const Services({Key key, this.image, this.service, this.description})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding / 2),
      child: Container(
        height: size.width * 0.18,
        decoration: BoxDecoration(
          color: kTertiaryColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: SvgPicture.asset(image),
                onPressed: () {},
              ),
            ],
          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: "$service\n",
                        style: Theme.of(context).textTheme.headline4.copyWith(
                              fontSize: 20,
                              color: kTextColor,
                            )),
                    TextSpan(
                      text: "$description",
                      style: TextStyle(
                        color: kBackgroundColor.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                color: kBackgroundColor,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
