import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_group_list_view/flutter_group_list_view.dart';
import 'package:get/get.dart';
import 'package:mortalheart_mall/common/style/common_style.dart';
import 'package:mortalheart_mall/views/cart/cart_controller.dart';
import 'package:mortalheart_mall/widgets/bottom_sheets/cupertino_bottom_sheet.dart';
import 'package:mortalheart_mall/widgets/image/asset_image.dart';
import 'package:mortalheart_mall/widgets/stepper/stepper.dart';
import 'package:mortalheart_mall/widgets/stepper/style.dart';

Widget cartGoods(BuildContext context, CartController cart) {

    return GroupSliverListView(
      sectionCount: cart.cartGoods.length,
      itemInSectionCount: (int section) {
        return cart.cartGoods[section].goodsList?.length ?? 0;
      },
      headerForSectionBuilder: (int section) {

        return Obx(() =>
            Container(
              height: 50,
              margin: const EdgeInsets.only(left: 12, right: 12,top: 10,),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                color: Colors.white,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 28,
                    margin: const EdgeInsets.only(left: 12),
                    child: Checkbox(
                        value: cart.selectCartGoodsparamList.contains(cart.cartGoods[section].storeCode),
                        shape: const CircleBorder(),
                        activeColor: Colors.red,
                        onChanged: (bool? va) {
                          print(section);
                          cart.selectStoreGoodsAction(cart.cartGoods[section].storeCode!,va!,section);
                        }),
                  ),
                  GestureDetector(
                      onTap: () {

                      },
                      child: Row(
                        children: [
                          assetImage("images/store.png", 24, 24),
                          Container(
                              margin: const EdgeInsets.only(left: 6),
                              child: Text(
                                  cart.cartGoods[section].storeName!,
                                  style: const TextStyle(
                                      fontSize: 16
                                  )
                              )
                          ),
                          assetImage("images/arrow_right.png", 20, 20)
                        ],
                      )
                  )
                ],
              ),
            )
        );
      },
      itemInSectionBuilder: (BuildContext context, IndexPath indexPath) {
        return Obx(() =>
            Container(
              margin: const EdgeInsets.only(left: 12, right: 12),
              color: Colors.white,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 28,
                    margin: const EdgeInsets.only(left: 12),
                    child: Checkbox(
                        value: cart.selectCartGoodsList.value.contains(cart.cartGoods[indexPath.section].goodsList![indexPath.index].code!),
                        shape: const CircleBorder(),
                        activeColor: Colors.red,
                        onChanged: (bool? va) {
                          cart.selectCartGoodsAction(cart.cartGoods[indexPath.section].goodsList![indexPath.index].code!);
                        }),
                  ),
                  Container(
                    width: 92,
                    height: 92,
                    margin: const EdgeInsets.only(left: 10),
                    child: CachedNetworkImage(
                      imageUrl: cart.cartGoods[indexPath.section].goodsList![indexPath.index].imgUrl!,
                      placeholder: (context, url) => assetImage("images/default.png", 92, 92),
                      errorWidget: (context, url, error) => assetImage("images/default.png", 92, 92),
                      fit: BoxFit.fill,
                    ),
                  ),
                  Expanded(
                      child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cart.cartGoods[indexPath.section].goodsList![indexPath.index].description!,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: CommonStyle.color777677),
                              ),
                              Container(
                                  padding: const EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 2),
                                  margin: const EdgeInsets.only(top: 4),
                                  decoration: BoxDecoration(
                                    color: CommonStyle.colorF1F1F1,
                                    borderRadius: const BorderRadius.all(Radius.circular(6)),
                                  ),
                                  child: InkWell(
                                    child: Text(
                                      "黑色/银色，42，选服务",
                                      style: TextStyle(fontSize: 12, color: CommonStyle.color969798),
                                    ),
                                    onTap: ()=>{
                                      // showCupertinoModalBottomSheet(
                                      //   expand: false,
                                      //   enableDrag:false,
                                      //   bounce:false,
                                      //   context: context,
                                      //   builder: (context) => const GoogsDetailPop(),
                                      // )
                                    },
                                  )
                              ),
                              Container(
                                  margin: const EdgeInsets.only(top: 4),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "￥${cart.cartGoods[indexPath.section].goodsList![indexPath.index].price!}",
                                        style: const TextStyle(fontSize: 20, color: Colors.red, fontWeight: FontWeight.w500),
                                      ),
                                      StepperInt(
                                        value: cart.cartGoods[indexPath.section].goodsList[indexPath.index].num,
                                        size: 25,
                                        style: StepperStyle(
                                          foregroundColor: Colors.black87,
                                          activeForegroundColor: Colors.black87,
                                          activeBackgroundColor: Colors.white,
                                          border: Border.all(color: Colors.grey),
                                          elevation: 0,
                                          buttonAspectRatio: 1.5,
                                        ),
                                        didChangeCount: (int value) {
                                          cart.changeCartGoodsNumAction(cart.cartGoods[indexPath.section].goodsList![indexPath.index].code!, value);
                                        },
                                      )
                                    ],
                                  )
                              )
                            ],
                          )
                      )
                  )
                ],
              ),
            )
        );
      },
      separatorBuilder: (IndexPath indexPath) {
        return Container(
          width: MediaQuery.of(context).size.width - 200,
          height: 1,
          color: cart.cartGoods[indexPath.section].goodsList?.length != indexPath.index + 1 ? CommonStyle.greyBgColor2 : Colors.white,
        );
      },
      footerForSectionBuilder: (int section) {
        double marginBottom = section + 1 != cart.cartGoods.length ? 10 : 0.0;
        return Container(
          height: 10,
          margin: EdgeInsets.only(left: 12, right: 12, bottom: marginBottom),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
            color: Colors.white,
          ),
        );
      },
    );
}
