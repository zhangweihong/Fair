/*
 * Copyright (C) 2005-present, 58.com.  All rights reserved.
 * Use of this source code is governed by a BSD type license that can be
 * found in the LICENSE file.
 */

import 'package:fair/fair.dart';
import 'package:fair_example/src/page/home_page.dart';
import 'package:fair_example/src/page/list/sample_list_with_dynamic_cell_page.dart';
import 'package:fair_example/src/page/fair_page.dart';
import 'package:fair_example/src/page/logic_home_page.dart';
import 'package:fair_example/src/page/modules.dart';
import 'package:fair_example/src/page/plugins/net/fair_plugin.dart';
import 'package:fair_example/src/page/plugins/net/sampe_list_view_src.dart';
import 'package:fair_example/src/page/plugins/permission/fair_permission_plugin.dart';
import 'package:flutter/material.dart';
import 'src/proxy/list_proxy.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //todo 是否可以通过注解的方式注册
  FairPluginDispatcher.registerPlugin('FairNet', FairNet());
  FairPluginDispatcher.registerPlugin('WBPermission', WBPermission());

  Runtime().loadCoreJs().then((value) => _runApp());
}

void _runApp() {
  runApp(FairApp(
    modules: {
      ShowFairAlertModule.tagName: () => ShowFairAlertModule(),
    },
    delegate: {
      'listLoadMore': (ctx, _) => ListDelegate(),
    },
    child: MaterialApp(
      // home: FairWidget(
      //   // todo：测试demo
      //   // name: 'widget_method_demo',
      //   // path: 'assets/bundle/lib_widget_method_demo.json',
      //   // data: {
      //   //   'index2': 3,
      //   //   'index3': 4,
      //   // },
      //   // name: 'hello_world',
      //   // path: 'assets/bundle/lib_src_page_hello_world.fair.bin',
      //   name: 'listLoadMore',
      //   jsPath: 'assets/js/lib_src_page_fair_example_main.fair.js',
      //   path: 'assets/bundle/lib_src_page_fair_example_main.fair.json',
      // ),
      home: HomePage(),
      routes: {
        'sample_dynamic_page': (_) => SampleWanAndroidPageSrc(),
        'sample_list_with_dynamic_cell_page': (_) => DynamicCellPage(),
        'sample_logic_home_page': (_) => LogicHomePage(),
        'fair_page': (context) => FairPage(_getParams(context, 'route'),
            data: _getParams(context, 'data')),
      },
    ),
  ));
}

_getParams(BuildContext context, String key) =>
    (ModalRoute.of(context).settings.arguments is Map)
        ? (ModalRoute.of(context).settings.arguments as Map)[key]
        : null;
