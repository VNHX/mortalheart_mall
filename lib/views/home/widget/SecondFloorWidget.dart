import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mortalheart_mall/views/home/home_contoller.dart';
import 'package:mortalheart_mall/widgets/image/asset_image.dart';

class SecondFloorWidget  extends StatefulWidget {
  final scale;
  final mode;
  final header;
  final state;
  final double hight;
  final double opacity ;
  final freshController;
  final HomeController controller;
  const SecondFloorWidget(
      this.scale,
      this.mode,
      this.header,
      this.state,
      this.freshController,
      this.controller,
      {
        required this.hight,
        required this.opacity,
      });
  @override
  State<SecondFloorWidget > createState() => _SecondFloorWidgetState();
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<HomeController>('controller', controller));
  }

}

class _SecondFloorWidgetState extends State<SecondFloorWidget >  {
  late Timer _timer;
  late Timer _timer2;
  late int count = 0;
  late int pagecount = 3;
  late bool pageFloor = false;
  floorStartTime() async {
    //设置启动图生效时间
    var duration = const Duration(seconds: 1);
    Timer(duration, () {
      // 空等1秒之后再计时
      _timer = Timer.periodic(const Duration(milliseconds: 200), (v) {
        pagecount--;
        if (pagecount == 0) {
          _timer?.cancel();
          navigationPage(widget.freshController,widget.mode);
        }
        setState(() {
        });
      });
    });
  }
  startTime() async {
    //设置启动图生效时间
    // 空等1秒之后再计时
    _timer2 = Timer.periodic(const Duration(milliseconds: 1000), (v) {
      ///自增
      count++;

      ///到5秒后停止
      if (count == 10) {
        _timer2?.cancel();
      }
      setState(() {});
    });
  }
  void navigationPage(freshController,mode)  {
    print('跳转传$freshController');
    pageFloor = true;

  }
  void cloneOpen() async {
    print('这是清除二层楼状态');
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
    _timer2?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    print('二层楼${widget.mode}');
    print('是否打开活动页面；${pageFloor}');
    if(widget.mode==IndicatorMode.secondaryArmed){
      startTime();
    }
    if( widget.mode == IndicatorMode.secondaryReady ){
      floorStartTime();
    }
    if(widget.mode == IndicatorMode.secondaryOpen && pageFloor){
      cloneOpen();
    }
    // TODO: implement build
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          height: widget.state.offset,
          width: double.infinity,
          child:CachedNetworkImage(
            width:double.infinity,
            height: widget.state.offset,
            imageUrl:  widget.controller.homebj.value ?? '' ,
            placeholder: (context, url) => assetImage("images/default.png", double.infinity, widget.state.offset),
            errorWidget: (context, url, error) => assetImage("images/default.png", double.infinity, widget.state.offset),
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          bottom: 24,
          left: 0,
          right: 0,
          child: wightText(widget.mode,count),
        ),
        Opacity(
          opacity: (
              widget.mode == IndicatorMode.secondaryOpen ||  widget.mode ==  IndicatorMode.secondaryReady||
                  widget.mode == IndicatorMode.secondaryClosing)
              ? 0
              : widget.scale,
          child: widget.header.build(context, widget.state),
        ),
      ],
    );
  }
}


wightText(mode, int count){
  return  Center(
    child: AnimatedOpacity(
      opacity: mode == IndicatorMode.secondaryArmed
          ? 1
          : 0,
      duration: const Duration(milliseconds: 400),
      child:  count > 3?const Text(
        '松开有惊喜',
        style:TextStyle(
            color: Colors.white
        ),
      ):const Text(
        '继续下拉有惊喜',
        style:TextStyle(
            color: Colors.white
        ),
      ),
    ),
  );
}
