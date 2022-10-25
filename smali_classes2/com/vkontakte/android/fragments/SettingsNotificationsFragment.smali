.class public Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;
.super Lcom/vkontakte/android/fragments/MaterialPreferenceToolbarFragment;
.source "SettingsNotificationsFragment.java"


# instance fields
.field private cancelDndPref:Landroid/support/v7/preference/Preference;

.field private dnd1Pref:Landroid/support/v7/preference/Preference;

.field private initialSettings:Ljava/lang/String;

.field private prefSound:Lcom/vkontakte/android/ui/RingtonePreference;

.field private prefs:Landroid/content/SharedPreferences;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 30
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/MaterialPreferenceToolbarFragment;-><init>()V

    .line 35
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->prefSound:Lcom/vkontakte/android/ui/RingtonePreference;

    return-void
.end method

.method private setDnd(J)V
    .locals 9
    .param p1, "t"    # J

    .prologue
    const-wide/16 v6, 0x3e8

    .line 174
    iget-object v1, p0, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string/jumbo v2, "dnd_end"

    invoke-static {}, Lcom/vkontakte/android/TimeUtils;->getOffset()I

    move-result v3

    int-to-long v4, v3

    mul-long/2addr v4, v6

    add-long/2addr v4, p1

    invoke-interface {v1, v2, v4, v5}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 175
    const-string/jumbo v1, "cat_notify"

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/support/v7/preference/PreferenceCategory;

    .line 176
    .local v0, "cat":Landroid/support/v7/preference/PreferenceCategory;
    const-string/jumbo v1, "dnd_cancel"

    invoke-virtual {v0, v1}, Landroid/support/v7/preference/PreferenceCategory;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v1

    if-nez v1, :cond_0

    .line 177
    iget-object v1, p0, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->cancelDndPref:Landroid/support/v7/preference/Preference;

    invoke-virtual {v0, v1}, Landroid/support/v7/preference/PreferenceCategory;->addPreference(Landroid/support/v7/preference/Preference;)Z

    .line 179
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->cancelDndPref:Landroid/support/v7/preference/Preference;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f08061e

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    div-long v6, p1, v6

    long-to-int v6, v6

    invoke-static {v6}, Lcom/vkontakte/android/TimeUtils;->langDate(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/support/v7/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 180
    iget-object v1, p0, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->dnd1Pref:Landroid/support/v7/preference/Preference;

    invoke-virtual {v0, v1}, Landroid/support/v7/preference/PreferenceCategory;->removePreference(Landroid/support/v7/preference/Preference;)Z

    .line 181
    return-void
.end method

.method private showDndDialog()V
    .locals 3

    .prologue
    .line 130
    new-instance v0, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f0c002f

    invoke-static {p0}, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment$$Lambda$8;->lambdaFactory$(Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setItems(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f08012c

    .line 143
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 144
    return-void
.end method

.method private updateExtendedSubtitles()V
    .locals 5

    .prologue
    const v4, 0x7f0801b6

    const/4 v3, 0x1

    .line 124
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Landroid/support/v7/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 125
    .local v0, "p":Landroid/content/SharedPreferences;
    const-string/jumbo v1, "notifyPrivMessages"

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v2

    const-string/jumbo v1, "notificationsPrivateMessages"

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string/jumbo v1, ""

    :goto_0
    invoke-virtual {v2, v1}, Landroid/support/v7/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 126
    const-string/jumbo v1, "notifyChatMessages"

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v2

    const-string/jumbo v1, "notificationsChatMessages"

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string/jumbo v1, ""

    :goto_1
    invoke-virtual {v2, v1}, Landroid/support/v7/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 127
    return-void

    .line 125
    :cond_0
    invoke-virtual {p0, v4}, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 126
    :cond_1
    invoke-virtual {p0, v4}, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_1
.end method

.method private updateRingtoneName(Ljava/lang/String;)V
    .locals 7
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 184
    const-string/jumbo v4, "notifyRingtone"

    invoke-virtual {p0, v4}, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v1

    .line 185
    .local v1, "pref":Landroid/support/v7/preference/Preference;
    if-eqz p1, :cond_2

    move-object v3, p1

    .line 186
    .local v3, "rt":Ljava/lang/String;
    :goto_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/media/RingtoneManager;->getRingtone(Landroid/content/Context;Landroid/net/Uri;)Landroid/media/Ringtone;

    move-result-object v2

    .line 187
    .local v2, "ringtone":Landroid/media/Ringtone;
    const-string/jumbo v0, "Unknown"

    .line 188
    .local v0, "name":Ljava/lang/String;
    if-nez v2, :cond_0

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_1

    .line 189
    :cond_0
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_3

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/media/Ringtone;->getTitle(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 191
    :cond_1
    :goto_1
    invoke-virtual {v1, v0}, Landroid/support/v7/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 192
    return-void

    .line 185
    .end local v0    # "name":Ljava/lang/String;
    .end local v2    # "ringtone":Landroid/media/Ringtone;
    .end local v3    # "rt":Ljava/lang/String;
    :cond_2
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-static {v4}, Landroid/support/v7/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v4

    const-string/jumbo v5, "notifyRingtone"

    const-string/jumbo v6, "content://settings/system/notification_sound"

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 189
    .restart local v0    # "name":Ljava/lang/String;
    .restart local v2    # "ringtone":Landroid/media/Ringtone;
    .restart local v3    # "rt":Ljava/lang/String;
    :cond_3
    const v4, 0x7f080639

    invoke-virtual {p0, v4}, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_1
.end method


# virtual methods
.method protected getTitleRes()I
    .locals 1

    .prologue
    .line 148
    const v0, 0x7f08063a

    return v0
.end method

.method synthetic lambda$onCreate$0(Landroid/support/v7/preference/Preference;Ljava/lang/Object;)Z
    .locals 1
    .param p1, "preference"    # Landroid/support/v7/preference/Preference;
    .param p2, "newValue"    # Ljava/lang/Object;

    .prologue
    .line 48
    check-cast p2, Ljava/lang/String;

    .end local p2    # "newValue":Ljava/lang/Object;
    invoke-direct {p0, p2}, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->updateRingtoneName(Ljava/lang/String;)V

    .line 49
    const/4 v0, 0x1

    return v0
.end method

.method synthetic lambda$onCreate$1(Landroid/support/v7/preference/Preference;)Z
    .locals 1
    .param p1, "preference"    # Landroid/support/v7/preference/Preference;

    .prologue
    .line 53
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->prefSound:Lcom/vkontakte/android/ui/RingtonePreference;

    invoke-virtual {v0, p0}, Lcom/vkontakte/android/ui/RingtonePreference;->startSelectRingtone(Landroid/app/Fragment;)V

    .line 54
    const/4 v0, 0x1

    return v0
.end method

.method synthetic lambda$onCreate$2(Landroid/support/v7/preference/Preference;)Z
    .locals 1
    .param p1, "preference"    # Landroid/support/v7/preference/Preference;

    .prologue
    .line 62
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->showDndDialog()V

    .line 64
    const/4 v0, 0x1

    return v0
.end method

.method synthetic lambda$onCreate$3(Landroid/support/v7/preference/Preference;)Z
    .locals 4
    .param p1, "preference"    # Landroid/support/v7/preference/Preference;

    .prologue
    .line 75
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 76
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v1, "type"

    const-string/jumbo v2, "PrivateMessages"

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    const-string/jumbo v1, "title"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Landroid/support/v7/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    const-class v1, Lcom/vkontakte/android/fragments/NotificationsAdvancedSettingsFragment;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v1, v0, v2}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    .line 79
    const/4 v1, 0x1

    return v1
.end method

.method synthetic lambda$onCreate$4(Landroid/support/v7/preference/Preference;)Z
    .locals 4
    .param p1, "preference"    # Landroid/support/v7/preference/Preference;

    .prologue
    .line 83
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 84
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v1, "type"

    const-string/jumbo v2, "ChatMessages"

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    const-string/jumbo v1, "title"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Landroid/support/v7/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    const-class v1, Lcom/vkontakte/android/fragments/NotificationsAdvancedSettingsFragment;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v1, v0, v2}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    .line 87
    const/4 v1, 0x1

    return v1
.end method

.method synthetic lambda$onCreate$5(Landroid/support/v7/preference/Preference;)Z
    .locals 3
    .param p1, "preference"    # Landroid/support/v7/preference/Preference;

    .prologue
    .line 91
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 92
    .local v0, "args":Landroid/os/Bundle;
    const-class v1, Lcom/vkontakte/android/fragments/userlist/PostSubscriptionsUserListFragment;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v1, v0, v2}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    .line 93
    const/4 v1, 0x1

    return v1
.end method

.method synthetic lambda$onCreate$6(Landroid/support/v7/preference/Preference;)Z
    .locals 6
    .param p1, "preference"    # Landroid/support/v7/preference/Preference;

    .prologue
    .line 97
    iget-object v1, p0, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string/jumbo v2, "dnd_end"

    const-wide/16 v4, 0x0

    invoke-interface {v1, v2, v4, v5}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 98
    const-string/jumbo v1, "cat_notify"

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/support/v7/preference/PreferenceCategory;

    .line 99
    .local v0, "cat":Landroid/support/v7/preference/PreferenceCategory;
    iget-object v1, p0, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->cancelDndPref:Landroid/support/v7/preference/Preference;

    invoke-virtual {v0, v1}, Landroid/support/v7/preference/PreferenceCategory;->removePreference(Landroid/support/v7/preference/Preference;)Z

    .line 100
    iget-object v1, p0, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->dnd1Pref:Landroid/support/v7/preference/Preference;

    invoke-virtual {v0, v1}, Landroid/support/v7/preference/PreferenceCategory;->addPreference(Landroid/support/v7/preference/Preference;)Z

    .line 101
    const/4 v1, 0x1

    return v1
.end method

.method synthetic lambda$showDndDialog$7(Landroid/content/DialogInterface;I)V
    .locals 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 131
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 132
    .local v0, "t":J
    packed-switch p2, :pswitch_data_0

    .line 143
    :goto_0
    return-void

    .line 134
    :pswitch_0
    const-wide/32 v2, 0x36ee80

    add-long/2addr v2, v0

    invoke-direct {p0, v2, v3}, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->setDnd(J)V

    goto :goto_0

    .line 137
    :pswitch_1
    const-wide/32 v2, 0x1b77400

    add-long/2addr v2, v0

    invoke-direct {p0, v2, v3}, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->setDnd(J)V

    goto :goto_0

    .line 140
    :pswitch_2
    const-wide/32 v2, 0x5265c00

    add-long/2addr v2, v0

    invoke-direct {p0, v2, v3}, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->setDnd(J)V

    goto :goto_0

    .line 132
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 118
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->prefSound:Lcom/vkontakte/android/ui/RingtonePreference;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->prefSound:Lcom/vkontakte/android/ui/RingtonePreference;

    invoke-virtual {v0, p1, p2, p3}, Lcom/vkontakte/android/ui/RingtonePreference;->onActivityResult(IILandroid/content/Intent;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 119
    :cond_0
    invoke-super {p0, p1, p2, p3}, Lcom/vkontakte/android/fragments/MaterialPreferenceToolbarFragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 121
    :cond_1
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 12
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const-wide/16 v10, 0x3e8

    .line 39
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/MaterialPreferenceToolbarFragment;->onCreate(Landroid/os/Bundle;)V

    .line 40
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-static {v4}, Lcom/vkontakte/android/NotificationUtils;->getNotificationSettings(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->initialSettings:Ljava/lang/String;

    .line 41
    const v4, 0x7f060008

    invoke-virtual {p0, v4}, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->addPreferencesFromResource(I)V

    .line 43
    sget-object v4, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v4}, Landroid/support/v7/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v4

    iput-object v4, p0, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->prefs:Landroid/content/SharedPreferences;

    .line 45
    const-string/jumbo v4, "notifyRingtone"

    invoke-virtual {p0, v4}, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v1

    .line 46
    .local v1, "pref":Landroid/support/v7/preference/Preference;
    if-eqz v1, :cond_0

    .line 47
    invoke-static {p0}, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;)Landroid/support/v7/preference/Preference$OnPreferenceChangeListener;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/support/v7/preference/Preference;->setOnPreferenceChangeListener(Landroid/support/v7/preference/Preference$OnPreferenceChangeListener;)V

    move-object v4, v1

    .line 51
    check-cast v4, Lcom/vkontakte/android/ui/RingtonePreference;

    iput-object v4, p0, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->prefSound:Lcom/vkontakte/android/ui/RingtonePreference;

    .line 52
    invoke-static {p0}, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;)Landroid/support/v7/preference/Preference$OnPreferenceClickListener;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/support/v7/preference/Preference;->setOnPreferenceClickListener(Landroid/support/v7/preference/Preference$OnPreferenceClickListener;)V

    .line 58
    :cond_0
    const-string/jumbo v4, "dnd_cancel"

    invoke-virtual {p0, v4}, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v4

    iput-object v4, p0, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->cancelDndPref:Landroid/support/v7/preference/Preference;

    .line 60
    const-string/jumbo v4, "dnd_hour"

    invoke-virtual {p0, v4}, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->dnd1Pref:Landroid/support/v7/preference/Preference;

    .line 61
    invoke-static {p0}, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment$$Lambda$3;->lambdaFactory$(Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;)Landroid/support/v7/preference/Preference$OnPreferenceClickListener;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/support/v7/preference/Preference;->setOnPreferenceClickListener(Landroid/support/v7/preference/Preference$OnPreferenceClickListener;)V

    .line 67
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x15

    if-ge v4, v5, :cond_1

    .line 68
    const-string/jumbo v4, "notifyHeadsUp"

    invoke-virtual {p0, v4}, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v1

    .line 69
    const-string/jumbo v4, "cat_notify"

    invoke-virtual {p0, v4}, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/support/v7/preference/PreferenceCategory;

    .line 70
    .local v0, "cat":Landroid/support/v7/preference/PreferenceCategory;
    invoke-virtual {v0, v1}, Landroid/support/v7/preference/PreferenceCategory;->removePreference(Landroid/support/v7/preference/Preference;)Z

    .line 73
    .end local v0    # "cat":Landroid/support/v7/preference/PreferenceCategory;
    :cond_1
    const-string/jumbo v4, "notifyPrivMessages"

    invoke-virtual {p0, v4}, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v1

    .line 74
    invoke-static {p0}, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment$$Lambda$4;->lambdaFactory$(Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;)Landroid/support/v7/preference/Preference$OnPreferenceClickListener;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/support/v7/preference/Preference;->setOnPreferenceClickListener(Landroid/support/v7/preference/Preference$OnPreferenceClickListener;)V

    .line 81
    const-string/jumbo v4, "notifyChatMessages"

    invoke-virtual {p0, v4}, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v1

    .line 82
    invoke-static {p0}, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment$$Lambda$5;->lambdaFactory$(Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;)Landroid/support/v7/preference/Preference$OnPreferenceClickListener;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/support/v7/preference/Preference;->setOnPreferenceClickListener(Landroid/support/v7/preference/Preference$OnPreferenceClickListener;)V

    .line 89
    const-string/jumbo v4, "postSubscriptions"

    invoke-virtual {p0, v4}, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v1

    .line 90
    invoke-static {p0}, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment$$Lambda$6;->lambdaFactory$(Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;)Landroid/support/v7/preference/Preference$OnPreferenceClickListener;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/support/v7/preference/Preference;->setOnPreferenceClickListener(Landroid/support/v7/preference/Preference$OnPreferenceClickListener;)V

    .line 96
    iget-object v4, p0, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->cancelDndPref:Landroid/support/v7/preference/Preference;

    invoke-static {p0}, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment$$Lambda$7;->lambdaFactory$(Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;)Landroid/support/v7/preference/Preference$OnPreferenceClickListener;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/support/v7/preference/Preference;->setOnPreferenceClickListener(Landroid/support/v7/preference/Preference$OnPreferenceClickListener;)V

    .line 104
    iget-object v4, p0, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->prefs:Landroid/content/SharedPreferences;

    const-string/jumbo v5, "dnd_end"

    const-wide/16 v6, 0x0

    invoke-interface {v4, v5, v6, v7}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v4

    invoke-static {}, Lcom/vkontakte/android/TimeUtils;->getOffset()I

    move-result v6

    int-to-long v6, v6

    mul-long/2addr v6, v10

    sub-long v2, v4, v6

    .line 105
    .local v2, "t":J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    cmp-long v4, v2, v4

    if-lez v4, :cond_2

    .line 106
    iget-object v4, p0, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->cancelDndPref:Landroid/support/v7/preference/Preference;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f08061e

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    div-long v10, v2, v10

    long-to-int v9, v10

    invoke-static {v9}, Lcom/vkontakte/android/TimeUtils;->langDate(I)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-virtual {v5, v6, v7}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/support/v7/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 107
    const-string/jumbo v4, "cat_notify"

    invoke-virtual {p0, v4}, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v4

    check-cast v4, Landroid/support/v7/preference/PreferenceCategory;

    iget-object v5, p0, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->dnd1Pref:Landroid/support/v7/preference/Preference;

    invoke-virtual {v4, v5}, Landroid/support/v7/preference/PreferenceCategory;->removePreference(Landroid/support/v7/preference/Preference;)Z

    .line 112
    :goto_0
    const/4 v4, 0x0

    invoke-direct {p0, v4}, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->updateRingtoneName(Ljava/lang/String;)V

    .line 113
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->updateExtendedSubtitles()V

    .line 114
    return-void

    .line 109
    :cond_2
    const-string/jumbo v4, "cat_notify"

    invoke-virtual {p0, v4}, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v4

    check-cast v4, Landroid/support/v7/preference/PreferenceCategory;

    iget-object v5, p0, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->cancelDndPref:Landroid/support/v7/preference/Preference;

    invoke-virtual {v4, v5}, Landroid/support/v7/preference/PreferenceCategory;->removePreference(Landroid/support/v7/preference/Preference;)Z

    goto :goto_0
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 168
    invoke-super {p0, p1, p2, p3}, Lcom/vkontakte/android/fragments/MaterialPreferenceToolbarFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object v0

    .line 169
    .local v0, "view":Landroid/view/View;
    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 170
    return-object v0
.end method

.method public onPause()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 159
    invoke-super {p0}, Lcom/vkontakte/android/fragments/MaterialPreferenceToolbarFragment;->onPause()V

    .line 160
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lcom/vkontakte/android/NotificationUtils;->getNotificationSettings(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 161
    .local v0, "newSettings":Ljava/lang/String;
    iget-object v1, p0, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->initialSettings:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 162
    iput-object v0, p0, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->initialSettings:Ljava/lang/String;

    .line 163
    new-instance v1, Lcom/vkontakte/android/api/account/AccountSetPushSettings;

    invoke-direct {v1}, Lcom/vkontakte/android/api/account/AccountSetPushSettings;-><init>()V

    invoke-virtual {v1, v2, v2}, Lcom/vkontakte/android/api/account/AccountSetPushSettings;->persist(Ljava/lang/reflect/Method;Lorg/json/JSONObject;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->setBackground(Z)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    .line 165
    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 0

    .prologue
    .line 153
    invoke-super {p0}, Lcom/vkontakte/android/fragments/MaterialPreferenceToolbarFragment;->onResume()V

    .line 154
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;->updateExtendedSubtitles()V

    .line 155
    return-void
.end method
