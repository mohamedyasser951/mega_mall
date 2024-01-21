import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_mall/config/images.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mega Mall"),
        centerTitle: true,
        actions: [
          SvgPicture.asset(AppImages.bell),
          const SizedBox(
            width: 15.0,
          ),
          SvgPicture.asset(AppImages.shoppingCart),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Search Product Name",
                  
                  suffixIcon: SvgPicture.asset(
                    AppImages.search,
                 fit: BoxFit.scaleDown
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),

                  )),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              height: 150,
              color: Colors.red,
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(width: 10,),
                itemCount: banners.length,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => Container(
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SvgPicture.asset(banners[index],fit: BoxFit.cover,),
                ),
              ),
            ),
         const SizedBox(height: 12.0,),
         const CategoryHeader(),

         CategoryItem(),

         
          ],
        ),
      ),
    );
  }
}

List<String> banners = [
  AppImages.banner1,
  AppImages.banner2,
  AppImages.banner3,
];
class CategoryHeader extends StatelessWidget {

  const CategoryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Categories"),
            Text("See All",style: TextStyle(color: Color(0xff3669C9)),),
          ],
        ),
      ],
    );
  }
}


class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
    
    const SizedBox(height: 4.0,),
    const Text("electronics"),
      ],
    );
  }
}