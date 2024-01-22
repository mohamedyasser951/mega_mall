import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_mall/config/images.dart';
import 'package:mega_mall/features/home/presentation/bloc/home_bloc.dart';
import 'package:mega_mall/features/home/presentation/widgets/category_header.dart';
import 'package:mega_mall/features/home/presentation/widgets/product_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Mega Mall",
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
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
                  suffixIcon:
                      SvgPicture.asset(AppImages.search, fit: BoxFit.scaleDown),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
            ),
            const SizedBox(
              height: 20.0,
            ),
            // Container(
            //   height: 150,
            //   color: Colors.red,
            //   child: ListView.separated(
            //     separatorBuilder: (context, index) => const SizedBox(
            //       width: 10,
            //     ),
            //     itemCount: banners.length,
            //     scrollDirection: Axis.horizontal,
            //     physics: const BouncingScrollPhysics(),
            //     itemBuilder: (context, index) => Container(
            //       width: 400,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(12),
            //       ),
            //       child: SvgPicture.asset(
            //         banners[index],
            //         fit: BoxFit.cover,
            //       ),
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: 12.0,
            ),
            const CategoryHeader(),

            const ProductsBuilder(),
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



class ProductsBuilder extends StatelessWidget {
  const ProductsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is GetAllProductLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetAllProductSuccessState) {
          return Container(
            height: 500,
            width: double.infinity,
            child: GridView.builder(
              itemCount: state.products.length,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  childAspectRatio: 0.87),
              itemBuilder: (context, index) {
                return ProductItem(
                  product: state.products[index],
                );
              },
            ),
          );
        }
        return const Center(
          child: Text("SomeThing Went Wrong"),
        );
      },
    );
  }
}
