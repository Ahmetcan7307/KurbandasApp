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
              lang.sss,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 16),
            _buildFaqItem(
              0,
              lang.WhatQurbaniPartnership,
              lang.WhatQurbaniPartnershipDesc,
            ),
            _buildFaqItem(
              1,
              lang.HowBecomePartner,
              lang.HowBecomePartnerDesc,
            ),
            _buildFaqItem(
              2,
              lang.HowFindPartner,
              lang.HowFindPartnerDesc,
            ),
            _buildFaqItem(
              3,
              lang.HowSlaughterOperationsTakePlace,
              lang.HowSlaughterOperationsTakePlaceDesc,
            ),
            _buildFaqItem(
              4,
              lang.HowPaymentsMade,
              lang.HowPaymentsMadeDesc,
            ),
            _buildFaqItem(
              5,
              lang.HowDivideMeat,
              lang.HowDivideMeatDesc,
            ),
            _buildFaqItem(
              6,
              lang.WhatShouldIDoIHaveProblems,
              lang.WhatShouldIDoIHaveProblemsDesc,
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
                Text(
                  lang.contactUs,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildContactItem(Icons.email, "hakkicanbuluc@gmail.com"),
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
