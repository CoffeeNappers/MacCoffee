.class public Lcom/vkontakte/android/GCMBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "GCMBroadcastReceiver.java"


# static fields
.field public static final ID_FRIEND_ACCEPTED_NOTIFICATION:I = 0x1ff

.field public static final ID_FRIEND_FOUND_NOTIFICATION:I = 0x1f7

.field public static final ID_FRIEND_NOTIFICATION:I = 0x1f5

.field public static final ID_GAME_INSTALL_NOTIFICATION:I = 0x1f9

.field public static final ID_GAME_NOTIFICATION:I = 0x1f8

.field public static final ID_GIFT_NOTIFICATION:I = 0x1fa

.field public static final ID_GROUP_ACCEPTED_NOTIFICATION:I = 0x200

.field public static final ID_GROUP_INVITE_NOTIFICATION:I = 0x1fe

.field public static final ID_LIKE_NOTIFICATION:I = 0x1fb

.field public static final ID_MONEY_TRANSFER_NOTIFICATION:I = 0x258

.field public static final ID_OPEN_URL_NOTIFICATION_FIRST:I = 0x208

.field public static final ID_POST_PUBLISHED_NOTIFICATION:I = 0x201

.field public static final ID_REPLY_NOTIFICATION:I = 0x1f6

.field public static final ID_REPOST_NOTIFICATION:I = 0x1fd

.field public static final ID_SHOW_MESSAGE_NOTIFICATION_FIRST:I = 0x244

.field public static final ID_SUBSCRIBED_POST_NOTIFICATION:I = 0x1fc

.field public static final ID_UPCOMING_EVENT_NOTIFICATION:I = 0x202

.field public static final ID_VALIDATE_ACTION_NOTIFICATION_FIRST:I = 0x230

.field public static final ID_VALIDATE_DEVICE_NOTIFICATION_FIRST:I = 0x21c

.field public static final ID_WALL_POST_NOTIFICATION:I = 0x1fb

.field private static openUrlNotificationLast:I

.field private static showMessageNotificationLast:I

.field private static validateActionNotificationLast:I

.field private static validateDeviceNotificationLast:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 65
    sput v0, Lcom/vkontakte/android/GCMBroadcastReceiver;->openUrlNotificationLast:I

    .line 66
    sput v0, Lcom/vkontakte/android/GCMBroadcastReceiver;->validateDeviceNotificationLast:I

    .line 67
    sput v0, Lcom/vkontakte/android/GCMBroadcastReceiver;->validateActionNotificationLast:I

    .line 68
    sput v0, Lcom/vkontakte/android/GCMBroadcastReceiver;->showMessageNotificationLast:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 41
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method static synthetic access$000(Landroid/content/Context;ILandroid/app/Notification;Z)V
    .locals 0
    .param p0, "x0"    # Landroid/content/Context;
    .param p1, "x1"    # I
    .param p2, "x2"    # Landroid/app/Notification;
    .param p3, "x3"    # Z

    .prologue
    .line 41
    invoke-static {p0, p1, p2, p3}, Lcom/vkontakte/android/GCMBroadcastReceiver;->notify(Landroid/content/Context;ILandroid/app/Notification;Z)V

    return-void
.end method

.method private static cancel(Landroid/content/Context;I)V
    .locals 1
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "id"    # I

    .prologue
    .line 78
    const-string/jumbo v0, "notification"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    invoke-virtual {v0, p1}, Landroid/app/NotificationManager;->cancel(I)V

    .line 79
    return-void
.end method

.method static synthetic lambda$null$0(Landroid/content/Context;Landroid/content/Intent;IZLjava/util/ArrayList;)V
    .locals 20
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "cnt"    # I
    .param p3, "noSound"    # Z
    .param p4, "users"    # Ljava/util/ArrayList;

    .prologue
    .line 524
    invoke-virtual/range {p4 .. p4}, Ljava/util/ArrayList;->size()I

    move-result v14

    const/4 v15, 0x1

    if-ge v14, v15, :cond_0

    .line 577
    :goto_0
    return-void

    .line 528
    :cond_0
    const/4 v14, 0x0

    move-object/from16 v0, p4

    invoke-virtual {v0, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/vkontakte/android/UserProfile;

    .line 532
    .local v13, "user":Lcom/vkontakte/android/UserProfile;
    :try_start_0
    new-instance v14, Lcom/vkontakte/android/api/friends/FriendsGetCommonCount;

    iget v15, v13, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-direct {v14, v15}, Lcom/vkontakte/android/api/friends/FriendsGetCommonCount;-><init>(I)V

    invoke-virtual {v14}, Lcom/vkontakte/android/api/friends/FriendsGetCommonCount;->execSyncWithResult()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/Integer;

    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 538
    .local v2, "commonCount":I
    :goto_1
    const/4 v14, 0x0

    const/high16 v15, 0x8000000

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-static {v0, v14, v1, v15}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v7

    .line 539
    .local v7, "pIntent":Landroid/app/PendingIntent;
    new-instance v3, Landroid/content/Intent;

    const-string/jumbo v14, "com.vkontakte.android.ACCEPT_FRIEND"

    invoke-direct {v3, v14}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 540
    .local v3, "intentAccept":Landroid/content/Intent;
    const-string/jumbo v14, "uid"

    iget v15, v13, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-virtual {v3, v14, v15}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 541
    const-string/jumbo v14, "token"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    iget v0, v13, Lcom/vkontakte/android/UserProfile;->uid:I

    move/from16 v16, v0

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string/jumbo v16, ""

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v15}, Lcom/vkontakte/android/utils/XSRFTokenUtil;->generateToken(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v3, v14, v15}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 542
    const/4 v14, 0x1

    const/high16 v15, 0x50000000

    move-object/from16 v0, p0

    invoke-static {v0, v14, v3, v15}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v8

    .line 543
    .local v8, "pIntentAccept":Landroid/app/PendingIntent;
    new-instance v4, Landroid/content/Intent;

    const-string/jumbo v14, "com.vkontakte.android.DECLINE_FRIEND"

    invoke-direct {v4, v14}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 544
    .local v4, "intentDecline":Landroid/content/Intent;
    const-string/jumbo v14, "uid"

    iget v15, v13, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-virtual {v4, v14, v15}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 545
    const-string/jumbo v14, "token"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    iget v0, v13, Lcom/vkontakte/android/UserProfile;->uid:I

    move/from16 v16, v0

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string/jumbo v16, ""

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v15}, Lcom/vkontakte/android/utils/XSRFTokenUtil;->generateToken(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v4, v14, v15}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 546
    const/4 v14, 0x2

    const/high16 v15, 0x50000000

    move-object/from16 v0, p0

    invoke-static {v0, v14, v4, v15}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v9

    .line 547
    .local v9, "pIntentDecline":Landroid/app/PendingIntent;
    iget-object v14, v13, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-static {v14}, Lcom/vk/imageloader/VKImageLoader;->getCircleBitmap(Ljava/lang/String;)Lio/reactivex/Observable;

    move-result-object v14

    invoke-static {v14}, Lcom/vk/core/util/RxUtil;->blockingGetWithNull(Lio/reactivex/Observable;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/graphics/Bitmap;

    .line 549
    .local v10, "photo":Landroid/graphics/Bitmap;
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v14

    const v15, 0x7f0800b2

    invoke-virtual {v14, v15}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v11

    .line 550
    .local v11, "subtitle":Ljava/lang/String;
    if-lez v2, :cond_1

    .line 551
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const/16 v15, 0x20

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v14

    const/16 v15, 0x28

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v15

    const v16, 0x7f0d000c

    const/16 v17, 0x1

    move/from16 v0, v17

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    aput-object v19, v17, v18

    move/from16 v0, v16

    move-object/from16 v1, v17

    invoke-virtual {v15, v0, v2, v1}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const/16 v15, 0x29

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 554
    :cond_1
    new-instance v14, Landroid/app/Notification$Builder;

    move-object/from16 v0, p0

    invoke-direct {v14, v0}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    iget-object v15, v13, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    .line 555
    invoke-virtual {v14, v15}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v14

    .line 556
    invoke-virtual {v14, v11}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v14

    .line 557
    invoke-virtual {v14, v7}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v14

    if-eqz v10, :cond_3

    .line 558
    .end local v10    # "photo":Landroid/graphics/Bitmap;
    :goto_2
    const/high16 v15, 0x42800000    # 64.0f

    invoke-static {v15}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v15

    const/high16 v16, 0x42800000    # 64.0f

    invoke-static/range {v16 .. v16}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v16

    const/16 v17, 0x1

    move/from16 v0, v16

    move/from16 v1, v17

    invoke-static {v10, v15, v0, v1}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v15

    invoke-virtual {v14, v15}, Landroid/app/Notification$Builder;->setLargeIcon(Landroid/graphics/Bitmap;)Landroid/app/Notification$Builder;

    move-result-object v14

    const v15, 0x7f0202a4

    .line 559
    invoke-virtual {v14, v15}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v14

    .line 560
    move/from16 v0, p2

    invoke-virtual {v14, v0}, Landroid/app/Notification$Builder;->setNumber(I)Landroid/app/Notification$Builder;

    move-result-object v14

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, v13, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    move-object/from16 v16, v0

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string/jumbo v16, " "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    .line 561
    invoke-virtual {v14, v15}, Landroid/app/Notification$Builder;->setTicker(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v6

    .line 563
    .local v6, "ntfb":Landroid/app/Notification$Builder;
    sget v14, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v15, 0x10

    if-lt v14, v15, :cond_2

    .line 564
    const v14, 0x7f020184

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v15

    const v16, 0x7f08023c

    invoke-virtual/range {v15 .. v16}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v6, v14, v15, v8}, Landroid/app/Notification$Builder;->addAction(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v14

    const v15, 0x7f0202c5

    .line 565
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v16

    const v17, 0x7f08023d

    invoke-virtual/range {v16 .. v17}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v14, v15, v0, v9}, Landroid/app/Notification$Builder;->addAction(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    .line 567
    if-lez v2, :cond_2

    .line 568
    new-instance v14, Landroid/app/Notification$BigTextStyle;

    invoke-direct {v14}, Landroid/app/Notification$BigTextStyle;-><init>()V

    invoke-virtual {v14, v11}, Landroid/app/Notification$BigTextStyle;->bigText(Ljava/lang/CharSequence;)Landroid/app/Notification$BigTextStyle;

    move-result-object v14

    invoke-virtual {v6, v14}, Landroid/app/Notification$Builder;->setStyle(Landroid/app/Notification$Style;)Landroid/app/Notification$Builder;

    .line 571
    :cond_2
    invoke-virtual {v6}, Landroid/app/Notification$Builder;->getNotification()Landroid/app/Notification;

    move-result-object v5

    .line 572
    .local v5, "ntf1":Landroid/app/Notification;
    iget v14, v5, Landroid/app/Notification;->flags:I

    or-int/lit8 v14, v14, 0x10

    iput v14, v5, Landroid/app/Notification;->flags:I

    .line 573
    sget-object v14, Lcom/vkontakte/android/NotificationUtils$Type;->FriendRequests:Lcom/vkontakte/android/NotificationUtils$Type;

    const/4 v15, 0x1

    move-object/from16 v0, p0

    invoke-static {v0, v5, v14, v15}, Lcom/vkontakte/android/NotificationUtils;->applySettings(Landroid/content/Context;Landroid/app/Notification;Lcom/vkontakte/android/NotificationUtils$Type;Z)V

    .line 574
    const/16 v14, 0x1f5

    move-object/from16 v0, p0

    move/from16 v1, p3

    invoke-static {v0, v14, v5, v1}, Lcom/vkontakte/android/GCMBroadcastReceiver;->notify(Landroid/content/Context;ILandroid/app/Notification;Z)V

    .line 576
    invoke-static {}, Lcom/vkontakte/android/LongPollService;->updateCounters()V

    goto/16 :goto_0

    .line 533
    .end local v2    # "commonCount":I
    .end local v3    # "intentAccept":Landroid/content/Intent;
    .end local v4    # "intentDecline":Landroid/content/Intent;
    .end local v5    # "ntf1":Landroid/app/Notification;
    .end local v6    # "ntfb":Landroid/app/Notification$Builder;
    .end local v7    # "pIntent":Landroid/app/PendingIntent;
    .end local v8    # "pIntentAccept":Landroid/app/PendingIntent;
    .end local v9    # "pIntentDecline":Landroid/app/PendingIntent;
    .end local v11    # "subtitle":Ljava/lang/String;
    :catch_0
    move-exception v12

    .line 534
    .local v12, "t":Ljava/lang/Throwable;
    invoke-virtual {v12}, Ljava/lang/Throwable;->printStackTrace()V

    .line 535
    const/4 v2, 0x0

    .restart local v2    # "commonCount":I
    goto/16 :goto_1

    .line 558
    .end local v12    # "t":Ljava/lang/Throwable;
    .restart local v3    # "intentAccept":Landroid/content/Intent;
    .restart local v4    # "intentDecline":Landroid/content/Intent;
    .restart local v7    # "pIntent":Landroid/app/PendingIntent;
    .restart local v8    # "pIntentAccept":Landroid/app/PendingIntent;
    .restart local v9    # "pIntentDecline":Landroid/app/PendingIntent;
    .restart local v10    # "photo":Landroid/graphics/Bitmap;
    .restart local v11    # "subtitle":Ljava/lang/String;
    :cond_3
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v15

    const v16, 0x7f0203d3

    invoke-static/range {v15 .. v16}, Lcom/vkontakte/android/Global;->getResBitmap(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v10

    goto/16 :goto_2
.end method

.method static synthetic lambda$null$1(Landroid/content/Context;Landroid/content/Intent;ZLjava/util/ArrayList;)V
    .locals 19
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "noSound"    # Z
    .param p3, "users"    # Ljava/util/ArrayList;

    .prologue
    .line 589
    invoke-virtual/range {p3 .. p3}, Ljava/util/ArrayList;->size()I

    move-result v13

    const/4 v14, 0x2

    if-ge v13, v14, :cond_0

    .line 624
    :goto_0
    return-void

    .line 592
    :cond_0
    const/4 v13, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/vkontakte/android/UserProfile;

    .line 593
    .local v12, "user":Lcom/vkontakte/android/UserProfile;
    const/4 v13, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/UserProfile;

    .line 594
    .local v4, "inviter":Lcom/vkontakte/android/UserProfile;
    iget v13, v12, Lcom/vkontakte/android/UserProfile;->uid:I

    if-lez v13, :cond_1

    .line 595
    move-object v11, v4

    .line 596
    .local v11, "tmp":Lcom/vkontakte/android/UserProfile;
    move-object v4, v12

    .line 597
    move-object v12, v11

    .line 599
    .end local v11    # "tmp":Lcom/vkontakte/android/UserProfile;
    :cond_1
    const/4 v13, 0x0

    const/high16 v14, 0x8000000

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-static {v0, v13, v1, v14}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v7

    .line 600
    .local v7, "pIntent":Landroid/app/PendingIntent;
    new-instance v2, Landroid/content/Intent;

    const-string/jumbo v13, "com.vkontakte.android.ACCEPT_GROUP"

    invoke-direct {v2, v13}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 601
    .local v2, "intentAccept":Landroid/content/Intent;
    const-string/jumbo v13, "gid"

    iget v14, v12, Lcom/vkontakte/android/UserProfile;->uid:I

    neg-int v14, v14

    invoke-virtual {v2, v13, v14}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 602
    const-string/jumbo v13, "token"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    iget v15, v12, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string/jumbo v15, ""

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Lcom/vkontakte/android/utils/XSRFTokenUtil;->generateToken(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v2, v13, v14}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 603
    const/4 v13, 0x1

    const/high16 v14, 0x50000000

    move-object/from16 v0, p0

    invoke-static {v0, v13, v2, v14}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v8

    .line 604
    .local v8, "pIntentAccept":Landroid/app/PendingIntent;
    new-instance v3, Landroid/content/Intent;

    const-string/jumbo v13, "com.vkontakte.android.DECLINE_GROUP"

    invoke-direct {v3, v13}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 605
    .local v3, "intentDecline":Landroid/content/Intent;
    const-string/jumbo v13, "gid"

    iget v14, v12, Lcom/vkontakte/android/UserProfile;->uid:I

    neg-int v14, v14

    invoke-virtual {v3, v13, v14}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 606
    const-string/jumbo v13, "token"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    iget v15, v12, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string/jumbo v15, ""

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Lcom/vkontakte/android/utils/XSRFTokenUtil;->generateToken(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v3, v13, v14}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 607
    const/4 v13, 0x2

    const/high16 v14, 0x50000000

    move-object/from16 v0, p0

    invoke-static {v0, v13, v3, v14}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v9

    .line 608
    .local v9, "pIntentDecline":Landroid/app/PendingIntent;
    iget-object v13, v12, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-static {v13}, Lcom/vk/imageloader/VKImageLoader;->getCircleBitmap(Ljava/lang/String;)Lio/reactivex/Observable;

    move-result-object v13

    invoke-static {v13}, Lcom/vk/core/util/RxUtil;->blockingGetWithNull(Lio/reactivex/Observable;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/graphics/Bitmap;

    .line 609
    .local v10, "photo":Landroid/graphics/Bitmap;
    new-instance v13, Landroid/app/Notification$Builder;

    move-object/from16 v0, p0

    invoke-direct {v13, v0}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    iget-object v14, v12, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    .line 610
    invoke-virtual {v13, v14}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v13

    .line 611
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v14

    const v15, 0x7f0802d6

    const/16 v16, 0x1

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    iget-object v0, v4, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    move-object/from16 v18, v0

    aput-object v18, v16, v17

    invoke-virtual/range {v14 .. v16}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v13

    .line 612
    invoke-virtual {v13, v7}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v13

    if-eqz v10, :cond_3

    .line 613
    .end local v10    # "photo":Landroid/graphics/Bitmap;
    :goto_1
    const/high16 v14, 0x42800000    # 64.0f

    invoke-static {v14}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v14

    const/high16 v15, 0x42800000    # 64.0f

    invoke-static {v15}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v15

    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-static {v10, v14, v15, v0}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v14

    invoke-virtual {v13, v14}, Landroid/app/Notification$Builder;->setLargeIcon(Landroid/graphics/Bitmap;)Landroid/app/Notification$Builder;

    move-result-object v13

    const v14, 0x7f020299

    .line 614
    invoke-virtual {v13, v14}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v13

    .line 615
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v14

    const v15, 0x7f0802d0

    const/16 v16, 0x2

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    iget-object v0, v4, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    move-object/from16 v18, v0

    aput-object v18, v16, v17

    const/16 v17, 0x1

    iget-object v0, v12, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    move-object/from16 v18, v0

    aput-object v18, v16, v17

    invoke-virtual/range {v14 .. v16}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Landroid/app/Notification$Builder;->setTicker(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v6

    .line 616
    .local v6, "ntfb":Landroid/app/Notification$Builder;
    sget v13, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v14, 0x10

    if-lt v13, v14, :cond_2

    .line 617
    const v13, 0x7f020184

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v14

    const v15, 0x7f0802cb

    invoke-virtual {v14, v15}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v6, v13, v14, v8}, Landroid/app/Notification$Builder;->addAction(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v13

    const v14, 0x7f0202c5

    .line 618
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v15

    const v16, 0x7f0802cc

    invoke-virtual/range {v15 .. v16}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v13, v14, v15, v9}, Landroid/app/Notification$Builder;->addAction(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    .line 620
    :cond_2
    invoke-virtual {v6}, Landroid/app/Notification$Builder;->getNotification()Landroid/app/Notification;

    move-result-object v5

    .line 621
    .local v5, "ntf1":Landroid/app/Notification;
    iget v13, v5, Landroid/app/Notification;->flags:I

    or-int/lit8 v13, v13, 0x10

    iput v13, v5, Landroid/app/Notification;->flags:I

    .line 622
    sget-object v13, Lcom/vkontakte/android/NotificationUtils$Type;->GroupInvites:Lcom/vkontakte/android/NotificationUtils$Type;

    const/4 v14, 0x1

    move-object/from16 v0, p0

    invoke-static {v0, v5, v13, v14}, Lcom/vkontakte/android/NotificationUtils;->applySettings(Landroid/content/Context;Landroid/app/Notification;Lcom/vkontakte/android/NotificationUtils$Type;Z)V

    .line 623
    const/16 v13, 0x1fe

    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-static {v0, v13, v5, v1}, Lcom/vkontakte/android/GCMBroadcastReceiver;->notify(Landroid/content/Context;ILandroid/app/Notification;Z)V

    goto/16 :goto_0

    .line 613
    .end local v5    # "ntf1":Landroid/app/Notification;
    .end local v6    # "ntfb":Landroid/app/Notification$Builder;
    .restart local v10    # "photo":Landroid/graphics/Bitmap;
    :cond_3
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v14

    const v15, 0x7f02013d

    invoke-static {v14, v15}, Lcom/vkontakte/android/Global;->getResBitmap(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v10

    goto/16 :goto_1
.end method

.method static synthetic lambda$null$10(Landroid/content/Context;Landroid/content/Intent;Ljava/lang/String;ZZILjava/lang/String;Lcom/vkontakte/android/NotificationUtils$Type;ZLjava/util/ArrayList;)V
    .locals 14
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "place"    # Ljava/lang/String;
    .param p3, "isReply"    # Z
    .param p4, "isMention"    # Z
    .param p5, "replyID"    # I
    .param p6, "text"    # Ljava/lang/String;
    .param p7, "xkey"    # Lcom/vkontakte/android/NotificationUtils$Type;
    .param p8, "noSound"    # Z
    .param p9, "users"    # Ljava/util/ArrayList;

    .prologue
    .line 967
    invoke-virtual/range {p9 .. p9}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-nez v9, :cond_0

    .line 1025
    :goto_0
    return-void

    .line 970
    :cond_0
    const/4 v9, 0x0

    move-object/from16 v0, p9

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/vkontakte/android/UserProfile;

    .line 973
    .local v8, "user":Lcom/vkontakte/android/UserProfile;
    const/4 v9, 0x0

    const/high16 v10, 0x8000000

    invoke-static {p0, v9, p1, v10}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v4

    .line 974
    .local v4, "pIntent":Landroid/app/PendingIntent;
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x7f080156

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    .local v6, "shortTitle":Ljava/lang/String;
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    iget-boolean v9, v8, Lcom/vkontakte/android/UserProfile;->f:Z

    if-eqz v9, :cond_5

    const v9, 0x7f080154

    :goto_1
    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    iget-object v13, v8, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    aput-object v13, v11, v12

    invoke-virtual {v10, v9, v11}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 975
    .local v2, "longTitle":Ljava/lang/String;
    const/4 v7, 0x0

    .line 976
    .local v7, "type":I
    const-string/jumbo v9, "photo"

    move-object/from16 v0, p2

    invoke-virtual {v0, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 977
    const/4 v7, 0x1

    .line 978
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x7f080153

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 979
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    iget-boolean v9, v8, Lcom/vkontakte/android/UserProfile;->f:Z

    if-eqz v9, :cond_6

    const v9, 0x7f080151

    :goto_2
    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    iget-object v13, v8, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    aput-object v13, v11, v12

    invoke-virtual {v10, v9, v11}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 981
    :cond_1
    const-string/jumbo v9, "video"

    move-object/from16 v0, p2

    invoke-virtual {v0, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 982
    const/4 v7, 0x2

    .line 983
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x7f080159

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 984
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    iget-boolean v9, v8, Lcom/vkontakte/android/UserProfile;->f:Z

    if-eqz v9, :cond_7

    const v9, 0x7f080157

    :goto_3
    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    iget-object v13, v8, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    aput-object v13, v11, v12

    invoke-virtual {v10, v9, v11}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 986
    :cond_2
    if-eqz p3, :cond_3

    .line 987
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    iget-boolean v9, v8, Lcom/vkontakte/android/UserProfile;->f:Z

    if-eqz v9, :cond_8

    const v9, 0x7f0805b7

    :goto_4
    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    iget-object v13, v8, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    aput-object v13, v11, v12

    invoke-virtual {v10, v9, v11}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 988
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x7f0805b9

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 990
    :cond_3
    if-eqz p4, :cond_4

    .line 991
    if-eqz p5, :cond_a

    .line 992
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    iget-boolean v9, v8, Lcom/vkontakte/android/UserProfile;->f:Z

    if-eqz v9, :cond_9

    const v9, 0x7f08041d

    :goto_5
    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    iget-object v13, v8, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    aput-object v13, v11, v12

    invoke-virtual {v10, v9, v11}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 993
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x7f080422

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 1003
    :cond_4
    :goto_6
    iget-object v9, v8, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-static {v9}, Lcom/vk/imageloader/VKImageLoader;->getCircleBitmap(Ljava/lang/String;)Lio/reactivex/Observable;

    move-result-object v9

    invoke-static {v9}, Lcom/vk/core/util/RxUtil;->blockingGetWithNull(Lio/reactivex/Observable;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/graphics/Bitmap;

    .line 1004
    .local v5, "photo":Landroid/graphics/Bitmap;
    new-instance v9, Landroid/app/Notification$Builder;

    invoke-direct {v9, p0}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v11, v8, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string/jumbo v11, " "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 1005
    invoke-virtual {v9, v10}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v9

    .line 1006
    move-object/from16 v0, p6

    invoke-virtual {v9, v0}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v9

    .line 1007
    invoke-virtual {v9, v4}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v9

    .line 1008
    invoke-virtual {v9, v2}, Landroid/app/Notification$Builder;->setTicker(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v9

    if-eqz v5, :cond_d

    .line 1009
    .end local v5    # "photo":Landroid/graphics/Bitmap;
    :goto_7
    const/high16 v10, 0x42800000    # 64.0f

    invoke-static {v10}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v10

    const/high16 v11, 0x42800000    # 64.0f

    invoke-static {v11}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v11

    const/4 v12, 0x1

    invoke-static {v5, v10, v11, v12}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/app/Notification$Builder;->setLargeIcon(Landroid/graphics/Bitmap;)Landroid/app/Notification$Builder;

    move-result-object v9

    const v10, 0x7f0202a1

    .line 1011
    invoke-virtual {v9, v10}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v1

    .line 1012
    .local v1, "bldr":Landroid/app/Notification$Builder;
    sget v9, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v10, 0x10

    if-lt v9, v10, :cond_e

    .line 1013
    new-instance v9, Landroid/app/Notification$BigTextStyle;

    invoke-direct {v9, v1}, Landroid/app/Notification$BigTextStyle;-><init>(Landroid/app/Notification$Builder;)V

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v11, v8, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string/jumbo v11, " "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 1014
    invoke-virtual {v9, v10}, Landroid/app/Notification$BigTextStyle;->setBigContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$BigTextStyle;

    move-result-object v9

    .line 1015
    move-object/from16 v0, p6

    invoke-virtual {v9, v0}, Landroid/app/Notification$BigTextStyle;->bigText(Ljava/lang/CharSequence;)Landroid/app/Notification$BigTextStyle;

    move-result-object v9

    .line 1017
    invoke-virtual {v9}, Landroid/app/Notification$BigTextStyle;->build()Landroid/app/Notification;

    move-result-object v3

    .line 1021
    .local v3, "ntf":Landroid/app/Notification;
    :goto_8
    iget v9, v3, Landroid/app/Notification;->flags:I

    or-int/lit8 v9, v9, 0x10

    iput v9, v3, Landroid/app/Notification;->flags:I

    .line 1022
    const/4 v9, 0x1

    move-object/from16 v0, p7

    invoke-static {p0, v3, v0, v9}, Lcom/vkontakte/android/NotificationUtils;->applySettings(Landroid/content/Context;Landroid/app/Notification;Lcom/vkontakte/android/NotificationUtils$Type;Z)V

    .line 1024
    const/16 v9, 0x1f6

    move/from16 v0, p8

    invoke-static {p0, v9, v3, v0}, Lcom/vkontakte/android/GCMBroadcastReceiver;->notify(Landroid/content/Context;ILandroid/app/Notification;Z)V

    goto/16 :goto_0

    .line 974
    .end local v1    # "bldr":Landroid/app/Notification$Builder;
    .end local v2    # "longTitle":Ljava/lang/String;
    .end local v3    # "ntf":Landroid/app/Notification;
    .end local v7    # "type":I
    :cond_5
    const v9, 0x7f080155

    goto/16 :goto_1

    .line 979
    .restart local v2    # "longTitle":Ljava/lang/String;
    .restart local v7    # "type":I
    :cond_6
    const v9, 0x7f080152

    goto/16 :goto_2

    .line 984
    :cond_7
    const v9, 0x7f080158

    goto/16 :goto_3

    .line 987
    :cond_8
    const v9, 0x7f0805b8

    goto/16 :goto_4

    .line 992
    :cond_9
    const v9, 0x7f08041e

    goto/16 :goto_5

    .line 995
    :cond_a
    iget v9, v8, Lcom/vkontakte/android/UserProfile;->uid:I

    if-gez v9, :cond_b

    .line 996
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x7f08041f

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    iget-object v13, v8, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    aput-object v13, v11, v12

    invoke-virtual {v9, v10, v11}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 1000
    :goto_9
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x7f080422

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_6

    .line 998
    :cond_b
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    iget-boolean v9, v8, Lcom/vkontakte/android/UserProfile;->f:Z

    if-eqz v9, :cond_c

    const v9, 0x7f080420

    :goto_a
    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    iget-object v13, v8, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    aput-object v13, v11, v12

    invoke-virtual {v10, v9, v11}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto :goto_9

    :cond_c
    const v9, 0x7f080421

    goto :goto_a

    .line 1009
    .restart local v5    # "photo":Landroid/graphics/Bitmap;
    :cond_d
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f0203d3

    invoke-static {v10, v11}, Lcom/vkontakte/android/Global;->getResBitmap(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v5

    goto/16 :goto_7

    .line 1019
    .end local v5    # "photo":Landroid/graphics/Bitmap;
    .restart local v1    # "bldr":Landroid/app/Notification$Builder;
    :cond_e
    invoke-virtual {v1}, Landroid/app/Notification$Builder;->getNotification()Landroid/app/Notification;

    move-result-object v3

    .restart local v3    # "ntf":Landroid/app/Notification;
    goto :goto_8
.end method

.method static synthetic lambda$null$2(ILjava/lang/String;Landroid/content/Context;ZLjava/util/ArrayList;)V
    .locals 16
    .param p0, "uid"    # I
    .param p1, "service"    # Ljava/lang/String;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "noSound"    # Z
    .param p4, "users"    # Ljava/util/ArrayList;

    .prologue
    .line 655
    invoke-virtual/range {p4 .. p4}, Ljava/util/ArrayList;->size()I

    move-result v12

    const/4 v13, 0x1

    if-ge v12, v13, :cond_0

    .line 700
    .end local p1    # "service":Ljava/lang/String;
    :goto_0
    return-void

    .line 658
    .restart local p1    # "service":Ljava/lang/String;
    :cond_0
    new-instance v2, Landroid/content/Intent;

    const-string/jumbo v12, "android.intent.action.VIEW"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "vkontakte://profile/"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move/from16 v0, p0

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v13

    invoke-direct {v2, v12, v13}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 659
    .local v2, "intent":Landroid/content/Intent;
    const/4 v12, 0x0

    move-object/from16 v0, p4

    invoke-virtual {v0, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/vkontakte/android/UserProfile;

    .line 660
    .local v11, "user":Lcom/vkontakte/android/UserProfile;
    const/4 v9, 0x0

    .line 661
    .local v9, "serviceStr":I
    const-string/jumbo v12, "email"

    move-object/from16 v0, p1

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_3

    .line 662
    const v9, 0x7f08022c

    .line 676
    :cond_1
    :goto_1
    iget-boolean v12, v11, Lcom/vkontakte/android/UserProfile;->f:Z

    if-eqz v12, :cond_9

    const v12, 0x7f080464

    :goto_2
    const/4 v13, 0x2

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    iget-object v15, v11, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    aput-object v15, v13, v14

    const/4 v14, 0x1

    if-eqz v9, :cond_2

    move-object/from16 v0, p2

    invoke-virtual {v0, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    .end local p1    # "service":Ljava/lang/String;
    :cond_2
    aput-object p1, v13, v14

    move-object/from16 v0, p2

    invoke-virtual {v0, v12, v13}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    .line 677
    .local v10, "text":Ljava/lang/String;
    const/4 v12, 0x0

    const/high16 v13, 0x8000000

    move-object/from16 v0, p2

    invoke-static {v0, v12, v2, v13}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v6

    .line 678
    .local v6, "pIntent":Landroid/app/PendingIntent;
    new-instance v3, Landroid/content/Intent;

    const-string/jumbo v12, "com.vkontakte.android.ACCEPT_FRIEND"

    invoke-direct {v3, v12}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 679
    .local v3, "intentAccept":Landroid/content/Intent;
    const-string/jumbo v12, "uid"

    iget v13, v11, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-virtual {v3, v12, v13}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 680
    const-string/jumbo v12, "notifyId"

    const/16 v13, 0x1f7

    invoke-virtual {v3, v12, v13}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 681
    const/4 v12, 0x1

    const/high16 v13, 0x50000000

    move-object/from16 v0, p2

    invoke-static {v0, v12, v3, v13}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v7

    .line 682
    .local v7, "pIntentAccept":Landroid/app/PendingIntent;
    iget-object v12, v11, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-static {v12}, Lcom/vk/imageloader/VKImageLoader;->getCircleBitmap(Ljava/lang/String;)Lio/reactivex/Observable;

    move-result-object v12

    invoke-static {v12}, Lcom/vk/core/util/RxUtil;->blockingGetWithNull(Lio/reactivex/Observable;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/graphics/Bitmap;

    .line 683
    .local v8, "photo":Landroid/graphics/Bitmap;
    new-instance v13, Landroid/app/Notification$Builder;

    move-object/from16 v0, p2

    invoke-direct {v13, v0}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    iget-boolean v12, v11, Lcom/vkontakte/android/UserProfile;->f:Z

    if-eqz v12, :cond_a

    const v12, 0x7f080466

    .line 684
    :goto_3
    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v13, v12}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v12

    .line 685
    invoke-virtual {v12, v10}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v12

    .line 686
    invoke-virtual {v12, v6}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v12

    if-eqz v8, :cond_b

    .line 687
    .end local v8    # "photo":Landroid/graphics/Bitmap;
    :goto_4
    const/high16 v13, 0x42800000    # 64.0f

    invoke-static {v13}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v13

    const/high16 v14, 0x42800000    # 64.0f

    invoke-static {v14}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v14

    const/4 v15, 0x1

    invoke-static {v8, v13, v14, v15}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v13

    invoke-virtual {v12, v13}, Landroid/app/Notification$Builder;->setLargeIcon(Landroid/graphics/Bitmap;)Landroid/app/Notification$Builder;

    move-result-object v12

    const v13, 0x7f0202a4

    .line 688
    invoke-virtual {v12, v13}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v12

    .line 689
    invoke-virtual {v12, v10}, Landroid/app/Notification$Builder;->setTicker(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v5

    .line 691
    .local v5, "ntfb":Landroid/app/Notification$Builder;
    sget v12, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v13, 0x10

    if-lt v12, v13, :cond_c

    .line 692
    const v12, 0x7f02015f

    invoke-virtual/range {p2 .. p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v13

    const v14, 0x7f080540

    invoke-virtual {v13, v14}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v5, v12, v13, v7}, Landroid/app/Notification$Builder;->addAction(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    .line 693
    new-instance v12, Landroid/app/Notification$BigTextStyle;

    invoke-direct {v12, v5}, Landroid/app/Notification$BigTextStyle;-><init>(Landroid/app/Notification$Builder;)V

    invoke-virtual {v12, v10}, Landroid/app/Notification$BigTextStyle;->bigText(Ljava/lang/CharSequence;)Landroid/app/Notification$BigTextStyle;

    move-result-object v12

    invoke-virtual {v12}, Landroid/app/Notification$BigTextStyle;->build()Landroid/app/Notification;

    move-result-object v4

    .line 697
    .local v4, "ntf":Landroid/app/Notification;
    :goto_5
    iget v12, v4, Landroid/app/Notification;->flags:I

    or-int/lit8 v12, v12, 0x10

    iput v12, v4, Landroid/app/Notification;->flags:I

    .line 698
    sget-object v12, Lcom/vkontakte/android/NotificationUtils$Type;->FoundFriends:Lcom/vkontakte/android/NotificationUtils$Type;

    const/4 v13, 0x1

    move-object/from16 v0, p2

    invoke-static {v0, v4, v12, v13}, Lcom/vkontakte/android/NotificationUtils;->applySettings(Landroid/content/Context;Landroid/app/Notification;Lcom/vkontakte/android/NotificationUtils$Type;Z)V

    .line 699
    const/16 v12, 0x1f7

    move-object/from16 v0, p2

    move/from16 v1, p3

    invoke-static {v0, v12, v4, v1}, Lcom/vkontakte/android/GCMBroadcastReceiver;->notify(Landroid/content/Context;ILandroid/app/Notification;Z)V

    goto/16 :goto_0

    .line 663
    .end local v3    # "intentAccept":Landroid/content/Intent;
    .end local v4    # "ntf":Landroid/app/Notification;
    .end local v5    # "ntfb":Landroid/app/Notification$Builder;
    .end local v6    # "pIntent":Landroid/app/PendingIntent;
    .end local v7    # "pIntentAccept":Landroid/app/PendingIntent;
    .end local v10    # "text":Ljava/lang/String;
    .restart local p1    # "service":Ljava/lang/String;
    :cond_3
    const-string/jumbo v12, "phone"

    move-object/from16 v0, p1

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_4

    .line 664
    const v9, 0x7f080231

    goto/16 :goto_1

    .line 665
    :cond_4
    const-string/jumbo v12, "twitter"

    move-object/from16 v0, p1

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_5

    .line 666
    const v9, 0x7f080232

    goto/16 :goto_1

    .line 667
    :cond_5
    const-string/jumbo v12, "facebook"

    move-object/from16 v0, p1

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_6

    .line 668
    const v9, 0x7f08022d

    goto/16 :goto_1

    .line 669
    :cond_6
    const-string/jumbo v12, "odnoklassniki"

    move-object/from16 v0, p1

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_7

    .line 670
    const v9, 0x7f080230

    goto/16 :goto_1

    .line 671
    :cond_7
    const-string/jumbo v12, "instagram"

    move-object/from16 v0, p1

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_8

    .line 672
    const v9, 0x7f08022f

    goto/16 :goto_1

    .line 673
    :cond_8
    const-string/jumbo v12, "google"

    move-object/from16 v0, p1

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_1

    .line 674
    const v9, 0x7f08022e

    goto/16 :goto_1

    .line 676
    :cond_9
    const v12, 0x7f080465

    goto/16 :goto_2

    .line 683
    .end local p1    # "service":Ljava/lang/String;
    .restart local v3    # "intentAccept":Landroid/content/Intent;
    .restart local v6    # "pIntent":Landroid/app/PendingIntent;
    .restart local v7    # "pIntentAccept":Landroid/app/PendingIntent;
    .restart local v8    # "photo":Landroid/graphics/Bitmap;
    .restart local v10    # "text":Ljava/lang/String;
    :cond_a
    const v12, 0x7f080467

    goto/16 :goto_3

    .line 687
    :cond_b
    invoke-virtual/range {p2 .. p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v13

    const v14, 0x7f0203d3

    invoke-static {v13, v14}, Lcom/vkontakte/android/Global;->getResBitmap(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v8

    goto/16 :goto_4

    .line 695
    .end local v8    # "photo":Landroid/graphics/Bitmap;
    .restart local v5    # "ntfb":Landroid/app/Notification$Builder;
    :cond_c
    invoke-virtual {v5}, Landroid/app/Notification$Builder;->getNotification()Landroid/app/Notification;

    move-result-object v4

    .restart local v4    # "ntf":Landroid/app/Notification;
    goto/16 :goto_5
.end method

.method static synthetic lambda$null$3(ILandroid/content/Context;ZLjava/util/ArrayList;)V
    .locals 11
    .param p0, "uid"    # I
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "noSound"    # Z
    .param p3, "users"    # Ljava/util/ArrayList;

    .prologue
    .line 708
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result v7

    const/4 v8, 0x1

    if-ge v7, v8, :cond_0

    .line 728
    :goto_0
    return-void

    .line 711
    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v7, "android.intent.action.VIEW"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "vkontakte://profile/"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v8

    invoke-direct {v0, v7, v8}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 712
    .local v0, "intent":Landroid/content/Intent;
    const/4 v7, 0x0

    invoke-virtual {p3, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/vkontakte/android/UserProfile;

    .line 713
    .local v6, "user":Lcom/vkontakte/android/UserProfile;
    const/4 v7, 0x0

    const/high16 v8, 0x40000000    # 2.0f

    invoke-static {p1, v7, v0, v8}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v3

    .line 714
    .local v3, "pIntent":Landroid/app/PendingIntent;
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    iget-boolean v7, v6, Lcom/vkontakte/android/UserProfile;->f:Z

    if-eqz v7, :cond_1

    const v7, 0x7f0c0018

    :goto_1
    invoke-virtual {v8, v7}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x0

    aget-object v5, v7, v8

    .line 715
    .local v5, "text":Ljava/lang/String;
    iget-object v7, v6, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-static {v7}, Lcom/vk/imageloader/VKImageLoader;->getCircleBitmap(Ljava/lang/String;)Lio/reactivex/Observable;

    move-result-object v7

    invoke-static {v7}, Lcom/vk/core/util/RxUtil;->blockingGetWithNull(Lio/reactivex/Observable;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/graphics/Bitmap;

    .line 716
    .local v4, "photo":Landroid/graphics/Bitmap;
    new-instance v7, Landroid/app/Notification$Builder;

    invoke-direct {v7, p1}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    iget-object v8, v6, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    .line 717
    invoke-virtual {v7, v8}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v7

    .line 718
    invoke-virtual {v7, v5}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v7

    .line 719
    invoke-virtual {v7, v3}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v7

    if-eqz v4, :cond_2

    .line 720
    .end local v4    # "photo":Landroid/graphics/Bitmap;
    :goto_2
    const/high16 v8, 0x42800000    # 64.0f

    invoke-static {v8}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v8

    const/high16 v9, 0x42800000    # 64.0f

    invoke-static {v9}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v9

    const/4 v10, 0x1

    invoke-static {v4, v8, v9, v10}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/app/Notification$Builder;->setLargeIcon(Landroid/graphics/Bitmap;)Landroid/app/Notification$Builder;

    move-result-object v7

    const v8, 0x7f0202a4

    .line 721
    invoke-virtual {v7, v8}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v9, v6, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, " "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 722
    invoke-virtual {v7, v8}, Landroid/app/Notification$Builder;->setTicker(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v2

    .line 724
    .local v2, "ntfb":Landroid/app/Notification$Builder;
    invoke-virtual {v2}, Landroid/app/Notification$Builder;->getNotification()Landroid/app/Notification;

    move-result-object v1

    .line 725
    .local v1, "ntf":Landroid/app/Notification;
    iget v7, v1, Landroid/app/Notification;->flags:I

    or-int/lit8 v7, v7, 0x10

    iput v7, v1, Landroid/app/Notification;->flags:I

    .line 726
    sget-object v7, Lcom/vkontakte/android/NotificationUtils$Type;->Default:Lcom/vkontakte/android/NotificationUtils$Type;

    const/4 v8, 0x1

    invoke-static {p1, v1, v7, v8}, Lcom/vkontakte/android/NotificationUtils;->applySettings(Landroid/content/Context;Landroid/app/Notification;Lcom/vkontakte/android/NotificationUtils$Type;Z)V

    .line 727
    const/16 v7, 0x1ff

    invoke-static {p1, v7, v1, p2}, Lcom/vkontakte/android/GCMBroadcastReceiver;->notify(Landroid/content/Context;ILandroid/app/Notification;Z)V

    goto/16 :goto_0

    .line 714
    .end local v1    # "ntf":Landroid/app/Notification;
    .end local v2    # "ntfb":Landroid/app/Notification$Builder;
    .end local v5    # "text":Ljava/lang/String;
    :cond_1
    const v7, 0x7f0c0019

    goto :goto_1

    .line 720
    .restart local v4    # "photo":Landroid/graphics/Bitmap;
    .restart local v5    # "text":Ljava/lang/String;
    :cond_2
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f0203d3

    invoke-static {v8, v9}, Lcom/vkontakte/android/Global;->getResBitmap(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v4

    goto :goto_2
.end method

.method static synthetic lambda$null$4(Landroid/content/Context;Landroid/os/Bundle;ZLjava/util/ArrayList;)V
    .locals 7
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "extras"    # Landroid/os/Bundle;
    .param p2, "noSound"    # Z
    .param p3, "users"    # Ljava/util/ArrayList;

    .prologue
    .line 737
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x1

    if-ge v0, v1, :cond_0

    .line 742
    :goto_0
    return-void

    .line 740
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/vkontakte/android/UserProfile;

    .line 741
    .local v6, "user":Lcom/vkontakte/android/UserProfile;
    iget-object v2, v6, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    iget-boolean v3, v6, Lcom/vkontakte/android/UserProfile;->f:Z

    invoke-virtual {v6}, Lcom/vkontakte/android/UserProfile;->getIsGroup()Z

    move-result v5

    move-object v0, p0

    move-object v1, p1

    move v4, p2

    invoke-static/range {v0 .. v5}, Lcom/vkontakte/android/GCMBroadcastReceiver;->showMoneyTransferNotification(Landroid/content/Context;Landroid/os/Bundle;Ljava/lang/String;ZZZ)V

    goto :goto_0
.end method

.method static synthetic lambda$null$5(ILandroid/content/Context;ZLjava/util/ArrayList;)V
    .locals 12
    .param p0, "gid"    # I
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "noSound"    # Z
    .param p3, "users"    # Ljava/util/ArrayList;

    .prologue
    .line 758
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result v7

    const/4 v8, 0x1

    if-ge v7, v8, :cond_0

    .line 778
    :goto_0
    return-void

    .line 761
    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v7, "android.intent.action.VIEW"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "vkontakte://profile/-"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v8

    invoke-direct {v0, v7, v8}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 762
    .local v0, "intent":Landroid/content/Intent;
    const/4 v7, 0x0

    invoke-virtual {p3, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/vkontakte/android/UserProfile;

    .line 763
    .local v6, "user":Lcom/vkontakte/android/UserProfile;
    const/4 v7, 0x0

    const/high16 v8, 0x40000000    # 2.0f

    invoke-static {p1, v7, v0, v8}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v3

    .line 764
    .local v3, "pIntent":Landroid/app/PendingIntent;
    const v7, 0x7f08046a

    invoke-virtual {p1, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 765
    .local v5, "text":Ljava/lang/String;
    iget-object v7, v6, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-static {v7}, Lcom/vk/imageloader/VKImageLoader;->getCircleBitmap(Ljava/lang/String;)Lio/reactivex/Observable;

    move-result-object v7

    invoke-static {v7}, Lcom/vk/core/util/RxUtil;->blockingGetWithNull(Lio/reactivex/Observable;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/graphics/Bitmap;

    .line 766
    .local v4, "photo":Landroid/graphics/Bitmap;
    new-instance v7, Landroid/app/Notification$Builder;

    invoke-direct {v7, p1}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    iget-object v8, v6, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    .line 767
    invoke-virtual {v7, v8}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v7

    .line 768
    invoke-virtual {v7, v5}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v7

    .line 769
    invoke-virtual {v7, v3}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v7

    if-eqz v4, :cond_1

    .line 770
    .end local v4    # "photo":Landroid/graphics/Bitmap;
    :goto_1
    const/high16 v8, 0x42800000    # 64.0f

    invoke-static {v8}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v8

    const/high16 v9, 0x42800000    # 64.0f

    invoke-static {v9}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v9

    const/4 v10, 0x1

    invoke-static {v4, v8, v9, v10}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/app/Notification$Builder;->setLargeIcon(Landroid/graphics/Bitmap;)Landroid/app/Notification$Builder;

    move-result-object v7

    const v8, 0x7f020299

    .line 771
    invoke-virtual {v7, v8}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v7

    const v8, 0x7f08046b

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    iget-object v11, v6, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    aput-object v11, v9, v10

    .line 772
    invoke-virtual {p1, v8, v9}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/app/Notification$Builder;->setTicker(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v2

    .line 774
    .local v2, "ntfb":Landroid/app/Notification$Builder;
    invoke-virtual {v2}, Landroid/app/Notification$Builder;->getNotification()Landroid/app/Notification;

    move-result-object v1

    .line 775
    .local v1, "ntf":Landroid/app/Notification;
    iget v7, v1, Landroid/app/Notification;->flags:I

    or-int/lit8 v7, v7, 0x10

    iput v7, v1, Landroid/app/Notification;->flags:I

    .line 776
    sget-object v7, Lcom/vkontakte/android/NotificationUtils$Type;->Default:Lcom/vkontakte/android/NotificationUtils$Type;

    const/4 v8, 0x1

    invoke-static {p1, v1, v7, v8}, Lcom/vkontakte/android/NotificationUtils;->applySettings(Landroid/content/Context;Landroid/app/Notification;Lcom/vkontakte/android/NotificationUtils$Type;Z)V

    .line 777
    const/16 v7, 0x200

    invoke-static {p1, v7, v1, p2}, Lcom/vkontakte/android/GCMBroadcastReceiver;->notify(Landroid/content/Context;ILandroid/app/Notification;Z)V

    goto/16 :goto_0

    .line 770
    .end local v1    # "ntf":Landroid/app/Notification;
    .end local v2    # "ntfb":Landroid/app/Notification$Builder;
    .restart local v4    # "photo":Landroid/graphics/Bitmap;
    :cond_1
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f02013d

    invoke-static {v8, v9}, Lcom/vkontakte/android/Global;->getResBitmap(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v4

    goto :goto_1
.end method

.method static synthetic lambda$null$6(ILandroid/content/Context;IZLjava/util/ArrayList;)V
    .locals 13
    .param p0, "gid"    # I
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "startTime"    # I
    .param p3, "noSound"    # Z
    .param p4, "users"    # Ljava/util/ArrayList;

    .prologue
    .line 801
    invoke-virtual/range {p4 .. p4}, Ljava/util/ArrayList;->size()I

    move-result v8

    const/4 v9, 0x1

    if-ge v8, v9, :cond_0

    .line 821
    :goto_0
    return-void

    .line 804
    :cond_0
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v8, "android.intent.action.VIEW"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "vkontakte://profile/-"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v9

    invoke-direct {v1, v8, v9}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 805
    .local v1, "intent":Landroid/content/Intent;
    const/4 v8, 0x0

    move-object/from16 v0, p4

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/vkontakte/android/UserProfile;

    .line 806
    .local v7, "user":Lcom/vkontakte/android/UserProfile;
    const/4 v8, 0x0

    const/high16 v9, 0x40000000    # 2.0f

    invoke-static {p1, v8, v1, v9}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v4

    .line 807
    .local v4, "pIntent":Landroid/app/PendingIntent;
    const v8, 0x7f080475

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    invoke-static {p2}, Lcom/vkontakte/android/TimeUtils;->langDate(I)Ljava/lang/String;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-virtual {p1, v8, v9}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    .line 808
    .local v6, "text":Ljava/lang/String;
    iget-object v8, v7, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-static {v8}, Lcom/vk/imageloader/VKImageLoader;->getCircleBitmap(Ljava/lang/String;)Lio/reactivex/Observable;

    move-result-object v8

    invoke-static {v8}, Lcom/vk/core/util/RxUtil;->blockingGetWithNull(Lio/reactivex/Observable;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/graphics/Bitmap;

    .line 809
    .local v5, "photo":Landroid/graphics/Bitmap;
    new-instance v8, Landroid/app/Notification$Builder;

    invoke-direct {v8, p1}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    iget-object v9, v7, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    .line 810
    invoke-virtual {v8, v9}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v8

    .line 811
    invoke-virtual {v8, v6}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v8

    .line 812
    invoke-virtual {v8, v4}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v8

    if-eqz v5, :cond_1

    .line 813
    .end local v5    # "photo":Landroid/graphics/Bitmap;
    :goto_1
    const/high16 v9, 0x42800000    # 64.0f

    invoke-static {v9}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v9

    const/high16 v10, 0x42800000    # 64.0f

    invoke-static {v10}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v10

    const/4 v11, 0x1

    invoke-static {v5, v9, v10, v11}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/app/Notification$Builder;->setLargeIcon(Landroid/graphics/Bitmap;)Landroid/app/Notification$Builder;

    move-result-object v8

    const v9, 0x7f020299

    .line 814
    invoke-virtual {v8, v9}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v8

    const v9, 0x7f080476

    const/4 v10, 0x2

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    iget-object v12, v7, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    aput-object v12, v10, v11

    const/4 v11, 0x1

    .line 815
    invoke-static {p2}, Lcom/vkontakte/android/TimeUtils;->langDate(I)Ljava/lang/String;

    move-result-object v12

    aput-object v12, v10, v11

    invoke-virtual {p1, v9, v10}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/app/Notification$Builder;->setTicker(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v3

    .line 817
    .local v3, "ntfb":Landroid/app/Notification$Builder;
    invoke-virtual {v3}, Landroid/app/Notification$Builder;->getNotification()Landroid/app/Notification;

    move-result-object v2

    .line 818
    .local v2, "ntf":Landroid/app/Notification;
    iget v8, v2, Landroid/app/Notification;->flags:I

    or-int/lit8 v8, v8, 0x10

    iput v8, v2, Landroid/app/Notification;->flags:I

    .line 819
    sget-object v8, Lcom/vkontakte/android/NotificationUtils$Type;->UpcomingEvents:Lcom/vkontakte/android/NotificationUtils$Type;

    const/4 v9, 0x1

    invoke-static {p1, v2, v8, v9}, Lcom/vkontakte/android/NotificationUtils;->applySettings(Landroid/content/Context;Landroid/app/Notification;Lcom/vkontakte/android/NotificationUtils$Type;Z)V

    .line 820
    const/16 v8, 0x202

    move/from16 v0, p3

    invoke-static {p1, v8, v2, v0}, Lcom/vkontakte/android/GCMBroadcastReceiver;->notify(Landroid/content/Context;ILandroid/app/Notification;Z)V

    goto/16 :goto_0

    .line 813
    .end local v2    # "ntf":Landroid/app/Notification;
    .end local v3    # "ntfb":Landroid/app/Notification$Builder;
    .restart local v5    # "photo":Landroid/graphics/Bitmap;
    :cond_1
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x7f02013d

    invoke-static {v9, v10}, Lcom/vkontakte/android/Global;->getResBitmap(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v5

    goto :goto_1
.end method

.method static synthetic lambda$null$7(Landroid/os/Bundle;Landroid/content/Context;ZLjava/util/ArrayList;)V
    .locals 12
    .param p0, "extras"    # Landroid/os/Bundle;
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "noSound"    # Z
    .param p3, "users"    # Ljava/util/ArrayList;

    .prologue
    .line 839
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result v7

    const/4 v8, 0x1

    if-ge v7, v8, :cond_0

    .line 859
    :goto_0
    return-void

    .line 842
    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v7, "android.intent.action.VIEW"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "vkontakte://vk.com/"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, "place"

    invoke-virtual {p0, v9}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v8

    invoke-direct {v0, v7, v8}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 843
    .local v0, "intent":Landroid/content/Intent;
    const/4 v7, 0x0

    invoke-virtual {p3, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/vkontakte/android/UserProfile;

    .line 844
    .local v6, "user":Lcom/vkontakte/android/UserProfile;
    const/4 v7, 0x0

    const/high16 v8, 0x40000000    # 2.0f

    invoke-static {p1, v7, v0, v8}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v3

    .line 845
    .local v3, "pIntent":Landroid/app/PendingIntent;
    const v7, 0x7f08046c

    invoke-virtual {p1, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 846
    .local v5, "text":Ljava/lang/String;
    iget-object v7, v6, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-static {v7}, Lcom/vk/imageloader/VKImageLoader;->getCircleBitmap(Ljava/lang/String;)Lio/reactivex/Observable;

    move-result-object v7

    invoke-static {v7}, Lcom/vk/core/util/RxUtil;->blockingGetWithNull(Lio/reactivex/Observable;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/graphics/Bitmap;

    .line 847
    .local v4, "photo":Landroid/graphics/Bitmap;
    new-instance v7, Landroid/app/Notification$Builder;

    invoke-direct {v7, p1}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    iget-object v8, v6, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    .line 848
    invoke-virtual {v7, v8}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v7

    .line 849
    invoke-virtual {v7, v5}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v7

    .line 850
    invoke-virtual {v7, v3}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v7

    if-eqz v4, :cond_1

    .line 851
    .end local v4    # "photo":Landroid/graphics/Bitmap;
    :goto_1
    const/high16 v8, 0x42800000    # 64.0f

    invoke-static {v8}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v8

    const/high16 v9, 0x42800000    # 64.0f

    invoke-static {v9}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v9

    const/4 v10, 0x1

    invoke-static {v4, v8, v9, v10}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/app/Notification$Builder;->setLargeIcon(Landroid/graphics/Bitmap;)Landroid/app/Notification$Builder;

    move-result-object v7

    const v8, 0x7f0202a1

    .line 852
    invoke-virtual {v7, v8}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v7

    const v8, 0x7f08046d

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    iget-object v11, v6, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    aput-object v11, v9, v10

    .line 853
    invoke-virtual {p1, v8, v9}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/app/Notification$Builder;->setTicker(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v2

    .line 855
    .local v2, "ntfb":Landroid/app/Notification$Builder;
    invoke-virtual {v2}, Landroid/app/Notification$Builder;->getNotification()Landroid/app/Notification;

    move-result-object v1

    .line 856
    .local v1, "ntf":Landroid/app/Notification;
    iget v7, v1, Landroid/app/Notification;->flags:I

    or-int/lit8 v7, v7, 0x10

    iput v7, v1, Landroid/app/Notification;->flags:I

    .line 857
    sget-object v7, Lcom/vkontakte/android/NotificationUtils$Type;->Default:Lcom/vkontakte/android/NotificationUtils$Type;

    const/4 v8, 0x1

    invoke-static {p1, v1, v7, v8}, Lcom/vkontakte/android/NotificationUtils;->applySettings(Landroid/content/Context;Landroid/app/Notification;Lcom/vkontakte/android/NotificationUtils$Type;Z)V

    .line 858
    const/16 v7, 0x201

    invoke-static {p1, v7, v1, p2}, Lcom/vkontakte/android/GCMBroadcastReceiver;->notify(Landroid/content/Context;ILandroid/app/Notification;Z)V

    goto/16 :goto_0

    .line 851
    .end local v1    # "ntf":Landroid/app/Notification;
    .end local v2    # "ntfb":Landroid/app/Notification$Builder;
    .restart local v4    # "photo":Landroid/graphics/Bitmap;
    :cond_1
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f02013d

    invoke-static {v8, v9}, Lcom/vkontakte/android/Global;->getResBitmap(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v4

    goto :goto_1
.end method

.method static synthetic lambda$null$8(Landroid/content/Context;Landroid/os/Bundle;ZLjava/util/ArrayList;)V
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "extras"    # Landroid/os/Bundle;
    .param p2, "noSound"    # Z
    .param p3, "users"    # Ljava/util/ArrayList;

    .prologue
    .line 890
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-nez v1, :cond_0

    .line 895
    :goto_0
    return-void

    .line 893
    :cond_0
    const/4 v1, 0x0

    invoke-virtual {p3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    .line 894
    .local v0, "user":Lcom/vkontakte/android/UserProfile;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, v0, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, v0, Lcom/vkontakte/android/UserProfile;->lastName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, v0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-static {p0, p1, v1, v2, p2}, Lcom/vkontakte/android/GCMBroadcastReceiver;->showLikeNotification(Landroid/content/Context;Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;Z)V

    goto :goto_0
.end method

.method static synthetic lambda$null$9(Landroid/content/Context;Landroid/os/Bundle;ZLjava/util/ArrayList;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "extras"    # Landroid/os/Bundle;
    .param p2, "noSound"    # Z
    .param p3, "users"    # Ljava/util/ArrayList;

    .prologue
    .line 924
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-nez v1, :cond_0

    .line 929
    :goto_0
    return-void

    .line 927
    :cond_0
    const/4 v1, 0x0

    invoke-virtual {p3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    .line 928
    .local v0, "user":Lcom/vkontakte/android/UserProfile;
    invoke-static {p0, p1, v0, p2}, Lcom/vkontakte/android/GCMBroadcastReceiver;->showRepostNotification(Landroid/content/Context;Landroid/os/Bundle;Lcom/vkontakte/android/UserProfile;Z)V

    goto :goto_0
.end method

.method static synthetic lambda$showMessageNotification$12(Lcom/vkontakte/android/Message;Ljava/util/ArrayList;)V
    .locals 14
    .param p0, "msg"    # Lcom/vkontakte/android/Message;
    .param p1, "users"    # Ljava/util/ArrayList;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 1279
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-nez v1, :cond_1

    .line 1323
    :cond_0
    :goto_0
    return-void

    .line 1282
    :cond_1
    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/vkontakte/android/UserProfile;

    .line 1283
    .local v11, "user":Lcom/vkontakte/android/UserProfile;
    iget-object v10, p0, Lcom/vkontakte/android/Message;->text:Ljava/lang/String;

    .line 1284
    .local v10, "notifyText":Ljava/lang/String;
    iget-boolean v1, p0, Lcom/vkontakte/android/Message;->isServiceMessage:Z

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    const-string/jumbo v5, "action"

    invoke-virtual {v1, v5}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1285
    iget-object v1, p0, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    const-string/jumbo v5, "action_user_name_acc"

    invoke-virtual {v1, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v11, v1}, Lcom/vkontakte/android/Message;->getServiceMessageText(Lcom/vkontakte/android/UserProfile;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 1288
    :cond_2
    iget-object v1, p0, Lcom/vkontakte/android/Message;->attachments:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_6

    iget-object v1, p0, Lcom/vkontakte/android/Message;->fwdMessages:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_6

    move v7, v2

    .line 1289
    .local v7, "hasDifferentAttachmentsType":Z
    :goto_1
    if-nez v7, :cond_3

    .line 1290
    iget-object v1, p0, Lcom/vkontakte/android/Message;->attachments:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-le v1, v2, :cond_3

    .line 1291
    const/4 v8, 0x1

    .local v8, "i":I
    :goto_2
    iget-object v1, p0, Lcom/vkontakte/android/Message;->attachments:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v8, v1, :cond_3

    .line 1292
    iget-object v1, p0, Lcom/vkontakte/android/Message;->attachments:Ljava/util/List;

    invoke-interface {v1, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/attachments/Attachment;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    iget-object v1, p0, Lcom/vkontakte/android/Message;->attachments:Ljava/util/List;

    add-int/lit8 v12, v8, -0x1

    invoke-interface {v1, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/attachments/Attachment;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-eq v5, v1, :cond_7

    move v7, v2

    .line 1293
    :goto_3
    if-eqz v7, :cond_8

    .line 1300
    .end local v8    # "i":I
    :cond_3
    const/4 v9, 0x0

    .line 1301
    .local v9, "notifyAdd":Ljava/lang/String;
    if-eqz v7, :cond_9

    .line 1302
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const v2, 0x7f0800df

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 1313
    :cond_4
    :goto_4
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_5

    .line 1314
    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_d

    .line 1315
    move-object v10, v9

    .line 1320
    :cond_5
    :goto_5
    invoke-static {v10}, Lcom/vkontakte/android/LinkParser;->hasCurrentUserMention(Ljava/lang/String;)Z

    move-result v4

    .line 1321
    .local v4, "hasMention":Z
    invoke-static {v10}, Lcom/vkontakte/android/Global;->replaceEmojiModifiers(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/vkontakte/android/LinkParser;->stripMentions(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1322
    .local v0, "message":Ljava/lang/String;
    iget-object v1, p0, Lcom/vkontakte/android/Message;->title:Ljava/lang/String;

    iget-object v2, v11, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    iget-object v3, v11, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    iget v5, p0, Lcom/vkontakte/android/Message;->peer:I

    invoke-static/range {v0 .. v5}, Lcom/vkontakte/android/LongPollService;->updateNotification(Ljava/lang/CharSequence;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZI)V

    goto/16 :goto_0

    .end local v0    # "message":Ljava/lang/String;
    .end local v4    # "hasMention":Z
    .end local v7    # "hasDifferentAttachmentsType":Z
    .end local v9    # "notifyAdd":Ljava/lang/String;
    :cond_6
    move v7, v3

    .line 1288
    goto :goto_1

    .restart local v7    # "hasDifferentAttachmentsType":Z
    .restart local v8    # "i":I
    :cond_7
    move v7, v3

    .line 1292
    goto :goto_3

    .line 1291
    :cond_8
    add-int/lit8 v8, v8, 0x1

    goto :goto_2

    .line 1303
    .end local v8    # "i":I
    .restart local v9    # "notifyAdd":Ljava/lang/String;
    :cond_9
    iget-object v1, p0, Lcom/vkontakte/android/Message;->attachments:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_c

    iget-boolean v1, p0, Lcom/vkontakte/android/Message;->isServiceMessage:Z

    if-nez v1, :cond_c

    .line 1304
    iget-object v1, p0, Lcom/vkontakte/android/Message;->attachments:Ljava/util/List;

    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/vkontakte/android/attachments/Attachment;

    .line 1305
    .local v6, "att":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v1, v6, Lcom/vkontakte/android/attachments/GiftAttachment;

    if-eqz v1, :cond_b

    .line 1306
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    iget-boolean v1, v11, Lcom/vkontakte/android/UserProfile;->f:Z

    if-eqz v1, :cond_a

    const v1, 0x7f08041b

    :goto_6
    invoke-virtual {v2, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v10

    goto :goto_4

    :cond_a
    const v1, 0x7f08041c

    goto :goto_6

    .line 1308
    :cond_b
    iget-object v1, p0, Lcom/vkontakte/android/Message;->attachments:Ljava/util/List;

    invoke-static {v1}, Lcom/vkontakte/android/attachments/Attachment;->getLocalizedDescription(Ljava/util/List;)Ljava/lang/String;

    move-result-object v9

    goto :goto_4

    .line 1310
    .end local v6    # "att":Lcom/vkontakte/android/attachments/Attachment;
    :cond_c
    iget-object v1, p0, Lcom/vkontakte/android/Message;->fwdMessages:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_4

    .line 1311
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v5, 0x7f0d003d

    iget-object v12, p0, Lcom/vkontakte/android/Message;->fwdMessages:Ljava/util/List;

    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v12

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v13, p0, Lcom/vkontakte/android/Message;->fwdMessages:Ljava/util/List;

    invoke-interface {v13}, Ljava/util/List;->size()I

    move-result v13

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v2, v3

    invoke-virtual {v1, v5, v12, v2}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    goto/16 :goto_4

    .line 1317
    :cond_d
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    goto/16 :goto_5
.end method

.method private static notify(Landroid/content/Context;ILandroid/app/Notification;Z)V
    .locals 1
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "id"    # I
    .param p2, "ntf"    # Landroid/app/Notification;
    .param p3, "noSound"    # Z

    .prologue
    .line 71
    if-eqz p3, :cond_0

    .line 72
    const/4 v0, 0x0

    iput v0, p2, Landroid/app/Notification;->defaults:I

    .line 74
    :cond_0
    const-string/jumbo v0, "notification"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    invoke-virtual {v0, p1, p2}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 75
    return-void
.end method

.method private static showLikeNotification(Landroid/content/Context;Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 27
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "extras"    # Landroid/os/Bundle;
    .param p2, "userName"    # Ljava/lang/String;
    .param p3, "userPhoto"    # Ljava/lang/String;
    .param p4, "noSound"    # Z

    .prologue
    .line 1107
    sget-object v21, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const/16 v22, 0x0

    const/16 v23, 0x0

    invoke-virtual/range {v21 .. v23}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v19

    .line 1108
    .local v19, "sprefs":Landroid/content/SharedPreferences;
    const-string/jumbo v10, "vkontakte://vk.com/feed?section=notifications"

    .line 1109
    .local v10, "link":Ljava/lang/String;
    const-string/jumbo v21, "object"

    move-object/from16 v0, p1

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 1110
    .local v15, "object":Ljava/lang/String;
    const-string/jumbo v21, "likes_count"

    move-object/from16 v0, p1

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    .line 1111
    .local v6, "count":I
    new-instance v9, Landroid/content/Intent;

    const-string/jumbo v21, "android.intent.action.VIEW"

    const-string/jumbo v22, "vkontakte://vk.com/feed?section=notifications"

    invoke-static/range {v22 .. v22}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v22

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-direct {v9, v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 1112
    .local v9, "intent":Landroid/content/Intent;
    const/high16 v21, 0x10000000

    move/from16 v0, v21

    invoke-virtual {v9, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 1114
    const/16 v21, 0x1

    move/from16 v0, v21

    if-le v6, v0, :cond_3

    const v18, 0x7f080331

    .line 1115
    .local v18, "res":I
    :goto_0
    const-string/jumbo v21, "photo[0-9-]+_[0-9]+"

    move-object/from16 v0, v21

    invoke-virtual {v15, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v21

    if-eqz v21, :cond_5

    .line 1116
    const/16 v21, 0x1

    move/from16 v0, v21

    if-le v6, v0, :cond_4

    const v18, 0x7f080330

    .line 1122
    :cond_0
    :goto_1
    const/16 v21, 0x1

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v24, "<b>"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-static/range {p2 .. p2}, Lcom/vkontakte/android/Global;->replaceHTML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string/jumbo v24, "</b>"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    aput-object v23, v21, v22

    move-object/from16 v0, p0

    move/from16 v1, v18

    move-object/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    .line 1123
    .local v14, "ntfTextSource":Ljava/lang/String;
    invoke-static {v14}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v13

    .line 1124
    .local v13, "ntfText":Landroid/text/Spanned;
    const/16 v21, 0x0

    const/high16 v22, 0x8000000

    move-object/from16 v0, p0

    move/from16 v1, v21

    move/from16 v2, v22

    invoke-static {v0, v1, v9, v2}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v16

    .line 1125
    .local v16, "pIntent":Landroid/app/PendingIntent;
    const/4 v12, 0x0

    .line 1126
    .local v12, "ntf":Landroid/app/Notification;
    const/16 v17, 0x0

    .line 1127
    .local v17, "photo":Landroid/graphics/Bitmap;
    if-eqz p3, :cond_1

    .line 1128
    invoke-static/range {p3 .. p3}, Lcom/vk/imageloader/VKImageLoader;->getCircleBitmap(Ljava/lang/String;)Lio/reactivex/Observable;

    move-result-object v21

    invoke-static/range {v21 .. v21}, Lcom/vk/core/util/RxUtil;->blockingGetWithNull(Lio/reactivex/Observable;)Ljava/lang/Object;

    move-result-object v17

    .end local v17    # "photo":Landroid/graphics/Bitmap;
    check-cast v17, Landroid/graphics/Bitmap;

    .line 1131
    .restart local v17    # "photo":Landroid/graphics/Bitmap;
    :cond_1
    new-instance v21, Landroid/app/Notification$Builder;

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    const v22, 0x7f0800d0

    .line 1132
    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v21

    .line 1133
    move-object/from16 v0, v21

    invoke-virtual {v0, v13}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v21

    .line 1134
    move-object/from16 v0, v21

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v21

    .line 1135
    invoke-virtual {v13}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Landroid/app/Notification$Builder;->setTicker(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v21

    const v22, 0x7f02029a

    .line 1136
    invoke-virtual/range {v21 .. v22}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v5

    .line 1137
    .local v5, "bldr":Landroid/app/Notification$Builder;
    if-eqz p3, :cond_2

    .line 1138
    if-eqz v17, :cond_9

    .end local v17    # "photo":Landroid/graphics/Bitmap;
    :goto_2
    const/high16 v21, 0x42800000    # 64.0f

    invoke-static/range {v21 .. v21}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v21

    const/high16 v22, 0x42800000    # 64.0f

    invoke-static/range {v22 .. v22}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v22

    const/16 v23, 0x1

    move-object/from16 v0, v17

    move/from16 v1, v21

    move/from16 v2, v22

    move/from16 v3, v23

    invoke-static {v0, v1, v2, v3}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v5, v0}, Landroid/app/Notification$Builder;->setLargeIcon(Landroid/graphics/Bitmap;)Landroid/app/Notification$Builder;

    .line 1140
    :cond_2
    sget v21, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v22, 0x10

    move/from16 v0, v21

    move/from16 v1, v22

    if-lt v0, v1, :cond_f

    .line 1142
    :try_start_0
    new-instance v4, Lorg/json/JSONArray;

    const-string/jumbo v21, "like_notifications"

    const-string/jumbo v22, "[]"

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-direct {v4, v0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 1143
    .local v4, "a":Lorg/json/JSONArray;
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v21

    if-nez v21, :cond_a

    .line 1144
    new-instance v21, Landroid/app/Notification$BigTextStyle;

    move-object/from16 v0, v21

    invoke-direct {v0, v5}, Landroid/app/Notification$BigTextStyle;-><init>(Landroid/app/Notification$Builder;)V

    const v22, 0x7f0800d0

    .line 1145
    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Landroid/app/Notification$BigTextStyle;->setBigContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$BigTextStyle;

    move-result-object v21

    .line 1146
    move-object/from16 v0, v21

    invoke-virtual {v0, v13}, Landroid/app/Notification$BigTextStyle;->bigText(Ljava/lang/CharSequence;)Landroid/app/Notification$BigTextStyle;

    move-result-object v21

    .line 1147
    invoke-virtual/range {v21 .. v21}, Landroid/app/Notification$BigTextStyle;->build()Landroid/app/Notification;

    move-result-object v12

    .line 1163
    :goto_3
    invoke-virtual {v4, v14}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 1164
    invoke-interface/range {v19 .. v19}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v21

    const-string/jumbo v22, "like_notifications"

    invoke-virtual {v4}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-interface/range {v21 .. v23}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v21

    invoke-interface/range {v21 .. v21}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1171
    .end local v4    # "a":Lorg/json/JSONArray;
    :goto_4
    iget v0, v12, Landroid/app/Notification;->flags:I

    move/from16 v21, v0

    or-int/lit8 v21, v21, 0x10

    move/from16 v0, v21

    iput v0, v12, Landroid/app/Notification;->flags:I

    .line 1172
    sget-object v21, Lcom/vkontakte/android/NotificationUtils$Type;->Default:Lcom/vkontakte/android/NotificationUtils$Type;

    const/16 v22, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move/from16 v2, v22

    invoke-static {v0, v12, v1, v2}, Lcom/vkontakte/android/NotificationUtils;->applySettings(Landroid/content/Context;Landroid/app/Notification;Lcom/vkontakte/android/NotificationUtils$Type;Z)V

    .line 1173
    iget v0, v12, Landroid/app/Notification;->defaults:I

    move/from16 v21, v0

    and-int/lit8 v21, v21, -0x2

    move/from16 v0, v21

    iput v0, v12, Landroid/app/Notification;->defaults:I

    .line 1174
    const/16 v21, 0x0

    move-object/from16 v0, v21

    iput-object v0, v12, Landroid/app/Notification;->sound:Landroid/net/Uri;

    .line 1176
    const/16 v21, 0x1fb

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-static {v0, v1}, Lcom/vkontakte/android/GCMBroadcastReceiver;->cancel(Landroid/content/Context;I)V

    .line 1177
    const/16 v21, 0x1fb

    move-object/from16 v0, p0

    move/from16 v1, v21

    move/from16 v2, p4

    invoke-static {v0, v1, v12, v2}, Lcom/vkontakte/android/GCMBroadcastReceiver;->notify(Landroid/content/Context;ILandroid/app/Notification;Z)V

    .line 1178
    return-void

    .line 1114
    .end local v5    # "bldr":Landroid/app/Notification$Builder;
    .end local v12    # "ntf":Landroid/app/Notification;
    .end local v13    # "ntfText":Landroid/text/Spanned;
    .end local v14    # "ntfTextSource":Ljava/lang/String;
    .end local v16    # "pIntent":Landroid/app/PendingIntent;
    .end local v18    # "res":I
    :cond_3
    const v18, 0x7f080334

    goto/16 :goto_0

    .line 1116
    .restart local v18    # "res":I
    :cond_4
    const v18, 0x7f080333

    goto/16 :goto_1

    .line 1117
    :cond_5
    const-string/jumbo v21, "video[0-9-]+_[0-9]+"

    move-object/from16 v0, v21

    invoke-virtual {v15, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v21

    if-eqz v21, :cond_7

    .line 1118
    const/16 v21, 0x1

    move/from16 v0, v21

    if-le v6, v0, :cond_6

    const v18, 0x7f080332

    :goto_5
    goto/16 :goto_1

    :cond_6
    const v18, 0x7f080335

    goto :goto_5

    .line 1119
    :cond_7
    const-string/jumbo v21, "(wall_comment|video_comment|photo_comment)[0-9-]+_[0-9]+"

    move-object/from16 v0, v21

    invoke-virtual {v15, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v21

    if-eqz v21, :cond_0

    .line 1120
    const/16 v21, 0x1

    move/from16 v0, v21

    if-le v6, v0, :cond_8

    const v18, 0x7f08032f

    :goto_6
    goto/16 :goto_1

    :cond_8
    const v18, 0x7f08032e

    goto :goto_6

    .line 1138
    .restart local v5    # "bldr":Landroid/app/Notification$Builder;
    .restart local v12    # "ntf":Landroid/app/Notification;
    .restart local v13    # "ntfText":Landroid/text/Spanned;
    .restart local v14    # "ntfTextSource":Ljava/lang/String;
    .restart local v16    # "pIntent":Landroid/app/PendingIntent;
    .restart local v17    # "photo":Landroid/graphics/Bitmap;
    :cond_9
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v21

    const v22, 0x7f0203d3

    invoke-static/range {v21 .. v22}, Lcom/vkontakte/android/Global;->getResBitmap(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v17

    goto/16 :goto_2

    .line 1149
    .end local v17    # "photo":Landroid/graphics/Bitmap;
    .restart local v4    # "a":Lorg/json/JSONArray;
    :cond_a
    const v21, 0x7f02029b

    :try_start_1
    move/from16 v0, v21

    invoke-virtual {v5, v0}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    .line 1150
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v21

    const v22, 0x7f0d0026

    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v23

    add-int/lit8 v23, v23, 0x1

    const/16 v24, 0x1

    move/from16 v0, v24

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v26

    add-int/lit8 v26, v26, 0x1

    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    aput-object v26, v24, v25

    invoke-virtual/range {v21 .. v24}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v5, v0}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    .line 1151
    const/16 v21, 0x0

    check-cast v21, Landroid/graphics/Bitmap;

    move-object/from16 v0, v21

    invoke-virtual {v5, v0}, Landroid/app/Notification$Builder;->setLargeIcon(Landroid/graphics/Bitmap;)Landroid/app/Notification$Builder;

    .line 1152
    new-instance v8, Landroid/app/Notification$InboxStyle;

    invoke-direct {v8, v5}, Landroid/app/Notification$InboxStyle;-><init>(Landroid/app/Notification$Builder;)V

    .line 1153
    .local v8, "inbox":Landroid/app/Notification$InboxStyle;
    invoke-virtual {v8, v13}, Landroid/app/Notification$InboxStyle;->addLine(Ljava/lang/CharSequence;)Landroid/app/Notification$InboxStyle;

    .line 1154
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v21

    const/16 v22, 0x4

    move/from16 v0, v21

    move/from16 v1, v22

    if-le v0, v1, :cond_b

    const/4 v11, 0x1

    .line 1155
    .local v11, "more":Z
    :goto_7
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_8
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v22

    if-eqz v11, :cond_c

    const/16 v21, 0x3

    :goto_9
    move/from16 v0, v22

    move/from16 v1, v21

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v21

    move/from16 v0, v21

    if-ge v7, v0, :cond_d

    .line 1156
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v21

    add-int/lit8 v22, v7, 0x1

    sub-int v21, v21, v22

    move/from16 v0, v21

    invoke-virtual {v4, v0}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v21 .. v21}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v8, v0}, Landroid/app/Notification$InboxStyle;->addLine(Ljava/lang/CharSequence;)Landroid/app/Notification$InboxStyle;

    .line 1155
    add-int/lit8 v7, v7, 0x1

    goto :goto_8

    .line 1154
    .end local v7    # "i":I
    .end local v11    # "more":Z
    :cond_b
    const/4 v11, 0x0

    goto :goto_7

    .line 1155
    .restart local v7    # "i":I
    .restart local v11    # "more":Z
    :cond_c
    const/16 v21, 0x4

    goto :goto_9

    .line 1158
    :cond_d
    if-eqz v11, :cond_e

    .line 1159
    const v21, 0x7f080336

    const/16 v22, 0x1

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v24

    add-int/lit8 v24, v24, -0x4

    invoke-static/range {v24 .. v24}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v24

    aput-object v24, v22, v23

    move-object/from16 v0, p0

    move/from16 v1, v21

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v8, v0}, Landroid/app/Notification$InboxStyle;->addLine(Ljava/lang/CharSequence;)Landroid/app/Notification$InboxStyle;

    .line 1161
    :cond_e
    invoke-virtual {v8}, Landroid/app/Notification$InboxStyle;->build()Landroid/app/Notification;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v12

    goto/16 :goto_3

    .line 1165
    .end local v4    # "a":Lorg/json/JSONArray;
    .end local v7    # "i":I
    .end local v8    # "inbox":Landroid/app/Notification$InboxStyle;
    .end local v11    # "more":Z
    :catch_0
    move-exception v20

    .line 1166
    .local v20, "x":Ljava/lang/Exception;
    const/16 v21, 0x0

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v21, v0

    invoke-static/range {v20 .. v21}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto/16 :goto_4

    .line 1169
    .end local v20    # "x":Ljava/lang/Exception;
    :cond_f
    invoke-virtual {v5}, Landroid/app/Notification$Builder;->getNotification()Landroid/app/Notification;

    move-result-object v12

    goto/16 :goto_4
.end method

.method public static showMessageNotification(I)V
    .locals 5
    .param p0, "mid"    # I

    .prologue
    .line 1265
    invoke-static {p0}, Lcom/vkontakte/android/data/Messages;->getById(I)Lcom/vkontakte/android/Message;

    move-result-object v1

    .line 1266
    .local v1, "msg":Lcom/vkontakte/android/Message;
    if-nez v1, :cond_1

    .line 1267
    const-string/jumbo v2, "vk"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Error getting message "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " :\'("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 1324
    :cond_0
    :goto_0
    return-void

    .line 1270
    :cond_1
    iget v2, v1, Lcom/vkontakte/android/Message;->peer:I

    const v3, 0x77359400

    if-ge v2, v3, :cond_2

    .line 1271
    const/4 v2, 0x0

    iput-object v2, v1, Lcom/vkontakte/android/Message;->title:Ljava/lang/String;

    .line 1273
    :cond_2
    iget-boolean v2, v1, Lcom/vkontakte/android/Message;->readState:Z

    if-nez v2, :cond_0

    .line 1276
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1277
    .local v0, "al":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    iget v2, v1, Lcom/vkontakte/android/Message;->sender:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1278
    invoke-static {v1}, Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/Message;)Lcom/vkontakte/android/data/Friends$GetUsersCallback;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/vkontakte/android/data/Friends;->getUsers(Ljava/util/Collection;Lcom/vkontakte/android/data/Friends$GetUsersCallback;)V

    goto :goto_0
.end method

.method private static showMoneyTransferNotification(Landroid/content/Context;Landroid/os/Bundle;Ljava/lang/String;ZZZ)V
    .locals 13
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "extras"    # Landroid/os/Bundle;
    .param p2, "userName"    # Ljava/lang/String;
    .param p3, "isFemale"    # Z
    .param p4, "noSound"    # Z
    .param p5, "isGroup"    # Z

    .prologue
    .line 1042
    const-string/jumbo v3, "vkontakte://vk.com/feed?section=notifications"

    .line 1043
    .local v3, "link":Ljava/lang/String;
    new-instance v2, Landroid/content/Intent;

    const-string/jumbo v10, "android.intent.action.VIEW"

    const-string/jumbo v11, "vkontakte://vk.com/feed?section=notifications"

    invoke-static {v11}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v11

    invoke-direct {v2, v10, v11}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 1044
    .local v2, "intent":Landroid/content/Intent;
    const/high16 v10, 0x10000000

    invoke-virtual {v2, v10}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 1046
    const/4 v10, 0x0

    const/high16 v11, 0x8000000

    invoke-static {p0, v10, v2, v11}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v6

    .line 1047
    .local v6, "pIntent":Landroid/app/PendingIntent;
    const/4 v5, 0x0

    .line 1049
    .local v5, "ntf":Landroid/app/Notification;
    const-string/jumbo v9, ""

    .line 1051
    .local v9, "text":Ljava/lang/String;
    const/4 v7, 0x0

    .line 1053
    .local v7, "resId":I
    const-string/jumbo v10, "status"

    invoke-virtual {p1, v10}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    .line 1055
    .local v8, "status":I
    if-eqz p5, :cond_4

    .line 1056
    const/4 v10, 0x2

    if-ne v8, v10, :cond_3

    .line 1057
    const v7, 0x7f080380

    .line 1076
    :cond_0
    :goto_0
    if-eqz v7, :cond_2

    .line 1077
    new-instance v4, Lcom/vkontakte/android/MoneyTransfer;

    invoke-direct {v4}, Lcom/vkontakte/android/MoneyTransfer;-><init>()V

    .line 1078
    .local v4, "mt":Lcom/vkontakte/android/MoneyTransfer;
    const-string/jumbo v10, "amount"

    invoke-virtual {p1, v10}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    iput-object v10, v4, Lcom/vkontakte/android/MoneyTransfer;->amount:Ljava/lang/String;

    .line 1079
    const-string/jumbo v10, "currency"

    invoke-virtual {p1, v10}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    iput v10, v4, Lcom/vkontakte/android/MoneyTransfer;->currencyId:I

    .line 1082
    const/4 v10, 0x2

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    aput-object p2, v10, v11

    const/4 v11, 0x1

    invoke-virtual {v4, p0}, Lcom/vkontakte/android/MoneyTransfer;->getAmountWithCurrencyShortNameFormatted(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v12

    aput-object v12, v10, v11

    invoke-virtual {p0, v7, v10}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    .line 1083
    new-instance v10, Landroid/app/Notification$Builder;

    invoke-direct {v10, p0}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    const v11, 0x7f02029c

    .line 1084
    invoke-virtual {v10, v11}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v10

    const v11, 0x7f0800d0

    .line 1085
    invoke-virtual {p0, v11}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v10

    .line 1086
    invoke-virtual {v10, v9}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v10

    .line 1087
    invoke-virtual {v10, v9}, Landroid/app/Notification$Builder;->setTicker(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v10

    .line 1088
    invoke-virtual {v10, v6}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v10

    const/4 v11, 0x1

    .line 1089
    invoke-virtual {v10, v11}, Landroid/app/Notification$Builder;->setAutoCancel(Z)Landroid/app/Notification$Builder;

    move-result-object v10

    const/4 v11, 0x2

    .line 1090
    invoke-virtual {v10, v11}, Landroid/app/Notification$Builder;->setDefaults(I)Landroid/app/Notification$Builder;

    move-result-object v1

    .line 1092
    .local v1, "bldr":Landroid/app/Notification$Builder;
    sget v10, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v11, 0x10

    if-lt v10, v11, :cond_8

    .line 1093
    new-instance v10, Landroid/app/Notification$BigTextStyle;

    const/4 v11, 0x2

    invoke-virtual {v1, v11}, Landroid/app/Notification$Builder;->setPriority(I)Landroid/app/Notification$Builder;

    move-result-object v11

    invoke-direct {v10, v11}, Landroid/app/Notification$BigTextStyle;-><init>(Landroid/app/Notification$Builder;)V

    .line 1094
    invoke-virtual {v10, v9}, Landroid/app/Notification$BigTextStyle;->bigText(Ljava/lang/CharSequence;)Landroid/app/Notification$BigTextStyle;

    move-result-object v10

    .line 1095
    invoke-virtual {v10}, Landroid/app/Notification$BigTextStyle;->build()Landroid/app/Notification;

    move-result-object v5

    .line 1099
    :goto_1
    sget v10, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v11, 0x15

    if-lt v10, v11, :cond_1

    .line 1100
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f0f0018

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getColor(I)I

    move-result v10

    iput v10, v5, Landroid/app/Notification;->color:I

    .line 1102
    :cond_1
    const/16 v10, 0x258

    move/from16 v0, p4

    invoke-static {p0, v10, v5, v0}, Lcom/vkontakte/android/GCMBroadcastReceiver;->notify(Landroid/content/Context;ILandroid/app/Notification;Z)V

    .line 1104
    .end local v1    # "bldr":Landroid/app/Notification$Builder;
    .end local v4    # "mt":Lcom/vkontakte/android/MoneyTransfer;
    :cond_2
    return-void

    .line 1058
    :cond_3
    const/4 v10, 0x1

    if-ne v8, v10, :cond_0

    .line 1059
    const v7, 0x7f08037d

    goto/16 :goto_0

    .line 1062
    :cond_4
    if-eqz p3, :cond_6

    .line 1063
    const/4 v10, 0x2

    if-ne v8, v10, :cond_5

    .line 1064
    const v7, 0x7f08037e

    goto/16 :goto_0

    .line 1065
    :cond_5
    const/4 v10, 0x1

    if-ne v8, v10, :cond_0

    .line 1066
    const v7, 0x7f08037b

    goto/16 :goto_0

    .line 1069
    :cond_6
    const/4 v10, 0x2

    if-ne v8, v10, :cond_7

    .line 1070
    const v7, 0x7f08037f

    goto/16 :goto_0

    .line 1071
    :cond_7
    const/4 v10, 0x1

    if-ne v8, v10, :cond_0

    .line 1072
    const v7, 0x7f08037c

    goto/16 :goto_0

    .line 1097
    .restart local v1    # "bldr":Landroid/app/Notification$Builder;
    .restart local v4    # "mt":Lcom/vkontakte/android/MoneyTransfer;
    :cond_8
    invoke-virtual {v1}, Landroid/app/Notification$Builder;->getNotification()Landroid/app/Notification;

    move-result-object v5

    goto :goto_1
.end method

.method private static showRepostNotification(Landroid/content/Context;Landroid/os/Bundle;Lcom/vkontakte/android/UserProfile;Z)V
    .locals 25
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "extras"    # Landroid/os/Bundle;
    .param p2, "user"    # Lcom/vkontakte/android/UserProfile;
    .param p3, "noSound"    # Z

    .prologue
    .line 1181
    sget-object v19, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const/16 v20, 0x0

    const/16 v21, 0x0

    invoke-virtual/range {v19 .. v21}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v17

    .line 1182
    .local v17, "sprefs":Landroid/content/SharedPreferences;
    const-string/jumbo v8, "vkontakte://vk.com/feed?section=notifications"

    .line 1183
    .local v8, "link":Ljava/lang/String;
    const-string/jumbo v19, "object"

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 1184
    .local v13, "object":Ljava/lang/String;
    new-instance v7, Landroid/content/Intent;

    const-string/jumbo v19, "android.intent.action.VIEW"

    const-string/jumbo v20, "vkontakte://vk.com/feed?section=notifications"

    invoke-static/range {v20 .. v20}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-direct {v7, v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 1185
    .local v7, "intent":Landroid/content/Intent;
    const/high16 v19, 0x10000000

    move/from16 v0, v19

    invoke-virtual {v7, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 1187
    move-object/from16 v0, p2

    iget-boolean v0, v0, Lcom/vkontakte/android/UserProfile;->f:Z

    move/from16 v19, v0

    if-eqz v19, :cond_3

    const v16, 0x7f0805c9

    .line 1188
    .local v16, "res":I
    :goto_0
    const-string/jumbo v19, "photo[0-9-]+_[0-9]+"

    move-object/from16 v0, v19

    invoke-virtual {v13, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_5

    .line 1189
    move-object/from16 v0, p2

    iget-boolean v0, v0, Lcom/vkontakte/android/UserProfile;->f:Z

    move/from16 v19, v0

    if-eqz v19, :cond_4

    const v16, 0x7f0805c7

    .line 1195
    :cond_0
    :goto_1
    const/16 v19, 0x1

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v22, "<b>"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, p2

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    move-object/from16 v22, v0

    invoke-static/range {v22 .. v22}, Lcom/vkontakte/android/Global;->replaceHTML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string/jumbo v22, "</b>"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    aput-object v21, v19, v20

    move-object/from16 v0, p0

    move/from16 v1, v16

    move-object/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    .line 1196
    .local v12, "ntfTextSource":Ljava/lang/String;
    invoke-static {v12}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v11

    .line 1197
    .local v11, "ntfText":Landroid/text/Spanned;
    const/16 v19, 0x0

    const/high16 v20, 0x8000000

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-static {v0, v1, v7, v2}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v14

    .line 1198
    .local v14, "pIntent":Landroid/app/PendingIntent;
    const/4 v10, 0x0

    .line 1199
    .local v10, "ntf":Landroid/app/Notification;
    const/4 v15, 0x0

    .line 1200
    .local v15, "photo":Landroid/graphics/Bitmap;
    move-object/from16 v0, p2

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    move-object/from16 v19, v0

    if-eqz v19, :cond_1

    .line 1201
    move-object/from16 v0, p2

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/vk/imageloader/VKImageLoader;->getCircleBitmap(Ljava/lang/String;)Lio/reactivex/Observable;

    move-result-object v19

    invoke-static/range {v19 .. v19}, Lcom/vk/core/util/RxUtil;->blockingGetWithNull(Lio/reactivex/Observable;)Ljava/lang/Object;

    move-result-object v15

    .end local v15    # "photo":Landroid/graphics/Bitmap;
    check-cast v15, Landroid/graphics/Bitmap;

    .line 1204
    .restart local v15    # "photo":Landroid/graphics/Bitmap;
    :cond_1
    new-instance v19, Landroid/app/Notification$Builder;

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    const v20, 0x7f0800d0

    .line 1205
    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v19

    .line 1206
    move-object/from16 v0, v19

    invoke-virtual {v0, v11}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v19

    .line 1207
    move-object/from16 v0, v19

    invoke-virtual {v0, v14}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v19

    .line 1208
    invoke-virtual {v11}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Landroid/app/Notification$Builder;->setTicker(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v19

    const v20, 0x7f0202a2

    .line 1209
    invoke-virtual/range {v19 .. v20}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v4

    .line 1210
    .local v4, "bldr":Landroid/app/Notification$Builder;
    move-object/from16 v0, p2

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    move-object/from16 v19, v0

    if-eqz v19, :cond_2

    .line 1211
    if-eqz v15, :cond_9

    .end local v15    # "photo":Landroid/graphics/Bitmap;
    :goto_2
    const/high16 v19, 0x42800000    # 64.0f

    invoke-static/range {v19 .. v19}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v19

    const/high16 v20, 0x42800000    # 64.0f

    invoke-static/range {v20 .. v20}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v20

    const/16 v21, 0x1

    move/from16 v0, v19

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-static {v15, v0, v1, v2}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Landroid/app/Notification$Builder;->setLargeIcon(Landroid/graphics/Bitmap;)Landroid/app/Notification$Builder;

    .line 1213
    :cond_2
    sget v19, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v20, 0x10

    move/from16 v0, v19

    move/from16 v1, v20

    if-lt v0, v1, :cond_f

    .line 1215
    :try_start_0
    new-instance v3, Lorg/json/JSONArray;

    const-string/jumbo v19, "repost_notifications"

    const-string/jumbo v20, "[]"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-direct {v3, v0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 1216
    .local v3, "a":Lorg/json/JSONArray;
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v19

    if-nez v19, :cond_a

    .line 1217
    new-instance v19, Landroid/app/Notification$BigTextStyle;

    move-object/from16 v0, v19

    invoke-direct {v0, v4}, Landroid/app/Notification$BigTextStyle;-><init>(Landroid/app/Notification$Builder;)V

    const v20, 0x7f0800d0

    .line 1218
    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Landroid/app/Notification$BigTextStyle;->setBigContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$BigTextStyle;

    move-result-object v19

    .line 1219
    move-object/from16 v0, v19

    invoke-virtual {v0, v11}, Landroid/app/Notification$BigTextStyle;->bigText(Ljava/lang/CharSequence;)Landroid/app/Notification$BigTextStyle;

    move-result-object v19

    .line 1220
    invoke-virtual/range {v19 .. v19}, Landroid/app/Notification$BigTextStyle;->build()Landroid/app/Notification;

    move-result-object v10

    .line 1236
    :goto_3
    invoke-virtual {v3, v12}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 1237
    invoke-interface/range {v17 .. v17}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v19

    const-string/jumbo v20, "repost_notifications"

    invoke-virtual {v3}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-interface/range {v19 .. v21}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v19

    invoke-interface/range {v19 .. v19}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1244
    .end local v3    # "a":Lorg/json/JSONArray;
    :goto_4
    iget v0, v10, Landroid/app/Notification;->flags:I

    move/from16 v19, v0

    or-int/lit8 v19, v19, 0x10

    move/from16 v0, v19

    iput v0, v10, Landroid/app/Notification;->flags:I

    .line 1245
    sget-object v19, Lcom/vkontakte/android/NotificationUtils$Type;->Default:Lcom/vkontakte/android/NotificationUtils$Type;

    const/16 v20, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move/from16 v2, v20

    invoke-static {v0, v10, v1, v2}, Lcom/vkontakte/android/NotificationUtils;->applySettings(Landroid/content/Context;Landroid/app/Notification;Lcom/vkontakte/android/NotificationUtils$Type;Z)V

    .line 1246
    iget v0, v10, Landroid/app/Notification;->defaults:I

    move/from16 v19, v0

    and-int/lit8 v19, v19, -0x2

    move/from16 v0, v19

    iput v0, v10, Landroid/app/Notification;->defaults:I

    .line 1247
    const/16 v19, 0x0

    move-object/from16 v0, v19

    iput-object v0, v10, Landroid/app/Notification;->sound:Landroid/net/Uri;

    .line 1249
    const/16 v19, 0x1fd

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-static {v0, v1}, Lcom/vkontakte/android/GCMBroadcastReceiver;->cancel(Landroid/content/Context;I)V

    .line 1250
    const/16 v19, 0x1fd

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, p3

    invoke-static {v0, v1, v10, v2}, Lcom/vkontakte/android/GCMBroadcastReceiver;->notify(Landroid/content/Context;ILandroid/app/Notification;Z)V

    .line 1251
    return-void

    .line 1187
    .end local v4    # "bldr":Landroid/app/Notification$Builder;
    .end local v10    # "ntf":Landroid/app/Notification;
    .end local v11    # "ntfText":Landroid/text/Spanned;
    .end local v12    # "ntfTextSource":Ljava/lang/String;
    .end local v14    # "pIntent":Landroid/app/PendingIntent;
    .end local v16    # "res":I
    :cond_3
    const v16, 0x7f0805ca

    goto/16 :goto_0

    .line 1189
    .restart local v16    # "res":I
    :cond_4
    const v16, 0x7f0805c8

    goto/16 :goto_1

    .line 1190
    :cond_5
    const-string/jumbo v19, "video[0-9-]+_[0-9]+"

    move-object/from16 v0, v19

    invoke-virtual {v13, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_7

    .line 1191
    move-object/from16 v0, p2

    iget-boolean v0, v0, Lcom/vkontakte/android/UserProfile;->f:Z

    move/from16 v19, v0

    if-eqz v19, :cond_6

    const v16, 0x7f0805cb

    :goto_5
    goto/16 :goto_1

    :cond_6
    const v16, 0x7f0805cc

    goto :goto_5

    .line 1192
    :cond_7
    const-string/jumbo v19, "(wall_comment|video_comment|photo_comment)[0-9-]+_[0-9]+"

    move-object/from16 v0, v19

    invoke-virtual {v13, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_0

    .line 1193
    move-object/from16 v0, p2

    iget-boolean v0, v0, Lcom/vkontakte/android/UserProfile;->f:Z

    move/from16 v19, v0

    if-eqz v19, :cond_8

    const v16, 0x7f0805c5

    :goto_6
    goto/16 :goto_1

    :cond_8
    const v16, 0x7f0805c6

    goto :goto_6

    .line 1211
    .restart local v4    # "bldr":Landroid/app/Notification$Builder;
    .restart local v10    # "ntf":Landroid/app/Notification;
    .restart local v11    # "ntfText":Landroid/text/Spanned;
    .restart local v12    # "ntfTextSource":Ljava/lang/String;
    .restart local v14    # "pIntent":Landroid/app/PendingIntent;
    .restart local v15    # "photo":Landroid/graphics/Bitmap;
    :cond_9
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v19

    const v20, 0x7f0203d3

    invoke-static/range {v19 .. v20}, Lcom/vkontakte/android/Global;->getResBitmap(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v15

    goto/16 :goto_2

    .line 1222
    .end local v15    # "photo":Landroid/graphics/Bitmap;
    .restart local v3    # "a":Lorg/json/JSONArray;
    :cond_a
    const v19, 0x7f0202a3

    :try_start_1
    move/from16 v0, v19

    invoke-virtual {v4, v0}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    .line 1223
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v19

    const v20, 0x7f0d0026

    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v21

    add-int/lit8 v21, v21, 0x1

    const/16 v22, 0x1

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v24

    add-int/lit8 v24, v24, 0x1

    invoke-static/range {v24 .. v24}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v24

    aput-object v24, v22, v23

    invoke-virtual/range {v19 .. v22}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    .line 1224
    const/16 v19, 0x0

    check-cast v19, Landroid/graphics/Bitmap;

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Landroid/app/Notification$Builder;->setLargeIcon(Landroid/graphics/Bitmap;)Landroid/app/Notification$Builder;

    .line 1225
    new-instance v6, Landroid/app/Notification$InboxStyle;

    invoke-direct {v6, v4}, Landroid/app/Notification$InboxStyle;-><init>(Landroid/app/Notification$Builder;)V

    .line 1226
    .local v6, "inbox":Landroid/app/Notification$InboxStyle;
    invoke-virtual {v6, v11}, Landroid/app/Notification$InboxStyle;->addLine(Ljava/lang/CharSequence;)Landroid/app/Notification$InboxStyle;

    .line 1227
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v19

    const/16 v20, 0x4

    move/from16 v0, v19

    move/from16 v1, v20

    if-le v0, v1, :cond_b

    const/4 v9, 0x1

    .line 1228
    .local v9, "more":Z
    :goto_7
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_8
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v20

    if-eqz v9, :cond_c

    const/16 v19, 0x3

    :goto_9
    move/from16 v0, v20

    move/from16 v1, v19

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v19

    move/from16 v0, v19

    if-ge v5, v0, :cond_d

    .line 1229
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v19

    add-int/lit8 v20, v5, 0x1

    sub-int v19, v19, v20

    move/from16 v0, v19

    invoke-virtual {v3, v0}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v19 .. v19}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v6, v0}, Landroid/app/Notification$InboxStyle;->addLine(Ljava/lang/CharSequence;)Landroid/app/Notification$InboxStyle;

    .line 1228
    add-int/lit8 v5, v5, 0x1

    goto :goto_8

    .line 1227
    .end local v5    # "i":I
    .end local v9    # "more":Z
    :cond_b
    const/4 v9, 0x0

    goto :goto_7

    .line 1228
    .restart local v5    # "i":I
    .restart local v9    # "more":Z
    :cond_c
    const/16 v19, 0x4

    goto :goto_9

    .line 1231
    :cond_d
    if-eqz v9, :cond_e

    .line 1232
    const v19, 0x7f080336

    const/16 v20, 0x1

    move/from16 v0, v20

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v22

    add-int/lit8 v22, v22, -0x4

    invoke-static/range {v22 .. v22}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v22

    aput-object v22, v20, v21

    move-object/from16 v0, p0

    move/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v6, v0}, Landroid/app/Notification$InboxStyle;->addLine(Ljava/lang/CharSequence;)Landroid/app/Notification$InboxStyle;

    .line 1234
    :cond_e
    invoke-virtual {v6}, Landroid/app/Notification$InboxStyle;->build()Landroid/app/Notification;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v10

    goto/16 :goto_3

    .line 1238
    .end local v3    # "a":Lorg/json/JSONArray;
    .end local v5    # "i":I
    .end local v6    # "inbox":Landroid/app/Notification$InboxStyle;
    .end local v9    # "more":Z
    :catch_0
    move-exception v18

    .line 1239
    .local v18, "x":Ljava/lang/Exception;
    const/16 v19, 0x0

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v19, v0

    invoke-static/range {v18 .. v19}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto/16 :goto_4

    .line 1242
    .end local v18    # "x":Ljava/lang/Exception;
    :cond_f
    invoke-virtual {v4}, Landroid/app/Notification$Builder;->getNotification()Landroid/app/Notification;

    move-result-object v10

    goto/16 :goto_4
.end method

.method public static updateStateAndShowNotification(I)V
    .locals 5
    .param p0, "mid"    # I

    .prologue
    .line 1254
    sget-object v2, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 1256
    .local v0, "sprefs":Landroid/content/SharedPreferences;
    :try_start_0
    invoke-static {}, Lcom/vkontakte/android/LongPollService;->syncStateWithServer()V

    .line 1257
    invoke-static {p0}, Lcom/vkontakte/android/GCMBroadcastReceiver;->showMessageNotification(I)V

    .line 1258
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string/jumbo v3, "pending_msg_notification"

    invoke-interface {v2, v3}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1262
    :goto_0
    return-void

    .line 1259
    :catch_0
    move-exception v1

    .line 1260
    .local v1, "x":Ljava/lang/Exception;
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string/jumbo v3, "pending_msg_notification"

    invoke-interface {v2, v3, p0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    goto :goto_0
.end method


# virtual methods
.method synthetic lambda$onReceive$11(Landroid/content/Intent;Landroid/content/Context;)V
    .locals 59
    .param p1, "_intent"    # Landroid/content/Intent;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 86
    :try_start_0
    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v23

    .line 87
    .local v23, "extras":Landroid/os/Bundle;
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v21

    .line 88
    .local v21, "currentUid":I
    const v4, 0x1a10c7

    move/from16 v0, v21

    if-eq v0, v4, :cond_0

    const v4, 0x1887270

    move/from16 v0, v21

    if-eq v0, v4, :cond_0

    const v4, 0xaa250e4

    move/from16 v0, v21

    if-eq v0, v4, :cond_0

    const v4, 0x4ac394

    move/from16 v0, v21

    if-eq v0, v4, :cond_0

    const/16 v4, 0x195c

    move/from16 v0, v21

    if-eq v0, v4, :cond_0

    const v4, 0xf2e1

    move/from16 v0, v21

    if-ne v0, v4, :cond_3

    .line 90
    :cond_0
    const-string/jumbo v4, "vk"

    const-string/jumbo v54, "!!!onmessage!!!"

    move-object/from16 v0, v54

    invoke-static {v4, v0}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 91
    invoke-virtual/range {v23 .. v23}, Landroid/os/Bundle;->keySet()Ljava/util/Set;

    move-result-object v32

    .line 92
    .local v32, "keys":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface/range {v32 .. v32}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v54

    if-eqz v54, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v30

    check-cast v30, Ljava/lang/String;

    .line 93
    .local v30, "k":Ljava/lang/String;
    const-string/jumbo v54, "vk"

    new-instance v55, Ljava/lang/StringBuilder;

    invoke-direct/range {v55 .. v55}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v55

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v55

    const-string/jumbo v56, " = "

    invoke-virtual/range {v55 .. v56}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v55

    move-object/from16 v0, v23

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v56

    invoke-virtual/range {v55 .. v56}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v55

    invoke-virtual/range {v55 .. v55}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v55

    invoke-static/range {v54 .. v55}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1034
    .end local v21    # "currentUid":I
    .end local v23    # "extras":Landroid/os/Bundle;
    .end local v30    # "k":Ljava/lang/String;
    .end local v32    # "keys":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :catch_0
    move-exception v53

    .line 1035
    .local v53, "x":Ljava/lang/Exception;
    const-string/jumbo v4, "vk"

    const-string/jumbo v54, "Error processing GCM message"

    move-object/from16 v0, v54

    move-object/from16 v1, v53

    invoke-static {v4, v0, v1}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1037
    .end local v53    # "x":Ljava/lang/Exception;
    :cond_1
    :goto_1
    return-void

    .line 95
    .restart local v21    # "currentUid":I
    .restart local v23    # "extras":Landroid/os/Bundle;
    .restart local v32    # "keys":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :cond_2
    :try_start_1
    const-string/jumbo v4, "vk"

    const-string/jumbo v54, "==============="

    move-object/from16 v0, v54

    invoke-static {v4, v0}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    .end local v32    # "keys":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :cond_3
    sget-object v4, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const/16 v54, 0x0

    const/16 v55, 0x0

    move-object/from16 v0, v54

    move/from16 v1, v55

    invoke-virtual {v4, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v45

    .line 100
    .local v45, "sprefs":Landroid/content/SharedPreferences;
    const-string/jumbo v4, "push_counter"

    const/16 v54, 0x0

    move-object/from16 v0, v45

    move/from16 v1, v54

    invoke-interface {v0, v4, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v39

    .line 101
    .local v39, "pcount":I
    invoke-interface/range {v45 .. v45}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string/jumbo v54, "push_counter"

    add-int/lit8 v55, v39, 0x1

    move-object/from16 v0, v54

    move/from16 v1, v55

    invoke-interface {v4, v0, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 103
    invoke-static/range {p2 .. p2}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v43

    .line 105
    .local v43, "prefs":Landroid/content/SharedPreferences;
    const-string/jumbo v4, "collapse_key"

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 106
    .local v17, "ckey":Ljava/lang/String;
    const-string/jumbo v4, "1"

    const-string/jumbo v54, "no_sound"

    move-object/from16 v0, v23

    move-object/from16 v1, v54

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v54

    move-object/from16 v0, v54

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    .line 108
    .local v12, "noSound":Z
    const-string/jumbo v4, "update_stickers"

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 109
    invoke-static {}, Lcom/vkontakte/android/stickers/Stickers;->get()Lcom/vkontakte/android/stickers/Stickers;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vkontakte/android/stickers/Stickers;->reload()V

    goto :goto_1

    .line 113
    :cond_4
    const-string/jumbo v4, "sdk_open"

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 114
    const-string/jumbo v4, "app_icon"

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v28

    .line 115
    .local v28, "iconUrl":Ljava/lang/String;
    const-string/jumbo v4, "platform_id"

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v42

    .line 116
    .local v42, "pkg":Ljava/lang/String;
    const-string/jumbo v4, "app_id"

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v29

    .line 117
    .local v29, "id":Ljava/lang/String;
    const-string/jumbo v4, "app_name"

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 118
    .local v14, "appName":Ljava/lang/String;
    invoke-static/range {v28 .. v28}, Lcom/vk/imageloader/VKImageLoader;->getCircleBitmap(Ljava/lang/String;)Lio/reactivex/Observable;

    move-result-object v4

    invoke-static {v4}, Lcom/vk/core/util/RxUtil;->blockingGetWithNull(Lio/reactivex/Observable;)Ljava/lang/Object;

    move-result-object v27

    check-cast v27, Landroid/graphics/Bitmap;

    .line 119
    .local v27, "icon":Landroid/graphics/Bitmap;
    new-instance v5, Landroid/content/Intent;

    const-string/jumbo v4, "android.intent.action.VIEW"

    new-instance v54, Ljava/lang/StringBuilder;

    invoke-direct/range {v54 .. v54}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v55, "vkontakte://app/?pkg="

    invoke-virtual/range {v54 .. v55}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v54

    move-object/from16 v0, v54

    move-object/from16 v1, v42

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v54

    const-string/jumbo v55, "&id="

    invoke-virtual/range {v54 .. v55}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v54

    move-object/from16 v0, v54

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v54

    invoke-virtual/range {v54 .. v54}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v54

    invoke-static/range {v54 .. v54}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v54

    move-object/from16 v0, v54

    invoke-direct {v5, v4, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 120
    .local v5, "intent":Landroid/content/Intent;
    const-string/jumbo v4, "com.vkontakte.android"

    invoke-virtual {v5, v4}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 121
    const/4 v4, 0x0

    const/high16 v54, 0x10000000

    move-object/from16 v0, p2

    move/from16 v1, v54

    invoke-static {v0, v4, v5, v1}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v20

    .line 122
    .local v20, "contentIntent":Landroid/app/PendingIntent;
    new-instance v4, Landroid/app/Notification$Builder;

    move-object/from16 v0, p2

    invoke-direct {v4, v0}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    const v54, 0x7f0202a0

    .line 123
    move/from16 v0, v54

    invoke-virtual {v4, v0}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v4

    .line 124
    invoke-virtual {v4, v14}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v4

    .line 125
    invoke-virtual/range {p2 .. p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v54

    const v55, 0x7f080250

    invoke-virtual/range {v54 .. v55}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v54

    move-object/from16 v0, v54

    invoke-virtual {v4, v0}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v4

    .line 126
    invoke-virtual/range {p2 .. p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v54

    const v55, 0x7f080251

    const/16 v56, 0x1

    move/from16 v0, v56

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v56, v0

    const/16 v57, 0x0

    aput-object v14, v56, v57

    invoke-virtual/range {v54 .. v56}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v54

    move-object/from16 v0, v54

    invoke-virtual {v4, v0}, Landroid/app/Notification$Builder;->setTicker(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v4

    .line 127
    move-object/from16 v0, v27

    invoke-virtual {v4, v0}, Landroid/app/Notification$Builder;->setLargeIcon(Landroid/graphics/Bitmap;)Landroid/app/Notification$Builder;

    move-result-object v4

    .line 128
    move-object/from16 v0, v20

    invoke-virtual {v4, v0}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v4

    .line 129
    invoke-virtual {v4}, Landroid/app/Notification$Builder;->getNotification()Landroid/app/Notification;

    move-result-object v36

    .line 130
    .local v36, "ntf":Landroid/app/Notification;
    move-object/from16 v0, v36

    iget v4, v0, Landroid/app/Notification;->flags:I

    or-int/lit8 v4, v4, 0x10

    move-object/from16 v0, v36

    iput v4, v0, Landroid/app/Notification;->flags:I

    .line 131
    move-object/from16 v0, v36

    iget v4, v0, Landroid/app/Notification;->defaults:I

    or-int/lit8 v4, v4, 0x2

    move-object/from16 v0, v36

    iput v4, v0, Landroid/app/Notification;->defaults:I

    .line 132
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v54, 0x15

    move/from16 v0, v54

    if-lt v4, v0, :cond_5

    .line 133
    invoke-virtual/range {p2 .. p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v54, 0x7f0f0018

    move/from16 v0, v54

    invoke-virtual {v4, v0}, Landroid/content/res/Resources;->getColor(I)I

    move-result v4

    move-object/from16 v0, v36

    iput v4, v0, Landroid/app/Notification;->color:I

    .line 135
    :cond_5
    const/16 v4, 0x1f9

    move-object/from16 v0, p2

    move-object/from16 v1, v36

    invoke-static {v0, v4, v1, v12}, Lcom/vkontakte/android/GCMBroadcastReceiver;->notify(Landroid/content/Context;ILandroid/app/Notification;Z)V

    goto/16 :goto_1

    .line 139
    .end local v5    # "intent":Landroid/content/Intent;
    .end local v14    # "appName":Ljava/lang/String;
    .end local v20    # "contentIntent":Landroid/app/PendingIntent;
    .end local v27    # "icon":Landroid/graphics/Bitmap;
    .end local v28    # "iconUrl":Ljava/lang/String;
    .end local v29    # "id":Ljava/lang/String;
    .end local v36    # "ntf":Landroid/app/Notification;
    .end local v42    # "pkg":Ljava/lang/String;
    :cond_6
    const-string/jumbo v4, "open_url"

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_9

    .line 140
    const-string/jumbo v4, "text"

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 141
    .local v10, "text":Ljava/lang/String;
    const-string/jumbo v4, "1"

    const-string/jumbo v54, "try_internal"

    move-object/from16 v0, v23

    move-object/from16 v1, v54

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v54

    move-object/from16 v0, v54

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v47

    .line 142
    .local v47, "tryInternal":Z
    const-string/jumbo v4, "url"

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v50

    .line 143
    .local v50, "url":Ljava/lang/String;
    new-instance v5, Landroid/content/Intent;

    const-string/jumbo v54, "android.intent.action.VIEW"

    if-eqz v47, :cond_14

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v55, "vklink://internal/?"

    move-object/from16 v0, v55

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v50

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    :goto_2
    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    move-object/from16 v0, v54

    invoke-direct {v5, v0, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 144
    .restart local v5    # "intent":Landroid/content/Intent;
    const-string/jumbo v4, "from_notification"

    const/16 v54, 0x1

    move/from16 v0, v54

    invoke-virtual {v5, v4, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 145
    if-eqz v47, :cond_7

    .line 146
    const-string/jumbo v4, "com.vkontakte.android"

    invoke-virtual {v5, v4}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 147
    const-string/jumbo v4, "token"

    invoke-static/range {v50 .. v50}, Lcom/vkontakte/android/utils/XSRFTokenUtil;->generateToken(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v54

    move-object/from16 v0, v54

    invoke-virtual {v5, v4, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 149
    :cond_7
    sget v4, Lcom/vkontakte/android/GCMBroadcastReceiver;->openUrlNotificationLast:I

    const/high16 v54, 0x8000000

    move-object/from16 v0, p2

    move/from16 v1, v54

    invoke-static {v0, v4, v5, v1}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v20

    .line 151
    .restart local v20    # "contentIntent":Landroid/app/PendingIntent;
    new-instance v4, Landroid/app/Notification$Builder;

    move-object/from16 v0, p2

    invoke-direct {v4, v0}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    const v54, 0x7f02029c

    .line 152
    move/from16 v0, v54

    invoke-virtual {v4, v0}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v54

    const-string/jumbo v4, "title"

    .line 153
    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_15

    const-string/jumbo v4, "title"

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    :goto_3
    move-object/from16 v0, v54

    invoke-virtual {v0, v4}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v4

    .line 154
    invoke-virtual {v4, v10}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v4

    .line 155
    invoke-virtual {v4, v10}, Landroid/app/Notification$Builder;->setTicker(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v4

    .line 156
    move-object/from16 v0, v20

    invoke-virtual {v4, v0}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v4

    const/16 v54, 0x1

    .line 157
    move/from16 v0, v54

    invoke-virtual {v4, v0}, Landroid/app/Notification$Builder;->setAutoCancel(Z)Landroid/app/Notification$Builder;

    move-result-object v4

    const/16 v54, 0x2

    .line 158
    move/from16 v0, v54

    invoke-virtual {v4, v0}, Landroid/app/Notification$Builder;->setDefaults(I)Landroid/app/Notification$Builder;

    move-result-object v16

    .line 159
    .local v16, "bldr":Landroid/app/Notification$Builder;
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v54, 0x10

    move/from16 v0, v54

    if-lt v4, v0, :cond_16

    .line 160
    new-instance v4, Landroid/app/Notification$BigTextStyle;

    const/16 v54, 0x2

    move-object/from16 v0, v16

    move/from16 v1, v54

    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setPriority(I)Landroid/app/Notification$Builder;

    move-result-object v54

    move-object/from16 v0, v54

    invoke-direct {v4, v0}, Landroid/app/Notification$BigTextStyle;-><init>(Landroid/app/Notification$Builder;)V

    .line 161
    invoke-virtual {v4, v10}, Landroid/app/Notification$BigTextStyle;->bigText(Ljava/lang/CharSequence;)Landroid/app/Notification$BigTextStyle;

    move-result-object v4

    .line 162
    invoke-virtual {v4}, Landroid/app/Notification$BigTextStyle;->build()Landroid/app/Notification;

    move-result-object v36

    .line 166
    .restart local v36    # "ntf":Landroid/app/Notification;
    :goto_4
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v54, 0x15

    move/from16 v0, v54

    if-lt v4, v0, :cond_8

    .line 167
    invoke-virtual/range {p2 .. p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v54, 0x7f0f0018

    move/from16 v0, v54

    invoke-virtual {v4, v0}, Landroid/content/res/Resources;->getColor(I)I

    move-result v4

    move-object/from16 v0, v36

    iput v4, v0, Landroid/app/Notification;->color:I

    .line 169
    :cond_8
    sget v4, Lcom/vkontakte/android/GCMBroadcastReceiver;->openUrlNotificationLast:I

    add-int/lit16 v4, v4, 0x208

    move-object/from16 v0, p2

    move-object/from16 v1, v36

    invoke-static {v0, v4, v1, v12}, Lcom/vkontakte/android/GCMBroadcastReceiver;->notify(Landroid/content/Context;ILandroid/app/Notification;Z)V

    .line 170
    sget v4, Lcom/vkontakte/android/GCMBroadcastReceiver;->openUrlNotificationLast:I

    add-int/lit8 v4, v4, 0x1

    sput v4, Lcom/vkontakte/android/GCMBroadcastReceiver;->openUrlNotificationLast:I

    .line 171
    sget v4, Lcom/vkontakte/android/GCMBroadcastReceiver;->openUrlNotificationLast:I

    rem-int/lit8 v4, v4, 0x14

    sput v4, Lcom/vkontakte/android/GCMBroadcastReceiver;->openUrlNotificationLast:I

    .line 174
    .end local v5    # "intent":Landroid/content/Intent;
    .end local v10    # "text":Ljava/lang/String;
    .end local v16    # "bldr":Landroid/app/Notification$Builder;
    .end local v20    # "contentIntent":Landroid/app/PendingIntent;
    .end local v36    # "ntf":Landroid/app/Notification;
    .end local v47    # "tryInternal":Z
    .end local v50    # "url":Ljava/lang/String;
    :cond_9
    const-string/jumbo v4, "validate_device"

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_b

    .line 175
    const-string/jumbo v4, "text"

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 176
    .restart local v10    # "text":Ljava/lang/String;
    new-instance v5, Landroid/content/Intent;

    const-string/jumbo v4, "android.intent.action.VIEW"

    new-instance v54, Ljava/lang/StringBuilder;

    invoke-direct/range {v54 .. v54}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v55, "vklink://internal/?"

    invoke-virtual/range {v54 .. v55}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v54

    const-string/jumbo v55, "url"

    move-object/from16 v0, v23

    move-object/from16 v1, v55

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v55

    invoke-virtual/range {v54 .. v55}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v54

    invoke-virtual/range {v54 .. v54}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v54

    invoke-static/range {v54 .. v54}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v54

    move-object/from16 v0, v54

    invoke-direct {v5, v4, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 177
    .restart local v5    # "intent":Landroid/content/Intent;
    const-string/jumbo v4, "com.vkontakte.android"

    invoke-virtual {v5, v4}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 178
    const-string/jumbo v4, "device_token"

    const-string/jumbo v54, "device_token"

    move-object/from16 v0, v23

    move-object/from16 v1, v54

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v54

    move-object/from16 v0, v54

    invoke-virtual {v5, v4, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 179
    const-string/jumbo v4, "token"

    const-string/jumbo v54, "url"

    move-object/from16 v0, v23

    move-object/from16 v1, v54

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v54

    invoke-static/range {v54 .. v54}, Lcom/vkontakte/android/utils/XSRFTokenUtil;->generateToken(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v54

    move-object/from16 v0, v54

    invoke-virtual {v5, v4, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 180
    sget v4, Lcom/vkontakte/android/GCMBroadcastReceiver;->validateDeviceNotificationLast:I

    const/high16 v54, 0x8000000

    move-object/from16 v0, p2

    move/from16 v1, v54

    invoke-static {v0, v4, v5, v1}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v20

    .line 182
    .restart local v20    # "contentIntent":Landroid/app/PendingIntent;
    new-instance v4, Landroid/app/Notification$Builder;

    move-object/from16 v0, p2

    invoke-direct {v4, v0}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    const v54, 0x7f02029c

    .line 183
    move/from16 v0, v54

    invoke-virtual {v4, v0}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v4

    const v54, 0x7f0800d0

    .line 184
    move-object/from16 v0, p2

    move/from16 v1, v54

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v54

    move-object/from16 v0, v54

    invoke-virtual {v4, v0}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v4

    .line 185
    invoke-virtual {v4, v10}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v4

    .line 186
    invoke-virtual {v4, v10}, Landroid/app/Notification$Builder;->setTicker(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v4

    .line 187
    move-object/from16 v0, v20

    invoke-virtual {v4, v0}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v4

    const/16 v54, 0x1

    .line 188
    move/from16 v0, v54

    invoke-virtual {v4, v0}, Landroid/app/Notification$Builder;->setAutoCancel(Z)Landroid/app/Notification$Builder;

    move-result-object v4

    const/16 v54, 0x2

    .line 189
    move/from16 v0, v54

    invoke-virtual {v4, v0}, Landroid/app/Notification$Builder;->setDefaults(I)Landroid/app/Notification$Builder;

    move-result-object v16

    .line 190
    .restart local v16    # "bldr":Landroid/app/Notification$Builder;
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v54, 0x10

    move/from16 v0, v54

    if-lt v4, v0, :cond_17

    .line 191
    new-instance v4, Landroid/app/Notification$BigTextStyle;

    const/16 v54, 0x2

    move-object/from16 v0, v16

    move/from16 v1, v54

    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setPriority(I)Landroid/app/Notification$Builder;

    move-result-object v54

    move-object/from16 v0, v54

    invoke-direct {v4, v0}, Landroid/app/Notification$BigTextStyle;-><init>(Landroid/app/Notification$Builder;)V

    .line 192
    invoke-virtual {v4, v10}, Landroid/app/Notification$BigTextStyle;->bigText(Ljava/lang/CharSequence;)Landroid/app/Notification$BigTextStyle;

    move-result-object v4

    .line 193
    invoke-virtual {v4}, Landroid/app/Notification$BigTextStyle;->build()Landroid/app/Notification;

    move-result-object v36

    .line 197
    .restart local v36    # "ntf":Landroid/app/Notification;
    :goto_5
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v54, 0x15

    move/from16 v0, v54

    if-lt v4, v0, :cond_a

    .line 198
    invoke-virtual/range {p2 .. p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v54, 0x7f0f0018

    move/from16 v0, v54

    invoke-virtual {v4, v0}, Landroid/content/res/Resources;->getColor(I)I

    move-result v4

    move-object/from16 v0, v36

    iput v4, v0, Landroid/app/Notification;->color:I

    .line 200
    :cond_a
    sget v4, Lcom/vkontakte/android/GCMBroadcastReceiver;->validateDeviceNotificationLast:I

    add-int/lit16 v4, v4, 0x21c

    move-object/from16 v0, p2

    move-object/from16 v1, v36

    invoke-static {v0, v4, v1, v12}, Lcom/vkontakte/android/GCMBroadcastReceiver;->notify(Landroid/content/Context;ILandroid/app/Notification;Z)V

    .line 201
    sget v4, Lcom/vkontakte/android/GCMBroadcastReceiver;->validateDeviceNotificationLast:I

    add-int/lit8 v4, v4, 0x1

    sput v4, Lcom/vkontakte/android/GCMBroadcastReceiver;->validateDeviceNotificationLast:I

    .line 202
    sget v4, Lcom/vkontakte/android/GCMBroadcastReceiver;->validateDeviceNotificationLast:I

    rem-int/lit8 v4, v4, 0x14

    sput v4, Lcom/vkontakte/android/GCMBroadcastReceiver;->validateDeviceNotificationLast:I

    .line 205
    .end local v5    # "intent":Landroid/content/Intent;
    .end local v10    # "text":Ljava/lang/String;
    .end local v16    # "bldr":Landroid/app/Notification$Builder;
    .end local v20    # "contentIntent":Landroid/app/PendingIntent;
    .end local v36    # "ntf":Landroid/app/Notification;
    :cond_b
    const-string/jumbo v4, "validate_action"

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_f

    .line 206
    const-string/jumbo v4, "text"

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 207
    .restart local v10    # "text":Ljava/lang/String;
    const-string/jumbo v4, "confirm"

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v34

    .line 208
    .local v34, "longText":Ljava/lang/String;
    if-nez v34, :cond_c

    .line 209
    move-object/from16 v34, v10

    .line 211
    :cond_c
    const-string/jumbo v4, "confirm_hash"

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    .line 212
    .local v26, "hash":Ljava/lang/String;
    new-instance v5, Landroid/content/Intent;

    sget-object v4, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const-class v54, Lcom/vkontakte/android/ConfirmActionBroadcastReceiver;

    move-object/from16 v0, v54

    invoke-direct {v5, v4, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 213
    .restart local v5    # "intent":Landroid/content/Intent;
    const-string/jumbo v4, "confirm_text"

    move-object/from16 v0, v34

    invoke-virtual {v5, v4, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 214
    const-string/jumbo v4, "hash"

    move-object/from16 v0, v26

    invoke-virtual {v5, v4, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 215
    const-string/jumbo v4, "notification_id"

    sget v54, Lcom/vkontakte/android/GCMBroadcastReceiver;->validateActionNotificationLast:I

    move/from16 v0, v54

    add-int/lit16 v0, v0, 0x230

    move/from16 v54, v0

    move/from16 v0, v54

    invoke-virtual {v5, v4, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 216
    const-string/jumbo v4, "token"

    invoke-static/range {v26 .. v26}, Lcom/vkontakte/android/utils/XSRFTokenUtil;->generateToken(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v54

    move-object/from16 v0, v54

    invoke-virtual {v5, v4, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 217
    const-string/jumbo v4, "com.vkontatke.android.ACTION_CONFIRM_OPEN_BOX"

    invoke-virtual {v5, v4}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 218
    sget v4, Lcom/vkontakte/android/GCMBroadcastReceiver;->validateActionNotificationLast:I

    const/high16 v54, 0x8000000

    move-object/from16 v0, p2

    move/from16 v1, v54

    invoke-static {v0, v4, v5, v1}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v20

    .line 219
    .restart local v20    # "contentIntent":Landroid/app/PendingIntent;
    new-instance v4, Landroid/app/Notification$Builder;

    move-object/from16 v0, p2

    invoke-direct {v4, v0}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    const v54, 0x7f02029c

    .line 220
    move/from16 v0, v54

    invoke-virtual {v4, v0}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v4

    const v54, 0x7f080177

    .line 221
    move-object/from16 v0, p2

    move/from16 v1, v54

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v54

    move-object/from16 v0, v54

    invoke-virtual {v4, v0}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v4

    .line 222
    invoke-virtual {v4, v10}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v4

    .line 223
    invoke-virtual {v4, v10}, Landroid/app/Notification$Builder;->setTicker(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v4

    .line 224
    move-object/from16 v0, v20

    invoke-virtual {v4, v0}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v4

    const/16 v54, 0x1

    .line 225
    move/from16 v0, v54

    invoke-virtual {v4, v0}, Landroid/app/Notification$Builder;->setAutoCancel(Z)Landroid/app/Notification$Builder;

    move-result-object v4

    const/16 v54, 0x2

    .line 226
    move/from16 v0, v54

    invoke-virtual {v4, v0}, Landroid/app/Notification$Builder;->setDefaults(I)Landroid/app/Notification$Builder;

    move-result-object v16

    .line 227
    .restart local v16    # "bldr":Landroid/app/Notification$Builder;
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v54, 0x10

    move/from16 v0, v54

    if-lt v4, v0, :cond_d

    .line 228
    new-instance v19, Landroid/content/Intent;

    sget-object v4, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const-class v54, Lcom/vkontakte/android/ConfirmActionBroadcastReceiver;

    move-object/from16 v0, v19

    move-object/from16 v1, v54

    invoke-direct {v0, v4, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 229
    .local v19, "confirmIntent":Landroid/content/Intent;
    const-string/jumbo v4, "hash"

    move-object/from16 v0, v19

    move-object/from16 v1, v26

    invoke-virtual {v0, v4, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 230
    const-string/jumbo v4, "notification_id"

    sget v54, Lcom/vkontakte/android/GCMBroadcastReceiver;->validateActionNotificationLast:I

    move/from16 v0, v54

    add-int/lit16 v0, v0, 0x230

    move/from16 v54, v0

    move-object/from16 v0, v19

    move/from16 v1, v54

    invoke-virtual {v0, v4, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 231
    const-string/jumbo v4, "token"

    invoke-static/range {v26 .. v26}, Lcom/vkontakte/android/utils/XSRFTokenUtil;->generateToken(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v54

    move-object/from16 v0, v19

    move-object/from16 v1, v54

    invoke-virtual {v0, v4, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 232
    const-string/jumbo v4, "com.vkontatke.android.ACTION_CONFIRM_ACTION"

    move-object/from16 v0, v19

    invoke-virtual {v0, v4}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 233
    new-instance v22, Landroid/content/Intent;

    sget-object v4, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const-class v54, Lcom/vkontakte/android/ConfirmActionBroadcastReceiver;

    move-object/from16 v0, v22

    move-object/from16 v1, v54

    invoke-direct {v0, v4, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 234
    .local v22, "declineIntent":Landroid/content/Intent;
    const-string/jumbo v4, "hash"

    move-object/from16 v0, v22

    move-object/from16 v1, v26

    invoke-virtual {v0, v4, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 235
    const-string/jumbo v4, "notification_id"

    sget v54, Lcom/vkontakte/android/GCMBroadcastReceiver;->validateActionNotificationLast:I

    move/from16 v0, v54

    add-int/lit16 v0, v0, 0x230

    move/from16 v54, v0

    move-object/from16 v0, v22

    move/from16 v1, v54

    invoke-virtual {v0, v4, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 236
    const-string/jumbo v4, "token"

    invoke-static/range {v26 .. v26}, Lcom/vkontakte/android/utils/XSRFTokenUtil;->generateToken(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v54

    move-object/from16 v0, v22

    move-object/from16 v1, v54

    invoke-virtual {v0, v4, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 237
    const-string/jumbo v4, "com.vkontatke.android.ACTION_DECLINE_ACTION"

    move-object/from16 v0, v22

    invoke-virtual {v0, v4}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 238
    const v4, 0x7f020184

    const v54, 0x7f08069d

    move-object/from16 v0, p2

    move/from16 v1, v54

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v54

    sget v55, Lcom/vkontakte/android/GCMBroadcastReceiver;->validateActionNotificationLast:I

    const/high16 v56, 0x8000000

    move-object/from16 v0, p2

    move/from16 v1, v55

    move-object/from16 v2, v19

    move/from16 v3, v56

    invoke-static {v0, v1, v2, v3}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v55

    move-object/from16 v0, v16

    move-object/from16 v1, v54

    move-object/from16 v2, v55

    invoke-virtual {v0, v4, v1, v2}, Landroid/app/Notification$Builder;->addAction(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    .line 239
    const v4, 0x7f0202c5

    const v54, 0x7f08011f

    move-object/from16 v0, p2

    move/from16 v1, v54

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v54

    sget v55, Lcom/vkontakte/android/GCMBroadcastReceiver;->validateActionNotificationLast:I

    const/high16 v56, 0x8000000

    move-object/from16 v0, p2

    move/from16 v1, v55

    move-object/from16 v2, v22

    move/from16 v3, v56

    invoke-static {v0, v1, v2, v3}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v55

    move-object/from16 v0, v16

    move-object/from16 v1, v54

    move-object/from16 v2, v55

    invoke-virtual {v0, v4, v1, v2}, Landroid/app/Notification$Builder;->addAction(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    .line 240
    const/4 v4, 0x2

    move-object/from16 v0, v16

    invoke-virtual {v0, v4}, Landroid/app/Notification$Builder;->setPriority(I)Landroid/app/Notification$Builder;

    .line 243
    .end local v19    # "confirmIntent":Landroid/content/Intent;
    .end local v22    # "declineIntent":Landroid/content/Intent;
    :cond_d
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v54, 0x10

    move/from16 v0, v54

    if-lt v4, v0, :cond_18

    .line 244
    new-instance v4, Landroid/app/Notification$BigTextStyle;

    move-object/from16 v0, v16

    invoke-direct {v4, v0}, Landroid/app/Notification$BigTextStyle;-><init>(Landroid/app/Notification$Builder;)V

    .line 245
    invoke-virtual {v4, v10}, Landroid/app/Notification$BigTextStyle;->bigText(Ljava/lang/CharSequence;)Landroid/app/Notification$BigTextStyle;

    move-result-object v4

    .line 246
    invoke-virtual {v4}, Landroid/app/Notification$BigTextStyle;->build()Landroid/app/Notification;

    move-result-object v36

    .line 250
    .restart local v36    # "ntf":Landroid/app/Notification;
    :goto_6
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v54, 0x15

    move/from16 v0, v54

    if-lt v4, v0, :cond_e

    .line 251
    invoke-virtual/range {p2 .. p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v54, 0x7f0f0018

    move/from16 v0, v54

    invoke-virtual {v4, v0}, Landroid/content/res/Resources;->getColor(I)I

    move-result v4

    move-object/from16 v0, v36

    iput v4, v0, Landroid/app/Notification;->color:I

    .line 253
    :cond_e
    sget v4, Lcom/vkontakte/android/GCMBroadcastReceiver;->validateActionNotificationLast:I

    add-int/lit16 v4, v4, 0x230

    move-object/from16 v0, p2

    move-object/from16 v1, v36

    invoke-static {v0, v4, v1, v12}, Lcom/vkontakte/android/GCMBroadcastReceiver;->notify(Landroid/content/Context;ILandroid/app/Notification;Z)V

    .line 254
    sget v4, Lcom/vkontakte/android/GCMBroadcastReceiver;->validateActionNotificationLast:I

    add-int/lit8 v4, v4, 0x1

    sput v4, Lcom/vkontakte/android/GCMBroadcastReceiver;->validateActionNotificationLast:I

    .line 255
    sget v4, Lcom/vkontakte/android/GCMBroadcastReceiver;->validateActionNotificationLast:I

    rem-int/lit8 v4, v4, 0x14

    sput v4, Lcom/vkontakte/android/GCMBroadcastReceiver;->validateActionNotificationLast:I

    .line 258
    .end local v5    # "intent":Landroid/content/Intent;
    .end local v10    # "text":Ljava/lang/String;
    .end local v16    # "bldr":Landroid/app/Notification$Builder;
    .end local v20    # "contentIntent":Landroid/app/PendingIntent;
    .end local v26    # "hash":Ljava/lang/String;
    .end local v34    # "longText":Ljava/lang/String;
    .end local v36    # "ntf":Landroid/app/Notification;
    :cond_f
    const-string/jumbo v4, "show_message"

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_13

    .line 259
    const-string/jumbo v4, "text"

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 260
    .restart local v10    # "text":Ljava/lang/String;
    const-string/jumbo v4, "message"

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v34

    .line 261
    .restart local v34    # "longText":Ljava/lang/String;
    if-nez v34, :cond_10

    .line 262
    move-object/from16 v34, v10

    .line 264
    :cond_10
    new-instance v5, Landroid/content/Intent;

    sget-object v4, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const-class v54, Lcom/vkontakte/android/ConfirmActionBroadcastReceiver;

    move-object/from16 v0, v54

    invoke-direct {v5, v4, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 265
    .restart local v5    # "intent":Landroid/content/Intent;
    const-string/jumbo v4, "text"

    move-object/from16 v0, v34

    invoke-virtual {v5, v4, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 266
    const-string/jumbo v4, "button"

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_11

    .line 267
    const-string/jumbo v4, "button"

    const-string/jumbo v54, "button"

    move-object/from16 v0, v23

    move-object/from16 v1, v54

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v54

    move-object/from16 v0, v54

    invoke-virtual {v5, v4, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 269
    :cond_11
    const-string/jumbo v54, "title"

    const-string/jumbo v4, "title"

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_19

    const-string/jumbo v4, "title"

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    :goto_7
    move-object/from16 v0, v54

    invoke-virtual {v5, v0, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 270
    const-string/jumbo v4, "hash"

    invoke-virtual {v5, v4, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 271
    const-string/jumbo v4, "token"

    invoke-static {v10}, Lcom/vkontakte/android/utils/XSRFTokenUtil;->generateToken(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v54

    move-object/from16 v0, v54

    invoke-virtual {v5, v4, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 272
    const-string/jumbo v4, "com.vkontatke.android.ACTION_CONFIRM_OPEN_NOTIFICATION"

    invoke-virtual {v5, v4}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 273
    sget v4, Lcom/vkontakte/android/GCMBroadcastReceiver;->validateActionNotificationLast:I

    const/high16 v54, 0x8000000

    move-object/from16 v0, p2

    move/from16 v1, v54

    invoke-static {v0, v4, v5, v1}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v20

    .line 274
    .restart local v20    # "contentIntent":Landroid/app/PendingIntent;
    new-instance v4, Landroid/app/Notification$Builder;

    move-object/from16 v0, p2

    invoke-direct {v4, v0}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    const v54, 0x7f02029c

    .line 275
    move/from16 v0, v54

    invoke-virtual {v4, v0}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v54

    const-string/jumbo v4, "title"

    .line 276
    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1a

    const-string/jumbo v4, "title"

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    :goto_8
    move-object/from16 v0, v54

    invoke-virtual {v0, v4}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v4

    .line 277
    invoke-virtual {v4, v10}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v4

    .line 278
    invoke-virtual {v4, v10}, Landroid/app/Notification$Builder;->setTicker(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v4

    .line 279
    move-object/from16 v0, v20

    invoke-virtual {v4, v0}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v4

    const/16 v54, 0x1

    .line 280
    move/from16 v0, v54

    invoke-virtual {v4, v0}, Landroid/app/Notification$Builder;->setAutoCancel(Z)Landroid/app/Notification$Builder;

    move-result-object v4

    const/16 v54, 0x2

    .line 281
    move/from16 v0, v54

    invoke-virtual {v4, v0}, Landroid/app/Notification$Builder;->setDefaults(I)Landroid/app/Notification$Builder;

    move-result-object v16

    .line 283
    .restart local v16    # "bldr":Landroid/app/Notification$Builder;
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v54, 0x10

    move/from16 v0, v54

    if-lt v4, v0, :cond_1b

    .line 284
    new-instance v4, Landroid/app/Notification$BigTextStyle;

    move-object/from16 v0, v16

    invoke-direct {v4, v0}, Landroid/app/Notification$BigTextStyle;-><init>(Landroid/app/Notification$Builder;)V

    invoke-static/range {v34 .. v34}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v54

    move-object/from16 v0, v54

    invoke-virtual {v4, v0}, Landroid/app/Notification$BigTextStyle;->bigText(Ljava/lang/CharSequence;)Landroid/app/Notification$BigTextStyle;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Notification$BigTextStyle;->build()Landroid/app/Notification;

    move-result-object v36

    .line 288
    .restart local v36    # "ntf":Landroid/app/Notification;
    :goto_9
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v54, 0x15

    move/from16 v0, v54

    if-lt v4, v0, :cond_12

    .line 289
    invoke-virtual/range {p2 .. p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v54, 0x7f0f0018

    move/from16 v0, v54

    invoke-virtual {v4, v0}, Landroid/content/res/Resources;->getColor(I)I

    move-result v4

    move-object/from16 v0, v36

    iput v4, v0, Landroid/app/Notification;->color:I

    .line 291
    :cond_12
    sget v4, Lcom/vkontakte/android/GCMBroadcastReceiver;->showMessageNotificationLast:I

    add-int/lit16 v4, v4, 0x244

    move-object/from16 v0, p2

    move-object/from16 v1, v36

    invoke-static {v0, v4, v1, v12}, Lcom/vkontakte/android/GCMBroadcastReceiver;->notify(Landroid/content/Context;ILandroid/app/Notification;Z)V

    .line 292
    sget v4, Lcom/vkontakte/android/GCMBroadcastReceiver;->showMessageNotificationLast:I

    add-int/lit8 v4, v4, 0x1

    sput v4, Lcom/vkontakte/android/GCMBroadcastReceiver;->showMessageNotificationLast:I

    .line 293
    sget v4, Lcom/vkontakte/android/GCMBroadcastReceiver;->showMessageNotificationLast:I

    rem-int/lit8 v4, v4, 0x14

    sput v4, Lcom/vkontakte/android/GCMBroadcastReceiver;->showMessageNotificationLast:I

    .line 301
    .end local v5    # "intent":Landroid/content/Intent;
    .end local v10    # "text":Ljava/lang/String;
    .end local v16    # "bldr":Landroid/app/Notification$Builder;
    .end local v20    # "contentIntent":Landroid/app/PendingIntent;
    .end local v34    # "longText":Ljava/lang/String;
    .end local v36    # "ntf":Landroid/app/Notification;
    :cond_13
    const-string/jumbo v4, "dnd_end"

    const-wide/16 v54, 0x0

    move-object/from16 v0, v43

    move-wide/from16 v1, v54

    invoke-interface {v0, v4, v1, v2}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v54

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v56

    cmp-long v4, v54, v56

    if-lez v4, :cond_1c

    .line 302
    const-string/jumbo v4, "vk"

    const-string/jumbo v54, "global dnd is active"

    move-object/from16 v0, v54

    invoke-static {v4, v0}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    .restart local v10    # "text":Ljava/lang/String;
    .restart local v47    # "tryInternal":Z
    .restart local v50    # "url":Ljava/lang/String;
    :cond_14
    move-object/from16 v4, v50

    .line 143
    goto/16 :goto_2

    .line 153
    .restart local v5    # "intent":Landroid/content/Intent;
    .restart local v20    # "contentIntent":Landroid/app/PendingIntent;
    :cond_15
    const v4, 0x7f0800d0

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_3

    .line 164
    .restart local v16    # "bldr":Landroid/app/Notification$Builder;
    :cond_16
    invoke-virtual/range {v16 .. v16}, Landroid/app/Notification$Builder;->getNotification()Landroid/app/Notification;

    move-result-object v36

    .restart local v36    # "ntf":Landroid/app/Notification;
    goto/16 :goto_4

    .line 195
    .end local v36    # "ntf":Landroid/app/Notification;
    .end local v47    # "tryInternal":Z
    .end local v50    # "url":Ljava/lang/String;
    :cond_17
    invoke-virtual/range {v16 .. v16}, Landroid/app/Notification$Builder;->getNotification()Landroid/app/Notification;

    move-result-object v36

    .restart local v36    # "ntf":Landroid/app/Notification;
    goto/16 :goto_5

    .line 248
    .end local v36    # "ntf":Landroid/app/Notification;
    .restart local v26    # "hash":Ljava/lang/String;
    .restart local v34    # "longText":Ljava/lang/String;
    :cond_18
    invoke-virtual/range {v16 .. v16}, Landroid/app/Notification$Builder;->getNotification()Landroid/app/Notification;

    move-result-object v36

    .restart local v36    # "ntf":Landroid/app/Notification;
    goto/16 :goto_6

    .line 269
    .end local v16    # "bldr":Landroid/app/Notification$Builder;
    .end local v20    # "contentIntent":Landroid/app/PendingIntent;
    .end local v26    # "hash":Ljava/lang/String;
    .end local v36    # "ntf":Landroid/app/Notification;
    :cond_19
    const v4, 0x7f0800d0

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_7

    .line 276
    .restart local v20    # "contentIntent":Landroid/app/PendingIntent;
    :cond_1a
    const v4, 0x7f0800d0

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_8

    .line 286
    .restart local v16    # "bldr":Landroid/app/Notification$Builder;
    :cond_1b
    invoke-virtual/range {v16 .. v16}, Landroid/app/Notification$Builder;->getNotification()Landroid/app/Notification;

    move-result-object v36

    .restart local v36    # "ntf":Landroid/app/Notification;
    goto/16 :goto_9

    .line 306
    .end local v5    # "intent":Landroid/content/Intent;
    .end local v10    # "text":Ljava/lang/String;
    .end local v16    # "bldr":Landroid/app/Notification$Builder;
    .end local v20    # "contentIntent":Landroid/app/PendingIntent;
    .end local v34    # "longText":Ljava/lang/String;
    .end local v36    # "ntf":Landroid/app/Notification;
    :cond_1c
    const-string/jumbo v4, "wall_post"

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1e

    .line 307
    sget-object v4, Lcom/vkontakte/android/NotificationUtils$Type;->Posts:Lcom/vkontakte/android/NotificationUtils$Type;

    move-object/from16 v0, p2

    invoke-static {v0, v4}, Lcom/vkontakte/android/NotificationUtils;->areNotificationsEnabled(Landroid/content/Context;Lcom/vkontakte/android/NotificationUtils$Type;)Z

    move-result v4

    if-nez v4, :cond_1d

    .line 308
    const-string/jumbo v4, "vk"

    const-string/jumbo v54, "posts notifications disabled"

    move-object/from16 v0, v54

    invoke-static {v4, v0}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 311
    :cond_1d
    new-instance v4, Lcom/vkontakte/android/api/wall/WallGetById;

    const/16 v54, 0x1

    move/from16 v0, v54

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v54, v0

    const/16 v55, 0x0

    const-string/jumbo v56, "place"

    move-object/from16 v0, v23

    move-object/from16 v1, v56

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v56

    const-string/jumbo v57, "wall"

    const-string/jumbo v58, ""

    invoke-virtual/range {v56 .. v58}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v56

    aput-object v56, v54, v55

    move-object/from16 v0, v54

    invoke-direct {v4, v0}, Lcom/vkontakte/android/api/wall/WallGetById;-><init>([Ljava/lang/String;)V

    new-instance v54, Lcom/vkontakte/android/GCMBroadcastReceiver$1;

    move-object/from16 v0, v54

    move-object/from16 v1, p0

    move-object/from16 v2, p2

    move-object/from16 v3, v23

    invoke-direct {v0, v1, v2, v3, v12}, Lcom/vkontakte/android/GCMBroadcastReceiver$1;-><init>(Lcom/vkontakte/android/GCMBroadcastReceiver;Landroid/content/Context;Landroid/os/Bundle;Z)V

    .line 312
    move-object/from16 v0, v54

    invoke-virtual {v4, v0}, Lcom/vkontakte/android/api/wall/WallGetById;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v4

    .line 346
    invoke-virtual {v4}, Lcom/vkontakte/android/api/VKAPIRequest;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    goto/16 :goto_1

    .line 361
    :cond_1e
    const-string/jumbo v4, "new_post"

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1f

    .line 362
    new-instance v4, Lcom/vkontakte/android/api/wall/WallGetById;

    const/16 v54, 0x1

    move/from16 v0, v54

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v54, v0

    const/16 v55, 0x0

    new-instance v56, Ljava/lang/StringBuilder;

    invoke-direct/range {v56 .. v56}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v57, "from_id"

    move-object/from16 v0, v23

    move-object/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v57

    invoke-virtual/range {v56 .. v57}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v56

    const-string/jumbo v57, "_"

    invoke-virtual/range {v56 .. v57}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v56

    const-string/jumbo v57, "post_id"

    move-object/from16 v0, v23

    move-object/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v57

    invoke-virtual/range {v56 .. v57}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v56

    invoke-virtual/range {v56 .. v56}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v56

    aput-object v56, v54, v55

    move-object/from16 v0, v54

    invoke-direct {v4, v0}, Lcom/vkontakte/android/api/wall/WallGetById;-><init>([Ljava/lang/String;)V

    new-instance v54, Lcom/vkontakte/android/GCMBroadcastReceiver$2;

    move-object/from16 v0, v54

    move-object/from16 v1, p0

    move-object/from16 v2, p2

    move-object/from16 v3, v23

    invoke-direct {v0, v1, v2, v3, v12}, Lcom/vkontakte/android/GCMBroadcastReceiver$2;-><init>(Lcom/vkontakte/android/GCMBroadcastReceiver;Landroid/content/Context;Landroid/os/Bundle;Z)V

    .line 363
    move-object/from16 v0, v54

    invoke-virtual {v4, v0}, Lcom/vkontakte/android/api/wall/WallGetById;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v4

    .line 398
    invoke-virtual {v4}, Lcom/vkontakte/android/api/VKAPIRequest;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    goto/16 :goto_1

    .line 402
    :cond_1f
    const-string/jumbo v4, "request"

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_20

    const-string/jumbo v4, "invite"

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2a

    .line 403
    :cond_20
    sget-object v4, Lcom/vkontakte/android/NotificationUtils$Type;->Games:Lcom/vkontakte/android/NotificationUtils$Type;

    move-object/from16 v0, p2

    invoke-static {v0, v4}, Lcom/vkontakte/android/NotificationUtils;->areNotificationsEnabled(Landroid/content/Context;Lcom/vkontakte/android/NotificationUtils$Type;)Z

    move-result v4

    if-nez v4, :cond_21

    .line 404
    const-string/jumbo v4, "vk"

    const-string/jumbo v54, "games notifications disabled"

    move-object/from16 v0, v54

    invoke-static {v4, v0}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 408
    :cond_21
    const-string/jumbo v4, "from_id"

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v48

    .line 409
    .local v48, "uid":I
    invoke-static/range {v48 .. v48}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v4}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-static {v4}, Lcom/vkontakte/android/data/Friends;->getUsersBlocking(Ljava/util/List;)Ljava/util/ArrayList;

    move-result-object v52

    .line 410
    .local v52, "users":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    invoke-virtual/range {v52 .. v52}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-eqz v4, :cond_1

    .line 413
    const/4 v4, 0x0

    move-object/from16 v0, v52

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v51

    check-cast v51, Lcom/vkontakte/android/UserProfile;

    .line 414
    .local v51, "user":Lcom/vkontakte/android/UserProfile;
    const-string/jumbo v4, "from_name"

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_23

    const-string/jumbo v4, "from_name"

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v24

    .line 415
    .local v24, "fullName":Ljava/lang/String;
    :goto_a
    invoke-static/range {p2 .. p2}, Lcom/vkontakte/android/LinkRedirActivity;->createIntentForNotification(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v5

    .line 416
    .restart local v5    # "intent":Landroid/content/Intent;
    const-string/jumbo v4, "fdsafdsafdsafdasfdsafasfdfdsaf"

    invoke-virtual {v5, v4}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 417
    const-string/jumbo v31, "app_id"

    .line 418
    .local v31, "keyAppId":Ljava/lang/String;
    const-string/jumbo v4, "app_id"

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_24

    .line 419
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v54, "vkontakte://vk.com/apps?from_notification=1&game_id="

    move-object/from16 v0, v54

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v54, "app_id"

    move-object/from16 v0, v23

    move-object/from16 v1, v54

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v54

    move-object/from16 v0, v54

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v5, v4}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 423
    :goto_b
    const/high16 v4, 0x10000000

    invoke-virtual {v5, v4}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 425
    const-string/jumbo v4, "request"

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_27

    .line 426
    const-string/jumbo v4, "text"

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_25

    const-string/jumbo v4, "text"

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_25

    .line 427
    const-string/jumbo v4, "text"

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 436
    .restart local v10    # "text":Ljava/lang/String;
    :goto_c
    move-object/from16 v0, v51

    iget-object v4, v0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-static {v4}, Lcom/vk/imageloader/VKImageLoader;->getCircleBitmap(Ljava/lang/String;)Lio/reactivex/Observable;

    move-result-object v4

    invoke-static {v4}, Lcom/vk/core/util/RxUtil;->blockingGetWithNull(Lio/reactivex/Observable;)Ljava/lang/Object;

    move-result-object v41

    check-cast v41, Landroid/graphics/Bitmap;

    .line 437
    .local v41, "photo":Landroid/graphics/Bitmap;
    new-instance v4, Landroid/app/Notification$Builder;

    move-object/from16 v0, p2

    invoke-direct {v4, v0}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    .line 438
    move-object/from16 v0, v24

    invoke-virtual {v4, v0}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v4

    .line 439
    invoke-virtual {v4, v10}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v4

    const/16 v54, 0x0

    const/high16 v55, 0x10000000

    .line 440
    move-object/from16 v0, p2

    move/from16 v1, v54

    move/from16 v2, v55

    invoke-static {v0, v1, v5, v2}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v54

    move-object/from16 v0, v54

    invoke-virtual {v4, v0}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v4

    new-instance v54, Ljava/lang/StringBuilder;

    invoke-direct/range {v54 .. v54}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v54

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v54

    const-string/jumbo v55, " "

    invoke-virtual/range {v54 .. v55}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v54

    move-object/from16 v0, v54

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v54

    invoke-virtual/range {v54 .. v54}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v54

    .line 441
    move-object/from16 v0, v54

    invoke-virtual {v4, v0}, Landroid/app/Notification$Builder;->setTicker(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v4

    const/16 v54, 0x1

    .line 442
    move/from16 v0, v54

    invoke-virtual {v4, v0}, Landroid/app/Notification$Builder;->setAutoCancel(Z)Landroid/app/Notification$Builder;

    move-result-object v4

    if-eqz v41, :cond_28

    .line 443
    .end local v41    # "photo":Landroid/graphics/Bitmap;
    :goto_d
    const/high16 v54, 0x42800000    # 64.0f

    invoke-static/range {v54 .. v54}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v54

    const/high16 v55, 0x42800000    # 64.0f

    invoke-static/range {v55 .. v55}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v55

    const/16 v56, 0x1

    move-object/from16 v0, v41

    move/from16 v1, v54

    move/from16 v2, v55

    move/from16 v3, v56

    invoke-static {v0, v1, v2, v3}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v54

    move-object/from16 v0, v54

    invoke-virtual {v4, v0}, Landroid/app/Notification$Builder;->setLargeIcon(Landroid/graphics/Bitmap;)Landroid/app/Notification$Builder;

    move-result-object v4

    const v54, 0x7f020298

    .line 445
    move/from16 v0, v54

    invoke-virtual {v4, v0}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v16

    .line 446
    .restart local v16    # "bldr":Landroid/app/Notification$Builder;
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v54, 0x10

    move/from16 v0, v54

    if-lt v4, v0, :cond_29

    .line 447
    new-instance v4, Landroid/app/Notification$BigTextStyle;

    move-object/from16 v0, v16

    invoke-direct {v4, v0}, Landroid/app/Notification$BigTextStyle;-><init>(Landroid/app/Notification$Builder;)V

    move-object/from16 v0, v51

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    move-object/from16 v54, v0

    .line 448
    move-object/from16 v0, v54

    invoke-virtual {v4, v0}, Landroid/app/Notification$BigTextStyle;->setBigContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$BigTextStyle;

    move-result-object v4

    .line 449
    invoke-virtual {v4, v10}, Landroid/app/Notification$BigTextStyle;->bigText(Ljava/lang/CharSequence;)Landroid/app/Notification$BigTextStyle;

    move-result-object v4

    .line 450
    invoke-virtual {v4}, Landroid/app/Notification$BigTextStyle;->build()Landroid/app/Notification;

    move-result-object v36

    .line 454
    .restart local v36    # "ntf":Landroid/app/Notification;
    :goto_e
    sget-object v4, Lcom/vkontakte/android/NotificationUtils$Type;->Games:Lcom/vkontakte/android/NotificationUtils$Type;

    const/16 v54, 0x1

    move-object/from16 v0, p2

    move-object/from16 v1, v36

    move/from16 v2, v54

    invoke-static {v0, v1, v4, v2}, Lcom/vkontakte/android/NotificationUtils;->applySettings(Landroid/content/Context;Landroid/app/Notification;Lcom/vkontakte/android/NotificationUtils$Type;Z)V

    .line 455
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v54, 0x15

    move/from16 v0, v54

    if-lt v4, v0, :cond_22

    .line 456
    invoke-virtual/range {p2 .. p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v54, 0x7f0f0018

    move/from16 v0, v54

    invoke-virtual {v4, v0}, Landroid/content/res/Resources;->getColor(I)I

    move-result v4

    move-object/from16 v0, v36

    iput v4, v0, Landroid/app/Notification;->color:I

    .line 457
    const-string/jumbo v4, "social"

    move-object/from16 v0, v36

    iput-object v4, v0, Landroid/app/Notification;->category:Ljava/lang/String;

    .line 459
    :cond_22
    const/16 v4, 0x1f8

    move-object/from16 v0, p2

    move-object/from16 v1, v36

    invoke-static {v0, v4, v1, v12}, Lcom/vkontakte/android/GCMBroadcastReceiver;->notify(Landroid/content/Context;ILandroid/app/Notification;Z)V

    .line 461
    invoke-static {}, Lcom/vkontakte/android/LongPollService;->updateCounters()V

    .line 462
    new-instance v4, Landroid/content/Intent;

    const-string/jumbo v54, "com.vkontakte.android.games.RELOAD_REQUESTS"

    move-object/from16 v0, v54

    invoke-direct {v4, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string/jumbo v54, "com.vkontakte.android.permission.ACCESS_DATA"

    move-object/from16 v0, p2

    move-object/from16 v1, v54

    invoke-virtual {v0, v4, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 414
    .end local v5    # "intent":Landroid/content/Intent;
    .end local v10    # "text":Ljava/lang/String;
    .end local v16    # "bldr":Landroid/app/Notification$Builder;
    .end local v24    # "fullName":Ljava/lang/String;
    .end local v31    # "keyAppId":Ljava/lang/String;
    .end local v36    # "ntf":Landroid/app/Notification;
    :cond_23
    move-object/from16 v0, v51

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    move-object/from16 v24, v0

    goto/16 :goto_a

    .line 421
    .restart local v5    # "intent":Landroid/content/Intent;
    .restart local v24    # "fullName":Ljava/lang/String;
    .restart local v31    # "keyAppId":Ljava/lang/String;
    :cond_24
    const-string/jumbo v4, "vkontakte://vk.com/apps?from_notification=1"

    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v5, v4}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    goto/16 :goto_b

    .line 429
    :cond_25
    invoke-virtual/range {p2 .. p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v54

    move-object/from16 v0, v51

    iget-boolean v4, v0, Lcom/vkontakte/android/UserProfile;->f:Z

    if-eqz v4, :cond_26

    const v4, 0x7f08026e

    :goto_f
    const/16 v55, 0x1

    move/from16 v0, v55

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v55, v0

    const/16 v56, 0x0

    const-string/jumbo v57, "app_name"

    move-object/from16 v0, v23

    move-object/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v57

    aput-object v57, v55, v56

    move-object/from16 v0, v54

    move-object/from16 v1, v55

    invoke-virtual {v0, v4, v1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    .restart local v10    # "text":Ljava/lang/String;
    goto/16 :goto_c

    .end local v10    # "text":Ljava/lang/String;
    :cond_26
    const v4, 0x7f08026f

    goto :goto_f

    .line 432
    :cond_27
    invoke-virtual/range {p2 .. p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v54, 0x7f08026d

    const/16 v55, 0x1

    move/from16 v0, v55

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v55, v0

    const/16 v56, 0x0

    const-string/jumbo v57, "app_name"

    move-object/from16 v0, v23

    move-object/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v57

    aput-object v57, v55, v56

    move/from16 v0, v54

    move-object/from16 v1, v55

    invoke-virtual {v4, v0, v1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    .restart local v10    # "text":Ljava/lang/String;
    goto/16 :goto_c

    .line 443
    .restart local v41    # "photo":Landroid/graphics/Bitmap;
    :cond_28
    invoke-virtual/range {p2 .. p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v54

    const v55, 0x7f0203d3

    invoke-static/range {v54 .. v55}, Lcom/vkontakte/android/Global;->getResBitmap(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v41

    goto/16 :goto_d

    .line 452
    .end local v41    # "photo":Landroid/graphics/Bitmap;
    .restart local v16    # "bldr":Landroid/app/Notification$Builder;
    :cond_29
    invoke-virtual/range {v16 .. v16}, Landroid/app/Notification$Builder;->getNotification()Landroid/app/Notification;

    move-result-object v36

    .restart local v36    # "ntf":Landroid/app/Notification;
    goto/16 :goto_e

    .line 467
    .end local v5    # "intent":Landroid/content/Intent;
    .end local v10    # "text":Ljava/lang/String;
    .end local v16    # "bldr":Landroid/app/Notification$Builder;
    .end local v24    # "fullName":Ljava/lang/String;
    .end local v31    # "keyAppId":Ljava/lang/String;
    .end local v36    # "ntf":Landroid/app/Notification;
    .end local v48    # "uid":I
    .end local v51    # "user":Lcom/vkontakte/android/UserProfile;
    .end local v52    # "users":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    :cond_2a
    const-string/jumbo v4, "gift"

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_30

    .line 468
    sget-object v4, Lcom/vkontakte/android/NotificationUtils$Type;->Gifts:Lcom/vkontakte/android/NotificationUtils$Type;

    move-object/from16 v0, p2

    invoke-static {v0, v4}, Lcom/vkontakte/android/NotificationUtils;->areNotificationsEnabled(Landroid/content/Context;Lcom/vkontakte/android/NotificationUtils$Type;)Z

    move-result v4

    if-nez v4, :cond_2b

    .line 469
    const-string/jumbo v4, "vk"

    const-string/jumbo v54, "messages notifications disabled"

    move-object/from16 v0, v54

    invoke-static {v4, v0}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 472
    :cond_2b
    const-string/jumbo v4, "from_id"

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v48

    .line 473
    .restart local v48    # "uid":I
    invoke-static/range {v48 .. v48}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v4}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-static {v4}, Lcom/vkontakte/android/data/Friends;->getUsersBlocking(Ljava/util/List;)Ljava/util/ArrayList;

    move-result-object v52

    .line 474
    .restart local v52    # "users":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    invoke-virtual/range {v52 .. v52}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-eqz v4, :cond_1

    .line 477
    const/4 v4, 0x0

    move-object/from16 v0, v52

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v51

    check-cast v51, Lcom/vkontakte/android/UserProfile;

    .line 478
    .restart local v51    # "user":Lcom/vkontakte/android/UserProfile;
    invoke-static/range {p2 .. p2}, Lcom/vkontakte/android/LinkRedirActivity;->createIntentForNotification(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v5

    .line 479
    .restart local v5    # "intent":Landroid/content/Intent;
    const-string/jumbo v4, "gfhdjsklhdfjsk"

    invoke-virtual {v5, v4}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 480
    const-string/jumbo v4, "vkontakte://vk.com/feed?section=notifications"

    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v5, v4}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 481
    const/high16 v4, 0x10000000

    invoke-virtual {v5, v4}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 483
    invoke-virtual/range {p2 .. p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v54

    move-object/from16 v0, v51

    iget-boolean v4, v0, Lcom/vkontakte/android/UserProfile;->f:Z

    if-eqz v4, :cond_2d

    const v4, 0x7f08041b

    :goto_10
    move-object/from16 v0, v54

    invoke-virtual {v0, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 486
    .restart local v10    # "text":Ljava/lang/String;
    move-object/from16 v0, v51

    iget-object v4, v0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-static {v4}, Lcom/vk/imageloader/VKImageLoader;->getCircleBitmap(Ljava/lang/String;)Lio/reactivex/Observable;

    move-result-object v4

    invoke-static {v4}, Lcom/vk/core/util/RxUtil;->blockingGetWithNull(Lio/reactivex/Observable;)Ljava/lang/Object;

    move-result-object v41

    check-cast v41, Landroid/graphics/Bitmap;

    .line 487
    .restart local v41    # "photo":Landroid/graphics/Bitmap;
    new-instance v4, Landroid/app/Notification$Builder;

    move-object/from16 v0, p2

    invoke-direct {v4, v0}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v51

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    move-object/from16 v54, v0

    .line 488
    move-object/from16 v0, v54

    invoke-virtual {v4, v0}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v4

    .line 489
    invoke-virtual {v4, v10}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v4

    const/16 v54, 0x0

    const/high16 v55, 0x10000000

    .line 490
    move-object/from16 v0, p2

    move/from16 v1, v54

    move/from16 v2, v55

    invoke-static {v0, v1, v5, v2}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v54

    move-object/from16 v0, v54

    invoke-virtual {v4, v0}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v4

    new-instance v54, Ljava/lang/StringBuilder;

    invoke-direct/range {v54 .. v54}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v51

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    move-object/from16 v55, v0

    invoke-virtual/range {v54 .. v55}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v54

    const-string/jumbo v55, " "

    invoke-virtual/range {v54 .. v55}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v54

    move-object/from16 v0, v54

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v54

    invoke-virtual/range {v54 .. v54}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v54

    .line 491
    move-object/from16 v0, v54

    invoke-virtual {v4, v0}, Landroid/app/Notification$Builder;->setTicker(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v4

    if-eqz v41, :cond_2e

    .line 492
    .end local v41    # "photo":Landroid/graphics/Bitmap;
    :goto_11
    const/high16 v54, 0x42800000    # 64.0f

    invoke-static/range {v54 .. v54}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v54

    const/high16 v55, 0x42800000    # 64.0f

    invoke-static/range {v55 .. v55}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v55

    const/16 v56, 0x1

    move-object/from16 v0, v41

    move/from16 v1, v54

    move/from16 v2, v55

    move/from16 v3, v56

    invoke-static {v0, v1, v2, v3}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v54

    move-object/from16 v0, v54

    invoke-virtual {v4, v0}, Landroid/app/Notification$Builder;->setLargeIcon(Landroid/graphics/Bitmap;)Landroid/app/Notification$Builder;

    move-result-object v4

    const v54, 0x7f020296

    .line 494
    move/from16 v0, v54

    invoke-virtual {v4, v0}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v16

    .line 495
    .restart local v16    # "bldr":Landroid/app/Notification$Builder;
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v54, 0x10

    move/from16 v0, v54

    if-lt v4, v0, :cond_2f

    .line 496
    new-instance v4, Landroid/app/Notification$BigTextStyle;

    move-object/from16 v0, v16

    invoke-direct {v4, v0}, Landroid/app/Notification$BigTextStyle;-><init>(Landroid/app/Notification$Builder;)V

    move-object/from16 v0, v51

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    move-object/from16 v54, v0

    .line 497
    move-object/from16 v0, v54

    invoke-virtual {v4, v0}, Landroid/app/Notification$BigTextStyle;->setBigContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$BigTextStyle;

    move-result-object v4

    .line 498
    invoke-virtual {v4, v10}, Landroid/app/Notification$BigTextStyle;->bigText(Ljava/lang/CharSequence;)Landroid/app/Notification$BigTextStyle;

    move-result-object v4

    .line 499
    invoke-virtual {v4}, Landroid/app/Notification$BigTextStyle;->build()Landroid/app/Notification;

    move-result-object v36

    .line 503
    .restart local v36    # "ntf":Landroid/app/Notification;
    :goto_12
    move-object/from16 v0, v36

    iget v4, v0, Landroid/app/Notification;->flags:I

    or-int/lit8 v4, v4, 0x10

    move-object/from16 v0, v36

    iput v4, v0, Landroid/app/Notification;->flags:I

    .line 504
    sget-object v4, Lcom/vkontakte/android/NotificationUtils$Type;->Gifts:Lcom/vkontakte/android/NotificationUtils$Type;

    const/16 v54, 0x1

    move-object/from16 v0, p2

    move-object/from16 v1, v36

    move/from16 v2, v54

    invoke-static {v0, v1, v4, v2}, Lcom/vkontakte/android/NotificationUtils;->applySettings(Landroid/content/Context;Landroid/app/Notification;Lcom/vkontakte/android/NotificationUtils$Type;Z)V

    .line 505
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v54, 0x15

    move/from16 v0, v54

    if-lt v4, v0, :cond_2c

    .line 506
    invoke-virtual/range {p2 .. p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v54, 0x7f0f0018

    move/from16 v0, v54

    invoke-virtual {v4, v0}, Landroid/content/res/Resources;->getColor(I)I

    move-result v4

    move-object/from16 v0, v36

    iput v4, v0, Landroid/app/Notification;->color:I

    .line 507
    const-string/jumbo v4, "social"

    move-object/from16 v0, v36

    iput-object v4, v0, Landroid/app/Notification;->category:Ljava/lang/String;

    .line 509
    :cond_2c
    const/16 v4, 0x1fa

    move-object/from16 v0, p2

    move-object/from16 v1, v36

    invoke-static {v0, v4, v1, v12}, Lcom/vkontakte/android/GCMBroadcastReceiver;->notify(Landroid/content/Context;ILandroid/app/Notification;Z)V

    goto/16 :goto_1

    .line 483
    .end local v10    # "text":Ljava/lang/String;
    .end local v16    # "bldr":Landroid/app/Notification$Builder;
    .end local v36    # "ntf":Landroid/app/Notification;
    :cond_2d
    const v4, 0x7f08041c

    goto/16 :goto_10

    .line 492
    .restart local v10    # "text":Ljava/lang/String;
    .restart local v41    # "photo":Landroid/graphics/Bitmap;
    :cond_2e
    invoke-virtual/range {p2 .. p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v54

    const v55, 0x7f0203d3

    invoke-static/range {v54 .. v55}, Lcom/vkontakte/android/Global;->getResBitmap(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v41

    goto/16 :goto_11

    .line 501
    .end local v41    # "photo":Landroid/graphics/Bitmap;
    .restart local v16    # "bldr":Landroid/app/Notification$Builder;
    :cond_2f
    invoke-virtual/range {v16 .. v16}, Landroid/app/Notification$Builder;->getNotification()Landroid/app/Notification;

    move-result-object v36

    .restart local v36    # "ntf":Landroid/app/Notification;
    goto :goto_12

    .line 513
    .end local v5    # "intent":Landroid/content/Intent;
    .end local v10    # "text":Ljava/lang/String;
    .end local v16    # "bldr":Landroid/app/Notification$Builder;
    .end local v36    # "ntf":Landroid/app/Notification;
    .end local v48    # "uid":I
    .end local v51    # "user":Lcom/vkontakte/android/UserProfile;
    .end local v52    # "users":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    :cond_30
    const-string/jumbo v4, "friend"

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_32

    .line 514
    sget-object v4, Lcom/vkontakte/android/NotificationUtils$Type;->FriendRequests:Lcom/vkontakte/android/NotificationUtils$Type;

    move-object/from16 v0, p2

    invoke-static {v0, v4}, Lcom/vkontakte/android/NotificationUtils;->areNotificationsEnabled(Landroid/content/Context;Lcom/vkontakte/android/NotificationUtils$Type;)Z

    move-result v4

    if-nez v4, :cond_31

    .line 515
    const-string/jumbo v4, "vk"

    const-string/jumbo v54, "friend notifications disabled"

    move-object/from16 v0, v54

    invoke-static {v4, v0}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 518
    :cond_31
    const-string/jumbo v4, "badge"

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v18

    .line 519
    .local v18, "cnt":I
    const-string/jumbo v4, "uid"

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v48

    .line 520
    .restart local v48    # "uid":I
    new-instance v5, Landroid/content/Intent;

    const-string/jumbo v4, "android.intent.action.VIEW"

    const-string/jumbo v54, "vkontakte://vk.com/friends?section=requests"

    invoke-static/range {v54 .. v54}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v54

    move-object/from16 v0, v54

    invoke-direct {v5, v4, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 521
    .restart local v5    # "intent":Landroid/content/Intent;
    new-instance v49, Ljava/util/ArrayList;

    invoke-direct/range {v49 .. v49}, Ljava/util/ArrayList;-><init>()V

    .line 522
    .local v49, "uids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    invoke-static/range {v48 .. v48}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    move-object/from16 v0, v49

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 523
    move-object/from16 v0, p2

    move/from16 v1, v18

    invoke-static {v0, v5, v1, v12}, Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$3;->lambdaFactory$(Landroid/content/Context;Landroid/content/Intent;IZ)Lcom/vkontakte/android/data/Friends$GetUsersCallback;

    move-result-object v4

    move-object/from16 v0, v49

    invoke-static {v0, v4}, Lcom/vkontakte/android/data/Friends;->getUsers(Ljava/util/Collection;Lcom/vkontakte/android/data/Friends$GetUsersCallback;)V

    .line 580
    .end local v5    # "intent":Landroid/content/Intent;
    .end local v18    # "cnt":I
    .end local v48    # "uid":I
    .end local v49    # "uids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    :cond_32
    const-string/jumbo v4, "group_invite"

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_34

    .line 581
    sget-object v4, Lcom/vkontakte/android/NotificationUtils$Type;->GroupInvites:Lcom/vkontakte/android/NotificationUtils$Type;

    move-object/from16 v0, p2

    invoke-static {v0, v4}, Lcom/vkontakte/android/NotificationUtils;->areNotificationsEnabled(Landroid/content/Context;Lcom/vkontakte/android/NotificationUtils$Type;)Z

    move-result v4

    if-nez v4, :cond_33

    .line 582
    const-string/jumbo v4, "vk"

    const-string/jumbo v54, "group notifications disabled"

    move-object/from16 v0, v54

    invoke-static {v4, v0}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 585
    :cond_33
    const-string/jumbo v4, "group_id"

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    neg-int v0, v4

    move/from16 v48, v0

    .line 587
    .restart local v48    # "uid":I
    new-instance v5, Landroid/content/Intent;

    const-string/jumbo v4, "android.intent.action.VIEW"

    new-instance v54, Ljava/lang/StringBuilder;

    invoke-direct/range {v54 .. v54}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v55, "vkontakte://profile/"

    invoke-virtual/range {v54 .. v55}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v54

    move-object/from16 v0, v54

    move/from16 v1, v48

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v54

    invoke-virtual/range {v54 .. v54}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v54

    invoke-static/range {v54 .. v54}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v54

    move-object/from16 v0, v54

    invoke-direct {v5, v4, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 588
    .restart local v5    # "intent":Landroid/content/Intent;
    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Integer;

    const/16 v54, 0x0

    invoke-static/range {v48 .. v48}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v55

    aput-object v55, v4, v54

    const/16 v54, 0x1

    const-string/jumbo v55, "from_id"

    move-object/from16 v0, v23

    move-object/from16 v1, v55

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v55

    invoke-static/range {v55 .. v55}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v55

    invoke-static/range {v55 .. v55}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v55

    aput-object v55, v4, v54

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    move-object/from16 v0, p2

    invoke-static {v0, v5, v12}, Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$4;->lambdaFactory$(Landroid/content/Context;Landroid/content/Intent;Z)Lcom/vkontakte/android/data/Friends$GetUsersCallback;

    move-result-object v54

    move-object/from16 v0, v54

    invoke-static {v4, v0}, Lcom/vkontakte/android/data/Friends;->getUsers(Ljava/util/Collection;Lcom/vkontakte/android/data/Friends$GetUsersCallback;)V

    .line 627
    .end local v5    # "intent":Landroid/content/Intent;
    .end local v48    # "uid":I
    :cond_34
    const-string/jumbo v4, "msg"

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_38

    .line 628
    sget-boolean v4, Lcom/vkontakte/android/LongPollService;->longPollRunning:Z

    if-eqz v4, :cond_35

    .line 629
    const-string/jumbo v4, "vk"

    const-string/jumbo v54, "LongPoll running, push message discarded"

    move-object/from16 v0, v54

    invoke-static {v4, v0}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 632
    :cond_35
    const-string/jumbo v4, "uid"

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v40

    .line 633
    .local v40, "peer":I
    const v4, 0x77359400

    move/from16 v0, v40

    if-le v0, v4, :cond_36

    const-string/jumbo v4, "notificationsChatMessages"

    :goto_13
    const/16 v54, 0x1

    move-object/from16 v0, v43

    move/from16 v1, v54

    invoke-interface {v0, v4, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    if-nez v4, :cond_37

    .line 634
    const-string/jumbo v4, "vk"

    const-string/jumbo v54, "message notifications disabled"

    move-object/from16 v0, v54

    invoke-static {v4, v0}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 633
    :cond_36
    const-string/jumbo v4, "notificationsPrivateMessages"

    goto :goto_13

    .line 637
    :cond_37
    const-string/jumbo v4, "badge"

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v37

    .line 638
    .local v37, "num":I
    const-string/jumbo v4, "msg_id"

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v35

    .line 640
    .local v35, "mid":I
    invoke-static/range {v37 .. v37}, Lcom/vkontakte/android/LongPollService;->setNumNewMessages(I)V

    .line 641
    invoke-static/range {v35 .. v35}, Lcom/vkontakte/android/GCMBroadcastReceiver;->updateStateAndShowNotification(I)V

    .line 645
    .end local v35    # "mid":I
    .end local v37    # "num":I
    .end local v40    # "peer":I
    :cond_38
    const-string/jumbo v4, "friend_found"

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3a

    .line 646
    sget-object v4, Lcom/vkontakte/android/NotificationUtils$Type;->FoundFriends:Lcom/vkontakte/android/NotificationUtils$Type;

    move-object/from16 v0, p2

    invoke-static {v0, v4}, Lcom/vkontakte/android/NotificationUtils;->areNotificationsEnabled(Landroid/content/Context;Lcom/vkontakte/android/NotificationUtils$Type;)Z

    move-result v4

    if-nez v4, :cond_39

    .line 647
    const-string/jumbo v4, "vk"

    const-string/jumbo v54, "friend notifications disabled"

    move-object/from16 v0, v54

    invoke-static {v4, v0}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 650
    :cond_39
    const-string/jumbo v4, "uid"

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v48

    .line 651
    .restart local v48    # "uid":I
    const-string/jumbo v4, "service"

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v44

    .line 652
    .local v44, "service":Ljava/lang/String;
    new-instance v49, Ljava/util/ArrayList;

    invoke-direct/range {v49 .. v49}, Ljava/util/ArrayList;-><init>()V

    .line 653
    .restart local v49    # "uids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    invoke-static/range {v48 .. v48}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    move-object/from16 v0, v49

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 654
    move/from16 v0, v48

    move-object/from16 v1, v44

    move-object/from16 v2, p2

    invoke-static {v0, v1, v2, v12}, Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$5;->lambdaFactory$(ILjava/lang/String;Landroid/content/Context;Z)Lcom/vkontakte/android/data/Friends$GetUsersCallback;

    move-result-object v4

    move-object/from16 v0, v49

    invoke-static {v0, v4}, Lcom/vkontakte/android/data/Friends;->getUsers(Ljava/util/Collection;Lcom/vkontakte/android/data/Friends$GetUsersCallback;)V

    .line 703
    .end local v44    # "service":Ljava/lang/String;
    .end local v48    # "uid":I
    .end local v49    # "uids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    :cond_3a
    const-string/jumbo v4, "friend_accepted"

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3b

    .line 704
    const-string/jumbo v4, "uid"

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v48

    .line 705
    .restart local v48    # "uid":I
    new-instance v49, Ljava/util/ArrayList;

    invoke-direct/range {v49 .. v49}, Ljava/util/ArrayList;-><init>()V

    .line 706
    .restart local v49    # "uids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    invoke-static/range {v48 .. v48}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    move-object/from16 v0, v49

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 707
    move/from16 v0, v48

    move-object/from16 v1, p2

    invoke-static {v0, v1, v12}, Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$6;->lambdaFactory$(ILandroid/content/Context;Z)Lcom/vkontakte/android/data/Friends$GetUsersCallback;

    move-result-object v4

    move-object/from16 v0, v49

    invoke-static {v0, v4}, Lcom/vkontakte/android/data/Friends;->getUsers(Ljava/util/Collection;Lcom/vkontakte/android/data/Friends$GetUsersCallback;)V

    goto/16 :goto_1

    .line 732
    .end local v48    # "uid":I
    .end local v49    # "uids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    :cond_3b
    const-string/jumbo v4, "money_transfer"

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3c

    .line 733
    const-string/jumbo v4, "to_id"

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v48

    .line 734
    .restart local v48    # "uid":I
    new-instance v49, Ljava/util/ArrayList;

    invoke-direct/range {v49 .. v49}, Ljava/util/ArrayList;-><init>()V

    .line 735
    .restart local v49    # "uids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    invoke-static/range {v48 .. v48}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    move-object/from16 v0, v49

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 736
    move-object/from16 v0, p2

    move-object/from16 v1, v23

    invoke-static {v0, v1, v12}, Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$7;->lambdaFactory$(Landroid/content/Context;Landroid/os/Bundle;Z)Lcom/vkontakte/android/data/Friends$GetUsersCallback;

    move-result-object v4

    move-object/from16 v0, v49

    invoke-static {v0, v4}, Lcom/vkontakte/android/data/Friends;->getUsers(Ljava/util/Collection;Lcom/vkontakte/android/data/Friends$GetUsersCallback;)V

    .line 753
    .end local v48    # "uid":I
    .end local v49    # "uids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    :cond_3c
    const-string/jumbo v4, "group_accepted"

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3d

    .line 754
    const-string/jumbo v4, "group_id"

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v25

    .line 755
    .local v25, "gid":I
    new-instance v49, Ljava/util/ArrayList;

    invoke-direct/range {v49 .. v49}, Ljava/util/ArrayList;-><init>()V

    .line 756
    .restart local v49    # "uids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    move/from16 v0, v25

    neg-int v4, v0

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    move-object/from16 v0, v49

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 757
    move/from16 v0, v25

    move-object/from16 v1, p2

    invoke-static {v0, v1, v12}, Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$8;->lambdaFactory$(ILandroid/content/Context;Z)Lcom/vkontakte/android/data/Friends$GetUsersCallback;

    move-result-object v4

    move-object/from16 v0, v49

    invoke-static {v0, v4}, Lcom/vkontakte/android/data/Friends;->getUsers(Ljava/util/Collection;Lcom/vkontakte/android/data/Friends$GetUsersCallback;)V

    goto/16 :goto_1

    .line 791
    .end local v25    # "gid":I
    .end local v49    # "uids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    :cond_3d
    const-string/jumbo v4, "event_soon"

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3f

    .line 792
    sget-object v4, Lcom/vkontakte/android/NotificationUtils$Type;->UpcomingEvents:Lcom/vkontakte/android/NotificationUtils$Type;

    move-object/from16 v0, p2

    invoke-static {v0, v4}, Lcom/vkontakte/android/NotificationUtils;->areNotificationsEnabled(Landroid/content/Context;Lcom/vkontakte/android/NotificationUtils$Type;)Z

    move-result v4

    if-nez v4, :cond_3e

    .line 793
    const-string/jumbo v4, "vk"

    const-string/jumbo v54, "upcoming events notifications disabled"

    move-object/from16 v0, v54

    invoke-static {v4, v0}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 796
    :cond_3e
    const-string/jumbo v4, "group_id"

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v25

    .line 797
    .restart local v25    # "gid":I
    const-string/jumbo v4, "start_date"

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v46

    .line 798
    .local v46, "startTime":I
    new-instance v49, Ljava/util/ArrayList;

    invoke-direct/range {v49 .. v49}, Ljava/util/ArrayList;-><init>()V

    .line 799
    .restart local v49    # "uids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    move/from16 v0, v25

    neg-int v4, v0

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    move-object/from16 v0, v49

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 800
    move/from16 v0, v25

    move-object/from16 v1, p2

    move/from16 v2, v46

    invoke-static {v0, v1, v2, v12}, Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$9;->lambdaFactory$(ILandroid/content/Context;IZ)Lcom/vkontakte/android/data/Friends$GetUsersCallback;

    move-result-object v4

    move-object/from16 v0, v49

    invoke-static {v0, v4}, Lcom/vkontakte/android/data/Friends;->getUsers(Ljava/util/Collection;Lcom/vkontakte/android/data/Friends$GetUsersCallback;)V

    goto/16 :goto_1

    .line 834
    .end local v25    # "gid":I
    .end local v46    # "startTime":I
    .end local v49    # "uids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    :cond_3f
    const-string/jumbo v4, "wall_publish"

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_40

    .line 835
    const-string/jumbo v4, "group_id"

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v25

    .line 836
    .restart local v25    # "gid":I
    new-instance v49, Ljava/util/ArrayList;

    invoke-direct/range {v49 .. v49}, Ljava/util/ArrayList;-><init>()V

    .line 837
    .restart local v49    # "uids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    move/from16 v0, v25

    neg-int v4, v0

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    move-object/from16 v0, v49

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 838
    move-object/from16 v0, v23

    move-object/from16 v1, p2

    invoke-static {v0, v1, v12}, Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$10;->lambdaFactory$(Landroid/os/Bundle;Landroid/content/Context;Z)Lcom/vkontakte/android/data/Friends$GetUsersCallback;

    move-result-object v4

    move-object/from16 v0, v49

    invoke-static {v0, v4}, Lcom/vkontakte/android/data/Friends;->getUsers(Ljava/util/Collection;Lcom/vkontakte/android/data/Friends$GetUsersCallback;)V

    goto/16 :goto_1

    .line 863
    .end local v25    # "gid":I
    .end local v49    # "uids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    :cond_40
    const-string/jumbo v4, "like"

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_42

    .line 878
    sget-object v4, Lcom/vkontakte/android/NotificationUtils$Type;->Likes:Lcom/vkontakte/android/NotificationUtils$Type;

    move-object/from16 v0, p2

    invoke-static {v0, v4}, Lcom/vkontakte/android/NotificationUtils;->areNotificationsEnabled(Landroid/content/Context;Lcom/vkontakte/android/NotificationUtils$Type;)Z

    move-result v4

    if-nez v4, :cond_41

    .line 879
    const-string/jumbo v4, "vk"

    const-string/jumbo v54, "likes notifications disabled"

    move-object/from16 v0, v54

    invoke-static {v4, v0}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 883
    :cond_41
    const-string/jumbo v33, "vkontakte://vk.com/feed?section=notifications"

    .line 884
    .local v33, "link":Ljava/lang/String;
    const-string/jumbo v4, "from_id"

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v48

    .line 885
    .restart local v48    # "uid":I
    const-string/jumbo v4, "object"

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v38

    .line 886
    .local v38, "object":Ljava/lang/String;
    new-instance v5, Landroid/content/Intent;

    const-string/jumbo v4, "android.intent.action.VIEW"

    const-string/jumbo v54, "vkontakte://vk.com/feed?section=notifications"

    invoke-static/range {v54 .. v54}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v54

    move-object/from16 v0, v54

    invoke-direct {v5, v4, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 887
    .restart local v5    # "intent":Landroid/content/Intent;
    const/high16 v4, 0x10000000

    invoke-virtual {v5, v4}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 889
    invoke-static/range {v48 .. v48}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v4}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    move-object/from16 v0, p2

    move-object/from16 v1, v23

    invoke-static {v0, v1, v12}, Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$11;->lambdaFactory$(Landroid/content/Context;Landroid/os/Bundle;Z)Lcom/vkontakte/android/data/Friends$GetUsersCallback;

    move-result-object v54

    const/16 v55, 0x2

    move-object/from16 v0, v54

    move/from16 v1, v55

    invoke-static {v4, v0, v1}, Lcom/vkontakte/android/data/Friends;->getUsers(Ljava/util/Collection;Lcom/vkontakte/android/data/Friends$GetUsersCallback;I)V

    goto/16 :goto_1

    .line 899
    .end local v5    # "intent":Landroid/content/Intent;
    .end local v33    # "link":Ljava/lang/String;
    .end local v38    # "object":Ljava/lang/String;
    .end local v48    # "uid":I
    :cond_42
    const-string/jumbo v4, "repost"

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_44

    .line 913
    sget-object v4, Lcom/vkontakte/android/NotificationUtils$Type;->Reposts:Lcom/vkontakte/android/NotificationUtils$Type;

    move-object/from16 v0, p2

    invoke-static {v0, v4}, Lcom/vkontakte/android/NotificationUtils;->areNotificationsEnabled(Landroid/content/Context;Lcom/vkontakte/android/NotificationUtils$Type;)Z

    move-result v4

    if-nez v4, :cond_43

    .line 914
    const-string/jumbo v4, "vk"

    const-string/jumbo v54, "reposts notifications disabled"

    move-object/from16 v0, v54

    invoke-static {v4, v0}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 918
    :cond_43
    const-string/jumbo v33, "vkontakte://vk.com/feed?section=notifications"

    .line 919
    .restart local v33    # "link":Ljava/lang/String;
    const-string/jumbo v4, "from_id"

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v48

    .line 920
    .restart local v48    # "uid":I
    new-instance v5, Landroid/content/Intent;

    const-string/jumbo v4, "android.intent.action.VIEW"

    const-string/jumbo v54, "vkontakte://vk.com/feed?section=notifications"

    invoke-static/range {v54 .. v54}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v54

    move-object/from16 v0, v54

    invoke-direct {v5, v4, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 921
    .restart local v5    # "intent":Landroid/content/Intent;
    const/high16 v4, 0x10000000

    invoke-virtual {v5, v4}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 923
    invoke-static/range {v48 .. v48}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v4}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    move-object/from16 v0, p2

    move-object/from16 v1, v23

    invoke-static {v0, v1, v12}, Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$12;->lambdaFactory$(Landroid/content/Context;Landroid/os/Bundle;Z)Lcom/vkontakte/android/data/Friends$GetUsersCallback;

    move-result-object v54

    move-object/from16 v0, v54

    invoke-static {v4, v0}, Lcom/vkontakte/android/data/Friends;->getUsers(Ljava/util/Collection;Lcom/vkontakte/android/data/Friends$GetUsersCallback;)V

    goto/16 :goto_1

    .line 934
    .end local v5    # "intent":Landroid/content/Intent;
    .end local v33    # "link":Ljava/lang/String;
    .end local v48    # "uid":I
    :cond_44
    const-string/jumbo v4, "reply"

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_45

    const-string/jumbo v4, "comment"

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_45

    const-string/jumbo v4, "mention"

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_48

    .line 937
    :cond_45
    const/4 v4, -0x1

    invoke-virtual/range {v17 .. v17}, Ljava/lang/String;->hashCode()I

    move-result v54

    sparse-switch v54, :sswitch_data_0

    :cond_46
    :goto_14
    packed-switch v4, :pswitch_data_0

    .line 946
    sget-object v11, Lcom/vkontakte/android/NotificationUtils$Type;->Comments:Lcom/vkontakte/android/NotificationUtils$Type;

    .line 949
    .local v11, "xkey":Lcom/vkontakte/android/NotificationUtils$Type;
    :goto_15
    move-object/from16 v0, p2

    invoke-static {v0, v11}, Lcom/vkontakte/android/NotificationUtils;->areNotificationsEnabled(Landroid/content/Context;Lcom/vkontakte/android/NotificationUtils$Type;)Z

    move-result v4

    if-nez v4, :cond_47

    .line 950
    const-string/jumbo v4, "vk"

    const-string/jumbo v54, "reply/mention notifications disabled"

    move-object/from16 v0, v54

    invoke-static {v4, v0}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 937
    .end local v11    # "xkey":Lcom/vkontakte/android/NotificationUtils$Type;
    :sswitch_0
    const-string/jumbo v54, "reply"

    move-object/from16 v0, v17

    move-object/from16 v1, v54

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v54

    if-eqz v54, :cond_46

    const/4 v4, 0x0

    goto :goto_14

    :sswitch_1
    const-string/jumbo v54, "mention"

    move-object/from16 v0, v17

    move-object/from16 v1, v54

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v54

    if-eqz v54, :cond_46

    const/4 v4, 0x1

    goto :goto_14

    :sswitch_2
    const-string/jumbo v54, "comment"

    move-object/from16 v0, v17

    move-object/from16 v1, v54

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v54

    if-eqz v54, :cond_46

    const/4 v4, 0x2

    goto :goto_14

    .line 939
    :pswitch_0
    sget-object v11, Lcom/vkontakte/android/NotificationUtils$Type;->Replies:Lcom/vkontakte/android/NotificationUtils$Type;

    .line 940
    .restart local v11    # "xkey":Lcom/vkontakte/android/NotificationUtils$Type;
    goto :goto_15

    .line 942
    .end local v11    # "xkey":Lcom/vkontakte/android/NotificationUtils$Type;
    :pswitch_1
    sget-object v11, Lcom/vkontakte/android/NotificationUtils$Type;->Mentions:Lcom/vkontakte/android/NotificationUtils$Type;

    .line 943
    .restart local v11    # "xkey":Lcom/vkontakte/android/NotificationUtils$Type;
    goto :goto_15

    .line 955
    :cond_47
    const-string/jumbo v33, "vkontakte://vk.com/feed?section=notifications"

    .line 956
    .restart local v33    # "link":Ljava/lang/String;
    const-string/jumbo v4, "text"

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/vkontakte/android/Global;->replaceEmojiModifiers(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v54, "<br>"

    const-string/jumbo v55, " / "

    move-object/from16 v0, v54

    move-object/from16 v1, v55

    invoke-virtual {v4, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/vkontakte/android/LinkParser;->stripMentions(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/vkontakte/android/LinkParser;->stripMentions(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 957
    .restart local v10    # "text":Ljava/lang/String;
    const-string/jumbo v4, "from_id"

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v48

    .line 958
    .restart local v48    # "uid":I
    const-string/jumbo v4, "reply"

    const-string/jumbo v54, "type"

    move-object/from16 v0, v23

    move-object/from16 v1, v54

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v54

    move-object/from16 v0, v54

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    .line 959
    .local v7, "isReply":Z
    const-string/jumbo v4, "mention"

    const-string/jumbo v54, "type"

    move-object/from16 v0, v23

    move-object/from16 v1, v54

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v54

    move-object/from16 v0, v54

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    .line 960
    .local v8, "isMention":Z
    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    .line 961
    .local v13, "al":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    invoke-static/range {v48 .. v48}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v13, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 962
    new-instance v5, Landroid/content/Intent;

    const-string/jumbo v4, "android.intent.action.VIEW"

    const-string/jumbo v54, "vkontakte://vk.com/feed?section=notifications"

    invoke-static/range {v54 .. v54}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v54

    move-object/from16 v0, v54

    invoke-direct {v5, v4, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 963
    .restart local v5    # "intent":Landroid/content/Intent;
    const/high16 v4, 0x10000000

    invoke-virtual {v5, v4}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 964
    const-string/jumbo v4, "place"

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 965
    .local v6, "place":Ljava/lang/String;
    const-string/jumbo v4, "reply_id"

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_49

    const-string/jumbo v4, "reply_id"

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v9

    .local v9, "replyID":I
    :goto_16
    move-object/from16 v4, p2

    .line 966
    invoke-static/range {v4 .. v12}, Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$13;->lambdaFactory$(Landroid/content/Context;Landroid/content/Intent;Ljava/lang/String;ZZILjava/lang/String;Lcom/vkontakte/android/NotificationUtils$Type;Z)Lcom/vkontakte/android/data/Friends$GetUsersCallback;

    move-result-object v4

    invoke-static {v13, v4}, Lcom/vkontakte/android/data/Friends;->getUsers(Ljava/util/Collection;Lcom/vkontakte/android/data/Friends$GetUsersCallback;)V

    .line 1028
    .end local v5    # "intent":Landroid/content/Intent;
    .end local v6    # "place":Ljava/lang/String;
    .end local v7    # "isReply":Z
    .end local v8    # "isMention":Z
    .end local v9    # "replyID":I
    .end local v10    # "text":Ljava/lang/String;
    .end local v11    # "xkey":Lcom/vkontakte/android/NotificationUtils$Type;
    .end local v13    # "al":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    .end local v33    # "link":Ljava/lang/String;
    .end local v48    # "uid":I
    :cond_48
    const-string/jumbo v4, "birthday"

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 1029
    new-instance v15, Landroid/content/Intent;

    const-class v4, Lcom/vkontakte/android/BirthdayBroadcastReceiver;

    move-object/from16 v0, p2

    invoke-direct {v15, v0, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1030
    .local v15, "bdIntent":Landroid/content/Intent;
    const-string/jumbo v4, "uids"

    const-string/jumbo v54, "uids"

    move-object/from16 v0, v23

    move-object/from16 v1, v54

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v54

    move-object/from16 v0, v54

    invoke-virtual {v15, v4, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1031
    const-string/jumbo v4, "force"

    const/16 v54, 0x1

    move/from16 v0, v54

    invoke-virtual {v15, v4, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 1032
    move-object/from16 v0, p2

    invoke-virtual {v0, v15}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_1

    .line 965
    .end local v15    # "bdIntent":Landroid/content/Intent;
    .restart local v5    # "intent":Landroid/content/Intent;
    .restart local v6    # "place":Ljava/lang/String;
    .restart local v7    # "isReply":Z
    .restart local v8    # "isMention":Z
    .restart local v10    # "text":Ljava/lang/String;
    .restart local v11    # "xkey":Lcom/vkontakte/android/NotificationUtils$Type;
    .restart local v13    # "al":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    .restart local v33    # "link":Ljava/lang/String;
    .restart local v48    # "uid":I
    :cond_49
    const/4 v9, 0x0

    goto :goto_16

    .line 937
    :sswitch_data_0
    .sparse-switch
        0x67612ea -> :sswitch_0
        0x38a51dea -> :sswitch_1
        0x38a5ee5f -> :sswitch_2
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "_intent"    # Landroid/content/Intent;

    .prologue
    .line 83
    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/GCMBroadcastReceiver;->setResultCode(I)V

    .line 84
    new-instance v0, Ljava/lang/Thread;

    invoke-static {p0, p2, p1}, Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/GCMBroadcastReceiver;Landroid/content/Intent;Landroid/content/Context;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 1037
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 1038
    return-void
.end method
