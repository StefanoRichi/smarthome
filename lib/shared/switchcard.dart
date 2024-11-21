import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ColorConfig.dart';

class SwitchCard extends StatelessWidget {
  SwitchCard({
    this.title,
    this.subtitle,
    required this.leading,
    required this.value,
    required this.onChanged,
  });

  String? title;
  String? subtitle;
  Widget leading;
  Function(bool val)? onChanged;
  bool value;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: value == true ? shadowColor : Colors.grey.withOpacity(0.4),
            offset: const Offset(
              0,
              4,
            ),
            blurRadius: 4.0,
            spreadRadius: 0,
          )
        ],
        color: const Color(0xffFFFFFF),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 0,
                            blurRadius: 12,
                            offset: Offset(0, 2),
                          )
                        ],
                      ),
                      child: leading),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 0,
                          blurRadius: 12,
                          offset: Offset(0, 2),
                        )
                      ],
                    ),
                    child: Switch(
                      trackOutlineWidth:
                          WidgetStateProperty.resolveWith<double?>(
                              (Set<WidgetState> states) {
                        return 1.0; // Use the default width.
                      }),
                      thumbColor: WidgetStateProperty.resolveWith<Color>(
                          (Set<WidgetState> states) {
                        if (states.contains(WidgetState.selected)) {
                          return shadowColor;
                        }
                        return secondaryColor;
                      }),
                      trackColor: WidgetStateProperty.resolveWith<Color>(
                          (Set<WidgetState> states) {
                        return backgroundColor;
                      }),
                      trackOutlineColor: WidgetStateProperty.resolveWith<Color>(
                          (Set<WidgetState> states) {
                        return backgroundColor;
                      }),
                      value: value,
                      onChanged: onChanged,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, bottom: 25),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    text: TextSpan(
                      text: "${title}\n",
                      style: GoogleFonts.poppins(
                        color: value == true ? textSwitchColor : Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        TextSpan(
                          text: subtitle,
                          style: GoogleFonts.poppins(
                            color:
                                value == true ? textSwitchColor : Colors.black,
                            fontSize: 11,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
