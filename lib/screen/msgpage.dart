import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final List<String> _messageItems = <String>[];

  void _addMessageItem(String task) {
    if (task.isNotEmpty) {
      setState(() => _messageItems.add(task));
    }
  }

  void _removeMessageItem(int index) {
    setState(() => _messageItems.removeAt(index));
  }

  void _promptRemoveMessageItem(int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text('Mark ${_messageItems[index]} as complete?'),
              actions: <Widget>[
                TextButton(
                    child: const Text('Cancel'),
                    onPressed: () => Navigator.of(context).pop()),
                TextButton(
                    child: const Text('Delete'),
                    onPressed: () {
                      _removeMessageItem(index);
                      Navigator.of(context).pop();
                    })
              ]);
        });
  }

  Widget _buildMessageList() {
    return ListView.builder(
      itemCount: _messageItems.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildMessageItem(_messageItems[index], index);
      },
    );
  }

  Widget _buildMessageItem(String messageText, int index) {
    return ListTile(
        title: Text(messageText),
        onLongPress: () => _promptRemoveMessageItem(index));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Message'),
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
        ),
        body: _buildMessageList(),
        floatingActionButton: FloatingActionButton(
            onPressed: _pushAddMessageScreen,
            tooltip: 'Add task',
            child: const Icon(Icons.add)),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      ),
    );
  }

  void _pushAddMessageScreen() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: const Text('Chat person')),
            body: TextField(
              autofocus: true,
              onSubmitted: (String val) {
                _addMessageItem(val);
                Navigator.pop(context);
              },
              decoration: const InputDecoration(
                  hintText: 'Write message here...',
                  contentPadding: EdgeInsets.all(16.0)),
            ));
      },
    ));
  }
}
