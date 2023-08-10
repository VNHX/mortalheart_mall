
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_mall/common/style/common_style.dart';
import 'package:mortalheart_mall/common/util/screen_util.dart';
import 'package:mortalheart_mall/views/cart/cart_controller.dart';
import 'package:mortalheart_mall/widgets/bottom_sheets/cupertino_bottom_sheet.dart';
import 'package:mortalheart_mall/widgets/image/asset_image.dart';

import 'cart_adders.dart';

Widget cartHeader(BuildContext context, CartController cart) {
  return SizedBox(
    height: 45 + getStatusHeight(context),
    child: Container(
        padding: EdgeInsets.only(top: getStatusHeight(context)),
        color: CommonStyle.colorF7CD6B,
        child: Stack(
               fit: StackFit.expand,
               children: <Widget>[
                 const Positioned(
                   left: 10,
                   bottom: 10,
                   child: Text(
                       '购物车',
                       style: TextStyle(
                           fontSize: 16,
                           color: Colors.white,
                           fontWeight: FontWeight.bold
                       )
                   ),
                 ),
                 Positioned(
                     bottom: 10,
                     left: 65,
                     child: InkWell(
                         onTap: ()=>{
                           showCupertinoModalBottomSheet(
                             expand: false,
                             enableDrag:false,
                             bounce:false,
                             context: context,
                             builder: (context) => const CartAdders(),
                           )

                         },
                         child:  Container(
                           height: 25,
                           width: getScreenWidth(context) - 150,
                           decoration: BoxDecoration(
                             borderRadius: const BorderRadius.only(
                               topLeft: Radius.circular(1),
                               bottomLeft: Radius.circular(15.0),
                               topRight: Radius.circular(12.0),
                               bottomRight: Radius.circular(12.0),

                             ),
                             color: CommonStyle.colorF8D47F,
                           ),
                           child: Row(
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: <Widget>[
                               SizedBox(
                                   width: 24,
                                   height: 24,
                                   child: UnconstrainedBox(
                                     child: assetImage('images/address.png', 16, 16),
                                   )
                               ),
                               Expanded(
                                 flex: 1,
                                 child: Container(
                                   height: 24.0,
                                   alignment: Alignment.centerLeft,
                                   padding: const EdgeInsets.only(right: 2),
                                   child: Obx(() => Text(
                                       '配送至:${cart.isCheckAdders.value}',
                                       maxLines: 1,
                                       overflow: TextOverflow.ellipsis,
                                       style: const TextStyle(
                                           color: Colors.white,
                                           fontSize: 13
                                       )
                                   ),
                                   ),
                                 ),
                               )
                             ],
                           ),
                         )
                     )
                 ),
                 Positioned(
                     bottom: 10,
                     right: 10,
                     child:SizedBox(
                       height: 25,
                       width: 65.0,
                       child:Row(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           Container(
                               margin: const EdgeInsets.only(right: 5.0),
                               child:  InkWell(
                                 onTap: () => cart.isAddersOnTap(!cart.isAdders.value),
                                 child: Obx(() =>  Text(
                                     cart.isAdders.value?'完成':'编辑',
                                     maxLines: 1,
                                     overflow: TextOverflow.ellipsis,
                                     style: const TextStyle(
                                         color: Colors.white,
                                         fontSize: 13
                                     )
                                 ),),
                               )
                           ),
                           Container(
                             margin: const EdgeInsets.only(left: 6.0),
                             child: assetImage('images/ellipsis.png', 28, 28),
                           )
                         ],
                       ),
                     )
                 )
               ],
        ),
    ),
  );
}
