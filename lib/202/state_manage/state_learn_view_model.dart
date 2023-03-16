import 'package:flutter/material.dart';
import 'package:flutter_veli_full/202/state_manage/state_manage_learn_view.dart';

abstract class StateLearnViewModel extends State<StateManageLearnView> {
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  bool isVisible = false;
  bool isOpacity = false;
  void changeVisible() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  void changeOpacity() {
    setState(() {
      isOpacity = !isOpacity;
    });
  }
}
