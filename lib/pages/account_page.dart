import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../l10n/app_localizations.dart';
import '../l10n/l10n_extension.dart';
import '../models/user_quest.dart';
import '../providers/quest_state.dart';
import '../services/notification_service.dart';
import '../data/rank_data.dart';
import 'language_selector_page.dart';
import '../providers/language_provider.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
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
    bool showLanguageOptions = false;

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
                    onChanged: (bool value) async {
                      if (value) {
                        bool granted = await NotificationService().requestPermissions();

                        if (granted) {
                          setStateDialog(() {
                            isEnabled = true;
                          });
                          box.put('reminder_enabled', true);

                          NotificationService().scheduleDailyNotification(
                            selectedTime.hour,
                            selectedTime.minute,
                            l10n.dynamicString('notif_title'),
                            l10n.dynamicString('notif_body'),
                            'daily_channel_id', // ID unic canal
                            l10n.dynamicString('channel_name'),
                          );

                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("${l10n.dynamicString('settings_notif_active')} ${selectedTime.format(context)}!")),
                            );
                          }
                        } else {
                          setStateDialog(() { isEnabled = false; });
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(l10n.dynamicString('settings_permission_required'))
                              ),
                            );
                          }
                        }
                      } else {
                        setStateDialog(() {
                          isEnabled = false;
                        });
                        box.put('reminder_enabled', false);
                        NotificationService().cancelNotifications();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(l10n.dynamicString('settings_notif_inactive'))),
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

                  // Language section
                  const SizedBox(height: 16),
                  Text(
                    l10n.dynamicString('settings_section_language'),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.language),
                    title: Text(l10n.selectLanguageButton),
                    trailing: Icon(
                      showLanguageOptions
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                    ),
                    onTap: () {
                      setStateDialog(() {
                        showLanguageOptions = !showLanguageOptions;
                      });
                    },
                  ),
                  if (showLanguageOptions) ...[
                    _LanguageOption(
                      flag: '🇷🇴',
                      label: 'Română',
                      locale: const Locale('ro'),
                      l10n: l10n,
                      onSelected: () {
                        setStateDialog(() => showLanguageOptions = false);
                      },
                    ),
                    _LanguageOption(
                      flag: '🇬🇧',
                      label: 'English',
                      locale: const Locale('en'),
                      l10n: l10n,
                      onSelected: () {
                        setStateDialog(() => showLanguageOptions = false);
                      },
                    ),
                  ],
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

  void _showRankDetails(BuildContext context, int totalPoints, String rankName) {
    final l10n = AppLocalizations.of(context)!;

    String descriptionKey;
    // Folosim formatul din JSON (snake_case)
    if (totalPoints < 100) {
      descriptionKey = "rank_desc_0";
    } else if (totalPoints < 300) {
      descriptionKey = "rank_desc_1";
    } else if (totalPoints < 600) {
      descriptionKey = "rank_desc_2";
    } else if (totalPoints < 1000) {
      descriptionKey = "rank_desc_3";
    } else {
      descriptionKey = "rank_desc_4";
    }

    String description = l10n.dynamicString(descriptionKey);
    String encouragement = l10n.dynamicString("rank_keep_going");

    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Row(
            children: [
              Icon(Icons.military_tech, color: RankData.getRankColor(totalPoints)),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  rankName,
                  style: TextStyle(
                    color: RankData.getRankColor(totalPoints),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                description,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                encouragement,
                style: TextStyle(fontSize: 14, color: Colors.grey[600], fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text("OK"),
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

                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: () => _showRankDetails(
                            context,
                            totalPoints,
                            RankData.getRankName(totalPoints, l10n),
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: RankData.getRankColor(totalPoints).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: RankData.getRankColor(totalPoints), width: 1.5),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  RankData.getRankName(totalPoints, l10n),
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: RankData.getRankColor(totalPoints),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Icon(
                                    Icons.info_outline,
                                    size: 18,
                                    color: RankData.getRankColor(totalPoints)
                                ),
                              ],
                            ),
                          ),
                        ),

                        // ── Progress to next rank ──────────────────
                        const SizedBox(height: 16),
                        _RankProgressBar(totalPoints: totalPoints, l10n: l10n),
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
                        final descriptionKey = quest.questKey.replaceFirst('title', 'desc');
                        final translatedDescription = l10n.dynamicString(descriptionKey);

                        final bool isExpanded = _expandedQuestKeys.contains(quest.questKey);

                        return Card(
                          margin: const EdgeInsets.only(bottom: 8),
                          child: ExpansionTile(
                            key: Key(quest.questKey),
                            leading: const Icon(Icons.star_half, color: Colors.amber),
                            title: Text(translatedQuestTitle, style: const TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text('${l10n.mood}: ${quest.moodName}'),

                            trailing: isExpanded
                                ? null
                                : Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.done_all, color: Colors.green),
                                  tooltip: l10n.completeQuestButton,
                                  onPressed: () => questState.completeQuest(quest),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.remove_circle, color: Colors.red),
                                  tooltip: l10n.cancelQuestButton,
                                  onPressed: () => questState.removeQuest(quest),
                                ),
                              ],
                            ),

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

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton.icon(
                                    icon: const Icon(Icons.remove_circle, color: Colors.white, size: 18),
                                    label: Text(
                                      l10n.cancelQuestButton,
                                      style: const TextStyle(fontSize: 13),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red.shade400,
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                      minimumSize: Size.zero,
                                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    onPressed: () => questState.removeQuest(quest),
                                  ),

                                  ElevatedButton.icon(
                                    icon: const Icon(Icons.done_all, color: Colors.white, size: 18),
                                    label: Text(
                                      l10n.completeQuestButton,
                                      style: const TextStyle(fontSize: 13),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                      minimumSize: Size.zero,
                                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
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

class _LanguageOption extends StatelessWidget {
  final String flag;
  final String label;
  final Locale locale;
  final AppLocalizations l10n;
  final VoidCallback onSelected;

  const _LanguageOption({
    required this.flag,
    required this.label,
    required this.locale,
    required this.l10n,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        final provider = Provider.of<LanguageProvider>(context, listen: false);
        provider.setLocale(locale);
        onSelected();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Row(
          children: [
            const SizedBox(width: 8),
            Text(flag, style: const TextStyle(fontSize: 20)),
            const SizedBox(width: 12),
            Text(
              label,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}

class _RankProgressBar extends StatelessWidget {
  final int totalPoints;
  final AppLocalizations l10n;

  const _RankProgressBar({required this.totalPoints, required this.l10n});

  // Returns {current threshold, next threshold, next rank name}
  Map<String, dynamic> _getProgressInfo() {
    if (totalPoints < 100) {
      return {'from': 0, 'to': 100, 'nextRank': '${l10n.rankBeginnerSpirit} 🎵'};
    } else if (totalPoints < 200) {
      return {'from': 100, 'to': 200, 'nextRank': '${l10n.rankBalancedListener} 🎧'};
    } else if (totalPoints < 500) {
      return {'from': 200, 'to': 500, 'nextRank': '${l10n.rankRhythmExplorer} 🥁'};
    } else if (totalPoints < 1000) {
      return {'from': 500, 'to': 1000, 'nextRank': '${l10n.rankMoodComposer} 🎼'};
    } else if (totalPoints < 2500) {
      return {'from': 1000, 'to': 2500, 'nextRank': '${l10n.rankLivingSymphony} 🎻'};
    } else {
      return {'from': 2500, 'to': 2500, 'nextRank': null};
    }
  }

  @override
  Widget build(BuildContext context) {
    final info = _getProgressInfo();
    final bool isMaxRank = info['nextRank'] == null;

    if (isMaxRank) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Text(
          '🏆 ${l10n.dynamicString('rank_max_reached')}',
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Colors.amber,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }

    final int from = info['from'] as int;
    final int to = info['to'] as int;
    final String nextRank = info['nextRank'] as String;
    final int pointsLeft = to - totalPoints;
    final double progress = (totalPoints - from) / (to - from);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                l10n.dynamicString('rank_points_left').replaceAll('{n}', '$pointsLeft'),
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
              ),
              Text(
                nextRank,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progress.clamp(0.0, 1.0),
              minHeight: 8,
              backgroundColor: Colors.grey.shade200,
              valueColor: AlwaysStoppedAnimation<Color>(
                RankData.getRankColor(to),
              ),
            ),
          ),
        ],
      ),
    );
  }
}