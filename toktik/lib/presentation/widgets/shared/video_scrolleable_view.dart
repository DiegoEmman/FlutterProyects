import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/presentation/widgets/shared/video_buttons.dart';

class VideoScrolleableView extends StatelessWidget {
  
  final List<VideoPost> videos;
  
  const VideoScrolleableView({
    super.key, 
    required this.videos
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Stack(
          children: [
            Positioned(
              bottom: 40,
              right: 20,
              child: VideoButtons(
                videoPost: videos[index],
              ),
            ),

          ],
        );
      },
    );
  }
}