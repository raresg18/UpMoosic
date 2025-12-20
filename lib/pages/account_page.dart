import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../l10n/app_localizations.dart';
import '../l10n/l10n_extension.dart';
import '../models/user_quest.dart';
import '../providers/quest_state.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {

  void _confirmDeleteHistory(BuildContext context, AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(l10n.deleteConfirmationTitle),
          content: Text(l10n.deleteConfirmationMessage),
          actions: <Widget>[
            TextButton(
              child: Text(l10n.deleteNo),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              child: Text(l10n.deleteYes),
              onPressed: () {
                Provider.of<QuestState>(context, listen: false).clearCompletedQuestsHistory();
                Navigator.of(dialogContext).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showInfoDialog(BuildContext context, AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(l10n.developmentInfoTitle),
          content: Text(l10n.developmentInfoMessage),
          actions: <Widget>[
            TextButton(
              child: Text(l10n.okButtonLabel),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Consumer<QuestState>(
      builder: (context, questState, child) {
        final List<UserQuest> activeQuests = questState.activeQuests;

        final List<UserQuest> completedQuests = questState.completedQuests.reversed.toList();

        final int totalPoints = questState.totalScore;

        return Scaffold(
          appBar: AppBar(
            title: Text(l10n.accountTitle),
            actions: [
              IconButton(
                icon: const Icon(Icons.info_outline),
                onPressed: () => _showInfoDialog(context, l10n),
              ),
              const SizedBox(width: 10),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
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
                        const SizedBox(height: 10),
                        Text(
                          l10n.userScoreLabel(totalPoints),
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.indigo),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),

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
                            subtitle: Text('${l10n.mood}: ${quest.moodName}'),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.done_all, color: Colors.green),
                                  onPressed: () => questState.completeQuest(quest),
                                  tooltip: l10n.completeQuestButton,
                                ),
                                IconButton(
                                  icon: const Icon(Icons.remove_circle, color: Colors.red),
                                  onPressed: () => questState.removeQuest(quest),
                                  tooltip: l10n.cancelQuestButton,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),

                  const SizedBox(height: 40),

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
                ],
              ),
            ),
          ),

          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(
              left: 20.0,
              right: 20.0,
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