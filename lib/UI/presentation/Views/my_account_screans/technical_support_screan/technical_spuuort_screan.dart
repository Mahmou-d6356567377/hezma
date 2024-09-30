import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hezma/Data/Errors/failures.dart';
import 'package:hezma/Data/Repo/my_account_screan_repos/settings_repo/settings_repo_IMPL.dart';
import 'package:hezma/Data/models/my_account_screan_models/setting_model/datum.dart';
import 'package:hezma/utils/API/api_service.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hezma/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:permission_handler/permission_handler.dart';

class TechnicalSupportScrean extends StatelessWidget {
  const TechnicalSupportScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'الدعم الفني',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'STVBold',
          ),
        ),
      ),
      body: FutureBuilder<Either<Failure, List<settingModel1>>>(
        future: SettingsRepoImpl(ApiService(Dio())).fetchSettings(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('خطأ: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isLeft()) {
            return const Center(child: Text('لا توجد بيانات'));
          }

          // Unwrapping the right side of Either
          final settings = snapshot.data!.getOrElse(() => []);

          final phone = _getSettingValue(settings, 'phone');
          final whatsApp = _getSettingValue(settings, 'whatsApp') ?? 'رقم غير متوفر';
          final instagram = _getSettingValue(settings, 'Instagram');
          final snapchat = _getSettingValue(settings, 'Snapchat');
          final twitter = _getSettingValue(settings, 'X');

          return SingleChildScrollView(
            child: Column(
              children: [
                Image.asset('assets/images/Frame.png'),
                const SizedBox(height: 20),
               const Text(
                  'تواصل معنا عبر',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    fontFamily: 'STVBold',
                  ),
                ),
                const SizedBox(height: 20),
                if (phone != null && phone.isNotEmpty)
                  _buildContactButton(
                    context,
                    'الجوال',
                    
                    Colors.green,
                    () => _launchPhoneNumber(context, phone),
                  ),
                if (whatsApp != null && whatsApp != 'رقم غير متوفر')
            _buildContactButton(context, 'الواتس اب', const  Color(backgroundcustomgreen), ()=>_launchWhatsApp(context, whatsApp),),
                if (phone == null || phone.isEmpty)
                
                 _buildContactButton(context, 'الهاتف', 
                 const Color(backgroundcustomgreen),
                  (){

                 }),
                if (whatsApp == 'رقم غير متوفر')
                  const Center(child: Text('رقم الواتس اب غير متوفر')),
                const SizedBox(height: 20),
                const Text(
                  'تابعونا على',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    fontFamily: 'STVBold',
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (instagram != null)
                      _buildCircleButton(
                        context,
                        FontAwesomeIcons.instagram,
                        () => _launchInstagram(instagram),
                      ),
                    const SizedBox(width: 10),
                    if (snapchat != null)
                      _buildCircleButton(
                        context,
                        Icons.snapchat,
                        () => _launchSnapchat(snapchat),
                      ),
                    const SizedBox(width: 10),
                    if (twitter != null)
                      _buildCircleButton(
                        context,
                        //?
                        FontAwesomeIcons.twitter,
                        () => _launchTwitter(twitter),
                      ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  String? _getSettingValue(List<settingModel1> settings, String settingName) {
    return settings.firstWhere(
      (setting) => setting.name == settingName, // Adjusted to access the property correctly
      orElse: () => settingModel1(value: null), // Make sure to return a default model
    ).value;
  }

  Widget _buildContactButton(BuildContext context, String text,
      Color color, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          print('Button pressed: $text'); // Log button press
          onPressed();
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(200, 50),
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.phone),
            const SizedBox(width: 10),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'STVBold',
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircleButton(
      BuildContext context, IconData icon, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[300],
        ),
        child: ClipOval(
          child: Icon(icon),
        ),
      ),
    );
  }

  void _launchPhoneNumber(BuildContext context, String? phoneNumber) async {
    final defaultPhoneNumber = '0201029858525';
    final cleanedNumber =
        phoneNumber?.replaceAll(" ", "").replaceAll(RegExp(r'\D'), '') ??
            defaultPhoneNumber;
    final url = 'tel:$cleanedNumber';

    var status = await Permission.phone.status;
    if (status.isDenied) {
      if (await Permission.phone.request().isGranted) {
        await _openDialer(context, url);
      } else {
        _showErrorDialog(context, 'Permission denied to make calls');
      }
    } else {
      await _openDialer(context, url);
    }
  }

  Future<void> _openDialer(BuildContext context, String url) async {
    try {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      _showErrorDialog(context, e.toString());
    }
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _launchWhatsApp(BuildContext context, String? phoneNumber) async {
    final defaultWhatsAppNumber = '0201029858525';
    final cleanedNumber =
        phoneNumber?.replaceAll(" ", "").replaceAll(RegExp(r'\D'), '') ??
            defaultWhatsAppNumber;
    final url = 'https://wa.me/$cleanedNumber';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      final fallbackUrl = 'https://wa.me/$defaultWhatsAppNumber';
      await launch(fallbackUrl);
    }
  }

  void _launchInstagram(String url) async {
    final instagramUrl = 'instagram://user?username=${url.split('/').last}';
    if (await canLaunch(instagramUrl)) {
      await launch(instagramUrl);
    } else {
      await launch(url);
    }
  }

  void _launchSnapchat(String url) async {
    final snapchatUrl = 'snapchat://add/${url.split('/').last}';
    if (await canLaunch(snapchatUrl)) {
      await launch(snapchatUrl);
    } else {
      await launch(url);
    }
  }

  void _launchTwitter(String url) async {
    final twitterUrl = 'twitter://user?screen_name=${url.split('/').last}';
    if (await canLaunch(twitterUrl)) {
      await launch(twitterUrl);
    } else {
      await launch(url);
    }
  }
}
