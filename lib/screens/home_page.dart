import 'package:flutter/material.dart';
import 'package:mozi/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        // bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // NOTE: header
              Padding(
                padding: EdgeInsets.all(30),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/profil_pic.png",
                      width: 48,
                    ),
                    SizedBox(width: 14),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Good Morning",
                          style: TextStyle(color: greyColor, fontSize: 12),
                        ),
                        Text(
                          "Alex Samm",
                          style: TextStyle(
                            color: whiteColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        // NOTE: do something
                      },
                      icon: Icon(
                        Icons.notifications,
                        color: whiteColor,
                        size: 19,
                      ),
                    ),
                  ],
                ),
              ),
              // NOTE: top movie
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top Movie",
                      style: TextStyle(
                        color: whiteColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        // NOTE: do something
                      },
                      child: Text(
                        "See more",
                        style: TextStyle(
                          color: greyColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12),
              Container(
                height: 306,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(width: 30),
                    CardTopMovie(
                      imageUrl: "assets/images/top_movie1.png",
                      title: "Avatar",
                      rating: 5,
                    ),
                    SizedBox(width: 30),
                    CardTopMovie(
                      imageUrl: "assets/images/top_movie2.png",
                      title: "Joker",
                      rating: 4,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              // NOTE: tv series
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Tv Series",
                      style: TextStyle(
                        color: whiteColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        // NOTE: do something
                      },
                      child: Text(
                        "See more",
                        style: TextStyle(
                          color: greyColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12),
              CardTvSeries(
                imageUrl: "assets/images/tv_series1.png",
                category: "Drama",
                title: "Behind Her Eyes",
                rating: 4,
              ),
              SizedBox(height: 18),
              CardTvSeries(
                imageUrl: "assets/images/tv_series2.png",
                category: "Crime",
                title: "Money Heist",
                rating: 4,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: backgroundColor,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        unselectedItemColor: greyColor,
        selectedItemColor: purpleColor,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view_rounded),
            label: "Grid",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border_rounded),
            label: "Bookmark",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_outlined),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

class CardTopMovie extends StatelessWidget {
  final String imageUrl;
  final String title;
  final int rating;

  CardTopMovie({
    required this.imageUrl,
    required this.title,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 306,
      width: 190,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imageUrl,
              width: 190,
              height: 250,
            ),
          ),
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
              color: whiteColor,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 4),
          Row(
            children: [1, 2, 3, 4, 5].map((e) {
              return Icon(
                Icons.star,
                color: (e <= rating) ? orangeColor : whiteColor,
                size: 18,
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}

class CardTvSeries extends StatelessWidget {
  final String imageUrl;
  final String category;
  final String title;
  final int rating;

  CardTvSeries({
    required this.imageUrl,
    required this.category,
    required this.title,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Image.asset(
            imageUrl,
            width: 76,
          ),
          SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                category,
                style: TextStyle(
                  color: greyColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                title,
                style: TextStyle(
                  color: whiteColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              Row(
                children: [1, 2, 3, 4, 5].map((e) {
                  return Icon(
                    Icons.star,
                    size: 18,
                    color: (e <= rating) ? orangeColor : whiteColor,
                  );
                }).toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
