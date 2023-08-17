import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';
import 'package:mortalheart_mall/views/home/home_contoller.dart';
import 'package:mortalheart_mall/views/home/widget/SecondFloorWidget.dart';

import 'easy_refresh_util.dart';


 secondaryBuilderHeader(BuildContext context, HomeController controller){
  return SecondaryBuilderHeader(
    header: classicHeader,
    secondaryTriggerOffset: 180,
    builder: ( context, state, header) {
      final mode = state.mode;
      final offset = state.offset;
      final actualSecondaryTriggerOffset =
      state.actualSecondaryTriggerOffset!;
      final actualTriggerOffset = state.actualTriggerOffset;
      double scale = 1;
      if (offset > actualTriggerOffset) {
        var math;
        scale = math.max(
            0.0,
            (actualSecondaryTriggerOffset - offset) /
                (actualSecondaryTriggerOffset - actualTriggerOffset)
        );
      }
      return  SecondFloorWidget(
        scale,
        mode,
        header,
        state,
        height: state.offset,
        controller.freshController,
        controller,
      );
    },
  );
}