import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_delivery/custom_widget/marginBox.dart';
import 'package:grocery_delivery/description_screen.dart';
import 'package:grocery_delivery/model/data.dart';

class CategoriesPageView extends StatefulWidget {
  @override
  _CategoriesPageViewState createState() => _CategoriesPageViewState();
}

class _CategoriesPageViewState extends State<CategoriesPageView> {
  String selectName = "Fruits";
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double szText = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 240, 240, 1),
      body: Padding(
        padding: EdgeInsets.only(left: 16.0, top: 16.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                buildBackAndSearch(height, context),
                BoxMargin(isVertical: true),
                buildCategoriesList(height, width, szText),
                BoxMargin(isVertical: true),
                selectName == "Fruits"
                    ? buildCategori(height, szText, fruits)
                    : buildCategoryNonData(height),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCategoryNonData(double height) {
    return Container(
      height: height * 0.75,
      child: Center(
        child: Text(selectName,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 30.0)),
      ),
    );
  }

  Widget buildCategori(double height, double szText,List<Content> list
) {
    return Container(
      height: height * 0.75,
      width: double.maxFinite,
      child: GridView.count(
        childAspectRatio: 0.75,
        crossAxisCount: 2,
        children: List.generate(
          list.length,
          (index) {
            return Container(
              margin: EdgeInsets.only(right: 16.0, bottom: 16.0),
              height: height * 0.3,
              // color: Colors.red,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Expanded(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => DescriptionScreen(data:list[index])
                          ));
                        },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      child: Stack(
                        children: <Widget>[
                          buildImageCategories(index),
                          buildFavoriteButton(index),
                        ],
                      ),
                    ),
                  )),
                  BoxMargin(isVertical: true, multi: 1),
                  Text(
                    list[index].name,
                    style:
                        TextStyle(color: Colors.green, fontSize: 18 * szText),
                  ),
                  BoxMargin(isVertical: true, multi: 1),
                  Text(
                    "\$" + list[index].price.toString(),
                    style:
                        TextStyle(color: Colors.green, fontSize: 18 * szText),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildImageCategories(int index) {
    return Positioned(
      top: 10,
      right: 10,
      left: 10,
      bottom: 10,
      child: Image.asset(fruits[index].imageContent),
    );
  }

  Widget buildFavoriteButton(int index) {
    return Positioned(
      top: 8,
      right: 8,
      child: GestureDetector(
        onTap: () {
          setState(() {
            fruits[index].isFavorite = !fruits[index].isFavorite;
          });
        },
        child: Container(
          width: 40,
          height: 40,
          child: Center(
            child: Icon(Icons.favorite,
                size: 24.0,
                color: fruits[index].isFavorite ? Colors.red : Colors.grey),
          ),
        ),
      ),
    );
  }

  Widget buildCategoriesList(double height, double width, double szText) {
    return Container(
      height: height * 0.05,
      width: width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectName = categories[index].nameCategory;
              });
            },
            child: Container(
              margin: EdgeInsets.only(right: 16.0),
              height: height * 0.08,
              width: width * 0.25,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  color: selectName == categories[index].nameCategory
                      ? Colors.green
                      : Colors.white),
              child: Center(
                child: Text(
                  categories[index].nameCategory,
                  style: TextStyle(
                      color: selectName == categories[index].nameCategory
                          ? Colors.white
                          : Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16 * szText),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildBackAndSearch(double height, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16.0),
      height: height * 0.06,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back, color: Colors.black, size: 30.0)),
          Icon(Icons.search, color: Colors.black, size: 30.0),
        ],
      ),
    );
  }
}
