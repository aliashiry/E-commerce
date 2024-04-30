import 'package:e_commerce/ui/widget/custom_searsh.dart';
import 'package:flutter/material.dart';

class CustomSearchWithShoppingCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: CustomSearch(),
        ),
      ],
    );
  }
}
