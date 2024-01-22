import 'package:flutter/material.dart';
import 'package:mega_mall/features/home/domain/entities/product_entity.dart';

class ProductItem extends StatelessWidget {
  final ProductEntity product;
  const ProductItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                          child: Image(
            height: 170,
            width: 150,
            image: NetworkImage(
              product.image,
            ),
            fit: BoxFit.cover,
                          ),
                        ),
            Text(product.title,maxLines: 2),
            Text("${product.price}\$",style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 10,
                    ),
                    Text(" ${product.rating.rate}"),
                  ],
                ),
                Row(
                  children: [
                    Text("${product.rating.count}"),
                    const Text(" Reviews"),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}