.class public Lcom/vkontakte/android/fragments/SettingsGeneralFragment;
.super Lcom/vkontakte/android/fragments/MaterialPreferenceToolbarFragment;
.source "SettingsGeneralFragment.java"


# instance fields
.field currentStorageType:Lcom/vkontakte/android/audio/AudioFacade$StorageType;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 43
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/MaterialPreferenceToolbarFragment;-><init>()V

    .line 45
    sget-object v0, Lcom/vkontakte/android/audio/AudioFacade$StorageType;->internal:Lcom/vkontakte/android/audio/AudioFacade$StorageType;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment;->currentStorageType:Lcom/vkontakte/android/audio/AudioFacade$StorageType;

    return-void
.end method

.method static synthetic access$000(Landroid/content/Context;)V
    .locals 0
    .param p0, "x0"    # Landroid/content/Context;

    .prologue
    .line 43
    invoke-static {p0}, Lcom/vkontakte/android/fragments/SettingsGeneralFragment;->downloadAudio(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/SettingsGeneralFragment;Lcom/vkontakte/android/audio/AudioFacade$StorageType;Lcom/vkontakte/android/audio/AudioFacade$StorageType;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/SettingsGeneralFragment;
    .param p1, "x1"    # Lcom/vkontakte/android/audio/AudioFacade$StorageType;
    .param p2, "x2"    # Lcom/vkontakte/android/audio/AudioFacade$StorageType;

    .prologue
    .line 43
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/fragments/SettingsGeneralFragment;->moveAudioCache(Lcom/vkontakte/android/audio/AudioFacade$StorageType;Lcom/vkontakte/android/audio/AudioFacade$StorageType;)V

    return-void
.end method

.method private static downloadAudio(Landroid/content/Context;)V
    .locals 2
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 325
    new-instance v0, Lcom/vkontakte/android/api/audio/AudioGet;

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/api/audio/AudioGet;-><init>(I)V

    new-instance v1, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$10;

    invoke-direct {v1, p0, p0}, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$10;-><init>(Landroid/content/Context;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/audio/AudioGet;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 352
    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 353
    return-void
.end method

.method private moveAudioCache(Lcom/vkontakte/android/audio/AudioFacade$StorageType;Lcom/vkontakte/android/audio/AudioFacade$StorageType;)V
    .locals 7
    .param p1, "from"    # Lcom/vkontakte/android/audio/AudioFacade$StorageType;
    .param p2, "dest"    # Lcom/vkontakte/android/audio/AudioFacade$StorageType;

    .prologue
    .line 266
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->stop()V

    .line 267
    new-instance v5, Landroid/app/ProgressDialog;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsGeneralFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-direct {v5, v0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    .line 268
    .local v5, "pdlg":Landroid/app/ProgressDialog;
    const/4 v0, 0x1

    invoke-virtual {v5, v0}, Landroid/app/ProgressDialog;->setProgressStyle(I)V

    .line 269
    const v0, 0x7f080393

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/SettingsGeneralFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 270
    const/4 v0, 0x0

    invoke-virtual {v5, v0}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 271
    invoke-virtual {v5}, Landroid/app/ProgressDialog;->show()V

    .line 272
    new-instance v4, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$8;

    invoke-direct {v4, p0, v5}, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$8;-><init>(Lcom/vkontakte/android/fragments/SettingsGeneralFragment;Landroid/app/ProgressDialog;)V

    .line 298
    .local v4, "pc":Lcom/vkontakte/android/ProgressCallback;
    new-instance v6, Ljava/lang/Thread;

    new-instance v0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$9;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$9;-><init>(Lcom/vkontakte/android/fragments/SettingsGeneralFragment;Lcom/vkontakte/android/audio/AudioFacade$StorageType;Lcom/vkontakte/android/audio/AudioFacade$StorageType;Lcom/vkontakte/android/ProgressCallback;Landroid/app/ProgressDialog;)V

    invoke-direct {v6, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 321
    invoke-virtual {v6}, Ljava/lang/Thread;->start()V

    .line 322
    return-void
.end method


# virtual methods
.method protected getTitleRes()I
    .locals 1

    .prologue
    .line 262
    const v0, 0x7f080628

    return v0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 19
    .param p1, "b"    # Landroid/os/Bundle;

    .prologue
    .line 48
    invoke-super/range {p0 .. p1}, Lcom/vkontakte/android/fragments/MaterialPreferenceToolbarFragment;->onCreate(Landroid/os/Bundle;)V

    .line 50
    const v17, 0x7f060007

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/SettingsGeneralFragment;->addPreferencesFromResource(I)V

    .line 53
    const-string/jumbo v17, "mytrackerLocationCrapEnabled"

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/SettingsGeneralFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v13

    check-cast v13, Landroid/support/v14/preference/SwitchPreference;

    .line 54
    .local v13, "switchPreference":Landroid/support/v14/preference/SwitchPreference;
    new-instance v17, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$1;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$1;-><init>(Lcom/vkontakte/android/fragments/SettingsGeneralFragment;)V

    move-object/from16 v0, v17

    invoke-virtual {v13, v0}, Landroid/support/v14/preference/SwitchPreference;->setOnPreferenceChangeListener(Landroid/support/v7/preference/Preference$OnPreferenceChangeListener;)V

    .line 68
    const-string/jumbo v17, "useProxyServer"

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/SettingsGeneralFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v15

    check-cast v15, Landroid/support/v14/preference/SwitchPreference;

    .line 69
    .local v15, "useProxyServer":Landroid/support/v14/preference/SwitchPreference;
    invoke-static {}, Lcom/vk/core/network/Network;->getInstance()Lcom/vk/core/network/Network;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Lcom/vk/core/network/Network;->proxy()Lcom/vk/core/network/NetworkProxy;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Lcom/vk/core/network/NetworkProxy;->canUseProxy()Z

    move-result v17

    if-eqz v17, :cond_4

    .line 70
    invoke-static {}, Lcom/vk/core/network/Network;->getInstance()Lcom/vk/core/network/Network;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Lcom/vk/core/network/Network;->proxy()Lcom/vk/core/network/NetworkProxy;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Lcom/vk/core/network/NetworkProxy;->isEnable()Z

    move-result v17

    move/from16 v0, v17

    invoke-virtual {v15, v0}, Landroid/support/v14/preference/SwitchPreference;->setChecked(Z)V

    .line 71
    new-instance v17, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$2;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v15}, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$2;-><init>(Lcom/vkontakte/android/fragments/SettingsGeneralFragment;Landroid/support/v14/preference/SwitchPreference;)V

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Landroid/support/v14/preference/SwitchPreference;->setOnPreferenceChangeListener(Landroid/support/v7/preference/Preference$OnPreferenceChangeListener;)V

    .line 115
    :goto_0
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/SettingsGeneralFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v17

    move-object/from16 v0, v17

    iget v0, v0, Landroid/content/res/Configuration;->keyboard:I

    move/from16 v17, v0

    const/16 v18, 0x2

    move/from16 v0, v17

    move/from16 v1, v18

    if-eq v0, v1, :cond_0

    .line 116
    const-string/jumbo v17, "sendByEnter"

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/SettingsGeneralFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v9

    .line 117
    .local v9, "pref":Landroid/support/v7/preference/Preference;
    const-string/jumbo v17, "app"

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/SettingsGeneralFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v17

    check-cast v17, Landroid/support/v7/preference/PreferenceCategory;

    move-object/from16 v0, v17

    invoke-virtual {v0, v9}, Landroid/support/v7/preference/PreferenceCategory;->removePreference(Landroid/support/v7/preference/Preference;)Z

    .line 120
    .end local v9    # "pref":Landroid/support/v7/preference/Preference;
    :cond_0
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Lcom/vkontakte/android/auth/VKAccount;->isGifAutoPlayAvailable()Z

    move-result v17

    if-nez v17, :cond_1

    .line 121
    const-string/jumbo v17, "gif_autoplay"

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/SettingsGeneralFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v9

    .line 122
    .restart local v9    # "pref":Landroid/support/v7/preference/Preference;
    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-virtual {v9, v0}, Landroid/support/v7/preference/Preference;->setVisible(Z)V

    .line 125
    .end local v9    # "pref":Landroid/support/v7/preference/Preference;
    :cond_1
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Lcom/vkontakte/android/auth/VKAccount;->isVideoAutoPlayAvailable()Z

    move-result v17

    if-nez v17, :cond_2

    .line 126
    const-string/jumbo v17, "video_autoplay"

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/SettingsGeneralFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v9

    .line 127
    .restart local v9    # "pref":Landroid/support/v7/preference/Preference;
    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-virtual {v9, v0}, Landroid/support/v7/preference/Preference;->setVisible(Z)V

    .line 130
    .end local v9    # "pref":Landroid/support/v7/preference/Preference;
    :cond_2
    const-string/jumbo v17, "clearImageCache"

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/SettingsGeneralFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v9

    .line 131
    .restart local v9    # "pref":Landroid/support/v7/preference/Preference;
    new-instance v17, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$3;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$3;-><init>(Lcom/vkontakte/android/fragments/SettingsGeneralFragment;)V

    move-object/from16 v0, v17

    invoke-virtual {v9, v0}, Landroid/support/v7/preference/Preference;->setOnPreferenceClickListener(Landroid/support/v7/preference/Preference$OnPreferenceClickListener;)V

    .line 148
    const-string/jumbo v17, "clearMessagesCache"

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/SettingsGeneralFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v9

    .line 149
    new-instance v17, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$4;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$4;-><init>(Lcom/vkontakte/android/fragments/SettingsGeneralFragment;)V

    move-object/from16 v0, v17

    invoke-virtual {v9, v0}, Landroid/support/v7/preference/Preference;->setOnPreferenceClickListener(Landroid/support/v7/preference/Preference$OnPreferenceClickListener;)V

    .line 168
    const-string/jumbo v17, "downloadAudio"

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/SettingsGeneralFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v9

    .line 169
    new-instance v17, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$5;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$5;-><init>(Lcom/vkontakte/android/fragments/SettingsGeneralFragment;)V

    move-object/from16 v0, v17

    invoke-virtual {v9, v0}, Landroid/support/v7/preference/Preference;->setOnPreferenceClickListener(Landroid/support/v7/preference/Preference$OnPreferenceClickListener;)V

    .line 177
    const-string/jumbo v17, "clearAudioCache"

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/SettingsGeneralFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v9

    .line 178
    new-instance v17, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$6;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$6;-><init>(Lcom/vkontakte/android/fragments/SettingsGeneralFragment;)V

    move-object/from16 v0, v17

    invoke-virtual {v9, v0}, Landroid/support/v7/preference/Preference;->setOnPreferenceClickListener(Landroid/support/v7/preference/Preference$OnPreferenceClickListener;)V

    .line 207
    const-string/jumbo v17, "audioCacheLocation"

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/SettingsGeneralFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v7

    check-cast v7, Landroid/support/v7/preference/ListPreference;

    .line 209
    .local v7, "memoryStorage":Landroid/support/v7/preference/ListPreference;
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 210
    .local v10, "storagePaths":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 211
    .local v11, "storageTitles":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v12, Ljava/util/HashSet;

    invoke-direct {v12}, Ljava/util/HashSet;-><init>()V

    .line 212
    .local v12, "storageTitlesSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    sget-object v17, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static/range {v17 .. v17}, Lcom/vkontakte/android/audio/player/SavedTracks;->getDownloadDirectories(Landroid/content/Context;)Ljava/util/List;

    move-result-object v17

    invoke-interface/range {v17 .. v17}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v18

    :cond_3
    :goto_1
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_6

    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/io/File;

    .line 213
    .local v2, "f":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->canWrite()Z

    move-result v17

    if-eqz v17, :cond_3

    .line 217
    :try_start_0
    invoke-static {v2}, Lcom/vkontakte/android/audio/utils/Utils;->isSdCardPath(Ljava/io/File;)Z

    move-result v3

    .line 218
    .local v3, "isSd":Z
    if-eqz v3, :cond_5

    const v17, 0x7f080215

    :goto_2
    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/SettingsGeneralFragment;->getString(I)Ljava/lang/String;

    move-result-object v14

    .line 219
    .local v14, "title":Ljava/lang/String;
    invoke-virtual {v11, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 220
    invoke-interface {v12, v14}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 221
    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Lcom/vkontakte/android/audio/AudioFacade$StorageType;->parseFromPreferences(Ljava/lang/String;)Lcom/vkontakte/android/audio/AudioFacade$StorageType;

    move-result-object v17

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/audio/AudioFacade$StorageType;->nameForPreference:Ljava/lang/String;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v10, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 222
    .end local v3    # "isSd":Z
    .end local v14    # "title":Ljava/lang/String;
    :catch_0
    move-exception v16

    .line 223
    .local v16, "x":Ljava/lang/Exception;
    const/16 v17, 0x0

    move/from16 v0, v17

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v17, v0

    invoke-static/range {v16 .. v17}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_1

    .line 112
    .end local v2    # "f":Ljava/io/File;
    .end local v7    # "memoryStorage":Landroid/support/v7/preference/ListPreference;
    .end local v9    # "pref":Landroid/support/v7/preference/Preference;
    .end local v10    # "storagePaths":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v11    # "storageTitles":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v12    # "storageTitlesSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v16    # "x":Ljava/lang/Exception;
    :cond_4
    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-virtual {v15, v0}, Landroid/support/v14/preference/SwitchPreference;->setVisible(Z)V

    goto/16 :goto_0

    .line 218
    .restart local v2    # "f":Ljava/io/File;
    .restart local v3    # "isSd":Z
    .restart local v7    # "memoryStorage":Landroid/support/v7/preference/ListPreference;
    .restart local v9    # "pref":Landroid/support/v7/preference/Preference;
    .restart local v10    # "storagePaths":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v11    # "storageTitles":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v12    # "storageTitlesSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :cond_5
    const v17, 0x7f080212

    goto :goto_2

    .line 227
    .end local v2    # "f":Ljava/io/File;
    .end local v3    # "isSd":Z
    :cond_6
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v17

    move/from16 v0, v17

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v10, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v17

    check-cast v17, [Ljava/lang/CharSequence;

    move-object/from16 v0, v17

    invoke-virtual {v7, v0}, Landroid/support/v7/preference/ListPreference;->setEntryValues([Ljava/lang/CharSequence;)V

    .line 228
    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v17

    move/from16 v0, v17

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v11, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v17

    check-cast v17, [Ljava/lang/CharSequence;

    move-object/from16 v0, v17

    invoke-virtual {v7, v0}, Landroid/support/v7/preference/ListPreference;->setEntries([Ljava/lang/CharSequence;)V

    .line 230
    invoke-virtual {v7}, Landroid/support/v7/preference/ListPreference;->getValue()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    .line 232
    .local v6, "lastStorageValue":Ljava/lang/String;
    invoke-static {v6}, Lcom/vkontakte/android/audio/AudioFacade$StorageType;->parseFromPreferences(Ljava/lang/String;)Lcom/vkontakte/android/audio/AudioFacade$StorageType;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/vkontakte/android/fragments/SettingsGeneralFragment;->currentStorageType:Lcom/vkontakte/android/audio/AudioFacade$StorageType;

    .line 233
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment;->currentStorageType:Lcom/vkontakte/android/audio/AudioFacade$StorageType;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/audio/AudioFacade$StorageType;->nameForPreference:Ljava/lang/String;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v7, v0}, Landroid/support/v7/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 235
    new-instance v17, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$7;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$7;-><init>(Lcom/vkontakte/android/fragments/SettingsGeneralFragment;)V

    move-object/from16 v0, v17

    invoke-virtual {v7, v0}, Landroid/support/v7/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/support/v7/preference/Preference$OnPreferenceChangeListener;)V

    .line 244
    invoke-interface {v12}, Ljava/util/Set;->size()I

    move-result v17

    const/16 v18, 0x1

    move/from16 v0, v17

    move/from16 v1, v18

    if-gt v0, v1, :cond_7

    .line 245
    const-string/jumbo v17, "cache"

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/SettingsGeneralFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v8

    check-cast v8, Landroid/support/v7/preference/PreferenceCategory;

    .line 246
    .local v8, "parent":Landroid/support/v7/preference/PreferenceCategory;
    invoke-virtual {v8, v7}, Landroid/support/v7/preference/PreferenceCategory;->removePreference(Landroid/support/v7/preference/Preference;)Z

    .line 248
    .end local v8    # "parent":Landroid/support/v7/preference/PreferenceCategory;
    :cond_7
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Lcom/vkontakte/android/auth/VKAccount;->isMusicRestricted()Z

    move-result v17

    if-eqz v17, :cond_9

    .line 249
    const/16 v17, 0x4

    move/from16 v0, v17

    new-array v5, v0, [Ljava/lang/String;

    const/16 v17, 0x0

    const-string/jumbo v18, "downloadAudio"

    aput-object v18, v5, v17

    const/16 v17, 0x1

    const-string/jumbo v18, "audioCacheLocation"

    aput-object v18, v5, v17

    const/16 v17, 0x2

    const-string/jumbo v18, "enableAudioCache"

    aput-object v18, v5, v17

    const/16 v17, 0x3

    const-string/jumbo v18, "clearAudioCache"

    aput-object v18, v5, v17

    .line 250
    .local v5, "keys":[Ljava/lang/String;
    const-string/jumbo v17, "cache"

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/SettingsGeneralFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v8

    check-cast v8, Landroid/support/v7/preference/PreferenceCategory;

    .line 251
    .restart local v8    # "parent":Landroid/support/v7/preference/PreferenceCategory;
    array-length v0, v5

    move/from16 v18, v0

    const/16 v17, 0x0

    :goto_3
    move/from16 v0, v17

    move/from16 v1, v18

    if-ge v0, v1, :cond_9

    aget-object v4, v5, v17

    .line 252
    .local v4, "key":Ljava/lang/String;
    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/vkontakte/android/fragments/SettingsGeneralFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v9

    .line 253
    if-eqz v9, :cond_8

    .line 254
    invoke-virtual {v8, v9}, Landroid/support/v7/preference/PreferenceCategory;->removePreference(Landroid/support/v7/preference/Preference;)Z

    .line 251
    :cond_8
    add-int/lit8 v17, v17, 0x1

    goto :goto_3

    .line 258
    .end local v4    # "key":Ljava/lang/String;
    .end local v5    # "keys":[Ljava/lang/String;
    .end local v8    # "parent":Landroid/support/v7/preference/PreferenceCategory;
    :cond_9
    return-void
.end method
