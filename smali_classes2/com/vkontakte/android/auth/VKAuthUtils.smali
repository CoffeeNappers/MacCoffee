.class public Lcom/vkontakte/android/auth/VKAuthUtils;
.super Ljava/lang/Object;
.source "VKAuthUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static addSystemAccount(Ljava/lang/String;)Z
    .locals 8
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 60
    :try_start_0
    new-instance v0, Landroid/accounts/Account;

    const-string/jumbo v5, "com.vkontakte.account"

    invoke-direct {v0, p0, v5}, Landroid/accounts/Account;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    .local v0, "account":Landroid/accounts/Account;
    sget-object v5, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v5}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v5

    const/4 v6, 0x0

    const/4 v7, 0x0

    .line 62
    invoke-virtual {v5, v0, v6, v7}, Landroid/accounts/AccountManager;->addAccountExplicitly(Landroid/accounts/Account;Ljava/lang/String;Landroid/os/Bundle;)Z

    move-result v1

    .line 63
    .local v1, "accountWasAdded":Z
    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v5}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    .line 64
    const-string/jumbo v5, "com.android.contacts"

    const/4 v6, 0x1

    invoke-static {v0, v5, v6}, Landroid/content/ContentResolver;->setIsSyncable(Landroid/accounts/Account;Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 68
    .end local v0    # "account":Landroid/accounts/Account;
    .end local v1    # "accountWasAdded":Z
    :goto_0
    return v3

    .line 66
    :catch_0
    move-exception v2

    .line 67
    .local v2, "x":Ljava/lang/Exception;
    new-array v3, v4, [Ljava/lang/Object;

    invoke-static {v2, v3}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    move v3, v4

    .line 68
    goto :goto_0
.end method

.method static clearAccountFromSharedPreferences(Landroid/content/SharedPreferences;)V
    .locals 2
    .param p0, "prefs"    # Landroid/content/SharedPreferences;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 222
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "uid"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "sid"

    .line 223
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "secret"

    .line 224
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "username"

    .line 225
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "first_name_gen"

    .line 226
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "last_name_gen"

    .line 227
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "verified"

    .line 228
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "userphoto"

    .line 229
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "userstatus"

    .line 230
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "usercountry"

    .line 231
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "usersex"

    .line 232
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "intro"

    .line 233
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "export_twitter_avail"

    .line 234
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "export_facebook_avail"

    .line 235
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "ads_stoplist"

    .line 236
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "allow_buy_votes"

    .line 237
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "support_url"

    .line 238
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "use_vigo"

    .line 239
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "vigo_connect_timeout"

    .line 240
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "vigo_read_timeout"

    .line 241
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "money_transfers_available"

    .line 242
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "money_transfers_can_send"

    .line 243
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "money_transfers_can_send_to_communities"

    .line 244
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "money_transfers_max_amount"

    .line 245
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "money_transfers_min_amount"

    .line 246
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "gif_autoplay_available"

    .line 247
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "video_autoplay_available"

    .line 248
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "default_audio_player"

    .line 249
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "stories_available"

    .line 250
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "audio_ad_available"

    .line 251
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "debug_available"

    .line 252
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "has_music_subscription"

    .line 253
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "audio_ad_config"

    .line 254
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "raise_to_record_enabled"

    .line 255
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "vklive_app"

    .line 256
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "profiler_config"

    .line 257
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "video_player"

    .line 258
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "is_music_restricted"

    .line 259
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "music_intro"

    .line 260
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "audio_background_limit"

    .line 261
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "community_comments"

    .line 262
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 263
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 264
    return-void
.end method

.method public static getCurrentSyncOption()I
    .locals 12

    .prologue
    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 74
    :try_start_0
    sget-object v9, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v9}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v2

    .line 75
    .local v2, "am":Landroid/accounts/AccountManager;
    const-string/jumbo v9, "com.vkontakte.account"

    invoke-virtual {v2, v9}, Landroid/accounts/AccountManager;->getAccountsByType(Ljava/lang/String;)[Landroid/accounts/Account;

    move-result-object v1

    .line 76
    .local v1, "accounts":[Landroid/accounts/Account;
    array-length v9, v1

    if-nez v9, :cond_0

    .line 77
    new-instance v0, Landroid/accounts/Account;

    sget-object v9, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-virtual {v9, v10, v11}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v9

    const-string/jumbo v10, "username"

    const-string/jumbo v11, ""

    invoke-interface {v9, v10, v11}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string/jumbo v10, "com.vkontakte.account"

    invoke-direct {v0, v9, v10}, Landroid/accounts/Account;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    .local v0, "account":Landroid/accounts/Account;
    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-virtual {v2, v0, v9, v10}, Landroid/accounts/AccountManager;->addAccountExplicitly(Landroid/accounts/Account;Ljava/lang/String;Landroid/os/Bundle;)Z

    .line 79
    const/4 v9, 0x1

    new-array v1, v9, [Landroid/accounts/Account;

    .end local v1    # "accounts":[Landroid/accounts/Account;
    const/4 v9, 0x0

    aput-object v0, v1, v9

    .line 81
    .end local v0    # "account":Landroid/accounts/Account;
    .restart local v1    # "accounts":[Landroid/accounts/Account;
    :cond_0
    const/4 v9, 0x0

    aget-object v9, v1, v9

    const-string/jumbo v10, "com.android.contacts"

    invoke-static {v9, v10}, Landroid/content/ContentResolver;->getSyncAutomatically(Landroid/accounts/Account;Ljava/lang/String;)Z

    move-result v5

    .line 82
    .local v5, "syncEnabled":Z
    sget-object v9, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-virtual {v9, v10, v11}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    .line 83
    .local v3, "prefs":Landroid/content/SharedPreferences;
    const-string/jumbo v9, "sync_all"

    const/4 v10, 0x0

    invoke-interface {v3, v9, v10}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v4

    .line 84
    .local v4, "syncAll":Z
    if-nez v5, :cond_2

    .line 85
    const/4 v7, 0x2

    .line 94
    .end local v1    # "accounts":[Landroid/accounts/Account;
    .end local v3    # "prefs":Landroid/content/SharedPreferences;
    .end local v4    # "syncAll":Z
    .end local v5    # "syncEnabled":Z
    :cond_1
    :goto_0
    return v7

    .line 87
    .restart local v1    # "accounts":[Landroid/accounts/Account;
    .restart local v3    # "prefs":Landroid/content/SharedPreferences;
    .restart local v4    # "syncAll":Z
    .restart local v5    # "syncEnabled":Z
    :cond_2
    if-eqz v4, :cond_1

    move v7, v8

    .line 90
    goto :goto_0

    .line 91
    .end local v1    # "accounts":[Landroid/accounts/Account;
    .end local v3    # "prefs":Landroid/content/SharedPreferences;
    .end local v4    # "syncAll":Z
    .end local v5    # "syncEnabled":Z
    :catch_0
    move-exception v6

    .line 92
    .local v6, "x":Ljava/lang/Exception;
    const-string/jumbo v7, "vk"

    invoke-static {v7, v6}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 94
    const/4 v7, -0x1

    goto :goto_0
.end method

.method public static hasSystemAccount()Z
    .locals 5

    .prologue
    const/4 v3, 0x0

    .line 37
    :try_start_0
    sget-object v4, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v4}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v1

    .line 38
    .local v1, "am":Landroid/accounts/AccountManager;
    const-string/jumbo v4, "com.vkontakte.account"

    invoke-virtual {v1, v4}, Landroid/accounts/AccountManager;->getAccountsByType(Ljava/lang/String;)[Landroid/accounts/Account;

    move-result-object v0

    .line 39
    .local v0, "acc":[Landroid/accounts/Account;
    array-length v4, v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-lez v4, :cond_0

    const/4 v3, 0x1

    .line 42
    .end local v0    # "acc":[Landroid/accounts/Account;
    :cond_0
    :goto_0
    return v3

    .line 40
    :catch_0
    move-exception v2

    .line 41
    .local v2, "x":Ljava/lang/Exception;
    new-array v4, v3, [Ljava/lang/Object;

    invoke-static {v2, v4}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method static loadAccountFromSharedPreferences(Landroid/content/SharedPreferences;Lcom/vkontakte/android/auth/VKAccount;)Lcom/vkontakte/android/auth/VKAccount;
    .locals 4
    .param p0, "prefs"    # Landroid/content/SharedPreferences;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "account"    # Lcom/vkontakte/android/auth/VKAccount;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 334
    const-string/jumbo v2, "uid"

    iget v3, p1, Lcom/vkontakte/android/auth/VKAccount;->uid:I

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    iput v2, p1, Lcom/vkontakte/android/auth/VKAccount;->uid:I

    .line 335
    const-string/jumbo v2, "sid"

    iget-object v3, p1, Lcom/vkontakte/android/auth/VKAccount;->accessToken:Ljava/lang/String;

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p1, Lcom/vkontakte/android/auth/VKAccount;->accessToken:Ljava/lang/String;

    .line 336
    const-string/jumbo v2, "secret"

    iget-object v3, p1, Lcom/vkontakte/android/auth/VKAccount;->secret:Ljava/lang/String;

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p1, Lcom/vkontakte/android/auth/VKAccount;->secret:Ljava/lang/String;

    .line 337
    const-string/jumbo v2, "username"

    iget-object v3, p1, Lcom/vkontakte/android/auth/VKAccount;->name:Ljava/lang/String;

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p1, Lcom/vkontakte/android/auth/VKAccount;->name:Ljava/lang/String;

    .line 338
    const-string/jumbo v2, "first_name_gen"

    iget-object v3, p1, Lcom/vkontakte/android/auth/VKAccount;->first_name_gen:Ljava/lang/String;

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p1, Lcom/vkontakte/android/auth/VKAccount;->first_name_gen:Ljava/lang/String;

    .line 339
    const-string/jumbo v2, "last_name_gen"

    iget-object v3, p1, Lcom/vkontakte/android/auth/VKAccount;->last_name_gen:Ljava/lang/String;

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p1, Lcom/vkontakte/android/auth/VKAccount;->last_name_gen:Ljava/lang/String;

    .line 340
    const-string/jumbo v2, "verified"

    iget-boolean v3, p1, Lcom/vkontakte/android/auth/VKAccount;->verified:Z

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, p1, Lcom/vkontakte/android/auth/VKAccount;->verified:Z

    .line 341
    const-string/jumbo v2, "userphoto"

    iget-object v3, p1, Lcom/vkontakte/android/auth/VKAccount;->photo:Ljava/lang/String;

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p1, Lcom/vkontakte/android/auth/VKAccount;->photo:Ljava/lang/String;

    .line 342
    const-string/jumbo v2, "userstatus"

    iget-object v3, p1, Lcom/vkontakte/android/auth/VKAccount;->status:Ljava/lang/String;

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p1, Lcom/vkontakte/android/auth/VKAccount;->status:Ljava/lang/String;

    .line 343
    const-string/jumbo v2, "usercountry"

    iget v3, p1, Lcom/vkontakte/android/auth/VKAccount;->country:I

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    iput v2, p1, Lcom/vkontakte/android/auth/VKAccount;->country:I

    .line 344
    const-string/jumbo v2, "usersex"

    iget-boolean v3, p1, Lcom/vkontakte/android/auth/VKAccount;->isFemale:Z

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, p1, Lcom/vkontakte/android/auth/VKAccount;->isFemale:Z

    .line 345
    const-string/jumbo v2, "intro"

    iget v3, p1, Lcom/vkontakte/android/auth/VKAccount;->intro:I

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    iput v2, p1, Lcom/vkontakte/android/auth/VKAccount;->intro:I

    .line 346
    const-string/jumbo v2, "export_twitter_avail"

    iget-boolean v3, p1, Lcom/vkontakte/android/auth/VKAccount;->exportTwitterAvail:Z

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, p1, Lcom/vkontakte/android/auth/VKAccount;->exportTwitterAvail:Z

    .line 347
    const-string/jumbo v2, "export_facebook_avail"

    iget-boolean v3, p1, Lcom/vkontakte/android/auth/VKAccount;->exportFacebookAvail:Z

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, p1, Lcom/vkontakte/android/auth/VKAccount;->exportFacebookAvail:Z

    .line 348
    const-string/jumbo v2, "allow_buy_votes"

    iget-boolean v3, p1, Lcom/vkontakte/android/auth/VKAccount;->allowBuyVotes:Z

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, p1, Lcom/vkontakte/android/auth/VKAccount;->allowBuyVotes:Z

    .line 349
    const-string/jumbo v2, "support_url"

    iget-object v3, p1, Lcom/vkontakte/android/auth/VKAccount;->supportUrl:Ljava/lang/String;

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p1, Lcom/vkontakte/android/auth/VKAccount;->supportUrl:Ljava/lang/String;

    .line 350
    const-string/jumbo v2, "use_vigo"

    iget-boolean v3, p1, Lcom/vkontakte/android/auth/VKAccount;->useVigo:Z

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, p1, Lcom/vkontakte/android/auth/VKAccount;->useVigo:Z

    .line 351
    const-string/jumbo v2, "vigo_connect_timeout"

    iget v3, p1, Lcom/vkontakte/android/auth/VKAccount;->vigoConnectTimeout:I

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    iput v2, p1, Lcom/vkontakte/android/auth/VKAccount;->vigoConnectTimeout:I

    .line 352
    const-string/jumbo v2, "vigo_read_timeout"

    iget v3, p1, Lcom/vkontakte/android/auth/VKAccount;->vigoReadTimeout:I

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    iput v2, p1, Lcom/vkontakte/android/auth/VKAccount;->vigoReadTimeout:I

    .line 353
    const-string/jumbo v2, "money_transfers_available"

    iget-boolean v3, p1, Lcom/vkontakte/android/auth/VKAccount;->moneyTransfersAvailable:Z

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, p1, Lcom/vkontakte/android/auth/VKAccount;->moneyTransfersAvailable:Z

    .line 354
    const-string/jumbo v2, "money_transfers_can_send"

    iget-boolean v3, p1, Lcom/vkontakte/android/auth/VKAccount;->moneyTransfersCanSend:Z

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, p1, Lcom/vkontakte/android/auth/VKAccount;->moneyTransfersCanSend:Z

    .line 355
    const-string/jumbo v2, "money_transfers_currency"

    iget-object v3, p1, Lcom/vkontakte/android/auth/VKAccount;->monetTransfersCurrency:Ljava/lang/String;

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p1, Lcom/vkontakte/android/auth/VKAccount;->monetTransfersCurrency:Ljava/lang/String;

    .line 356
    const-string/jumbo v2, "money_transfers_can_send_to_communities"

    iget-boolean v3, p1, Lcom/vkontakte/android/auth/VKAccount;->moneyTransfersCanSendToCommunities:Z

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, p1, Lcom/vkontakte/android/auth/VKAccount;->moneyTransfersCanSendToCommunities:Z

    .line 357
    const-string/jumbo v2, "money_transfers_max_amount"

    iget v3, p1, Lcom/vkontakte/android/auth/VKAccount;->moneyTransfersMaxAmount:I

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    iput v2, p1, Lcom/vkontakte/android/auth/VKAccount;->moneyTransfersMaxAmount:I

    .line 358
    const-string/jumbo v2, "money_transfers_min_amount"

    iget v3, p1, Lcom/vkontakte/android/auth/VKAccount;->moneyTransfersMinAmount:I

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    iput v2, p1, Lcom/vkontakte/android/auth/VKAccount;->moneyTransfersMinAmount:I

    .line 359
    const-string/jumbo v2, "gif_autoplay_available"

    iget-boolean v3, p1, Lcom/vkontakte/android/auth/VKAccount;->gifAutoPlayAvailable:Z

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, p1, Lcom/vkontakte/android/auth/VKAccount;->gifAutoPlayAvailable:Z

    .line 360
    const-string/jumbo v2, "video_autoplay_available"

    iget-boolean v3, p1, Lcom/vkontakte/android/auth/VKAccount;->videoAutoPlayAvailable:Z

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, p1, Lcom/vkontakte/android/auth/VKAccount;->videoAutoPlayAvailable:Z

    .line 361
    const-string/jumbo v2, "default_audio_player"

    iget-object v3, p1, Lcom/vkontakte/android/auth/VKAccount;->defaultAudioPlayer:Ljava/lang/String;

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p1, Lcom/vkontakte/android/auth/VKAccount;->defaultAudioPlayer:Ljava/lang/String;

    .line 362
    const-string/jumbo v2, "stories_available"

    iget-boolean v3, p1, Lcom/vkontakte/android/auth/VKAccount;->storiesAvailable:Z

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, p1, Lcom/vkontakte/android/auth/VKAccount;->storiesAvailable:Z

    .line 363
    const-string/jumbo v2, "masks_available"

    iget-boolean v3, p1, Lcom/vkontakte/android/auth/VKAccount;->masksAvailable:Z

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, p1, Lcom/vkontakte/android/auth/VKAccount;->masksAvailable:Z

    .line 364
    const-string/jumbo v2, "audio_ad_available"

    iget-boolean v3, p1, Lcom/vkontakte/android/auth/VKAccount;->audioAdAvailable:Z

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, p1, Lcom/vkontakte/android/auth/VKAccount;->audioAdAvailable:Z

    .line 365
    const-string/jumbo v2, "raise_to_record_enabled"

    iget-boolean v3, p1, Lcom/vkontakte/android/auth/VKAccount;->riseToRecordAvailable:Z

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, p1, Lcom/vkontakte/android/auth/VKAccount;->riseToRecordAvailable:Z

    .line 366
    const-string/jumbo v2, "vklive_app"

    iget-boolean v3, p1, Lcom/vkontakte/android/auth/VKAccount;->vkLiveStreamAvailable:Z

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, p1, Lcom/vkontakte/android/auth/VKAccount;->vkLiveStreamAvailable:Z

    .line 367
    const-string/jumbo v2, "debug_available"

    iget-boolean v3, p1, Lcom/vkontakte/android/auth/VKAccount;->debugAvailable:Z

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, p1, Lcom/vkontakte/android/auth/VKAccount;->debugAvailable:Z

    .line 368
    const-string/jumbo v2, "has_music_subscription"

    iget-boolean v3, p1, Lcom/vkontakte/android/auth/VKAccount;->hasMusicSubscription:Z

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, p1, Lcom/vkontakte/android/auth/VKAccount;->hasMusicSubscription:Z

    .line 369
    const-string/jumbo v2, "is_music_restricted"

    iget-boolean v3, p1, Lcom/vkontakte/android/auth/VKAccount;->isMusicRestricted:Z

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, p1, Lcom/vkontakte/android/auth/VKAccount;->isMusicRestricted:Z

    .line 370
    const-string/jumbo v2, "music_intro"

    iget-boolean v3, p1, Lcom/vkontakte/android/auth/VKAccount;->musicIntroWasShowed:Z

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, p1, Lcom/vkontakte/android/auth/VKAccount;->musicIntroWasShowed:Z

    .line 371
    const-string/jumbo v2, "audio_background_limit"

    iget v3, p1, Lcom/vkontakte/android/auth/VKAccount;->audioBackgroundLimit:I

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    iput v2, p1, Lcom/vkontakte/android/auth/VKAccount;->audioBackgroundLimit:I

    .line 373
    const-string/jumbo v2, "audio_ad_config"

    const-string/jumbo v3, ""

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/vkontakte/android/auth/configs/AudioAdConfig;->fromJSONString(Ljava/lang/String;)Lcom/vkontakte/android/auth/configs/AudioAdConfig;

    move-result-object v2

    iput-object v2, p1, Lcom/vkontakte/android/auth/VKAccount;->audioAdConfig:Lcom/vkontakte/android/auth/configs/AudioAdConfig;

    .line 374
    const-string/jumbo v2, "video_player"

    const-string/jumbo v3, ""

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/vkontakte/android/auth/configs/VideoConfig;->fromJSONString(Ljava/lang/String;)Lcom/vkontakte/android/auth/configs/VideoConfig;

    move-result-object v2

    iput-object v2, p1, Lcom/vkontakte/android/auth/VKAccount;->videoConfig:Lcom/vkontakte/android/auth/configs/VideoConfig;

    .line 376
    const-string/jumbo v2, "html_games_enabled"

    iget-boolean v3, p1, Lcom/vkontakte/android/auth/VKAccount;->htmlGamesEnabled:Z

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, p1, Lcom/vkontakte/android/auth/VKAccount;->htmlGamesEnabled:Z

    .line 377
    const-string/jumbo v2, "community_comments"

    iget-boolean v3, p1, Lcom/vkontakte/android/auth/VKAccount;->communityComments:Z

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, p1, Lcom/vkontakte/android/auth/VKAccount;->communityComments:Z

    .line 378
    const-string/jumbo v2, "use_web_app_for_report_content"

    iget-boolean v3, p1, Lcom/vkontakte/android/auth/VKAccount;->useWebAppForReportContent:Z

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, p1, Lcom/vkontakte/android/auth/VKAccount;->useWebAppForReportContent:Z

    .line 380
    const-string/jumbo v2, "profiler_config"

    const-string/jumbo v3, ""

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 381
    .local v1, "profilerConfigStr":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 383
    :try_start_0
    new-instance v2, Lcom/vkontakte/android/auth/configs/ProfilerConfig;

    invoke-direct {v2, v1}, Lcom/vkontakte/android/auth/configs/ProfilerConfig;-><init>(Ljava/lang/String;)V

    iput-object v2, p1, Lcom/vkontakte/android/auth/VKAccount;->profilerConfig:Lcom/vkontakte/android/auth/configs/ProfilerConfig;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 390
    :cond_0
    :goto_0
    return-object p1

    .line 384
    :catch_0
    move-exception v0

    .line 385
    .local v0, "e":Lorg/json/JSONException;
    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v0, v2}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    .line 386
    const/4 v2, 0x0

    iput-object v2, p1, Lcom/vkontakte/android/auth/VKAccount;->profilerConfig:Lcom/vkontakte/android/auth/configs/ProfilerConfig;

    goto :goto_0
.end method

.method public static parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/auth/VKAccount;
    .locals 15
    .param p0, "o"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 98
    const-string/jumbo v12, "profile"

    invoke-virtual {p0, v12}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    .line 99
    .local v3, "jp":Lorg/json/JSONObject;
    const-string/jumbo v12, "info"

    invoke-virtual {p0, v12}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 100
    .local v2, "info":Lorg/json/JSONObject;
    const-string/jumbo v12, "exports"

    invoke-virtual {v3, v12}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    .line 102
    .local v4, "jx":Lorg/json/JSONObject;
    new-instance v11, Lcom/vkontakte/android/auth/VKAccount;

    invoke-direct {v11}, Lcom/vkontakte/android/auth/VKAccount;-><init>()V

    .line 103
    .local v11, "vkAccount":Lcom/vkontakte/android/auth/VKAccount;
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v13, "first_name"

    invoke-virtual {v3, v13}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string/jumbo v13, " "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string/jumbo v13, "last_name"

    invoke-virtual {v3, v13}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    iput-object v12, v11, Lcom/vkontakte/android/auth/VKAccount;->name:Ljava/lang/String;

    .line 104
    const-string/jumbo v12, "first_name_gen"

    invoke-virtual {v3, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    iput-object v12, v11, Lcom/vkontakte/android/auth/VKAccount;->first_name_gen:Ljava/lang/String;

    .line 105
    const-string/jumbo v12, "last_name_gen"

    invoke-virtual {v3, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    iput-object v12, v11, Lcom/vkontakte/android/auth/VKAccount;->last_name_gen:Ljava/lang/String;

    .line 106
    const-string/jumbo v12, "verified"

    invoke-virtual {v3, v12}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v12

    const/4 v13, 0x1

    if-ne v12, v13, :cond_1

    const/4 v12, 0x1

    :goto_0
    iput-boolean v12, v11, Lcom/vkontakte/android/auth/VKAccount;->verified:Z

    .line 107
    sget v12, Lcom/vkontakte/android/Global;->displayDensity:F

    const/high16 v13, 0x3f800000    # 1.0f

    cmpl-float v12, v12, v13

    if-lez v12, :cond_2

    const-string/jumbo v12, "photo_100"

    :goto_1
    invoke-virtual {v3, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    iput-object v12, v11, Lcom/vkontakte/android/auth/VKAccount;->photo:Ljava/lang/String;

    .line 108
    const-string/jumbo v12, "status"

    invoke-virtual {v3, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    iput-object v12, v11, Lcom/vkontakte/android/auth/VKAccount;->status:Ljava/lang/String;

    .line 109
    const-string/jumbo v12, "country"

    invoke-virtual {v3, v12}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_3

    const-string/jumbo v12, "country"

    invoke-virtual {v3, v12}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v12

    const-string/jumbo v13, "id"

    invoke-virtual {v12, v13}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v12

    :goto_2
    iput v12, v11, Lcom/vkontakte/android/auth/VKAccount;->country:I

    .line 110
    const-string/jumbo v12, "sex"

    invoke-virtual {v3, v12}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v12

    const/4 v13, 0x1

    if-ne v12, v13, :cond_4

    const/4 v12, 0x1

    :goto_3
    iput-boolean v12, v11, Lcom/vkontakte/android/auth/VKAccount;->isFemale:Z

    .line 111
    const-string/jumbo v12, "intro"

    invoke-virtual {v2, v12}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v12

    iput v12, v11, Lcom/vkontakte/android/auth/VKAccount;->intro:I

    .line 112
    const-string/jumbo v12, "raise_to_record_enabled"

    const/4 v13, 0x1

    invoke-virtual {v2, v12, v13}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v12

    iput-boolean v12, v11, Lcom/vkontakte/android/auth/VKAccount;->riseToRecordAvailable:Z

    .line 113
    const-string/jumbo v12, "community_comments"

    const/4 v13, 0x0

    invoke-virtual {v2, v12, v13}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v12

    iput-boolean v12, v11, Lcom/vkontakte/android/auth/VKAccount;->communityComments:Z

    .line 114
    const-string/jumbo v12, "music_intro"

    iget-boolean v13, v11, Lcom/vkontakte/android/auth/VKAccount;->musicIntroWasShowed:Z

    invoke-virtual {v2, v12, v13}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v12

    iput-boolean v12, v11, Lcom/vkontakte/android/auth/VKAccount;->musicIntroWasShowed:Z

    .line 115
    const-string/jumbo v13, "music_intro"

    iget-boolean v12, v11, Lcom/vkontakte/android/auth/VKAccount;->musicIntroWasShowed:Z

    if-eqz v12, :cond_5

    const/4 v12, 0x1

    :goto_4
    invoke-virtual {v2, v13, v12}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v12

    if-eqz v12, :cond_6

    const/4 v12, 0x1

    :goto_5
    iput-boolean v12, v11, Lcom/vkontakte/android/auth/VKAccount;->musicIntroWasShowed:Z

    .line 117
    const-string/jumbo v12, "debug_available"

    const/4 v13, 0x0

    invoke-virtual {v2, v12, v13}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v12

    iput-boolean v12, v11, Lcom/vkontakte/android/auth/VKAccount;->debugAvailable:Z

    .line 118
    if-eqz v4, :cond_7

    const-string/jumbo v12, "twitter"

    invoke-virtual {v4, v12}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v12

    const/4 v13, 0x1

    if-ne v12, v13, :cond_7

    const/4 v12, 0x1

    :goto_6
    iput-boolean v12, v11, Lcom/vkontakte/android/auth/VKAccount;->exportTwitterAvail:Z

    .line 119
    if-eqz v4, :cond_8

    const-string/jumbo v12, "facebook"

    invoke-virtual {v4, v12}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v12

    const/4 v13, 0x1

    if-ne v12, v13, :cond_8

    const/4 v12, 0x1

    :goto_7
    iput-boolean v12, v11, Lcom/vkontakte/android/auth/VKAccount;->exportFacebookAvail:Z

    .line 120
    const-string/jumbo v12, "allow_buy_votes"

    invoke-virtual {p0, v12}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v12

    iput-boolean v12, v11, Lcom/vkontakte/android/auth/VKAccount;->allowBuyVotes:Z

    .line 121
    const-string/jumbo v12, "support_url"

    invoke-virtual {v2, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    iput-object v12, v11, Lcom/vkontakte/android/auth/VKAccount;->supportUrl:Ljava/lang/String;

    .line 122
    const-string/jumbo v12, "use_vigo"

    invoke-virtual {p0, v12}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v12

    iput-boolean v12, v11, Lcom/vkontakte/android/auth/VKAccount;->useVigo:Z

    .line 123
    const-string/jumbo v12, "html_games_supported"

    invoke-virtual {p0, v12}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v12

    const/4 v13, 0x1

    if-ne v12, v13, :cond_9

    const/4 v12, 0x1

    :goto_8
    iput-boolean v12, v11, Lcom/vkontakte/android/auth/VKAccount;->htmlGamesEnabled:Z

    .line 126
    const/4 v12, 0x0

    iput-boolean v12, v11, Lcom/vkontakte/android/auth/VKAccount;->useWebAppForReportContent:Z

    .line 128
    const-string/jumbo v12, "vigo_connect_timeout"

    const/16 v13, 0x3e8

    invoke-virtual {p0, v12, v13}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v12

    iput v12, v11, Lcom/vkontakte/android/auth/VKAccount;->vigoConnectTimeout:I

    .line 129
    const-string/jumbo v12, "vigo_read_timeout"

    const/16 v13, 0x3e8

    invoke-virtual {p0, v12, v13}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v12

    iput v12, v11, Lcom/vkontakte/android/auth/VKAccount;->vigoReadTimeout:I

    .line 131
    const-string/jumbo v12, "settings"

    invoke-virtual {v2, v12}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v7

    .line 132
    .local v7, "settings":Lorg/json/JSONArray;
    if-eqz v7, :cond_b

    .line 133
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_9
    invoke-virtual {v7}, Lorg/json/JSONArray;->length()I

    move-result v12

    if-ge v1, v12, :cond_b

    .line 134
    invoke-virtual {v7, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    .line 135
    .local v6, "setting":Lorg/json/JSONObject;
    const-string/jumbo v12, "name"

    invoke-virtual {v6, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    const/4 v12, -0x1

    invoke-virtual {v13}, Ljava/lang/String;->hashCode()I

    move-result v14

    sparse-switch v14, :sswitch_data_0

    :cond_0
    :goto_a
    packed-switch v12, :pswitch_data_0

    .line 133
    :goto_b
    add-int/lit8 v1, v1, 0x1

    goto :goto_9

    .line 106
    .end local v1    # "i":I
    .end local v6    # "setting":Lorg/json/JSONObject;
    .end local v7    # "settings":Lorg/json/JSONArray;
    :cond_1
    const/4 v12, 0x0

    goto/16 :goto_0

    .line 107
    :cond_2
    const-string/jumbo v12, "photo_50"

    goto/16 :goto_1

    .line 109
    :cond_3
    const/4 v12, 0x0

    goto/16 :goto_2

    .line 110
    :cond_4
    const/4 v12, 0x0

    goto/16 :goto_3

    .line 115
    :cond_5
    const/4 v12, 0x0

    goto/16 :goto_4

    :cond_6
    const/4 v12, 0x0

    goto/16 :goto_5

    .line 118
    :cond_7
    const/4 v12, 0x0

    goto/16 :goto_6

    .line 119
    :cond_8
    const/4 v12, 0x0

    goto/16 :goto_7

    .line 123
    :cond_9
    const/4 v12, 0x0

    goto :goto_8

    .line 135
    .restart local v1    # "i":I
    .restart local v6    # "setting":Lorg/json/JSONObject;
    .restart local v7    # "settings":Lorg/json/JSONArray;
    :sswitch_0
    const-string/jumbo v14, "gif_autoplay"

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_0

    const/4 v12, 0x0

    goto :goto_a

    :sswitch_1
    const-string/jumbo v14, "video_autoplay"

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_0

    const/4 v12, 0x1

    goto :goto_a

    :sswitch_2
    const-string/jumbo v14, "money_p2p"

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_0

    const/4 v12, 0x2

    goto :goto_a

    :sswitch_3
    const-string/jumbo v14, "money_clubs_p2p"

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_0

    const/4 v12, 0x3

    goto :goto_a

    :sswitch_4
    const-string/jumbo v14, "stories"

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_0

    const/4 v12, 0x4

    goto :goto_a

    :sswitch_5
    const-string/jumbo v14, "masks"

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_0

    const/4 v12, 0x5

    goto :goto_a

    :sswitch_6
    const-string/jumbo v14, "audio_ads"

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_0

    const/4 v12, 0x6

    goto :goto_a

    :sswitch_7
    const-string/jumbo v14, "vklive_app"

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_0

    const/4 v12, 0x7

    goto :goto_a

    :sswitch_8
    const-string/jumbo v14, "audio_restrictions"

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_0

    const/16 v12, 0x8

    goto/16 :goto_a

    :sswitch_9
    const-string/jumbo v14, "audio_background_limit"

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_0

    const/16 v12, 0x9

    goto/16 :goto_a

    .line 137
    :pswitch_0
    const-string/jumbo v12, "available"

    iget-boolean v13, v11, Lcom/vkontakte/android/auth/VKAccount;->gifAutoPlayAvailable:Z

    invoke-virtual {v6, v12, v13}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v12

    iput-boolean v12, v11, Lcom/vkontakte/android/auth/VKAccount;->gifAutoPlayAvailable:Z

    goto/16 :goto_b

    .line 140
    :pswitch_1
    const-string/jumbo v12, "available"

    iget-boolean v13, v11, Lcom/vkontakte/android/auth/VKAccount;->videoAutoPlayAvailable:Z

    invoke-virtual {v6, v12, v13}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v12

    iput-boolean v12, v11, Lcom/vkontakte/android/auth/VKAccount;->videoAutoPlayAvailable:Z

    goto/16 :goto_b

    .line 143
    :pswitch_2
    const-string/jumbo v12, "available"

    const/4 v13, 0x0

    invoke-virtual {v6, v12, v13}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v12

    iput-boolean v12, v11, Lcom/vkontakte/android/auth/VKAccount;->moneyTransfersAvailable:Z

    .line 144
    const-string/jumbo v12, "value"

    const-string/jumbo v13, ""

    invoke-virtual {v6, v12, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    const-string/jumbo v13, "can_send"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    iput-boolean v12, v11, Lcom/vkontakte/android/auth/VKAccount;->moneyTransfersCanSend:Z

    goto/16 :goto_b

    .line 147
    :pswitch_3
    const-string/jumbo v12, "available"

    const/4 v13, 0x0

    invoke-virtual {v6, v12, v13}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v12

    iput-boolean v12, v11, Lcom/vkontakte/android/auth/VKAccount;->moneyTransfersCanSendToCommunities:Z

    goto/16 :goto_b

    .line 150
    :pswitch_4
    const-string/jumbo v12, "available"

    const/4 v13, 0x0

    invoke-virtual {v6, v12, v13}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v12

    iput-boolean v12, v11, Lcom/vkontakte/android/auth/VKAccount;->storiesAvailable:Z

    goto/16 :goto_b

    .line 153
    :pswitch_5
    const-string/jumbo v12, "available"

    const/4 v13, 0x0

    invoke-virtual {v6, v12, v13}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v12

    iput-boolean v12, v11, Lcom/vkontakte/android/auth/VKAccount;->masksAvailable:Z

    goto/16 :goto_b

    .line 156
    :pswitch_6
    const-string/jumbo v12, "available"

    const/4 v13, 0x0

    invoke-virtual {v6, v12, v13}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v12

    iput-boolean v12, v11, Lcom/vkontakte/android/auth/VKAccount;->audioAdAvailable:Z

    goto/16 :goto_b

    .line 159
    :pswitch_7
    const-string/jumbo v12, "available"

    const/4 v13, 0x0

    invoke-virtual {v6, v12, v13}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v12

    iput-boolean v12, v11, Lcom/vkontakte/android/auth/VKAccount;->vkLiveStreamAvailable:Z

    goto/16 :goto_b

    .line 162
    :pswitch_8
    const-string/jumbo v12, "available"

    const/4 v13, 0x0

    invoke-virtual {v6, v12, v13}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v12

    iput-boolean v12, v11, Lcom/vkontakte/android/auth/VKAccount;->isMusicRestricted:Z

    goto/16 :goto_b

    .line 165
    :pswitch_9
    const-string/jumbo v12, "available"

    const/4 v13, 0x0

    invoke-virtual {v6, v12, v13}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v12

    if-eqz v12, :cond_a

    .line 166
    const-string/jumbo v12, "value"

    const/4 v13, 0x0

    invoke-virtual {v6, v12, v13}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v12

    iput v12, v11, Lcom/vkontakte/android/auth/VKAccount;->audioBackgroundLimit:I

    goto/16 :goto_b

    .line 168
    :cond_a
    const/4 v12, -0x1

    iput v12, v11, Lcom/vkontakte/android/auth/VKAccount;->audioBackgroundLimit:I

    goto/16 :goto_b

    .line 174
    .end local v1    # "i":I
    .end local v6    # "setting":Lorg/json/JSONObject;
    :cond_b
    const-string/jumbo v12, "audio_ads"

    invoke-virtual {v2, v12}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 175
    .local v0, "audio_ads":Lorg/json/JSONObject;
    if-eqz v0, :cond_c

    .line 176
    new-instance v12, Lcom/vkontakte/android/auth/configs/AudioAdConfig;

    invoke-direct {v12, v0}, Lcom/vkontakte/android/auth/configs/AudioAdConfig;-><init>(Lorg/json/JSONObject;)V

    iput-object v12, v11, Lcom/vkontakte/android/auth/VKAccount;->audioAdConfig:Lcom/vkontakte/android/auth/configs/AudioAdConfig;

    .line 178
    :cond_c
    const-string/jumbo v12, "video_player"

    invoke-virtual {v2, v12}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v10

    .line 179
    .local v10, "video_config":Lorg/json/JSONObject;
    if-eqz v10, :cond_d

    .line 180
    new-instance v12, Lcom/vkontakte/android/auth/configs/VideoConfig;

    invoke-direct {v12, v10}, Lcom/vkontakte/android/auth/configs/VideoConfig;-><init>(Lorg/json/JSONObject;)V

    iput-object v12, v11, Lcom/vkontakte/android/auth/VKAccount;->videoConfig:Lcom/vkontakte/android/auth/configs/VideoConfig;

    .line 182
    :cond_d
    const-string/jumbo v12, "defaultAudioPlayer"

    iget-object v13, v11, Lcom/vkontakte/android/auth/VKAccount;->defaultAudioPlayer:Ljava/lang/String;

    invoke-virtual {p0, v12, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    iput-object v12, v11, Lcom/vkontakte/android/auth/VKAccount;->defaultAudioPlayer:Ljava/lang/String;

    .line 184
    const-string/jumbo v12, "subscriptions"

    invoke-virtual {v2, v12}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v8

    .line 185
    .local v8, "subscriptions":Lorg/json/JSONArray;
    if-eqz v8, :cond_e

    .line 186
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_c
    invoke-virtual {v8}, Lorg/json/JSONArray;->length()I

    move-result v12

    if-ge v1, v12, :cond_e

    .line 187
    invoke-virtual {v8, v1}, Lorg/json/JSONArray;->getInt(I)I

    move-result v12

    const/4 v13, 0x1

    if-ne v12, v13, :cond_11

    .line 188
    const/4 v12, 0x1

    iput-boolean v12, v11, Lcom/vkontakte/android/auth/VKAccount;->hasMusicSubscription:Z

    .line 194
    .end local v1    # "i":I
    :cond_e
    const-string/jumbo v12, "profiler_settings"

    invoke-virtual {v2, v12}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    .line 195
    .local v5, "profilerConfig":Lorg/json/JSONObject;
    if-eqz v5, :cond_f

    .line 196
    new-instance v12, Lcom/vkontakte/android/auth/configs/ProfilerConfig;

    invoke-direct {v12, v5}, Lcom/vkontakte/android/auth/configs/ProfilerConfig;-><init>(Lorg/json/JSONObject;)V

    iput-object v12, v11, Lcom/vkontakte/android/auth/VKAccount;->profilerConfig:Lcom/vkontakte/android/auth/configs/ProfilerConfig;

    .line 199
    :cond_f
    const-string/jumbo v12, "money_p2p_params"

    invoke-virtual {v2, v12}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v9

    .line 200
    .local v9, "transfersParams":Lorg/json/JSONObject;
    if-eqz v9, :cond_10

    .line 201
    const-string/jumbo v12, "min_amount"

    const/4 v13, 0x0

    invoke-virtual {v9, v12, v13}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v12

    iput v12, v11, Lcom/vkontakte/android/auth/VKAccount;->moneyTransfersMinAmount:I

    .line 202
    const-string/jumbo v12, "max_amount"

    const/4 v13, 0x0

    invoke-virtual {v9, v12, v13}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v12

    iput v12, v11, Lcom/vkontakte/android/auth/VKAccount;->moneyTransfersMaxAmount:I

    .line 203
    const-string/jumbo v12, "currency"

    invoke-virtual {v9, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    iput-object v12, v11, Lcom/vkontakte/android/auth/VKAccount;->monetTransfersCurrency:Ljava/lang/String;

    .line 206
    :cond_10
    return-object v11

    .line 186
    .end local v5    # "profilerConfig":Lorg/json/JSONObject;
    .end local v9    # "transfersParams":Lorg/json/JSONObject;
    .restart local v1    # "i":I
    :cond_11
    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    .line 135
    nop

    :sswitch_data_0
    .sparse-switch
        -0x704f9fad -> :sswitch_4
        -0x661d6511 -> :sswitch_2
        -0x3d418e93 -> :sswitch_3
        -0x2542e882 -> :sswitch_0
        -0x190671fd -> :sswitch_7
        -0x95d0f59 -> :sswitch_1
        0x62dd707 -> :sswitch_5
        0xb3c68c7 -> :sswitch_6
        0x34db16b3 -> :sswitch_9
        0x7e3a9ff0 -> :sswitch_8
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
    .end packed-switch
.end method

.method static removeSystemAccountIfExist()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 48
    :try_start_0
    sget-object v3, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v3}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v1

    .line 49
    .local v1, "am":Landroid/accounts/AccountManager;
    const-string/jumbo v3, "com.vkontakte.account"

    invoke-virtual {v1, v3}, Landroid/accounts/AccountManager;->getAccountsByType(Ljava/lang/String;)[Landroid/accounts/Account;

    move-result-object v0

    .line 50
    .local v0, "acc":[Landroid/accounts/Account;
    array-length v3, v0

    if-lez v3, :cond_0

    .line 51
    const/4 v3, 0x0

    aget-object v3, v0, v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual {v1, v3, v4, v5}, Landroid/accounts/AccountManager;->removeAccount(Landroid/accounts/Account;Landroid/accounts/AccountManagerCallback;Landroid/os/Handler;)Landroid/accounts/AccountManagerFuture;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 56
    .end local v0    # "acc":[Landroid/accounts/Account;
    :cond_0
    :goto_0
    return-void

    .line 53
    :catch_0
    move-exception v2

    .line 54
    .local v2, "x":Ljava/lang/Exception;
    new-array v3, v6, [Ljava/lang/Object;

    invoke-static {v2, v3}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method static saveAccountToSharedPreferences(Landroid/content/SharedPreferences;Lcom/vkontakte/android/auth/VKAccount;)V
    .locals 7
    .param p0, "prefs"    # Landroid/content/SharedPreferences;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "account"    # Lcom/vkontakte/android/auth/VKAccount;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 268
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string/jumbo v5, "uid"

    iget v6, p1, Lcom/vkontakte/android/auth/VKAccount;->uid:I

    .line 269
    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string/jumbo v5, "sid"

    iget-object v6, p1, Lcom/vkontakte/android/auth/VKAccount;->accessToken:Ljava/lang/String;

    .line 270
    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string/jumbo v5, "secret"

    iget-object v6, p1, Lcom/vkontakte/android/auth/VKAccount;->secret:Ljava/lang/String;

    .line 271
    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string/jumbo v5, "username"

    iget-object v6, p1, Lcom/vkontakte/android/auth/VKAccount;->name:Ljava/lang/String;

    .line 272
    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string/jumbo v5, "first_name_gen"

    iget-object v6, p1, Lcom/vkontakte/android/auth/VKAccount;->first_name_gen:Ljava/lang/String;

    .line 273
    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string/jumbo v5, "last_name_gen"

    iget-object v6, p1, Lcom/vkontakte/android/auth/VKAccount;->last_name_gen:Ljava/lang/String;

    .line 274
    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string/jumbo v5, "verified"

    iget-boolean v6, p1, Lcom/vkontakte/android/auth/VKAccount;->verified:Z

    .line 275
    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string/jumbo v5, "userphoto"

    iget-object v6, p1, Lcom/vkontakte/android/auth/VKAccount;->photo:Ljava/lang/String;

    .line 276
    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string/jumbo v5, "userstatus"

    iget-object v6, p1, Lcom/vkontakte/android/auth/VKAccount;->status:Ljava/lang/String;

    .line 277
    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string/jumbo v5, "usercountry"

    iget v6, p1, Lcom/vkontakte/android/auth/VKAccount;->country:I

    .line 278
    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string/jumbo v5, "usersex"

    iget-boolean v6, p1, Lcom/vkontakte/android/auth/VKAccount;->isFemale:Z

    .line 279
    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string/jumbo v5, "intro"

    iget v6, p1, Lcom/vkontakte/android/auth/VKAccount;->intro:I

    .line 280
    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string/jumbo v5, "export_twitter_avail"

    iget-boolean v6, p1, Lcom/vkontakte/android/auth/VKAccount;->exportTwitterAvail:Z

    .line 281
    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string/jumbo v5, "export_facebook_avail"

    iget-boolean v6, p1, Lcom/vkontakte/android/auth/VKAccount;->exportFacebookAvail:Z

    .line 282
    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string/jumbo v5, "allow_buy_votes"

    iget-boolean v6, p1, Lcom/vkontakte/android/auth/VKAccount;->allowBuyVotes:Z

    .line 283
    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string/jumbo v5, "support_url"

    iget-object v6, p1, Lcom/vkontakte/android/auth/VKAccount;->supportUrl:Ljava/lang/String;

    .line 284
    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string/jumbo v5, "use_vigo"

    iget-boolean v6, p1, Lcom/vkontakte/android/auth/VKAccount;->useVigo:Z

    .line 285
    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string/jumbo v5, "vigo_connect_timeout"

    iget v6, p1, Lcom/vkontakte/android/auth/VKAccount;->vigoConnectTimeout:I

    .line 286
    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string/jumbo v5, "vigo_read_timeout"

    iget v6, p1, Lcom/vkontakte/android/auth/VKAccount;->vigoReadTimeout:I

    .line 287
    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string/jumbo v5, "money_transfers_available"

    iget-boolean v6, p1, Lcom/vkontakte/android/auth/VKAccount;->moneyTransfersAvailable:Z

    .line 288
    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string/jumbo v5, "money_transfers_can_send"

    iget-boolean v6, p1, Lcom/vkontakte/android/auth/VKAccount;->moneyTransfersCanSend:Z

    .line 289
    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string/jumbo v5, "money_transfers_currency"

    iget-object v6, p1, Lcom/vkontakte/android/auth/VKAccount;->monetTransfersCurrency:Ljava/lang/String;

    .line 290
    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string/jumbo v5, "money_transfers_can_send_to_communities"

    iget-boolean v6, p1, Lcom/vkontakte/android/auth/VKAccount;->moneyTransfersCanSendToCommunities:Z

    .line 291
    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string/jumbo v5, "money_transfers_max_amount"

    iget v6, p1, Lcom/vkontakte/android/auth/VKAccount;->moneyTransfersMaxAmount:I

    .line 292
    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string/jumbo v5, "money_transfers_min_amount"

    iget v6, p1, Lcom/vkontakte/android/auth/VKAccount;->moneyTransfersMinAmount:I

    .line 293
    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string/jumbo v5, "gif_autoplay_available"

    iget-boolean v6, p1, Lcom/vkontakte/android/auth/VKAccount;->gifAutoPlayAvailable:Z

    .line 294
    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string/jumbo v5, "video_autoplay_available"

    iget-boolean v6, p1, Lcom/vkontakte/android/auth/VKAccount;->videoAutoPlayAvailable:Z

    .line 295
    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string/jumbo v5, "default_audio_player"

    iget-object v6, p1, Lcom/vkontakte/android/auth/VKAccount;->defaultAudioPlayer:Ljava/lang/String;

    .line 296
    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string/jumbo v5, "stories_available"

    iget-boolean v6, p1, Lcom/vkontakte/android/auth/VKAccount;->storiesAvailable:Z

    .line 297
    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string/jumbo v5, "masks_available"

    iget-boolean v6, p1, Lcom/vkontakte/android/auth/VKAccount;->masksAvailable:Z

    .line 298
    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string/jumbo v5, "audio_ad_available"

    iget-boolean v6, p1, Lcom/vkontakte/android/auth/VKAccount;->audioAdAvailable:Z

    .line 299
    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string/jumbo v5, "raise_to_record_enabled"

    iget-boolean v6, p1, Lcom/vkontakte/android/auth/VKAccount;->riseToRecordAvailable:Z

    .line 300
    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string/jumbo v5, "vklive_app"

    iget-boolean v6, p1, Lcom/vkontakte/android/auth/VKAccount;->vkLiveStreamAvailable:Z

    .line 301
    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string/jumbo v5, "debug_available"

    iget-boolean v6, p1, Lcom/vkontakte/android/auth/VKAccount;->debugAvailable:Z

    .line 302
    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string/jumbo v5, "has_music_subscription"

    iget-boolean v6, p1, Lcom/vkontakte/android/auth/VKAccount;->hasMusicSubscription:Z

    .line 303
    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string/jumbo v5, "is_music_restricted"

    iget-boolean v6, p1, Lcom/vkontakte/android/auth/VKAccount;->isMusicRestricted:Z

    .line 304
    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string/jumbo v5, "music_intro"

    iget-boolean v6, p1, Lcom/vkontakte/android/auth/VKAccount;->musicIntroWasShowed:Z

    .line 305
    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string/jumbo v5, "audio_background_limit"

    iget v6, p1, Lcom/vkontakte/android/auth/VKAccount;->audioBackgroundLimit:I

    .line 306
    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string/jumbo v5, "html_games_enabled"

    iget-boolean v6, p1, Lcom/vkontakte/android/auth/VKAccount;->htmlGamesEnabled:Z

    .line 307
    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string/jumbo v5, "community_comments"

    iget-boolean v6, p1, Lcom/vkontakte/android/auth/VKAccount;->communityComments:Z

    .line 308
    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string/jumbo v5, "use_web_app_for_report_content"

    iget-boolean v6, p1, Lcom/vkontakte/android/auth/VKAccount;->useWebAppForReportContent:Z

    .line 309
    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 312
    .local v1, "editor":Landroid/content/SharedPreferences$Editor;
    iget-object v4, p1, Lcom/vkontakte/android/auth/VKAccount;->audioAdConfig:Lcom/vkontakte/android/auth/configs/AudioAdConfig;

    if-eqz v4, :cond_0

    iget-object v4, p1, Lcom/vkontakte/android/auth/VKAccount;->audioAdConfig:Lcom/vkontakte/android/auth/configs/AudioAdConfig;

    .line 313
    invoke-virtual {v4}, Lcom/vkontakte/android/auth/configs/AudioAdConfig;->toJSONString()Ljava/lang/String;

    move-result-object v0

    .line 312
    .local v0, "audioAdsConfigStr":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 314
    const-string/jumbo v4, "audio_ad_config"

    invoke-interface {v1, v4, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 318
    .end local v0    # "audioAdsConfigStr":Ljava/lang/String;
    :cond_0
    iget-object v4, p1, Lcom/vkontakte/android/auth/VKAccount;->profilerConfig:Lcom/vkontakte/android/auth/configs/ProfilerConfig;

    if-eqz v4, :cond_1

    iget-object v4, p1, Lcom/vkontakte/android/auth/VKAccount;->profilerConfig:Lcom/vkontakte/android/auth/configs/ProfilerConfig;

    .line 319
    invoke-virtual {v4}, Lcom/vkontakte/android/auth/configs/ProfilerConfig;->toJSONString()Ljava/lang/String;

    move-result-object v2

    .line 318
    .local v2, "profilerConfigStr":Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 320
    const-string/jumbo v4, "profiler_config"

    invoke-interface {v1, v4, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 324
    .end local v2    # "profilerConfigStr":Ljava/lang/String;
    :cond_1
    iget-object v4, p1, Lcom/vkontakte/android/auth/VKAccount;->videoConfig:Lcom/vkontakte/android/auth/configs/VideoConfig;

    if-eqz v4, :cond_2

    iget-object v4, p1, Lcom/vkontakte/android/auth/VKAccount;->videoConfig:Lcom/vkontakte/android/auth/configs/VideoConfig;

    .line 325
    invoke-virtual {v4}, Lcom/vkontakte/android/auth/configs/VideoConfig;->toJSONString()Ljava/lang/String;

    move-result-object v3

    .line 324
    .local v3, "videoConfigStr":Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 326
    const-string/jumbo v4, "video_player"

    invoke-interface {v1, v4, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 328
    .end local v3    # "videoConfigStr":Ljava/lang/String;
    :cond_2
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 329
    return-void
.end method

.method static sleep(J)V
    .locals 2
    .param p0, "time"    # J

    .prologue
    .line 29
    :try_start_0
    invoke-static {p0, p1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 33
    :goto_0
    return-void

    .line 30
    :catch_0
    move-exception v0

    .line 31
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method static updateAccessToken(Lcom/vkontakte/android/auth/VKAccount;Ljava/lang/String;)V
    .locals 0
    .param p0, "account"    # Lcom/vkontakte/android/auth/VKAccount;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "accessToken"    # Ljava/lang/String;

    .prologue
    .line 210
    iput-object p1, p0, Lcom/vkontakte/android/auth/VKAccount;->accessToken:Ljava/lang/String;

    .line 211
    return-void
.end method

.method static updateAccount(Lcom/vkontakte/android/auth/VKAccount;Lcom/vkontakte/android/api/execute/GetWallInfo$Result;)V
    .locals 1
    .param p0, "account"    # Lcom/vkontakte/android/auth/VKAccount;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "result"    # Lcom/vkontakte/android/api/execute/GetWallInfo$Result;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 218
    iget-object v0, p1, Lcom/vkontakte/android/api/execute/GetWallInfo$Result;->vkAccount:Lcom/vkontakte/android/auth/VKAccount;

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/auth/VKAccount;->fillUserData(Lcom/vkontakte/android/auth/VKAccount;)V

    .line 219
    return-void
.end method

.method static updateSecret(Lcom/vkontakte/android/auth/VKAccount;Ljava/lang/String;)V
    .locals 0
    .param p0, "account"    # Lcom/vkontakte/android/auth/VKAccount;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "secret"    # Ljava/lang/String;

    .prologue
    .line 214
    iput-object p1, p0, Lcom/vkontakte/android/auth/VKAccount;->secret:Ljava/lang/String;

    .line 215
    return-void
.end method
