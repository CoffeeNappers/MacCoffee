.class public Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;
.super Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;
.source "SettingsAccountInnerFragment.java"


# static fields
.field private static final DOMAIN_RESULT:I = 0x67

.field private static final EMAIL_RESULT:I = 0x65

.field private static final NEWS_FILTER_RESULT:I = 0x69

.field private static final PHONE_RESULT:I = 0x66

.field private static final REQUEST_SYNC_SETTINGS:I = 0x68


# instance fields
.field private info:Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;

    .prologue
    .line 33
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->updateCommunityCommentsLabel()V

    return-void
.end method

.method private updateBannedLabel()V
    .locals 5

    .prologue
    .line 217
    const-string/jumbo v0, "newsBanned"

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v1

    iget-object v0, p0, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->info:Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;

    iget v0, v0, Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;->newsBannedCount:I

    if-lez v0, :cond_0

    const v0, 0x7f080637

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->info:Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;

    iget v4, v4, Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;->newsBannedCount:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {p0, v0, v2}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-virtual {v1, v0}, Landroid/support/v7/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 218
    return-void

    .line 217
    :cond_0
    const v0, 0x7f080636

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private updateCommunityCommentsLabel()V
    .locals 2

    .prologue
    .line 179
    const-string/jumbo v0, "community_comments"

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v1

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    iget-boolean v0, v0, Lcom/vkontakte/android/auth/VKAccount;->communityComments:Z

    if-eqz v0, :cond_0

    const v0, 0x7f08016d

    .line 180
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 179
    :goto_0
    invoke-virtual {v1, v0}, Landroid/support/v7/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 182
    return-void

    .line 180
    :cond_0
    const v0, 0x7f08016e

    .line 181
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private updateCommunityCommentsSetting(Z)V
    .locals 4
    .param p1, "newValue"    # Z

    .prologue
    .line 151
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    iget-boolean v1, v1, Lcom/vkontakte/android/auth/VKAccount;->communityComments:Z

    if-eq v1, p1, :cond_0

    .line 153
    new-instance v0, Lcom/vkontakte/android/api/account/AccountSetInfo;

    invoke-direct {v0}, Lcom/vkontakte/android/api/account/AccountSetInfo;-><init>()V

    .line 154
    .local v0, "accountSetInfo":Lcom/vkontakte/android/api/account/AccountSetInfo;
    invoke-virtual {v0, p1}, Lcom/vkontakte/android/api/account/AccountSetInfo;->setCommunityComments(Z)Lcom/vkontakte/android/api/account/AccountSetInfo;

    .line 156
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/account/AccountSetInfo;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    new-instance v2, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment$3;

    .line 157
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-direct {v2, p0, v3, p1}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment$3;-><init>(Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;Landroid/content/Context;Z)V

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    .line 173
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 176
    .end local v0    # "accountSetInfo":Lcom/vkontakte/android/api/account/AccountSetInfo;
    :cond_0
    return-void
.end method

.method private updateSyncLabel(I)V
    .locals 4
    .param p1, "syncSetting"    # I

    .prologue
    .line 197
    const-string/jumbo v1, "vk"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Update sync label "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 198
    const-string/jumbo v1, "sync"

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v0

    .line 199
    .local v0, "pref":Landroid/support/v7/preference/Preference;
    packed-switch p1, :pswitch_data_0

    .line 214
    :goto_0
    return-void

    .line 201
    :pswitch_0
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/preference/Preference;->setEnabled(Z)V

    .line 202
    const v1, 0x7f0806f3

    invoke-virtual {v0, v1}, Landroid/support/v7/preference/Preference;->setSummary(I)V

    goto :goto_0

    .line 205
    :pswitch_1
    const v1, 0x7f0806ef

    invoke-virtual {v0, v1}, Landroid/support/v7/preference/Preference;->setSummary(I)V

    goto :goto_0

    .line 208
    :pswitch_2
    const v1, 0x7f0806f1

    invoke-virtual {v0, v1}, Landroid/support/v7/preference/Preference;->setSummary(I)V

    goto :goto_0

    .line 211
    :pswitch_3
    const v1, 0x7f0806f4

    invoke-virtual {v0, v1}, Landroid/support/v7/preference/Preference;->setSummary(I)V

    goto :goto_0

    .line 199
    nop

    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method


# virtual methods
.method synthetic lambda$null$4(Landroid/widget/RadioButton;Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "rbForAll"    # Landroid/widget/RadioButton;
    .param p2, "dialog"    # Landroid/content/DialogInterface;
    .param p3, "which"    # I

    .prologue
    .line 121
    invoke-virtual {p1}, Landroid/widget/RadioButton;->isChecked()Z

    move-result v0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->updateCommunityCommentsSetting(Z)V

    .line 122
    return-void
.end method

.method synthetic lambda$onCreate$0(Landroid/support/v7/preference/Preference;)Z
    .locals 4
    .param p1, "preference"    # Landroid/support/v7/preference/Preference;

    .prologue
    const/4 v3, 0x1

    .line 53
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-class v2, Lcom/vkontakte/android/ValidationActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 54
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "url"

    iget-object v2, p0, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->info:Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;

    iget-object v2, v2, Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;->emailLink:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 55
    const-string/jumbo v1, "return_result"

    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 56
    const/16 v1, 0x65

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 57
    return v3
.end method

.method synthetic lambda$onCreate$1(Landroid/support/v7/preference/Preference;)Z
    .locals 4
    .param p1, "preference"    # Landroid/support/v7/preference/Preference;

    .prologue
    const/4 v3, 0x1

    .line 63
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-class v2, Lcom/vkontakte/android/ValidationActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 64
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "url"

    iget-object v2, p0, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->info:Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;

    iget-object v2, v2, Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;->phoneLink:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 65
    const-string/jumbo v1, "return_result"

    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 66
    const/16 v1, 0x65

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 67
    return v3
.end method

.method synthetic lambda$onCreate$2(Landroid/support/v7/preference/Preference;)Z
    .locals 3
    .param p1, "preference"    # Landroid/support/v7/preference/Preference;

    .prologue
    .line 75
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 76
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v1, "domain"

    iget-object v2, p0, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->info:Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;

    iget-object v2, v2, Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;->domain:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    new-instance v1, Lcom/vkontakte/android/navigation/Navigator;

    const-class v2, Lcom/vkontakte/android/fragments/SettingsDomainFragment;

    invoke-direct {v1, v2, v0}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;Landroid/os/Bundle;)V

    const/16 v2, 0x67

    invoke-virtual {v1, p0, v2}, Lcom/vkontakte/android/navigation/Navigator;->forResult(Landroid/app/Fragment;I)Z

    .line 78
    const/4 v1, 0x1

    return v1
.end method

.method synthetic lambda$onCreate$3(Landroid/support/v7/preference/Preference;)Z
    .locals 3
    .param p1, "preference"    # Landroid/support/v7/preference/Preference;

    .prologue
    .line 83
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-class v2, Lcom/vkontakte/android/ChangePasswordActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 84
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->startActivity(Landroid/content/Intent;)V

    .line 85
    const/4 v1, 0x1

    return v1
.end method

.method synthetic lambda$onCreate$5(Landroid/support/v7/preference/Preference;)Z
    .locals 9
    .param p1, "p"    # Landroid/support/v7/preference/Preference;

    .prologue
    const/4 v8, 0x0

    const/4 v5, 0x1

    .line 91
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    const v6, 0x7f0301f5

    invoke-static {v4, v6, v8}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 93
    .local v1, "communitySettings":Landroid/view/View;
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v4

    iget-boolean v0, v4, Lcom/vkontakte/android/auth/VKAccount;->communityComments:Z

    .line 95
    .local v0, "communityCommentsEnabled":Z
    const v4, 0x7f100529

    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/RadioButton;

    .line 96
    .local v3, "rbForAll":Landroid/widget/RadioButton;
    invoke-virtual {v3, v0}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 98
    const v4, 0x7f100527

    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/RadioButton;

    .line 99
    .local v2, "rbForAdmined":Landroid/widget/RadioButton;
    if-nez v0, :cond_0

    move v4, v5

    :goto_0
    invoke-virtual {v2, v4}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 101
    const v4, 0x7f100528

    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    new-instance v6, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment$1;

    invoke-direct {v6, p0, v3, v2}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment$1;-><init>(Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;Landroid/widget/RadioButton;Landroid/widget/RadioButton;)V

    invoke-virtual {v4, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 109
    const v4, 0x7f100526

    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    new-instance v6, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment$2;

    invoke-direct {v6, p0, v3, v2}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment$2;-><init>(Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;Landroid/widget/RadioButton;Landroid/widget/RadioButton;)V

    invoke-virtual {v4, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 117
    new-instance v4, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->getActivity()Landroid/app/Activity;

    move-result-object v6

    invoke-direct {v4, v6}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v6, 0x7f080171

    .line 118
    invoke-virtual {v4, v6}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    .line 119
    invoke-virtual {v4, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const v6, 0x7f0805d9

    invoke-static {p0, v3}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment$$Lambda$8;->lambdaFactory$(Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;Landroid/widget/RadioButton;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v7

    .line 120
    invoke-virtual {v4, v6, v7}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const v6, 0x7f08011f

    .line 123
    invoke-virtual {v4, v6, v8}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    .line 124
    invoke-virtual {v4}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 125
    return v5

    .line 99
    :cond_0
    const/4 v4, 0x0

    goto :goto_0
.end method

.method synthetic lambda$onCreate$6(Landroid/support/v7/preference/Preference;)Z
    .locals 3
    .param p1, "preference"    # Landroid/support/v7/preference/Preference;

    .prologue
    .line 131
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-class v2, Lcom/vkontakte/android/WelcomeActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 132
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "syncsettings"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 133
    const/16 v1, 0x68

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 134
    const/4 v1, 0x1

    return v1
.end method

.method synthetic lambda$onCreate$7(Landroid/support/v7/preference/Preference;)Z
    .locals 3
    .param p1, "preference"    # Landroid/support/v7/preference/Preference;

    .prologue
    .line 144
    new-instance v0, Lcom/vkontakte/android/navigation/Navigator;

    const-class v1, Lcom/vkontakte/android/fragments/NewsfeedFilterListFragment;

    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const/16 v2, 0x69

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/navigation/Navigator;->forResult(Landroid/app/Activity;I)Z

    .line 145
    const/4 v0, 0x1

    return v0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 6
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    const/4 v5, 0x0

    const/4 v4, -0x1

    .line 221
    invoke-super {p0, p1, p2, p3}, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 222
    const/16 v2, 0x68

    if-ne p1, v2, :cond_0

    if-ne p2, v4, :cond_0

    .line 223
    const-string/jumbo v2, "option"

    invoke-virtual {p3, v2, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    invoke-direct {p0, v2}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->updateSyncLabel(I)V

    .line 225
    :cond_0
    const/16 v2, 0x66

    if-ne p1, v2, :cond_1

    if-ne p2, v4, :cond_1

    .line 226
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    .line 227
    .local v1, "uri":Landroid/net/Uri;
    const-string/jumbo v2, "phone"

    invoke-virtual {v1, v2}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 228
    iget-object v2, p0, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->info:Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;

    const-string/jumbo v3, "phone"

    invoke-virtual {v1, v3}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;->phone:Ljava/lang/String;

    .line 229
    const-string/jumbo v2, "phone"

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v0

    .line 230
    .local v0, "pref":Landroid/support/v7/preference/Preference;
    iget-object v2, p0, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->info:Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;

    iget-object v2, v2, Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;->phone:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/support/v7/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 233
    .end local v0    # "pref":Landroid/support/v7/preference/Preference;
    .end local v1    # "uri":Landroid/net/Uri;
    :cond_1
    const/16 v2, 0x65

    if-ne p1, v2, :cond_2

    if-ne p2, v4, :cond_2

    .line 234
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    .line 235
    .restart local v1    # "uri":Landroid/net/Uri;
    const-string/jumbo v2, "email"

    invoke-virtual {v1, v2}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 236
    iget-object v2, p0, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->info:Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;

    const-string/jumbo v3, "email"

    invoke-virtual {v1, v3}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;->email:Ljava/lang/String;

    .line 237
    const-string/jumbo v2, "email"

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v0

    .line 238
    .restart local v0    # "pref":Landroid/support/v7/preference/Preference;
    iget-object v2, p0, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->info:Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;

    iget-object v2, v2, Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;->email:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/support/v7/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 241
    .end local v0    # "pref":Landroid/support/v7/preference/Preference;
    .end local v1    # "uri":Landroid/net/Uri;
    :cond_2
    const/16 v2, 0x69

    if-ne p1, v2, :cond_3

    if-ne p2, v4, :cond_3

    .line 242
    iget-object v2, p0, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->info:Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;

    const-string/jumbo v3, "new_count"

    invoke-virtual {p3, v3, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    iput v3, v2, Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;->newsBannedCount:I

    .line 243
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->updateBannedLabel()V

    .line 245
    :cond_3
    const/16 v2, 0x67

    if-ne p1, v2, :cond_4

    if-ne p2, v4, :cond_4

    .line 246
    iget-object v2, p0, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->info:Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;

    const-string/jumbo v3, "new_domain"

    invoke-virtual {p3, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;->domain:Ljava/lang/String;

    .line 247
    const-string/jumbo v2, "domain"

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "@"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->info:Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;

    iget-object v4, v4, Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;->domain:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/support/v7/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 249
    :cond_4
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 45
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 46
    const v1, 0x7f060005

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->addPreferencesFromResource(I)V

    .line 48
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v4, "api_result"

    invoke-virtual {v1, v4}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;

    iput-object v1, p0, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->info:Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;

    .line 50
    const-string/jumbo v1, "email"

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v0

    .line 51
    .local v0, "pref":Landroid/support/v7/preference/Preference;
    iget-object v1, p0, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->info:Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;

    iget-object v1, v1, Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;->email:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/support/v7/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 52
    invoke-static {p0}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;)Landroid/support/v7/preference/Preference$OnPreferenceClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v7/preference/Preference;->setOnPreferenceClickListener(Landroid/support/v7/preference/Preference$OnPreferenceClickListener;)V

    .line 60
    const-string/jumbo v1, "phone"

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v0

    .line 61
    iget-object v1, p0, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->info:Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;

    iget-object v1, v1, Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;->phone:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/support/v7/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 62
    invoke-static {p0}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;)Landroid/support/v7/preference/Preference$OnPreferenceClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v7/preference/Preference;->setOnPreferenceClickListener(Landroid/support/v7/preference/Preference$OnPreferenceClickListener;)V

    .line 70
    const-string/jumbo v1, "domain"

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v0

    .line 71
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "@"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v4, p0, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->info:Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;

    iget-object v4, v4, Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;->domain:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v7/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 72
    invoke-static {p0}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment$$Lambda$3;->lambdaFactory$(Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;)Landroid/support/v7/preference/Preference$OnPreferenceClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v7/preference/Preference;->setOnPreferenceClickListener(Landroid/support/v7/preference/Preference$OnPreferenceClickListener;)V

    .line 81
    const-string/jumbo v1, "changePassword"

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v0

    .line 82
    invoke-static {p0}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment$$Lambda$4;->lambdaFactory$(Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;)Landroid/support/v7/preference/Preference$OnPreferenceClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v7/preference/Preference;->setOnPreferenceClickListener(Landroid/support/v7/preference/Preference$OnPreferenceClickListener;)V

    .line 88
    const-string/jumbo v1, "community_comments"

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v0

    .line 89
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->updateCommunityCommentsLabel()V

    .line 90
    invoke-static {p0}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment$$Lambda$5;->lambdaFactory$(Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;)Landroid/support/v7/preference/Preference$OnPreferenceClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v7/preference/Preference;->setOnPreferenceClickListener(Landroid/support/v7/preference/Preference$OnPreferenceClickListener;)V

    .line 128
    const-string/jumbo v1, "sync"

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v0

    .line 129
    invoke-static {}, Lcom/vkontakte/android/auth/VKAuthUtils;->getCurrentSyncOption()I

    move-result v1

    invoke-direct {p0, v1}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->updateSyncLabel(I)V

    .line 130
    invoke-static {p0}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment$$Lambda$6;->lambdaFactory$(Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;)Landroid/support/v7/preference/Preference$OnPreferenceClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v7/preference/Preference;->setOnPreferenceClickListener(Landroid/support/v7/preference/Preference$OnPreferenceClickListener;)V

    .line 137
    const-string/jumbo v1, "onlyMyPosts"

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v0

    .line 138
    check-cast v0, Landroid/support/v7/preference/ListPreference;

    .end local v0    # "pref":Landroid/support/v7/preference/Preference;
    iget-object v1, p0, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->info:Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;

    iget-boolean v1, v1, Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;->ownPostsDefault:Z

    if-eqz v1, :cond_0

    move v1, v2

    :goto_0
    invoke-virtual {v0, v1}, Landroid/support/v7/preference/ListPreference;->setValueIndex(I)V

    .line 139
    const-string/jumbo v1, "enableComments"

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v0

    .line 140
    .restart local v0    # "pref":Landroid/support/v7/preference/Preference;
    check-cast v0, Landroid/support/v7/preference/TwoStatePreference;

    .end local v0    # "pref":Landroid/support/v7/preference/Preference;
    iget-object v1, p0, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->info:Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;

    iget-boolean v1, v1, Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;->noWallReplies:Z

    if-nez v1, :cond_1

    :goto_1
    invoke-virtual {v0, v2}, Landroid/support/v7/preference/TwoStatePreference;->setChecked(Z)V

    .line 142
    const-string/jumbo v1, "newsBanned"

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v0

    .line 143
    .restart local v0    # "pref":Landroid/support/v7/preference/Preference;
    invoke-static {p0}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment$$Lambda$7;->lambdaFactory$(Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;)Landroid/support/v7/preference/Preference$OnPreferenceClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v7/preference/Preference;->setOnPreferenceClickListener(Landroid/support/v7/preference/Preference$OnPreferenceClickListener;)V

    .line 147
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->updateBannedLabel()V

    .line 148
    return-void

    .end local v0    # "pref":Landroid/support/v7/preference/Preference;
    :cond_0
    move v1, v3

    .line 138
    goto :goto_0

    :cond_1
    move v2, v3

    .line 140
    goto :goto_1
.end method

.method public onPause()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 186
    invoke-super {p0}, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;->onPause()V

    .line 187
    const-string/jumbo v3, "onlyMyPosts"

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v2

    .line 188
    .local v2, "pref":Landroid/support/v7/preference/Preference;
    check-cast v2, Landroid/support/v7/preference/ListPreference;

    .end local v2    # "pref":Landroid/support/v7/preference/Preference;
    invoke-virtual {v2}, Landroid/support/v7/preference/ListPreference;->getValue()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "off"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 189
    .local v1, "newOnlyMy":Z
    const-string/jumbo v3, "enableComments"

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v2

    .line 190
    .restart local v2    # "pref":Landroid/support/v7/preference/Preference;
    check-cast v2, Landroid/support/v7/preference/TwoStatePreference;

    .end local v2    # "pref":Landroid/support/v7/preference/Preference;
    invoke-virtual {v2}, Landroid/support/v7/preference/TwoStatePreference;->isChecked()Z

    move-result v3

    if-nez v3, :cond_2

    const/4 v0, 0x1

    .line 191
    .local v0, "newNoComments":Z
    :goto_0
    iget-object v3, p0, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->info:Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;

    iget-boolean v3, v3, Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;->ownPostsDefault:Z

    if-ne v1, v3, :cond_0

    iget-object v3, p0, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->info:Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;

    iget-boolean v3, v3, Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;->noWallReplies:Z

    if-eq v0, v3, :cond_1

    .line 192
    :cond_0
    new-instance v3, Lcom/vkontakte/android/api/account/AccountSetInfo;

    invoke-direct {v3, v1, v0}, Lcom/vkontakte/android/api/account/AccountSetInfo;-><init>(ZZ)V

    invoke-virtual {v3, v5, v5}, Lcom/vkontakte/android/api/account/AccountSetInfo;->persist(Ljava/lang/reflect/Method;Lorg/json/JSONObject;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/api/VKAPIRequest;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    .line 194
    :cond_1
    return-void

    .line 190
    .end local v0    # "newNoComments":Z
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method
