.class public Lcom/vkontakte/android/fragments/SettingsDebugFragment;
.super Lcom/vkontakte/android/fragments/MaterialPreferenceToolbarFragment;
.source "SettingsDebugFragment.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 53
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/MaterialPreferenceToolbarFragment;-><init>()V

    return-void
.end method

.method private copyDatabases(Landroid/content/Context;)V
    .locals 22
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 275
    const-string/jumbo v14, ""

    .line 277
    .local v14, "report":Ljava/lang/String;
    :try_start_0
    new-instance v6, Ljava/io/File;

    const-string/jumbo v16, "qwe"

    move-object/from16 v0, p1

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/Context;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v6, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 278
    .local v6, "dbDir":Ljava/io/File;
    new-instance v11, Ljava/io/File;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v16

    const-string/jumbo v17, ".vkontakte/cache_debug"

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-direct {v11, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 279
    .local v11, "outDir":Ljava/io/File;
    invoke-virtual {v11}, Ljava/io/File;->exists()Z

    move-result v16

    if-nez v16, :cond_0

    .line 280
    invoke-virtual {v11}, Ljava/io/File;->mkdirs()Z

    .line 282
    :cond_0
    invoke-virtual {v6}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v9

    .line 283
    .local v9, "list":[Ljava/io/File;
    array-length v0, v9

    move/from16 v17, v0

    const/16 v16, 0x0

    :goto_0
    move/from16 v0, v16

    move/from16 v1, v17

    if-ge v0, v1, :cond_2

    aget-object v7, v9, v16

    .line 284
    .local v7, "f":Ljava/io/File;
    invoke-virtual {v7}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v18

    const-string/jumbo v19, ".db"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v18

    if-nez v18, :cond_1

    .line 283
    :goto_1
    add-int/lit8 v16, v16, 0x1

    goto :goto_0

    .line 287
    :cond_1
    new-instance v12, Ljava/io/File;

    invoke-virtual {v7}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-direct {v12, v11, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 288
    .local v12, "outFile":Ljava/io/File;
    invoke-virtual {v12}, Ljava/io/File;->createNewFile()Z

    .line 289
    new-instance v10, Ljava/io/FileOutputStream;

    invoke-direct {v10, v12}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 290
    .local v10, "out":Ljava/io/FileOutputStream;
    new-instance v8, Ljava/io/FileInputStream;

    invoke-direct {v8, v7}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 291
    .local v8, "in":Ljava/io/FileInputStream;
    const/4 v5, 0x0

    .local v5, "count":I
    const/4 v13, 0x0

    .line 292
    .local v13, "read":I
    const/16 v18, 0x2800

    move/from16 v0, v18

    new-array v4, v0, [B

    .line 293
    .local v4, "buf":[B
    :goto_2
    invoke-virtual {v8, v4}, Ljava/io/FileInputStream;->read([B)I

    move-result v13

    if-lez v13, :cond_3

    .line 294
    add-int/2addr v5, v13

    .line 295
    const/16 v18, 0x0

    move/from16 v0, v18

    invoke-virtual {v10, v4, v0, v13}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 301
    .end local v4    # "buf":[B
    .end local v5    # "count":I
    .end local v6    # "dbDir":Ljava/io/File;
    .end local v7    # "f":Ljava/io/File;
    .end local v8    # "in":Ljava/io/FileInputStream;
    .end local v9    # "list":[Ljava/io/File;
    .end local v10    # "out":Ljava/io/FileOutputStream;
    .end local v11    # "outDir":Ljava/io/File;
    .end local v12    # "outFile":Ljava/io/File;
    .end local v13    # "read":I
    :catch_0
    move-exception v15

    .line 302
    .local v15, "x":Ljava/lang/Exception;
    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v16

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual {v15}, Ljava/lang/Exception;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    .line 304
    .end local v15    # "x":Ljava/lang/Exception;
    :cond_2
    new-instance v16, Landroid/app/AlertDialog$Builder;

    move-object/from16 v0, v16

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v16

    invoke-virtual {v0, v14}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v16

    const-string/jumbo v17, "ok"

    const/16 v18, 0x0

    invoke-virtual/range {v16 .. v18}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 305
    return-void

    .line 297
    .restart local v4    # "buf":[B
    .restart local v5    # "count":I
    .restart local v6    # "dbDir":Ljava/io/File;
    .restart local v7    # "f":Ljava/io/File;
    .restart local v8    # "in":Ljava/io/FileInputStream;
    .restart local v9    # "list":[Ljava/io/File;
    .restart local v10    # "out":Ljava/io/FileOutputStream;
    .restart local v11    # "outDir":Ljava/io/File;
    .restart local v12    # "outFile":Ljava/io/File;
    .restart local v13    # "read":I
    :cond_3
    :try_start_1
    invoke-virtual {v10}, Ljava/io/FileOutputStream;->close()V

    .line 298
    invoke-virtual {v8}, Ljava/io/FileInputStream;->close()V

    .line 299
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v18

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual {v7}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string/jumbo v19, " -> "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual {v12}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string/jumbo v19, " ["

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    int-to-long v0, v5

    move-wide/from16 v20, v0

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v19

    move-wide/from16 v0, v20

    move-object/from16 v2, v19

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/Global;->langFileSize(JLandroid/content/res/Resources;)Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string/jumbo v19, "]\n"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v14

    goto/16 :goto_1
.end method

.method private downloadMessages(Landroid/content/Context;)V
    .locals 3
    .param p1, "activity"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x0

    .line 308
    new-instance v0, Landroid/app/ProgressDialog;

    invoke-direct {v0, p1}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    .line 309
    .local v0, "dlg":Landroid/app/ProgressDialog;
    invoke-virtual {v0, v2}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    .line 310
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setProgressStyle(I)V

    .line 311
    invoke-virtual {v0, v2}, Landroid/app/ProgressDialog;->setProgress(I)V

    .line 312
    const-string/jumbo v1, "\u0421\u043a\u0430\u0447\u0438\u0432\u0430\u0435\u043c \u0438\u0441\u0442\u043e\u0440\u0438\u044e \u0441\u043e\u043e\u0431\u0449\u0435\u043d\u0438\u0439..."

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 313
    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 314
    new-instance v1, Ljava/lang/Thread;

    invoke-static {p0, p1, v0}, Lcom/vkontakte/android/fragments/SettingsDebugFragment$$Lambda$18;->lambdaFactory$(Lcom/vkontakte/android/fragments/SettingsDebugFragment;Landroid/content/Context;Landroid/app/ProgressDialog;)Ljava/lang/Runnable;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 362
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 363
    return-void
.end method

.method public static isDemoMode(Landroid/content/Context;)Z
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 56
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string/jumbo v1, "demo_mode"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method static synthetic lambda$null$13(Landroid/content/Context;)V
    .locals 2
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 184
    invoke-static {}, Lcom/vkontakte/android/C2DM;->checkForUpdate()V

    .line 185
    const-string/jumbo v0, "\u0420\u0435\u0433\u0438\u0441\u0442\u0440\u0430\u0446\u0438\u044f GCM \u043e\u0431\u043d\u043e\u0432\u043b\u0435\u043d\u0430."

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 186
    return-void
.end method

.method static synthetic lambda$onCreate$0(Landroid/support/v7/preference/Preference;)Z
    .locals 1
    .param p0, "preference"    # Landroid/support/v7/preference/Preference;

    .prologue
    .line 67
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/System;->exit(I)V

    .line 68
    const/4 v0, 0x1

    return v0
.end method

.method static synthetic lambda$onCreate$10(Landroid/support/v7/preference/Preference;)Z
    .locals 3
    .param p0, "preference"    # Landroid/support/v7/preference/Preference;

    .prologue
    .line 157
    invoke-virtual {p0}, Landroid/support/v7/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 158
    .local v0, "ctx":Landroid/content/Context;
    const-string/jumbo v1, "2fa"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 159
    const/4 v1, 0x1

    return v1
.end method

.method static synthetic lambda$onCreate$12(Landroid/support/v7/preference/Preference;)Z
    .locals 6
    .param p0, "preference"    # Landroid/support/v7/preference/Preference;

    .prologue
    const/4 v5, 0x0

    .line 170
    invoke-virtual {p0}, Landroid/support/v7/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 171
    .local v0, "ctx":Landroid/content/Context;
    const-string/jumbo v2, "gcm"

    invoke-virtual {v0, v2, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    const-string/jumbo v3, "reg"

    const/4 v4, 0x0

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 172
    .local v1, "token":Ljava/lang/String;
    const-string/jumbo v2, "clipboard"

    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/ClipboardManager;

    invoke-virtual {v2, v1}, Landroid/content/ClipboardManager;->setText(Ljava/lang/CharSequence;)V

    .line 173
    const-string/jumbo v2, "Okay!"

    invoke-static {v0, v2, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 174
    const/4 v2, 0x1

    return v2
.end method

.method static synthetic lambda$onCreate$15(Landroid/support/v7/preference/Preference;)Z
    .locals 3
    .param p0, "preference"    # Landroid/support/v7/preference/Preference;

    .prologue
    const/4 v2, 0x1

    .line 192
    invoke-virtual {p0}, Landroid/support/v7/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string/jumbo v1, "Google Now registration is being updated asynchronously, see logcat for progress (enable API logging for added verbosity)"

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 193
    invoke-static {}, Lcom/vkontakte/android/GoogleNow;->updateTokenAsync()V

    .line 194
    return v2
.end method

.method static synthetic lambda$onCreate$7(Landroid/support/v7/preference/Preference;)Z
    .locals 2
    .param p0, "preference"    # Landroid/support/v7/preference/Preference;

    .prologue
    .line 138
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "Test crash"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method synthetic lambda$downloadMessages$19(Landroid/content/Context;Landroid/app/ProgressDialog;)V
    .locals 11
    .param p1, "activity"    # Landroid/content/Context;
    .param p2, "dlg"    # Landroid/app/ProgressDialog;

    .prologue
    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 315
    const/4 v7, 0x0

    .local v7, "out":I
    :goto_0
    const/4 v0, 0x2

    if-ge v7, v0, :cond_1

    .line 316
    new-array v3, v10, [Z

    aput-boolean v9, v3, v9

    .line 317
    .local v3, "ended":[Z
    new-array v4, v10, [I

    aput v9, v4, v9

    .line 318
    .local v4, "offset":[I
    new-array v2, v10, [I

    aput v9, v2, v9

    .line 319
    .local v2, "total":[I
    :goto_1
    aget-boolean v0, v3, v9

    if-nez v0, :cond_0

    .line 320
    new-instance v0, Lcom/vkontakte/android/api/VKAPIRequest;

    const-string/jumbo v1, "messages.get"

    invoke-direct {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    const-string/jumbo v1, "offset"

    aget v5, v4, v9

    .line 321
    invoke-virtual {v0, v1, v5}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    const-string/jumbo v1, "count"

    const/16 v5, 0xc8

    .line 322
    invoke-virtual {v0, v1, v5}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    const-string/jumbo v1, "photo_sizes"

    .line 323
    invoke-virtual {v0, v1, v10}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    const-string/jumbo v1, "out"

    .line 324
    invoke-virtual {v0, v1, v7}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v8

    new-instance v0, Lcom/vkontakte/android/fragments/SettingsDebugFragment$3;

    move-object v1, p0

    move-object v5, p1

    move-object v6, p2

    invoke-direct/range {v0 .. v6}, Lcom/vkontakte/android/fragments/SettingsDebugFragment$3;-><init>(Lcom/vkontakte/android/fragments/SettingsDebugFragment;[I[Z[ILandroid/content/Context;Landroid/app/ProgressDialog;)V

    .line 325
    invoke-virtual {v8, v0}, Lcom/vkontakte/android/api/VKAPIRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 358
    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->execSync()Z

    goto :goto_1

    .line 315
    :cond_0
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 361
    .end local v2    # "total":[I
    .end local v3    # "ended":[Z
    .end local v4    # "offset":[I
    :cond_1
    invoke-static {p2}, Lcom/vkontakte/android/ViewUtils;->dismissDialogSafety(Landroid/app/Dialog;)V

    .line 362
    return-void
.end method

.method synthetic lambda$null$2(Landroid/widget/DatePicker;III)V
    .locals 6
    .param p1, "view"    # Landroid/widget/DatePicker;
    .param p2, "year"    # I
    .param p3, "monthOfYear"    # I
    .param p4, "dayOfMonth"    # I

    .prologue
    .line 88
    new-instance v0, Ljava/util/Date;

    const-wide/16 v2, 0x0

    invoke-direct {v0, v2, v3}, Ljava/util/Date;-><init>(J)V

    .line 89
    .local v0, "date1":Ljava/util/Date;
    invoke-virtual {v0, p4}, Ljava/util/Date;->setDate(I)V

    .line 90
    invoke-virtual {v0, p3}, Ljava/util/Date;->setMonth(I)V

    .line 91
    add-int/lit16 v2, p2, -0x76c

    invoke-virtual {v0, v2}, Ljava/util/Date;->setYear(I)V

    .line 92
    new-instance v1, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const-class v3, Lcom/vkontakte/android/BirthdayBroadcastReceiver;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 93
    .local v1, "intent":Landroid/content/Intent;
    const-string/jumbo v2, "force"

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 94
    const-string/jumbo v2, "date"

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v4

    invoke-virtual {v1, v2, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 95
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;)V

    .line 96
    return-void
.end method

.method synthetic lambda$onCreate$1(Landroid/support/v7/preference/Preference;)Z
    .locals 6
    .param p1, "pref1"    # Landroid/support/v7/preference/Preference;

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 76
    invoke-static {}, Lcom/vkontakte/android/Log;->captureStart()V

    .line 77
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const-string/jumbo v1, "\u041e\u0442\u043b\u0430\u0434\u043e\u0447\u043d\u0430\u044f \u0438\u043d\u0444\u043e\u0440\u043c\u0430\u0446\u0438\u044f \u0437\u0430\u043f\u0438\u0441\u044b\u0432\u0430\u0435\u0442\u0441\u044f \u0432 \u0444\u0430\u0439\u043b \"%s\""

    new-array v2, v4, [Ljava/lang/Object;

    sget-object v3, Lcom/vkontakte/android/Log;->logFile:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 78
    invoke-virtual {p1, v5}, Landroid/support/v7/preference/Preference;->setEnabled(Z)V

    .line 79
    const-string/jumbo v0, "\u0423\u0436\u0435 \u0432\u043a\u043b\u044e\u0447\u0435\u043d\u043e"

    invoke-virtual {p1, v0}, Landroid/support/v7/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 80
    return v4
.end method

.method synthetic lambda$onCreate$11(Landroid/support/v7/preference/Preference;)Z
    .locals 3
    .param p1, "preference"    # Landroid/support/v7/preference/Preference;

    .prologue
    const/4 v2, 0x1

    .line 164
    new-instance v0, Landroid/webkit/WebView;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v2}, Landroid/webkit/WebView;->clearCache(Z)V

    .line 165
    return v2
.end method

.method synthetic lambda$onCreate$14(Landroid/support/v7/preference/Preference;)Z
    .locals 6
    .param p1, "preference"    # Landroid/support/v7/preference/Preference;

    .prologue
    const/4 v3, 0x0

    .line 179
    invoke-virtual {p1}, Landroid/support/v7/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 180
    .local v0, "ctx":Landroid/content/Context;
    invoke-static {}, Lcom/vkontakte/android/C2DM;->stop()Z

    move-result v1

    .line 181
    .local v1, "res":Z
    if-eqz v1, :cond_0

    const-string/jumbo v2, "\u0420\u0435\u0433\u0438\u0441\u0442\u0440\u0430\u0446\u0438\u044f GCM \u043e\u0442\u043c\u0435\u043d\u0435\u043d\u0430"

    :goto_0
    invoke-static {v0, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 182
    const-string/jumbo v2, "gcm"

    invoke-virtual {v0, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 183
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->getListView()Landroid/support/v7/widget/RecyclerView;

    move-result-object v2

    invoke-static {v0}, Lcom/vkontakte/android/fragments/SettingsDebugFragment$$Lambda$19;->lambdaFactory$(Landroid/content/Context;)Ljava/lang/Runnable;

    move-result-object v3

    const-wide/16 v4, 0x3e8

    invoke-virtual {v2, v3, v4, v5}, Landroid/support/v7/widget/RecyclerView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 187
    const/4 v2, 0x1

    return v2

    .line 181
    :cond_0
    const-string/jumbo v2, "GCM \u0438 \u0442\u0430\u043a \u043d\u0435 \u0437\u0430\u0440\u0435\u0433\u0438\u0441\u0442\u0440\u0438\u0440\u043e\u0432\u0430\u043d"

    goto :goto_0
.end method

.method synthetic lambda$onCreate$16(Landroid/support/v7/preference/Preference;Ljava/lang/Object;)Z
    .locals 3
    .param p1, "preference"    # Landroid/support/v7/preference/Preference;
    .param p2, "newValue"    # Ljava/lang/Object;

    .prologue
    .line 203
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->stop()V

    .line 204
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string/jumbo v2, "__dbg_player_type"

    move-object v0, p2

    check-cast v0, Ljava/lang/String;

    .line 205
    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 206
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "__dbg_exo_player"

    .line 207
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 208
    check-cast p2, Ljava/lang/String;

    .end local p2    # "newValue":Ljava/lang/Object;
    invoke-virtual {p1, p2}, Landroid/support/v7/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 209
    const/4 v0, 0x1

    return v0
.end method

.method synthetic lambda$onCreate$17(Landroid/support/v7/preference/Preference;Ljava/lang/Object;)Z
    .locals 4
    .param p1, "preference"    # Landroid/support/v7/preference/Preference;
    .param p2, "newValue"    # Ljava/lang/Object;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 229
    const-string/jumbo v3, "__dbg_demo_ads"

    move-object v0, p2

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_1

    move v0, v1

    :goto_0
    invoke-virtual {p0, v3, v0}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->setPreferenceEnabled(Ljava/lang/String;Z)V

    .line 230
    const-string/jumbo v3, "__dbg_demo_pretty_cards"

    move-object v0, p2

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_2

    move v0, v1

    :goto_1
    invoke-virtual {p0, v3, v0}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->setPreferenceEnabled(Ljava/lang/String;Z)V

    .line 231
    const-string/jumbo v0, "__dbg_no_slider_ads"

    check-cast p2, Ljava/lang/Boolean;

    .end local p2    # "newValue":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-nez v3, :cond_0

    move v2, v1

    :cond_0
    invoke-virtual {p0, v0, v2}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->setPreferenceEnabled(Ljava/lang/String;Z)V

    .line 232
    return v1

    .restart local p2    # "newValue":Ljava/lang/Object;
    :cond_1
    move v0, v2

    .line 229
    goto :goto_0

    :cond_2
    move v0, v2

    .line 230
    goto :goto_1
.end method

.method synthetic lambda$onCreate$18(Landroid/support/v7/preference/Preference;Ljava/lang/Object;)Z
    .locals 3
    .param p1, "preference"    # Landroid/support/v7/preference/Preference;
    .param p2, "newValue"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    .line 238
    const-string/jumbo v2, "__dbg_proxy_enable"

    check-cast p2, Ljava/lang/Boolean;

    .end local p2    # "newValue":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_0

    move v0, v1

    :goto_0
    invoke-virtual {p0, v2, v0}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->setPreferenceEnabled(Ljava/lang/String;Z)V

    .line 239
    return v1

    .line 238
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method synthetic lambda$onCreate$3(Landroid/support/v7/preference/Preference;)Z
    .locals 7
    .param p1, "preference"    # Landroid/support/v7/preference/Preference;

    .prologue
    .line 86
    new-instance v6, Ljava/util/Date;

    invoke-direct {v6}, Ljava/util/Date;-><init>()V

    .line 87
    .local v6, "date":Ljava/util/Date;
    new-instance v0, Landroid/app/DatePickerDialog;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {p0}, Lcom/vkontakte/android/fragments/SettingsDebugFragment$$Lambda$20;->lambdaFactory$(Lcom/vkontakte/android/fragments/SettingsDebugFragment;)Landroid/app/DatePickerDialog$OnDateSetListener;

    move-result-object v2

    .line 96
    invoke-virtual {v6}, Ljava/util/Date;->getYear()I

    move-result v3

    add-int/lit16 v3, v3, 0x76c

    invoke-virtual {v6}, Ljava/util/Date;->getMonth()I

    move-result v4

    invoke-virtual {v6}, Ljava/util/Date;->getDate()I

    move-result v5

    invoke-direct/range {v0 .. v5}, Landroid/app/DatePickerDialog;-><init>(Landroid/content/Context;Landroid/app/DatePickerDialog$OnDateSetListener;III)V

    .line 97
    .local v0, "dpd":Landroid/app/DatePickerDialog;
    invoke-virtual {v0}, Landroid/app/DatePickerDialog;->show()V

    .line 98
    const/4 v1, 0x1

    return v1
.end method

.method synthetic lambda$onCreate$4(Landroid/support/v7/preference/Preference;)Z
    .locals 2
    .param p1, "preference"    # Landroid/support/v7/preference/Preference;

    .prologue
    .line 103
    new-instance v0, Lcom/vkontakte/android/api/VKAPIRequest;

    const-string/jumbo v1, "account.testValidation"

    invoke-direct {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    new-instance v1, Lcom/vkontakte/android/fragments/SettingsDebugFragment$1;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/fragments/SettingsDebugFragment$1;-><init>(Lcom/vkontakte/android/fragments/SettingsDebugFragment;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 111
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 112
    const/4 v0, 0x1

    return v0
.end method

.method synthetic lambda$onCreate$5(Landroid/support/v7/preference/Preference;)Z
    .locals 2
    .param p1, "preference"    # Landroid/support/v7/preference/Preference;

    .prologue
    .line 117
    new-instance v0, Lcom/vkontakte/android/api/VKAPIRequest;

    const-string/jumbo v1, "captcha.force"

    invoke-direct {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    new-instance v1, Lcom/vkontakte/android/fragments/SettingsDebugFragment$2;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/fragments/SettingsDebugFragment$2;-><init>(Lcom/vkontakte/android/fragments/SettingsDebugFragment;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 126
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 127
    const/4 v0, 0x1

    return v0
.end method

.method synthetic lambda$onCreate$6(Landroid/support/v7/preference/Preference;)Z
    .locals 1
    .param p1, "preference"    # Landroid/support/v7/preference/Preference;

    .prologue
    .line 132
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->copyDatabases(Landroid/content/Context;)V

    .line 133
    const/4 v0, 0x1

    return v0
.end method

.method synthetic lambda$onCreate$8(Landroid/support/v7/preference/Preference;)Z
    .locals 5
    .param p1, "preference"    # Landroid/support/v7/preference/Preference;

    .prologue
    .line 143
    sget-object v2, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v2}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 144
    .local v0, "prefs":Landroid/content/SharedPreferences;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "https://"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "testSPAUri"

    const-string/jumbo v4, "static.vk.com/demo"

    invoke-interface {v0, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 145
    .local v1, "testSPAUri":Ljava/lang/String;
    new-instance v2, Lcom/vk/webapp/VKUIWebContainerFragment$Builder;

    invoke-direct {v2, v1}, Lcom/vk/webapp/VKUIWebContainerFragment$Builder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/vk/webapp/VKUIWebContainerFragment$Builder;->go(Landroid/content/Context;)Z

    .line 146
    const/4 v2, 0x1

    return v2
.end method

.method synthetic lambda$onCreate$9(Landroid/support/v7/preference/Preference;)Z
    .locals 1
    .param p1, "preference"    # Landroid/support/v7/preference/Preference;

    .prologue
    .line 151
    invoke-virtual {p1}, Landroid/support/v7/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->downloadMessages(Landroid/content/Context;)V

    .line 152
    const/4 v0, 0x1

    return v0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 7
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 61
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/MaterialPreferenceToolbarFragment;->onCreate(Landroid/os/Bundle;)V

    .line 63
    const v3, 0x7f060006

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->addPreferencesFromResource(I)V

    .line 65
    const-string/jumbo v3, "terminate"

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v2

    .line 66
    .local v2, "pref":Landroid/support/v7/preference/Preference;
    invoke-static {}, Lcom/vkontakte/android/fragments/SettingsDebugFragment$$Lambda$1;->lambdaFactory$()Landroid/support/v7/preference/Preference$OnPreferenceClickListener;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/support/v7/preference/Preference;->setOnPreferenceClickListener(Landroid/support/v7/preference/Preference$OnPreferenceClickListener;)V

    .line 70
    const-string/jumbo v3, "logToFile"

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v2

    .line 71
    sget-object v3, Lcom/vkontakte/android/Log;->logFile:Ljava/io/File;

    if-eqz v3, :cond_3

    .line 72
    invoke-virtual {v2, v5}, Landroid/support/v7/preference/Preference;->setEnabled(Z)V

    .line 73
    const-string/jumbo v3, "\u0423\u0436\u0435 \u0432\u043a\u043b\u044e\u0447\u0435\u043d\u043e"

    invoke-virtual {v2, v3}, Landroid/support/v7/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 84
    :goto_0
    const-string/jumbo v3, "bdayTest"

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v2

    .line 85
    invoke-static {p0}, Lcom/vkontakte/android/fragments/SettingsDebugFragment$$Lambda$3;->lambdaFactory$(Lcom/vkontakte/android/fragments/SettingsDebugFragment;)Landroid/support/v7/preference/Preference$OnPreferenceClickListener;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/support/v7/preference/Preference;->setOnPreferenceClickListener(Landroid/support/v7/preference/Preference$OnPreferenceClickListener;)V

    .line 101
    const-string/jumbo v3, "validationTest"

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v2

    .line 102
    invoke-static {p0}, Lcom/vkontakte/android/fragments/SettingsDebugFragment$$Lambda$4;->lambdaFactory$(Lcom/vkontakte/android/fragments/SettingsDebugFragment;)Landroid/support/v7/preference/Preference$OnPreferenceClickListener;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/support/v7/preference/Preference;->setOnPreferenceClickListener(Landroid/support/v7/preference/Preference$OnPreferenceClickListener;)V

    .line 115
    const-string/jumbo v3, "captchaTest"

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v2

    .line 116
    invoke-static {p0}, Lcom/vkontakte/android/fragments/SettingsDebugFragment$$Lambda$5;->lambdaFactory$(Lcom/vkontakte/android/fragments/SettingsDebugFragment;)Landroid/support/v7/preference/Preference$OnPreferenceClickListener;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/support/v7/preference/Preference;->setOnPreferenceClickListener(Landroid/support/v7/preference/Preference$OnPreferenceClickListener;)V

    .line 130
    const-string/jumbo v3, "copyDatabases"

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v2

    .line 131
    invoke-static {p0}, Lcom/vkontakte/android/fragments/SettingsDebugFragment$$Lambda$6;->lambdaFactory$(Lcom/vkontakte/android/fragments/SettingsDebugFragment;)Landroid/support/v7/preference/Preference$OnPreferenceClickListener;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/support/v7/preference/Preference;->setOnPreferenceClickListener(Landroid/support/v7/preference/Preference$OnPreferenceClickListener;)V

    .line 136
    const-string/jumbo v3, "testCrash"

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v2

    .line 137
    invoke-static {}, Lcom/vkontakte/android/fragments/SettingsDebugFragment$$Lambda$7;->lambdaFactory$()Landroid/support/v7/preference/Preference$OnPreferenceClickListener;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/support/v7/preference/Preference;->setOnPreferenceClickListener(Landroid/support/v7/preference/Preference$OnPreferenceClickListener;)V

    .line 141
    const-string/jumbo v3, "testVKUI"

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v2

    .line 142
    invoke-static {p0}, Lcom/vkontakte/android/fragments/SettingsDebugFragment$$Lambda$8;->lambdaFactory$(Lcom/vkontakte/android/fragments/SettingsDebugFragment;)Landroid/support/v7/preference/Preference$OnPreferenceClickListener;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/support/v7/preference/Preference;->setOnPreferenceClickListener(Landroid/support/v7/preference/Preference$OnPreferenceClickListener;)V

    .line 149
    const-string/jumbo v3, "downloadMessages"

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v2

    .line 150
    invoke-static {p0}, Lcom/vkontakte/android/fragments/SettingsDebugFragment$$Lambda$9;->lambdaFactory$(Lcom/vkontakte/android/fragments/SettingsDebugFragment;)Landroid/support/v7/preference/Preference$OnPreferenceClickListener;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/support/v7/preference/Preference;->setOnPreferenceClickListener(Landroid/support/v7/preference/Preference$OnPreferenceClickListener;)V

    .line 155
    const-string/jumbo v3, "clearTrustedHash"

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v2

    .line 156
    invoke-static {}, Lcom/vkontakte/android/fragments/SettingsDebugFragment$$Lambda$10;->lambdaFactory$()Landroid/support/v7/preference/Preference$OnPreferenceClickListener;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/support/v7/preference/Preference;->setOnPreferenceClickListener(Landroid/support/v7/preference/Preference$OnPreferenceClickListener;)V

    .line 162
    const-string/jumbo v3, "clearWebViewCache"

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v2

    .line 163
    invoke-static {p0}, Lcom/vkontakte/android/fragments/SettingsDebugFragment$$Lambda$11;->lambdaFactory$(Lcom/vkontakte/android/fragments/SettingsDebugFragment;)Landroid/support/v7/preference/Preference$OnPreferenceClickListener;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/support/v7/preference/Preference;->setOnPreferenceClickListener(Landroid/support/v7/preference/Preference$OnPreferenceClickListener;)V

    .line 168
    const-string/jumbo v3, "copyGcmToken"

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v2

    .line 169
    invoke-static {}, Lcom/vkontakte/android/fragments/SettingsDebugFragment$$Lambda$12;->lambdaFactory$()Landroid/support/v7/preference/Preference$OnPreferenceClickListener;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/support/v7/preference/Preference;->setOnPreferenceClickListener(Landroid/support/v7/preference/Preference$OnPreferenceClickListener;)V

    .line 177
    const-string/jumbo v3, "reRegisterGCM"

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v2

    .line 178
    invoke-static {p0}, Lcom/vkontakte/android/fragments/SettingsDebugFragment$$Lambda$13;->lambdaFactory$(Lcom/vkontakte/android/fragments/SettingsDebugFragment;)Landroid/support/v7/preference/Preference$OnPreferenceClickListener;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/support/v7/preference/Preference;->setOnPreferenceClickListener(Landroid/support/v7/preference/Preference$OnPreferenceClickListener;)V

    .line 190
    const-string/jumbo v3, "reRegisterGoogleNow"

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v2

    .line 191
    invoke-static {}, Lcom/vkontakte/android/fragments/SettingsDebugFragment$$Lambda$14;->lambdaFactory$()Landroid/support/v7/preference/Preference$OnPreferenceClickListener;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/support/v7/preference/Preference;->setOnPreferenceClickListener(Landroid/support/v7/preference/Preference$OnPreferenceClickListener;)V

    .line 197
    const-string/jumbo v3, "__dbg_player_type_view"

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v2

    .line 198
    if-eqz v2, :cond_0

    .line 199
    invoke-virtual {v2}, Landroid/support/v7/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/vkontakte/android/audio/player/PlayerService;->getPlayerType(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .local v1, "playerType":Ljava/lang/String;
    move-object v3, v2

    .line 200
    check-cast v3, Landroid/support/v7/preference/ListPreference;

    invoke-virtual {v3, v1}, Landroid/support/v7/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 201
    invoke-virtual {v2, v1}, Landroid/support/v7/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 202
    invoke-static {p0}, Lcom/vkontakte/android/fragments/SettingsDebugFragment$$Lambda$15;->lambdaFactory$(Lcom/vkontakte/android/fragments/SettingsDebugFragment;)Landroid/support/v7/preference/Preference$OnPreferenceChangeListener;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/support/v7/preference/Preference;->setOnPreferenceChangeListener(Landroid/support/v7/preference/Preference$OnPreferenceChangeListener;)V

    .line 213
    .end local v1    # "playerType":Ljava/lang/String;
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    const/4 v6, 0x0

    invoke-virtual {v3, v6, v5}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    const-string/jumbo v6, "sinv"

    invoke-interface {v3, v6, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-nez v3, :cond_4

    .line 214
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v3

    iget-boolean v3, v3, Lcom/vkontakte/android/auth/VKAccount;->debugAvailable:Z

    if-nez v3, :cond_4

    .line 215
    const-string/jumbo v3, "others"

    invoke-virtual {p0, v3, v5}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->setPreferenceVisibility(Ljava/lang/String;Z)V

    .line 216
    const-string/jumbo v3, "__dbg_no_ads"

    invoke-virtual {p0, v3, v5}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->setPreferenceVisibility(Ljava/lang/String;Z)V

    .line 217
    const-string/jumbo v3, "__dbg_demo_ads"

    invoke-virtual {p0, v3, v5}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->setPreferenceVisibility(Ljava/lang/String;Z)V

    .line 218
    const-string/jumbo v3, "__dbg_no_slider_ads"

    invoke-virtual {p0, v3, v5}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->setPreferenceVisibility(Ljava/lang/String;Z)V

    .line 219
    const-string/jumbo v3, "__dbg_proxy_enable"

    invoke-virtual {p0, v3, v5}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->setPreferenceVisibility(Ljava/lang/String;Z)V

    .line 220
    const-string/jumbo v3, "__dbg_demo_pretty_cards"

    invoke-virtual {p0, v3, v5}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->setPreferenceVisibility(Ljava/lang/String;Z)V

    .line 243
    :cond_1
    :goto_1
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v3

    iget-boolean v3, v3, Lcom/vkontakte/android/auth/VKAccount;->debugAvailable:Z

    if-nez v3, :cond_2

    .line 244
    const-string/jumbo v3, "tests"

    invoke-virtual {p0, v3, v5}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->setPreferenceVisibility(Ljava/lang/String;Z)V

    .line 245
    const-string/jumbo v3, "bdayTest"

    invoke-virtual {p0, v3, v5}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->setPreferenceVisibility(Ljava/lang/String;Z)V

    .line 246
    const-string/jumbo v3, "validationTest"

    invoke-virtual {p0, v3, v5}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->setPreferenceVisibility(Ljava/lang/String;Z)V

    .line 247
    const-string/jumbo v3, "captchaTest"

    invoke-virtual {p0, v3, v5}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->setPreferenceVisibility(Ljava/lang/String;Z)V

    .line 248
    const-string/jumbo v3, "testCrash"

    invoke-virtual {p0, v3, v5}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->setPreferenceVisibility(Ljava/lang/String;Z)V

    .line 249
    const-string/jumbo v3, "testVKUI"

    invoke-virtual {p0, v3, v5}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->setPreferenceVisibility(Ljava/lang/String;Z)V

    .line 250
    const-string/jumbo v3, "testSPAUri"

    invoke-virtual {p0, v3, v5}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->setPreferenceVisibility(Ljava/lang/String;Z)V

    .line 252
    const-string/jumbo v3, "__dbg_lang_override"

    invoke-virtual {p0, v3, v5}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->setPreferenceVisibility(Ljava/lang/String;Z)V

    .line 254
    const-string/jumbo v3, "demo_mode"

    invoke-virtual {p0, v3, v5}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->setPreferenceVisibility(Ljava/lang/String;Z)V

    .line 255
    const-string/jumbo v3, "__dbg_demo_ads"

    invoke-virtual {p0, v3, v5}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->setPreferenceVisibility(Ljava/lang/String;Z)V

    .line 256
    const-string/jumbo v3, "__dbg_demo_pretty_cards"

    invoke-virtual {p0, v3, v5}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->setPreferenceVisibility(Ljava/lang/String;Z)V

    .line 258
    :cond_2
    return-void

    .line 75
    :cond_3
    invoke-static {p0}, Lcom/vkontakte/android/fragments/SettingsDebugFragment$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/fragments/SettingsDebugFragment;)Landroid/support/v7/preference/Preference$OnPreferenceClickListener;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/support/v7/preference/Preference;->setOnPreferenceClickListener(Landroid/support/v7/preference/Preference$OnPreferenceClickListener;)V

    goto/16 :goto_0

    .line 222
    :cond_4
    const-string/jumbo v3, "__dbg_no_ads"

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v2

    .line 223
    if-eqz v2, :cond_5

    .line 224
    invoke-virtual {v2}, Landroid/support/v7/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    const-string/jumbo v6, "__dbg_no_ads"

    invoke-interface {v3, v6, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 225
    .local v0, "isNoAds":Z
    const-string/jumbo v6, "__dbg_demo_ads"

    if-nez v0, :cond_6

    move v3, v4

    :goto_2
    invoke-virtual {p0, v6, v3}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->setPreferenceEnabled(Ljava/lang/String;Z)V

    .line 226
    const-string/jumbo v6, "__dbg_demo_pretty_cards"

    if-nez v0, :cond_7

    move v3, v4

    :goto_3
    invoke-virtual {p0, v6, v3}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->setPreferenceEnabled(Ljava/lang/String;Z)V

    .line 227
    const-string/jumbo v3, "__dbg_no_slider_ads"

    if-nez v0, :cond_8

    :goto_4
    invoke-virtual {p0, v3, v4}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->setPreferenceEnabled(Ljava/lang/String;Z)V

    .line 228
    invoke-static {p0}, Lcom/vkontakte/android/fragments/SettingsDebugFragment$$Lambda$16;->lambdaFactory$(Lcom/vkontakte/android/fragments/SettingsDebugFragment;)Landroid/support/v7/preference/Preference$OnPreferenceChangeListener;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/support/v7/preference/Preference;->setOnPreferenceChangeListener(Landroid/support/v7/preference/Preference$OnPreferenceChangeListener;)V

    .line 235
    .end local v0    # "isNoAds":Z
    :cond_5
    const-string/jumbo v3, "__dbg_proxy_enable"

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v2

    .line 236
    if-eqz v2, :cond_1

    .line 237
    invoke-static {p0}, Lcom/vkontakte/android/fragments/SettingsDebugFragment$$Lambda$17;->lambdaFactory$(Lcom/vkontakte/android/fragments/SettingsDebugFragment;)Landroid/support/v7/preference/Preference$OnPreferenceChangeListener;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/support/v7/preference/Preference;->setOnPreferenceChangeListener(Landroid/support/v7/preference/Preference$OnPreferenceChangeListener;)V

    goto/16 :goto_1

    .restart local v0    # "isNoAds":Z
    :cond_6
    move v3, v5

    .line 225
    goto :goto_2

    :cond_7
    move v3, v5

    .line 226
    goto :goto_3

    :cond_8
    move v4, v5

    .line 227
    goto :goto_4
.end method

.method setPreferenceEnabled(Ljava/lang/String;Z)V
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "enable"    # Z

    .prologue
    .line 268
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v0

    .line 269
    .local v0, "preference":Landroid/support/v7/preference/Preference;
    if-eqz v0, :cond_0

    .line 270
    invoke-virtual {v0, p2}, Landroid/support/v7/preference/Preference;->setEnabled(Z)V

    .line 272
    :cond_0
    return-void
.end method

.method setPreferenceVisibility(Ljava/lang/String;Z)V
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "visibility"    # Z

    .prologue
    .line 261
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v0

    .line 262
    .local v0, "preference":Landroid/support/v7/preference/Preference;
    if-eqz v0, :cond_0

    .line 263
    invoke-virtual {v0, p2}, Landroid/support/v7/preference/Preference;->setVisible(Z)V

    .line 265
    :cond_0
    return-void
.end method
