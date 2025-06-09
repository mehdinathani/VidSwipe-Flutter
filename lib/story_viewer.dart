import 'package:flutter/material.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/utils.dart';
import 'package:story_view/widgets/story_view.dart';

class StoryViewer extends StatelessWidget {
  final StoryController controller = StoryController();

  StoryViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Flutter Reels Demo')),
      body: StoryView(
        controller: controller,
        storyItems: [
          StoryItem.text(
            title: "This is a text-only reel!",
            backgroundColor: Colors.blue,
          ),
          StoryItem.pageImage(
            url:
                "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?q=80&w=1965&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            controller: controller,
          ),
          StoryItem.pageVideo(
            "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
            controller: controller,
          ),
        ],
        onComplete: () {
          debugPrint("Completed a cycle");
        },
        onVerticalSwipeComplete: (direction) {
          if (direction == Direction.down) {
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
