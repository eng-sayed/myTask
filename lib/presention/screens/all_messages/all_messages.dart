import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytask/core/themes/colors.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:sms_advanced/sms_advanced.dart';

import '../../components/custom_text.dart';
import '../../components/default_text_field.dart';
import 'cubit/all_message_cubit.dart';

class AllMessages extends StatefulWidget {
  const AllMessages({super.key});

  @override
  State<AllMessages> createState() => _AllMessagesState();
}

class _AllMessagesState extends State<AllMessages> {
  @override
  void initState() {
    super.initState();
    final cubit = AllMessageCubit.get(context);
    cubit.getAllMessages();
  }
//   @override
//   void initState() {
//     receiptMessages = await SmsQuery().querySms(address: "receipt");

//     (SmsMessage message in receiptMessages) {
//   // Extract the receipt number from the message
//   RegExp receiptNumberExp = new RegExp(r"Receipt #: (\d+)");
//   var match = receiptNumberExp.firstMatch(message.body);
//   String receiptNumber = match.group(1);
//   print("Receipt number: $receiptNumber");

//   // Extract the total amount from the message
//   RegExp totalAmountExp = new RegExp(r"Total: \$(\d+\.\d+)");
//   match = totalAmountExp.firstMatch(message.body);
//   String totalAmount = match.group(1);
//   print("Total amount: $totalAmount");
// }
//     super.initState();

//   }
// List<SmsMessage> receiptMessages = [];

//  (SmsMessage message in receiptMessages) {
//   // Extract the receipt number from the message
//   RegExp receiptNumberExp = new RegExp(r"Receipt #: (\d+)");
//   var match = receiptNumberExp.firstMatch(message.body);
//   String receiptNumber = match.group(1);
//   print("Receipt number: $receiptNumber");

//   // Extract the total amount from the message
//   RegExp totalAmountExp = new RegExp(r"Total: \$(\d+\.\d+)");
//   match = totalAmountExp.firstMatch(message.body);
//   String totalAmount = match.group(1);
//   print("Total amount: $totalAmount");
// }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AllMessageCubit, AllMessageState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final cubit = AllMessageCubit.get(context);

        return Scaffold(
            bottomNavigationBar: Container(
                color: AppColors.primiry,
                height: 60,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        'Total',
                        color: AppColors.white,
                      ),
                      CustomText(
                        cubit.total.toStringAsFixed(2),
                        color: AppColors.white,
                      ),
                    ],
                  ),
                )),
            appBar: AppBar(
              // backgroundColor: AppColors.primiry,
              centerTitle: true,
              title: CustomText(
                'Messages',
                color: AppColors.white,
              ),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFeildWithCustomValidation(
                  height: 50,
                  validate: (p0) {},
                  keyboardType: TextInputType.multiline,
                  onChange: (p) {
                    cubit.onChangeHandler(p);
                    print(p);
                  },
                ),
                Expanded(
                    child: ListView.builder(
                  itemCount: cubit.allMessages.length,
                  itemBuilder: (context, index) {
                    return Container(
                      color: AppColors.primiry.withOpacity(.5),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                              color: AppColors.primiry.withOpacity(.5),
                              height: 60,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                          cubit.allMessages[index].sender ?? '',
                                          color: AppColors.white,
                                        ),
                                        CustomText(
                                          "${cubit.allMessages[index].day ?? ''}/ ${cubit.allMessages[index].month ?? ''}/${cubit.allMessages[index].year ?? ''}",
                                          color: AppColors.white,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                          "${cubit.allMessages[index].amount ?? ''} AED",
                                          color: AppColors.white,
                                        ),
                                        // CustomText(
                                        //   "${cubit.threads[index].messages[messagesindex].date?.day ?? ''}/ ${cubit.threads[index].messages[messagesindex].date?.month ?? ''}/${cubit.threads[index].messages[messagesindex].date?.year ?? ''}",
                                        //   color: AppColors.white,
                                        // ),
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomText(
                                  cubit.allMessages[index].body ?? ''),
                            )),
                          ),
                          // ListTile(
                          //   minVerticalPadding: 8,
                          //   minLeadingWidth: 4,
                          //   title: Text(cubit.allMessages[index]
                          //           .body ??
                          //       ''),
                          //   subtitle: Row(
                          //     children: [
                          //       Text(cubit.threads[index].contact?.address ??
                          //           ''),
                          //       SizedBox(
                          //         width: 20,
                          //       ),
                          //       Text(
                          //           "${cubit.threads[index].messages[messagesindex].date?.year ?? ''}/"),
                          //       Text(
                          //           "${cubit.threads[index].messages[messagesindex].date?.month ?? ''}/"),
                          //       Text(
                          //           "${cubit.threads[index].messages[messagesindex].date?.day ?? ''}"),
                          //     ],
                          //   ),
                          // ),
                          const Divider()
                        ],
                      ),
                    );
                  },
                ))
              ],
            ));
      },
    );
  }
}
