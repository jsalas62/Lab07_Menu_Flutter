import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fast Food',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MenuScreen(),
    );
  }
}

class MenuItem {
  final String dish;   
  final double price;  
  final String image;  

  MenuItem({
    required this.dish,
    required this.price,
    required this.image,
  });
}

class MenuScreen extends StatelessWidget {
  final List<MenuItem> menuItems = [
    MenuItem(dish: 'Tacos', price: 10.50, image: 'assets/tacos.png'),
    MenuItem(dish: 'Pizza', price: 8.75, image: 'assets/pizza.png'),
    MenuItem(dish: 'Hamburguesa', price: 12.00, image: 'assets/burger.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fast Food La Tia Veneno'),
      ),
      body: ListView.builder(
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          final item = menuItems[index];
          return Card(
            margin: EdgeInsets.all(10),
            elevation: 5,
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(50), // Redondea la imagen
                child: Image.asset(
                  item.image,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover, // Ajusta la imagen
                ),
              ),
              title: Text(
                item.dish,
                style: TextStyle(
                  fontWeight: FontWeight.bold, // Nombre en negrita
                  fontSize: 18,
                ),
              ),
              subtitle: Text(
                '\$${item.price.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700], // Estilo para el precio
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios), // Icono decorativo
            ),
          );
        },
      ),
    );
  }
}
