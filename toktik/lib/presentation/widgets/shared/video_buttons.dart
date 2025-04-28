import 'package:flutter/material.dart';
import 'package:toktik/config/helpers/human_formats.dart';
import 'package:toktik/domain/entities/video_post.dart';


class VideoButtons extends StatelessWidget {

  final VideoPost videoPost;

  const VideoButtons({super.key, required this.videoPost});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomButton(icon: Icons.favorite, count: videoPost.likes, iconColor: Colors.red,),
        _CustomButton(icon: Icons.remove_red_eye_outlined, count: videoPost.views,),
      ],
      

    );
  }
}

class _CustomButton extends StatelessWidget {
  
  final IconData icon;
  final int count;
  final Color? color;

  
  
  const _CustomButton({
    required this.icon,
    required this.count,
    iconColor}): color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: (){},
          icon: Icon(icon, color: color, size: 30,),

        ),
        Text(
          HumanFormats.formatNumber(count.toDouble()),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ]
    );
  }
}