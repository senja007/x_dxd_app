import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Diperlukan jika menggunakan date picker (showDatePicker).
import 'package:crud_flutter_api/app/utils/app_color.dart';

class CustomInput extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final bool disabled;
  final EdgeInsetsGeometry margin;
  final bool obsecureText;
  final Widget? suffixIcon;
  final bool isDate;
  final bool isNumber;
  final bool isClickEmpty;
  const CustomInput({super.key, 
    required this.controller,
    required this.label,
    required this.hint,
    this.disabled = false,
    this.margin = const EdgeInsets.only(bottom: 16),
    this.obsecureText = false,
    this.isDate = false,
    this.suffixIcon,
    this.isNumber = false,
    this.isClickEmpty = false,
    String? errorText,
    OutlineInputBorder? border,
  });
  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  @override
  Widget build(BuildContext context) {
    print("builded");
    return Material(
      color: const Color(0xffF7EBE1),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(left: 14, right: 14, top: 4),
        margin: widget.margin,
        decoration: BoxDecoration(
          color: (widget.disabled == false)
              ? Colors.white
              : AppColor.primaryExtraSoft,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 1, color: AppColor.secondaryExtraSoft),
        ),
        child: TextField(
          readOnly: widget.disabled,
          obscureText: widget.obsecureText,
          style: const TextStyle(fontSize: 14, fontFamily: 'poppins'),
          maxLines: 1,
          controller: widget.controller,
          keyboardType:
              widget.isNumber ? TextInputType.number : TextInputType.text,
          onTap: () async {
            if (widget.isDate) {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(
                    1900), //DateTime.now() - not to allow to choose before today.
                lastDate: DateTime.now(),
              );
              if (pickedDate != null) {
                print(
                    pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                String formattedDate =
                    DateFormat('dd/MM/yyyy').format(pickedDate);
                print(
                    formattedDate); //formatted date output using intl package => 2021-03-16
                //you can implement different kind of Date Format here according to your
                requirement:
                setState(() {
                  widget.controller.text =
                      formattedDate; //set output date to TextField value.
                });
              } else {
                print("Date is not selected");
              }
            }
            if (widget.isClickEmpty) {
              setState(() {
                widget.controller.text = "";
              });
            }
          },
          decoration: InputDecoration(
            suffixIcon: widget.suffixIcon ?? const SizedBox(),
            label: Text(
              widget.label,
              style: TextStyle(
                color: AppColor.secondarySoft,
                fontSize: 14,
              ),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: InputBorder.none,
            hintText: widget.hint,
            hintStyle: TextStyle(
              fontSize: 14,
              fontFamily: 'poppins',
              fontWeight: FontWeight.w500,
              color: AppColor.secondarySoft,
            ),
          ),
        ),
      ),
    );
  }
}








// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart'; // Diperlukan jika menggunakan date picker (showDatePicker).
// import 'package:crud_flutter_api/app/utils/app_color.dart';

// class CustomInput extends StatefulWidget {
//   final TextEditingController controller;
//   final String label;
//   final String hint;
//   final bool disabled;
//   final EdgeInsetsGeometry margin;
//   final bool obsecureText;
//   final Widget? suffixIcon;
//   final bool isDate;
//   final bool isNumber;
//   final bool isClickEmpty;
//   CustomInput({
//     required this.controller,
//     required this.label,
//     required this.hint,
//     this.disabled = false,
//     this.margin = const EdgeInsets.only(bottom: 16),
//     this.obsecureText = false,
//     this.isDate = false,
//     this.suffixIcon,
//     this.isNumber = false,
//     this.isClickEmpty = false,
//     String? errorText,
//     OutlineInputBorder? border,
//   });
//   @override
//   State<CustomInput> createState() => _CustomInputState();
// }

// class _CustomInputState extends State<CustomInput> {
//   @override
//   Widget build(BuildContext context) {
//     print("builded");
//     return Material(
//       color: Color(0xffF7EBE1),
//       child: Container(
//         width: MediaQuery.of(context).size.width,
//         padding: EdgeInsets.only(left: 14, right: 14, top: 4),
//         margin: widget.margin,
//         decoration: BoxDecoration(
//           color: (widget.disabled == false)
//               ? Colors.white
//               : AppColor.primaryExtraSoft,
//           borderRadius: BorderRadius.circular(8),
//           border: Border.all(width: 1, color: AppColor.secondaryExtraSoft),
//         ),
//         child: TextField(
//           readOnly: widget.disabled,
//           obscureText: widget.obsecureText,
//           style: TextStyle(fontSize: 14, fontFamily: 'poppins'),
//           maxLines: 1,
//           controller: widget.controller,
//           keyboardType:
//               widget.isNumber ? TextInputType.number : TextInputType.text,
//           onTap: () async {
//             if (widget.isDate) {
//               DateTime? pickedDate = await showDatePicker(
//                 context: context,
//                 initialDate: DateTime.now(),
//                 firstDate: DateTime(
//                     1900), //DateTime.now() - not to allow to choose before today.
//                 lastDate: DateTime.now(),
//               );
//               if (pickedDate != null) {
//                 print(
//                     pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
//                 String formattedDate =
//                     DateFormat('dd-MM-yyyy').format(pickedDate);
//                 print(
//                     formattedDate); //formatted date output using intl package => 2021-03-16
//                 //you can implement different kind of Date Format here according to your
//                 requirement:
//                 setState(() {
//                   widget.controller.text =
//                       formattedDate; //set output date to TextField value.
//                 });
//               } else {
//                 print("Date is not selected");
//               }
//             }
//             if (widget.isClickEmpty) {
//               setState(() {
//                 widget.controller.text = "";
//               });
//             }
//           },
//           decoration: InputDecoration(
//             suffixIcon: widget.suffixIcon ?? SizedBox(),
//             label: Text(
//               widget.label,
//               style: TextStyle(
//                 color: AppColor.secondarySoft,
//                 fontSize: 14,
//               ),
//             ),
//             floatingLabelBehavior: FloatingLabelBehavior.always,
//             border: InputBorder.none,
//             hintText: widget.hint,
//             hintStyle: TextStyle(
//               fontSize: 14,
//               fontFamily: 'poppins',
//               fontWeight: FontWeight.w500,
//               color: AppColor.secondarySoft,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
