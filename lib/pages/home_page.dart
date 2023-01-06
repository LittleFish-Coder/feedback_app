import 'package:feedback_app/services/feedback_service.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

final feedbackProvider = StateProvider<String?>((ref) => null);

final FeedbackService feedbackService = FeedbackService();

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final TextEditingController _feedbackTextFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Please write down your feedback below"),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              width: 400,
              child: TextField(
                controller: _feedbackTextFieldController,
                // style: const TextStyle(fontSize: 12),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  labelText: 'Feedback',
                ),
                maxLines: 5,
                minLines: 1,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton.icon(
              onPressed: (){
                debugPrint("Feedback: ${_feedbackTextFieldController.text}");
                feedbackService.sendFeedback(_feedbackTextFieldController.text);
                _feedbackTextFieldController.clear();
              },
              icon: const Icon(Icons.send),
              label: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}