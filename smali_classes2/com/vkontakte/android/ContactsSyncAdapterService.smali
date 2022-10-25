.class public Lcom/vkontakte/android/ContactsSyncAdapterService;
.super Landroid/app/Service;
.source "ContactsSyncAdapterService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ContactsSyncAdapterService$PhotoDownloader;,
        Lcom/vkontakte/android/ContactsSyncAdapterService$PhotoUpdateRequest;,
        Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;,
        Lcom/vkontakte/android/ContactsSyncAdapterService$SyncAdapterImpl;
    }
.end annotation


# static fields
.field private static final PHOTO_DOWNLOAD_WORKER_THREADS_COUNT:I = 0x5

.field private static lastSyncTime:J

.field private static maxPhotoSize:I

.field private static needCancel:Z

.field private static photoDownloadBarrier:Ljava/util/concurrent/CyclicBarrier;

.field private static resolver:Landroid/content/ContentResolver;

.field private static success:Z

.field private static syncAdapter:Lcom/vkontakte/android/ContactsSyncAdapterService$SyncAdapterImpl;

.field private static tries:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 49
    const-wide/16 v0, 0x0

    sput-wide v0, Lcom/vkontakte/android/ContactsSyncAdapterService;->lastSyncTime:J

    .line 50
    sput-boolean v2, Lcom/vkontakte/android/ContactsSyncAdapterService;->needCancel:Z

    .line 52
    sput-boolean v2, Lcom/vkontakte/android/ContactsSyncAdapterService;->success:Z

    .line 53
    const/16 v0, 0x60

    sput v0, Lcom/vkontakte/android/ContactsSyncAdapterService;->maxPhotoSize:I

    .line 55
    new-instance v0, Ljava/util/concurrent/CyclicBarrier;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Ljava/util/concurrent/CyclicBarrier;-><init>(I)V

    sput-object v0, Lcom/vkontakte/android/ContactsSyncAdapterService;->photoDownloadBarrier:Ljava/util/concurrent/CyclicBarrier;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 43
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    return-void
.end method

.method static synthetic access$000(Landroid/content/Context;Landroid/accounts/Account;Landroid/os/Bundle;Ljava/lang/String;Landroid/content/ContentProviderClient;Landroid/content/SyncResult;)V
    .locals 0
    .param p0, "x0"    # Landroid/content/Context;
    .param p1, "x1"    # Landroid/accounts/Account;
    .param p2, "x2"    # Landroid/os/Bundle;
    .param p3, "x3"    # Ljava/lang/String;
    .param p4, "x4"    # Landroid/content/ContentProviderClient;
    .param p5, "x5"    # Landroid/content/SyncResult;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/accounts/OperationCanceledException;
        }
    .end annotation

    .prologue
    .line 43
    invoke-static/range {p0 .. p5}, Lcom/vkontakte/android/ContactsSyncAdapterService;->performSync(Landroid/content/Context;Landroid/accounts/Account;Landroid/os/Bundle;Ljava/lang/String;Landroid/content/ContentProviderClient;Landroid/content/SyncResult;)V

    return-void
.end method

.method static synthetic access$102(Z)Z
    .locals 0
    .param p0, "x0"    # Z

    .prologue
    .line 43
    sput-boolean p0, Lcom/vkontakte/android/ContactsSyncAdapterService;->needCancel:Z

    return p0
.end method

.method static synthetic access$200(Lorg/json/JSONObject;)Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;
    .locals 1
    .param p0, "x0"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 43
    invoke-static {p0}, Lcom/vkontakte/android/ContactsSyncAdapterService;->getProfile(Lorg/json/JSONObject;)Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$302(Z)Z
    .locals 0
    .param p0, "x0"    # Z

    .prologue
    .line 43
    sput-boolean p0, Lcom/vkontakte/android/ContactsSyncAdapterService;->success:Z

    return p0
.end method

.method static synthetic access$410()I
    .locals 2

    .prologue
    .line 43
    sget v0, Lcom/vkontakte/android/ContactsSyncAdapterService;->tries:I

    add-int/lit8 v1, v0, -0x1

    sput v1, Lcom/vkontakte/android/ContactsSyncAdapterService;->tries:I

    return v0
.end method

.method static synthetic access$600()I
    .locals 1

    .prologue
    .line 43
    sget v0, Lcom/vkontakte/android/ContactsSyncAdapterService;->maxPhotoSize:I

    return v0
.end method

.method static synthetic access$700()Landroid/content/ContentResolver;
    .locals 1

    .prologue
    .line 43
    sget-object v0, Lcom/vkontakte/android/ContactsSyncAdapterService;->resolver:Landroid/content/ContentResolver;

    return-object v0
.end method

.method static synthetic access$800()Ljava/util/concurrent/CyclicBarrier;
    .locals 1

    .prologue
    .line 43
    sget-object v0, Lcom/vkontakte/android/ContactsSyncAdapterService;->photoDownloadBarrier:Ljava/util/concurrent/CyclicBarrier;

    return-object v0
.end method

.method private static addOrUpdateContact(Landroid/content/Context;Landroid/accounts/Account;Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;Landroid/content/SyncStats;Ljava/util/ArrayList;Ljava/util/Vector;)Z
    .locals 30
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "account"    # Landroid/accounts/Account;
    .param p2, "p"    # Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;
    .param p3, "stats"    # Landroid/content/SyncStats;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/accounts/Account;",
            "Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;",
            "Landroid/content/SyncStats;",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/content/ContentProviderOperation;",
            ">;",
            "Ljava/util/Vector",
            "<",
            "Lcom/vkontakte/android/ContactsSyncAdapterService$PhotoUpdateRequest;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 386
    .local p4, "operationList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/content/ContentProviderOperation;>;"
    .local p5, "photoUpdates":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/vkontakte/android/ContactsSyncAdapterService$PhotoUpdateRequest;>;"
    const/16 v27, 0x0

    .local v27, "update":Z
    const/16 v23, 0x1

    .local v23, "photoChanged":Z
    const/16 v20, 0x1

    .local v20, "nameChanged":Z
    const/4 v8, 0x1

    .local v8, "bdateChanged":Z
    const/16 v21, 0x1

    .line 387
    .local v21, "phoneChanged":Z
    const/16 v24, 0x0

    .local v24, "photoExists":Z
    const/4 v9, 0x0

    .local v9, "bdateExists":Z
    const/16 v22, 0x0

    .line 388
    .local v22, "phoneExists":Z
    const/16 v28, 0x0

    .local v28, "updateContactID":I
    const/16 v18, -0x1

    .line 390
    .local v18, "existingPhotoID":I
    sget-object v2, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v2

    const-string/jumbo v3, "caller_is_syncadapter"

    const-string/jumbo v4, "true"

    invoke-virtual {v2, v3, v4}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v17

    .line 391
    .local v17, "dataUri":Landroid/net/Uri;
    const/16 v19, 0x0

    .line 393
    .local v19, "hasIm":Z
    sget-object v2, Lcom/vkontakte/android/ContactsSyncAdapterService;->resolver:Landroid/content/ContentResolver;

    sget-object v3, Landroid/provider/ContactsContract$RawContacts;->CONTENT_URI:Landroid/net/Uri;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string/jumbo v6, "_id"

    aput-object v6, v4, v5

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "account_type=\'com.vkontakte.account\' AND sync1="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p2

    iget v6, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;->uid:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v16

    .line 394
    .local v16, "cursor":Landroid/database/Cursor;
    if-eqz v16, :cond_2

    invoke-interface/range {v16 .. v16}, Landroid/database/Cursor;->getCount()I

    move-result v2

    if-lez v2, :cond_2

    .line 395
    const/16 v27, 0x1

    .line 396
    invoke-interface/range {v16 .. v16}, Landroid/database/Cursor;->moveToFirst()Z

    .line 397
    const-string/jumbo v2, "_id"

    move-object/from16 v0, v16

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    move-object/from16 v0, v16

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v28

    .line 398
    const-string/jumbo v2, "vk"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Contact \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p2

    iget-object v4, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;->firstName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p2

    iget-object v4, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;->lastName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\' already exists, updating, ID="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, v28

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 399
    sget-object v2, Lcom/vkontakte/android/ContactsSyncAdapterService;->resolver:Landroid/content/ContentResolver;

    sget-object v3, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    const/4 v4, 0x6

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string/jumbo v6, "_id"

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-string/jumbo v6, "mimetype"

    aput-object v6, v4, v5

    const/4 v5, 0x2

    const-string/jumbo v6, "data_sync1"

    aput-object v6, v4, v5

    const/4 v5, 0x3

    const-string/jumbo v6, "data1"

    aput-object v6, v4, v5

    const/4 v5, 0x4

    const-string/jumbo v6, "data2"

    aput-object v6, v4, v5

    const/4 v5, 0x5

    const-string/jumbo v6, "data3"

    aput-object v6, v4, v5

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "raw_contact_id="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move/from16 v0, v28

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v16

    .line 400
    if-eqz v16, :cond_2

    invoke-interface/range {v16 .. v16}, Landroid/database/Cursor;->getCount()I

    move-result v2

    if-lez v2, :cond_2

    .line 401
    invoke-interface/range {v16 .. v16}, Landroid/database/Cursor;->moveToFirst()Z

    .line 404
    :cond_0
    :try_start_0
    const-string/jumbo v2, "mimetype"

    move-object/from16 v0, v16

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    move-object/from16 v0, v16

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v26

    .line 405
    .local v26, "type":Ljava/lang/String;
    const-string/jumbo v2, "vnd.android.cursor.item/photo"

    move-object/from16 v0, v26

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_f

    .line 406
    const-string/jumbo v2, "data_sync1"

    move-object/from16 v0, v16

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    move-object/from16 v0, v16

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v15

    .line 407
    .local v15, "curPhoto":Ljava/lang/String;
    move-object/from16 v0, p2

    iget-object v2, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;->bigPhoto:Lcom/vkontakte/android/Photo;

    if-eqz v2, :cond_d

    .line 408
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p2

    iget-object v3, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;->bigPhoto:Lcom/vkontakte/android/Photo;

    iget v3, v3, Lcom/vkontakte/android/Photo;->ownerID:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p2

    iget-object v3, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;->bigPhoto:Lcom/vkontakte/android/Photo;

    iget v3, v3, Lcom/vkontakte/android/Photo;->id:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v15, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_c

    const/16 v23, 0x1

    .line 412
    :goto_0
    const/16 v24, 0x1

    .line 413
    const-string/jumbo v2, "_id"

    move-object/from16 v0, v16

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    move-object/from16 v0, v16

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getInt(I)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v18

    .line 431
    .end local v15    # "curPhoto":Ljava/lang/String;
    .end local v26    # "type":Ljava/lang/String;
    :cond_1
    :goto_1
    invoke-interface/range {v16 .. v16}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 434
    :cond_2
    if-eqz v16, :cond_3

    .line 435
    invoke-interface/range {v16 .. v16}, Landroid/database/Cursor;->close()V

    .line 437
    :cond_3
    if-nez v27, :cond_4

    .line 438
    const-string/jumbo v2, "vk"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Contact \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p2

    iget-object v4, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;->firstName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p2

    iget-object v4, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;->lastName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\' does not exist, creating"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 443
    :cond_4
    const/16 v29, 0x0

    .line 445
    .local v29, "valueBack":I
    if-nez v27, :cond_5

    .line 446
    sget-object v2, Landroid/provider/ContactsContract$RawContacts;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v2

    const-string/jumbo v3, "caller_is_syncadapter"

    const-string/jumbo v4, "true"

    invoke-virtual {v2, v3, v4}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v2

    invoke-static {v2}, Landroid/content/ContentProviderOperation;->newInsert(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v10

    .line 447
    .local v10, "builder":Landroid/content/ContentProviderOperation$Builder;
    const-string/jumbo v2, "account_name"

    move-object/from16 v0, p1

    iget-object v3, v0, Landroid/accounts/Account;->name:Ljava/lang/String;

    invoke-virtual {v10, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 448
    const-string/jumbo v2, "account_type"

    move-object/from16 v0, p1

    iget-object v3, v0, Landroid/accounts/Account;->type:Ljava/lang/String;

    invoke-virtual {v10, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 449
    const-string/jumbo v2, "sync1"

    move-object/from16 v0, p2

    iget v3, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;->uid:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v10, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 450
    invoke-virtual {v10}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v2

    move-object/from16 v0, p4

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 451
    invoke-virtual/range {p4 .. p4}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v29, v2, -0x1

    .line 452
    const-string/jumbo v2, "vk"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "New insert, valueBack="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, v29

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 455
    .end local v10    # "builder":Landroid/content/ContentProviderOperation$Builder;
    :cond_5
    if-eqz v20, :cond_6

    .line 456
    if-nez v27, :cond_17

    .line 457
    invoke-static/range {v17 .. v17}, Landroid/content/ContentProviderOperation;->newInsert(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v10

    .line 458
    .restart local v10    # "builder":Landroid/content/ContentProviderOperation$Builder;
    const-string/jumbo v2, "raw_contact_id"

    move/from16 v0, v29

    invoke-virtual {v10, v2, v0}, Landroid/content/ContentProviderOperation$Builder;->withValueBackReference(Ljava/lang/String;I)Landroid/content/ContentProviderOperation$Builder;

    .line 463
    :goto_2
    const-string/jumbo v2, "mimetype"

    const-string/jumbo v3, "vnd.android.cursor.item/name"

    invoke-virtual {v10, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 464
    const-string/jumbo v2, "data2"

    move-object/from16 v0, p2

    iget-object v3, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;->firstName:Ljava/lang/String;

    invoke-virtual {v10, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 465
    const-string/jumbo v2, "data3"

    move-object/from16 v0, p2

    iget-object v3, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;->lastName:Ljava/lang/String;

    invoke-virtual {v10, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 466
    invoke-virtual {v10}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v2

    move-object/from16 v0, p4

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 467
    const-string/jumbo v2, "vk"

    const-string/jumbo v3, "Updating name"

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 470
    .end local v10    # "builder":Landroid/content/ContentProviderOperation$Builder;
    :cond_6
    if-eqz v23, :cond_7

    move-object/from16 v0, p2

    iget-object v2, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;->photo:Ljava/lang/String;

    const-string/jumbo v3, ".gif"

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_7

    .line 471
    new-instance v25, Lcom/vkontakte/android/ContactsSyncAdapterService$PhotoUpdateRequest;

    const/4 v2, 0x0

    move-object/from16 v0, v25

    invoke-direct {v0, v2}, Lcom/vkontakte/android/ContactsSyncAdapterService$PhotoUpdateRequest;-><init>(Lcom/vkontakte/android/ContactsSyncAdapterService$1;)V

    .line 472
    .local v25, "r":Lcom/vkontakte/android/ContactsSyncAdapterService$PhotoUpdateRequest;
    move-object/from16 v0, p2

    iget v2, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;->uid:I

    move-object/from16 v0, v25

    iput v2, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$PhotoUpdateRequest;->uid:I

    .line 473
    move-object/from16 v0, p2

    iget-object v2, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;->photo:Ljava/lang/String;

    move-object/from16 v0, v25

    iput-object v2, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$PhotoUpdateRequest;->url:Ljava/lang/String;

    .line 474
    move/from16 v0, v18

    move-object/from16 v1, v25

    iput v0, v1, Lcom/vkontakte/android/ContactsSyncAdapterService$PhotoUpdateRequest;->existingID:I

    .line 475
    move-object/from16 v0, p2

    iget-object v2, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;->photoCropRect:Landroid/graphics/RectF;

    move-object/from16 v0, v25

    iput-object v2, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$PhotoUpdateRequest;->cropRect:Landroid/graphics/RectF;

    .line 476
    move-object/from16 v0, p2

    iget-object v2, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;->bigPhoto:Lcom/vkontakte/android/Photo;

    move-object/from16 v0, v25

    iput-object v2, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$PhotoUpdateRequest;->photo:Lcom/vkontakte/android/Photo;

    .line 477
    move-object/from16 v0, p5

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 478
    const-string/jumbo v2, "vk"

    const-string/jumbo v3, "Updating photo"

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 499
    .end local v25    # "r":Lcom/vkontakte/android/ContactsSyncAdapterService$PhotoUpdateRequest;
    :cond_7
    move-object/from16 v0, p2

    iget-object v2, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;->phone:Ljava/lang/String;

    if-eqz v2, :cond_8

    const-string/jumbo v2, "null"

    move-object/from16 v0, p2

    iget-object v3, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;->phone:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_8

    move-object/from16 v0, p2

    iget-object v2, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;->phone:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_8

    if-eqz v21, :cond_8

    .line 500
    if-nez v27, :cond_18

    .line 501
    invoke-static/range {v17 .. v17}, Landroid/content/ContentProviderOperation;->newInsert(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v10

    .line 502
    .restart local v10    # "builder":Landroid/content/ContentProviderOperation$Builder;
    const-string/jumbo v2, "raw_contact_id"

    move/from16 v0, v29

    invoke-virtual {v10, v2, v0}, Landroid/content/ContentProviderOperation$Builder;->withValueBackReference(Ljava/lang/String;I)Landroid/content/ContentProviderOperation$Builder;

    .line 512
    :goto_3
    const-string/jumbo v2, "mimetype"

    const-string/jumbo v3, "vnd.android.cursor.item/phone_v2"

    invoke-virtual {v10, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 513
    const-string/jumbo v2, "data1"

    move-object/from16 v0, p2

    iget-object v3, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;->phone:Ljava/lang/String;

    invoke-virtual {v10, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 514
    const-string/jumbo v2, "data2"

    const/4 v3, 0x2

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v10, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 515
    invoke-virtual {v10}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v2

    move-object/from16 v0, p4

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 516
    const-string/jumbo v2, "vk"

    const-string/jumbo v3, "Updating phone"

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 519
    .end local v10    # "builder":Landroid/content/ContentProviderOperation$Builder;
    :cond_8
    move-object/from16 v0, p2

    iget-object v2, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;->bdate:Ljava/lang/String;

    if-eqz v2, :cond_9

    if-eqz v8, :cond_9

    .line 520
    if-nez v27, :cond_1a

    .line 521
    invoke-static/range {v17 .. v17}, Landroid/content/ContentProviderOperation;->newInsert(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v10

    .line 522
    .restart local v10    # "builder":Landroid/content/ContentProviderOperation$Builder;
    const-string/jumbo v2, "raw_contact_id"

    move/from16 v0, v29

    invoke-virtual {v10, v2, v0}, Landroid/content/ContentProviderOperation$Builder;->withValueBackReference(Ljava/lang/String;I)Landroid/content/ContentProviderOperation$Builder;

    .line 530
    :goto_4
    const-string/jumbo v2, "raw_contact_id"

    move/from16 v0, v29

    invoke-virtual {v10, v2, v0}, Landroid/content/ContentProviderOperation$Builder;->withValueBackReference(Ljava/lang/String;I)Landroid/content/ContentProviderOperation$Builder;

    .line 531
    const-string/jumbo v2, "mimetype"

    const-string/jumbo v3, "vnd.android.cursor.item/contact_event"

    invoke-virtual {v10, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 532
    const-string/jumbo v2, "data1"

    move-object/from16 v0, p2

    iget-object v3, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;->bdate:Ljava/lang/String;

    invoke-virtual {v10, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 533
    const-string/jumbo v2, "data2"

    const/4 v3, 0x3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v10, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 534
    invoke-virtual {v10}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v2

    move-object/from16 v0, p4

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 535
    const-string/jumbo v2, "vk"

    const-string/jumbo v3, "Updating bdate"

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 538
    .end local v10    # "builder":Landroid/content/ContentProviderOperation$Builder;
    :cond_9
    if-nez v27, :cond_a

    .line 539
    invoke-static/range {v17 .. v17}, Landroid/content/ContentProviderOperation;->newInsert(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v10

    .line 540
    .restart local v10    # "builder":Landroid/content/ContentProviderOperation$Builder;
    const-string/jumbo v2, "raw_contact_id"

    move/from16 v0, v29

    invoke-virtual {v10, v2, v0}, Landroid/content/ContentProviderOperation$Builder;->withValueBackReference(Ljava/lang/String;I)Landroid/content/ContentProviderOperation$Builder;

    .line 541
    const-string/jumbo v2, "mimetype"

    const-string/jumbo v3, "vnd.android.cursor.item/vnd.com.vkontakte.android.profile"

    invoke-virtual {v10, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 542
    const-string/jumbo v2, "data1"

    move-object/from16 v0, p2

    iget v3, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;->uid:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v10, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 543
    const-string/jumbo v2, "data2"

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f08017e

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v10, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 544
    const-string/jumbo v2, "data3"

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f08017d

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v10, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 545
    invoke-virtual {v10}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v2

    move-object/from16 v0, p4

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 548
    .end local v10    # "builder":Landroid/content/ContentProviderOperation$Builder;
    :cond_a
    if-nez v19, :cond_b

    .line 549
    if-nez v27, :cond_1c

    .line 550
    invoke-static/range {v17 .. v17}, Landroid/content/ContentProviderOperation;->newInsert(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v10

    .line 551
    .restart local v10    # "builder":Landroid/content/ContentProviderOperation$Builder;
    const-string/jumbo v2, "raw_contact_id"

    move/from16 v0, v29

    invoke-virtual {v10, v2, v0}, Landroid/content/ContentProviderOperation$Builder;->withValueBackReference(Ljava/lang/String;I)Landroid/content/ContentProviderOperation$Builder;

    .line 556
    :goto_5
    const-string/jumbo v2, "mimetype"

    const-string/jumbo v3, "vnd.android.cursor.item/vnd.com.vkontakte.android.sendmsg"

    invoke-virtual {v10, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 557
    const-string/jumbo v2, "data1"

    move-object/from16 v0, p2

    iget v3, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;->uid:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v10, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 558
    const-string/jumbo v2, "data2"

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f08017e

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v10, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 559
    const-string/jumbo v2, "data3"

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f08017c

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v10, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 560
    invoke-virtual {v10}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v2

    move-object/from16 v0, p4

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 563
    .end local v10    # "builder":Landroid/content/ContentProviderOperation$Builder;
    :cond_b
    if-eqz v27, :cond_1d

    .line 564
    move-object/from16 v0, p3

    iget-wide v2, v0, Landroid/content/SyncStats;->numUpdates:J

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    move-object/from16 v0, p3

    iput-wide v2, v0, Landroid/content/SyncStats;->numUpdates:J

    .line 568
    :goto_6
    move-object/from16 v0, p3

    iget-wide v2, v0, Landroid/content/SyncStats;->numEntries:J

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    move-object/from16 v0, p3

    iput-wide v2, v0, Landroid/content/SyncStats;->numEntries:J

    .line 570
    const-string/jumbo v2, "vk"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Added/updated contact: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p2

    iget-object v4, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;->firstName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p2

    iget-object v4, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;->lastName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 572
    const/4 v2, 0x1

    return v2

    .line 408
    .end local v29    # "valueBack":I
    .restart local v15    # "curPhoto":Ljava/lang/String;
    .restart local v26    # "type":Ljava/lang/String;
    :cond_c
    const/16 v23, 0x0

    goto/16 :goto_0

    .line 410
    :cond_d
    :try_start_1
    move-object/from16 v0, p2

    iget-object v2, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;->photo:Ljava/lang/String;

    invoke-virtual {v15, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_e

    const/16 v23, 0x1

    :goto_7
    goto/16 :goto_0

    :cond_e
    const/16 v23, 0x0

    goto :goto_7

    .line 414
    .end local v15    # "curPhoto":Ljava/lang/String;
    :cond_f
    const-string/jumbo v2, "vnd.android.cursor.item/name"

    move-object/from16 v0, v26

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_12

    .line 415
    const-string/jumbo v2, "data2"

    move-object/from16 v0, v16

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    move-object/from16 v0, v16

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v12

    .line 416
    .local v12, "curFName":Ljava/lang/String;
    const-string/jumbo v2, "data3"

    move-object/from16 v0, v16

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    move-object/from16 v0, v16

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    .line 417
    .local v13, "curLName":Ljava/lang/String;
    move-object/from16 v0, p2

    iget-object v2, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;->firstName:Ljava/lang/String;

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_10

    move-object/from16 v0, p2

    iget-object v2, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;->lastName:Ljava/lang/String;

    invoke-virtual {v2, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_11

    :cond_10
    const/16 v20, 0x1

    .line 418
    :goto_8
    goto/16 :goto_1

    .line 417
    :cond_11
    const/16 v20, 0x0

    goto :goto_8

    .line 418
    .end local v12    # "curFName":Ljava/lang/String;
    .end local v13    # "curLName":Ljava/lang/String;
    :cond_12
    const-string/jumbo v2, "vnd.android.cursor.item/phone_v2"

    move-object/from16 v0, v26

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_14

    .line 419
    const-string/jumbo v2, "data1"

    move-object/from16 v0, v16

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    move-object/from16 v0, v16

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v14

    .line 420
    .local v14, "curPhone":Ljava/lang/String;
    move-object/from16 v0, p2

    iget-object v2, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;->phone:Ljava/lang/String;

    invoke-virtual {v14, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_13

    const/16 v21, 0x1

    .line 421
    :goto_9
    const/16 v22, 0x1

    .line 422
    goto/16 :goto_1

    .line 420
    :cond_13
    const/16 v21, 0x0

    goto :goto_9

    .line 422
    .end local v14    # "curPhone":Ljava/lang/String;
    :cond_14
    const-string/jumbo v2, "vnd.android.cursor.item/contact_event"

    move-object/from16 v0, v26

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_16

    .line 423
    const-string/jumbo v2, "data1"

    move-object/from16 v0, v16

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    move-object/from16 v0, v16

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    .line 424
    .local v11, "curBdate":Ljava/lang/String;
    move-object/from16 v0, p2

    iget-object v2, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;->bdate:Ljava/lang/String;

    invoke-virtual {v11, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_15

    const/4 v8, 0x1

    .line 425
    :goto_a
    const/4 v9, 0x1

    .line 426
    goto/16 :goto_1

    .line 424
    :cond_15
    const/4 v8, 0x0

    goto :goto_a

    .line 426
    .end local v11    # "curBdate":Ljava/lang/String;
    :cond_16
    const-string/jumbo v2, "vnd.android.cursor.item/vnd.com.vkontakte.android.sendmsg"

    move-object/from16 v0, v26

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result v2

    if-eqz v2, :cond_1

    .line 427
    const/16 v19, 0x1

    goto/16 :goto_1

    .line 460
    .end local v26    # "type":Ljava/lang/String;
    .restart local v29    # "valueBack":I
    :cond_17
    invoke-static/range {v17 .. v17}, Landroid/content/ContentProviderOperation;->newUpdate(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v10

    .line 461
    .restart local v10    # "builder":Landroid/content/ContentProviderOperation$Builder;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "raw_contact_id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move/from16 v0, v28

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " AND "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "mimetype"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "=\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "vnd.android.cursor.item/name"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v10, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withSelection(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/ContentProviderOperation$Builder;

    goto/16 :goto_2

    .line 504
    .end local v10    # "builder":Landroid/content/ContentProviderOperation$Builder;
    :cond_18
    if-nez v22, :cond_19

    .line 505
    invoke-static/range {v17 .. v17}, Landroid/content/ContentProviderOperation;->newInsert(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v10

    .line 506
    .restart local v10    # "builder":Landroid/content/ContentProviderOperation$Builder;
    const-string/jumbo v2, "raw_contact_id"

    invoke-static/range {v28 .. v28}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v10, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    goto/16 :goto_3

    .line 508
    .end local v10    # "builder":Landroid/content/ContentProviderOperation$Builder;
    :cond_19
    invoke-static/range {v17 .. v17}, Landroid/content/ContentProviderOperation;->newUpdate(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v10

    .line 509
    .restart local v10    # "builder":Landroid/content/ContentProviderOperation$Builder;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "raw_contact_id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move/from16 v0, v28

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " AND "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "mimetype"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "=\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "vnd.android.cursor.item/phone_v2"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v10, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withSelection(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/ContentProviderOperation$Builder;

    goto/16 :goto_3

    .line 523
    .end local v10    # "builder":Landroid/content/ContentProviderOperation$Builder;
    :cond_1a
    if-nez v9, :cond_1b

    .line 524
    invoke-static/range {v17 .. v17}, Landroid/content/ContentProviderOperation;->newInsert(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v10

    .line 525
    .restart local v10    # "builder":Landroid/content/ContentProviderOperation$Builder;
    const-string/jumbo v2, "raw_contact_id"

    invoke-static/range {v28 .. v28}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v10, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    goto/16 :goto_4

    .line 527
    .end local v10    # "builder":Landroid/content/ContentProviderOperation$Builder;
    :cond_1b
    invoke-static/range {v17 .. v17}, Landroid/content/ContentProviderOperation;->newUpdate(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v10

    .line 528
    .restart local v10    # "builder":Landroid/content/ContentProviderOperation$Builder;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "raw_contact_id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move/from16 v0, v28

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " AND "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "mimetype"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "=\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "vnd.android.cursor.item/contact_event"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v10, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withSelection(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/ContentProviderOperation$Builder;

    goto/16 :goto_4

    .line 553
    .end local v10    # "builder":Landroid/content/ContentProviderOperation$Builder;
    :cond_1c
    invoke-static/range {v17 .. v17}, Landroid/content/ContentProviderOperation;->newInsert(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v10

    .line 554
    .restart local v10    # "builder":Landroid/content/ContentProviderOperation$Builder;
    const-string/jumbo v2, "raw_contact_id"

    invoke-static/range {v28 .. v28}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v10, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    goto/16 :goto_5

    .line 566
    .end local v10    # "builder":Landroid/content/ContentProviderOperation$Builder;
    :cond_1d
    move-object/from16 v0, p3

    iget-wide v2, v0, Landroid/content/SyncStats;->numInserts:J

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    move-object/from16 v0, p3

    iput-wide v2, v0, Landroid/content/SyncStats;->numInserts:J

    goto/16 :goto_6

    .line 429
    .end local v29    # "valueBack":I
    :catch_0
    move-exception v2

    goto/16 :goto_1
.end method

.method public static getLocalPhoneNumbers(Landroid/content/ContentResolver;)Ljava/util/ArrayList;
    .locals 12
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/ContentResolver;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 576
    sget-object v1, Landroid/provider/ContactsContract$RawContacts;->CONTENT_URI:Landroid/net/Uri;

    const/4 v0, 0x2

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string/jumbo v3, "account_type"

    aput-object v3, v2, v0

    const/4 v0, 0x1

    const-string/jumbo v3, "_id"

    aput-object v3, v2, v0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 577
    .local v6, "cursor":Landroid/database/Cursor;
    if-eqz v6, :cond_0

    invoke-interface {v6}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-nez v0, :cond_1

    .line 578
    :cond_0
    const-string/jumbo v0, "vk"

    const-string/jumbo v1, "cursor.getCount = 0 || cursor==null"

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 579
    const/4 v11, 0x0

    .line 615
    :goto_0
    return-object v11

    .line 581
    :cond_1
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 582
    .local v10, "idsToGet":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Long;>;"
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    .line 584
    :cond_2
    const-string/jumbo v0, "com.vkontakte.account"

    const-string/jumbo v1, "account_type"

    invoke-interface {v6, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v6, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 585
    const-string/jumbo v0, "_id"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v10, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 589
    :cond_3
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-nez v0, :cond_2

    .line 590
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_4

    .line 591
    const-string/jumbo v0, "vk"

    const-string/jumbo v1, "idsToGet.size = 0"

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 592
    const/4 v11, 0x0

    goto :goto_0

    .line 594
    :cond_4
    const-string/jumbo v7, ""

    .line 595
    .local v7, "ids":Ljava/lang/String;
    invoke-virtual {v10}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    .line 596
    .local v8, "id":J
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v2, ","

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 597
    goto :goto_1

    .line 598
    .end local v8    # "id":J
    :cond_5
    const/4 v0, 0x1

    invoke-virtual {v7, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    .line 600
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 601
    .local v11, "numbers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 603
    sget-object v1, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string/jumbo v3, "data1"

    aput-object v3, v2, v0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "mimetype=\'vnd.android.cursor.item/phone_v2\' AND data2=2 AND raw_contact_id IN ("

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v3, ")"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 605
    if-eqz v6, :cond_6

    invoke-interface {v6}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-nez v0, :cond_7

    .line 606
    :cond_6
    const-string/jumbo v0, "vk"

    const-string/jumbo v1, "cursor2.getCount = 0"

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 607
    const/4 v11, 0x0

    goto/16 :goto_0

    .line 609
    :cond_7
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    .line 612
    :cond_8
    const-string/jumbo v0, "data1"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v11, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 613
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-nez v0, :cond_8

    .line 614
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    goto/16 :goto_0
.end method

.method private static getLocalUids()Ljava/util/Vector;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Vector",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 370
    new-instance v7, Ljava/util/Vector;

    invoke-direct {v7}, Ljava/util/Vector;-><init>()V

    .line 371
    .local v7, "ret":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/Integer;>;"
    sget-object v0, Lcom/vkontakte/android/ContactsSyncAdapterService;->resolver:Landroid/content/ContentResolver;

    sget-object v1, Landroid/provider/ContactsContract$RawContacts;->CONTENT_URI:Landroid/net/Uri;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string/jumbo v5, "sync1"

    aput-object v5, v2, v3

    const-string/jumbo v3, "account_type=\'com.vkontakte.account\'"

    move-object v5, v4

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 372
    .local v6, "cursor":Landroid/database/Cursor;
    if-eqz v6, :cond_1

    invoke-interface {v6}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-lez v0, :cond_1

    .line 373
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    .line 375
    :cond_0
    const-string/jumbo v0, "sync1"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v7, v0}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 377
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-nez v0, :cond_0

    .line 379
    :cond_1
    if-eqz v6, :cond_2

    .line 380
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 382
    :cond_2
    return-object v7
.end method

.method public static getMaxContactPhotoSize(Landroid/content/Context;)I
    .locals 7
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v5, 0x0

    const/4 v3, 0x0

    .line 147
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0xe

    if-lt v0, v4, :cond_0

    .line 149
    sget-object v1, Landroid/provider/ContactsContract$DisplayPhoto;->CONTENT_MAX_DIMENSIONS_URI:Landroid/net/Uri;

    .line 150
    .local v1, "uri":Landroid/net/Uri;
    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/String;

    const-string/jumbo v0, "display_max_dim"

    aput-object v0, v2, v5

    .line 151
    .local v2, "projection":[Ljava/lang/String;
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 153
    .local v6, "c":Landroid/database/Cursor;
    :try_start_0
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    .line 154
    const/4 v0, 0x0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getInt(I)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    .line 156
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 160
    .end local v1    # "uri":Landroid/net/Uri;
    .end local v2    # "projection":[Ljava/lang/String;
    .end local v6    # "c":Landroid/database/Cursor;
    :goto_0
    return v0

    .line 156
    .restart local v1    # "uri":Landroid/net/Uri;
    .restart local v2    # "projection":[Ljava/lang/String;
    .restart local v6    # "c":Landroid/database/Cursor;
    :catchall_0
    move-exception v0

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    throw v0

    .line 160
    .end local v1    # "uri":Landroid/net/Uri;
    .end local v2    # "projection":[Ljava/lang/String;
    .end local v6    # "c":Landroid/database/Cursor;
    :cond_0
    const/16 v0, 0x60

    goto :goto_0
.end method

.method private static getProfile(Lorg/json/JSONObject;)Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;
    .locals 48
    .param p0, "user"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 94
    new-instance v27, Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;

    invoke-direct/range {v27 .. v27}, Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;-><init>()V

    .line 95
    .local v27, "up":Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;
    const-string/jumbo v40, "id"

    move-object/from16 v0, p0

    move-object/from16 v1, v40

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v40

    move/from16 v0, v40

    move-object/from16 v1, v27

    iput v0, v1, Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;->uid:I

    .line 96
    const-string/jumbo v40, "first_name"

    move-object/from16 v0, p0

    move-object/from16 v1, v40

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v40

    move-object/from16 v0, v40

    move-object/from16 v1, v27

    iput-object v0, v1, Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;->firstName:Ljava/lang/String;

    .line 97
    const-string/jumbo v40, "last_name"

    move-object/from16 v0, p0

    move-object/from16 v1, v40

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v40

    move-object/from16 v0, v40

    move-object/from16 v1, v27

    iput-object v0, v1, Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;->lastName:Ljava/lang/String;

    .line 98
    const-string/jumbo v40, "photo_200"

    const-string/jumbo v41, "photo_100"

    move-object/from16 v0, p0

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v41

    move-object/from16 v0, p0

    move-object/from16 v1, v40

    move-object/from16 v2, v41

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v40

    move-object/from16 v0, v40

    move-object/from16 v1, v27

    iput-object v0, v1, Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;->photo:Ljava/lang/String;

    .line 99
    const/16 v40, 0x0

    move-object/from16 v0, v40

    move-object/from16 v1, v27

    iput-object v0, v1, Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;->phone:Ljava/lang/String;

    .line 100
    const-string/jumbo v40, "phone"

    move-object/from16 v0, p0

    move-object/from16 v1, v40

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v40

    if-eqz v40, :cond_4

    .line 101
    const-string/jumbo v40, "phone"

    move-object/from16 v0, p0

    move-object/from16 v1, v40

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v40

    move-object/from16 v0, v40

    move-object/from16 v1, v27

    iput-object v0, v1, Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;->phone:Ljava/lang/String;

    .line 115
    :cond_0
    :goto_0
    const-string/jumbo v40, "nickname"

    move-object/from16 v0, p0

    move-object/from16 v1, v40

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v40

    move-object/from16 v0, v40

    move-object/from16 v1, v27

    iput-object v0, v1, Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;->nickname:Ljava/lang/String;

    .line 116
    const-string/jumbo v40, "bdate"

    move-object/from16 v0, p0

    move-object/from16 v1, v40

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v40

    if-eqz v40, :cond_8

    .line 117
    const-string/jumbo v40, "bdate"

    move-object/from16 v0, p0

    move-object/from16 v1, v40

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v40

    const-string/jumbo v41, "\\."

    invoke-virtual/range {v40 .. v41}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 118
    .local v4, "bd":[Ljava/lang/String;
    array-length v0, v4

    move/from16 v40, v0

    const/16 v41, 0x3

    move/from16 v0, v40

    move/from16 v1, v41

    if-ne v0, v1, :cond_1

    .line 119
    const-string/jumbo v40, "%d-%02d-%02d"

    const/16 v41, 0x3

    move/from16 v0, v41

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v41, v0

    const/16 v42, 0x0

    const/16 v43, 0x2

    aget-object v43, v4, v43

    invoke-static/range {v43 .. v43}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v43

    invoke-static/range {v43 .. v43}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v43

    aput-object v43, v41, v42

    const/16 v42, 0x1

    const/16 v43, 0x1

    aget-object v43, v4, v43

    invoke-static/range {v43 .. v43}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v43

    invoke-static/range {v43 .. v43}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v43

    aput-object v43, v41, v42

    const/16 v42, 0x2

    const/16 v43, 0x0

    aget-object v43, v4, v43

    invoke-static/range {v43 .. v43}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v43

    invoke-static/range {v43 .. v43}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v43

    aput-object v43, v41, v42

    invoke-static/range {v40 .. v41}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v40

    move-object/from16 v0, v40

    move-object/from16 v1, v27

    iput-object v0, v1, Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;->bdate:Ljava/lang/String;

    .line 121
    :cond_1
    array-length v0, v4

    move/from16 v40, v0

    const/16 v41, 0x2

    move/from16 v0, v40

    move/from16 v1, v41

    if-ne v0, v1, :cond_2

    .line 122
    const-string/jumbo v40, "0000-%02d-%02d"

    const/16 v41, 0x2

    move/from16 v0, v41

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v41, v0

    const/16 v42, 0x0

    const/16 v43, 0x1

    aget-object v43, v4, v43

    invoke-static/range {v43 .. v43}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v43

    invoke-static/range {v43 .. v43}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v43

    aput-object v43, v41, v42

    const/16 v42, 0x1

    const/16 v43, 0x0

    aget-object v43, v4, v43

    invoke-static/range {v43 .. v43}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v43

    invoke-static/range {v43 .. v43}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v43

    aput-object v43, v41, v42

    invoke-static/range {v40 .. v41}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v40

    move-object/from16 v0, v40

    move-object/from16 v1, v27

    iput-object v0, v1, Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;->bdate:Ljava/lang/String;

    .line 127
    .end local v4    # "bd":[Ljava/lang/String;
    :cond_2
    :goto_1
    const-string/jumbo v40, "crop_photo"

    move-object/from16 v0, p0

    move-object/from16 v1, v40

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v40

    if-eqz v40, :cond_3

    .line 128
    const-string/jumbo v40, "crop_photo"

    move-object/from16 v0, p0

    move-object/from16 v1, v40

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    .line 129
    .local v6, "cp":Lorg/json/JSONObject;
    new-instance v40, Lcom/vkontakte/android/Photo;

    const-string/jumbo v41, "photo"

    move-object/from16 v0, v41

    invoke-virtual {v6, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v41

    invoke-direct/range {v40 .. v41}, Lcom/vkontakte/android/Photo;-><init>(Lorg/json/JSONObject;)V

    move-object/from16 v0, v40

    move-object/from16 v1, v27

    iput-object v0, v1, Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;->bigPhoto:Lcom/vkontakte/android/Photo;

    .line 130
    const-string/jumbo v40, "rect"

    move-object/from16 v0, v40

    invoke-virtual {v6, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v26

    .line 131
    .local v26, "rect":Lorg/json/JSONObject;
    const-string/jumbo v40, "crop"

    move-object/from16 v0, v40

    invoke-virtual {v6, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    .line 132
    .local v7, "crop":Lorg/json/JSONObject;
    const-string/jumbo v40, "x"

    move-object/from16 v0, v40

    invoke-virtual {v7, v0}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v12

    .local v12, "cropX1":D
    const-string/jumbo v40, "x2"

    move-object/from16 v0, v40

    invoke-virtual {v7, v0}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v14

    .local v14, "cropX2":D
    const-string/jumbo v40, "y"

    move-object/from16 v0, v40

    invoke-virtual {v7, v0}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v16

    .local v16, "cropY1":D
    const-string/jumbo v40, "y2"

    move-object/from16 v0, v40

    invoke-virtual {v7, v0}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v18

    .line 133
    .local v18, "cropY2":D
    const-string/jumbo v40, "x"

    move-object/from16 v0, v26

    move-object/from16 v1, v40

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v32

    .local v32, "rectX1":D
    const-string/jumbo v40, "x2"

    move-object/from16 v0, v26

    move-object/from16 v1, v40

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v34

    .local v34, "rectX2":D
    const-string/jumbo v40, "y"

    move-object/from16 v0, v26

    move-object/from16 v1, v40

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v36

    .local v36, "rectY1":D
    const-string/jumbo v40, "y2"

    move-object/from16 v0, v26

    move-object/from16 v1, v40

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v38

    .line 134
    .local v38, "rectY2":D
    sub-double v40, v14, v12

    const-wide/high16 v42, 0x4059000000000000L    # 100.0

    div-double v10, v40, v42

    .line 135
    .local v10, "cropW":D
    sub-double v40, v18, v16

    const-wide/high16 v42, 0x4059000000000000L    # 100.0

    div-double v8, v40, v42

    .line 136
    .local v8, "cropH":D
    sub-double v40, v34, v32

    const-wide/high16 v42, 0x4059000000000000L    # 100.0

    div-double v30, v40, v42

    .line 137
    .local v30, "rectW":D
    sub-double v40, v38, v36

    const-wide/high16 v42, 0x4059000000000000L    # 100.0

    div-double v28, v40, v42

    .line 138
    .local v28, "rectH":D
    mul-double v22, v30, v10

    .line 139
    .local v22, "destW":D
    mul-double v20, v28, v8

    .line 140
    .local v20, "destH":D
    new-instance v40, Landroid/graphics/RectF;

    const-wide/high16 v42, 0x4059000000000000L    # 100.0

    div-double v42, v12, v42

    const-wide/high16 v44, 0x4059000000000000L    # 100.0

    div-double v44, v32, v44

    mul-double v44, v44, v10

    add-double v42, v42, v44

    move-wide/from16 v0, v42

    double-to-float v0, v0

    move/from16 v41, v0

    const-wide/high16 v42, 0x4059000000000000L    # 100.0

    div-double v42, v16, v42

    const-wide/high16 v44, 0x4059000000000000L    # 100.0

    div-double v44, v36, v44

    mul-double v44, v44, v8

    add-double v42, v42, v44

    move-wide/from16 v0, v42

    double-to-float v0, v0

    move/from16 v42, v0

    const-wide/high16 v44, 0x4059000000000000L    # 100.0

    div-double v44, v12, v44

    const-wide/high16 v46, 0x4059000000000000L    # 100.0

    div-double v46, v32, v46

    mul-double v46, v46, v10

    add-double v44, v44, v46

    add-double v44, v44, v22

    move-wide/from16 v0, v44

    double-to-float v0, v0

    move/from16 v43, v0

    const-wide/high16 v44, 0x4059000000000000L    # 100.0

    div-double v44, v16, v44

    const-wide/high16 v46, 0x4059000000000000L    # 100.0

    div-double v46, v36, v46

    mul-double v46, v46, v8

    add-double v44, v44, v46

    add-double v44, v44, v20

    move-wide/from16 v0, v44

    double-to-float v0, v0

    move/from16 v44, v0

    invoke-direct/range {v40 .. v44}, Landroid/graphics/RectF;-><init>(FFFF)V

    move-object/from16 v0, v40

    move-object/from16 v1, v27

    iput-object v0, v1, Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;->photoCropRect:Landroid/graphics/RectF;

    .line 141
    const-string/jumbo v40, "vk"

    new-instance v41, Ljava/lang/StringBuilder;

    invoke-direct/range {v41 .. v41}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v42, "CropRect = "

    invoke-virtual/range {v41 .. v42}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v41

    move-object/from16 v0, v27

    iget-object v0, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;->photoCropRect:Landroid/graphics/RectF;

    move-object/from16 v42, v0

    invoke-virtual/range {v41 .. v42}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v41

    invoke-virtual/range {v41 .. v41}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v41

    invoke-static/range {v40 .. v41}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 143
    .end local v6    # "cp":Lorg/json/JSONObject;
    .end local v7    # "crop":Lorg/json/JSONObject;
    .end local v8    # "cropH":D
    .end local v10    # "cropW":D
    .end local v12    # "cropX1":D
    .end local v14    # "cropX2":D
    .end local v16    # "cropY1":D
    .end local v18    # "cropY2":D
    .end local v20    # "destH":D
    .end local v22    # "destW":D
    .end local v26    # "rect":Lorg/json/JSONObject;
    .end local v28    # "rectH":D
    .end local v30    # "rectW":D
    .end local v32    # "rectX1":D
    .end local v34    # "rectX2":D
    .end local v36    # "rectY1":D
    .end local v38    # "rectY2":D
    :cond_3
    return-object v27

    .line 102
    :cond_4
    const-string/jumbo v40, "mobile_phone"

    move-object/from16 v0, p0

    move-object/from16 v1, v40

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v40

    if-eqz v40, :cond_0

    .line 103
    const-string/jumbo v40, "mobile_phone"

    move-object/from16 v0, p0

    move-object/from16 v1, v40

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v25

    .line 104
    .local v25, "ph":Ljava/lang/String;
    invoke-virtual/range {v25 .. v25}, Ljava/lang/String;->toCharArray()[C

    move-result-object v24

    .line 105
    .local v24, "pc":[C
    const-string/jumbo v25, ""

    .line 106
    move-object/from16 v0, v24

    array-length v0, v0

    move/from16 v41, v0

    const/16 v40, 0x0

    :goto_2
    move/from16 v0, v40

    move/from16 v1, v41

    if-ge v0, v1, :cond_7

    aget-char v5, v24, v40

    .line 107
    .local v5, "c":C
    invoke-static {v5}, Ljava/lang/Character;->isDigit(C)Z

    move-result v42

    if-nez v42, :cond_5

    const/16 v42, 0x2b

    move/from16 v0, v42

    if-ne v5, v0, :cond_6

    .line 108
    :cond_5
    new-instance v42, Ljava/lang/StringBuilder;

    invoke-direct/range {v42 .. v42}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v42

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v42

    move-object/from16 v0, v42

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v42

    invoke-virtual/range {v42 .. v42}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    .line 106
    :cond_6
    add-int/lit8 v40, v40, 0x1

    goto :goto_2

    .line 111
    .end local v5    # "c":C
    :cond_7
    invoke-virtual/range {v25 .. v25}, Ljava/lang/String;->length()I

    move-result v40

    if-lez v40, :cond_0

    .line 112
    move-object/from16 v0, v25

    move-object/from16 v1, v27

    iput-object v0, v1, Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;->phone:Ljava/lang/String;

    goto/16 :goto_0

    .line 125
    .end local v24    # "pc":[C
    .end local v25    # "ph":Ljava/lang/String;
    :cond_8
    const/16 v40, 0x0

    move-object/from16 v0, v40

    move-object/from16 v1, v27

    iput-object v0, v1, Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;->bdate:Ljava/lang/String;

    goto/16 :goto_1
.end method

.method private getSyncAdapter()Lcom/vkontakte/android/ContactsSyncAdapterService$SyncAdapterImpl;
    .locals 1

    .prologue
    .line 87
    sget-object v0, Lcom/vkontakte/android/ContactsSyncAdapterService;->syncAdapter:Lcom/vkontakte/android/ContactsSyncAdapterService$SyncAdapterImpl;

    if-nez v0, :cond_0

    .line 88
    new-instance v0, Lcom/vkontakte/android/ContactsSyncAdapterService$SyncAdapterImpl;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/ContactsSyncAdapterService$SyncAdapterImpl;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/vkontakte/android/ContactsSyncAdapterService;->syncAdapter:Lcom/vkontakte/android/ContactsSyncAdapterService$SyncAdapterImpl;

    .line 90
    :cond_0
    sget-object v0, Lcom/vkontakte/android/ContactsSyncAdapterService;->syncAdapter:Lcom/vkontakte/android/ContactsSyncAdapterService$SyncAdapterImpl;

    return-object v0
.end method

.method private static performSync(Landroid/content/Context;Landroid/accounts/Account;Landroid/os/Bundle;Ljava/lang/String;Landroid/content/ContentProviderClient;Landroid/content/SyncResult;)V
    .locals 26
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "account"    # Landroid/accounts/Account;
    .param p2, "extras"    # Landroid/os/Bundle;
    .param p3, "authority"    # Ljava/lang/String;
    .param p4, "provider"    # Landroid/content/ContentProviderClient;
    .param p5, "syncResult"    # Landroid/content/SyncResult;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/accounts/OperationCanceledException;
        }
    .end annotation

    .prologue
    .line 166
    :try_start_0
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    sput-object v2, Lcom/vkontakte/android/ContactsSyncAdapterService;->resolver:Landroid/content/ContentResolver;

    .line 167
    const-string/jumbo v2, "vk"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "performSync: "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual/range {p1 .. p1}, Landroid/accounts/Account;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 169
    invoke-static/range {p0 .. p0}, Lcom/vkontakte/android/ContactsSyncAdapterService;->getMaxContactPhotoSize(Landroid/content/Context;)I

    move-result v2

    sput v2, Lcom/vkontakte/android/ContactsSyncAdapterService;->maxPhotoSize:I

    .line 171
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    sput-object v2, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    .line 173
    invoke-virtual/range {p5 .. p5}, Landroid/content/SyncResult;->clear()V

    .line 174
    const/4 v2, 0x0

    move-object/from16 v0, p5

    iput-boolean v2, v0, Landroid/content/SyncResult;->fullSyncRequested:Z

    .line 176
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sget-wide v24, Lcom/vkontakte/android/ContactsSyncAdapterService;->lastSyncTime:J

    sub-long v2, v2, v24

    const-wide/32 v24, 0x493e0

    cmp-long v2, v2, v24

    if-gez v2, :cond_1

    .line 178
    const-string/jumbo v2, "vk"

    const-string/jumbo v3, "too many retries"

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 367
    :cond_0
    :goto_0
    return-void

    .line 182
    :cond_1
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const/4 v3, 0x0

    const/4 v5, 0x0

    invoke-virtual {v2, v3, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v16

    .line 184
    .local v16, "prefs":Landroid/content/SharedPreferences;
    const-string/jumbo v2, "sync_all"

    const/4 v3, 0x0

    move-object/from16 v0, v16

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v17

    .line 185
    .local v17, "syncAllFriends":Z
    new-instance v8, Ljava/util/Vector;

    invoke-direct {v8}, Ljava/util/Vector;-><init>()V

    .line 187
    .local v8, "contacts":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;>;"
    const-string/jumbo v2, "sync_hq_photos"

    const/4 v3, 0x0

    move-object/from16 v0, v16

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_3

    const-string/jumbo v22, ",crop_photo"

    .line 189
    .local v22, "xfields":Ljava/lang/String;
    :goto_1
    sget-object v2, Lcom/vkontakte/android/ContactsSyncAdapterService;->resolver:Landroid/content/ContentResolver;

    invoke-static {v2}, Lcom/vkontakte/android/ContactsSyncAdapterService;->getLocalPhoneNumbers(Landroid/content/ContentResolver;)Ljava/util/ArrayList;

    move-result-object v14

    .line 190
    .local v14, "numbers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    if-eqz v14, :cond_2

    invoke-virtual {v14}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-nez v2, :cond_4

    .line 191
    :cond_2
    const-string/jumbo v2, "vk"

    const-string/jumbo v3, "No local numbers"

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 192
    if-eqz v17, :cond_0

    .line 229
    :goto_2
    move-object/from16 v0, p5

    iget-boolean v2, v0, Landroid/content/SyncResult;->databaseError:Z

    if-nez v2, :cond_0

    .line 233
    if-eqz v17, :cond_6

    .line 234
    const/4 v2, 0x0

    sput-boolean v2, Lcom/vkontakte/android/ContactsSyncAdapterService;->success:Z

    .line 235
    const/4 v2, 0x3

    sput v2, Lcom/vkontakte/android/ContactsSyncAdapterService;->tries:I

    .line 236
    :goto_3
    sget v2, Lcom/vkontakte/android/ContactsSyncAdapterService;->tries:I

    if-lez v2, :cond_5

    sget-boolean v2, Lcom/vkontakte/android/ContactsSyncAdapterService;->success:Z

    if-nez v2, :cond_5

    .line 237
    new-instance v2, Lcom/vkontakte/android/api/VKAPIRequest;

    const-string/jumbo v3, "friends.get"

    invoke-direct {v2, v3}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    const-string/jumbo v3, "fields"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v23, "photo_100,photo_200,bdate,contacts"

    move-object/from16 v0, v23

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, v22

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 238
    invoke-virtual {v2, v3, v5}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    const-string/jumbo v3, "photo_sizes"

    const/4 v5, 0x1

    .line 239
    invoke-virtual {v2, v3, v5}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    new-instance v3, Lcom/vkontakte/android/ContactsSyncAdapterService$2;

    invoke-direct {v3, v8}, Lcom/vkontakte/android/ContactsSyncAdapterService$2;-><init>(Ljava/util/Vector;)V

    .line 240
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/VKAPIRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    .line 273
    invoke-virtual {v2}, Lcom/vkontakte/android/api/VKAPIRequest;->execSync()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    .line 363
    .end local v8    # "contacts":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;>;"
    .end local v14    # "numbers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v16    # "prefs":Landroid/content/SharedPreferences;
    .end local v17    # "syncAllFriends":Z
    .end local v22    # "xfields":Ljava/lang/String;
    :catch_0
    move-exception v21

    .line 364
    .local v21, "x":Ljava/lang/Exception;
    const-string/jumbo v2, "vk"

    move-object/from16 v0, v21

    invoke-static {v2, v0}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 365
    const/4 v2, 0x1

    move-object/from16 v0, p5

    iput-boolean v2, v0, Landroid/content/SyncResult;->databaseError:Z

    goto/16 :goto_0

    .line 187
    .end local v21    # "x":Ljava/lang/Exception;
    .restart local v8    # "contacts":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;>;"
    .restart local v16    # "prefs":Landroid/content/SharedPreferences;
    .restart local v17    # "syncAllFriends":Z
    :cond_3
    :try_start_1
    const-string/jumbo v22, ""

    goto :goto_1

    .line 197
    .restart local v14    # "numbers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v22    # "xfields":Ljava/lang/String;
    :cond_4
    const-string/jumbo v2, ","

    invoke-static {v2, v14}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v13

    .line 201
    .local v13, "ns":Ljava/lang/String;
    new-instance v2, Lcom/vkontakte/android/api/VKAPIRequest;

    const-string/jumbo v3, "friends.getByPhones"

    invoke-direct {v2, v3}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    const-string/jumbo v3, "fields"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v23, "photo_100,photo_200,bdate,contacts"

    move-object/from16 v0, v23

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, v22

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 202
    invoke-virtual {v2, v3, v5}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    const-string/jumbo v3, "phones"

    .line 203
    invoke-virtual {v2, v3, v13}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    const-string/jumbo v3, "photo_sizes"

    const/4 v5, 0x1

    .line 204
    invoke-virtual {v2, v3, v5}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    new-instance v3, Lcom/vkontakte/android/ContactsSyncAdapterService$1;

    move/from16 v0, v17

    move-object/from16 v1, p5

    invoke-direct {v3, v8, v0, v1}, Lcom/vkontakte/android/ContactsSyncAdapterService$1;-><init>(Ljava/util/Vector;ZLandroid/content/SyncResult;)V

    .line 205
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/VKAPIRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    .line 226
    invoke-virtual {v2}, Lcom/vkontakte/android/api/VKAPIRequest;->execSync()Z

    goto/16 :goto_2

    .line 275
    .end local v13    # "ns":Ljava/lang/String;
    :cond_5
    sget-boolean v2, Lcom/vkontakte/android/ContactsSyncAdapterService;->success:Z

    if-nez v2, :cond_6

    .line 276
    const/4 v2, 0x1

    move-object/from16 v0, p5

    iput-boolean v2, v0, Landroid/content/SyncResult;->databaseError:Z

    .line 280
    :cond_6
    move-object/from16 v0, p5

    iget-boolean v2, v0, Landroid/content/SyncResult;->databaseError:Z

    if-nez v2, :cond_0

    .line 284
    invoke-static {}, Lcom/vkontakte/android/ContactsSyncAdapterService;->getLocalUids()Ljava/util/Vector;

    move-result-object v11

    .line 285
    .local v11, "localUids":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/Integer;>;"
    invoke-virtual {v11}, Ljava/util/Vector;->size()I

    move-result v12

    .line 287
    .local v12, "ls":I
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 288
    .local v6, "operationList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/content/ContentProviderOperation;>;"
    new-instance v7, Ljava/util/Vector;

    invoke-direct {v7}, Ljava/util/Vector;-><init>()V

    .line 290
    .local v7, "photoUpdates":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/vkontakte/android/ContactsSyncAdapterService$PhotoUpdateRequest;>;"
    invoke-virtual {v8}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v23

    :cond_7
    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_a

    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;

    .line 291
    .local v4, "p":Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;
    move-object/from16 v0, p5

    iget-object v5, v0, Landroid/content/SyncResult;->stats:Landroid/content/SyncStats;

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    invoke-static/range {v2 .. v7}, Lcom/vkontakte/android/ContactsSyncAdapterService;->addOrUpdateContact(Landroid/content/Context;Landroid/accounts/Account;Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;Landroid/content/SyncStats;Ljava/util/ArrayList;Ljava/util/Vector;)Z

    move-result v2

    if-nez v2, :cond_8

    .line 294
    const-string/jumbo v2, "vk"

    const-string/jumbo v3, "Update contact error!!!"

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 296
    :cond_8
    iget v2, v4, Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;->uid:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v11, v2}, Ljava/util/Vector;->remove(Ljava/lang/Object;)Z

    .line 298
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/16 v3, 0x32

    if-lt v2, v3, :cond_9

    .line 299
    const-string/jumbo v2, "vk"

    const-string/jumbo v3, "Applying DB changes!"

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 300
    sget-object v2, Lcom/vkontakte/android/ContactsSyncAdapterService;->resolver:Landroid/content/ContentResolver;

    const-string/jumbo v3, "com.android.contacts"

    invoke-virtual {v2, v3, v6}, Landroid/content/ContentResolver;->applyBatch(Ljava/lang/String;Ljava/util/ArrayList;)[Landroid/content/ContentProviderResult;

    .line 301
    invoke-virtual {v6}, Ljava/util/ArrayList;->clear()V

    .line 302
    const-string/jumbo v2, "vk"

    const-string/jumbo v3, "Contacts updated"

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 304
    :cond_9
    sget-boolean v2, Lcom/vkontakte/android/ContactsSyncAdapterService;->needCancel:Z

    if-eqz v2, :cond_7

    .line 305
    const-string/jumbo v2, "vk"

    const-string/jumbo v3, "need cancel!"

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 306
    const/4 v2, 0x0

    sput-boolean v2, Lcom/vkontakte/android/ContactsSyncAdapterService;->needCancel:Z

    goto/16 :goto_0

    .line 311
    .end local v4    # "p":Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;
    :cond_a
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_b

    .line 312
    const-string/jumbo v2, "vk"

    const-string/jumbo v3, "Applying DB changes!"

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 314
    :try_start_2
    sget-object v2, Lcom/vkontakte/android/ContactsSyncAdapterService;->resolver:Landroid/content/ContentResolver;

    const-string/jumbo v3, "com.android.contacts"

    invoke-virtual {v2, v3, v6}, Landroid/content/ContentResolver;->applyBatch(Ljava/lang/String;Ljava/util/ArrayList;)[Landroid/content/ContentProviderResult;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 320
    :try_start_3
    const-string/jumbo v2, "vk"

    const-string/jumbo v3, "Contacts updated"

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 325
    :goto_4
    const-string/jumbo v2, "vk"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Will update "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v7}, Ljava/util/Vector;->size()I

    move-result v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v5, " photos..."

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 326
    new-instance v19, Ljava/util/ArrayList;

    invoke-direct/range {v19 .. v19}, Ljava/util/ArrayList;-><init>()V

    .line 327
    .local v19, "threads":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Thread;>;"
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_5
    const/4 v2, 0x5

    if-ge v10, v2, :cond_c

    .line 328
    new-instance v18, Ljava/lang/Thread;

    new-instance v2, Lcom/vkontakte/android/ContactsSyncAdapterService$PhotoDownloader;

    const/4 v3, 0x5

    invoke-direct {v2, v7, v10, v3}, Lcom/vkontakte/android/ContactsSyncAdapterService$PhotoDownloader;-><init>(Ljava/util/Vector;II)V

    move-object/from16 v0, v18

    invoke-direct {v0, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 329
    .local v18, "t":Ljava/lang/Thread;
    move-object/from16 v0, v19

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 330
    invoke-virtual/range {v18 .. v18}, Ljava/lang/Thread;->start()V

    .line 331
    const-string/jumbo v2, "vk"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Started DL thread #"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 327
    add-int/lit8 v10, v10, 0x1

    goto :goto_5

    .line 315
    .end local v10    # "i":I
    .end local v18    # "t":Ljava/lang/Thread;
    .end local v19    # "threads":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Thread;>;"
    :catch_1
    move-exception v21

    .line 316
    .restart local v21    # "x":Ljava/lang/Exception;
    const-string/jumbo v2, "vk"

    const-string/jumbo v3, "OH SHI~"

    move-object/from16 v0, v21

    invoke-static {v2, v3, v0}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 317
    const/4 v2, 0x1

    move-object/from16 v0, p5

    iput-boolean v2, v0, Landroid/content/SyncResult;->databaseError:Z

    goto/16 :goto_0

    .line 322
    .end local v21    # "x":Ljava/lang/Exception;
    :cond_b
    const-string/jumbo v2, "vk"

    const-string/jumbo v3, "Nothing to update"

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4

    .line 335
    .restart local v10    # "i":I
    .restart local v19    # "threads":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Thread;>;"
    :cond_c
    const-string/jumbo v2, "vk"

    const-string/jumbo v3, "Sync thread waiting for photo downloads"

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 336
    sget-object v2, Lcom/vkontakte/android/ContactsSyncAdapterService;->photoDownloadBarrier:Ljava/util/concurrent/CyclicBarrier;

    invoke-virtual {v2}, Ljava/util/concurrent/CyclicBarrier;->await()I

    .line 337
    const-string/jumbo v2, "vk"

    const-string/jumbo v3, "Sync thread: photo downloads complete"

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 340
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 342
    .local v9, "delOps":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/content/ContentProviderOperation;>;"
    invoke-virtual {v11}, Ljava/util/Vector;->size()I

    move-result v2

    if-lez v2, :cond_d

    invoke-virtual {v11}, Ljava/util/Vector;->size()I

    move-result v2

    if-ge v2, v12, :cond_d

    .line 343
    const-string/jumbo v2, ","

    invoke-static {v2, v11}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v20

    .line 344
    .local v20, "uids":Ljava/lang/String;
    move-object/from16 v0, p5

    iget-object v2, v0, Landroid/content/SyncResult;->stats:Landroid/content/SyncStats;

    invoke-virtual {v11}, Ljava/util/Vector;->size()I

    move-result v3

    int-to-long v0, v3

    move-wide/from16 v24, v0

    move-wide/from16 v0, v24

    iput-wide v0, v2, Landroid/content/SyncStats;->numDeletes:J

    .line 345
    sget-object v2, Landroid/provider/ContactsContract$RawContacts;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v2

    const-string/jumbo v3, "caller_is_syncadapter"

    const-string/jumbo v5, "true"

    invoke-virtual {v2, v3, v5}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v2

    invoke-static {v2}, Landroid/content/ContentProviderOperation;->newDelete(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "account_type=\'com.vkontakte.account\' AND sync1 IN ("

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v20

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v5, ")"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v5, 0x0

    .line 346
    invoke-virtual {v2, v3, v5}, Landroid/content/ContentProviderOperation$Builder;->withSelection(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v2

    .line 347
    invoke-virtual {v2}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v15

    .line 348
    .local v15, "op":Landroid/content/ContentProviderOperation;
    invoke-virtual {v9, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 353
    .end local v15    # "op":Landroid/content/ContentProviderOperation;
    .end local v20    # "uids":Ljava/lang/String;
    :cond_d
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_e

    .line 354
    const-string/jumbo v2, "vk"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Deleting "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v5, " contacts"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 355
    sget-object v2, Lcom/vkontakte/android/ContactsSyncAdapterService;->resolver:Landroid/content/ContentResolver;

    const-string/jumbo v3, "com.android.contacts"

    invoke-virtual {v2, v3, v9}, Landroid/content/ContentResolver;->applyBatch(Ljava/lang/String;Ljava/util/ArrayList;)[Landroid/content/ContentProviderResult;

    .line 356
    const-string/jumbo v2, "vk"

    const-string/jumbo v3, "OK!"

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 360
    :goto_6
    const-string/jumbo v2, "vk"

    const-string/jumbo v3, "Sync done!"

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 362
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sput-wide v2, Lcom/vkontakte/android/ContactsSyncAdapterService;->lastSyncTime:J

    goto/16 :goto_0

    .line 358
    :cond_e
    const-string/jumbo v2, "vk"

    const-string/jumbo v3, "Nothing to delete"

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_6
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .param p1, "arg0"    # Landroid/content/Intent;

    .prologue
    .line 59
    invoke-direct {p0}, Lcom/vkontakte/android/ContactsSyncAdapterService;->getSyncAdapter()Lcom/vkontakte/android/ContactsSyncAdapterService$SyncAdapterImpl;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/ContactsSyncAdapterService$SyncAdapterImpl;->getSyncAdapterBinder()Landroid/os/IBinder;

    move-result-object v0

    return-object v0
.end method
