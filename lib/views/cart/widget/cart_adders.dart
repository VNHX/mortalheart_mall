import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_mall/common/util/screen_util.dart';
import 'package:mortalheart_mall/views/cart/cart_controller.dart';
import 'package:mortalheart_mall/widgets/image/asset_image.dart';
import 'package:mortalheart_mall/widgets/linear_button.dart';

class CartAdders extends StatelessWidget {
  const CartAdders({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final cart = Get.put(CartController());
    return SizedBox(
        height: 500 + getStatusHeight(context),
        child: Container(
            padding: const EdgeInsets.all(15),
            child:Column(
              children: [
                SizedBox(
                  width: getScreenWidth(context),
                  height: 40 + getStatusHeight(context),
                  child:  Row(
                    children: [
                      Container(
                        width:  getScreenWidth(context) - 60,
                        alignment: Alignment.center,
                        child:const Text(
                          '配送至',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight:FontWeight.w600,
                          ),
                        ) ,
                      ),
                      GestureDetector(
                         onTap: ()=>{
                           Navigator.of(context).pop()
                         },
                      child: assetImage('images/clone.png', 20, 20),
                       ),
                    ],

                  ),
                ),
                Container(
                  height: 350.0,
                  margin: const EdgeInsets.only(top: 6.0,bottom: 6.0),
                  child: ListView.builder(
                      itemCount:cart.addersList.length,
                      itemBuilder: (BuildContext context, int index) {
                        String? detailed = cart.addersList[index].detailed;
                        String? address = cart.addersList[index].address;
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                                width: 25,
                                height: 25,
                                child: detailed == cart.isCheckAdders.value? UnconstrainedBox(
                                  child: assetImage('images/check.png', 17, 17),
                                ): UnconstrainedBox(
                                  child: assetImage('images/address.png', 17, 17),
                                )
                              // ic_check.png
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                alignment: Alignment.centerLeft,
                                margin: const EdgeInsets.only(bottom: 5.0),
                                padding: const EdgeInsets.only(right: 5),
                                child: GestureDetector(
                                    onTap: ()=>{
                                      cart.isCheckAdders.value = cart.addersList[index].detailed ?? '',
                                      Navigator.of(context).pop()
                                    },
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            '$detailed',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600
                                            )
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(top: 4.0,bottom: 4.0),
                                          child: Text(
                                              '$address',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontSize: 13
                                              )
                                          ),
                                        )
                                      ],
                                    )
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                  ),
                ),
                LinearButton(
                    width: getScreenWidth(context),
                    height: 48,
                    btnName: "选择其他地址",
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    onTap: () => print("=======")
                ),
              ],
            )
        )
    );
  }
}