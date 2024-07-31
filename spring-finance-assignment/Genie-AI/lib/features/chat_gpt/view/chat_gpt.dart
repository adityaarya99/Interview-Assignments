import 'package:flutter/material.dart';
import 'package:genie/constant/color_constant.dart';
import 'package:genie/constant/string_constant.dart';
import 'package:genie/features/chat_gpt/controller/chat_gpt_controller.dart';
import 'package:genie/features/chat_gpt/model/message_type_model.dart';
import 'package:genie/features/onboarding/view/onboarding_screen.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:genie/constant/asset_constant.dart';

bool isLoading = false;

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _textController = TextEditingController();
  final List<ChatMessage> _messages = [];
  final ChatGptController _chatGptController = Get.put(ChatGptController());

  List<Map<String, dynamic>> questionaireList = [
    {
      "title": "Write & Edit",
      "icon": "Icons.accessibility_sharp",
      "first_suggestion": "Write an email for requesting work from home",
      "second_suggestion": "Write a tweet about World Hunger",
      "third_suggestion": "Write a song about flowers and love",
    },
    {
      "title": "Translate",
      "first_suggestion": "How do you say 'Good Morning' in French?",
    },
    {
      "title": "Get Recipes",
      "first_suggestion": "How to make sushi",
      "second_suggestion": "How to make pancakes",
    },
    {
      "title": "Do Math",
      "first_suggestion": "Solve this math problem 3x + 2 = 4",
    }
  ];
  @override
  void initState() {
    super.initState();
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: AppColor.whiteColor,
              )),
          title: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 16.0),
                child: const CircleAvatar(
                  radius: 22,
                  backgroundColor: Color.fromRGBO(16, 163, 127, 1),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage:
                        NetworkImage(StringConstant.genieNetworkImage),
                  ),
                ),
              ),
              const Text(
                "Genie AI",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(() => const Onboarding());
                },
                icon: const Icon(
                  Icons.info_outline,
                  color: AppColor.whiteColor,
                ))
          ],
          backgroundColor: AppColor.blackColor,
        ),
        backgroundColor: AppColor.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(6.0),
          child: SafeArea(
            child: Stack(
              children: [
                Column(
                  children: [
                    const Divider(
                      thickness: 1.0,
                      height: 1,
                      color: AppColor.botBackgroundColor,
                    ),
                    (_messages.isEmpty)
                        ? Expanded(child: _suggestQuestions('Write & Edit'))
                        : Expanded(
                            child: _buildList(),
                          ),
                    SizedBox(
                      width: 50,
                      child: Visibility(
                        visible: isLoading,
                        child: Lottie.asset(AssetConstants.smoothTyping),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          _buildInput(),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ListView _buildList() {
    return ListView.builder(
      reverse: true,
      physics: const BouncingScrollPhysics(),
      itemCount: _messages.length,
      itemBuilder: (context, index) {
        int reverseIndex = _messages.length - index - 1;
        var message = _messages[reverseIndex];
        return ChatMessageWidget(
          text: message.text,
          chatMessageType: message.chatMessageType,
        );
      },
    );
  }

  Expanded _buildInput() {
    return Expanded(
      child: SizedBox(
        child: TextField(
          textAlign: TextAlign.left,
          textCapitalization: TextCapitalization.sentences,
          style: const TextStyle(color: Colors.white),
          controller: _textController,
          decoration: InputDecoration(
            suffixIcon: Visibility(
              visible: !isLoading,
              child: IconButton(
                icon: const Icon(
                  Icons.send_rounded,
                  size: 30,
                  color: Color.fromRGBO(142, 142, 160, 1),
                ),
                onPressed: () async {
                  setState(
                    () {
                      _messages.add(
                        ChatMessage(
                          text: _textController.text,
                          chatMessageType: ChatMessageType.user,
                        ),
                      );
                      isLoading = true;
                    },
                  );
                  var input = _textController.text;
                  _textController.clear();
                  // Future.delayed(const Duration(milliseconds: 50))
                  //     .then((_) => _scrollDown());
                  _chatGptController.getMessage(input).then((value) {
                    setState(() {
                      isLoading = false;
                      _messages.add(
                        ChatMessage(
                          text: value.value,
                          chatMessageType: ChatMessageType.bot,
                        ),
                      );
                    });
                  });
                  _textController.clear();
                  // Future.delayed(const Duration(milliseconds: 50))
                  //     .then((_) => _scrollDown());
                },
              ),
            ),
            hintText: 'Ask me anything...',
            hintStyle: const TextStyle(color: Colors.grey),
            fillColor: AppColor.blackColor,
            filled: true,
            border: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppColor.botBackgroundColor, width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            focusedBorder: const OutlineInputBorder(
              borderSide:
                  BorderSide(color: AppColor.botBackgroundColor, width: 2.0),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide:
                  BorderSide(color: AppColor.botBackgroundColor, width: 2.0),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide:
                  BorderSide(color: AppColor.botBackgroundColor, width: 2.0),
            ),
            disabledBorder: const OutlineInputBorder(
              borderSide:
                  BorderSide(color: AppColor.botBackgroundColor, width: 2.0),
            ),
          ),
        ),
      ),
    );
  }

  Widget questionWidget(String question) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .01,
        ),
        Container(
          width: MediaQuery.of(context).size.width * .9,
          height: MediaQuery.of(context).size.height * .06,
          decoration: BoxDecoration(
            color: AppColor.botBackgroundColor,
            border: Border.all(),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(
            child: Text(question,
                style: const TextStyle(
                    color: AppColor.whiteColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w700)),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .01,
        ),
      ],
    );
  }

  Widget _suggestQuestions(String title) {
    return ListView.builder(
      itemCount: questionaireList.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            const Icon(
              Icons.accessibility_sharp,
              color: AppColor.whiteColor,
            ),
            Text(questionaireList[index]['title'],
                style:
                    const TextStyle(color: AppColor.whiteColor, fontSize: 16)),
            SizedBox(
              height: MediaQuery.of(context).size.height * .005,
            ),
            if (questionaireList[index]['first_suggestion'] != null)
              questionWidget(questionaireList[index]['first_suggestion']),
            if (questionaireList[index]['second_suggestion'] != null)
              questionWidget(questionaireList[index]['second_suggestion']),
            if (questionaireList[index]['third_suggestion'] != null)
              questionWidget(questionaireList[index]['third_suggestion']),
            SizedBox(
              height: MediaQuery.of(context).size.height * .01,
            ),
          ],
        );
      },
    );
  }
}

class ChatMessageWidget extends StatelessWidget {
  const ChatMessageWidget({
    super.key,
    required this.text,
    required this.chatMessageType,
  });

  final String text;
  final ChatMessageType chatMessageType;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      padding: const EdgeInsets.all(16),
      child: (chatMessageType == ChatMessageType.bot)
          ? Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 16.0),
                  child: const CircleAvatar(
                    backgroundColor: Color.fromRGBO(16, 163, 127, 1),
                    backgroundImage:
                        NetworkImage(StringConstant.genieNetworkImage),
                  ),
                ),
                Container(
                  constraints: const BoxConstraints(maxWidth: 310),
                  padding: const EdgeInsets.all(8.0),
                  decoration: const BoxDecoration(
                    color: AppColor.chatBackgroundContainerColor,
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  child: Text(
                    text.trim(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.white),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  constraints: const BoxConstraints(maxWidth: 310),
                  padding: const EdgeInsets.all(8.0),
                  decoration: const BoxDecoration(
                    color: AppColor.chatBackgroundContainerColor,
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  child: Text(
                    text,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.white),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 16.0),
                  child: const CircleAvatar(
                    backgroundImage:
                        NetworkImage(StringConstant.aladdinNetworkImage),
                    // child: Icon(
                    //   Icons.person,
                    // ),
                  ),
                ),
              ],
            ),
    );
  }
}
