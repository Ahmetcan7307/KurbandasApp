import 'package:flutter/material.dart';
import 'package:kurbandas/generated/l10n.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  late S lang;
  int _expandedIndex = -1;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    lang = S.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(lang.help),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Text(
              'Sıkça Sorulan Sorular',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 16),
            _buildFaqItem(
              0,
              'Kurban ortaklığı nedir?',
              'İslami kurallara göre büyükbaş hayvanlar (sığır, dana, manda) en fazla 7 kişi tarafından kurban edilebilir. KurbanDaş uygulaması, kurban kesmek isteyen kişilere ortak bulabilmeleri veya ilan edilmiş bir kurbana ortak olabilmeleri için aracılık etmektedir.',
            ),
            _buildFaqItem(
              1,
              'Nasıl ortak olurum?',
              'Ana sayfada listelenen ilanlardan istediğiniz bir kurbana tıklayarak detay sayfasını açabilirsiniz. Sayfadaki "Ortak Olma İsteği Gönder" butonuna basarak isteğinizi iletebilirsiniz. Kurban sahibi isteğinizi onayladığında ortaklık işlemi tamamlanır.',
            ),
            _buildFaqItem(
              2,
              'Kendi kurbanıma nasıl ortak bulabilirim?',
              'Ana sayfadaki "Kurban Paylaş" butonuna tıklayarak kendi kurbanınızın bilgilerini girebilirsiniz. Kurban ilanınız yayınlandıktan sonra isteyen kullanıcılar size ortak olmak için istek gönderebilirler. Bu istekleri "Profilim > Kurbanlarım" bölümünden yönetebilirsiniz.',
            ),
            _buildFaqItem(
              3,
              'Kurban kesim işlemleri nasıl gerçekleşir?',
              'Uygulama yalnızca ortak bulmak için bir aracı platformdur. Kurban kesim işlemleri kurban sahibi tarafından organize edilir. Kurban kesim yeri ve tarih bilgileri ilan detaylarında belirtilir.',
            ),
            _buildFaqItem(
              4,
              'Ödemeler nasıl yapılır?',
              'Uygulama üzerinden herhangi bir ödeme alınmaz veya yapılmaz. Kurban bedelinin ödenmesi, kurban sahibi ve ortaklar arasında uygulamadan bağımsız olarak gerçekleştirilir.',
            ),
            _buildFaqItem(
              5,
              'Kurban eti nasıl paylaştırılır?',
              'Kurban kesildikten sonra etin paylaştırılması, kurban sahibi ve ortakların kendi aralarında belirledikleri şekilde gerçekleştirilir. İslami kurallara göre etin adil bir şekilde paylaştırılması gerekmektedir.',
            ),
            _buildFaqItem(
              6,
              'Uygulamada sorun yaşarsam ne yapmalıyım?',
              'Teknik sorunlar, öneriler veya sorularınız için support@kurbandas.com adresine e-posta gönderebilirsiniz.',
            ),
            const SizedBox(height: 24),
            _buildContactCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildFaqItem(int index, String question, String answer) {
    final isExpanded = _expandedIndex == index;
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ExpansionTile(
        initiallyExpanded: isExpanded,
        onExpansionChanged: (expanded) {
          setState(() {
            _expandedIndex = expanded ? index : -1;
          });
        },
        title: Text(
          question,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Text(
              answer,
              style: const TextStyle(height: 1.5),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactCard() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.contact_support,
                  color: Theme.of(context).primaryColor,
                  size: 28,
                ),
                const SizedBox(width: 12),
                const Text(
                  'Bize Ulaşın',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildContactItem(Icons.email, 'support@kurbandas.com'),
            _buildContactItem(Icons.phone, '+90 555 123 4567'),
            _buildContactItem(Icons.web, 'www.kurbandas.com'),
          ],
        ),
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: Colors.grey[700],
          ),
          const SizedBox(width: 12),
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }
}
