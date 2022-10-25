.class public final Lcom/vkontakte/android/SendActivity;
.super Landroid/app/Activity;
.source "SendActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/SendActivity$DocumentIntentHandler;,
        Lcom/vkontakte/android/SendActivity$VideoIntentHandler;,
        Lcom/vkontakte/android/SendActivity$AudioIntentHandler;,
        Lcom/vkontakte/android/SendActivity$ImageIntentHandler;,
        Lcom/vkontakte/android/SendActivity$StreamIntentHandler;,
        Lcom/vkontakte/android/SendActivity$TextIntentHandler;,
        Lcom/vkontakte/android/SendActivity$DirectShareIntentHandler;,
        Lcom/vkontakte/android/SendActivity$UnsupportedIntentHandler;,
        Lcom/vkontakte/android/SendActivity$IntentHandler;,
        Lcom/vkontakte/android/SendActivity$SupportedType;
    }
.end annotation


# static fields
.field private static final AUDIO:I = 0x1

.field private static final AUDIO_EXTENSIONS:[Ljava/lang/String;

.field private static final AUTH_RESULT:I = 0x64

.field private static final DOCUMENT:I = 0x4

.field public static final EXTRA_RECIPIENT_FULL_NAME:Ljava/lang/String; = "com.vkontakte.android.EXTRA_RECIPIENT_FULL_NAME"

.field public static final EXTRA_RECIPIENT_PHOTO:Ljava/lang/String; = "com.vkontakte.android.EXTRA_RECIPIENT_PHOTO"

.field public static final EXTRA_RECIPIENT_UID:Ljava/lang/String; = "com.vkontakte.android.EXTRA_RECIPIENT_UID"

.field private static final FILTER_RESULT:I = 0x65

.field private static final IMAGE:I = 0x2

.field private static final IMAGE_EXTENSIONS:[Ljava/lang/String;

.field private static final MESSAGE_RESULT:I = 0x66

.field private static final PHOTO_ALBUM_RESULT:I = 0x67

.field private static final UNKNOWN:I = 0x0

.field private static final VIDEO:I = 0x3

.field private static final VIDEO_EXTENSIONS:[Ljava/lang/String;


# instance fields
.field private intentHandler:Lcom/vkontakte/android/SendActivity$IntentHandler;

.field private logoutReceiver:Lcom/vkontakte/android/activities/LogoutReceiver;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 66
    new-array v0, v5, [Ljava/lang/String;

    const-string/jumbo v1, "jpg"

    aput-object v1, v0, v2

    const-string/jumbo v1, "jpeg"

    aput-object v1, v0, v3

    const-string/jumbo v1, "png"

    aput-object v1, v0, v4

    sput-object v0, Lcom/vkontakte/android/SendActivity;->IMAGE_EXTENSIONS:[Ljava/lang/String;

    .line 67
    new-array v0, v3, [Ljava/lang/String;

    const-string/jumbo v1, "mp3"

    aput-object v1, v0, v2

    sput-object v0, Lcom/vkontakte/android/SendActivity;->AUDIO_EXTENSIONS:[Ljava/lang/String;

    .line 68
    const/4 v0, 0x7

    new-array v0, v0, [Ljava/lang/String;

    const-string/jumbo v1, "avi"

    aput-object v1, v0, v2

    const-string/jumbo v1, "mp4"

    aput-object v1, v0, v3

    const-string/jumbo v1, "3gp"

    aput-object v1, v0, v4

    const-string/jumbo v1, "mpeg"

    aput-object v1, v0, v5

    const/4 v1, 0x4

    const-string/jumbo v2, "mov"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string/jumbo v2, "flv"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string/jumbo v2, "wmv"

    aput-object v2, v0, v1

    sput-object v0, Lcom/vkontakte/android/SendActivity;->VIDEO_EXTENSIONS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 55
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 80
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/SendActivity;->logoutReceiver:Lcom/vkontakte/android/activities/LogoutReceiver;

    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/SendActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/SendActivity;

    .prologue
    .line 55
    invoke-direct {p0}, Lcom/vkontakte/android/SendActivity;->processIntent()V

    return-void
.end method

.method static synthetic access$1000(Lcom/vkontakte/android/SendActivity;Ljava/util/List;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/SendActivity;
    .param p1, "x1"    # Ljava/util/List;

    .prologue
    .line 55
    invoke-direct {p0, p1}, Lcom/vkontakte/android/SendActivity;->uploadDocs(Ljava/util/List;)V

    return-void
.end method

.method static synthetic access$1100(Lcom/vkontakte/android/SendActivity;Lcom/vkontakte/android/api/PhotoAlbum;Ljava/util/List;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/SendActivity;
    .param p1, "x1"    # Lcom/vkontakte/android/api/PhotoAlbum;
    .param p2, "x2"    # Ljava/util/List;

    .prologue
    .line 55
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/SendActivity;->uploadImages(Lcom/vkontakte/android/api/PhotoAlbum;Ljava/util/List;)V

    return-void
.end method

.method static synthetic access$1200(Lcom/vkontakte/android/SendActivity;Lcom/vkontakte/android/audio/MusicTrack;Landroid/net/Uri;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/SendActivity;
    .param p1, "x1"    # Lcom/vkontakte/android/audio/MusicTrack;
    .param p2, "x2"    # Landroid/net/Uri;

    .prologue
    .line 55
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/SendActivity;->fillMetadata(Lcom/vkontakte/android/audio/MusicTrack;Landroid/net/Uri;)V

    return-void
.end method

.method static synthetic access$1300(Lcom/vkontakte/android/SendActivity;Ljava/util/List;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/SendActivity;
    .param p1, "x1"    # Ljava/util/List;

    .prologue
    .line 55
    invoke-direct {p0, p1}, Lcom/vkontakte/android/SendActivity;->uploadVideos(Ljava/util/List;)V

    return-void
.end method

.method static synthetic access$1400(Lcom/vkontakte/android/SendActivity;Lcom/vkontakte/android/api/VideoFile;Landroid/net/Uri;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/SendActivity;
    .param p1, "x1"    # Lcom/vkontakte/android/api/VideoFile;
    .param p2, "x2"    # Landroid/net/Uri;

    .prologue
    .line 55
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/SendActivity;->fillMetadata(Lcom/vkontakte/android/api/VideoFile;Landroid/net/Uri;)V

    return-void
.end method

.method static synthetic access$500(Lcom/vkontakte/android/SendActivity;Lcom/vkontakte/android/UserProfile;Ljava/lang/String;Ljava/util/List;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/SendActivity;
    .param p1, "x1"    # Lcom/vkontakte/android/UserProfile;
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # Ljava/util/List;

    .prologue
    .line 55
    invoke-direct {p0, p1, p2, p3}, Lcom/vkontakte/android/SendActivity;->writeNewMessage(Lcom/vkontakte/android/UserProfile;Ljava/lang/String;Ljava/util/List;)V

    return-void
.end method

.method static synthetic access$600(Lcom/vkontakte/android/SendActivity;Ljava/lang/String;Ljava/util/List;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/SendActivity;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/util/List;

    .prologue
    .line 55
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/SendActivity;->writeNewPost(Ljava/lang/String;Ljava/util/List;)V

    return-void
.end method

.method static synthetic access$700(Lcom/vkontakte/android/SendActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/SendActivity;

    .prologue
    .line 55
    invoke-direct {p0}, Lcom/vkontakte/android/SendActivity;->openRecipientChooser()V

    return-void
.end method

.method static synthetic access$800(Lcom/vkontakte/android/SendActivity;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/SendActivity;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 55
    invoke-direct {p0, p1}, Lcom/vkontakte/android/SendActivity;->shareExternal(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$900(Lcom/vkontakte/android/SendActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/SendActivity;

    .prologue
    .line 55
    invoke-direct {p0}, Lcom/vkontakte/android/SendActivity;->openAlbumChooser()V

    return-void
.end method

.method private copyFromRestrictedProvider()Z
    .locals 13

    .prologue
    const/4 v8, 0x1

    const/4 v9, 0x0

    .line 356
    invoke-virtual {p0}, Lcom/vkontakte/android/SendActivity;->getIntent()Landroid/content/Intent;

    move-result-object v10

    const-string/jumbo v11, "android.intent.extra.STREAM"

    invoke-virtual {v10, v11}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_1

    .line 427
    :cond_0
    :goto_0
    return v9

    .line 359
    :cond_1
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 360
    .local v7, "uris":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/net/Uri;>;"
    const-string/jumbo v10, "android.intent.action.SEND"

    invoke-virtual {p0}, Lcom/vkontakte/android/SendActivity;->getIntent()Landroid/content/Intent;

    move-result-object v11

    invoke-virtual {v11}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_4

    .line 361
    invoke-virtual {p0}, Lcom/vkontakte/android/SendActivity;->getIntent()Landroid/content/Intent;

    move-result-object v10

    const-string/jumbo v11, "android.intent.extra.STREAM"

    invoke-virtual {v10, v11}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v5

    check-cast v5, Landroid/net/Uri;

    .line 362
    .local v5, "u":Landroid/net/Uri;
    if-eqz v5, :cond_2

    .line 363
    invoke-virtual {v7, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 373
    .end local v5    # "u":Landroid/net/Uri;
    :cond_2
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v10

    if-lez v10, :cond_0

    .line 374
    invoke-virtual {v7, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/net/Uri;

    .line 375
    .local v6, "uri":Landroid/net/Uri;
    const-string/jumbo v10, "content"

    invoke-virtual {v6}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 378
    invoke-virtual {v6}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v0

    .line 379
    .local v0, "authority":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/vkontakte/android/SendActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v10

    invoke-virtual {v10, v0, v9}, Landroid/content/pm/PackageManager;->resolveContentProvider(Ljava/lang/String;I)Landroid/content/pm/ProviderInfo;

    move-result-object v2

    .line 380
    .local v2, "info":Landroid/content/pm/ProviderInfo;
    if-eqz v2, :cond_0

    .line 382
    iget-object v10, v2, Landroid/content/pm/ProviderInfo;->readPermission:Ljava/lang/String;

    if-nez v10, :cond_6

    .line 383
    const/4 v1, 0x1

    .line 387
    .local v1, "havePermission":Z
    :goto_1
    iget-boolean v10, v2, Landroid/content/pm/ProviderInfo;->exported:Z

    if-eqz v10, :cond_3

    if-nez v1, :cond_0

    .line 388
    :cond_3
    new-instance v4, Landroid/app/ProgressDialog;

    invoke-direct {v4, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    .line 389
    .local v4, "progress":Landroid/app/ProgressDialog;
    new-instance v9, Lcom/vkontakte/android/SendActivity$1;

    invoke-direct {v9, p0, v4}, Lcom/vkontakte/android/SendActivity$1;-><init>(Lcom/vkontakte/android/SendActivity;Landroid/app/ProgressDialog;)V

    invoke-static {v7, v9, p0}, Lcom/vkontakte/android/upload/UploadUtils;->doCopyFromRestrictedProviderAsync(Ljava/util/ArrayList;Lcom/vkontakte/android/upload/UploadUtils$CopiesListener;Landroid/content/Context;)V

    move v9, v8

    .line 423
    goto :goto_0

    .line 365
    .end local v0    # "authority":Ljava/lang/String;
    .end local v1    # "havePermission":Z
    .end local v2    # "info":Landroid/content/pm/ProviderInfo;
    .end local v4    # "progress":Landroid/app/ProgressDialog;
    .end local v6    # "uri":Landroid/net/Uri;
    :cond_4
    const-string/jumbo v10, "android.intent.action.SEND_MULTIPLE"

    invoke-virtual {p0}, Lcom/vkontakte/android/SendActivity;->getIntent()Landroid/content/Intent;

    move-result-object v11

    invoke-virtual {v11}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    .line 366
    invoke-virtual {p0}, Lcom/vkontakte/android/SendActivity;->getIntent()Landroid/content/Intent;

    move-result-object v10

    const-string/jumbo v11, "android.intent.extra.STREAM"

    invoke-virtual {v10, v11}, Landroid/content/Intent;->getParcelableArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v3

    .line 367
    .local v3, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/os/Parcelable;>;"
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :cond_5
    :goto_2
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_2

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/os/Parcelable;

    .line 368
    .local v5, "u":Landroid/os/Parcelable;
    if-eqz v5, :cond_5

    .line 369
    check-cast v5, Landroid/net/Uri;

    .end local v5    # "u":Landroid/os/Parcelable;
    invoke-virtual {v7, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 385
    .end local v3    # "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/os/Parcelable;>;"
    .restart local v0    # "authority":Ljava/lang/String;
    .restart local v2    # "info":Landroid/content/pm/ProviderInfo;
    .restart local v6    # "uri":Landroid/net/Uri;
    :cond_6
    invoke-virtual {p0}, Lcom/vkontakte/android/SendActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v10

    iget-object v11, v2, Landroid/content/pm/ProviderInfo;->readPermission:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/vkontakte/android/SendActivity;->getPackageName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v10, v11, v12}, Landroid/content/pm/PackageManager;->checkPermission(Ljava/lang/String;Ljava/lang/String;)I

    move-result v10

    if-nez v10, :cond_7

    move v1, v8

    .restart local v1    # "havePermission":Z
    :goto_3
    goto :goto_1

    .end local v1    # "havePermission":Z
    :cond_7
    move v1, v9

    goto :goto_3
.end method

.method private createBatchUploadTask(Ljava/util/List;IIILandroid/net/Uri;)Lcom/vkontakte/android/upload/UploadTask;
    .locals 7
    .param p1    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "progressTitle"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
    .param p3, "doneTitle"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
    .param p4, "doneText"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
    .param p5, "data"    # Landroid/net/Uri;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/upload/UploadTask;",
            ">;III",
            "Landroid/net/Uri;",
            ")",
            "Lcom/vkontakte/android/upload/UploadTask;"
        }
    .end annotation

    .prologue
    .local p1, "tasks":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/upload/UploadTask;>;"
    const/4 v6, 0x0

    .line 300
    new-instance v0, Lcom/vkontakte/android/upload/BatchUploadTask;

    .line 303
    invoke-virtual {p0, p2}, Lcom/vkontakte/android/SendActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 304
    invoke-virtual {p0, p3}, Lcom/vkontakte/android/SendActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 305
    invoke-virtual {p0, p4}, Lcom/vkontakte/android/SendActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "android.intent.action.VIEW"

    invoke-direct {v1, v2, p5}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 306
    invoke-static {p0, v6, v1, v6}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v6

    move-object v1, p0

    move-object v2, p1

    invoke-direct/range {v0 .. v6}, Lcom/vkontakte/android/upload/BatchUploadTask;-><init>(Landroid/content/Context;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;)V

    return-object v0
.end method

.method private createIntentHandler(Landroid/content/Intent;)Lcom/vkontakte/android/SendActivity$IntentHandler;
    .locals 6
    .param p1, "intent"    # Landroid/content/Intent;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 433
    const-string/jumbo v0, "com.vkontakte.android.EXTRA_RECIPIENT_UID"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 435
    new-instance v4, Lcom/vkontakte/android/UserProfile;

    invoke-direct {v4}, Lcom/vkontakte/android/UserProfile;-><init>()V

    .line 436
    .local v4, "recipient":Lcom/vkontakte/android/UserProfile;
    const-string/jumbo v0, "com.vkontakte.android.EXTRA_RECIPIENT_UID"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    iput v0, v4, Lcom/vkontakte/android/UserProfile;->uid:I

    .line 437
    const-string/jumbo v0, "com.vkontakte.android.EXTRA_RECIPIENT_PHOTO"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v4, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    .line 438
    const-string/jumbo v0, "com.vkontakte.android.EXTRA_RECIPIENT_FULL_NAME"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v4, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    .line 443
    :goto_0
    const-string/jumbo v0, "android.intent.extra.STREAM"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 444
    invoke-direct {p0, p1, v4}, Lcom/vkontakte/android/SendActivity;->createStreamIntentHandler(Landroid/content/Intent;Lcom/vkontakte/android/UserProfile;)Lcom/vkontakte/android/SendActivity$IntentHandler;

    move-result-object v0

    .line 450
    :goto_1
    return-object v0

    .line 440
    .end local v4    # "recipient":Lcom/vkontakte/android/UserProfile;
    :cond_0
    const/4 v4, 0x0

    .restart local v4    # "recipient":Lcom/vkontakte/android/UserProfile;
    goto :goto_0

    .line 445
    :cond_1
    const-string/jumbo v0, "android.intent.extra.TEXT"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 446
    const-string/jumbo v0, "android.intent.extra.TEXT"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 447
    .local v2, "text":Ljava/lang/String;
    const-string/jumbo v0, "android.intent.extra.SUBJECT"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 448
    .local v3, "subject":Ljava/lang/String;
    new-instance v0, Lcom/vkontakte/android/SendActivity$TextIntentHandler;

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/SendActivity$TextIntentHandler;-><init>(Lcom/vkontakte/android/SendActivity;Ljava/lang/String;Ljava/lang/String;Lcom/vkontakte/android/UserProfile;Lcom/vkontakte/android/SendActivity$1;)V

    goto :goto_1

    .line 450
    .end local v2    # "text":Ljava/lang/String;
    .end local v3    # "subject":Ljava/lang/String;
    :cond_2
    new-instance v0, Lcom/vkontakte/android/SendActivity$UnsupportedIntentHandler;

    invoke-direct {v0, p0, v5}, Lcom/vkontakte/android/SendActivity$UnsupportedIntentHandler;-><init>(Lcom/vkontakte/android/SendActivity;Lcom/vkontakte/android/SendActivity$1;)V

    goto :goto_1
.end method

.method private createStreamIntentHandler(Landroid/content/Intent;Lcom/vkontakte/android/UserProfile;)Lcom/vkontakte/android/SendActivity$IntentHandler;
    .locals 9
    .param p1, "intent"    # Landroid/content/Intent;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "recipient"    # Lcom/vkontakte/android/UserProfile;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 456
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 499
    .local v0, "action":Ljava/lang/String;
    new-instance v1, Lcom/vkontakte/android/SendActivity$1SharedItems;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/SendActivity$1SharedItems;-><init>(Lcom/vkontakte/android/SendActivity;)V

    .line 500
    .local v1, "items":Lcom/vkontakte/android/SendActivity$1SharedItems;
    const-string/jumbo v6, "android.intent.action.SEND_MULTIPLE"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 501
    const-string/jumbo v6, "android.intent.extra.STREAM"

    invoke-virtual {p1, v6}, Landroid/content/Intent;->getParcelableArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v5

    .line 502
    .local v5, "uris":Ljava/util/List;, "Ljava/util/List<Landroid/net/Uri;>;"
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/net/Uri;

    .line 503
    .local v4, "uri":Landroid/net/Uri;
    new-instance v7, Lcom/vkontakte/android/SendActivity$1SharedItem;

    invoke-static {v4}, Lcom/vkontakte/android/SendActivity;->resolveType(Landroid/net/Uri;)I

    move-result v8

    invoke-direct {v7, p0, v8, v4}, Lcom/vkontakte/android/SendActivity$1SharedItem;-><init>(Lcom/vkontakte/android/SendActivity;ILandroid/net/Uri;)V

    invoke-virtual {v1, v7}, Lcom/vkontakte/android/SendActivity$1SharedItems;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 505
    .end local v4    # "uri":Landroid/net/Uri;
    .end local v5    # "uris":Ljava/util/List;, "Ljava/util/List<Landroid/net/Uri;>;"
    :cond_0
    const-string/jumbo v6, "android.intent.action.SEND"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 506
    const-string/jumbo v6, "android.intent.extra.STREAM"

    invoke-virtual {p1, v6}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v4

    check-cast v4, Landroid/net/Uri;

    .line 507
    .restart local v4    # "uri":Landroid/net/Uri;
    new-instance v6, Lcom/vkontakte/android/SendActivity$1SharedItem;

    invoke-static {v4}, Lcom/vkontakte/android/SendActivity;->resolveType(Landroid/net/Uri;)I

    move-result v7

    invoke-direct {v6, p0, v7, v4}, Lcom/vkontakte/android/SendActivity$1SharedItem;-><init>(Lcom/vkontakte/android/SendActivity;ILandroid/net/Uri;)V

    invoke-virtual {v1, v6}, Lcom/vkontakte/android/SendActivity$1SharedItems;->add(Ljava/lang/Object;)Z

    .line 510
    .end local v4    # "uri":Landroid/net/Uri;
    :cond_1
    const-string/jumbo v6, "android.intent.extra.TEXT"

    invoke-virtual {p1, v6}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 511
    .local v3, "text":Ljava/lang/String;
    invoke-static {v1}, Lcom/vkontakte/android/SendActivity$1SharedItems;->access$300(Lcom/vkontakte/android/SendActivity$1SharedItems;)I

    move-result v6

    packed-switch v6, :pswitch_data_0

    .line 529
    new-instance v6, Lcom/vkontakte/android/SendActivity$UnsupportedIntentHandler;

    const/4 v7, 0x0

    invoke-direct {v6, p0, v7}, Lcom/vkontakte/android/SendActivity$UnsupportedIntentHandler;-><init>(Lcom/vkontakte/android/SendActivity;Lcom/vkontakte/android/SendActivity$1;)V

    :goto_1
    return-object v6

    .line 513
    :pswitch_0
    new-instance v6, Lcom/vkontakte/android/SendActivity$AudioIntentHandler;

    invoke-static {v1}, Lcom/vkontakte/android/SendActivity$1SharedItems;->access$400(Lcom/vkontakte/android/SendActivity$1SharedItems;)Ljava/util/List;

    move-result-object v7

    invoke-direct {v6, p0, v3, v7, p2}, Lcom/vkontakte/android/SendActivity$AudioIntentHandler;-><init>(Lcom/vkontakte/android/SendActivity;Ljava/lang/String;Ljava/util/List;Lcom/vkontakte/android/UserProfile;)V

    goto :goto_1

    .line 515
    :pswitch_1
    new-instance v6, Lcom/vkontakte/android/SendActivity$ImageIntentHandler;

    invoke-static {v1}, Lcom/vkontakte/android/SendActivity$1SharedItems;->access$400(Lcom/vkontakte/android/SendActivity$1SharedItems;)Ljava/util/List;

    move-result-object v7

    invoke-direct {v6, p0, v3, v7, p2}, Lcom/vkontakte/android/SendActivity$ImageIntentHandler;-><init>(Lcom/vkontakte/android/SendActivity;Ljava/lang/String;Ljava/util/List;Lcom/vkontakte/android/UserProfile;)V

    goto :goto_1

    .line 517
    :pswitch_2
    new-instance v6, Lcom/vkontakte/android/SendActivity$VideoIntentHandler;

    invoke-static {v1}, Lcom/vkontakte/android/SendActivity$1SharedItems;->access$400(Lcom/vkontakte/android/SendActivity$1SharedItems;)Ljava/util/List;

    move-result-object v7

    invoke-direct {v6, p0, v3, v7, p2}, Lcom/vkontakte/android/SendActivity$VideoIntentHandler;-><init>(Lcom/vkontakte/android/SendActivity;Ljava/lang/String;Ljava/util/List;Lcom/vkontakte/android/UserProfile;)V

    goto :goto_1

    .line 520
    :pswitch_3
    invoke-virtual {v1}, Lcom/vkontakte/android/SendActivity$1SharedItems;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 521
    .local v2, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/vkontakte/android/SendActivity$1SharedItem;>;"
    :cond_2
    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 522
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/vkontakte/android/SendActivity$1SharedItem;

    iget v6, v6, Lcom/vkontakte/android/SendActivity$1SharedItem;->type:I

    const/4 v7, 0x1

    if-ne v6, v7, :cond_2

    .line 523
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    goto :goto_2

    .line 526
    :cond_3
    new-instance v6, Lcom/vkontakte/android/SendActivity$DocumentIntentHandler;

    invoke-static {v1}, Lcom/vkontakte/android/SendActivity$1SharedItems;->access$400(Lcom/vkontakte/android/SendActivity$1SharedItems;)Ljava/util/List;

    move-result-object v7

    invoke-direct {v6, p0, v3, v7, p2}, Lcom/vkontakte/android/SendActivity$DocumentIntentHandler;-><init>(Lcom/vkontakte/android/SendActivity;Ljava/lang/String;Ljava/util/List;Lcom/vkontakte/android/UserProfile;)V

    goto :goto_1

    .line 511
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method private fillMetadata(Lcom/vkontakte/android/api/VideoFile;Landroid/net/Uri;)V
    .locals 6
    .param p1, "vf"    # Lcom/vkontakte/android/api/VideoFile;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "uri"    # Landroid/net/Uri;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 336
    invoke-static {p2}, Lcom/vkontakte/android/upload/UploadUtils;->resolveName(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p1, Lcom/vkontakte/android/api/VideoFile;->title:Ljava/lang/String;

    .line 337
    const/4 v1, 0x0

    .line 339
    .local v1, "mdr":Landroid/media/MediaMetadataRetriever;
    :try_start_0
    new-instance v2, Landroid/media/MediaMetadataRetriever;

    invoke-direct {v2}, Landroid/media/MediaMetadataRetriever;-><init>()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 340
    .end local v1    # "mdr":Landroid/media/MediaMetadataRetriever;
    .local v2, "mdr":Landroid/media/MediaMetadataRetriever;
    :try_start_1
    invoke-virtual {v2, p0, p2}, Landroid/media/MediaMetadataRetriever;->setDataSource(Landroid/content/Context;Landroid/net/Uri;)V

    .line 341
    const/4 v4, 0x7

    invoke-virtual {v2, v4}, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;

    move-result-object v3

    .line 342
    .local v3, "val":Ljava/lang/String;
    if-eqz v3, :cond_0

    .line 343
    iput-object v3, p1, Lcom/vkontakte/android/api/VideoFile;->title:Ljava/lang/String;

    .line 345
    :cond_0
    const/16 v4, 0x9

    invoke-virtual {v2, v4}, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    div-int/lit16 v4, v4, 0x3e8

    iput v4, p1, Lcom/vkontakte/android/api/VideoFile;->duration:I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 349
    if-eqz v2, :cond_3

    .line 350
    invoke-virtual {v2}, Landroid/media/MediaMetadataRetriever;->release()V

    move-object v1, v2

    .line 353
    .end local v2    # "mdr":Landroid/media/MediaMetadataRetriever;
    .end local v3    # "val":Ljava/lang/String;
    .restart local v1    # "mdr":Landroid/media/MediaMetadataRetriever;
    :cond_1
    :goto_0
    return-void

    .line 346
    :catch_0
    move-exception v0

    .line 347
    .local v0, "e":Ljava/lang/Exception;
    :goto_1
    :try_start_2
    const-string/jumbo v4, "vk"

    const-string/jumbo v5, "Error getting duration!"

    invoke-static {v4, v5, v0}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 349
    if-eqz v1, :cond_1

    .line 350
    invoke-virtual {v1}, Landroid/media/MediaMetadataRetriever;->release()V

    goto :goto_0

    .line 349
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v4

    :goto_2
    if-eqz v1, :cond_2

    .line 350
    invoke-virtual {v1}, Landroid/media/MediaMetadataRetriever;->release()V

    :cond_2
    throw v4

    .line 349
    .end local v1    # "mdr":Landroid/media/MediaMetadataRetriever;
    .restart local v2    # "mdr":Landroid/media/MediaMetadataRetriever;
    :catchall_1
    move-exception v4

    move-object v1, v2

    .end local v2    # "mdr":Landroid/media/MediaMetadataRetriever;
    .restart local v1    # "mdr":Landroid/media/MediaMetadataRetriever;
    goto :goto_2

    .line 346
    .end local v1    # "mdr":Landroid/media/MediaMetadataRetriever;
    .restart local v2    # "mdr":Landroid/media/MediaMetadataRetriever;
    :catch_1
    move-exception v0

    move-object v1, v2

    .end local v2    # "mdr":Landroid/media/MediaMetadataRetriever;
    .restart local v1    # "mdr":Landroid/media/MediaMetadataRetriever;
    goto :goto_1

    .end local v1    # "mdr":Landroid/media/MediaMetadataRetriever;
    .restart local v2    # "mdr":Landroid/media/MediaMetadataRetriever;
    .restart local v3    # "val":Ljava/lang/String;
    :cond_3
    move-object v1, v2

    .end local v2    # "mdr":Landroid/media/MediaMetadataRetriever;
    .restart local v1    # "mdr":Landroid/media/MediaMetadataRetriever;
    goto :goto_0
.end method

.method private fillMetadata(Lcom/vkontakte/android/audio/MusicTrack;Landroid/net/Uri;)V
    .locals 6
    .param p1, "mt"    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "uri"    # Landroid/net/Uri;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 311
    const-string/jumbo v4, "Untitled"

    iput-object v4, p1, Lcom/vkontakte/android/audio/MusicTrack;->title:Ljava/lang/String;

    .line 312
    const-string/jumbo v4, "Unknown artist"

    iput-object v4, p1, Lcom/vkontakte/android/audio/MusicTrack;->artist:Ljava/lang/String;

    .line 313
    const/4 v1, 0x0

    .line 315
    .local v1, "mdr":Landroid/media/MediaMetadataRetriever;
    :try_start_0
    new-instance v2, Landroid/media/MediaMetadataRetriever;

    invoke-direct {v2}, Landroid/media/MediaMetadataRetriever;-><init>()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 316
    .end local v1    # "mdr":Landroid/media/MediaMetadataRetriever;
    .local v2, "mdr":Landroid/media/MediaMetadataRetriever;
    :try_start_1
    invoke-virtual {v2, p0, p2}, Landroid/media/MediaMetadataRetriever;->setDataSource(Landroid/content/Context;Landroid/net/Uri;)V

    .line 317
    const/4 v4, 0x7

    invoke-virtual {v2, v4}, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;

    move-result-object v3

    .line 318
    .local v3, "val":Ljava/lang/String;
    if-eqz v3, :cond_0

    .line 319
    iput-object v3, p1, Lcom/vkontakte/android/audio/MusicTrack;->title:Ljava/lang/String;

    .line 321
    :cond_0
    const/4 v4, 0x2

    invoke-virtual {v2, v4}, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;

    move-result-object v3

    .line 322
    if-eqz v3, :cond_1

    .line 323
    iput-object v3, p1, Lcom/vkontakte/android/audio/MusicTrack;->artist:Ljava/lang/String;

    .line 325
    :cond_1
    const/16 v4, 0x9

    invoke-virtual {v2, v4}, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    div-int/lit16 v4, v4, 0x3e8

    iput v4, p1, Lcom/vkontakte/android/audio/MusicTrack;->duration:I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 329
    if-eqz v2, :cond_4

    .line 330
    invoke-virtual {v2}, Landroid/media/MediaMetadataRetriever;->release()V

    move-object v1, v2

    .line 333
    .end local v2    # "mdr":Landroid/media/MediaMetadataRetriever;
    .end local v3    # "val":Ljava/lang/String;
    .restart local v1    # "mdr":Landroid/media/MediaMetadataRetriever;
    :cond_2
    :goto_0
    return-void

    .line 326
    :catch_0
    move-exception v0

    .line 327
    .local v0, "e":Ljava/lang/Exception;
    :goto_1
    :try_start_2
    const-string/jumbo v4, "vk"

    const-string/jumbo v5, "Error getting duration!"

    invoke-static {v4, v5, v0}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 329
    if-eqz v1, :cond_2

    .line 330
    invoke-virtual {v1}, Landroid/media/MediaMetadataRetriever;->release()V

    goto :goto_0

    .line 329
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v4

    :goto_2
    if-eqz v1, :cond_3

    .line 330
    invoke-virtual {v1}, Landroid/media/MediaMetadataRetriever;->release()V

    :cond_3
    throw v4

    .line 329
    .end local v1    # "mdr":Landroid/media/MediaMetadataRetriever;
    .restart local v2    # "mdr":Landroid/media/MediaMetadataRetriever;
    :catchall_1
    move-exception v4

    move-object v1, v2

    .end local v2    # "mdr":Landroid/media/MediaMetadataRetriever;
    .restart local v1    # "mdr":Landroid/media/MediaMetadataRetriever;
    goto :goto_2

    .line 326
    .end local v1    # "mdr":Landroid/media/MediaMetadataRetriever;
    .restart local v2    # "mdr":Landroid/media/MediaMetadataRetriever;
    :catch_1
    move-exception v0

    move-object v1, v2

    .end local v2    # "mdr":Landroid/media/MediaMetadataRetriever;
    .restart local v1    # "mdr":Landroid/media/MediaMetadataRetriever;
    goto :goto_1

    .end local v1    # "mdr":Landroid/media/MediaMetadataRetriever;
    .restart local v2    # "mdr":Landroid/media/MediaMetadataRetriever;
    .restart local v3    # "val":Ljava/lang/String;
    :cond_4
    move-object v1, v2

    .end local v2    # "mdr":Landroid/media/MediaMetadataRetriever;
    .restart local v1    # "mdr":Landroid/media/MediaMetadataRetriever;
    goto :goto_0
.end method

.method private static isInArray(Ljava/lang/String;[Ljava/lang/String;)Z
    .locals 5
    .param p0, "what"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "array"    # [Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v1, 0x0

    .line 568
    array-length v3, p1

    move v2, v1

    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v0, p1, v2

    .line 569
    .local v0, "s":Ljava/lang/String;
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 570
    const/4 v1, 0x1

    .line 573
    .end local v0    # "s":Ljava/lang/String;
    :cond_0
    return v1

    .line 568
    .restart local v0    # "s":Ljava/lang/String;
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method private openAlbumChooser()V
    .locals 2

    .prologue
    .line 156
    new-instance v0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$Builder;

    invoke-direct {v0}, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$Builder;-><init>()V

    .line 157
    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$Builder;->setSelectMode()Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$Builder;

    move-result-object v0

    .line 158
    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$Builder;->setSelectAlbumMode()Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$Builder;

    move-result-object v0

    const/16 v1, 0x67

    .line 159
    invoke-virtual {v0, p0, v1}, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$Builder;->forResult(Landroid/app/Activity;I)Z

    .line 160
    return-void
.end method

.method private openRecipientChooser()V
    .locals 2

    .prologue
    .line 150
    new-instance v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$Builder;

    invoke-direct {v0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$Builder;-><init>()V

    .line 151
    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$Builder;->setSelectMode()Lcom/vkontakte/android/fragments/messages/DialogsFragment$Builder;

    move-result-object v0

    const/16 v1, 0x66

    .line 152
    invoke-virtual {v0, p0, v1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$Builder;->forResult(Landroid/app/Activity;I)Z

    .line 153
    return-void
.end method

.method private processIntent()V
    .locals 3

    .prologue
    .line 136
    invoke-virtual {p0}, Lcom/vkontakte/android/SendActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 137
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {v0}, Landroid/content/Intent;->getFlags()I

    move-result v1

    and-int/lit8 v1, v1, 0x1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_1

    .line 138
    invoke-direct {p0}, Lcom/vkontakte/android/SendActivity;->copyFromRestrictedProvider()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 147
    :cond_0
    :goto_0
    return-void

    .line 143
    :cond_1
    invoke-direct {p0, v0}, Lcom/vkontakte/android/SendActivity;->createIntentHandler(Landroid/content/Intent;)Lcom/vkontakte/android/SendActivity$IntentHandler;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/SendActivity;->intentHandler:Lcom/vkontakte/android/SendActivity$IntentHandler;

    .line 144
    iget-object v1, p0, Lcom/vkontakte/android/SendActivity;->intentHandler:Lcom/vkontakte/android/SendActivity$IntentHandler;

    invoke-interface {v1}, Lcom/vkontakte/android/SendActivity$IntentHandler;->handle()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 145
    invoke-virtual {p0}, Lcom/vkontakte/android/SendActivity;->finish()V

    goto :goto_0
.end method

.method private static resolveType(Landroid/net/Uri;)I
    .locals 6
    .param p0, "stream"    # Landroid/net/Uri;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v4, 0x0

    .line 535
    invoke-virtual {p0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v3

    .line 536
    .local v3, "scheme":Ljava/lang/String;
    if-nez v3, :cond_1

    .line 563
    :cond_0
    :goto_0
    return v4

    .line 541
    :cond_1
    const-string/jumbo v5, "file"

    invoke-virtual {v5, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 542
    invoke-virtual {p0}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v1

    .line 543
    .local v1, "filename":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 546
    const-string/jumbo v5, "\\."

    invoke-virtual {v1, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 547
    .local v2, "parts":[Ljava/lang/String;
    array-length v5, v2

    add-int/lit8 v5, v5, -0x1

    aget-object v5, v2, v5

    invoke-virtual {v5}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    .line 552
    .end local v1    # "filename":Ljava/lang/String;
    .end local v2    # "parts":[Ljava/lang/String;
    .local v0, "ext":Ljava/lang/String;
    :goto_1
    if-eqz v0, :cond_0

    .line 556
    sget-object v4, Lcom/vkontakte/android/SendActivity;->AUDIO_EXTENSIONS:[Ljava/lang/String;

    invoke-static {v0, v4}, Lcom/vkontakte/android/SendActivity;->isInArray(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 557
    const/4 v4, 0x1

    goto :goto_0

    .line 549
    .end local v0    # "ext":Ljava/lang/String;
    :cond_2
    invoke-static {p0}, Lcom/vkontakte/android/upload/UploadUtils;->resolveExtension(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "ext":Ljava/lang/String;
    goto :goto_1

    .line 558
    :cond_3
    sget-object v4, Lcom/vkontakte/android/SendActivity;->IMAGE_EXTENSIONS:[Ljava/lang/String;

    invoke-static {v0, v4}, Lcom/vkontakte/android/SendActivity;->isInArray(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 559
    const/4 v4, 0x2

    goto :goto_0

    .line 560
    :cond_4
    sget-object v4, Lcom/vkontakte/android/SendActivity;->VIDEO_EXTENSIONS:[Ljava/lang/String;

    invoke-static {v0, v4}, Lcom/vkontakte/android/SendActivity;->isInArray(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 561
    const/4 v4, 0x3

    goto :goto_0

    .line 563
    :cond_5
    const/4 v4, 0x4

    goto :goto_0
.end method

.method private shareExternal(Ljava/lang/String;)V
    .locals 0
    .param p1, "text"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 190
    invoke-static {p0, p1}, Lcom/vk/sharing/Sharing;->share(Landroid/content/Context;Ljava/lang/String;)V

    .line 191
    invoke-virtual {p0}, Lcom/vkontakte/android/SendActivity;->finish()V

    .line 192
    return-void
.end method

.method private uploadAudios(Ljava/util/List;)V
    .locals 11
    .param p1    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<+",
            "Lcom/vkontakte/android/attachments/AudioAttachment;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "attachments":Ljava/util/List;, "Ljava/util/List<+Lcom/vkontakte/android/attachments/AudioAttachment;>;"
    const/4 v10, 0x1

    .line 217
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v7

    .line 219
    .local v7, "ownerId":I
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 220
    .local v1, "tasks":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/upload/UploadTask;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/vkontakte/android/attachments/AudioAttachment;

    .line 221
    .local v6, "attachment":Lcom/vkontakte/android/attachments/AudioAttachment;
    new-instance v8, Lcom/vkontakte/android/upload/AudioUploadTask;

    iget-object v9, v6, Lcom/vkontakte/android/attachments/AudioAttachment;->musicTrack:Lcom/vkontakte/android/audio/MusicTrack;

    iget-object v9, v9, Lcom/vkontakte/android/audio/MusicTrack;->url:Ljava/lang/String;

    invoke-direct {v8, p0, v9, v10}, Lcom/vkontakte/android/upload/AudioUploadTask;-><init>(Landroid/content/Context;Ljava/lang/String;Z)V

    invoke-interface {v1, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 224
    .end local v6    # "attachment":Lcom/vkontakte/android/attachments/AudioAttachment;
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "vkontakte://vk.com/audios"

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    .line 226
    .local v5, "data":Landroid/net/Uri;
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v0

    if-le v0, v10, :cond_1

    .line 227
    const v2, 0x7f08072f

    .line 228
    .local v2, "progressTitle":I
    const v3, 0x7f0800f7

    .line 229
    .local v3, "doneTitle":I
    const v4, 0x7f0800f8

    .local v4, "doneText":I
    :goto_1
    move-object v0, p0

    .line 235
    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/SendActivity;->createBatchUploadTask(Ljava/util/List;IIILandroid/net/Uri;)Lcom/vkontakte/android/upload/UploadTask;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/vkontakte/android/upload/Upload;->start(Landroid/content/Context;Lcom/vkontakte/android/upload/UploadTask;)V

    .line 237
    invoke-virtual {p0}, Lcom/vkontakte/android/SendActivity;->finish()V

    .line 238
    return-void

    .line 231
    .end local v2    # "progressTitle":I
    .end local v3    # "doneTitle":I
    .end local v4    # "doneText":I
    :cond_1
    const v2, 0x7f08072d

    .line 232
    .restart local v2    # "progressTitle":I
    const v3, 0x7f0800f5

    .line 233
    .restart local v3    # "doneTitle":I
    const v4, 0x7f0800f6

    .restart local v4    # "doneText":I
    goto :goto_1
.end method

.method private uploadDocs(Ljava/util/List;)V
    .locals 11
    .param p1    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Landroid/net/Uri;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 275
    .local p1, "uris":Ljava/util/List;, "Ljava/util/List<Landroid/net/Uri;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 276
    .local v1, "tasks":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/upload/UploadTask;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/net/Uri;

    .line 277
    .local v6, "uri":Landroid/net/Uri;
    new-instance v7, Lcom/vkontakte/android/upload/DocumentUploadTask;

    invoke-virtual {v6}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v9

    invoke-virtual {v9}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v9

    const/4 v10, 0x0

    invoke-direct {v7, p0, v8, v9, v10}, Lcom/vkontakte/android/upload/DocumentUploadTask;-><init>(Landroid/content/Context;Ljava/lang/String;IZ)V

    invoke-interface {v1, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 280
    .end local v6    # "uri":Landroid/net/Uri;
    :cond_0
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v7, 0x1

    if-le v0, v7, :cond_1

    .line 281
    const v2, 0x7f080732

    .line 282
    .local v2, "progressTitle":I
    const v3, 0x7f0801bb

    .line 283
    .local v3, "doneTitle":I
    const v4, 0x7f0801bc

    .line 289
    .local v4, "doneText":I
    :goto_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "vkontakte://vk.com/docs"

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v7

    invoke-virtual {v7}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v7

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    .local v5, "data":Landroid/net/Uri;
    move-object v0, p0

    .line 290
    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/SendActivity;->createBatchUploadTask(Ljava/util/List;IIILandroid/net/Uri;)Lcom/vkontakte/android/upload/UploadTask;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/vkontakte/android/upload/Upload;->start(Landroid/content/Context;Lcom/vkontakte/android/upload/UploadTask;)V

    .line 292
    invoke-virtual {p0}, Lcom/vkontakte/android/SendActivity;->finish()V

    .line 293
    return-void

    .line 285
    .end local v2    # "progressTitle":I
    .end local v3    # "doneTitle":I
    .end local v4    # "doneText":I
    .end local v5    # "data":Landroid/net/Uri;
    :cond_1
    const v2, 0x7f080730

    .line 286
    .restart local v2    # "progressTitle":I
    const v3, 0x7f0801b9

    .line 287
    .restart local v3    # "doneTitle":I
    const v4, 0x7f0801ba

    .restart local v4    # "doneText":I
    goto :goto_1
.end method

.method private uploadImages(Lcom/vkontakte/android/api/PhotoAlbum;Ljava/util/List;)V
    .locals 10
    .param p1, "album"    # Lcom/vkontakte/android/api/PhotoAlbum;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/api/PhotoAlbum;",
            "Ljava/util/List",
            "<",
            "Landroid/net/Uri;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p2, "uris":Ljava/util/List;, "Ljava/util/List<Landroid/net/Uri;>;"
    const/4 v6, 0x1

    .line 195
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 196
    .local v7, "tasks":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/upload/UploadTask;>;"
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/net/Uri;

    .line 197
    .local v8, "uri":Landroid/net/Uri;
    new-instance v0, Lcom/vkontakte/android/upload/AlbumPhotoUploadTask;

    invoke-virtual {v8}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    iget v3, p1, Lcom/vkontakte/android/api/PhotoAlbum;->id:I

    iget v4, p1, Lcom/vkontakte/android/api/PhotoAlbum;->oid:I

    const-string/jumbo v5, ""

    move-object v1, p0

    invoke-direct/range {v0 .. v6}, Lcom/vkontakte/android/upload/AlbumPhotoUploadTask;-><init>(Landroid/content/Context;Ljava/lang/String;IILjava/lang/String;Z)V

    invoke-interface {v7, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 200
    .end local v8    # "uri":Landroid/net/Uri;
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "vkontakte://vk.com/album"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p1, Lcom/vkontakte/android/api/PhotoAlbum;->oid:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p1, Lcom/vkontakte/android/api/PhotoAlbum;->id:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    .line 202
    .local v5, "data":Landroid/net/Uri;
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v0

    if-le v0, v6, :cond_1

    .line 203
    const v2, 0x7f080737

    .line 204
    .local v2, "progressTitle":I
    const v3, 0x7f0804ae

    .line 205
    .local v3, "doneTitle":I
    const v4, 0x7f0804af

    .local v4, "doneText":I
    :goto_1
    move-object v0, p0

    move-object v1, v7

    .line 211
    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/SendActivity;->createBatchUploadTask(Ljava/util/List;IIILandroid/net/Uri;)Lcom/vkontakte/android/upload/UploadTask;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/vkontakte/android/upload/Upload;->start(Landroid/content/Context;Lcom/vkontakte/android/upload/UploadTask;)V

    .line 213
    invoke-virtual {p0}, Lcom/vkontakte/android/SendActivity;->finish()V

    .line 214
    return-void

    .line 207
    .end local v2    # "progressTitle":I
    .end local v3    # "doneTitle":I
    .end local v4    # "doneText":I
    :cond_1
    const v2, 0x7f080733

    .line 208
    .restart local v2    # "progressTitle":I
    const v3, 0x7f0804ac

    .line 209
    .restart local v3    # "doneTitle":I
    const v4, 0x7f0804ad

    .restart local v4    # "doneText":I
    goto :goto_1
.end method

.method private uploadVideos(Ljava/util/List;)V
    .locals 12
    .param p1    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<+",
            "Lcom/vkontakte/android/attachments/VideoAttachment;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "attachments":Ljava/util/List;, "Ljava/util/List<+Lcom/vkontakte/android/attachments/VideoAttachment;>;"
    const/4 v8, 0x1

    .line 241
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v7

    .line 243
    .local v7, "ownerId":I
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 244
    .local v10, "tasks":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/upload/UploadTask;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_0
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/vkontakte/android/attachments/VideoAttachment;

    .line 245
    .local v9, "attachment":Lcom/vkontakte/android/attachments/VideoAttachment;
    new-instance v0, Lcom/vkontakte/android/upload/VideoUploadTask;

    iget-object v1, v9, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    iget-object v2, v1, Lcom/vkontakte/android/api/VideoFile;->urlExternal:Ljava/lang/String;

    iget-object v1, v9, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    iget-object v3, v1, Lcom/vkontakte/android/api/VideoFile;->title:Ljava/lang/String;

    iget-object v1, v9, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    iget-object v4, v1, Lcom/vkontakte/android/api/VideoFile;->descr:Ljava/lang/String;

    sget-object v5, Lcom/vkontakte/android/media/video/VideoEncoderSettings;->p720:Lcom/vkontakte/android/media/video/VideoEncoderSettings;

    const/4 v6, 0x0

    move-object v1, p0

    invoke-direct/range {v0 .. v8}, Lcom/vkontakte/android/upload/VideoUploadTask;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/vkontakte/android/media/video/VideoEncoderSettings;ZIZ)V

    invoke-interface {v10, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 259
    .end local v9    # "attachment":Lcom/vkontakte/android/attachments/VideoAttachment;
    :cond_0
    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v0

    if-le v0, v8, :cond_1

    .line 260
    const v2, 0x7f08073a

    .line 261
    .local v2, "progressTitle":I
    const v3, 0x7f08076b

    .line 262
    .local v3, "doneTitle":I
    const v4, 0x7f08076c

    .line 268
    .local v4, "doneText":I
    :goto_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "vkontakte://vk.com/videos"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    .local v5, "data":Landroid/net/Uri;
    move-object v0, p0

    move-object v1, v10

    .line 269
    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/SendActivity;->createBatchUploadTask(Ljava/util/List;IIILandroid/net/Uri;)Lcom/vkontakte/android/upload/UploadTask;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/vkontakte/android/upload/Upload;->start(Landroid/content/Context;Lcom/vkontakte/android/upload/UploadTask;)V

    .line 271
    invoke-virtual {p0}, Lcom/vkontakte/android/SendActivity;->finish()V

    .line 272
    return-void

    .line 264
    .end local v2    # "progressTitle":I
    .end local v3    # "doneTitle":I
    .end local v4    # "doneText":I
    .end local v5    # "data":Landroid/net/Uri;
    :cond_1
    const v2, 0x7f080738

    .line 265
    .restart local v2    # "progressTitle":I
    const v3, 0x7f080769

    .line 266
    .restart local v3    # "doneTitle":I
    const v4, 0x7f08076a

    .restart local v4    # "doneText":I
    goto :goto_1
.end method

.method private writeNewMessage(Lcom/vkontakte/android/UserProfile;Ljava/lang/String;Ljava/util/List;)V
    .locals 3
    .param p1, "recipient"    # Lcom/vkontakte/android/UserProfile;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "text"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/util/List;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/UserProfile;",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<+",
            "Lcom/vkontakte/android/attachments/Attachment;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 175
    .local p3, "attachments":Ljava/util/List;, "Ljava/util/List<+Lcom/vkontakte/android/attachments/Attachment;>;"
    new-instance v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;

    iget v1, p1, Lcom/vkontakte/android/UserProfile;->uid:I

    iget-object v2, p1, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;-><init>(ILjava/lang/String;)V

    .line 176
    .local v0, "builder":Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;
    iget-object v1, p1, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 177
    iget-object v1, p1, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;->setPhoto(Ljava/lang/CharSequence;)Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;

    .line 179
    :cond_0
    if-eqz p2, :cond_1

    .line 180
    invoke-virtual {v0, p2}, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;->setText(Ljava/lang/String;)Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;

    .line 182
    :cond_1
    if-eqz p3, :cond_2

    .line 183
    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [Lcom/vkontakte/android/attachments/Attachment;

    invoke-interface {p3, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Landroid/os/Parcelable;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;->setAttachments([Landroid/os/Parcelable;)Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;

    .line 185
    :cond_2
    invoke-virtual {v0, p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;->go(Landroid/content/Context;)Z

    .line 186
    invoke-virtual {p0}, Lcom/vkontakte/android/SendActivity;->finish()V

    .line 187
    return-void
.end method

.method private writeNewPost(Ljava/lang/String;Ljava/util/List;)V
    .locals 2
    .param p1, "text"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/util/List;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<+",
            "Lcom/vkontakte/android/attachments/Attachment;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 163
    .local p2, "attachments":Ljava/util/List;, "Ljava/util/List<+Lcom/vkontakte/android/attachments/Attachment;>;"
    new-instance v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;

    invoke-direct {v0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;-><init>()V

    .line 164
    .local v0, "builder":Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;
    if-eqz p1, :cond_0

    .line 165
    invoke-virtual {v0, p1}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->attachText(Ljava/lang/String;)Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;

    .line 167
    :cond_0
    if-eqz p2, :cond_1

    .line 168
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [Lcom/vkontakte/android/attachments/Attachment;

    invoke-interface {p2, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lcom/vkontakte/android/attachments/Attachment;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->attachAttachments([Lcom/vkontakte/android/attachments/Attachment;)Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;

    .line 170
    :cond_1
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->send(Z)Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->go(Landroid/content/Context;)Z

    .line 171
    invoke-virtual {p0}, Lcom/vkontakte/android/SendActivity;->finish()V

    .line 172
    return-void
.end method


# virtual methods
.method public finish()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 104
    invoke-super {p0}, Landroid/app/Activity;->finish()V

    .line 105
    invoke-virtual {p0, v0, v0}, Lcom/vkontakte/android/SendActivity;->overridePendingTransition(II)V

    .line 106
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 3
    .param p1, "reqCode"    # I
    .param p2, "resCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 110
    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    .line 111
    packed-switch p1, :pswitch_data_0

    .line 128
    invoke-virtual {p0}, Lcom/vkontakte/android/SendActivity;->finish()V

    .line 133
    :goto_0
    return-void

    .line 113
    :pswitch_0
    invoke-direct {p0}, Lcom/vkontakte/android/SendActivity;->processIntent()V

    goto :goto_0

    .line 116
    :pswitch_1
    new-instance v1, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;

    invoke-direct {v1}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;-><init>()V

    const-string/jumbo v0, "images"

    invoke-virtual {p3, v0}, Landroid/content/Intent;->getStringArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->attachPhoto(Landroid/net/Uri;)Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;

    move-result-object v0

    .line 117
    invoke-virtual {p0}, Lcom/vkontakte/android/SendActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string/jumbo v2, "android.intent.extra.TEXT"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->attachText(Ljava/lang/String;)Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;

    move-result-object v0

    const/4 v1, 0x1

    .line 118
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->send(Z)Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;

    move-result-object v0

    .line 119
    invoke-virtual {v0, p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->go(Landroid/content/Context;)Z

    goto :goto_0

    .line 122
    :pswitch_2
    iget-object v1, p0, Lcom/vkontakte/android/SendActivity;->intentHandler:Lcom/vkontakte/android/SendActivity$IntentHandler;

    const-string/jumbo v0, "profile"

    invoke-virtual {p3, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    invoke-interface {v1, v0}, Lcom/vkontakte/android/SendActivity$IntentHandler;->onGotRecipient(Lcom/vkontakte/android/UserProfile;)V

    goto :goto_0

    .line 125
    :pswitch_3
    iget-object v1, p0, Lcom/vkontakte/android/SendActivity;->intentHandler:Lcom/vkontakte/android/SendActivity$IntentHandler;

    const-string/jumbo v0, "album"

    invoke-virtual {p3, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/PhotoAlbum;

    invoke-interface {v1, v0}, Lcom/vkontakte/android/SendActivity$IntentHandler;->onGotPhotoAlbum(Lcom/vkontakte/android/api/PhotoAlbum;)V

    goto :goto_0

    .line 131
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/SendActivity;->finish()V

    goto :goto_0

    .line 111
    nop

    :pswitch_data_0
    .packed-switch 0x64
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "b"    # Landroid/os/Bundle;

    .prologue
    const/4 v0, 0x0

    .line 85
    invoke-virtual {p0, v0, v0}, Lcom/vkontakte/android/SendActivity;->overridePendingTransition(II)V

    .line 86
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 87
    invoke-static {p0}, Lcom/vkontakte/android/activities/LogoutReceiver;->register(Landroid/app/Activity;)Lcom/vkontakte/android/activities/LogoutReceiver;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/SendActivity;->logoutReceiver:Lcom/vkontakte/android/activities/LogoutReceiver;

    .line 89
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v0

    if-nez v0, :cond_0

    .line 90
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/vkontakte/android/AuthActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/16 v1, 0x64

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/SendActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 94
    :goto_0
    return-void

    .line 92
    :cond_0
    invoke-direct {p0}, Lcom/vkontakte/android/SendActivity;->processIntent()V

    goto :goto_0
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 98
    iget-object v0, p0, Lcom/vkontakte/android/SendActivity;->logoutReceiver:Lcom/vkontakte/android/activities/LogoutReceiver;

    invoke-virtual {v0}, Lcom/vkontakte/android/activities/LogoutReceiver;->unregister()V

    .line 99
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 100
    return-void
.end method
