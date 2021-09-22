import 'package:Archimat/util/list/openhourlist.dart';
import 'package:Archimat/util/list/productgrid.dart';
import 'package:Archimat/util/widgets/divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../theme.dart';

class BusinessList extends StatefulWidget {
  final dynamic shop;
  final dynamic product;
  const BusinessList({Key key, this.shop, this.product}) : super(key: key);

  @override
  _BusinessListState createState() => _BusinessListState();
}

class _BusinessListState extends State<BusinessList> {
  double i = 0;
  List review = [
    {
      'rating': '5.0',
      'review':
          'Love the outcome of the design, fuss free communication and straightforward.',
      'user': {
        'image':
            'https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg',
        'name': 'Mererials',
      }
    },
    {
      'rating': '5.0',
      'review':
          'Love the outcome of the design, fuss free communication and straightforward.Highly recommended.',
      'user': {
        'image':
            'https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg',
        'name': 'Showrooms',
        'category': 'Shop'
      }
    },
    {
      'rating': '5.0',
      'review':
          'Love the outcome of the design, fuss free communication and straightforward.Highly recommended.',
      'user': {
        'image':
            'https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg',
        'name': 'Event',
        'category': 'Shop'
      }
    },
    {
      'rating': '5.0',
      'review':
          'Love the outcome of the design, fuss free communication and straightforward.Highly recommended.',
      'user': {
        'image':
            'https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg',
        'name': 'Mererials',
        'category': 'Shop'
      }
    },
    {
      'rating': '5.0',
      'review':
          'Love the outcome of the design, fuss free communication and straightforward.Highly recommended.',
      'user': {
        'image':
            'https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg',
        'name': 'Showrooms',
        'category': 'Shop'
      }
    },
    {
      'rating': '5.0',
      'review':
          'Love the outcome of the design, fuss free communication and straightforward.Highly recommended.',
      'user': {
        'image':
            'https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg',
        'name': 'Event',
        'category': 'Shop'
      }
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            decoration: BoxDecoration(
              border: Border.all(width: 0.5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      i = 0;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    decoration: i != 0
                        ? BoxDecoration(
                            color: AppTheme().white,
                          )
                        : BoxDecoration(
                            color: AppTheme().l1black,
                            borderRadius: BorderRadius.circular(25),
                            border:
                                Border.all(color: AppTheme().lblack, width: 1)),
                    child: Text(
                      'Listing',
                      style: AppTheme().primaryTextStyle(i == 0 ? true : false),
                    ),
                  ),
                ),
                // GestureDetector(
                //   onTap: () {
                //     setState(() {
                //       i = 1;
                //     });
                //   },
                //   child: Container(
                //     padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                //     decoration: i != 1
                //         ? BoxDecoration(
                //             color: AppTheme().white,
                //           )
                //         : BoxDecoration(
                //             color: AppTheme().l1black,
                //             borderRadius: BorderRadius.circular(25),
                //             border:
                //                 Border.all(color: AppTheme().lblack, width: 1)),
                //     child: Text(
                //       'Reviews',
                //       style: AppTheme().primaryTextStyle(i == 1 ? true : false),
                //     ),
                //   ),
                // ),
                // GestureDetector(
                //   onTap: () {
                //     setState(() {
                //       i = 2;
                //     });
                //   },
                //   child: Container(
                //     padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                //     decoration: i != 2
                //         ? BoxDecoration(
                //             color: AppTheme().white,
                //           )
                //         : BoxDecoration(
                //             color: AppTheme().l1black,
                //             borderRadius: BorderRadius.circular(25),
                //             border:
                //                 Border.all(color: AppTheme().lblack, width: 1)),
                //     child: Text(
                //       'Shop',
                //       style: AppTheme().primaryTextStyle(i == 2 ? true : false),
                //     ),
                //   ),
                // ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      i = 3;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                    decoration: i != 3
                        ? BoxDecoration(
                            color: AppTheme().white,
                          )
                        : BoxDecoration(
                            color: AppTheme().l1black,
                            borderRadius: BorderRadius.circular(25),
                            border:
                                Border.all(color: AppTheme().lblack, width: 1)),
                    child: Text(
                      'About',
                      style: AppTheme().primaryTextStyle(i == 3 ? true : false),
                    ),
                  ),
                ),
              ],
            ),
          ),
          i == 0
              ? ListingPage(data: widget.product)
              : i == 1
                  ? BusinessReviews(
                      data: review,
                    )
                  : i == 2
                      ? Container()
                      : i == 3
                          ? BusinessAboutPage(
                              data: widget.shop,
                            )
                          : Container()
        ],
      ),
    );
  }
}

class ListingPage extends StatefulWidget {
  final dynamic data;
  const ListingPage({Key key, this.data}) : super(key: key);

  @override
  _ListingPageState createState() => _ListingPageState();
}

class _ListingPageState extends State<ListingPage> {
  List product = [
    {
      'image':
          'https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg',
      'name': 'Mererials',
      'category': 'Shop'
    },
    {
      'image':
          'https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg',
      'name': 'Showrooms',
      'category': 'Shop'
    },
    {
      'image':
          'https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg',
      'name': 'Event',
      'category': 'Shop'
    },
    {
      'image':
          'https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg',
      'name': 'Mererials',
      'category': 'Shop'
    },
    {
      'image':
          'https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg',
      'name': 'Showrooms',
      'category': 'Shop'
    },
    {
      'image':
          'https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg',
      'name': 'Event',
      'category': 'Shop'
    },
  ];
  @override
  void initState() {
    print('widget.data===========================================');

    print(widget.data);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.27,
                padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                decoration: BoxDecoration(
                    color: AppTheme().white,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: AppTheme().lblack, width: 1)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Filters',
                      style: TextStyle(
                        fontFamily: 'Nexa',
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/images/Filter.svg',
                      width: 25,
                      color: AppTheme().black,
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                width: MediaQuery.of(context).size.width * 0.27,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppTheme().white,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: AppTheme().lblack, width: 1)),
                child: Text(
                  'Status: All',
                  style: TextStyle(
                    fontFamily: 'Nexa',
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.35,
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                decoration: BoxDecoration(
                    color: AppTheme().white,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: AppTheme().lblack, width: 1)),
                child: Text(
                  'In : All Categories',
                  style: TextStyle(
                    fontFamily: 'Nexa',
                  ),
                ),
              ),
            ],
          ),
        ),
        ProductListGride(
          data: widget.data,
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}

class BusinessAboutPage extends StatefulWidget {
  final dynamic data;
  const BusinessAboutPage({Key key, this.data}) : super(key: key);

  @override
  _BusinessAboutPageState createState() => _BusinessAboutPageState();
}

class _BusinessAboutPageState extends State<BusinessAboutPage> {
  bool aboutText = true;
  List openingtime = [];
  String about =
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,';
  List opening = [
    {'name': 'Monday', 'start': '6', 'end': '9'},
    {'name': 'Tuesday', 'start': '6', 'end': '9'},
    {'name': 'Wensday', 'start': '6', 'end': '9'},
    {'name': 'Thursday', 'start': '6', 'end': '9'},
    {'name': 'Friday', 'start': '6', 'end': '9'},
    {'name': 'Saturday', 'start': '', 'end': ''},
    {'name': 'Sunday', 'start': '', 'end': ''},
  ];
  @override
  void initState() {
    print('shopTime=======================');
    print(widget.data['shoptimes']);
    setState(() {
      openingtime = widget.data['shoptimes'];
    });
    print('shopTime=======================');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About Us',
                style: TextStyle(
                  fontFamily: 'Nexa',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                widget.data['desc'].length > 200 && aboutText
                    ? widget.data['desc'].toString().substring(0, 200) +
                        ' .....\n '
                    : widget.data['desc'] + '\n',
                style: TextStyle(
                  fontFamily: 'Nexa',
                ),
              ),
              widget.data['desc'].length > 200 && aboutText
                  ? GestureDetector(
                      child: Text(
                        'More',
                        style: TextStyle(
                          color: AppTheme().blue,
                          fontFamily: 'Nexa',
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          aboutText = false;
                        });
                      },
                    )
                  : widget.data['desc'].length > 200
                      ? GestureDetector(
                          child: Text(
                            'less',
                            style: TextStyle(
                              color: AppTheme().blue,
                              fontFamily: 'Nexa',
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              aboutText = true;
                            });
                          },
                        )
                      : Container(),
            ],
          ),
        ),
        Divider_Widgets(),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width * 0.4,
                child: Text(
                  'Company',
                  style: TextStyle(
                      fontFamily: 'Nexa', fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width * 0.4,
                child: Text(
                  widget.data['company']['title'],
                  style: TextStyle(
                    fontFamily: 'Nexa',
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider_Widgets(),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width * 0.4,
                child: Text(
                  'Year',
                  style: TextStyle(
                      fontFamily: 'Nexa', fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width * 0.4,
                child: Text(
                  '2011',
                  style: TextStyle(
                    fontFamily: 'Nexa',
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider_Widgets(),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width * 0.4,
                child: Text(
                  'Registration No.',
                  style: TextStyle(
                      fontFamily: 'Nexa', fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width * 0.4,
                child: Text(
                  '123456789',
                  style: TextStyle(
                    fontFamily: 'Nexa',
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider_Widgets(),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width * 0.4,
                child: Text(
                  'Website',
                  style: TextStyle(
                      fontFamily: 'Nexa', fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width * 0.4,
                child: Text(
                  widget.data['website'],
                  style: TextStyle(
                    fontFamily: 'Nexa',
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider_Widgets(),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width * 0.4,
                child: Text(
                  'Email',
                  style: TextStyle(
                      fontFamily: 'Nexa', fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width * 0.4,
                child: Text(
                  widget.data['email'],
                  style: TextStyle(
                    fontFamily: 'Nexa',
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider_Widgets(),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width * 0.4,
                child: Text(
                  'Mobile',
                  style: TextStyle(
                      fontFamily: 'Nexa', fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width * 0.4,
                child: Text(
                  widget.data['phone'],
                  style: TextStyle(
                    fontFamily: 'Nexa',
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider_Widgets(),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topLeft,
                width: MediaQuery.of(context).size.width * 0.3,
                child: Text(
                  'Opening Hours',
                  style: TextStyle(
                      fontFamily: 'Nexa', fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width * 0.5,
                child: openingtime == null || openingtime == []
                    ? Text(
                        'close',
                        style: TextStyle(
                          fontFamily: 'Nexa',
                        ),
                      )
                    : OpenHourList(
                        data: openingtime,
                      ),
              ),
            ],
          ),
        ),
        Divider_Widgets(),
        Container(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Map',
                style: TextStyle(
                  fontFamily: 'Nexa',
                ),
              ),
              Image.asset(
                'assets/images/map.png',
                width: MediaQuery.of(context).size.width,
              )
            ],
          ),
        ),
        Divider_Widgets(),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 0, 5),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppTheme().black)),
                child: SvgPicture.asset(
                  'assets/images/facebook.svg',
                  color: AppTheme().black,
                  width: 10,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppTheme().black)),
                child: SvgPicture.asset(
                  'assets/images/insta.svg',
                  color: AppTheme().black,
                  width: 20,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppTheme().black)),
                child: SvgPicture.asset(
                  'assets/images/word.svg',
                  color: AppTheme().black,
                  width: 20,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class BusinessReviews extends StatefulWidget {
  final dynamic data;
  const BusinessReviews({Key key, this.data}) : super(key: key);

  @override
  _BusinessReviewsState createState() => _BusinessReviewsState();
}

class _BusinessReviewsState extends State<BusinessReviews> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: //     :
          ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: widget.data.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey[200],
                    backgroundImage:
                        //  image != null && imageshow == true
                        //     ? NetworkImage(Config.url + '/' + image)
                        //     :
                        NetworkImage(widget.data[index]['user']['image']),
                  ),
                  title: Text(
                    widget.data[index]['user']['name'],
                    style: TextStyle(
                      fontFamily: 'Nexa',
                    ),
                  ),
                  subtitle: Text(
                    widget.data[index]['review'],
                    style: TextStyle(
                      fontFamily: 'Nexa',
                    ),
                  ),
                  trailing: Text(
                    widget.data[index]['rating'],
                    style: TextStyle(
                      fontFamily: 'Nexa',
                    ),
                  ),
                ),
              ),
              Divider_Widgets(),
            ],
          );
        },
      ),
    );
  }
}
