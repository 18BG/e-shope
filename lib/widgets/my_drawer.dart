import 'package:flutter/material.dart';

import '../screens/PanierScreen.dart';
import '../screens/order_screen.dart';
import '../screens/wishlist_screen.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: Column(
                children: [
                  Spacer(),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.16,
                    width: MediaQuery.of(context).size.height * 0.16,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white,
                    ),
                    child: FractionallySizedBox(
                      widthFactor: 0.8,
                      heightFactor: 0.8,
                      child: Align(
                        alignment: Alignment.center,
                        child: Image.network(
                          "https://spng.pngfind.com/pngs/s/110-1102775_download-empty-profile-hd-png-download.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Text(
                    "Aymane DEMBELE",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("Abkass2"),
                  Spacer(),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Mon Profil'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>WhishListScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>WhishListScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Tous les produits'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>WhishListScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_bag),
            title: Text('Mes Achats'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderListScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_basket),
            title: Text('Mon Panier'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>PanierListScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Ma liste de souhaits'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>WhishListScreen()));
            },
          ),
        ],
      ),
    );
  }
}
