import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mortalheart_mall/common/util/screen_util.dart';
import 'package:mortalheart_mall/widgets/goods_item.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PageGoodsList extends StatefulWidget {
  final String code;
  final ScrollPhysics physics;

  const PageGoodsList(this.code, this.physics, {super.key});

  @override
  State<StatefulWidget> createState() => _PageGoodsListState();
}

class _PageGoodsListState extends State<PageGoodsList> {
  final RefreshController _refreshController = RefreshController();

  int pageNum = 1;

  //商品数据


  @override
  void initState() {
    super.initState();
    queryGoodsListByPage(1);
  }

  queryGoodsListByPage(int currentPage) {

  }

  @override
  Widget build(BuildContext context) {
    double width = (getScreenWidth(context) - 20) / 2;
    var goodsList = [];

    return SmartRefresher(
        key: Key("MasonryGridView_${widget.code}"),
        controller: _refreshController,
        enablePullDown: false,
        enablePullUp: true,
        onLoading: () async {
          queryGoodsListByPage(pageNum + 1);
        },
        child: MasonryGridView.count(
          physics: widget.physics,
          padding: EdgeInsets.zero,
          itemCount: goodsList.length,
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 0,
          itemBuilder: (context, index) => goodsItem(context, goodsList[index], width),
        ));
  }
}
