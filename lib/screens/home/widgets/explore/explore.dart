import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:shoptronics/screens/home/widgets/explore/explore_product_card.dart';
import 'package:shoptronics/stores/store.dart';
import 'package:shoptronics/data_models/product.dart';

class Explore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 32.0),
          child: Text(
            "Explore",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
        ExploreProductList(),
      ],
    );
  }
}

class ExploreProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AppStore>(context);
    return Observer(
      builder: (context) => SizedBox(
          height: 250,
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 32.0),
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: store.products.length,
            itemBuilder: (context, index) => Provider<Product>.value(
                value: store.products[index], child: ExploreProductCard()),
          )),
    );
  }
}
