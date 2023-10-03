# <img src="assets/icone.png" width="30" height="30"/></a> Lava-Jato Sandes 

## 💻 Resumo
### Aplicativo em Flutter para Android

Aplicação para cadastro simples de informações e posterior consulta destas informações.
Programa dividido em quatro páginas: Uma tela de login simples, contendo a logo do aplicativo e os campos de Usuário e Senha, uma HomePage contendo um Drawer onde há a opção de sair(log-out) e a aba Sobre onde podem ser encontrados mais informações sobre o aplicativo, além disto a HomePage serve como um canal de acesso para as páginas de Rede Lan e Consumo de Água, onde nestas duas há um PageViewer permitindo acesso às páginas de registro e consulta através do rolamento lateral. No caso desses duas últimas, a página de Consulta atua como dependente da página de Registro para poder receber e utilizar os dados registrados, formando assim um laço de herança. E sendo assim, foi necessária a  implementação métodos para a persistência de dados caso ocorra o encerramento ou reinicio do aplicativo.
Por fim, por se tratar de um aplicativo onde possivelmente poderão haver informações sensíveis, foi implementado um sistema de login com segurança adicional via Biometria.
OBS: Caso seu Smartphone não tenha Biometria ou você não use-a, faça o acesso usando "admin" nos campos de Usuário e Senha.

### ✔ Downloads

[Guarda Dados](https://www.mediafire.com/file/9x44afmjdhcsgc2/Guarda+Dados.apk/file)

## 📚 Documentação
-[Dart](https://dart.dev/guides)

-[Flutter](https://docs.flutter.dev/)

-[URL Launcher](https://pub.dev/packages/url_launcher)

-[Provider](https://pub.dev/packages/provider)

-[Shared Preferences](https://pub.dev/packages/shared_preferences)

-[Local Auth](https://pub.dev/packages/local_auth)

-[Package Info Plus](https://pub.dev/packages/package_info_plus)

-[Flutter Launcher Icons](https://pub.dev/packages/flutter_launcher_icons)

