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
            animationDuration: Duration(seconds: 2),
            shadowColor: Colors.black,
            surfaceTintColor: Colors.white,
            indicatorColor: const Color(0xff19c463),
            backgroundColor: Colors.white,
            selectedIndex: provider.currentIndex,
            onDestinationSelected: (index){
              provider.setIndex= index;
            },
            destinations: const [
              NavigationDestination(icon: Icon(Icons.home_outlined,size: 30,), label: 'Home',selectedIcon: Icon(Icons.home,color: Colors.white,size: 30,),),
              NavigationDestination(icon: Icon(Icons.search_rounded,size: 30,), label: 'Search',selectedIcon: Icon(Icons.search_outlined,color: Colors.white,size: 30,)),
              NavigationDestination(icon: Icon(Icons.favorite_border,size: 30,), label: 'Favourite',selectedIcon: Icon(Icons.favorite,color: Colors.white,size: 30,)),
              NavigationDestination(icon: Icon(Icons.person_outline,size: 30,), label: 'Profile',selectedIcon: Icon(Icons.person,color: Colors.white,size: 30,)),
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
