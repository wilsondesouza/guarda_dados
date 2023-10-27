// Service para reutilizar a função de gerar objeto com o link externo das redes sociais do desenvolvedor

import 'package:url_launcher/url_launcher.dart';

class SocialMedia {
  static final Uri url = Uri.parse('https://linktr.ee/wilsondesouza');
  static Future<void> launch() async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
