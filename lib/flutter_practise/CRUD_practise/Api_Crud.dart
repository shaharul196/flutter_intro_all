import 'package:flutter/material.dart';

class ApiCrud extends StatefulWidget {
  const ApiCrud({super.key});

  @override
  State<ApiCrud> createState() => _ApiCrudState();
}

class _ApiCrudState extends State<ApiCrud> {

  void productDialog(){
    showDialog(context: context, builder: (context)=>
      AlertDialog(
        title: Text('Add Product'),
        content: Column(
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
                labelText: 'Product unitPrice',
              ),
            ),

            TextField(
              decoration: InputDecoration(
                labelText: 'Product totalPrice',
              ),
            ),
            SizedBox(height: 10,),

            Row(
              children: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text('Close')),
             SizedBox(width: 40,),
            
            ElevatedButton(onPressed: (){}, child: Text('Add Product'))

            ],
            ),
          ],
        ),

      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api Crud app'),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      
      body: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        childAspectRatio: 0.6,
        crossAxisSpacing: 10,
      ),
          itemCount: 10,
          itemBuilder: (context,index){
         return Container(
           child: Column(
             children: [
               Container(
                 height: 140,
                 child: Image.asset(
                     height: 140,
                     fit: BoxFit.cover,
                     'assets/iphone1.jpeg',
                 ),
               ),
                   SizedBox(height: 10,),

                   Text('Product name || Qty'),
                   Text('UnitPrice ||TotalPrice'),
               SizedBox(height: 10,),

               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                   SizedBox(width: 20,),
                   IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
                 ],
               )


             ],
           ),
         );

          }  
      ),
      
      
      
      floatingActionButton: FloatingActionButton(
          onPressed:()=>productDialog(),
        child: Icon(Icons.add,
          size: 38,
          color: Colors.black,
        ),
      
      ),

    );
  }
}
