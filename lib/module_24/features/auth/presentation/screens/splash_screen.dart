import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ostad_flutter_sazu/module_24/app/assets_paths.dart';
import 'package:ostad_flutter_sazu/module_24/app/utils/app_version_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Spacer(),
              SvgPicture.asset(AssetsPaths.logosSvg,width: 125,),
              Spacer(),
              CircularProgressIndicator(),
              SizedBox(height:12),
              // TODO'${context localization.version}'
              Text('Version ${AppVersionService.currentVersion}'),
            ],
          ),
        ),

      ),
    );
  }
}
