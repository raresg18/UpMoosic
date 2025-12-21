import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../l10n/app_localizations.dart';
import '../l10n/l10n_extension.dart';
import '../models/user_quest.dart';
import '../providers/quest_state.dart';
import '../services/notification_service.dart';
import '../data/rank_data.dart'; // 🎯 Importăm RankData

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  // 🎯 1. Ținem minte care quest-uri sunt deschise pentru a ascunde butoanele
  final Set<String> _expandedQuestKeys = {};

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

  Future<void> _showSettingsDialog(BuildContext context) async {
    if (!Hive.isBoxOpen('settings')) {
      await Hive.openBox('settings');
    }

    final box = Hive.box('settings');

    if (!context.mounted) return;

    final l10n = AppLocalizations.of(context)!;

    bool isEnabled = box.get('reminder_enabled', defaultValue: false);
    int hour = box.get('reminder_hour', defaultValue: 20);
    int minute = box.get('reminder_minute', defaultValue: 0);

    TimeOfDay selectedTime = TimeOfDay(hour: hour, minute: minute);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return AlertDialog(
              title: Text(l10n.dynamicString('settings_page_title')),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.dynamicString('settings_section_notif'),
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor
                    ),
                  ),
                  const Divider(),
                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(l10n.dynamicString('settings_daily_notif')),
                    value: isEnabled,
                    onChanged: (bool value) {
                      setStateDialog(() {
                        isEnabled = value;
                      });
                      box.put('reminder_enabled', value);

                      if (!value) {
                        NotificationService().cancelNotifications();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(l10n.dynamicString('settings_notif_inactive'))),
                        );
                      } else {
                        NotificationService().scheduleDailyNotification(
                          selectedTime.hour,
                          selectedTime.minute,
                          l10n.dynamicString('notif_title'),
                          l10n.dynamicString('notif_body'),
                          l10n.dynamicString('channel_name'),
                          l10n.dynamicString('channel_desc'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("${l10n.dynamicString('settings_notif_active')} ${selectedTime.format(context)}!")),
                        );
                      }
                    },
                  ),
                  if (isEnabled)
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(l10n.dynamicString('settings_time_label')),
                      trailing: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          selectedTime.format(context),
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      onTap: () async {
                        final TimeOfDay? picked = await showTimePicker(
                          context: context,
                          initialTime: selectedTime,
                        );
                        if (picked != null && picked != selectedTime) {
                          setStateDialog(() {
                            selectedTime = picked;
                          });

                          box.put('reminder_hour', picked.hour);
                          box.put('reminder_minute', picked.minute);

                          NotificationService().scheduleDailyNotification(
                            picked.hour,
                            picked.minute,
                            l10n.dynamicString('notif_title'),
                            l10n.dynamicString('notif_body'),
                            l10n.dynamicString('channel_name'),
                            l10n.dynamicString('channel_desc'),
                          );
                        }
                      },
                    ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(l10n.dynamicString('settings_close')),
                ),
              ],
            );
          },
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
                icon: const Icon(Icons.settings),
                tooltip: l10n.dynamicString('settings_page_title'),
                onPressed: () => _showSettingsDialog(context),
              ),
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

                        // 🎯 RANK-UL
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: RankData.getRankColor(totalPoints).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: RankData.getRankColor(totalPoints), width: 1.5),
                          ),
                          child: Text(
                            RankData.getRankName(totalPoints, l10n),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: RankData.getRankColor(totalPoints),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),

                  // ---------------------------------------------------
                  // 🎯 QUEST-URI ACTIVE
                  // ---------------------------------------------------
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
                        final descriptionKey = quest.questKey.replaceFirst('title', 'desc');
                        final translatedDescription = l10n.dynamicString(descriptionKey);

                        // Verificăm dacă acest card este deschis
                        final bool isExpanded = _expandedQuestKeys.contains(quest.questKey);

                        return Card(
                          margin: const EdgeInsets.only(bottom: 8),
                          child: ExpansionTile(
                            key: Key(quest.questKey), // Cheie unică pentru stabilitate
                            leading: const Icon(Icons.star_half, color: Colors.amber),
                            title: Text(translatedQuestTitle, style: const TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text('${l10n.mood}: ${quest.moodName}'),

                            // 🎯 2. Logica pentru trailing (Partea dreaptă)
                            // Dacă e deschis -> null (arată săgeata default sau nimic)
                            // Dacă e închis -> Arată butoanele
                            trailing: isExpanded
                                ? null
                                : Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Buton FINALIZARE (Dubla bifă)
                                IconButton(
                                  icon: const Icon(Icons.done_all, color: Colors.green),
                                  tooltip: l10n.completeQuestButton,
                                  onPressed: () => questState.completeQuest(quest),
                                ),
                                // Buton ANULARE (Minus roșu)
                                IconButton(
                                  icon: const Icon(Icons.remove_circle, color: Colors.red),
                                  tooltip: l10n.cancelQuestButton,
                                  onPressed: () => questState.removeQuest(quest),
                                ),
                              ],
                            ),

                            // 🎯 3. Ascultăm schimbarea stării (Deschis/Închis)
                            onExpansionChanged: (bool expanded) {
                              setState(() {
                                if (expanded) {
                                  _expandedQuestKeys.add(quest.questKey);
                                } else {
                                  _expandedQuestKeys.remove(quest.questKey);
                                }
                              });
                            },

                            childrenPadding: const EdgeInsets.all(16),
                            children: [
                              Text(
                                translatedDescription,
                                style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 20),

                              // Butoanele MARI care apar doar când e deschis
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton.icon(
                                    icon: const Icon(Icons.remove_circle, color: Colors.white, size: 20),
                                    label: Text(l10n.cancelQuestButton),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red.shade400,
                                      foregroundColor: Colors.white,
                                    ),
                                    onPressed: () => questState.removeQuest(quest),
                                  ),
                                  ElevatedButton.icon(
                                    icon: const Icon(Icons.done_all, color: Colors.white, size: 20),
                                    label: Text(l10n.completeQuestButton),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      foregroundColor: Colors.white,
                                    ),
                                    onPressed: () => questState.completeQuest(quest),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),

                  const SizedBox(height: 40),

                  // ---------------------------------------------------
                  // 🎯 QUEST-URI FINALIZATE (Aici rămâne simplu)
                  // ---------------------------------------------------
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
                        final descriptionKey = quest.questKey.replaceFirst('title', 'desc');
                        final translatedDescription = l10n.dynamicString(descriptionKey);

                        return Card(
                          elevation: 1,
                          margin: const EdgeInsets.only(bottom: 8),
                          color: Colors.green.shade50,
                          child: ExpansionTile(
                            leading: const Icon(Icons.check_circle, color: Colors.green),
                            title: Text(translatedQuestTitle, style: const TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text(quest.displayStatus),
                            childrenPadding: const EdgeInsets.all(16),
                            children: [
                              Text(
                                translatedDescription,
                                style: TextStyle(fontSize: 15, color: Colors.grey.shade800),
                                textAlign: TextAlign.left,
                              ),
                              const SizedBox(height: 10),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "${l10n.mood}: ${quest.moodName}",
                                  style: TextStyle(fontSize: 12, color: Colors.green.shade800, fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
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