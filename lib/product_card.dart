import 'package:flutter/material.dart';

///red color
const Color firstColor = Color(0xffF44336);

///green color
const Color secondColor = Color(0xff4CAF50);

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;
  final int quantity;
  final String notification;
  final Function onAddCartTap;
  final Function onIncTap;
  final Function onDecTap;

  final TextStyle textStyle = TextStyle(
      fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey[800]);

  ProductCard({
    this.imageUrl = "",
    this.name = "",
    this.price = "",
    this.quantity = 0,
    this.notification,
    this.onIncTap,
    this.onDecTap,
    this.onAddCartTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedContainer(
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          duration: Duration(milliseconds: 300),
          width: 130,
          height: (notification != null) ? 270 : 250,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 3,
                offset: Offset(1, 1),
                color: Colors.black.withOpacity(0.3),
              )
            ],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
            color: secondColor,
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              (notification != null) ? notification : "",
              style: textStyle.copyWith(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
        ),
        Container(
          width: 150,
          height: 250,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 6,
                    offset: Offset(1, 1))
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 150,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                        image: DecorationImage(
                            image: NetworkImage(imageUrl), fit: BoxFit.cover)),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Text(name),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5),
                    child: Text(
                      price,
                      style: textStyle.copyWith(
                        fontSize: 12,
                        color: firstColor,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  // tombol + -
                  Container(
                    width: 140,
                    height: 30,
                    decoration:
                        BoxDecoration(border: Border.all(color: firstColor)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: onIncTap(),
                          child: Container(
                            width: 30,
                            height: 30,
                            color: firstColor,
                            child: Icon(
                              Icons.add,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          quantity,
                          style: textStyle,
                        ),
                        GestureDetector(
                          onTap: onDecTap(),
                          child: Container(
                            width: 30,
                            height: 30,
                            color: firstColor,
                            child: Icon(
                              Icons.remove,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    child: RaisedButton(
                      onPressed: onAddCartTap(),
                      color: firstColor,
                      child: Icon(
                        Icons.add_shopping_cart,
                        size: 18,
                        color: Colors.white,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16))),
                    ),
                    width: 140,
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
