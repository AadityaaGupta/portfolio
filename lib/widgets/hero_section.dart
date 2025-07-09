// lib/widgets/hero_section.dart
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import '../utils/app_colors.dart';
import '../utils/app_constants.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 800;

    return Container(
      height: MediaQuery.of(context).size.height - 90,
      decoration: const BoxDecoration(
        gradient: AppColors.primaryGradient,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: isDesktop
            ? Row(
                children: [
                  Expanded(child: _buildContent(context)),
                  const SizedBox(width: 40),
                  Expanded(child: _buildImage()),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildContent(context),
                  const SizedBox(height: 40),
                  _buildImage(),
                ],
              ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hello, I\'m',
          style: GoogleFonts.poppins(
            fontSize: 24,
            color: Colors.white.withOpacity(0.9),
            fontWeight: FontWeight.w300,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          AppConstants.developerName,
          style: GoogleFonts.poppins(
            fontSize: 48,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 60,
          child: AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                'Flutter Developer',
                textStyle: GoogleFonts.poppins(
                  fontSize: 24,
                  color: Colors.white.withOpacity(0.9),
                  fontWeight: FontWeight.w500,
                ),
                speed: const Duration(milliseconds: 100),
              ),
              TypewriterAnimatedText(
                'Mobile App Developer',
                textStyle: GoogleFonts.poppins(
                  fontSize: 24,
                  color: Colors.white.withOpacity(0.9),
                  fontWeight: FontWeight.w500,
                ),
                speed: const Duration(milliseconds: 100),
              ),
              TypewriterAnimatedText(
                'UI/UX Enthusiast',
                textStyle: GoogleFonts.poppins(
                  fontSize: 24,
                  color: Colors.white.withOpacity(0.9),
                  fontWeight: FontWeight.w500,
                ),
                speed: const Duration(milliseconds: 100),
              ),
            ],
            repeatForever: true,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Passionate about creating attractive and functional mobile applications',
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: Colors.white.withOpacity(0.8),
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 32),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                downloadCV(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: AppColors.primary,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: Text(
                'Download CV',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(width: 16),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(color: Colors.white),
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: Text(
                'Contact Me',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildImage() {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white.withOpacity(0.3),
          width: 4,
        ),
      ),
      child: ClipOval(
        child: Container(
          color: Colors.white.withOpacity(0.1),
          child: Icon(
            Icons.person,
            size: 150,
            color: Colors.white.withOpacity(0.7),
          ),
        ),
      ),
    );
  }



Future<void> downloadCV(BuildContext context) async {
  const String fileUrl = 'https://drive.google.com/file/d/1D5bcuAazgW71N8T7dy2IwMD9Kkizboes/view?usp=drivesdk';
  const String fileName = 'My_CV.pdf';

  final status = await Permission.storage.request();
  if (status.isGranted) {
    final dir = await getExternalStorageDirectory();
    final String savePath = "${dir!.path}/$fileName";

    try {
      final dio = Dio();
      final response = await dio.download(fileUrl, savePath);
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('CV downloaded to $savePath')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Download failed: $e')),
      );
    }
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Permission denied')),
    );
  }
}


}
