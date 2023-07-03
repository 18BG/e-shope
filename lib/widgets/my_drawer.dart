import 'package:e_shope/screens/login_screen.dart';
import 'package:e_shope/screens/provider.dart';
import 'package:e_shope/screens/user_information_screen.dart';
import 'package:flutter/material.dart';

import '../screens/AllCategoriesScreen.dart';
import '../screens/order_screen.dart';
import '../screens/wishlist_screen.dart';
import 'bottom_navigation_bar.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final UserProvider provider =
        Provider.of<UserProvider>(context, listen: false);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            decoration: const BoxDecoration(
              color: Colors.blue, // Couleur d'arrière-plan du header
            ),
            child: DrawerHeader(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    (provider.isLoggedIn && provider.image != "")
                        ? Container(
                            height: MediaQuery.of(context).size.width * 0.3,
                            width: MediaQuery.of(context).size.width * 0.3,
                            decoration: const BoxDecoration(
                                // color: Colors.amber,
                                ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(80),
                                child: Image.network(
                                  provider.image!,
                                  fit: BoxFit.cover,
                                )),
                          )
                        : const CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage(
                              "assets/images/noim.webp",
                            ),
                          ),
                    const SizedBox(height: 8),
                    Text(
                      provider.isLoggedIn
                          ? provider.lastName!
                          : "Not Connected",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      provider.isLoggedIn ? provider.username! : "",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                )),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Mon Profil'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserInformation()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WhishListScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('Tous les produits'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AllCategorieScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: const Text('Mes Achats'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OrderListScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_basket),
            title: const Text('Mon Panier'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BottomNavBar(
                          isOk: true,
                        )),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Ma liste de souhaits'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const WhishListScreen()),
              );
            },
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor:
                      (provider.isLoggedIn) ? Colors.red : Colors.blue,
                  textStyle: const TextStyle(fontSize: 20)),
              onPressed: () {
                (provider.isLoggedIn)
                    ? {provider.logout(), Navigator.pop(context)}
                    : Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                        return const LoginScreen();
                      }));
              },
              child:
                  Text((provider.isLoggedIn) ? "Deconnection" : "Se connecter"))
        ],
      ),
    );
  }
}
