import 'package:flutter/material.dart';

class MockBandInfo {
  final String name;
  final int votes;

  const MockBandInfo({this.name, this.votes});
}

class ProfileViewScreen extends StatelessWidget {
  const ProfileViewScreen({
    Key key,
  }) : super(key: key);

  static const List<MockBandInfo> _bandList = [
    const MockBandInfo(name: "Name 1", votes: 1),
    const MockBandInfo(name: "Name 2", votes: 2),
    const MockBandInfo(name: "Name 3", votes: 3),
    const MockBandInfo(name: "Name 4", votes: 4),
  ];

  Widget _buildListItem(BuildContext context, MockBandInfo bandInfo) {
    return ListTile(
      title: Row(
        children: [
          Expanded(
            child: Text(
              bandInfo.name,
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Color(0xffddddff),
            ),
            padding: const EdgeInsets.all(10.0),
            child: Text(
              bandInfo.votes.toString(),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Stream'),
      ),
      body: ListView.builder(
        itemExtent: 80.0,
        itemCount: _bandList.length,
        itemBuilder: (context, index) =>
            _buildListItem(context, _bandList[index]),
      ),
    );
  }
}
