import 'package:flutter/material.dart';
import 'package:flutter_app/animations/animated_container.dart';
import 'package:flutter_app/animations/animated_icons.dart';
import 'package:flutter_app/animations/animation_packages.dart';
import 'package:flutter_app/animations/hero.dart';
import 'package:flutter_app/animations/opacity.dart';
import 'package:flutter_app/appbars/back_drop.dart';
import 'package:flutter_app/appbars/basic_appbar.dart';
import 'package:flutter_app/appbars/bottom_appbar.dart';
import 'package:flutter_app/appbars/convex_appbar.dart';
import 'package:flutter_app/appbars/hidable_bottom.dart';
import 'package:flutter_app/appbars/search_bar.dart';
import 'package:flutter_app/appbars/silver_appbar.dart';
import 'package:flutter_app/async/future_builder.dart';
import 'package:flutter_app/async/stream_builder.dart';
import 'package:flutter_app/home_page.dart';
import 'package:flutter_app/widgets/image.dart';
import 'package:flutter_app/key_example.dart';
import 'package:flutter_app/layouts/container.dart';
import 'package:flutter_app/layouts/expanded.dart';
import 'package:flutter_app/layouts/fractionally_sized_box.dart';
import 'package:flutter_app/layouts/row_column.dart';
import 'package:flutter_app/layouts/stack.dart';
import 'package:flutter_app/layouts/wrap.dart';
import 'package:flutter_app/lists/data_table.dart';
import 'package:flutter_app/lists/expanded_tile.dart';
import 'package:flutter_app/lists/grid_list.dart';
import 'package:flutter_app/lists/list_tile.dart';
import 'package:flutter_app/lists/list_wheel_view.dart';
import 'package:flutter_app/lists/listview_builder.dart';
import 'package:flutter_app/lists/slidable_tile.dart';
import 'package:flutter_app/lists/swipe_dismiss.dart';
import 'package:flutter_app/navigation/bottom_navbar.dart';
import 'package:flutter_app/navigation/bottom_tab_bar.dart';
import 'package:flutter_app/navigation/dialogs.dart';
import 'package:flutter_app/navigation/draggable_scrollable_sheet.dart';
import 'package:flutter_app/navigation/navigation_drawer.dart';
import 'package:flutter_app/navigation/page_selector.dart';
import 'package:flutter_app/navigation/routes.dart';
import 'package:flutter_app/navigation/tab.dart';
import 'package:flutter_app/text_form_field.dart';
import 'package:flutter_app/widgets/button.dart';
import 'package:flutter_app/widgets/card.dart';
import 'package:flutter_app/widgets/dropdown_button.dart';
import 'package:flutter_app/widgets/gradient.dart';
import 'package:flutter_app/widgets/icon.dart';
import 'package:flutter_app/widgets/stateful_widget.dart';
import 'package:flutter_app/widgets/text.dart';
import 'package:flutter_app/widgets/textfield.dart';
import 'lists/reorderable_list.dart';
import 'navigation/bottom_sheet.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic Flutter Lessons',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeExample(),
      routes: {
        RoutesExample.routeName : (context) => const RoutesExample()
      }
    );
  }
}

