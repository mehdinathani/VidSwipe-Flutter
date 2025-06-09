import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:reels_viewer/reels_viewer.dart';

class InstaStyle extends StatefulWidget {
  const InstaStyle({super.key});

  @override
  State<InstaStyle> createState() => _InstaStyleState();
}

class _InstaStyleState extends State<InstaStyle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReelsViewer(
        reelsList: reelsList,
        appbarTitle: 'Instagram Reels',
        onShare: (url) {
          log('Shared reel url ==> $url');
        },
        onLike: (url) {
          log('Liked reel url ==> $url');
        },
        onFollow: () {
          log('======> Clicked on follow <======');
        },
        onComment: (comment) {
          log('Comment on reel ==> $comment');
        },
        onClickMoreBtn: () {
          log('======> Clicked on more option <======');
        },
        onClickBackArrow: () {
          log('======> Clicked on back arrow <======');
        },
        onIndexChanged: (index) {
          log('======> Current Index ======> $index <========');
        },
        showProgressIndicator: true,
        showVerifiedTick: false,
        showAppbar: false,
      ),
    );
  }
}

List<ReelModel> reelsList = [
  ReelModel(
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    'Nature Lover',
    likeCount: 5280,
    isLiked: true,
    musicName: ' Peaceful Moments',
    reelDescription: "A beautiful butterfly in slow motion! 🦋",
    profileUrl:
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3',
    commentList: [
      ReelCommentModel(
        comment: 'So calming to watch!',
        userProfilePic:
            'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3',
        userName: 'John Doe',
        commentTime: DateTime.now(),
      ),
    ],
  ),
  ReelModel(
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4',
    'Adventure Seeker',
    likeCount: 1250,
    isLiked: false,
    musicName: 'Upbeat Adventure',
    reelDescription: "Having some fun in the great outdoors!",
    profileUrl:
        'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3',
  ),
  ReelModel(
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    'Cartoon Fan',
    likeCount: 9987,
    isLiked: true,
    musicName: 'Original Animation Audio',
    reelDescription: "A classic! Who remembers Big Buck Bunny?",
    profileUrl:
        'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3',
  ),
  ReelModel(
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
    'SciFi World',
    likeCount: 3421,
    isLiked: false,
    musicName: 'Cyber Dreams',
    reelDescription: "Exploring strange new worlds. #scifi #blender",
    profileUrl:
        'https://images.unsplash.com/photo-1521119989659-a83eee488004?q=80&w=1923&auto=format&fit=crop&ixlib=rb-4.0.3',
  ),
  ReelModel(
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4',
    'Movie Buff',
    likeCount: 7654,
    isLiked: true,
    musicName: 'Action Movie Trailer',
    reelDescription: "Epic scene from Tears of Steel.",
    profileUrl:
        'https://images.unsplash.com/photo-1580489944761-15a19d654956?q=80&w=1961&auto=format&fit=crop&ixlib=rb-4.0.3',
  ),
  ReelModel(
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4',
    'Fantasy Art',
    likeCount: 8123,
    isLiked: false,
    musicName: 'Sad Fantasy Theme',
    reelDescription: "The animation in Sintel is just breathtaking.",
    profileUrl:
        'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3',
  ),
  ReelModel(
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WeAreGoingOnBullrun.mp4',
    'Flutter Dev',
    likeCount: 2024,
    isLiked: true,
    musicName: 'Coding Music',
    reelDescription: "How it feels to finally fix a bug! #flutter #developer",
    profileUrl:
        'https://images.unsplash.com/photo-1633332755192-727a05c4013d?q=80&w=2080&auto=format&fit=crop&ixlib=rb-4.0.3',
  ),
];
