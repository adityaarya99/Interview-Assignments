import 'package:genie/features/chat_gpt/repository/chat_gpt_repository.dart';
import 'package:get/get.dart';

class ChatGptController extends GetxController {
  ChatGptRepository _chatGptRepository = ChatGptRepository();
  RxString message = ''.obs;

  Future<RxString> getMessage(String input) async {
    message.value = await _chatGptRepository.generateResponse(input);
    return message;
  }
}
