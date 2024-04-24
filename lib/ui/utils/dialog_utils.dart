import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

class DialogUtils {
  static void showLoading(
      {required BuildContext context, required String message}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColor.primaryColor,
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const CircularProgressIndicator(
                  backgroundColor: AppColor.primaryColor,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(message,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: AppColor.whiteColor,
                        )),
              ],
            ),
          ),
        );
      },
    );
  }

  static void hideDialog(BuildContext context) {
    Navigator.of(context).pop();
  }

  static void showMessage({
    required BuildContext context,
    String? message,
    String? title,
    String? posActionName,
    Function? posAction,
    String? negActionName,
    Function? negAction,
  }) {
    List<Widget> actions = [];
    if (posActionName != null) {
      actions.add(TextButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primaryColor,
        ),
        child: Text(
          posActionName,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: AppColor.primaryColor,
                fontSize: 18,
              ),
        ),
        onPressed: () {
          Navigator.pop(context);
          if (posAction != null) {
            posAction.call();
          }
        },
      ));
    }
    if (negActionName != null) {
      actions.add(TextButton(
        child: Text(negActionName),
        onPressed: () {
          Navigator.pop(context);
          if (negAction != null) {
            negAction.call();
          }
        },
      ));
    }
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColor.darkPrimaryColor,
          content: Text(
            message!,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: AppColor.whiteColor),
          ),
          title: Text(
            title ?? '',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          actions: actions,
        );
      },
    );
  }
}
