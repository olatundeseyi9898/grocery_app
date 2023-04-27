import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/screens/cart/cart_widget.dart';
import 'package:grocery_app/widgets/empty_screen.dart';
import 'package:grocery_app/services/global_methods.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/widgets/text_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    bool _isEmpty = true;
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: TextWidget(
            text: 'Cart (2)',
            color: color,
            textSize: 22,
            isTitle: true,
          ),
          actions: [
            IconButton(
              onPressed: () {
                GlobalMethods.warningDialog(
                    title: 'Empty your cart?',
                    subtitle: 'Are you sure?',
                    fct: () {},
                    context: context);
              },
              icon: Icon(
                IconlyBroken.delete,
                color: color,
              ),
            ),
          ]),
      body: _isEmpty
          ? const EmptyScreen(
              title: 'Your cart is empty',
              subtitle: 'Add something and make me happy :)',
              buttontext: 'Shop Now',
              imagePath: 'assets/images/cart.png',
            )
          : Column(
              children: [
                _checkout(ctx: context),
                Expanded(
                  child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (ctx, index) {
                        return CartWidget();
                      }),
                ),
              ],
            ),
    );
  }

  Widget _checkout({required BuildContext ctx}) {
    final Color color = Utils(ctx).color;
    Size size = Utils(ctx).getScreenSize;
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Material(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: TextWidget(
                    text: 'Order Now',
                    textSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const Spacer(),
            FittedBox(
              child: TextWidget(
                text: 'Total: \$0.259',
                color: color,
                textSize: 18,
                isTitle: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
