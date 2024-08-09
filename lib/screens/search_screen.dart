import 'package:dummyShop/providers/search_screen_provider.dart';
import 'package:dummyShop/screens/search_result_screen.dart';
import 'package:dummyShop/utils/constants/colors.dart';
import 'package:dummyShop/utils/helper_functions/helpers_functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchScreenProvider>(
      builder: (_,provider,__){
        return Scaffold(
          backgroundColor:Colors.white,
          appBar: AppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              title: const Icon(Icons.arrow_back_ios)
          ),
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Material(
                        elevation: 1,
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xfffafafa),
                          ),
                          child: TextField(
                            onChanged: (value){
                              provider.updateSearchText(value);
                              provider.fetchSearchProducts(value);
                            },
                            onSubmitted: (value){
                              HelperFunctions.navigateToScreen( SearchResultScreen(
                                searchText: provider.searchTextController.text.toLowerCase(),), context);
                              provider.addSearchQuery(value);
                            },
                            decoration: const InputDecoration(
                              hintText: 'Search',
                              prefixIcon: Icon(Icons.search),
                              border: InputBorder.none,
                            ),
                          ) ,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15,),
                    Material(
                      borderRadius: BorderRadius.circular(5),
                      elevation: 1,
                      color: const Color(0xfffafafa),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: const Color(0xfffafafa),
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child: const Icon(Icons.filter_list),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                const Row(
                  children: [
                    Text('Recent Searches',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: kTextIconGreyColor,
                    ),),
                    Spacer(),
                    Icon(Icons.delete_outline_outlined,color: kTextIconGreyColor,),
                  ],
                ),
                const SizedBox(height: 20,),
                Expanded(
                  child: ListView.builder(itemCount: provider.recentSearches.length,itemBuilder: (_,index){
                    return SizedBox(
                      height: 50,
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: const Icon(Icons.access_time),
                        title:  Text('${provider.recentSearches[index].query}',style: const TextStyle(
                            color: Color(0xff6f6d6b),
                            fontSize: 16,
                            fontWeight: FontWeight.normal),),
                        trailing: const Icon(Icons.clear,color: Color(0xffccd2e3),),
                      ),);
                  }),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
