
import 'package:chat_application/models/message.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class ChatBuble extends StatelessWidget {
    ChatBuble({super.key,required this.message});
final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,

      child: Container(
        // width: 150,
        // height: 65,

          decoration: BoxDecoration(
             color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(32),
                topLeft: Radius.circular(32),
                bottomRight: Radius.circular(32),
              )),
         padding: EdgeInsets.symmetric(vertical: 16,horizontal: 16),
          margin: EdgeInsets.all(16),

          child: Text(
            message.message,
            style: TextStyle(color: Colors.white),
          ),

      ),
    );

   }
}


class ChatBubleForFriend extends StatelessWidget {
  const ChatBubleForFriend({
    Key? key,
    required this.message,
  }) : super(key: key);

  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.only(left: 16, top: 32, bottom: 32, right: 32),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomLeft: Radius.circular(32),
          ),
          color: Color(0xff006D84),
        ),
        child: Text(
          message.message,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}


// class ChatBubleFrind extends StatelessWidget {
//   ChatBubleFrind({super.key,required this.message});
//   final Message message;
//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.centerLeft,
//
//       child: Container(
//         // width: 150,
//         // height: 65,
//
//         decoration: BoxDecoration(
//             color: kPrimaryColor,
//             borderRadius: BorderRadius.only(
//               topRight: Radius.circular(32),
//               topLeft: Radius.circular(32),
//               bottomRight: Radius.circular(32),
//             )),
//         padding: EdgeInsets.symmetric(vertical: 16,horizontal: 16),
//         margin: EdgeInsets.all(16),
//
//         child: Text(
//           message.message,
//           style: TextStyle(color: Colors.white),
//         ),
//
//       ),
//     );
//
//   }
// }
