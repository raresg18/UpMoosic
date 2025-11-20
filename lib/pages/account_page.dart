// lib/pages/account_page.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../l10n/app_localizations.dart';
import '../l10n/l10n_extension.dart';

// 🎯 Asigură-te că aceste importuri indică locațiile corecte (ex: '../models/...')
import 'user_quest.dart';
import 'quest_state.dart';


class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    // Folosim Consumer pentru a citi starea și a reconstrui doar această secțiune
    return Consumer<QuestState>(
      builder: (context, questState, child) {
        // Lista reală preluată din managerul de stare
        final List<UserQuest> activeQuests = questState.activeQuests;

        return Scaffold(
          appBar: AppBar(
            title: Text(l10n.accountTitle),
            backgroundColor: Colors.blueGrey.shade700,
            foregroundColor: Colors.white,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Icon(Icons.person, size: 80, color: Colors.blueGrey),
                  const SizedBox(height: 20),

                  Text(
                    l10n.accountPageWelcome,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 40),

                  // --- SECȚIUNEA QUEST-URI ACTIVE ---
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
                          elevation: 2,
                          margin: const EdgeInsets.only(bottom: 10),
                          child: ListTile(
                            leading: const Icon(Icons.star_half, color: Colors.amber),
                            title: Text(
                              translatedQuestTitle,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text('${l10n.mood}: ${quest.moodName} - ${quest.displayStatus}'),

                            // 🎯 AICI SUNT CELE DOUĂ BUTOANE DE ACȚIUNE
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // 1. Butonul ANULARE ("-")
                                IconButton(
                                  icon: const Icon(Icons.remove_circle, color: Colors.red),
                                  onPressed: () {
                                    // Elimină quest-ul din lista activă
                                    questState.removeQuest(quest);
                                  },
                                  tooltip: l10n.cancelQuestButton,
                                ),

                                // 2. Butonul FINALIZARE ("✓")
                                IconButton(
                                  icon: const Icon(Icons.done_all, color: Colors.green),
                                  onPressed: () {
                                    // Marchează quest-ul ca finalizat
                                    questState.completeQuest(quest);
                                  },
                                  tooltip: l10n.completeQuestButton,
                                ),
                              ],
                            ),
                            onTap: () {
                              // TODO: Implementează navigarea către detalii quest
                            },
                          ),
                        );
                      },
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}