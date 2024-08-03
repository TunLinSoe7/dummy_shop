import 'package:dummyShop/providers/navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_)=>NavigationProvider(),
      child: Consumer<NavigationProvider>(
        builder: (_,provider,__)=>Scaffold(
          bottomNavigationBar: NavigationBar(
            backgroundColor: Colors.white,
            selectedIndex: provider.currentIndex,
            onDestinationSelected: (index){
              provider.setIndex= index;
            },
            destinations: const [
              NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
              NavigationDestination(icon: Icon(Icons.search_rounded), label: 'Search'),
              NavigationDestination(icon: Icon(Icons.favorite_border), label: 'Favourite'),
              NavigationDestination(icon: Icon(Icons.person_outline), label: 'Profile'),
            ],
          ),
          body: IndexedStack(
            index: provider.currentIndex,
            children: provider.screens.toList(),
          ),
        )
      ),
    );
  }
}
