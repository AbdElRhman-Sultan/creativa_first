import 'package:creativa_second/models/product_repo.dart';
import 'package:creativa_second/product_detail.dart';
import 'package:creativa_second/repository/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class HomePage extends StatefulWidget {
   HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.of(context).pushNamed("StartScreen");
        }, icon: Icon(Icons.arrow_back_ios_new)),
        title: Text("Home",style: GoogleFonts.badScript(fontSize:40,color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: SingleChildScrollView(
        child: Column(
         children:[
           //GridView
           FutureBuilder<List<CategoryProduct>>(
               future: ProductRepository().getProducts(),
               builder: (context, snapshot) {

                 if(snapshot.connectionState == ConnectionState.waiting) {
                   return Center(
                     child: CircularProgressIndicator(
                       color: Colors.indigo,
                     ),
                   );
                 }

                 if(snapshot.connectionState == ConnectionState.done) {
                   if(snapshot.hasData) {

                     final listOfProducts = snapshot.data!;

                     return Container(
                       height: 700,
                       margin: EdgeInsets.symmetric(vertical: 7.0),
                       child: GridView.builder(
                           itemCount: listOfProducts.length,
                           scrollDirection: Axis.vertical,
                           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                             crossAxisCount: 2,
                             mainAxisSpacing: 10,
                             crossAxisSpacing: 10,
                             childAspectRatio: 1,
                           ),
                       itemBuilder:(context, i){
                             return GestureDetector(
                               onTap: () {
                                 Navigator.of(context).push(
                                   MaterialPageRoute(builder: (BuildContext context) {
                                     return ProductDetail(productId: listOfProducts[i].id,);
                                   }),
                                 );
                               },
                               child: Container(
                                 height: 238,
                                 width: 50,
                                 padding: EdgeInsets.all(10),
                                 margin: EdgeInsets.symmetric(horizontal: 10),
                                 decoration: BoxDecoration(
                                   border: Border.all(
                                     width: 1,
                                     color: Colors.indigo,
                                   ),
                                   borderRadius: BorderRadius.circular(5),
                                 ),
                                 child: Column(
                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Image.network('${listOfProducts[i].thumbnail}' , height: 100,),
                                     // title
                                     Text(
                                       listOfProducts[i].title,
                                       style: TextStyle(
                                            color: Color(0xff223263),
                                           fontSize: 12,
                                           fontWeight: FontWeight.bold),
                                     ),
                                     //price
                                     Text(
                                       '\$${listOfProducts[i].price}',
                                       style: TextStyle(
                                           color: Color(0xff40BFFF),
                                           fontSize: 12,
                                           fontWeight: FontWeight.bold),
                                     ),
                                     // discount / discountpercentage
                                     Row(
                                       mainAxisAlignment:
                                       MainAxisAlignment.spaceBetween,
                                       children: [
                                         Text(
                                           '\$534,33',
                                           style: TextStyle(
                                               decoration: TextDecoration.lineThrough,
                                               color: Color(0xff9098B1),
                                               fontSize: 12,
                                               ),
                                         ),
                                         Text(
                                           '${listOfProducts[i].discountPercentage}%off',
                                           style: TextStyle(
                                               color: Color(0xffFB7181),
                                               fontSize: 12,
                                               fontWeight: FontWeight.bold),
                                         ),
                                       ],
                                     )
                                   ],
                                 ),
                               ),
                             );
                           }),
                     );
                   }
                 }

                 return Center(child: Text('Try Again Later!'));

               }
           ),
          ]
        ),
      ),
    );
  }
}























