import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mortalheart_mall/common/common_service.dart';
import 'package:mortalheart_mall/common/constant/index.dart';
import 'package:mortalheart_mall/common/util/screen_util.dart';
import 'package:mortalheart_mall/models/goods_page_info.dart';
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
  GoodsPageInfo goodsPageInfo = GoodsPageInfo.fromJson({});


  @override
  void initState() {
    super.initState();
    queryGoodsListByPage(1);
  }

  queryGoodsListByPage(int currentPage) {
    CommonServiceApi.queryGoodsListByPage(widget.code, currentPage, pageSize).then((value) {
      if (value != null) {
        List<GoodsList> goods = goodsPageInfo.goodsList ?? [];
        List<GoodsList>? goodsList = [...goods, ...value.goodsList];

        setState(() {
          pageNum = currentPage;
          goodsPageInfo = GoodsPageInfo(goodsList: goodsList, totalCount: value.totalCount, totalPageCount: value.totalPageCount);
        });

        if (currentPage < 3) {
          _refreshController.loadComplete();
        } else {
          _refreshController.loadNoData();
        }
      } else {
        _refreshController.loadFailed();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = (getScreenWidth(context) - 20) / 2;
    var goodsList = goodsPageInfo.goodsList ?? [];

    return SmartRefresher(
        key: Key("MasonryGridView_${widget.code}"),
        controller: _refreshController,
        enablePullDown: false,
        enablePullUp: true,
        onLoading: () async {
          queryGoodsListByPage(pageNum + 1);
        },
        child: MasonryGridView.count(
          physics: widget.physics, // 禁止左右滑动
          padding: EdgeInsets.zero,
          itemCount: goodsList.length,
          crossAxisCount: 2,// 几列
          mainAxisSpacing: 10,// 间距
          crossAxisSpacing: 0,
          itemBuilder: (context, index) => goodsItem(context, goodsList[index], width),
        )
    );
  }
}
