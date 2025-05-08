import 'package:flutter/material.dart';
import 'package:movie_flutter_app/domain/models/user/register_body.dart';
import 'package:movie_flutter_app/localization/delegate/localization_extensions.dart';
import 'package:movie_flutter_app/presentation/pages/register/widgets/text_fields/password_summary/password_summary_item.dart';
import 'package:movie_flutter_app/utils/constants/dimensions.dart';

class RegisterPasswordSummary extends StatelessWidget {
  const RegisterPasswordSummary({
    super.key,
    required this.body,
    required this.errorList,
  });

  final RegisterBody? body;
  final List<int> errorList;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: Dimensions.marginLarge, top: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          PasswordSummaryItem(
            title: context.strings.eightChar,
            fontColor: body.getPasswordMinCharColor(context, errorList),
          ),
          PasswordSummaryItem(
            title: context.strings.upperLetter,
            fontColor: body.getPasswordUpperLetterColor(context, errorList),
          ),
          PasswordSummaryItem(
            title: context.strings.lowerLetter,
            fontColor: body.getPasswordLowerLetterColor(context, errorList),
          ),
          PasswordSummaryItem(
            title: context.strings.number,
            fontColor: body.getPasswordNumberColor(context, errorList),
          ),
          PasswordSummaryItem(
            title: context.strings.special,
            fontColor: body.getPasswordSpecialCharColor(context, errorList),
          ),
        ],
      ),
    );
  }
}
