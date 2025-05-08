import 'package:flutter/material.dart';
import 'package:kurbandas/generated/l10n.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  late S lang;
  PackageInfo? packageInfo;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPackageInfo();
  }

  Future<void> _loadPackageInfo() async {
    packageInfo = await PackageInfo.fromPlatform();
    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    lang = S.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(lang.info),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 16),
                  CircleAvatar(
                    radius: 50,
                    backgroundColor:
                        Theme.of(context).primaryColor.withOpacity(0.1),
                    child: Icon(
                      Icons.eco_outlined,
                      size: 60,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'KurbanDaş',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Versiyon ${packageInfo!.version}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 32),
                  _buildInfoCard(
                    title: 'Uygulama Hakkında',
                    content:
                        'KurbanDaş uygulaması, kurban bayramlarında kurban ortaklığı bulmak ve paylaşmak için geliştirilmiş bir platformdur. Kullanıcılar kendi kurbanlarını ilan edebilir ve diğer kullanıcıların kurbanlarına ortak olabilirler.',
                  ),
                  const SizedBox(height: 16),
                  _buildInfoCard(
                    title: 'Nasıl Çalışır?',
                    content:
                        'Ana sayfadan mevcut kurban ilanlarını görebilir, filtreleyebilir ve ilan detaylarına ulaşabilirsiniz. Ortak olmak istediğiniz kurban için istek gönderebilirsiniz. Kendi kurbanınızı paylaşmak için "Kurban Paylaş" butonunu kullanabilirsiniz. Profilinizden kendi kurbanlarınızı ve ortaklıklarınızı yönetebilirsiniz.',
                  ),
                  const SizedBox(height: 16),
                  _buildInfoCard(
                    title: 'İletişim',
                    content:
                        'Öneri, şikayet ve sorularınız için: support@kurbandas.com',
                  ),
                  const SizedBox(height: 24),
                  Text(
                    '© 2023-2024 KurbanDaş',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildInfoCard({required String title, required String content}) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              content,
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
