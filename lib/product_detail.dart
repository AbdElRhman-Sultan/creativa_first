import 'package:carousel_slider/carousel_slider.dart';
import 'package:creativa_second/Cubit/cubit_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
class ProductDetail extends StatefulWidget {
  final int productId;
  const ProductDetail({Key? key , required this.productId}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().getSingleProduct(widget.productId);
  }
  bool click = true;
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child:BlocBuilder<ProductCubit, ProductState> (
             builder: (context,state){
                if (state is GetProductSuccess){
                    final productData = state.productOne;
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                  onTap: (){
                                    Navigator.pop(context);
                                  },
                                  child: Icon(Icons.arrow_back_ios_outlined)
                              ),
                              //title
                              Container(
                                width: 255,
                                margin: EdgeInsets.all(10),
                                alignment: Alignment.topLeft,
                                child: Text(productData.title,
                                  style: GoogleFonts.aBeeZee(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff223263),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            // width: MediaQuery.of(context).size.width,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(height: 20,),
                                  //Slider
                                  Container(
                                    child: CarouselSlider.builder(
                                      itemCount:productData.images.length,
                                      itemBuilder:(BuildContext context, int itemIndex, int pageViewIndex) {
                                        return Container(
                                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                                          child: Image.network(productData.images[itemIndex]),
                                          width: MediaQuery.of(context).size.width,
                                        );
                                      },
                                      options: CarouselOptions(
                                        height: 220,
                                        autoPlay: true,
                                        autoPlayAnimationDuration: Duration(seconds: 1),
                                        enableInfiniteScroll: true,
                                      ),
                                    ),
                                  ),
                                  // name of product
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(productData.title,
                                        textAlign: TextAlign.start,
                                        style: GoogleFonts.aBeeZee(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff223263),
                                        ),
                                      ),
                                      // icon favorite
                                      IconButton(
                                        onPressed: (){
                                          setState(() {
                                            click= !click;
                                          });
                                        },
                                        icon: Icon((click == true ) ? Icons.favorite_border  : Icons.favorite , color: Colors.pink,),
                                      ) ,
                                    ],
                                  ),
                                  // Star
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(width:20,),
                                      Icon(Icons.star ,color: Color(0xffFFC833),),
                                      Icon(Icons.star ,color: Color(0xffFFC833),),
                                      Icon(Icons.star ,color: Color(0xffFFC833),),
                                      Icon(Icons.star ,color: Color(0xffFFC833),),
                                      Icon(Icons.star , color: Color(0xffEBF0FF),),
                                    ],
                                  ),
                                  // price
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    alignment: Alignment.bottomLeft,
                                    child: Text( "\$${productData.price}",
                                      style: GoogleFonts.aBeeZee(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue
                                      ),
                                    ),
                                  ),
                                  // Specification
                                  Container(
                                    margin: EdgeInsets.all(5),
                                    alignment: Alignment.bottomLeft,
                                    child: Text("Specification" ,
                                      style: GoogleFonts.aBeeZee(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff223263),),
                                    ),
                                  ),
                                  // Show
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Shown:",style: GoogleFonts.aBeeZee(color: Color(0xff223263) ,fontSize: 14 ),),
                                      Text("Laser\n Blue/Anthracite/Watermel \n on/White",
                                          style: GoogleFonts.aBeeZee(color: Color(0xff9098B1) ,fontSize: 14 )),
                                    ],
                                  ),
                                  SizedBox(height: 20,),
                                  // style
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Style:",style: GoogleFonts.aBeeZee(color: Color(0xff223263) ,fontSize: 14 ),),
                                      Text("CD0113-400",style: GoogleFonts.aBeeZee(color: Color(0xff9098B1) ,fontSize: 14 )),
                                    ],
                                  ),
                                  SizedBox(height: 20,),
                                  // paragraph
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    alignment: Alignment.bottomLeft,
                                    child:Text("The Nike Air Max 270 React ENG combines a \n "
                                        "full-length React foam midsole with a 270 Max Air \n"
                                        "unit for unrivaled comfort and a striking visual \n "
                                        "experience." , style: GoogleFonts.aBeeZee(color: Color(0xff9098B1) ,fontSize: 14 )),
                                  ),
                                  SizedBox(height: 20,),
                                  //Review Product
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Review Product",
                                        style: GoogleFonts.aBeeZee(
                                            color: Color(0xff223263),
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      TextButton(onPressed: (){},
                                        child: Text("See More",
                                          style: GoogleFonts.aBeeZee(
                                              color: Colors.blue,
                                              fontSize: 19,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  //stat
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(width:20,),
                                      Icon(Icons.star ,color: Color(0xffFFC833),),
                                      Icon(Icons.star ,color: Color(0xffFFC833),),
                                      Icon(Icons.star ,color: Color(0xffFFC833),),
                                      Icon(Icons.star ,color: Color(0xffFFC833),),
                                      Icon(Icons.star , color: Color(0xffEBF0FF),),
                                      SizedBox(width: 5,),
                                      Text("4.5" , style: TextStyle(color: Color(0xff9098B1) ,fontSize: 14 ),),
                                      SizedBox(width: 5,),
                                      Text("(5 Review)" ,style: GoogleFonts.aBeeZee(color: Color(0xff9098B1) ,fontSize: 14 )),
                                    ],
                                  ),
                                  SizedBox(height: 20,),
                                  //James Lawson
                                  Row(
                                    children: [
                                      SizedBox(height: 10,),
                                      Container(
                                        height: 70,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(image: AssetImage("images/James Lawson.png")),
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Text("James Lawson",
                                              style: GoogleFonts.aBeeZee(
                                                  color: Color(0xff223263),
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.bold
                                              )
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              SizedBox(width:20,),
                                              Icon(Icons.star ,color: Color(0xffFFC833),),
                                              Icon(Icons.star ,color: Color(0xffFFC833),),
                                              Icon(Icons.star ,color: Color(0xffFFC833),),
                                              Icon(Icons.star ,color: Color(0xffFFC833),),
                                              Icon(Icons.star , color: Color(0xffEBF0FF),),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  // paragraph 2
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    alignment: Alignment.bottomLeft,
                                    child:Text("air max are always very comfortable fit, clean and\n"
                                        " just perfect in every way. just the box was too small\n"
                                        " and scrunched the sneakers up a little bit, not sure if\n"
                                        " the box was always this small but the 90s are and\n"
                                        " will always be one of my favorites." , style: GoogleFonts.aBeeZee(
                                        color: Color(0xff9098B1)
                                        ,fontSize: 14 )),
                                  ),
                                  SizedBox(height: 15,),
                                  //Add To Cart
                                  Container(
                                    height: 50,
                                    width:MediaQuery.of(context).size.width*0.9,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child:Text("Add To Cart",style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold),),
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(color: Colors.blue),
                                          borderRadius: BorderRadius.circular(30.0),
                                        ),
                                        primary: Colors.blue,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30,),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );

                }
                return  Center(
                 child: CircularProgressIndicator(
                   color: Colors.indigo,
                 ),
               );
              }
          )
      ),
    );
  }
}
