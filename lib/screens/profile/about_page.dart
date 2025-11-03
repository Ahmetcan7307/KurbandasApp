import 'package:flutter/material.dart';
import 'package:kurbandas/generated/l10n.dart';
import 'package:kurbandas/stores/package_store.dart';
import 'package:kurbandas/stores/root_store.dart';
import 'package:provider/provider.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  late S lang;

  bool isLoading = true;

  late String version;

  late PackageStore packageStore;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => loadPackageInfo());
  }

  Future<void> loadPackageInfo() async {
    version = await packageStore.getVersion();

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

    packageStore = Provider.of<RootStore>(context).packageStore;
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
                        Theme.of(context).primaryColor.withValues(alpha: .1),
                    child: Icon(
                      Icons.eco_outlined,
                      size: 60,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Kurbandaş',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${lang.version} $version',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 32),
                  _buildInfoCard(
                    title: lang.aboutApp,
                    content: lang.aboutAppDesc,
                  ),
                  const SizedBox(height: 16),
                  _buildInfoCard(
                    title: lang.howToWorks,
                    content: lang.howToWorksDesc,
                  ),
                  const SizedBox(height: 16),
                  _buildInfoCard(
                    title: lang.contactUs,
                    content: "${lang.contactUsDesc}: kurbandas7307@gmail.com",
                  ),
                  const SizedBox(height: 24),
                  Text(
                    '© 2024-2025 Kurbandaş',
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
