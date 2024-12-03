import 'package:flutter/material.dart';

class CodeSource extends StatefulWidget {
  const CodeSource({super.key});

  @override
  State<CodeSource> createState() => _CodeSourceState();
}

class _CodeSourceState extends State<CodeSource> with SingleTickerProviderStateMixin {

   late AnimationController _controller;
  late Animation<Offset> _animation;
  bool _islogged = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _animation = Tween<Offset>(
      begin: const Offset(-0.27, 0.0),
      end: const Offset(0.09, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
   void _toggleAnimation() {
    if (_controller.isCompleted) {
      _controller.reverse();
      _islogged = false;
      
    } else {
      _controller.forward();
      _islogged = true;
      ;
    }
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Align(
             alignment: Alignment.topCenter,
             child: Padding(
               padding: EdgeInsets.only(
                 top: MediaQuery.sizeOf(context).height * 0.2,
               ),
               child: SizedBox(
                 width: 315,
                 child: Container(
                   height: 54,
                   width: 315,
                   alignment: const Alignment(1.0, 0.0),
                   padding:
                       const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                   decoration: BoxDecoration(
                     color: Colors.grey,
                     borderRadius: BorderRadius.circular(28),
                   ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       _islogged == true? Padding(
                                padding: const EdgeInsets.only(left: 20),
                               child: GestureDetector(
                                 onTap: _toggleAnimation,
                                 child: Text(
                                   "Phone number",
                                   style: TextStyle()),
                                 ),
                               )
                           : const SizedBox(),
          
                       SlideTransition(
                         position: _animation,
                         child: Container(
                           height: 48,
                           width: 164,
                           alignment: Alignment.center,
                           decoration: BoxDecoration(
                               color: Colors.white,
                               borderRadius: BorderRadius.circular(28)),
                           child: _islogged == false
                               ? Text(
                                   "Phone number",
                                   style: TextStyle(),
                                 )
                               : Text(
                                   "Email",
                                   style: TextStyle(),
                                 ),
                         ),
                       ),
          
                       _islogged == false
                           ? Padding(
                               padding: const EdgeInsets.only(right: 20),
                               child: GestureDetector(
                                 onTap:_toggleAnimation,
                                 child: Text(
                                   "Email",
                                   style: TextStyle()
                                       .copyWith(color: Colors.white),
                                 ),
                               ),
                             )
                           : const SizedBox(),
                     ],
                   ),
                 ),
               ),
             ),
           );
  }
}