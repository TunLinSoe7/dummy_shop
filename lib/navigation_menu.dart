import 'package:dummyShop/providers/navigation_provider.dart';
import 'package:dummyShop/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_)=>NavigationProvider(),
      child: Consumer<NavigationProvider>(
        builder: (_,provider,__)=>Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: provider.currentIndex,
              selectedItemColor: kPrimaryColor,
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: true,
              unselectedLabelStyle: const TextStyle(
                color: Colors.grey
              ),
              onTap: (index){
              provider.setIndex = index;
              },
              items: const [
            BottomNavigationBarItem(icon: Icon(Iconsax.home),label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Iconsax.search_normal),label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_outline),label: 'Favourite'),
            BottomNavigationBarItem(icon: Icon(Iconsax.profile_circle),label: 'Profile'),
          ]),
          body: IndexedStack(
            index: provider.currentIndex,
            children: provider.screens.toList(),
          ),
        )
      ),
    );
  }
}
