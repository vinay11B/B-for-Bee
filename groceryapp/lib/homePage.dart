

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceryapp/Categories_tile.dart';
import 'package:groceryapp/TopProduct_tile.dart';
class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();

}

class _homePageState extends State<homePage> {
  int selectedOptionIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(icon: Icon(FontAwesomeIcons.gripLines),
            onPressed: () {},
            color: Colors.grey,
        tooltip:'Menu'),
        actions: _buildActions(),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Center(child: Image.asset('assets/banner.png')),
              _buildCategories(),
              _buildTopProducts()

            ],

          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  List<Widget> _buildActions() =>
      <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
          color: Colors.grey,
          tooltip: 'Search',
        ),
        IconButton(
            icon: Icon(Icons.search), onPressed: () {}, color: Colors.grey),
        IconButton(icon: Icon(Icons.shopping_basket, size: 20),

            onPressed: () {}, color: Colors.grey
            , tooltip: 'Cart'),

      ];

  Widget _buildCategories() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Categories',
                  style:GoogleFonts.varelaRound(
                    fontSize:18,
                    fontWeight: FontWeight.w600,


                  )),
                  _ExploreAllButton(
                    onTap: (){

                    },
                  ),
                ],
              )
          ),
          SizedBox(height:20),
          _buildCategoriesList()
        ],
      ),
    );
  }
}
Widget _buildCategoriesList(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      CategoriesTile(
        assetPath: 'assets/bread.png',
        color:Color(0xffFCE8A8),
        title:'Bakery',
      ),
      CategoriesTile(
        assetPath: 'assets/apple.png',
        color:Color(0xffDFECF8),
        title:'Fruits',
      ),
      CategoriesTile(
        assetPath: 'assets/vegetable.png',
        color:Color(0xffE2F3C2),
        title:'Vegetables',
      ),
      CategoriesTile(
        assetPath: 'assets/milk.png',
        color:Color(0xffFFDBC5),
        title:'Drinks',
      ),

    ],
  );
}
  Widget _buildTopProducts() {

  return Padding(
    padding: const EdgeInsets.all(20),
    child: Column(
      children: <Widget>[
        Container(
            width:MediaQuery.of(context)
                .size
                .width,


            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('TopProducts',
                    style: GoogleFonts.varelaRound(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,


                    )),
                _ExploreAllButton(
                  onTap: () {

                  },
                ),
              ],
            )
        ),
        SizedBox(height: 20),
        _buildTopProductsList()
      ],
    ),
  );
}
Widget _buildTopProductsList() {
  List topProductList = [
    TopProductTile(
      assetPath: 'assests/kiwi.png',
      color: Color(0xffDFECF8),
      price: '\$3',
      title: 'kiwi',

    ),
    TopProductTile(
      assetPath: 'assests/stawberry.png',
      color: Color(0xffDFECF8),
      price: '\$4',
      title: 'Strawberry',

    ),
    TopProductTile(
      assetPath: 'assests/summar.png',
      color: Color(0xffFFF2C5),
      price: '\$2.5',
      title: 'Watermelon',

    )


  ];
  return Column(
      children: <Widget>[
        Container(
            height: 200,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => topProductList[index],
                separatorBuilder: (context, index) => SizedBox(width: 20),
                itemCount: topProductList.length)
        ),

      ],
  );
}
  Widget  _buildBottomNavigationBar() {
    List<String> bottomNavigationBarOptions = [
      'Home',
      'Favorites',
      'Notifications',
      'Profile'
    ];

    List<IconData> bottomNavigationBarIcons = [
      Icons.home,
      Icons.favorite_border,
      Icons.notifications_none,
      Icons.person_outline
    ];
    return Container(
      height: 80,
      padding:EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
       color: Color(0xff84CC83),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        )


    ),
      child: Row(
        children: List.generate(bottomNavigationBarOptions.length, (index) {
          if (index == selectedOptionIndex) {
            return Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedOptionIndex = index;
                  });
                },
                child: Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          bottomNavigationBarIcons[index],
                          color: Colors.green,
                        ),
                        Text(
                          bottomNavigationBarOptions[index],
                          style: GoogleFonts.varelaRound(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }

          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedOptionIndex = index;
                });
              },
              child: Icon(
                bottomNavigationBarIcons[index],
                color: Colors.white,
              ),
            ),
          );
        }),
      ),
    );
  }
}
















class _ExploreAllButton extends StatelessWidget {
  final Function onTap;

  const _ExploreAllButton(
  {
    Key key, this.onTap,
  }): super(key:key);

  



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:this.onTap,
      child: Container(
        padding:const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color:Color(0xffE0E6EE),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            )

          ),
          child: Text('EXplore All',
            style:GoogleFonts.varelaRound(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color:Colors.grey[700],



          ))),
    );
  }
}








