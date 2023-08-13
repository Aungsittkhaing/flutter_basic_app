import 'package:flutter/material.dart';
const _animatedIcons = <String, AnimatedIconData>{
  'add_event': AnimatedIcons.add_event,
  'arrow_menu': AnimatedIcons.arrow_menu,
  'close_menu': AnimatedIcons.close_menu,
  'ellipsis_search': AnimatedIcons.ellipsis_search,
  'event_add': AnimatedIcons.event_add,
  'home_menu': AnimatedIcons.home_menu,
  'list_view': AnimatedIcons.list_view,
  'menu_arrow': AnimatedIcons.menu_arrow,
  'menu_close': AnimatedIcons.menu_close,
  'menu_home': AnimatedIcons.menu_home,
  'pause_play': AnimatedIcons.pause_play,
  'search_ellipsis': AnimatedIcons.search_ellipsis,
  'view_list': AnimatedIcons.view_list
};
class AnimatedIconExample extends StatelessWidget {
  const AnimatedIconExample({super.key});

  @override
  Widget build(BuildContext context) {
    List<_AnimatedIconDemoBox> animatedIconDemoBox = [];
    for(final kv in _animatedIcons.entries){
      animatedIconDemoBox.add(
        _AnimatedIconDemoBox(name: kv.key, iconData: kv.value)
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Icons'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          const Text('Click on the icon to forward/reverse the animation'),
          const Divider(),
          Wrap(
            spacing: 10.0,
            children: animatedIconDemoBox
          )
        ],
      ),
    );
  }
}
class _AnimatedIconDemoBox extends StatefulWidget {
  final String name;
  final AnimatedIconData iconData;
  const _AnimatedIconDemoBox({required this.name, required this.iconData, super.key});

  @override
  State<_AnimatedIconDemoBox> createState() => _AnimatedIconDemoBoxState();
}

class _AnimatedIconDemoBoxState extends State<_AnimatedIconDemoBox> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500)
    );
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(_animationController.isCompleted){
          _animationController.reverse();
        }else{
          _animationController.forward();
        }
      },
      child: AnimatedIcon(
        icon: widget.iconData,
        progress: _animationController,
        size: 128,
      ),
    );
  }
}