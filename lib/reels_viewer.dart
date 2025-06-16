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

// List<ReelModel> reelsList = [
//   ReelModel(
//     'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
//     'Nature Lover',
//     likeCount: 5280,
//     isLiked: true,
//     musicName: ' Peaceful Moments',
//     reelDescription: "A beautiful butterfly in slow motion! 🦋",
//     profileUrl:
//         'https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3',
//     commentList: [
//       ReelCommentModel(
//         comment: 'So calming to watch!',
//         userProfilePic:
//             'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3',
//         userName: 'John Doe',
//         commentTime: DateTime.now(),
//       ),
//     ],
//   ),
//   ReelModel(
//     'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4',
//     'Adventure Seeker',
//     likeCount: 1250,
//     isLiked: false,
//     musicName: 'Upbeat Adventure',
//     reelDescription: "Having some fun in the great outdoors!",
//     profileUrl:
//         'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3',
//   ),
//   ReelModel(
//     'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
//     'Cartoon Fan',
//     likeCount: 9987,
//     isLiked: true,
//     musicName: 'Original Animation Audio',
//     reelDescription: "A classic! Who remembers Big Buck Bunny?",
//     profileUrl:
//         'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3',
//   ),
//   ReelModel(
//     'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
//     'SciFi World',
//     likeCount: 3421,
//     isLiked: false,
//     musicName: 'Cyber Dreams',
//     reelDescription: "Exploring strange new worlds. #scifi #blender",
//     profileUrl:
//         'https://images.unsplash.com/photo-1521119989659-a83eee488004?q=80&w=1923&auto=format&fit=crop&ixlib=rb-4.0.3',
//   ),
//   ReelModel(
//     'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4',
//     'Movie Buff',
//     likeCount: 7654,
//     isLiked: true,
//     musicName: 'Action Movie Trailer',
//     reelDescription: "Epic scene from Tears of Steel.",
//     profileUrl:
//         'https://images.unsplash.com/photo-1580489944761-15a19d654956?q=80&w=1961&auto=format&fit=crop&ixlib=rb-4.0.3',
//   ),
//   ReelModel(
//     'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4',
//     'Fantasy Art',
//     likeCount: 8123,
//     isLiked: false,
//     musicName: 'Sad Fantasy Theme',
//     reelDescription: "The animation in Sintel is just breathtaking.",
//     profileUrl:
//         'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3',
//   ),
//   ReelModel(
//     'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WeAreGoingOnBullrun.mp4',
//     'Flutter Dev',
//     likeCount: 2024,
//     isLiked: true,
//     musicName: 'Coding Music',
//     reelDescription: "How it feels to finally fix a bug! #flutter #developer",
//     profileUrl:
//         'https://images.unsplash.com/photo-1633332755192-727a05c4013d?q=80&w=2080&auto=format&fit=crop&ixlib=rb-4.0.3',
//   ),
// ];

List<ReelModel> reelsList = [
  ReelModel(
    // This would be a 5-second video of the Nike shoes
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4',
    'Nike Air Max 270', // Product Name
    likeCount: 18270, // Can represent "Saves" or "Wishlist" count
    isLiked: true,
    musicName: '\$160.00 USD', // Price
    reelDescription:
        "Walk on air. A modern icon with a futuristic feel.", // Product Tagline
    profileUrl: // Brand Logo
        'https://static.vecteezy.com/system/resources/previews/010/994/232/original/nike-logo-black-with-name-brand-clothes-design-icon-abstract-football-illustration-with-white-background-free-vector.jpg',
    commentList: [
      // Product Reviews
      ReelCommentModel(
        comment: 'Most comfortable shoes I own!',
        userProfilePic:
            'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6',
        userName: 'Alex',
        commentTime: DateTime.now(),
      ),
      ReelCommentModel(
        comment: 'Look even better in person. 10/10',
        userProfilePic:
            'https://images.unsplash.com/photo-1438761681033-6461ffad8d80',
        userName: 'Sarah',
        commentTime: DateTime.now(),
      ),
    ],
  ),
  ReelModel(
    // This would be a 5-second video of the Apple Watch
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WeAreGoingOnBullrun.mp4',
    'Apple Watch Ultra 2', // Product Name
    likeCount: 25000,
    isLiked: false,
    musicName: '\$799.00 USD', // Price
    reelDescription: "The most rugged and capable Apple Watch ever.",
    profileUrl: // Brand Logo
        'https://i.pinimg.com/originals/1b/24/57/1b245749a2636b281f6aba51a2f6479a.png',
  ),
  ReelModel(
    // This would be a 5-second video of the headphones
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4',
    'Sony WH-1000XM5 Headphones', // Product Name
    likeCount: 32500,
    isLiked: true,
    musicName: '\$399.00 USD', // Price
    reelDescription:
        "Your world. Nothing else. Industry-leading noise cancellation.",
    profileUrl: // Brand Logo
        'https://1000logos.net/wp-content/uploads/2021/05/Sony-logo.png',
  ),
  ReelModel(
    // This would be a 5-second video of a camera
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4',
    'Fujifilm X-T5 Mirrorless Camera', // Product Name
    likeCount: 15432,
    isLiked: false,
    musicName: '\$1,699.00 USD', // Price
    reelDescription: "Pure photography. Portable, powerful, and timeless.",
    profileUrl: // Brand Logo
        'https://1000logos.net/wp-content/uploads/2021/07/Fujifilm-Logo.png',
  ),
];
