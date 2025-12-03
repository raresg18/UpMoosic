import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../l10n/app_localizations.dart';
import '../l10n/l10n_extension.dart';

// 🎯 IMPORTURI APLICATE EXACT CUM AI CERUT
// NOTĂ: Dacă aceste importuri dau erori, ar trebui să le corectezi cu '../models/user_quest.dart'
import 'user_quest.dart';
import 'quest_state.dart';


// 1. CLASA PUBLICĂ (Stateful)
class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}


// 2. CLASA DE STARE (Stateful)
class _AccountPageState extends State<AccountPage> {

  // ===============================================
  // METODA AUXILIARĂ DE CONFIRMARE ȘI ȘTERGERE
  // ===============================================
  void _confirmDeleteHistory(BuildContext context, AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(l10n.deleteConfirmationTitle),
          content: Text(l10n.deleteConfirmationMessage),
          actions: <Widget>[
            // Butonul ANULEAZĂ
            TextButton(
              child: Text(l10n.deleteNo),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
            // Butonul DA, ȘTERGE
            TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              child: Text(l10n.deleteYes),
              onPressed: () {
                // Apelează logica de ștergere
                Provider.of<QuestState>(context, listen: false).clearCompletedQuestsHistory();
                Navigator.of(dialogContext).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // 🎯 NOU: Metoda pentru Dialogul de Informații (Dezvoltare)
  void _showInfoDialog(BuildContext context, AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(l10n.developmentInfoTitle), // Cheie adăugată anterior
          content: Text(l10n.developmentInfoMessage), // Cheie adăugată anterior
          actions: <Widget>[
            TextButton(
              child: Text(l10n.okButtonLabel), // Cheie adăugată anterior
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // ===============================================
  // METODA BUILD
  // ===============================================
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Consumer<QuestState>(
      builder: (context, questState, child) {
        final List<UserQuest> activeQuests = questState.activeQuests;
        final List<UserQuest> completedQuests = questState.completedQuests;

        return Scaffold(
          appBar: AppBar(
            title: Text(l10n.accountTitle),
            // 🎯 NOU: Adăugarea actions (Butonul Info)
            actions: [
              IconButton(
                icon: const Icon(Icons.info_outline), // Icoana 'i'
                onPressed: () => _showInfoDialog(context, l10n), // Apel la metoda nouă
              ),
              const SizedBox(width: 10), // Spațiu opțional
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // ... (Icon, Welcome Text) ...
                  Center(
                    child: Column(
                      children: [
                        const Icon(Icons.account_circle, size: 80, color: Colors.blueGrey),
                        const SizedBox(height: 10),
                        Text(
                          l10n.accountPageWelcome,
                          style: const TextStyle(fontSize: 18, color: Colors.blueGrey),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),

                  // ===================================
                  // 1. SECȚIUNEA QUEST-URI ACTIVE
                  // ===================================
                  Text(
                    l10n.activeQuestsTitle,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const Divider(),
                  const SizedBox(height: 10),

                  if (activeQuests.isEmpty)
                    Text(
                      l10n.noActiveQuests,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey.shade600),
                    )
                  else
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: activeQuests.length,
                      itemBuilder: (context, index) {
                        final quest = activeQuests[index];
                        final translatedQuestTitle = l10n.dynamicString(quest.questKey);

                        return Card(
                          margin: const EdgeInsets.only(bottom: 8),
                          child: ListTile(
                            leading: const Icon(Icons.star_half, color: Colors.amber),
                            title: Text(translatedQuestTitle, style: const TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text('${l10n.mood}: ${quest.moodName} - ${quest.displayStatus}'),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Butonul ANULARE ("-")
                                IconButton(
                                  icon: const Icon(Icons.remove_circle, color: Colors.red),
                                  onPressed: () => questState.removeQuest(quest),
                                  tooltip: l10n.cancelQuestButton,
                                ),
                                // Butonul FINALIZARE ("✓")
                                IconButton(
                                  icon: const Icon(Icons.done_all, color: Colors.green),
                                  onPressed: () => questState.completeQuest(quest),
                                  tooltip: l10n.completeQuestButton,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),

                  const SizedBox(height: 40),

                  // ===================================
                  // 2. SECȚIUNEA QUEST-URI FINALIZATE
                  // ===================================
                  Text(
                    l10n.completedQuestsTitle,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                  const Divider(color: Colors.green),
                  const SizedBox(height: 10),

                  if (completedQuests.isEmpty)
                    Text(
                      l10n.noCompletedQuests,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey.shade600),
                    )
                  else
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: completedQuests.length,
                      itemBuilder: (context, index) {
                        final quest = completedQuests[index];
                        final translatedQuestTitle = l10n.dynamicString(quest.questKey);

                        return Card(
                          elevation: 1,
                          margin: const EdgeInsets.only(bottom: 8),
                          color: Colors.green.shade50,
                          child: ListTile(
                            leading: const Icon(Icons.check_circle, color: Colors.green),
                            title: Text(translatedQuestTitle, style: const TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text(quest.displayStatus),
                          ),
                        );
                      },
                    ),

                  const SizedBox(height: 40),
                ], // End of Column children
              ),
            ),
          ),

          // BUTONUL ȘTERGE ISTORIC
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              // Adaugă padding-ul de jos al sistemului + 10px spațiu
              bottom: MediaQuery.of(context).padding.bottom + 10.0,
            ),
            child: ElevatedButton.icon(
              icon: const Icon(Icons.delete_forever),
              label: Text(l10n.deleteHistoryButton),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[700],
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () => _confirmDeleteHistory(context, l10n),
            ),
          ),
        );
      },
    );
  }
}