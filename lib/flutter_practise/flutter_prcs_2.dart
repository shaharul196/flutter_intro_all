import 'package:flutter/material.dart'; 

void main(){
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Own app',
      home: Homer(),
      
    );
  }
}

class Homer extends StatelessWidget {
  const Homer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red[300],
       backgroundColor: Colors.white.withOpacity(0.8),
      appBar: AppBar(
        title: Text('My app'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      body: Column(
        children: [
          SizedBox(
              height: 60,
              // width: 250,
              width: double.infinity,

              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),

                    ),
                  ),
                  onPressed: (){
                print('button pressed');
              }, child: Text('Button')),
            ),


           GestureDetector(
             onTap: (){
               print('text pressed');
             },
             child: Text('This is text'),

           ),

          OutlinedButton(onPressed: (){}, child: Text('Button')),
          Text(
              softWrap: false,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant'),

        Container(
          alignment: Alignment.center,
          // margin: EdgeInsets.all(30),
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.all(30),
            // padding: EdgeInsets.only(top: 50),
            width: 300,
            height: 250,
            // color: Colors.red,

            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                width: 7,
                color: Colors.orange,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.cyan,
                  offset: Offset(5, 50),
                  blurRadius: 14,
                ),
              ]


            ),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text('This is text',style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),),
                          
                    Text('This is text',style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),),
                          
                    Text('This is text',style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),),
                          
                    Text('This is text',style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),),
                          
                    Text('This is text',style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),),
                          
                    Text('This is text',style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),),
                          
                    Text('This is text',style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),),
                          
                    Text('This is text',style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),),
                          
                          
                  ],
                ),
              ),
            ),
          
            
          ),
       

        ],
      ),

    floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.cyan,
        onPressed: (){
          print('floating button pressed');
        }),

    );
    
    

  }
}


