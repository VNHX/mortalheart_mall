import 'package:flutter/material.dart';

double getScreenHeight(BuildContext context) {
  return MediaQuery.sizeOf(context).height;
}

double getScreenWidth(BuildContext context) {
  return MediaQuery.sizeOf(context).width;
}

double getStatusHeight(BuildContext context) {
  return MediaQuery.viewPaddingOf(context).top;
}

double getBottomSpace(BuildContext context) {
  return MediaQuery.viewPaddingOf(context).bottom;
}

double getKeyboardHeight(BuildContext context) {
  return MediaQuery.viewInsetsOf(context).bottom;
}

double getSafeAreaHeight(BuildContext context) {
  return getScreenHeight(context) - getStatusHeight(context) - getBottomSpace(context);
}

/// 获取底部getBottomNavigationBarHeight高度 包含 bottomSpace
double getBottomNavigationBarHeight(BuildContext context) {
  return kBottomNavigationBarHeight + getBottomSpace(context);
}

double calc2Top(scrollY) {
  double result = 45;
  if (scrollY > 0 && scrollY <= 45) {
    result -= scrollY * 0.92;
  } else if (scrollY <= 0) {
    result = 45;
  } else {
    result = 45 * 0.08;
  }
  return result;
}

double calcWidth(double scrollY) {
  double result = 32;
  if (scrollY > 0 && scrollY <= 45) {
    result += scrollY * 2;
  } else if (scrollY <= 0) {
    result = 32;
  } else {
    result = 45 * 2 + 32;
  }
  return result;
}