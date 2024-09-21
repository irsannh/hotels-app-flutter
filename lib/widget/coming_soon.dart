import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotelioapp/config/app_asset.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            AppAsset.comingSoon,
            fit: BoxFit.fitHeight,
            height: 120,
          ),
          const SizedBox(height: 20,),
          Text('Coming Soon', style: Theme.of(context).textTheme.headline5!.copyWith(
            fontWeight: FontWeight.w900, color: Colors.black
          ),),
          const SizedBox(height: 8,),
          Text('we are developing this page\nfor new great features', style: Theme.of(context).textTheme.titleMedium, textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}
