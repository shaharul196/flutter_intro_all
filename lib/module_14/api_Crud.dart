import 'package:flutter/material.dart';
import 'package:ostad_flutter_sazu/module_14/ProductControllet.dart';
import 'package:ostad_flutter_sazu/module_14/widget/productCard.dart';

class Crudapi extends StatefulWidget {
  const Crudapi({super.key});

  @override
  State<Crudapi> createState() => _CrudapiState();
}

class _CrudapiState extends State<Crudapi> {
  final ProductController productcontroller = ProductController();
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      productcontroller.fetchProducts();
    });
  }
  
  @override
  Widget build(BuildContext context) {

    void productDialog(){
      TextEditingController productNameController = TextEditingController();
      TextEditingController productQTYController = TextEditingController();
      TextEditingController productImageController = TextEditingController();
      TextEditingController productUnitPriceController = TextEditingController();
      TextEditingController productTotalPriceController = TextEditingController();

      showDialog(context: context, builder: (context)=>
        AlertDialog(
          title: Text('Add Product'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Product name',
                  ),
                ),
            
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Product image',
                  ),
                ),
            
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Product qty',
                  ),
            
                ),
            
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Product unit price',
                  ),
            
                ),
            
                TextField(
                  decoration: InputDecoration(
                    labelText: 'total price',
                  ),
                ),
            
                SizedBox(height: 10,),
                Row(
                  children: [
                    TextButton(onPressed: (){
                      Navigator.pop(context);
                    }, child: Text('Close')),
                    SizedBox(width: 60,),
            
                    ElevatedButton(onPressed: (){
            
                    },style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ), child: Text('Add Product',style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
            
                    ),)),
                  ],
                )
            
            
              ],
            ),
          ),

        )
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Crud'),
        backgroundColor: Colors.blue,
        centerTitle: true,
       ),

      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              // mainAxisExtent: 10,
              childAspectRatio: 0.6,
            ),
          itemCount:3,
          itemBuilder: (context,index){
            var product = productcontroller.products[index];
            return productCard(onEdit: () {
              productDialog();
            },
              onDelete: () {
              productcontroller.DeleteProducts(product.sId.toString())
                  .then((value) async {
                if(value){
                  await productcontroller.fetchProducts();

                  setState(()  {

                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Product Deleted'),
                    duration: Duration(seconds: 2),
                    ),
                  );
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Something wrong...!'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }

              });

            }, product: product ,);
          }),
      
      floatingActionButton: FloatingActionButton(
          onPressed: ()=>productDialog(),
         child: Icon(Icons.add,size: 38,),
      
      ),
    );
  }
}

