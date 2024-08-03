import 'package:flutter/material.dart';
import 'package:flutter_application_1/api_path.dart';
import 'package:http/http.dart' as http;

class MyDialog {
  Future<void> warningDialog({
    required BuildContext context,
    required String tittle,
    required Function()? onYes,

  }){
    return showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: Column(
          children: [
            Icon(Icons.info_outline, color: Colors.blue, size: 30),
            Text(tittle),
          ],
        ),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: onYes,
                child: Text('Yes'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('No'),
              )
            ],
          )
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/api_path.dart';
// import 'package:http/http.dart' as http;

// class MyDialog {
//   Future<void> warningDialog({
//     required BuildContext context,
//     required String title,
//     required Function()? onYes,
//   }) async {
//     return showDialog<void>(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(title),
//           content: Text('Are you sure you want to delete this product?'),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () async {
//                 final uri = Uri.parse(ApiPath.BASE_URL + 'product');
//                 final response = await http.delete(uri);

//                 if (response.statusCode == 200) {
//                   if (onYes != null) {
//                     onYes();
//                   }
//                   Navigator.of(context).pop(); // Close the dialog on success
//                 } else {
//                   throw Exception('Failed to delete product');
//                 }
//               },
//               child: const Text('Yes'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the dialog
//               },
//               child: const Text('No'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
