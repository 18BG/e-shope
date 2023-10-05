import 'package:e_shope/screens/login_screen.dart';
import 'package:e_shope/provider/provider.dart';
import 'package:e_shope/screens/user_information_screen.dart';
import 'package:flutter/material.dart';
import '../screens/AllCategoriesScreen.dart';
import '../screens/order_screen.dart';
import '../screens/wishlist_screen.dart';
import 'bottom_navigation_bar.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key});

  @override
  Widget build(BuildContext context) {
    final UserProvider provider =
        Provider.of<UserProvider>(context, listen: false);

    return Drawer(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.99999,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              decoration: const BoxDecoration(
                color: Colors.blue, // Background color of the header
              ),
              child: DrawerHeader(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (provider.isLoggedIn && provider.image != "")
                      Container(
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
                          ),
                        ),
                      )
                    else
                      const CircleAvatar(
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
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.person,
                color: Colors.blue, // Change the color of the icon
              ),
              title: const Text('Mon Profil'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserInformation()),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.notifications,
                color: Colors.blue, // Change the color of the icon
              ),
              title: const Text('Notifications'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WhishListScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.shopping_cart,
                color: Colors.blue, // Change the color of the icon
              ),
              title: const Text('Tous les produits'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AllCategorieScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.shopping_bag,
                color: Colors.blue, // Change the color of the icon
              ),
              title: const Text('Mes Achats'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrderListScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.shopping_basket,
                color: Colors.blue, // Change the color of the icon
              ),
              title: const Text('Mon Panier'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ConvexAppExample(
                            isOk: true,
                          )),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.favorite,
                color: Colors.red, // Change the color of the icon
              ),
              title: const Text('Ma liste de souhaits'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const WhishListScreen()),
                );
              },
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: (provider.isLoggedIn) ? Colors.red : Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              onPressed: () {
                (provider.isLoggedIn)
                    ? {provider.logout(), Navigator.pop(context)}
                    : Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                        return const LoginScreen();
                      }));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  (provider.isLoggedIn) ? "Déconnexion" : "Se connecter",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
