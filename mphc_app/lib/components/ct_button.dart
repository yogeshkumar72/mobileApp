import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class CtButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  const CtButton({super.key,
  required this.text,
  required this.onTap,
  });


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child:Container(
        decoration: BoxDecoration(
          color:Theme.of(context).colorScheme.onSecondaryContainer,
          borderRadius: BorderRadius.circular(7)
        ),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        padding:const EdgeInsets.all(17),
        child:Center(
          child:Text(text,style:TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color:Theme.of(context).colorScheme.onSecondary)),
        )
      ),
    );
  }
}