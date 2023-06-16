import 'package:flutter/material.dart';
import '../screens/order_screen.dart';
import '../screens/wishlist_screen.dart';
import 'bottom_navigation_bar.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              color: Colors.blue, // Couleur d'arrière-plan du header
            ),
            child: DrawerHeader(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(
                      "assets/images/vic1.jpeg",
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Aymane DEMBELE",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "Abkass2",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Mon Profil'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WhishListScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WhishListScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Tous les produits'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WhishListScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_bag),
            title: Text('Mes Achats'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OrderListScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_basket),
            title: Text('Mon Panier'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BottomNavBar(isOk: true,)),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Ma liste de souhaits'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WhishListScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
