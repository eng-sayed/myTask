import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:mytask/domain/models/message_model.dart';
import 'package:sms_advanced/sms_advanced.dart';

part 'all_message_state.dart';

class AllMessageCubit extends Cubit<AllMessageState> {
  AllMessageCubit() : super(AllMessageInitial());
  static AllMessageCubit get(context) => BlocProvider.of(context);
  final SmsQuery query = SmsQuery();
  List<SmsThread> threads = [];
  List<MessageModel> allMessages = [];

  num total = 0;
  RegExp aStr = RegExp(r'(^\d*\.?\d*)');
  var reg = RegExp(r'\s+(\d+\.\d+)\s+', multiLine: true);

  getAllMessages() {
    emit(GetMessagesLoading());
    query.getAllThreads.then((value) {
      threads = value;
      total = 0;
      allMessages = [];
      value.forEach((element) {
        element.messages.forEach((message) {
          var mes = message.body;

          var match = reg.firstMatch(mes ?? '')?.group(0);

          var amout = num.tryParse(match ?? '0');

          total += (amout ?? 0);

          MessageModel messageModel = MessageModel(
              year: message.date?.year,
              day: message.date?.day,
              month: message.date?.month,
              body: message.body,
              sender: element.contact?.address,
              amount: amout);
          allMessages.add(messageModel);
        });
      });
      // threads = value;
      // total = 0;

      // allMessages.forEach((element) {
      //   var mes = element.body;

      //   var match = reg.firstMatch(mes ?? '')?.group(0);

      //   var amout = num.tryParse(match ?? '0');

      //   total += (amout ?? 0);
      // });

      emit(GetMessagesSuccess());
    });
  }

  searchInMessages(String text) async {
    if (text.isNotEmpty) {
      threads = [];

      List<MessageModel> Search = [];
      //query.getAllThreads.then((value) {
      Search = allMessages;
      allMessages = [];
      total = 0;

      Search.forEach((element) {
        if (element.sender?.toLowerCase().contains(text.toLowerCase()) ??
            false) {
          // threads.add(element);
          //element.messages.forEach((message) {
          var mes = element.body;

          var match = reg.firstMatch(mes ?? '')?.group(0);

          var amout = num.tryParse(match ?? '0');

          total += (amout ?? 0);

          MessageModel messageModel = MessageModel(
              year: element.year,
              day: element.day,
              month: element.month,
              body: element.body,
              sender: element.sender,
              amount: amout);
          allMessages.add(messageModel);
          //});
        } else {
          if (element.body?.toLowerCase().contains(text.toLowerCase()) ??
              false) {
            var mes = element.body;

            var match = reg.firstMatch(mes ?? '')?.group(0);

            var amout = num.tryParse(match ?? '0');

            total += (amout ?? 0);

            MessageModel messageModel = MessageModel(
                year: element.year,
                day: element.day,
                month: element.month,
                body: element.body,
                sender: element.sender,
                amount: amout);
            allMessages.add(messageModel);
          }
        }
      });
      // if (allMessages.isEmpty) {
      //   total = 0;

      //   Search.forEach((element) {
      //     element.messages.forEach((message) {
      //       if (message.body?.toLowerCase().contains(text.toLowerCase()) ??
      //           false) {
      //         var mes = message.body;

      //         var match = reg.firstMatch(mes ?? '')?.group(0);

      //         var amout = num.tryParse(match ?? '0');

      //         total += (amout ?? 0);

      //         MessageModel messageModel = MessageModel(
      //             year: message.date?.year,
      //             day: message.date?.day,
      //             month: message.date?.month,
      //             body: message.body,
      //             sender: element.contact?.address,
      //             amount: amout);
      //         allMessages.add(messageModel);
      //       }
      //     });
      //   });
      // }
      emit(GetMessagesSuccess());
    }

    emit(SearhMessagesSuccess());

    if (text.isEmpty) {
      getAllMessages();

      emit(SearhMessagesSuccess());
    }
  }

  Timer? searchOnStoppedTyping;

  onChangeHandler(value) {
    const duration = Duration(milliseconds: 500);
    if (searchOnStoppedTyping != null) {
      searchOnStoppedTyping?.cancel();
      emit(StartTimerMessagesSuccess());
    }
    searchOnStoppedTyping = Timer(duration, () {
      searchInMessages(value);
      emit(EndTimerMessagesSuccess());
    });
  }
}
