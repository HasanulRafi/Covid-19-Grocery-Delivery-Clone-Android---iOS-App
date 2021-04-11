import 'package:flutter/material.dart';
import 'package:grocery_delivery/custom_widget/marginBox.dart';
import 'package:grocery_delivery/model/data.dart';

class DescriptionScreen extends StatefulWidget {
  final Content data;

  DescriptionScreen({this.data});

  @override
  _DescriptionScreenState createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  Content descriptionData;
  int count = 1;

  @override
  void initState() {
    super.initState();
    descriptionData = widget.data;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double szText = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 240, 240, 1),
      body: SafeArea(
          child: Stack(
        children: <Widget>[
          buildBackIcon(height, context, szText),
          buidImageContent(height, width),
          Positioned(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: height * 0.56,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30)),
                    color: Colors.white),
                child: Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      buildNameCount(height, szText, width),
                      BoxMargin(isVertical: true, multi: 1.0),
                      Text(
                        "\$${descriptionData.price * count}",
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 26 * szText,
                            fontWeight: FontWeight.w400),
                      ),
                      BoxMargin(isVertical: true, multi: 1.0),
                      Text(
                        descriptionData.description,
                        style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 18 * szText,
                            fontWeight: FontWeight.normal),
                      ),
                      BoxMargin(isVertical: true, multi: 2.0),
                      Text(
                        "Ralated Items",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 22 * szText),
                      ),
                      BoxMargin(isVertical: true, multi: 1.0),
                      Container(
                        height: height * 0.08,
                        child: ListView.builder(
                          itemCount: fruits.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return fruits[index] != descriptionData
                                ? Container(
                                    margin: EdgeInsets.only(right: 16.0),
                                    width: width * 0.5,
                                    child: Row(
                                      children: <Widget>[
                                        BoxMargin(isVertical: false, multi: 1),
                                        Container(
                                            width: width * 0.2,
                                            child: Image.asset(
                                              fruits[index].imageContent,
                                              fit: BoxFit.fill,
                                            )),
                                        BoxMargin(isVertical: false, multi: 1),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              fruits[index].name,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            BoxMargin(
                                                isVertical: true, multi: 1),
                                            Text("\$${fruits[index].price}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.green)),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                : const SizedBox();
                          },
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: (){
                          print("add to cart");
                        },
                        child: Container(
                          width: width,
                          child: Center(
                            child: Container(
                              height: height * 0.08,
                              width: width * 0.7,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.green,
                              ),
                              child: Center(
                                child: Text(
                                  "Add to cart",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24 * szText,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      BoxMargin(isVertical: true, multi: 3.0),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }

  Container buildNameCount(double height, double szText, double width) {
    return Container(
      margin: EdgeInsets.only(top: height * 0.03),
      height: height * 0.05,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Flexible(
            child: Text(
              descriptionData.name,
              style: TextStyle(
                  fontSize: 24 * szText,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
          ),
          // Spacer(),
          Container(
            width: width * 0.3,
            height: height * 0.035,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey[300]),
                borderRadius: BorderRadius.circular(30)),
            child: Row(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        count--;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              bottomLeft: Radius.circular(30)),
                          color: Colors.grey[300]),
                      child: Center(
                        child: Icon(Icons.remove, color: Colors.black54),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Container(
                    child: Center(
                      child: Text(count.toString()),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        count++;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(30),
                              topRight: Radius.circular(30)),
                          color: Colors.grey[300]),
                      child: Center(
                        child: Icon(
                          Icons.add,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container buidImageContent(double height, double width) {
    return Container(
        margin: EdgeInsets.only(top: height * 0.025),
        height: height * 0.3,
        width: width,
        child: Center(
          child: Image.asset(
            descriptionData.imageContent,
            fit: BoxFit.cover,
          ),
        ));
  }

  Widget buildBackIcon(double height, BuildContext context, double szText) {
    return Container(
      height: height * 0.05,
      margin: EdgeInsets.only(left: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: height * 0.05,
              width: height * 0.05,
              child: Center(
                child: Icon(
                  Icons.arrow_back,
                  size: 24.0 * szText,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
