import 'package:dicoding_books/recent_widget.dart';
import 'package:dicoding_books/utils.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _categories = [
    'All bookw',
    'Comic',
    'Novel',
    'Manga',
    'Fairy Tail'
  ];
  int _isSelected = 0;
  @override
  Widget build(BuildContext context) {
    Widget categories(int index) {
      return InkWell(
        onTap: () {
          print(index);
          setState(() {
            _isSelected = index;
          });
        },
        child: Container(
            margin: EdgeInsets.only(top: 30, right: 12),
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            decoration: BoxDecoration(
              color: _isSelected == index ? greenColor : transparentColor,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              _categories[index],
              style: semiBoldText14.copyWith(
                  color: _isSelected == index ? whiteColor : greyColor),
            )),
      );
    }

    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: EdgeInsets.only(
              right: 30,
              top: 30,
            ),
            child: Column(
              children: [
                // header
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/profile-pic.png'),
                        ),
                      ),
                    ),
                    // const SizedBox(width: 8),
                    const Gap(8),
                    // const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello Bang Jsgo',
                          style: semiBoldText16,
                        ),
                        Text(
                          'Morning bro',
                          style: regularText14.copyWith(color: greyColor),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.menu_open,
                      color: Colors.black,
                      size: 24.0,
                    ),
                  ],
                ),

                // search
                SizedBox(height: 30),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Find your Favorite Book',
                      hintStyle: mediumText12.copyWith(color: greyColor),
                      fillColor: greyColorSearchField,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      isCollapsed: true,
                      contentPadding:
                          EdgeInsets.all(18), // padding tulisan pada search
                      suffixIcon: InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: greenColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                          child: Icon(
                            Icons.search_rounded,
                            color: whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 30),
                // recent
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Row(children: [
                    RecentBook(
                      image: 'assets/images/recentbook_1.png',
                      title: 'The Magic',
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    RecentBook(
                      image: 'assets/images/recentbook_2.png',
                      title: 'The MArtian',
                    ),
                  ]),
                ),

                Row(
                  children: [],
                ),
                SingleChildScrollView(
                  padding: EdgeInsets.only(left: 30),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _categories
                        .asMap()
                        .entries
                        .map((MapEntry map) => categories(map.key))
                        .toList(),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
