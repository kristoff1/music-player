import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:music_player/helper/logic_helper.dart';
import 'package:music_player/pages/home/service/music_service.dart';

import '../network/api/music_api.dart';

class InheritedInjection extends InheritedWidget {
  InheritedInjection({required this.child}) : super(child: child);

  final Widget child;

  final MusicApi musicApi = MusicApi();

  final MusicService musicService = MusicService();

  final LogicHelper logicHelper = LogicHelper();

  final http.Client httpClient = http.Client();

  static InheritedInjection of(BuildContext context) {
    final InheritedInjection? result = (context.dependOnInheritedWidgetOfExactType<InheritedInjection>());
    assert(result != null, 'No Injection found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

}