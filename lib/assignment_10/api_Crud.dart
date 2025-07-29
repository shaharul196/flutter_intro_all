import 'package:flutter/material.dart';
import 'package:ostad_flutter_sazu/assignment_3/widget/productCard.dart';
import 'ProductControllet.dart';

class Crudapi extends StatefulWidget {
  const Crudapi({super.key});

  @override
  State<Crudapi> createState() => _CrudapiState();
}

class _CrudapiState extends State<Crudapi> {
  final ProductController productcontroller = ProductController();

  Future<void>fecthData() async {
    await productcontroller.fetchProducts();
    print(productcontroller.products.length);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fecthData();
  }

  @override
  Widget build(BuildContext context) {

    void productDialog({String ? id,String ? name,String ? img,int ? qty,int ? unitPrice,int ? totalPrice,required bool isupdate}){
      TextEditingController productNameController = TextEditingController();
      TextEditingController productQTYController = TextEditingController();
      TextEditingController productImageController = TextEditingController();
      TextEditingController productUnitPriceController = TextEditingController();
      TextEditingController productTotalPriceController = TextEditingController();
      
      
      productNameController.text = name ?? '';
      productImageController.text = img ?? '';
      productQTYController.text = qty != null ? qty.toString() : '0';
      productUnitPriceController.text = unitPrice != null ? unitPrice.toString() : '0';
      productTotalPriceController.text = totalPrice != null ? totalPrice.toString() : '0';
      
      

      showDialog(context: context, builder: (context)=>
        AlertDialog(
          title: Text(isupdate ? 'Edit Product' :'Add Product'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: productNameController,
                  decoration: InputDecoration(
                    labelText: 'Product name',
                  ),
                ),
            
                TextField(
                  controller: productImageController,
                  decoration: InputDecoration(
                    labelText: 'Product image',
                  ),
                ),
            
                TextField(
                  controller: productQTYController,
                  decoration: InputDecoration(
                    labelText: 'Product qty',
                  ),
            
                ),
            
                TextField(
                  controller: productUnitPriceController,
                  decoration: InputDecoration(
                    labelText: 'Product unit price',
                  ),
            
                ),
            
                TextField(
                  controller: productTotalPriceController,
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
                    SizedBox(width: 40,),
            
                    ElevatedButton(onPressed: () async {
                     
                        productcontroller.CreateUpdateProducts(productNameController.text, productImageController.text,
                            int.parse(productQTYController.text.trim()), int.parse(productUnitPriceController.text.trim()),
                            int.parse(productTotalPriceController.text.trim()),
                         id,isupdate
                        ).then((value) async {
                          if(value){
                            await productcontroller.fetchProducts();
                            setState(()  {
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(isupdate ? 'Product Updated' : 'Product Created'),
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

                        Navigator.pop(context);
                        await fecthData();
                        setState(() {

                        });
                      
                      },style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      ), child: Text( isupdate ? 'Update Product' : 'Add Product',style: TextStyle(
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
        backgroundColor: Colors.orange,
        centerTitle: true,
       ),

      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              // mainAxisExtent: 10,
              childAspectRatio: 0.6,
            ),
          itemCount: productcontroller.products.length,

          itemBuilder: (context,index){
            var product = productcontroller.products[index];
            return productCard(onEdit: () {
              productDialog(name:product.productName ,img:product.img ,id:product.sId ,unitPrice:product.unitPrice ,totalPrice:product.totalPrice ,qty:product.qty , isupdate: true);
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
          onPressed: ()=>productDialog(isupdate: false),
         child: Icon(Icons.add,size: 38,),
      
      ),
    );
  }
}

