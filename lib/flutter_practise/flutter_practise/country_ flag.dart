import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Flag Design',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            title: Text('Country Flags'),
            backgroundColor: Colors.blue,
            centerTitle: true,
        ),
        body: ResponsiveFlag(),
      ),
    );
  }
}

class ResponsiveFlag extends StatelessWidget {
  final List<Map<String, String>> countries = [
    {'name': 'United States', 'flag': 'https://flagcdn.com/w320/us.png'},
    {'name': 'France', 'flag': 'https://flagcdn.com/w320/fr.png'},
    {'name': 'Japan', 'flag': 'https://flagcdn.com/w320/jp.png'},
    {'name': 'India', 'flag': 'https://flagcdn.com/w320/in.png'},
    {'name': 'Germany', 'flag': 'https://flagcdn.com/w320/de.png'},
    {'name': 'Brazil', 'flag': 'https://flagcdn.com/w320/br.png'},
    {'name': 'Canada', 'flag': 'https://flagcdn.com/w320/ca.png'},
    {'name': 'Italy', 'flag': 'https://flagcdn.com/w320/it.png'},
  ];

   ResponsiveFlag({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount;

        if (constraints.maxWidth <= 768) {
          crossAxisCount = 2; // Desktop
        } else if (constraints.maxWidth <= 1024) {
          crossAxisCount = 3; // Tablet
        } else {
          crossAxisCount = 4; // Mobile
        }

        return GridView.builder(
          padding: const EdgeInsets.all(16.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 3 / 4,
          ),
          itemCount: countries.length,
          itemBuilder: (context, index) {
            final country = countries[index];
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                      child: Image.network(
                        country['flag']!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      country['name']!,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),

                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Card(
                     color: Colors.grey.shade300,
                     child: ListTile(
                       leading: Icon(Icons.explore,color: Colors.blue,size: 35,),
                       title: Text('Explore ',style: TextStyle(
                         color: Colors.blue,
                         fontWeight: FontWeight.bold,
                         fontSize: 16
                       ),
                       ),
                     ),
                   ),
                 )

                  // ListView(
                  //   children: [
                  //    
                  //   ],
                  // )

                ],
              ),
            );
          },
        );
      },
    );
  }
}
