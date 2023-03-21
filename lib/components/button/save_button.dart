import 'package:brain_heart/components/button/button.dart';
import 'package:brain_heart/schemata/color_schema.dart';
import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  final ButtonType buttonType;
  final String? title;
  final Function()? onTap;

  const SaveButton({Key? key, this.buttonType = ButtonType.disable, this.onTap,this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 4,
      child: Stack(
        // mainAxisSize: MainAxisSize.min,
        // mainAxisAlignment: MainAxisAlignment.end,
        alignment: Alignment.bottomCenter,
        children: [
          IgnorePointer(
            ignoring: true,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                // color: Colors.red,

                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    ColorSchema.whiteColor.withOpacity(0.1),
                    ColorSchema.whiteColor.withOpacity(1.0),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: SizedBox(
              width: 150,
              child: Button(
                height: 54,
                title:title?? "save",
                buttonType: buttonType,
                onTap: () {
                  if (onTap != null) {
                    onTap!();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
