.class public Lcom/vkontakte/android/LongPollService;
.super Landroid/app/Service;
.source "LongPollService.java"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field public static final ACTION_CHAT_CHANGED:Ljava/lang/String; = "com.vkontakte.android.CHAT_CHANGED"

.field public static final ACTION_COMMUNITY_MESSAGES_BLOCK_CHANGED:Ljava/lang/String; = "com.vkontakte.android.COMMUNITY_MESSAGES_BLOCK_CHANGED"

.field public static final ACTION_COUNTERS_UPDATED:Ljava/lang/String; = "com.vkontakte.android.COUNTERS_UPDATED"

.field public static final ACTION_DIALOG_CHANGED:Ljava/lang/String; = "com.vkontakte.android.DIALOG_CHANGED"

.field public static final ACTION_MESSAGE_DELETED:Ljava/lang/String; = "com.vkontakte.android.MESSAGE_DELETED"

.field public static final ACTION_MESSAGE_RSTATE_CHANGED:Ljava/lang/String; = "com.vkontakte.android.MESSAGE_RSTATE_CHANGED"

.field public static final ACTION_MUTE_CHANGED:Ljava/lang/String; = "com.vkontakte.android.MUTE_CHANGED"

.field public static final ACTION_NEW_MESSAGE:Ljava/lang/String; = "com.vkontakte.android.NEW_MESSAGE"

.field public static final ACTION_REFRESH_DIALOGS_LIST:Ljava/lang/String; = "com.vkontakte.android.REFRESH_DIALOGS"

.field public static final ACTION_STATE_CHANGED:Ljava/lang/String; = "com.vkontakte.android.STATE_CHANGED"

.field public static final ACTION_TYPING:Ljava/lang/String; = "com.vkontakte.android.TYPING"

.field public static final ACTION_UPDATE_MESSAGE:Ljava/lang/String; = "com.vkontakte.android.UPDATE_MESSAGE"

.field public static final ACTION_USER_PRESENCE:Ljava/lang/String; = "com.vkontakte.android.USER_PRESENCE"

.field public static final ACTION_VOIP_HANGUP:Ljava/lang/String; = "com.vkontakte.android.VOIP_HANGUP"

.field public static final DEBUG:Z

.field private static final EVENT_CHAT_CHANGED:I = 0x33

.field private static final EVENT_CHAT_TYPING:I = 0x3e

.field private static final EVENT_FRIEND_OFFLINE:I = 0x9

.field private static final EVENT_FRIEND_ONLINE:I = 0x8

.field private static final EVENT_MSG_ADD:I = 0x4

.field private static final EVENT_MSG_ADD_EXTENDED:I = 0x65

.field private static final EVENT_MSG_DELETE:I = 0x0

.field private static final EVENT_MSG_FLAG_ADD:I = 0x2

.field private static final EVENT_MSG_FLAG_CLEAR:I = 0x3

.field private static final EVENT_MSG_FLAG_REPLACE:I = 0x1

.field private static final EVENT_MSG_IN_READ_UPTO:I = 0x6

.field private static final EVENT_MSG_OUT_READ_UPTO:I = 0x7

.field private static final EVENT_MSG_UPDATE:I = 0x5

.field private static final EVENT_NOTIFY_SETTINGS:I = 0x72

.field private static final EVENT_UPDATE_COUNTER:I = 0x50

.field private static final EVENT_USER_TYPING:I = 0x3d

.field private static final EVENT_VOIP_HANGUP:I = 0x70

.field private static final EVENT_VOIP_INCOMING:I = 0x6e

.field private static final EVENT_VOIP_REPLIED:I = 0x6f

.field public static final EXTRA_MESSAGE:Ljava/lang/String; = "message"

.field public static final EXTRA_MSG_ID:Ljava/lang/String; = "msg_id"

.field public static final EXTRA_PEER_ID:Ljava/lang/String; = "peer_id"

.field public static final EXTRA_READ_STATE:Ljava/lang/String; = "read_state"

.field public static final INTRO_IMPORT_FRIENDS:I = 0x1

.field public static final INTRO_SUGGEST_GROUPS:I = 0x2

.field public static final MOBILE_ONLINE_TYPES:[I

.field public static final MSG_CHAT:I = 0x10

.field public static final MSG_DELETED:I = 0x80

.field public static final MSG_FIXED:I = 0x100

.field public static final MSG_FRIENDS:I = 0x20

.field public static final MSG_IMPORTANT:I = 0x8

.field public static final MSG_MEDIA:I = 0x200

.field public static final MSG_OUTBOX:I = 0x2

.field public static final MSG_REPLIED:I = 0x4

.field public static final MSG_SPAM:I = 0x40

.field public static final MSG_UNREAD:I = 0x1

.field public static final NOTIFY_ID_MESSAGE:I = 0xa

.field public static final ONLINE_TYPE_ANDROID:I = 0x4

.field public static final ONLINE_TYPE_DEFAULT:I = 0x7

.field public static final ONLINE_TYPE_IPAD:I = 0x3

.field public static final ONLINE_TYPE_IPHONE:I = 0x2

.field public static final ONLINE_TYPE_MOBILE:I = 0x1

.field public static final ONLINE_TYPE_WINDOWS8:I = 0x6

.field public static final ONLINE_TYPE_WINPHONE:I = 0x5

.field public static final PERMISSION:Ljava/lang/String; = "com.vkontakte.android.permission.ACCESS_DATA"

.field public static final STATE_CONNECTED:I = 0x3

.field public static final STATE_CONNECTING:I = 0x2

.field public static final STATE_UPDATING:I = 0x1

.field public static final STATE_WAITING:I = 0x0

.field private static final VERSION:Ljava/lang/String; = "1"

.field public static addMessage:Ljava/util/concurrent/Semaphore;

.field public static addOwnMessage:Ljava/util/concurrent/Semaphore;

.field private static broadcastStateTimer:Ljava/util/Timer;

.field public static connected:Z

.field public static lastMessageProfile:Lcom/vkontakte/android/UserProfile;

.field public static longPollActive:Z

.field public static longPollRunning:Z

.field public static needReloadDialogs:Z

.field static notification1:Landroid/app/Notification;

.field private static notificationSoundID:I

.field private static notificationSoundPool:Landroid/media/SoundPool;

.field static numAppRequests:I

.field static numFriendRequests:I

.field static numFriendSuggestions:I

.field static numGroupInvitations:I

.field static numNewMessages:I

.field static numNotifications:I

.field static numPhotosMarks:I

.field static numVideosMarks:I

.field public static pendingReceivedMessages:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/Message;",
            ">;"
        }
    .end annotation
.end field

.field public static prevNumNewMessages:I

.field public static realLastProfile:Lcom/vkontakte/android/UserProfile;

.field public static sendingMessages:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/Message;",
            ">;"
        }
    .end annotation
.end field

.field public static updating:Z


# instance fields
.field private initClient:Z

.field private key:Ljava/lang/String;

.field lpThread:Ljava/lang/Thread;

.field private needResendOnline:Z

.field private needStop:Z

.field private newSystem:Z

.field onlineTimer:Ljava/util/Timer;

.field private server:Ljava/lang/String;

.field private started:Z

.field stopDelayTimer:Ljava/util/Timer;

.field private ts:I

.field private typingCancelThread:Lcom/vkontakte/android/background/WorkerThread;

.field private typingLock:Ljava/util/concurrent/Semaphore;

.field private typings:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Long;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 87
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string/jumbo v1, "__dbg_longpoll"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lcom/vkontakte/android/LongPollService;->DEBUG:Z

    .line 127
    const/4 v0, 0x5

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/vkontakte/android/LongPollService;->MOBILE_ONLINE_TYPES:[I

    .line 159
    sput-boolean v2, Lcom/vkontakte/android/LongPollService;->longPollRunning:Z

    .line 160
    sput-boolean v2, Lcom/vkontakte/android/LongPollService;->needReloadDialogs:Z

    .line 161
    sput-boolean v2, Lcom/vkontakte/android/LongPollService;->longPollActive:Z

    .line 162
    sput-boolean v2, Lcom/vkontakte/android/LongPollService;->updating:Z

    .line 163
    sput-boolean v2, Lcom/vkontakte/android/LongPollService;->connected:Z

    .line 166
    sput v2, Lcom/vkontakte/android/LongPollService;->numNewMessages:I

    .line 167
    sput v2, Lcom/vkontakte/android/LongPollService;->prevNumNewMessages:I

    .line 168
    sput v2, Lcom/vkontakte/android/LongPollService;->numFriendSuggestions:I

    .line 169
    sput v2, Lcom/vkontakte/android/LongPollService;->numFriendRequests:I

    .line 170
    sput v2, Lcom/vkontakte/android/LongPollService;->numPhotosMarks:I

    .line 171
    sput v2, Lcom/vkontakte/android/LongPollService;->numVideosMarks:I

    .line 172
    sput v2, Lcom/vkontakte/android/LongPollService;->numAppRequests:I

    .line 173
    sput v2, Lcom/vkontakte/android/LongPollService;->numNotifications:I

    .line 174
    sput v2, Lcom/vkontakte/android/LongPollService;->numGroupInvitations:I

    .line 175
    sput-object v4, Lcom/vkontakte/android/LongPollService;->notification1:Landroid/app/Notification;

    .line 181
    new-instance v0, Ljava/util/concurrent/Semaphore;

    invoke-direct {v0, v3, v3}, Ljava/util/concurrent/Semaphore;-><init>(IZ)V

    sput-object v0, Lcom/vkontakte/android/LongPollService;->addOwnMessage:Ljava/util/concurrent/Semaphore;

    new-instance v0, Ljava/util/concurrent/Semaphore;

    invoke-direct {v0, v3, v3}, Ljava/util/concurrent/Semaphore;-><init>(IZ)V

    sput-object v0, Lcom/vkontakte/android/LongPollService;->addMessage:Ljava/util/concurrent/Semaphore;

    .line 184
    sput-object v4, Lcom/vkontakte/android/LongPollService;->lastMessageProfile:Lcom/vkontakte/android/UserProfile;

    sput-object v4, Lcom/vkontakte/android/LongPollService;->realLastProfile:Lcom/vkontakte/android/UserProfile;

    .line 186
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/vkontakte/android/LongPollService;->sendingMessages:Ljava/util/ArrayList;

    .line 187
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/vkontakte/android/LongPollService;->pendingReceivedMessages:Ljava/util/ArrayList;

    return-void

    .line 127
    nop

    :array_0
    .array-data 4
        0x1
        0x2
        0x3
        0x4
        0x5
    .end array-data
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    const/4 v0, 0x0

    .line 76
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 82
    iput-boolean v0, p0, Lcom/vkontakte/android/LongPollService;->started:Z

    .line 83
    iput-boolean v0, p0, Lcom/vkontakte/android/LongPollService;->needResendOnline:Z

    .line 84
    iput-boolean v0, p0, Lcom/vkontakte/android/LongPollService;->newSystem:Z

    .line 85
    iput-boolean v0, p0, Lcom/vkontakte/android/LongPollService;->initClient:Z

    .line 178
    iput-boolean v0, p0, Lcom/vkontakte/android/LongPollService;->needStop:Z

    .line 179
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/LongPollService;->typings:Ljava/util/HashMap;

    .line 180
    new-instance v0, Lcom/vkontakte/android/background/WorkerThread;

    const-string/jumbo v1, "Typing"

    invoke-direct {v0, v1}, Lcom/vkontakte/android/background/WorkerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/vkontakte/android/LongPollService;->typingCancelThread:Lcom/vkontakte/android/background/WorkerThread;

    .line 182
    new-instance v0, Ljava/util/concurrent/Semaphore;

    invoke-direct {v0, v2, v2}, Ljava/util/concurrent/Semaphore;-><init>(IZ)V

    iput-object v0, p0, Lcom/vkontakte/android/LongPollService;->typingLock:Ljava/util/concurrent/Semaphore;

    return-void
.end method

.method static synthetic access$002(Lcom/vkontakte/android/LongPollService;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/LongPollService;
    .param p1, "x1"    # I

    .prologue
    .line 76
    iput p1, p0, Lcom/vkontakte/android/LongPollService;->ts:I

    return p1
.end method

.method static synthetic access$102(Lcom/vkontakte/android/LongPollService;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/LongPollService;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 76
    iput-object p1, p0, Lcom/vkontakte/android/LongPollService;->key:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$202(Lcom/vkontakte/android/LongPollService;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/LongPollService;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 76
    iput-object p1, p0, Lcom/vkontakte/android/LongPollService;->server:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$302(Ljava/util/Timer;)Ljava/util/Timer;
    .locals 0
    .param p0, "x0"    # Ljava/util/Timer;

    .prologue
    .line 76
    sput-object p0, Lcom/vkontakte/android/LongPollService;->broadcastStateTimer:Ljava/util/Timer;

    return-object p0
.end method

.method static synthetic access$400(Lcom/vkontakte/android/LongPollService;)Ljava/util/concurrent/Semaphore;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/LongPollService;

    .prologue
    .line 76
    iget-object v0, p0, Lcom/vkontakte/android/LongPollService;->typingLock:Ljava/util/concurrent/Semaphore;

    return-object v0
.end method

.method static synthetic access$500(Lcom/vkontakte/android/LongPollService;)Ljava/util/HashMap;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/LongPollService;

    .prologue
    .line 76
    iget-object v0, p0, Lcom/vkontakte/android/LongPollService;->typings:Ljava/util/HashMap;

    return-object v0
.end method

.method static synthetic access$600()Landroid/media/SoundPool;
    .locals 1

    .prologue
    .line 76
    sget-object v0, Lcom/vkontakte/android/LongPollService;->notificationSoundPool:Landroid/media/SoundPool;

    return-object v0
.end method

.method static synthetic access$700(Lcom/vkontakte/android/LongPollService;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/LongPollService;

    .prologue
    .line 76
    invoke-direct {p0}, Lcom/vkontakte/android/LongPollService;->sendOnline()V

    return-void
.end method

.method static synthetic access$802(Lcom/vkontakte/android/LongPollService;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/LongPollService;
    .param p1, "x1"    # Z

    .prologue
    .line 76
    iput-boolean p1, p0, Lcom/vkontakte/android/LongPollService;->needResendOnline:Z

    return p1
.end method

.method public static declared-synchronized broadcastStateChanged()V
    .locals 6

    .prologue
    .line 674
    const-class v2, Lcom/vkontakte/android/LongPollService;

    monitor-enter v2

    :try_start_0
    sget-object v1, Lcom/vkontakte/android/LongPollService;->broadcastStateTimer:Ljava/util/Timer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_0

    .line 676
    :try_start_1
    sget-object v1, Lcom/vkontakte/android/LongPollService;->broadcastStateTimer:Ljava/util/Timer;

    invoke-virtual {v1}, Ljava/util/Timer;->cancel()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 680
    .local v0, "x":Ljava/lang/Exception;
    :goto_0
    const/4 v1, 0x0

    :try_start_2
    sput-object v1, Lcom/vkontakte/android/LongPollService;->broadcastStateTimer:Ljava/util/Timer;

    .line 682
    :cond_0
    new-instance v1, Ljava/util/Timer;

    invoke-direct {v1}, Ljava/util/Timer;-><init>()V

    sput-object v1, Lcom/vkontakte/android/LongPollService;->broadcastStateTimer:Ljava/util/Timer;

    .line 683
    sget-object v1, Lcom/vkontakte/android/LongPollService;->broadcastStateTimer:Ljava/util/Timer;

    new-instance v3, Lcom/vkontakte/android/LongPollService$5;

    invoke-direct {v3}, Lcom/vkontakte/android/LongPollService$5;-><init>()V

    const-wide/16 v4, 0xc8

    invoke-virtual {v1, v3, v4, v5}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 689
    monitor-exit v2

    return-void

    .line 677
    .end local v0    # "x":Ljava/lang/Exception;
    :catch_0
    move-exception v0

    .line 678
    .restart local v0    # "x":Ljava/lang/Exception;
    const/4 v1, 0x0

    :try_start_3
    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 674
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method static clampCounter(I)I
    .locals 1
    .param p0, "value"    # I

    .prologue
    .line 275
    const/4 v0, 0x0

    invoke-static {v0, p0}, Ljava/lang/Math;->max(II)I

    move-result v0

    return v0
.end method

.method public static createActionMessageRSteteChangedIntent(IIZ)Landroid/content/Intent;
    .locals 3
    .param p0, "peerID"    # I
    .param p1, "msgID"    # I
    .param p2, "in"    # Z

    .prologue
    const/4 v2, 0x1

    .line 1424
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "com.vkontakte.android.MESSAGE_RSTATE_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string/jumbo v1, "msg_id"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "read_state"

    .line 1425
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "peer_id"

    invoke-virtual {v0, v1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "in"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "le"

    .line 1426
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method private static createNotification(Ljava/lang/CharSequence;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Ljava/lang/String;I)Landroid/app/Notification;
    .locals 16
    .param p0, "text"    # Ljava/lang/CharSequence;
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "expandedTitle"    # Ljava/lang/String;
    .param p3, "summary"    # Ljava/lang/String;
    .param p4, "photoUrl"    # Ljava/lang/String;
    .param p5, "contentIntent"    # Landroid/app/PendingIntent;
    .param p6, "tickerText"    # Ljava/lang/String;
    .param p7, "peerID"    # I

    .prologue
    .line 1738
    sget-object v3, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    .line 1739
    .local v3, "context":Landroid/content/Context;
    invoke-virtual/range {p6 .. p6}, Ljava/lang/String;->length()I

    move-result v12

    const/16 v13, 0x32

    if-le v12, v13, :cond_3

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v13, 0x0

    const/16 v14, 0x32

    move-object/from16 v0, p6

    invoke-virtual {v0, v13, v14}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string/jumbo v13, "..."

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 1741
    .local v9, "ticker":Ljava/lang/String;
    :goto_0
    if-eqz p4, :cond_4

    .line 1742
    invoke-static/range {p4 .. p4}, Lcom/vk/imageloader/VKImageLoader;->getCircleBitmap(Ljava/lang/String;)Lio/reactivex/Observable;

    move-result-object v12

    invoke-static {v12}, Lcom/vk/core/util/RxUtil;->blockingGetWithNull(Lio/reactivex/Observable;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/graphics/Bitmap;

    .line 1747
    .local v6, "photo":Landroid/graphics/Bitmap;
    :goto_1
    new-instance v12, Landroid/support/v4/app/RemoteInput$Builder;

    const-string/jumbo v13, "voice_reply"

    invoke-direct {v12, v13}, Landroid/support/v4/app/RemoteInput$Builder;-><init>(Ljava/lang/String;)V

    const v13, 0x7f0805bc

    .line 1748
    invoke-virtual {v3, v13}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Landroid/support/v4/app/RemoteInput$Builder;->setLabel(Ljava/lang/CharSequence;)Landroid/support/v4/app/RemoteInput$Builder;

    move-result-object v12

    .line 1749
    invoke-virtual {v12}, Landroid/support/v4/app/RemoteInput$Builder;->build()Landroid/support/v4/app/RemoteInput;

    move-result-object v7

    .line 1751
    .local v7, "remoteInput":Landroid/support/v4/app/RemoteInput;
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    new-instance v13, Ljava/util/Random;

    invoke-direct {v13}, Ljava/util/Random;-><init>()V

    invoke-virtual {v13}, Ljava/util/Random;->nextInt()I

    move-result v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string/jumbo v13, ""

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Lcom/vkontakte/android/api/VKAPIRequest;->md5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 1752
    .local v8, "replyHash":Ljava/lang/String;
    const/4 v12, 0x0

    const/4 v13, 0x0

    invoke-virtual {v3, v12, v13}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v12

    invoke-interface {v12}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v12

    const-string/jumbo v13, "msg_reply_hash"

    invoke-interface {v12, v13, v8}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v12

    invoke-interface {v12}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 1754
    new-instance v11, Landroid/content/Intent;

    const-class v12, Lcom/vkontakte/android/LinkRedirActivity;

    invoke-direct {v11, v3, v12}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1755
    .local v11, "voiceReplyIntent":Landroid/content/Intent;
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v13, "vkontakte://reply/?peer="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    move/from16 v0, p7

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string/jumbo v13, "&hash="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v12

    invoke-virtual {v11, v12}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 1756
    const/high16 v12, 0x10000000

    invoke-virtual {v11, v12}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 1758
    const/4 v12, 0x0

    const/high16 v13, 0x8000000

    invoke-static {v3, v12, v11, v13}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v10

    .line 1760
    .local v10, "voiceReply":Landroid/app/PendingIntent;
    new-instance v12, Landroid/support/v4/app/NotificationCompat$Action$Builder;

    const v13, 0x7f0202db

    .line 1762
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v14

    const v15, 0x7f0805bc

    invoke-virtual {v14, v15}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v14

    invoke-direct {v12, v13, v14, v10}, Landroid/support/v4/app/NotificationCompat$Action$Builder;-><init>(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 1763
    invoke-virtual {v12, v7}, Landroid/support/v4/app/NotificationCompat$Action$Builder;->addRemoteInput(Landroid/support/v4/app/RemoteInput;)Landroid/support/v4/app/NotificationCompat$Action$Builder;

    move-result-object v12

    .line 1764
    invoke-virtual {v12}, Landroid/support/v4/app/NotificationCompat$Action$Builder;->build()Landroid/support/v4/app/NotificationCompat$Action;

    move-result-object v1

    .line 1765
    .local v1, "action":Landroid/support/v4/app/NotificationCompat$Action;
    new-instance v12, Landroid/support/v4/app/NotificationCompat$WearableExtender;

    invoke-direct {v12}, Landroid/support/v4/app/NotificationCompat$WearableExtender;-><init>()V

    invoke-virtual {v12, v1}, Landroid/support/v4/app/NotificationCompat$WearableExtender;->addAction(Landroid/support/v4/app/NotificationCompat$Action;)Landroid/support/v4/app/NotificationCompat$WearableExtender;

    move-result-object v4

    .line 1767
    .local v4, "extender":Landroid/support/v4/app/NotificationCompat$WearableExtender;
    const v12, 0x77359400

    move/from16 v0, p7

    if-le v0, v12, :cond_0

    .line 1768
    new-instance v12, Landroid/app/Notification$Builder;

    invoke-direct {v12, v3}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, p3

    invoke-virtual {v12, v0}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v12

    invoke-virtual {v12}, Landroid/app/Notification$Builder;->getNotification()Landroid/app/Notification;

    move-result-object v12

    invoke-virtual {v4, v12}, Landroid/support/v4/app/NotificationCompat$WearableExtender;->addPage(Landroid/app/Notification;)Landroid/support/v4/app/NotificationCompat$WearableExtender;

    .line 1771
    :cond_0
    new-instance v12, Landroid/support/v4/app/NotificationCompat$Builder;

    invoke-direct {v12, v3}, Landroid/support/v4/app/NotificationCompat$Builder;-><init>(Landroid/content/Context;)V

    const v13, 0x7f020295

    .line 1772
    invoke-virtual {v12, v13}, Landroid/support/v4/app/NotificationCompat$Builder;->setSmallIcon(I)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v12

    .line 1773
    move-object/from16 v0, p1

    invoke-virtual {v12, v0}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v12

    .line 1774
    move-object/from16 v0, p0

    invoke-virtual {v12, v0}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v12

    .line 1775
    invoke-static {}, Lcom/vkontakte/android/LongPollService;->getNumNewMessages()I

    move-result v13

    invoke-virtual {v12, v13}, Landroid/support/v4/app/NotificationCompat$Builder;->setNumber(I)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v12

    const/high16 v13, 0x42800000    # 64.0f

    .line 1776
    invoke-static {v13}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v13

    const/high16 v14, 0x42800000    # 64.0f

    invoke-static {v14}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v14

    const/4 v15, 0x1

    invoke-static {v6, v13, v14, v15}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v13

    invoke-virtual {v12, v13}, Landroid/support/v4/app/NotificationCompat$Builder;->setLargeIcon(Landroid/graphics/Bitmap;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v12

    .line 1777
    move-object/from16 v0, p5

    invoke-virtual {v12, v0}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v12

    .line 1778
    invoke-virtual {v12, v9}, Landroid/support/v4/app/NotificationCompat$Builder;->setTicker(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v12

    .line 1779
    invoke-virtual {v12, v4}, Landroid/support/v4/app/NotificationCompat$Builder;->extend(Landroid/support/v4/app/NotificationCompat$Extender;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v2

    .line 1780
    .local v2, "builder":Landroid/support/v4/app/NotificationCompat$Builder;
    const-string/jumbo v12, "msg"

    invoke-virtual {v2, v12}, Landroid/support/v4/app/NotificationCompat$Builder;->setCategory(Ljava/lang/String;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 1782
    sget v12, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v13, 0x10

    if-lt v12, v13, :cond_1

    .line 1791
    new-instance v12, Landroid/support/v4/app/NotificationCompat$BigTextStyle;

    invoke-direct {v12, v2}, Landroid/support/v4/app/NotificationCompat$BigTextStyle;-><init>(Landroid/support/v4/app/NotificationCompat$Builder;)V

    .line 1792
    move-object/from16 v0, p0

    invoke-virtual {v12, v0}, Landroid/support/v4/app/NotificationCompat$BigTextStyle;->bigText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$BigTextStyle;

    move-result-object v12

    .line 1793
    move-object/from16 v0, p2

    invoke-virtual {v12, v0}, Landroid/support/v4/app/NotificationCompat$BigTextStyle;->setBigContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$BigTextStyle;

    move-result-object v12

    .line 1794
    move-object/from16 v0, p3

    invoke-virtual {v12, v0}, Landroid/support/v4/app/NotificationCompat$BigTextStyle;->setSummaryText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$BigTextStyle;

    move-result-object v12

    .line 1795
    invoke-virtual {v12}, Landroid/support/v4/app/NotificationCompat$BigTextStyle;->build()Landroid/app/Notification;

    .line 1798
    :cond_1
    invoke-virtual {v2}, Landroid/support/v4/app/NotificationCompat$Builder;->getNotification()Landroid/app/Notification;

    move-result-object v5

    .line 1799
    .local v5, "n":Landroid/app/Notification;
    sget v12, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v13, 0x15

    if-lt v12, v13, :cond_2

    .line 1800
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    const v13, 0x7f0f0018

    invoke-virtual {v12, v13}, Landroid/content/res/Resources;->getColor(I)I

    move-result v12

    iput v12, v5, Landroid/app/Notification;->color:I

    .line 1802
    :cond_2
    return-object v5

    .end local v1    # "action":Landroid/support/v4/app/NotificationCompat$Action;
    .end local v2    # "builder":Landroid/support/v4/app/NotificationCompat$Builder;
    .end local v4    # "extender":Landroid/support/v4/app/NotificationCompat$WearableExtender;
    .end local v5    # "n":Landroid/app/Notification;
    .end local v6    # "photo":Landroid/graphics/Bitmap;
    .end local v7    # "remoteInput":Landroid/support/v4/app/RemoteInput;
    .end local v8    # "replyHash":Ljava/lang/String;
    .end local v9    # "ticker":Ljava/lang/String;
    .end local v10    # "voiceReply":Landroid/app/PendingIntent;
    .end local v11    # "voiceReplyIntent":Landroid/content/Intent;
    :cond_3
    move-object/from16 v9, p6

    .line 1739
    goto/16 :goto_0

    .line 1744
    .restart local v9    # "ticker":Ljava/lang/String;
    :cond_4
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    const v13, 0x7f0203d3

    invoke-static {v12, v13}, Lcom/vkontakte/android/Global;->getResBitmap(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v6

    .restart local v6    # "photo":Landroid/graphics/Bitmap;
    goto/16 :goto_1
.end method

.method public static doBroadcastStateChanged()V
    .locals 5

    .prologue
    .line 692
    invoke-static {}, Lcom/vkontakte/android/LongPollService;->getState()I

    move-result v1

    .line 693
    .local v1, "state":I
    sget-boolean v2, Lcom/vkontakte/android/LongPollService;->DEBUG:Z

    if-eqz v2, :cond_0

    .line 694
    const-string/jumbo v2, "vk_longpoll"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "STATE "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 696
    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v2, "com.vkontakte.android.STATE_CHANGED"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 697
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v2, "state"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 698
    sget-object v2, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const-string/jumbo v3, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v2, v0, v3}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 699
    return-void
.end method

.method public static getNumAppRequests()I
    .locals 1

    .prologue
    .line 238
    sget v0, Lcom/vkontakte/android/LongPollService;->numAppRequests:I

    return v0
.end method

.method public static getNumFriendRequests()I
    .locals 1

    .prologue
    .line 259
    sget v0, Lcom/vkontakte/android/LongPollService;->numFriendRequests:I

    return v0
.end method

.method public static getNumFriendSuggestions()I
    .locals 1

    .prologue
    .line 267
    sget v0, Lcom/vkontakte/android/LongPollService;->numFriendSuggestions:I

    return v0
.end method

.method public static getNumGroupInvitations()I
    .locals 1

    .prologue
    .line 242
    sget v0, Lcom/vkontakte/android/LongPollService;->numGroupInvitations:I

    return v0
.end method

.method public static getNumNewMessages()I
    .locals 1

    .prologue
    .line 226
    sget v0, Lcom/vkontakte/android/LongPollService;->numNewMessages:I

    return v0
.end method

.method public static getNumNotifications()I
    .locals 1

    .prologue
    .line 250
    sget v0, Lcom/vkontakte/android/LongPollService;->numNotifications:I

    return v0
.end method

.method public static getNumPhotosMarks()I
    .locals 1

    .prologue
    .line 230
    sget v0, Lcom/vkontakte/android/LongPollService;->numPhotosMarks:I

    return v0
.end method

.method public static getNumVideosMarks()I
    .locals 1

    .prologue
    .line 234
    sget v0, Lcom/vkontakte/android/LongPollService;->numVideosMarks:I

    return v0
.end method

.method public static getState()I
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 195
    sget-object v1, Lcom/vkontakte/android/Global;->longPoll:Lcom/vkontakte/android/LongPollService;

    if-nez v1, :cond_1

    .line 205
    :cond_0
    :goto_0
    return v0

    .line 198
    :cond_1
    sget-boolean v1, Lcom/vkontakte/android/LongPollService;->connected:Z

    if-eqz v1, :cond_2

    .line 199
    const/4 v0, 0x3

    goto :goto_0

    .line 201
    :cond_2
    sget-boolean v1, Lcom/vkontakte/android/LongPollService;->updating:Z

    if-eqz v1, :cond_3

    .line 202
    const/4 v0, 0x1

    goto :goto_0

    .line 205
    :cond_3
    invoke-static {}, Lcom/vkontakte/android/NetworkStateReceiver;->isConnected()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x2

    goto :goto_0
.end method

.method private static getTrackEventsString()Ljava/lang/String;
    .locals 14

    .prologue
    const/4 v9, 0x1

    const/4 v13, 0x0

    .line 1919
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 1920
    .local v2, "events":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/json/JSONObject;>;"
    invoke-static {v2}, Lcom/vkontakte/android/data/Analytics;->getEvents(Ljava/util/ArrayList;)V

    .line 1921
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1923
    .local v0, "adEvents":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/json/JSONObject;>;"
    :try_start_0
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 1924
    .local v3, "itr":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/json/JSONObject;>;"
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 1925
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/json/JSONObject;

    .line 1926
    .local v4, "o":Lorg/json/JSONObject;
    const-string/jumbo v7, "e"

    invoke-virtual {v4, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string/jumbo v8, "ads/"

    invoke-virtual {v7, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 1927
    const-string/jumbo v7, "e"

    invoke-virtual {v4, v7}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    const-string/jumbo v8, "/"

    invoke-virtual {v7, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x1

    aget-object v1, v7, v8

    .line 1928
    .local v1, "e":Ljava/lang/String;
    const-string/jumbo v7, "event_type"

    invoke-virtual {v4, v7, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1929
    invoke-interface {v3}, Ljava/util/Iterator;->remove()V

    .line 1930
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1933
    .end local v1    # "e":Ljava/lang/String;
    .end local v3    # "itr":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/json/JSONObject;>;"
    .end local v4    # "o":Lorg/json/JSONObject;
    :catch_0
    move-exception v6

    .line 1934
    .local v6, "x":Ljava/lang/Exception;
    new-array v7, v13, [Ljava/lang/Object;

    invoke-static {v6, v7}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    .line 1936
    .end local v6    # "x":Ljava/lang/Exception;
    :cond_1
    const-string/jumbo v5, ""

    .line 1937
    .local v5, "res":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-lez v7, :cond_2

    .line 1938
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, "API.stats.trackEvents({events:\"[%s]\"});"

    new-array v9, v9, [Ljava/lang/Object;

    const-string/jumbo v10, ","

    invoke-static {v10, v2}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v10

    const-string/jumbo v11, "\""

    const-string/jumbo v12, "\\\""

    invoke-virtual {v10, v11, v12}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v9, v13

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 1940
    :cond_2
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-lez v7, :cond_3

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "API.adsint.registerAdEvents({events: \"["

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v9, ","

    invoke-static {v9, v0}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v9

    const-string/jumbo v10, "\""

    const-string/jumbo v11, "\\\""

    invoke-virtual {v9, v10, v11}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v9, "]\"});"

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    :goto_1
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 1941
    return-object v5

    .line 1940
    :cond_3
    const-string/jumbo v7, ""

    goto :goto_1
.end method

.method private getURL(Ljava/lang/String;)[B
    .locals 5
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 954
    invoke-direct {p0}, Lcom/vkontakte/android/LongPollService;->initClient()V

    .line 955
    new-instance v2, Lokhttp3/Request$Builder;

    invoke-direct {v2}, Lokhttp3/Request$Builder;-><init>()V

    .line 956
    invoke-virtual {v2, p1}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v2

    const-string/jumbo v3, "User-Agent"

    sget-object v4, Lcom/vkontakte/android/api/APIController;->USER_AGENT:Ljava/lang/String;

    .line 957
    invoke-virtual {v2, v3, v4}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v2

    .line 958
    invoke-virtual {v2}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v0

    .line 960
    .local v0, "req":Lokhttp3/Request;
    :try_start_0
    invoke-static {}, Lcom/vk/core/network/Network;->getInstance()Lcom/vk/core/network/Network;

    move-result-object v2

    sget-object v3, Lcom/vk/core/network/Network$ClientType;->CLIENT_LONGPOLL:Lcom/vk/core/network/Network$ClientType;

    invoke-virtual {v2, v3}, Lcom/vk/core/network/Network;->getClient(Lcom/vk/core/network/Network$ClientType;)Lokhttp3/OkHttpClient;

    move-result-object v2

    invoke-virtual {v2, v0}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v2

    invoke-interface {v2}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object v2

    invoke-virtual {v2}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v2

    invoke-virtual {v2}, Lokhttp3/ResponseBody;->bytes()[B
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 964
    :goto_0
    return-object v2

    .line 961
    :catch_0
    move-exception v1

    .line 962
    .local v1, "x":Ljava/lang/Throwable;
    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v1, v2}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    .line 964
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private initClient()V
    .locals 4

    .prologue
    .line 2045
    iget-boolean v1, p0, Lcom/vkontakte/android/LongPollService;->initClient:Z

    if-eqz v1, :cond_0

    .line 2065
    :goto_0
    return-void

    .line 2049
    :cond_0
    invoke-static {}, Lcom/vk/core/network/Network;->getInstance()Lcom/vk/core/network/Network;

    move-result-object v1

    sget-object v2, Lcom/vk/core/network/Network$ClientType;->CLIENT_LONGPOLL:Lcom/vk/core/network/Network$ClientType;

    invoke-virtual {v1, v2}, Lcom/vk/core/network/Network;->getBuilder(Lcom/vk/core/network/Network$ClientType;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    .line 2050
    .local v0, "builder":Lokhttp3/OkHttpClient$Builder;
    const-wide/16 v2, 0xf

    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v2, v3, v1}, Lokhttp3/OkHttpClient$Builder;->connectTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    .line 2051
    const-wide/16 v2, 0x28

    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v2, v3, v1}, Lokhttp3/OkHttpClient$Builder;->readTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    .line 2052
    new-instance v1, Lcom/vkontakte/android/LongPollService$15;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/LongPollService$15;-><init>(Lcom/vkontakte/android/LongPollService;)V

    invoke-virtual {v0, v1}, Lokhttp3/OkHttpClient$Builder;->addNetworkInterceptor(Lokhttp3/Interceptor;)Lokhttp3/OkHttpClient$Builder;

    .line 2063
    invoke-static {}, Lcom/vk/core/network/Network;->getInstance()Lcom/vk/core/network/Network;

    move-result-object v1

    sget-object v2, Lcom/vk/core/network/Network$ClientType;->CLIENT_LONGPOLL:Lcom/vk/core/network/Network$ClientType;

    invoke-virtual {v1, v2, v0}, Lcom/vk/core/network/Network;->setBuilder(Lcom/vk/core/network/Network$ClientType;Lokhttp3/OkHttpClient$Builder;)Lokhttp3/OkHttpClient;

    .line 2064
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/vkontakte/android/LongPollService;->initClient:Z

    goto :goto_0
.end method

.method public static logout()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 1981
    sget-object v0, Lcom/vkontakte/android/Global;->longPoll:Lcom/vkontakte/android/LongPollService;

    if-eqz v0, :cond_0

    .line 1982
    sget-object v0, Lcom/vkontakte/android/Global;->longPoll:Lcom/vkontakte/android/LongPollService;

    invoke-direct {v0}, Lcom/vkontakte/android/LongPollService;->sendOffline()V

    .line 1983
    sget-object v0, Lcom/vkontakte/android/Global;->longPoll:Lcom/vkontakte/android/LongPollService;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/LongPollService;->setNumUnread(I)V

    .line 1984
    sget-object v0, Lcom/vkontakte/android/Global;->longPoll:Lcom/vkontakte/android/LongPollService;

    invoke-direct {v0}, Lcom/vkontakte/android/LongPollService;->stop()V

    .line 1986
    :cond_0
    sput v1, Lcom/vkontakte/android/LongPollService;->numNewMessages:I

    .line 1987
    sput v1, Lcom/vkontakte/android/LongPollService;->numFriendRequests:I

    .line 1988
    sput v1, Lcom/vkontakte/android/LongPollService;->numGroupInvitations:I

    .line 1989
    sput v1, Lcom/vkontakte/android/LongPollService;->numFriendSuggestions:I

    .line 1990
    return-void
.end method

.method public static notifyCountersChanged()V
    .locals 3

    .prologue
    .line 857
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "com.vkontakte.android.COUNTERS_UPDATED"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string/jumbo v2, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 858
    return-void
.end method

.method public static onNotificationOpened()V
    .locals 1

    .prologue
    .line 1960
    const/4 v0, 0x0

    sput-object v0, Lcom/vkontakte/android/LongPollService;->notification1:Landroid/app/Notification;

    .line 1961
    return-void
.end method

.method public static onReauthError()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 1993
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const-string/jumbo v4, "Reauth error"

    aput-object v4, v3, v5

    invoke-static {v3}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 1994
    invoke-static {}, Lcom/vkontakte/android/auth/VKAuth;->logout()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1996
    :try_start_0
    invoke-static {}, Lcom/vkontakte/android/AppStateTracker;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v0

    .line 1997
    .local v0, "act":Landroid/app/Activity;
    if-nez v0, :cond_1

    .line 2007
    :cond_0
    :goto_0
    return-void

    .line 2000
    :cond_1
    new-instance v1, Landroid/content/Intent;

    const-class v3, Lcom/vkontakte/android/MainActivity;

    invoke-direct {v1, v0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 2001
    .local v1, "intent":Landroid/content/Intent;
    const/high16 v3, 0x4000000

    invoke-virtual {v1, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 2002
    invoke-virtual {v0, v1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 2003
    .end local v1    # "intent":Landroid/content/Intent;
    :catch_0
    move-exception v2

    .line 2004
    .local v2, "x":Ljava/lang/Exception;
    new-array v3, v5, [Ljava/lang/Object;

    invoke-static {v2, v3}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method static parseCountersInfo(Lorg/json/JSONObject;)V
    .locals 2
    .param p0, "source"    # Lorg/json/JSONObject;

    .prologue
    const/4 v1, 0x0

    .line 344
    sput v1, Lcom/vkontakte/android/LongPollService;->numFriendSuggestions:I

    .line 345
    sput v1, Lcom/vkontakte/android/LongPollService;->numFriendRequests:I

    .line 346
    sput v1, Lcom/vkontakte/android/LongPollService;->numNotifications:I

    .line 347
    sput v1, Lcom/vkontakte/android/LongPollService;->numGroupInvitations:I

    .line 348
    sput v1, Lcom/vkontakte/android/LongPollService;->numNewMessages:I

    .line 349
    sput v1, Lcom/vkontakte/android/LongPollService;->numAppRequests:I

    .line 350
    sput v1, Lcom/vkontakte/android/LongPollService;->numPhotosMarks:I

    .line 351
    sput v1, Lcom/vkontakte/android/LongPollService;->numVideosMarks:I

    .line 352
    if-eqz p0, :cond_0

    .line 353
    const-string/jumbo v0, "friends_suggestions"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/vkontakte/android/LongPollService;->numFriendSuggestions:I

    .line 354
    const-string/jumbo v0, "friends"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/vkontakte/android/LongPollService;->numFriendRequests:I

    .line 355
    const-string/jumbo v0, "notifications"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/vkontakte/android/LongPollService;->numNotifications:I

    .line 356
    const-string/jumbo v0, "groups"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/vkontakte/android/LongPollService;->numGroupInvitations:I

    .line 357
    const-string/jumbo v0, "messages"

    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    sput v0, Lcom/vkontakte/android/LongPollService;->numNewMessages:I

    .line 358
    const-string/jumbo v0, "photos"

    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    sput v0, Lcom/vkontakte/android/LongPollService;->numPhotosMarks:I

    .line 359
    const-string/jumbo v0, "videos"

    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    sput v0, Lcom/vkontakte/android/LongPollService;->numVideosMarks:I

    .line 360
    const-string/jumbo v0, "app_requests"

    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    sput v0, Lcom/vkontakte/android/LongPollService;->numAppRequests:I

    .line 362
    :cond_0
    return-void
.end method

.method public static playNotification()V
    .locals 9

    .prologue
    const/4 v8, 0x1

    .line 1806
    new-instance v1, Landroid/app/Notification;

    invoke-direct {v1}, Landroid/app/Notification;-><init>()V

    .line 1807
    .local v1, "n":Landroid/app/Notification;
    sget-object v3, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v3}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 1808
    .local v2, "prefs":Landroid/content/SharedPreferences;
    const-string/jumbo v3, "dnd_end"

    const-wide/16 v4, 0x0

    invoke-interface {v2, v3, v4, v5}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    cmp-long v3, v4, v6

    if-gez v3, :cond_1

    .line 1809
    const-string/jumbo v3, "notifySound"

    invoke-interface {v2, v3, v8}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1810
    sget-object v3, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v3}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    const-string/jumbo v4, "notifyRingtone"

    sget-object v5, Landroid/provider/Settings$System;->DEFAULT_NOTIFICATION_URI:Landroid/net/Uri;

    invoke-virtual {v5}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    iput-object v3, v1, Landroid/app/Notification;->sound:Landroid/net/Uri;

    .line 1812
    :cond_0
    const-string/jumbo v3, "notifyVibrate"

    invoke-interface {v2, v3, v8}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1813
    iget v3, v1, Landroid/app/Notification;->defaults:I

    or-int/lit8 v3, v3, 0x2

    iput v3, v1, Landroid/app/Notification;->defaults:I

    .line 1816
    :cond_1
    sget-object v3, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const-string/jumbo v4, "notification"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    .line 1817
    .local v0, "mNotificationManager":Landroid/app/NotificationManager;
    const/16 v3, 0xb

    invoke-virtual {v0, v3, v1}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 1818
    return-void
.end method

.method public static playNotificationSound(I)V
    .locals 7
    .param p0, "peer"    # I

    .prologue
    const/4 v3, 0x1

    const/high16 v2, 0x3f000000    # 0.5f

    const/4 v4, 0x0

    .line 1645
    sget-object v0, Lcom/vkontakte/android/LongPollService;->notificationSoundPool:Landroid/media/SoundPool;

    if-nez v0, :cond_0

    .line 1646
    new-instance v0, Landroid/media/SoundPool;

    const/4 v1, 0x5

    invoke-direct {v0, v3, v1, v4}, Landroid/media/SoundPool;-><init>(III)V

    sput-object v0, Lcom/vkontakte/android/LongPollService;->notificationSoundPool:Landroid/media/SoundPool;

    .line 1647
    sget-object v0, Lcom/vkontakte/android/LongPollService;->notificationSoundPool:Landroid/media/SoundPool;

    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const v2, 0x7f070003

    invoke-virtual {v0, v1, v2, v3}, Landroid/media/SoundPool;->load(Landroid/content/Context;II)I

    move-result v0

    sput v0, Lcom/vkontakte/android/LongPollService;->notificationSoundID:I

    .line 1648
    sget-object v0, Lcom/vkontakte/android/LongPollService;->notificationSoundPool:Landroid/media/SoundPool;

    new-instance v1, Lcom/vkontakte/android/LongPollService$8;

    invoke-direct {v1}, Lcom/vkontakte/android/LongPollService$8;-><init>()V

    invoke-virtual {v0, v1}, Landroid/media/SoundPool;->setOnLoadCompleteListener(Landroid/media/SoundPool$OnLoadCompleteListener;)V

    .line 1657
    :goto_0
    return-void

    .line 1655
    :cond_0
    sget-object v0, Lcom/vkontakte/android/LongPollService;->notificationSoundPool:Landroid/media/SoundPool;

    sget v1, Lcom/vkontakte/android/LongPollService;->notificationSoundID:I

    const/high16 v6, 0x3f800000    # 1.0f

    move v3, v2

    move v5, v4

    invoke-virtual/range {v0 .. v6}, Landroid/media/SoundPool;->play(IFFIIF)I

    goto :goto_0
.end method

.method private processAddFlags(III)V
    .locals 3
    .param p1, "mid"    # I
    .param p2, "uid"    # I
    .param p3, "mask"    # I

    .prologue
    const/4 v2, 0x0

    .line 834
    and-int/lit8 v1, p3, 0x1

    if-lez v1, :cond_0

    iget-boolean v1, p0, Lcom/vkontakte/android/LongPollService;->newSystem:Z

    if-nez v1, :cond_0

    .line 835
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "com.vkontakte.android.MESSAGE_RSTATE_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 836
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "msg_id"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 837
    const-string/jumbo v1, "read_state"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 838
    const-string/jumbo v1, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/LongPollService;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 840
    invoke-static {p1, v2}, Lcom/vkontakte/android/data/Messages;->setReadState(IZ)V

    .line 842
    invoke-static {p2}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v1

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lcom/vkontakte/android/LongPollService;->newSystem:Z

    if-nez v1, :cond_0

    .line 843
    invoke-static {}, Lcom/vkontakte/android/LongPollService;->getNumNewMessages()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-static {v1}, Lcom/vkontakte/android/LongPollService;->setNumNewMessages(I)V

    .line 845
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "com.vkontakte.android.COUNTERS_UPDATED"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string/jumbo v2, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {p0, v1, v2}, Lcom/vkontakte/android/LongPollService;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 848
    .end local v0    # "intent":Landroid/content/Intent;
    :cond_0
    and-int/lit16 v1, p3, 0x80

    if-gtz v1, :cond_1

    and-int/lit8 v1, p3, 0x40

    if-lez v1, :cond_2

    .line 849
    :cond_1
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "com.vkontakte.android.MESSAGE_DELETED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 850
    .restart local v0    # "intent":Landroid/content/Intent;
    const-string/jumbo v1, "msg_id"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 851
    const-string/jumbo v1, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/LongPollService;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 852
    invoke-static {p1}, Lcom/vkontakte/android/data/Messages;->deleteMessageLocally(I)V

    .line 854
    .end local v0    # "intent":Landroid/content/Intent;
    :cond_2
    return-void
.end method

.method private processChatChanged(I)V
    .locals 2
    .param p1, "chatID"    # I

    .prologue
    .line 968
    invoke-static {p1}, Lcom/vkontakte/android/cache/Cache;->setNeedUpdateChat(I)V

    .line 969
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "com.vkontakte.android.CHAT_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 970
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "id"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 971
    const-string/jumbo v1, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/LongPollService;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 972
    return-void
.end method

.method private processClearFlags(III)V
    .locals 16
    .param p1, "mid"    # I
    .param p2, "uid"    # I
    .param p3, "mask"    # I

    .prologue
    .line 778
    and-int/lit8 v13, p3, 0x1

    if-lez v13, :cond_0

    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/vkontakte/android/LongPollService;->newSystem:Z

    if-nez v13, :cond_0

    .line 779
    new-instance v3, Landroid/content/Intent;

    const-string/jumbo v13, "com.vkontakte.android.MESSAGE_RSTATE_CHANGED"

    invoke-direct {v3, v13}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 781
    .local v3, "intent":Landroid/content/Intent;
    const-string/jumbo v13, "msg_id"

    move/from16 v0, p1

    invoke-virtual {v3, v13, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 782
    const-string/jumbo v13, "read_state"

    const/4 v14, 0x1

    invoke-virtual {v3, v13, v14}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 783
    const-string/jumbo v13, "com.vkontakte.android.permission.ACCESS_DATA"

    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v13}, Lcom/vkontakte/android/LongPollService;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 785
    const/4 v13, 0x1

    move/from16 v0, p1

    invoke-static {v0, v13}, Lcom/vkontakte/android/data/Messages;->setReadState(IZ)V

    .line 787
    invoke-static/range {p2 .. p2}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v13

    if-nez v13, :cond_0

    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/vkontakte/android/LongPollService;->newSystem:Z

    if-nez v13, :cond_0

    .line 788
    invoke-static {}, Lcom/vkontakte/android/LongPollService;->getNumNewMessages()I

    move-result v13

    add-int/lit8 v13, v13, -0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/vkontakte/android/LongPollService;->setNumUnread(I)V

    .line 791
    .end local v3    # "intent":Landroid/content/Intent;
    :cond_0
    move/from16 v0, p3

    and-int/lit16 v13, v0, 0x80

    if-gtz v13, :cond_1

    and-int/lit8 v13, p3, 0x40

    if-lez v13, :cond_4

    .line 793
    :cond_1
    new-instance v2, Lcom/vkontakte/android/api/VKAPIRequest;

    const-string/jumbo v13, "messages.getById"

    invoke-direct {v2, v13}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 794
    .local v2, "getMsg":Lcom/vkontakte/android/api/VKAPIRequest;
    const-string/jumbo v13, "message_ids"

    move/from16 v0, p1

    invoke-virtual {v2, v13, v0}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v13

    const-string/jumbo v14, "photo_sizes"

    const/4 v15, 0x1

    invoke-virtual {v13, v14, v15}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v13

    const-string/jumbo v14, "fields"

    const-string/jumbo v15, "first_name,last_name,photo_100,photo_50"

    invoke-virtual {v13, v14, v15}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 795
    invoke-static {v2}, Lcom/vkontakte/android/api/APIController;->runRequest(Lcom/vkontakte/android/api/VKAPIRequest;)Lorg/json/JSONObject;

    move-result-object v9

    .line 796
    .local v9, "res":Lorg/json/JSONObject;
    if-eqz v9, :cond_5

    const-string/jumbo v13, "response"

    invoke-virtual {v9, v13}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_5

    .line 798
    :try_start_0
    const-string/jumbo v13, "response"

    invoke-static {v9, v13}, Lcom/vkontakte/android/api/APIUtils;->unwrapArray(Lorg/json/JSONObject;Ljava/lang/String;)Lcom/vkontakte/android/api/JSONArrayWithCount;

    move-result-object v13

    iget-object v13, v13, Lcom/vkontakte/android/api/JSONArrayWithCount;->array:Lorg/json/JSONArray;

    const/4 v14, 0x0

    invoke-virtual {v13, v14}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    .line 799
    .local v4, "jmsg":Lorg/json/JSONObject;
    new-instance v5, Lcom/vkontakte/android/Message;

    invoke-direct {v5, v4}, Lcom/vkontakte/android/Message;-><init>(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 808
    .local v5, "msg":Lcom/vkontakte/android/Message;
    new-instance v3, Landroid/content/Intent;

    const-string/jumbo v13, "com.vkontakte.android.NEW_MESSAGE"

    invoke-direct {v3, v13}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 809
    .restart local v3    # "intent":Landroid/content/Intent;
    iget-object v13, v5, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    if-eqz v13, :cond_2

    iget-object v13, v5, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    const-string/jumbo v14, "action_mid"

    invoke-virtual {v13, v14}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_2

    .line 810
    iget-object v13, v5, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    const-string/jumbo v14, "action_mid"

    const/4 v15, 0x0

    invoke-virtual {v13, v14, v15}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    .line 811
    .local v1, "actMid":I
    const/4 v13, 0x1

    new-array v13, v13, [Ljava/lang/Integer;

    const/4 v14, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v13, v14

    invoke-static {v13}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v13

    const/4 v14, 0x3

    invoke-static {v13, v14}, Lcom/vkontakte/android/data/Friends;->getUsersBlocking(Ljava/util/List;I)Ljava/util/ArrayList;

    move-result-object v11

    .line 812
    .local v11, "users":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    const-string/jumbo v14, "action_user_name_acc"

    const/4 v13, 0x0

    invoke-virtual {v11, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/vkontakte/android/UserProfile;

    iget-object v13, v13, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-virtual {v3, v14, v13}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 813
    const-string/jumbo v14, "action_user_name_acc"

    const/4 v13, 0x0

    invoke-virtual {v11, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/vkontakte/android/UserProfile;

    iget-object v13, v13, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-virtual {v5, v14, v13}, Lcom/vkontakte/android/Message;->putStringExtra(Ljava/lang/String;Ljava/lang/String;)V

    .line 815
    .end local v1    # "actMid":I
    .end local v11    # "users":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    :cond_2
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 816
    .local v6, "needUsers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    iget v13, v5, Lcom/vkontakte/android/Message;->sender:I

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v6, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 817
    invoke-static {v6}, Lcom/vkontakte/android/data/Friends;->getUsersBlocking(Ljava/util/List;)Ljava/util/ArrayList;

    move-result-object v13

    const/4 v14, 0x0

    invoke-virtual {v13, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/vkontakte/android/UserProfile;

    .line 818
    .local v10, "senderProfile":Lcom/vkontakte/android/UserProfile;
    const-string/jumbo v13, "sender_profile"

    invoke-virtual {v3, v13, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 819
    const-string/jumbo v13, "peer_id"

    iget v14, v5, Lcom/vkontakte/android/Message;->peer:I

    invoke-virtual {v3, v13, v14}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 820
    const-string/jumbo v13, "message"

    invoke-virtual {v3, v13, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 821
    const-string/jumbo v13, "is_out"

    iget-boolean v14, v5, Lcom/vkontakte/android/Message;->out:Z

    invoke-virtual {v3, v13, v14}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 822
    const-string/jumbo v13, "sender_photo"

    iget-object v14, v10, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-virtual {v3, v13, v14}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 823
    const/4 v7, 0x0

    .line 824
    .local v7, "peerProfile":Lcom/vkontakte/android/UserProfile;
    iget v13, v5, Lcom/vkontakte/android/Message;->peer:I

    const v14, 0x77359400

    if-ge v13, v14, :cond_3

    .line 825
    const/4 v13, 0x1

    new-array v13, v13, [Ljava/lang/Integer;

    const/4 v14, 0x0

    iget v15, v5, Lcom/vkontakte/android/Message;->peer:I

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v13, v14

    invoke-static {v13}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v13

    invoke-static {v13}, Lcom/vkontakte/android/data/Friends;->getUsersBlocking(Ljava/util/List;)Ljava/util/ArrayList;

    move-result-object v8

    .line 826
    .local v8, "pp":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    const-string/jumbo v13, "peer_profile"

    const/4 v14, 0x0

    invoke-virtual {v8, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    .end local v7    # "peerProfile":Lcom/vkontakte/android/UserProfile;
    check-cast v7, Lcom/vkontakte/android/UserProfile;

    .restart local v7    # "peerProfile":Lcom/vkontakte/android/UserProfile;
    invoke-virtual {v3, v13, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 828
    .end local v8    # "pp":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    :cond_3
    iget-object v13, v10, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-static {v5, v7, v13}, Lcom/vkontakte/android/data/Messages;->add(Lcom/vkontakte/android/Message;Lcom/vkontakte/android/UserProfile;Ljava/lang/String;)V

    .line 829
    const-string/jumbo v13, "com.vkontakte.android.permission.ACCESS_DATA"

    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v13}, Lcom/vkontakte/android/LongPollService;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 831
    .end local v2    # "getMsg":Lcom/vkontakte/android/api/VKAPIRequest;
    .end local v3    # "intent":Landroid/content/Intent;
    .end local v4    # "jmsg":Lorg/json/JSONObject;
    .end local v5    # "msg":Lcom/vkontakte/android/Message;
    .end local v6    # "needUsers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    .end local v7    # "peerProfile":Lcom/vkontakte/android/UserProfile;
    .end local v9    # "res":Lorg/json/JSONObject;
    .end local v10    # "senderProfile":Lcom/vkontakte/android/UserProfile;
    :cond_4
    :goto_0
    return-void

    .line 800
    .restart local v2    # "getMsg":Lcom/vkontakte/android/api/VKAPIRequest;
    .restart local v9    # "res":Lorg/json/JSONObject;
    :catch_0
    move-exception v12

    .line 801
    .local v12, "x":Ljava/lang/Exception;
    const-string/jumbo v13, "vk"

    invoke-static {v13, v12}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 805
    .end local v12    # "x":Ljava/lang/Exception;
    :cond_5
    const-string/jumbo v13, "vk_longpoll"

    const-string/jumbo v14, "Error getting full message"

    invoke-static {v13, v14}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static processFailedMessageAddCallback(Lorg/json/JSONObject;Lorg/json/JSONObject;)V
    .locals 15
    .param p0, "res"    # Lorg/json/JSONObject;
    .param p1, "data"    # Lorg/json/JSONObject;

    .prologue
    .line 976
    if-eqz p0, :cond_1

    :try_start_0
    const-string/jumbo v11, "response"

    invoke-virtual {p0, v11}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_1

    .line 977
    const-string/jumbo v11, "response"

    invoke-static {p0, v11}, Lcom/vkontakte/android/api/APIUtils;->unwrapArray(Lorg/json/JSONObject;Ljava/lang/String;)Lcom/vkontakte/android/api/JSONArrayWithCount;

    move-result-object v11

    iget-object v11, v11, Lcom/vkontakte/android/api/JSONArrayWithCount;->array:Lorg/json/JSONArray;

    const/4 v12, 0x0

    invoke-virtual {v11, v12}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    .line 978
    .local v3, "jmsg":Lorg/json/JSONObject;
    new-instance v4, Lcom/vkontakte/android/Message;

    invoke-direct {v4, v3}, Lcom/vkontakte/android/Message;-><init>(Lorg/json/JSONObject;)V

    .line 979
    .local v4, "msg":Lcom/vkontakte/android/Message;
    iget-object v11, v4, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    const-string/jumbo v12, "action"

    invoke-virtual {v11, v12}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_0

    .line 980
    const/4 v11, 0x1

    iput-boolean v11, v4, Lcom/vkontakte/android/Message;->isServiceMessage:Z

    .line 983
    :cond_0
    iget-boolean v11, v4, Lcom/vkontakte/android/Message;->out:Z

    if-eqz v11, :cond_2

    iget-boolean v11, v4, Lcom/vkontakte/android/Message;->isServiceMessage:Z

    if-nez v11, :cond_2

    sget-object v11, Lcom/vkontakte/android/LongPollService;->sendingMessages:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v11

    if-lez v11, :cond_2

    .line 984
    sget-object v11, Lcom/vkontakte/android/LongPollService;->pendingReceivedMessages:Ljava/util/ArrayList;

    invoke-virtual {v11, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1033
    .end local v3    # "jmsg":Lorg/json/JSONObject;
    .end local v4    # "msg":Lcom/vkontakte/android/Message;
    :cond_1
    :goto_0
    return-void

    .line 988
    .restart local v3    # "jmsg":Lorg/json/JSONObject;
    .restart local v4    # "msg":Lcom/vkontakte/android/Message;
    :cond_2
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v11, "com.vkontakte.android.NEW_MESSAGE"

    invoke-direct {v1, v11}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 989
    .local v1, "intent":Landroid/content/Intent;
    iget-object v11, v4, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    const-string/jumbo v12, "action_mid"

    invoke-virtual {v11, v12}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_3

    .line 990
    iget-object v11, v4, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    const-string/jumbo v12, "action_mid"

    const/4 v13, 0x0

    invoke-virtual {v11, v12, v13}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 991
    .local v0, "actMid":I
    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Integer;

    const/4 v12, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-static {v11}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v11

    const/4 v12, 0x3

    invoke-static {v11, v12}, Lcom/vkontakte/android/data/Friends;->getUsersBlocking(Ljava/util/List;I)Ljava/util/ArrayList;

    move-result-object v9

    .line 992
    .local v9, "users":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    const-string/jumbo v12, "action_user_name_acc"

    const/4 v11, 0x0

    invoke-virtual {v9, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/vkontakte/android/UserProfile;

    iget-object v11, v11, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-virtual {v1, v12, v11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 993
    const-string/jumbo v12, "action_user_name_acc"

    const/4 v11, 0x0

    invoke-virtual {v9, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/vkontakte/android/UserProfile;

    iget-object v11, v11, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-virtual {v4, v12, v11}, Lcom/vkontakte/android/Message;->putStringExtra(Ljava/lang/String;Ljava/lang/String;)V

    .line 995
    .end local v0    # "actMid":I
    .end local v9    # "users":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    :cond_3
    sget-boolean v11, Lcom/vkontakte/android/LongPollService;->DEBUG:Z

    if-eqz v11, :cond_4

    .line 996
    const-string/jumbo v11, "vk_longpoll"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v13, "Message: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 998
    :cond_4
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 999
    .local v5, "needUsers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    iget v11, v4, Lcom/vkontakte/android/Message;->sender:I

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v5, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1000
    invoke-static {v5}, Lcom/vkontakte/android/data/Friends;->getUsersBlocking(Ljava/util/List;)Ljava/util/ArrayList;

    move-result-object v11

    const/4 v12, 0x0

    invoke-virtual {v11, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/vkontakte/android/UserProfile;

    .line 1001
    .local v8, "senderProfile":Lcom/vkontakte/android/UserProfile;
    const-string/jumbo v11, "sender_profile"

    invoke-virtual {v1, v11, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 1002
    const-string/jumbo v11, "peer_id"

    iget v12, v4, Lcom/vkontakte/android/Message;->peer:I

    invoke-virtual {v1, v11, v12}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1003
    const-string/jumbo v11, "message"

    invoke-virtual {v1, v11, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 1004
    const-string/jumbo v11, "is_out"

    iget-boolean v12, v4, Lcom/vkontakte/android/Message;->out:Z

    invoke-virtual {v1, v11, v12}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 1005
    const-string/jumbo v11, "sender_photo"

    iget-object v12, v8, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-virtual {v1, v11, v12}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1006
    const/4 v6, 0x0

    .line 1007
    .local v6, "peerProfile":Lcom/vkontakte/android/UserProfile;
    iget v11, v4, Lcom/vkontakte/android/Message;->peer:I

    const v12, 0x77359400

    if-ge v11, v12, :cond_5

    .line 1008
    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Integer;

    const/4 v12, 0x0

    iget v13, v4, Lcom/vkontakte/android/Message;->peer:I

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-static {v11}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v11

    invoke-static {v11}, Lcom/vkontakte/android/data/Friends;->getUsersBlocking(Ljava/util/List;)Ljava/util/ArrayList;

    move-result-object v7

    .line 1009
    .local v7, "pp":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    const-string/jumbo v11, "peer_profile"

    const/4 v12, 0x0

    invoke-virtual {v7, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    .end local v6    # "peerProfile":Lcom/vkontakte/android/UserProfile;
    check-cast v6, Lcom/vkontakte/android/UserProfile;

    .restart local v6    # "peerProfile":Lcom/vkontakte/android/UserProfile;
    invoke-virtual {v1, v11, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 1012
    .end local v7    # "pp":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    :cond_5
    iget-boolean v11, v4, Lcom/vkontakte/android/Message;->out:Z

    if-eqz v11, :cond_6

    iget v11, v4, Lcom/vkontakte/android/Message;->id:I

    invoke-static {v11}, Lcom/vkontakte/android/cache/Cache;->containsMessage(I)Z

    move-result v11

    if-eqz v11, :cond_6

    .line 1013
    iget-object v11, v8, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-static {v4, v6, v11}, Lcom/vkontakte/android/data/Messages;->add(Lcom/vkontakte/android/Message;Lcom/vkontakte/android/UserProfile;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 1030
    .end local v1    # "intent":Landroid/content/Intent;
    .end local v3    # "jmsg":Lorg/json/JSONObject;
    .end local v4    # "msg":Lcom/vkontakte/android/Message;
    .end local v5    # "needUsers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    .end local v6    # "peerProfile":Lcom/vkontakte/android/UserProfile;
    .end local v8    # "senderProfile":Lcom/vkontakte/android/UserProfile;
    :catch_0
    move-exception v10

    .line 1031
    .local v10, "x":Lorg/json/JSONException;
    const/4 v11, 0x0

    new-array v11, v11, [Ljava/lang/Object;

    invoke-static {v10, v11}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 1016
    .end local v10    # "x":Lorg/json/JSONException;
    .restart local v1    # "intent":Landroid/content/Intent;
    .restart local v3    # "jmsg":Lorg/json/JSONObject;
    .restart local v4    # "msg":Lcom/vkontakte/android/Message;
    .restart local v5    # "needUsers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    .restart local v6    # "peerProfile":Lcom/vkontakte/android/UserProfile;
    .restart local v8    # "senderProfile":Lcom/vkontakte/android/UserProfile;
    :cond_6
    :try_start_1
    iget-object v11, v8, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-static {v4, v6, v11}, Lcom/vkontakte/android/data/Messages;->add(Lcom/vkontakte/android/Message;Lcom/vkontakte/android/UserProfile;Ljava/lang/String;)V

    .line 1018
    sget-object v11, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const-string/jumbo v12, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v11, v1, v12}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 1019
    iget-object v11, v4, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    const-string/jumbo v12, "action"

    invoke-virtual {v11, v12}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_1

    .line 1020
    iget v11, v4, Lcom/vkontakte/android/Message;->peer:I

    const v12, 0x77359400

    sub-int/2addr v11, v12

    invoke-static {v11}, Lcom/vkontakte/android/cache/Cache;->setNeedUpdateChat(I)V

    .line 1021
    new-instance v2, Landroid/content/Intent;

    const-string/jumbo v11, "com.vkontakte.android.CHAT_CHANGED"

    invoke-direct {v2, v11}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1022
    .local v2, "intent1":Landroid/content/Intent;
    const-string/jumbo v11, "id"

    iget v12, v4, Lcom/vkontakte/android/Message;->peer:I

    const v13, 0x77359400

    sub-int/2addr v12, v13

    invoke-virtual {v2, v11, v12}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1024
    sget-object v11, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const-string/jumbo v12, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v11, v2, v12}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 1025
    const-string/jumbo v11, "chat_title_update"

    iget-object v12, v4, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    const-string/jumbo v13, "action"

    invoke-virtual {v12, v13}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1

    .line 1026
    iget v11, v4, Lcom/vkontakte/android/Message;->peer:I

    const v12, 0x77359400

    sub-int/2addr v11, v12

    iget-object v12, v4, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    const-string/jumbo v13, "action_text"

    invoke-virtual {v12, v13}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x0

    const/4 v14, 0x0

    invoke-static {v11, v12, v13, v14}, Lcom/vkontakte/android/cache/Cache;->updateChat(ILjava/lang/String;Ljava/util/ArrayList;Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0
.end method

.method public static processFailedMessageUpdateCallback(Lorg/json/JSONObject;Lorg/json/JSONObject;)V
    .locals 14
    .param p0, "res"    # Lorg/json/JSONObject;
    .param p1, "data"    # Lorg/json/JSONObject;
    .annotation build Landroid/support/annotation/Keep;
    .end annotation

    .prologue
    const/4 v13, 0x0

    .line 1038
    if-eqz p0, :cond_1

    :try_start_0
    const-string/jumbo v10, "response"

    invoke-virtual {p0, v10}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_1

    .line 1039
    const-string/jumbo v10, "response"

    invoke-static {p0, v10}, Lcom/vkontakte/android/api/APIUtils;->unwrapArray(Lorg/json/JSONObject;Ljava/lang/String;)Lcom/vkontakte/android/api/JSONArrayWithCount;

    move-result-object v10

    iget-object v10, v10, Lcom/vkontakte/android/api/JSONArrayWithCount;->array:Lorg/json/JSONArray;

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    .line 1040
    .local v2, "jmsg":Lorg/json/JSONObject;
    new-instance v3, Lcom/vkontakte/android/Message;

    invoke-direct {v3, v2}, Lcom/vkontakte/android/Message;-><init>(Lorg/json/JSONObject;)V

    .line 1041
    .local v3, "msg":Lcom/vkontakte/android/Message;
    iget-object v10, v3, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    const-string/jumbo v11, "action"

    invoke-virtual {v10, v11}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 1042
    const/4 v10, 0x1

    iput-boolean v10, v3, Lcom/vkontakte/android/Message;->isServiceMessage:Z

    .line 1045
    :cond_0
    iget-boolean v10, v3, Lcom/vkontakte/android/Message;->out:Z

    if-eqz v10, :cond_2

    iget-boolean v10, v3, Lcom/vkontakte/android/Message;->isServiceMessage:Z

    if-nez v10, :cond_2

    sget-object v10, Lcom/vkontakte/android/LongPollService;->sendingMessages:Ljava/util/ArrayList;

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v10

    if-lez v10, :cond_2

    .line 1046
    sget-object v10, Lcom/vkontakte/android/LongPollService;->pendingReceivedMessages:Ljava/util/ArrayList;

    invoke-virtual {v10, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1081
    .end local v2    # "jmsg":Lorg/json/JSONObject;
    .end local v3    # "msg":Lcom/vkontakte/android/Message;
    :cond_1
    :goto_0
    return-void

    .line 1050
    .restart local v2    # "jmsg":Lorg/json/JSONObject;
    .restart local v3    # "msg":Lcom/vkontakte/android/Message;
    :cond_2
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v10, "com.vkontakte.android.UPDATE_MESSAGE"

    invoke-direct {v1, v10}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1051
    .local v1, "intent":Landroid/content/Intent;
    iget-object v10, v3, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    const-string/jumbo v11, "action_mid"

    invoke-virtual {v10, v11}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_3

    .line 1052
    iget-object v10, v3, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    const-string/jumbo v11, "action_mid"

    const/4 v12, 0x0

    invoke-virtual {v10, v11, v12}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 1053
    .local v0, "actMid":I
    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Integer;

    const/4 v11, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v11

    invoke-static {v10}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v10

    const/4 v11, 0x3

    invoke-static {v10, v11}, Lcom/vkontakte/android/data/Friends;->getUsersBlocking(Ljava/util/List;I)Ljava/util/ArrayList;

    move-result-object v8

    .line 1054
    .local v8, "users":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    const-string/jumbo v11, "action_user_name_acc"

    const/4 v10, 0x0

    invoke-virtual {v8, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/vkontakte/android/UserProfile;

    iget-object v10, v10, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-virtual {v1, v11, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1055
    const-string/jumbo v11, "action_user_name_acc"

    const/4 v10, 0x0

    invoke-virtual {v8, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/vkontakte/android/UserProfile;

    iget-object v10, v10, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-virtual {v3, v11, v10}, Lcom/vkontakte/android/Message;->putStringExtra(Ljava/lang/String;Ljava/lang/String;)V

    .line 1057
    .end local v0    # "actMid":I
    .end local v8    # "users":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    :cond_3
    sget-boolean v10, Lcom/vkontakte/android/LongPollService;->DEBUG:Z

    if-eqz v10, :cond_4

    .line 1058
    const-string/jumbo v10, "vk_longpoll"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v12, "Message: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1060
    :cond_4
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 1061
    .local v4, "needUsers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    iget v10, v3, Lcom/vkontakte/android/Message;->sender:I

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v4, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1062
    invoke-static {v4}, Lcom/vkontakte/android/data/Friends;->getUsersBlocking(Ljava/util/List;)Ljava/util/ArrayList;

    move-result-object v10

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/vkontakte/android/UserProfile;

    .line 1063
    .local v7, "senderProfile":Lcom/vkontakte/android/UserProfile;
    const-string/jumbo v10, "sender_profile"

    invoke-virtual {v1, v10, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 1064
    const-string/jumbo v10, "peer_id"

    iget v11, v3, Lcom/vkontakte/android/Message;->peer:I

    invoke-virtual {v1, v10, v11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1065
    const-string/jumbo v10, "message"

    invoke-virtual {v1, v10, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 1066
    const-string/jumbo v10, "is_out"

    iget-boolean v11, v3, Lcom/vkontakte/android/Message;->out:Z

    invoke-virtual {v1, v10, v11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 1067
    const-string/jumbo v10, "sender_photo"

    iget-object v11, v7, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-virtual {v1, v10, v11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1068
    const/4 v5, 0x0

    .line 1069
    .local v5, "peerProfile":Lcom/vkontakte/android/UserProfile;
    iget v10, v3, Lcom/vkontakte/android/Message;->peer:I

    const v11, 0x77359400

    if-ge v10, v11, :cond_5

    .line 1070
    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Integer;

    const/4 v11, 0x0

    iget v12, v3, Lcom/vkontakte/android/Message;->peer:I

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v11

    invoke-static {v10}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v10

    invoke-static {v10}, Lcom/vkontakte/android/data/Friends;->getUsersBlocking(Ljava/util/List;)Ljava/util/ArrayList;

    move-result-object v6

    .line 1071
    .local v6, "pp":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    const-string/jumbo v10, "peer_profile"

    const/4 v11, 0x0

    invoke-virtual {v6, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    .end local v5    # "peerProfile":Lcom/vkontakte/android/UserProfile;
    check-cast v5, Lcom/vkontakte/android/UserProfile;

    .restart local v5    # "peerProfile":Lcom/vkontakte/android/UserProfile;
    invoke-virtual {v1, v10, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 1073
    .end local v6    # "pp":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    :cond_5
    iget v10, v3, Lcom/vkontakte/android/Message;->id:I

    invoke-static {v10}, Lcom/vkontakte/android/cache/Cache;->containsMessage(I)Z

    move-result v10

    if-eqz v10, :cond_1

    .line 1074
    iget-object v10, v7, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-static {v3, v5, v10}, Lcom/vkontakte/android/data/Messages;->add(Lcom/vkontakte/android/Message;Lcom/vkontakte/android/UserProfile;Ljava/lang/String;)V

    .line 1075
    sget-object v10, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const-string/jumbo v11, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v10, v1, v11}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 1078
    .end local v1    # "intent":Landroid/content/Intent;
    .end local v2    # "jmsg":Lorg/json/JSONObject;
    .end local v3    # "msg":Lcom/vkontakte/android/Message;
    .end local v4    # "needUsers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    .end local v5    # "peerProfile":Lcom/vkontakte/android/UserProfile;
    .end local v7    # "senderProfile":Lcom/vkontakte/android/UserProfile;
    :catch_0
    move-exception v9

    .line 1079
    .local v9, "x":Lorg/json/JSONException;
    new-array v10, v13, [Ljava/lang/Object;

    invoke-static {v9, v10}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto/16 :goto_0
.end method

.method private processMessageAdd(IIIILjava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;I)V
    .locals 34
    .param p1, "mid"    # I
    .param p2, "peer"    # I
    .param p3, "flags"    # I
    .param p4, "time"    # I
    .param p5, "text"    # Ljava/lang/String;
    .param p6, "subject"    # Ljava/lang/String;
    .param p7, "extra"    # Lorg/json/JSONObject;
    .param p8, "randomId"    # I

    .prologue
    .line 1084
    sget-boolean v3, Lcom/vkontakte/android/LongPollService;->DEBUG:Z

    if-eqz v3, :cond_0

    .line 1085
    const-string/jumbo v3, "vk_longpoll"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "processMessageAdd: id="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, p1

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ", flags="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, p3

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ", peer="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, p2

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ", time="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, p4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ", subject=\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p6

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "\', text=\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p5

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "\', extra="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p7

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "\', randomId="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, p8

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1088
    :cond_0
    and-int/lit8 v3, p3, 0x2

    if-lez v3, :cond_7

    const/16 v16, 0x1

    .line 1090
    .local v16, "isOut":Z
    :goto_0
    :try_start_0
    sget-object v3, Lcom/vkontakte/android/LongPollService;->addMessage:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v3}, Ljava/util/concurrent/Semaphore;->acquire()V

    .line 1091
    sget-object v3, Lcom/vkontakte/android/LongPollService;->addMessage:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v3}, Ljava/util/concurrent/Semaphore;->release()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1097
    :goto_1
    const v3, 0x77359400

    move/from16 v0, p2

    if-ge v0, v3, :cond_9

    .line 1098
    if-eqz v16, :cond_8

    :try_start_1
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result v25

    .line 1103
    .local v25, "sender":I
    :goto_2
    const v3, 0x77359400

    move/from16 v0, p2

    if-le v0, v3, :cond_a

    move/from16 v0, v25

    int-to-long v4, v0

    const/16 v3, 0x20

    shl-long/2addr v4, v3

    move/from16 v0, p2

    int-to-long v0, v0

    move-wide/from16 v32, v0

    or-long v28, v4, v32

    .line 1105
    .local v28, "typingKey":J
    :goto_3
    :try_start_2
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/LongPollService;->typingLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v3}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 1109
    :goto_4
    :try_start_3
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/LongPollService;->typings:Ljava/util/HashMap;

    invoke-static/range {v28 .. v29}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1110
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/LongPollService;->typings:Ljava/util/HashMap;

    invoke-static/range {v28 .. v29}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1111
    new-instance v14, Landroid/content/Intent;

    const-string/jumbo v3, "com.vkontakte.android.TYPING"

    invoke-direct {v14, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1112
    .local v14, "intent":Landroid/content/Intent;
    const-string/jumbo v3, "uid"

    move/from16 v0, p2

    invoke-virtual {v14, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1113
    const-string/jumbo v3, "user"

    move/from16 v0, v25

    invoke-virtual {v14, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1114
    const-string/jumbo v3, "stop"

    const/4 v4, 0x1

    invoke-virtual {v14, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 1115
    const-string/jumbo v3, "com.vkontakte.android.permission.ACCESS_DATA"

    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v3}, Lcom/vkontakte/android/LongPollService;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 1117
    .end local v14    # "intent":Landroid/content/Intent;
    :cond_1
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/LongPollService;->typingLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v3}, Ljava/util/concurrent/Semaphore;->release()V

    .line 1119
    if-eqz p7, :cond_c

    const-string/jumbo v3, "attach1_type"

    move-object/from16 v0, p7

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_2

    const-string/jumbo v3, "fwd"

    move-object/from16 v0, p7

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_2

    const-string/jumbo v3, "geo"

    move-object/from16 v0, p7

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_c

    .line 1120
    :cond_2
    sget-boolean v3, Lcom/vkontakte/android/LongPollService;->DEBUG:Z

    if-eqz v3, :cond_3

    .line 1121
    const-string/jumbo v3, "vk_longpoll"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "will get message "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, p1

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " from api"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1123
    :cond_3
    new-instance v11, Lcom/vkontakte/android/api/VKAPIRequest;

    const-string/jumbo v3, "messages.getById"

    invoke-direct {v11, v3}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 1124
    .local v11, "getMsg":Lcom/vkontakte/android/api/VKAPIRequest;
    const-string/jumbo v3, "message_ids"

    move/from16 v0, p1

    invoke-virtual {v11, v3, v0}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    const-string/jumbo v4, "photo_sizes"

    const/4 v5, 0x1

    invoke-virtual {v3, v4, v5}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    const-string/jumbo v4, "fields"

    const-string/jumbo v5, "first_name,last_name,photo_100,photo_50"

    invoke-virtual {v3, v4, v5}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 1126
    :try_start_4
    const-class v3, Lcom/vkontakte/android/LongPollService;

    const-string/jumbo v4, "processFailedMessageAddCallback"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v7, 0x0

    const-class v32, Lorg/json/JSONObject;

    aput-object v32, v5, v7

    const/4 v7, 0x1

    const-class v32, Lorg/json/JSONObject;

    aput-object v32, v5, v7

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v11, v3, v4}, Lcom/vkontakte/android/api/VKAPIRequest;->persist(Ljava/lang/reflect/Method;Lorg/json/JSONObject;)Lcom/vkontakte/android/api/VKAPIRequest;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    .line 1130
    :goto_5
    :try_start_5
    invoke-static {v11}, Lcom/vkontakte/android/api/APIController;->runRequest(Lcom/vkontakte/android/api/VKAPIRequest;)Lorg/json/JSONObject;

    move-result-object v24

    .line 1131
    .local v24, "res":Lorg/json/JSONObject;
    if-eqz v24, :cond_b

    const-string/jumbo v3, "response"

    move-object/from16 v0, v24

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_b

    .line 1132
    const-string/jumbo v3, "response"

    move-object/from16 v0, v24

    invoke-static {v0, v3}, Lcom/vkontakte/android/api/APIUtils;->unwrapArray(Lorg/json/JSONObject;Ljava/lang/String;)Lcom/vkontakte/android/api/JSONArrayWithCount;

    move-result-object v3

    iget-object v3, v3, Lcom/vkontakte/android/api/JSONArrayWithCount;->array:Lorg/json/JSONArray;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v17

    .line 1133
    .local v17, "jmsg":Lorg/json/JSONObject;
    new-instance v18, Lcom/vkontakte/android/Message;

    move-object/from16 v0, v18

    move-object/from16 v1, v17

    invoke-direct {v0, v1}, Lcom/vkontakte/android/Message;-><init>(Lorg/json/JSONObject;)V

    .line 1169
    .end local v11    # "getMsg":Lcom/vkontakte/android/api/VKAPIRequest;
    .end local v17    # "jmsg":Lorg/json/JSONObject;
    .end local v24    # "res":Lorg/json/JSONObject;
    .local v18, "msg":Lcom/vkontakte/android/Message;
    :cond_4
    :goto_6
    move-object/from16 v0, v18

    iget-object v3, v0, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    const-string/jumbo v4, "action"

    invoke-virtual {v3, v4}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 1170
    const/4 v3, 0x1

    move-object/from16 v0, v18

    iput-boolean v3, v0, Lcom/vkontakte/android/Message;->isServiceMessage:Z

    .line 1173
    :cond_5
    move-object/from16 v0, v18

    iget-boolean v3, v0, Lcom/vkontakte/android/Message;->out:Z

    if-eqz v3, :cond_11

    move-object/from16 v0, v18

    iget-boolean v3, v0, Lcom/vkontakte/android/Message;->isServiceMessage:Z

    if-nez v3, :cond_11

    sget-object v3, Lcom/vkontakte/android/LongPollService;->sendingMessages:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v3, :cond_11

    .line 1174
    sget-object v3, Lcom/vkontakte/android/LongPollService;->pendingReceivedMessages:Ljava/util/ArrayList;

    move-object/from16 v0, v18

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1289
    .end local v18    # "msg":Lcom/vkontakte/android/Message;
    .end local v25    # "sender":I
    .end local v28    # "typingKey":J
    :cond_6
    :goto_7
    return-void

    .line 1088
    .end local v16    # "isOut":Z
    :cond_7
    const/16 v16, 0x0

    goto/16 :goto_0

    .line 1092
    .restart local v16    # "isOut":Z
    :catch_0
    move-exception v31

    .line 1093
    .local v31, "x":Ljava/lang/Exception;
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    move-object/from16 v0, v31

    invoke-static {v0, v3}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    goto/16 :goto_1

    .line 1286
    .end local v31    # "x":Ljava/lang/Exception;
    :catch_1
    move-exception v31

    .line 1287
    .restart local v31    # "x":Ljava/lang/Exception;
    const-string/jumbo v3, "vk_longpoll"

    const-string/jumbo v4, "Error processing message"

    move-object/from16 v0, v31

    invoke-static {v3, v4, v0}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_7

    .end local v31    # "x":Ljava/lang/Exception;
    :cond_8
    move/from16 v25, p2

    .line 1098
    goto/16 :goto_2

    .line 1100
    :cond_9
    :try_start_6
    const-string/jumbo v3, "from"

    move-object/from16 v0, p7

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v25

    .restart local v25    # "sender":I
    goto/16 :goto_2

    .line 1103
    :cond_a
    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v28, v0

    goto/16 :goto_3

    .line 1106
    .restart local v28    # "typingKey":J
    :catch_2
    move-exception v31

    .line 1107
    .restart local v31    # "x":Ljava/lang/Exception;
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    move-object/from16 v0, v31

    invoke-static {v0, v3}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto/16 :goto_4

    .line 1127
    .end local v31    # "x":Ljava/lang/Exception;
    .restart local v11    # "getMsg":Lcom/vkontakte/android/api/VKAPIRequest;
    :catch_3
    move-exception v31

    .line 1128
    .restart local v31    # "x":Ljava/lang/Exception;
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    move-object/from16 v0, v31

    invoke-static {v0, v3}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto/16 :goto_5

    .line 1135
    .end local v31    # "x":Ljava/lang/Exception;
    .restart local v24    # "res":Lorg/json/JSONObject;
    :cond_b
    const-string/jumbo v3, "vk_longpoll"

    const-string/jumbo v4, "Error getting full message"

    invoke-static {v3, v4}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_7

    .line 1139
    .end local v11    # "getMsg":Lcom/vkontakte/android/api/VKAPIRequest;
    .end local v24    # "res":Lorg/json/JSONObject;
    :cond_c
    new-instance v18, Lcom/vkontakte/android/Message;

    invoke-direct/range {v18 .. v18}, Lcom/vkontakte/android/Message;-><init>()V

    .line 1140
    .restart local v18    # "msg":Lcom/vkontakte/android/Message;
    move/from16 v0, p2

    move-object/from16 v1, v18

    iput v0, v1, Lcom/vkontakte/android/Message;->peer:I

    .line 1141
    move/from16 v0, v25

    move-object/from16 v1, v18

    iput v0, v1, Lcom/vkontakte/android/Message;->sender:I

    .line 1142
    move-object/from16 v0, v18

    move-object/from16 v1, p5

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/Message;->setText(Ljava/lang/String;)V

    .line 1143
    move/from16 v0, p8

    move-object/from16 v1, v18

    iput v0, v1, Lcom/vkontakte/android/Message;->randomId:I

    .line 1144
    move/from16 v0, p4

    move-object/from16 v1, v18

    iput v0, v1, Lcom/vkontakte/android/Message;->time:I

    .line 1145
    move/from16 v0, p1

    move-object/from16 v1, v18

    iput v0, v1, Lcom/vkontakte/android/Message;->id:I

    .line 1146
    move/from16 v0, v16

    move-object/from16 v1, v18

    iput-boolean v0, v1, Lcom/vkontakte/android/Message;->out:Z

    .line 1147
    const/4 v3, 0x0

    move-object/from16 v0, v18

    iput-boolean v3, v0, Lcom/vkontakte/android/Message;->readState:Z

    .line 1148
    const v3, 0x77359400

    move/from16 v0, p2

    if-le v0, v3, :cond_d

    .line 1149
    move-object/from16 v0, p6

    move-object/from16 v1, v18

    iput-object v0, v1, Lcom/vkontakte/android/Message;->title:Ljava/lang/String;

    .line 1151
    :cond_d
    if-eqz p7, :cond_4

    .line 1152
    const-string/jumbo v3, "source_act"

    move-object/from16 v0, p7

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 1153
    const-string/jumbo v3, "source_act"

    move-object/from16 v0, p7

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 1154
    .local v8, "act":Ljava/lang/String;
    const-string/jumbo v3, "action"

    move-object/from16 v0, v18

    invoke-virtual {v0, v3, v8}, Lcom/vkontakte/android/Message;->putStringExtra(Ljava/lang/String;Ljava/lang/String;)V

    .line 1155
    const-string/jumbo v3, "chat_invite_user"

    invoke-virtual {v3, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_e

    const-string/jumbo v3, "chat_kick_user"

    invoke-virtual {v3, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_f

    .line 1156
    :cond_e
    const-string/jumbo v3, "source_mid"

    move-object/from16 v0, p7

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v27

    .line 1157
    .local v27, "uid":I
    const-string/jumbo v3, "action_mid"

    move-object/from16 v0, v18

    move/from16 v1, v27

    invoke-virtual {v0, v3, v1}, Lcom/vkontakte/android/Message;->putIntExtra(Ljava/lang/String;I)V

    .line 1160
    .end local v27    # "uid":I
    :cond_f
    const-string/jumbo v3, "source_text"

    move-object/from16 v0, p7

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_10

    .line 1161
    const-string/jumbo v3, "action_text"

    const-string/jumbo v4, "source_text"

    move-object/from16 v0, p7

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v18

    invoke-virtual {v0, v3, v4}, Lcom/vkontakte/android/Message;->putStringExtra(Ljava/lang/String;Ljava/lang/String;)V

    .line 1163
    :cond_10
    const-string/jumbo v3, "source_email"

    move-object/from16 v0, p7

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 1164
    const-string/jumbo v3, "action_email"

    const-string/jumbo v4, "source_email"

    move-object/from16 v0, p7

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v18

    invoke-virtual {v0, v3, v4}, Lcom/vkontakte/android/Message;->putStringExtra(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_6

    .line 1178
    .end local v8    # "act":Ljava/lang/String;
    :cond_11
    new-instance v14, Landroid/content/Intent;

    const-string/jumbo v3, "com.vkontakte.android.NEW_MESSAGE"

    invoke-direct {v14, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1179
    .restart local v14    # "intent":Landroid/content/Intent;
    move-object/from16 v0, v18

    iget-object v3, v0, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    const-string/jumbo v4, "action_mid"

    invoke-virtual {v3, v4}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_12

    .line 1180
    move-object/from16 v0, v18

    iget-object v3, v0, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    const-string/jumbo v4, "action_mid"

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v9

    .line 1181
    .local v9, "actMid":I
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Integer;

    const/4 v4, 0x0

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    const/4 v4, 0x3

    invoke-static {v3, v4}, Lcom/vkontakte/android/data/Friends;->getUsersBlocking(Ljava/util/List;I)Ljava/util/ArrayList;

    move-result-object v30

    .line 1182
    .local v30, "users":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    const-string/jumbo v4, "action_user_name_acc"

    const/4 v3, 0x0

    move-object/from16 v0, v30

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/UserProfile;

    iget-object v3, v3, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-virtual {v14, v4, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1183
    const-string/jumbo v4, "action_user_name_acc"

    const/4 v3, 0x0

    move-object/from16 v0, v30

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/UserProfile;

    iget-object v3, v3, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    move-object/from16 v0, v18

    invoke-virtual {v0, v4, v3}, Lcom/vkontakte/android/Message;->putStringExtra(Ljava/lang/String;Ljava/lang/String;)V

    .line 1185
    .end local v9    # "actMid":I
    .end local v30    # "users":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    :cond_12
    sget-boolean v3, Lcom/vkontakte/android/LongPollService;->DEBUG:Z

    if-eqz v3, :cond_13

    .line 1186
    const-string/jumbo v3, "vk_longpoll"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Message: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v18

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1188
    :cond_13
    new-instance v19, Ljava/util/ArrayList;

    invoke-direct/range {v19 .. v19}, Ljava/util/ArrayList;-><init>()V

    .line 1189
    .local v19, "needUsers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1190
    invoke-static/range {v19 .. v19}, Lcom/vkontakte/android/data/Friends;->getUsersBlocking(Ljava/util/List;)Ljava/util/ArrayList;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v26

    check-cast v26, Lcom/vkontakte/android/UserProfile;

    .line 1191
    .local v26, "senderProfile":Lcom/vkontakte/android/UserProfile;
    if-nez v26, :cond_14

    .line 1192
    new-instance v26, Lcom/vkontakte/android/UserProfile;

    .end local v26    # "senderProfile":Lcom/vkontakte/android/UserProfile;
    invoke-direct/range {v26 .. v26}, Lcom/vkontakte/android/UserProfile;-><init>()V

    .line 1193
    .restart local v26    # "senderProfile":Lcom/vkontakte/android/UserProfile;
    move/from16 v0, v25

    move-object/from16 v1, v26

    iput v0, v1, Lcom/vkontakte/android/UserProfile;->uid:I

    .line 1194
    sget-object v3, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const v4, 0x7f08033d

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v26

    iput-object v3, v0, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    move-object/from16 v0, v26

    iput-object v3, v0, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    .line 1195
    const-string/jumbo v3, ""

    move-object/from16 v0, v26

    iput-object v3, v0, Lcom/vkontakte/android/UserProfile;->lastName:Ljava/lang/String;

    .line 1196
    const-string/jumbo v3, "http://vk.com/images/camera_100.gif"

    move-object/from16 v0, v26

    iput-object v3, v0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    .line 1198
    :cond_14
    const-string/jumbo v3, "sender_profile"

    move-object/from16 v0, v26

    invoke-virtual {v14, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 1199
    const-string/jumbo v3, "peer_id"

    move/from16 v0, p2

    invoke-virtual {v14, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1200
    const-string/jumbo v3, "message"

    move-object/from16 v0, v18

    invoke-virtual {v14, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 1201
    const-string/jumbo v3, "is_out"

    move/from16 v0, v16

    invoke-virtual {v14, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 1202
    const-string/jumbo v3, "sender_photo"

    move-object/from16 v0, v26

    iget-object v4, v0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-virtual {v14, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1203
    const/16 v22, 0x0

    .line 1204
    .local v22, "peerProfile":Lcom/vkontakte/android/UserProfile;
    const v3, 0x77359400

    move/from16 v0, p2

    if-ge v0, v3, :cond_15

    .line 1205
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Integer;

    const/4 v4, 0x0

    invoke-static/range {p2 .. p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-static {v3}, Lcom/vkontakte/android/data/Friends;->getUsersBlocking(Ljava/util/List;)Ljava/util/ArrayList;

    move-result-object v23

    .line 1206
    .local v23, "pp":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    const-string/jumbo v3, "peer_profile"

    const/4 v4, 0x0

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v22

    .end local v22    # "peerProfile":Lcom/vkontakte/android/UserProfile;
    check-cast v22, Lcom/vkontakte/android/UserProfile;

    .restart local v22    # "peerProfile":Lcom/vkontakte/android/UserProfile;
    move-object/from16 v0, v22

    invoke-virtual {v14, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 1209
    .end local v23    # "pp":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    :cond_15
    if-eqz v16, :cond_16

    move-object/from16 v0, v18

    iget v3, v0, Lcom/vkontakte/android/Message;->id:I

    invoke-static {v3}, Lcom/vkontakte/android/cache/Cache;->containsMessage(I)Z

    move-result v3

    if-eqz v3, :cond_16

    .line 1210
    move-object/from16 v0, v26

    iget-object v3, v0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    move-object/from16 v0, v18

    move-object/from16 v1, v22

    invoke-static {v0, v1, v3}, Lcom/vkontakte/android/data/Messages;->add(Lcom/vkontakte/android/Message;Lcom/vkontakte/android/UserProfile;Ljava/lang/String;)V

    goto/16 :goto_7

    .line 1213
    :cond_16
    move-object/from16 v0, v26

    iget-object v3, v0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    move-object/from16 v0, v18

    move-object/from16 v1, v22

    invoke-static {v0, v1, v3}, Lcom/vkontakte/android/data/Messages;->add(Lcom/vkontakte/android/Message;Lcom/vkontakte/android/UserProfile;Ljava/lang/String;)V

    .line 1215
    const-string/jumbo v3, "com.vkontakte.android.permission.ACCESS_DATA"

    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v3}, Lcom/vkontakte/android/LongPollService;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 1216
    move-object/from16 v0, v18

    iget-object v3, v0, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    const-string/jumbo v4, "action"

    invoke-virtual {v3, v4}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_17

    .line 1217
    const v3, 0x77359400

    sub-int v3, p2, v3

    invoke-static {v3}, Lcom/vkontakte/android/cache/Cache;->setNeedUpdateChat(I)V

    .line 1218
    new-instance v15, Landroid/content/Intent;

    const-string/jumbo v3, "com.vkontakte.android.CHAT_CHANGED"

    invoke-direct {v15, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1219
    .local v15, "intent1":Landroid/content/Intent;
    const-string/jumbo v3, "id"

    move-object/from16 v0, v18

    iget v4, v0, Lcom/vkontakte/android/Message;->peer:I

    const v5, 0x77359400

    sub-int/2addr v4, v5

    invoke-virtual {v15, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1221
    const-string/jumbo v3, "com.vkontakte.android.permission.ACCESS_DATA"

    move-object/from16 v0, p0

    invoke-virtual {v0, v15, v3}, Lcom/vkontakte/android/LongPollService;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 1222
    const-string/jumbo v3, "chat_title_update"

    move-object/from16 v0, v18

    iget-object v4, v0, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    const-string/jumbo v5, "action"

    invoke-virtual {v4, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_17

    .line 1223
    const v3, 0x77359400

    sub-int v3, p2, v3

    move-object/from16 v0, v18

    iget-object v4, v0, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    const-string/jumbo v5, "action_text"

    invoke-virtual {v4, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v7, 0x0

    invoke-static {v3, v4, v5, v7}, Lcom/vkontakte/android/cache/Cache;->updateChat(ILjava/lang/String;Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 1227
    .end local v15    # "intent1":Landroid/content/Intent;
    :cond_17
    if-nez v16, :cond_6

    .line 1228
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/vkontakte/android/LongPollService;->newSystem:Z

    if-nez v3, :cond_18

    .line 1229
    invoke-static {}, Lcom/vkontakte/android/LongPollService;->getNumNewMessages()I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    invoke-static {v3}, Lcom/vkontakte/android/LongPollService;->setNumNewMessages(I)V

    .line 1230
    new-instance v3, Landroid/content/Intent;

    const-string/jumbo v4, "com.vkontakte.android.COUNTERS_UPDATED"

    invoke-direct {v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string/jumbo v4, "com.vkontakte.android.permission.ACCESS_DATA"

    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v4}, Lcom/vkontakte/android/LongPollService;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 1232
    :cond_18
    new-instance v14, Landroid/content/Intent;

    .end local v14    # "intent":Landroid/content/Intent;
    const-string/jumbo v3, "com.vkontakte.android.TYPING"

    invoke-direct {v14, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1233
    .restart local v14    # "intent":Landroid/content/Intent;
    const-string/jumbo v3, "uid"

    move/from16 v0, p2

    invoke-virtual {v14, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1234
    const v3, 0x77359400

    move/from16 v0, p2

    if-le v0, v3, :cond_19

    .line 1235
    const-string/jumbo v3, "user"

    move/from16 v0, v25

    invoke-virtual {v14, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1237
    :cond_19
    const-string/jumbo v3, "stop"

    const/4 v4, 0x1

    invoke-virtual {v14, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 1238
    const-string/jumbo v3, "com.vkontakte.android.permission.ACCESS_DATA"

    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v3}, Lcom/vkontakte/android/LongPollService;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 1240
    sput-object v26, Lcom/vkontakte/android/LongPollService;->realLastProfile:Lcom/vkontakte/android/UserProfile;

    .line 1241
    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/vkontakte/android/Message;->text:Ljava/lang/String;

    move-object/from16 v21, v0

    .line 1242
    .local v21, "notifyText":Ljava/lang/String;
    move-object/from16 v0, v18

    iget-boolean v3, v0, Lcom/vkontakte/android/Message;->isServiceMessage:Z

    if-eqz v3, :cond_1a

    move-object/from16 v0, v18

    iget-object v3, v0, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    const-string/jumbo v4, "action"

    invoke-virtual {v3, v4}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1a

    .line 1243
    move-object/from16 v0, v18

    iget-object v3, v0, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    const-string/jumbo v4, "action_user_name_acc"

    invoke-virtual {v3, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v18

    move-object/from16 v1, v26

    invoke-virtual {v0, v1, v3}, Lcom/vkontakte/android/Message;->getServiceMessageText(Lcom/vkontakte/android/UserProfile;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    .line 1247
    :cond_1a
    move-object/from16 v0, v18

    iget-object v3, v0, Lcom/vkontakte/android/Message;->attachments:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_1e

    move-object/from16 v0, v18

    iget-object v3, v0, Lcom/vkontakte/android/Message;->fwdMessages:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_1e

    const/4 v12, 0x1

    .line 1248
    .local v12, "hasDifferentAttachmentsType":Z
    :goto_8
    if-nez v12, :cond_1b

    .line 1249
    move-object/from16 v0, v18

    iget-object v3, v0, Lcom/vkontakte/android/Message;->attachments:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    const/4 v4, 0x1

    if-le v3, v4, :cond_1b

    .line 1250
    const/4 v13, 0x1

    .local v13, "i":I
    :goto_9
    move-object/from16 v0, v18

    iget-object v3, v0, Lcom/vkontakte/android/Message;->attachments:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v13, v3, :cond_1b

    .line 1251
    move-object/from16 v0, v18

    iget-object v3, v0, Lcom/vkontakte/android/Message;->attachments:Ljava/util/List;

    invoke-interface {v3, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/attachments/Attachment;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    move-object/from16 v0, v18

    iget-object v3, v0, Lcom/vkontakte/android/Message;->attachments:Ljava/util/List;

    add-int/lit8 v5, v13, -0x1

    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/attachments/Attachment;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v4, v3, :cond_1f

    const/4 v12, 0x1

    .line 1252
    :goto_a
    if-eqz v12, :cond_20

    .line 1259
    .end local v13    # "i":I
    :cond_1b
    const/16 v20, 0x0

    .line 1260
    .local v20, "notifyAdd":Ljava/lang/String;
    if-eqz v12, :cond_21

    .line 1261
    sget-object v3, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const v4, 0x7f0800df

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v20

    .line 1272
    :cond_1c
    :goto_b
    invoke-static/range {v20 .. v20}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1d

    .line 1273
    invoke-static/range {v21 .. v21}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_25

    .line 1274
    move-object/from16 v21, v20

    .line 1280
    :cond_1d
    :goto_c
    invoke-static/range {v21 .. v21}, Lcom/vkontakte/android/LinkParser;->hasCurrentUserMention(Ljava/lang/String;)Z

    move-result v6

    .line 1281
    .local v6, "hasMention":Z
    invoke-static/range {v21 .. v21}, Lcom/vkontakte/android/Global;->replaceEmojiModifiers(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/vkontakte/android/LinkParser;->stripMentions(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1282
    .local v2, "message":Ljava/lang/String;
    move-object/from16 v0, v18

    iget v3, v0, Lcom/vkontakte/android/Message;->peer:I

    const v4, 0x77359400

    if-le v3, v4, :cond_26

    move-object/from16 v3, p6

    :goto_d
    move-object/from16 v0, v26

    iget-object v4, v0, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    move-object/from16 v0, v26

    iget-object v5, v0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    move-object/from16 v0, v18

    iget v7, v0, Lcom/vkontakte/android/Message;->peer:I

    invoke-static/range {v2 .. v7}, Lcom/vkontakte/android/LongPollService;->updateNotification(Ljava/lang/CharSequence;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZI)V

    goto/16 :goto_7

    .line 1247
    .end local v2    # "message":Ljava/lang/String;
    .end local v6    # "hasMention":Z
    .end local v12    # "hasDifferentAttachmentsType":Z
    .end local v20    # "notifyAdd":Ljava/lang/String;
    :cond_1e
    const/4 v12, 0x0

    goto :goto_8

    .line 1251
    .restart local v12    # "hasDifferentAttachmentsType":Z
    .restart local v13    # "i":I
    :cond_1f
    const/4 v12, 0x0

    goto :goto_a

    .line 1250
    :cond_20
    add-int/lit8 v13, v13, 0x1

    goto :goto_9

    .line 1262
    .end local v13    # "i":I
    .restart local v20    # "notifyAdd":Ljava/lang/String;
    :cond_21
    move-object/from16 v0, v18

    iget-object v3, v0, Lcom/vkontakte/android/Message;->attachments:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_24

    move-object/from16 v0, v18

    iget-boolean v3, v0, Lcom/vkontakte/android/Message;->isServiceMessage:Z

    if-nez v3, :cond_24

    .line 1263
    move-object/from16 v0, v18

    iget-object v3, v0, Lcom/vkontakte/android/Message;->attachments:Ljava/util/List;

    const/4 v4, 0x0

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/vkontakte/android/attachments/Attachment;

    .line 1264
    .local v10, "att":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v3, v10, Lcom/vkontakte/android/attachments/GiftAttachment;

    if-eqz v3, :cond_23

    .line 1265
    sget-object v3, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    move-object/from16 v0, v26

    iget-boolean v3, v0, Lcom/vkontakte/android/UserProfile;->f:Z

    if-eqz v3, :cond_22

    const v3, 0x7f08041b

    :goto_e
    invoke-virtual {v4, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v21

    goto :goto_b

    :cond_22
    const v3, 0x7f08041c

    goto :goto_e

    .line 1267
    :cond_23
    move-object/from16 v0, v18

    iget-object v3, v0, Lcom/vkontakte/android/Message;->attachments:Ljava/util/List;

    invoke-static {v3}, Lcom/vkontakte/android/attachments/Attachment;->getLocalizedDescription(Ljava/util/List;)Ljava/lang/String;

    move-result-object v20

    goto :goto_b

    .line 1269
    .end local v10    # "att":Lcom/vkontakte/android/attachments/Attachment;
    :cond_24
    move-object/from16 v0, v18

    iget-object v3, v0, Lcom/vkontakte/android/Message;->fwdMessages:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_1c

    .line 1270
    sget-object v3, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0d003d

    move-object/from16 v0, v18

    iget-object v5, v0, Lcom/vkontakte/android/Message;->fwdMessages:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/16 v32, 0x0

    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/vkontakte/android/Message;->fwdMessages:Ljava/util/List;

    move-object/from16 v33, v0

    invoke-interface/range {v33 .. v33}, Ljava/util/List;->size()I

    move-result v33

    invoke-static/range {v33 .. v33}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v33

    aput-object v33, v7, v32

    invoke-virtual {v3, v4, v5, v7}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v20

    goto/16 :goto_b

    .line 1276
    :cond_25
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v21

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v20

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1

    move-result-object v21

    goto/16 :goto_c

    .line 1282
    .restart local v2    # "message":Ljava/lang/String;
    .restart local v6    # "hasMention":Z
    :cond_26
    const/4 v3, 0x0

    goto/16 :goto_d
.end method

.method private processMessageUpdate(IIIILjava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;I)V
    .locals 24
    .param p1, "mid"    # I
    .param p2, "peer"    # I
    .param p3, "flags"    # I
    .param p4, "time"    # I
    .param p5, "text"    # Ljava/lang/String;
    .param p6, "subject"    # Ljava/lang/String;
    .param p7, "extra"    # Lorg/json/JSONObject;
    .param p8, "randomId"    # I

    .prologue
    .line 1292
    sget-boolean v19, Lcom/vkontakte/android/LongPollService;->DEBUG:Z

    if-eqz v19, :cond_0

    .line 1293
    const-string/jumbo v19, "vk_longpoll"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v21, "processMessageUpdate: id="

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string/jumbo v21, ", flags="

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move/from16 v1, p3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string/jumbo v21, ", peer="

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string/jumbo v21, ", time="

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move/from16 v1, p4

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string/jumbo v21, ", subject=\'"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, p6

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string/jumbo v21, "\', text=\'"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, p5

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string/jumbo v21, "\', extra="

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, p7

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string/jumbo v21, "\', randomId="

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move/from16 v1, p8

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1296
    :cond_0
    and-int/lit8 v19, p3, 0x2

    if-lez v19, :cond_6

    const/4 v7, 0x1

    .line 1298
    .local v7, "isOut":Z
    :goto_0
    :try_start_0
    sget-object v19, Lcom/vkontakte/android/LongPollService;->addMessage:Ljava/util/concurrent/Semaphore;

    invoke-virtual/range {v19 .. v19}, Ljava/util/concurrent/Semaphore;->acquire()V

    .line 1299
    sget-object v19, Lcom/vkontakte/android/LongPollService;->addMessage:Ljava/util/concurrent/Semaphore;

    invoke-virtual/range {v19 .. v19}, Ljava/util/concurrent/Semaphore;->release()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1305
    :goto_1
    const v19, 0x77359400

    move/from16 v0, p2

    move/from16 v1, v19

    if-ge v0, v1, :cond_8

    .line 1306
    if-eqz v7, :cond_7

    :try_start_1
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v14

    .line 1311
    .local v14, "sender":I
    :goto_2
    if-eqz p7, :cond_a

    const-string/jumbo v19, "attach1_type"

    move-object/from16 v0, p7

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v19

    if-nez v19, :cond_1

    const-string/jumbo v19, "fwd"

    move-object/from16 v0, p7

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v19

    if-nez v19, :cond_1

    const-string/jumbo v19, "geo"

    move-object/from16 v0, p7

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_a

    .line 1312
    :cond_1
    sget-boolean v19, Lcom/vkontakte/android/LongPollService;->DEBUG:Z

    if-eqz v19, :cond_2

    .line 1313
    const-string/jumbo v19, "vk_longpoll"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v21, "will get message "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string/jumbo v21, " from api"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1315
    :cond_2
    new-instance v5, Lcom/vkontakte/android/api/VKAPIRequest;

    const-string/jumbo v19, "messages.getById"

    move-object/from16 v0, v19

    invoke-direct {v5, v0}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 1316
    .local v5, "getMsg":Lcom/vkontakte/android/api/VKAPIRequest;
    const-string/jumbo v19, "message_ids"

    move-object/from16 v0, v19

    move/from16 v1, p1

    invoke-virtual {v5, v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v19

    const-string/jumbo v20, "photo_sizes"

    const/16 v21, 0x1

    invoke-virtual/range {v19 .. v21}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v19

    const-string/jumbo v20, "fields"

    const-string/jumbo v21, "first_name,last_name,photo_100,photo_50"

    invoke-virtual/range {v19 .. v21}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 1318
    :try_start_2
    const-class v19, Lcom/vkontakte/android/LongPollService;

    const-string/jumbo v20, "processFailedMessageUpdateCallback"

    const/16 v21, 0x2

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    const-class v23, Lorg/json/JSONObject;

    aput-object v23, v21, v22

    const/16 v22, 0x1

    const-class v23, Lorg/json/JSONObject;

    aput-object v23, v21, v22

    invoke-virtual/range {v19 .. v21}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v19

    const/16 v20, 0x0

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v5, v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->persist(Ljava/lang/reflect/Method;Lorg/json/JSONObject;)Lcom/vkontakte/android/api/VKAPIRequest;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 1322
    :goto_3
    :try_start_3
    invoke-static {v5}, Lcom/vkontakte/android/api/APIController;->runRequest(Lcom/vkontakte/android/api/VKAPIRequest;)Lorg/json/JSONObject;

    move-result-object v13

    .line 1323
    .local v13, "res":Lorg/json/JSONObject;
    if-eqz v13, :cond_9

    const-string/jumbo v19, "response"

    move-object/from16 v0, v19

    invoke-virtual {v13, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_9

    .line 1324
    const-string/jumbo v19, "response"

    move-object/from16 v0, v19

    invoke-static {v13, v0}, Lcom/vkontakte/android/api/APIUtils;->unwrapArray(Lorg/json/JSONObject;Ljava/lang/String;)Lcom/vkontakte/android/api/JSONArrayWithCount;

    move-result-object v19

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/api/JSONArrayWithCount;->array:Lorg/json/JSONArray;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    invoke-virtual/range {v19 .. v20}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v8

    .line 1325
    .local v8, "jmsg":Lorg/json/JSONObject;
    new-instance v9, Lcom/vkontakte/android/Message;

    invoke-direct {v9, v8}, Lcom/vkontakte/android/Message;-><init>(Lorg/json/JSONObject;)V

    .line 1360
    .end local v5    # "getMsg":Lcom/vkontakte/android/api/VKAPIRequest;
    .end local v8    # "jmsg":Lorg/json/JSONObject;
    .end local v13    # "res":Lorg/json/JSONObject;
    .local v9, "msg":Lcom/vkontakte/android/Message;
    :cond_3
    :goto_4
    iget-object v0, v9, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    move-object/from16 v19, v0

    const-string/jumbo v20, "action"

    invoke-virtual/range {v19 .. v20}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_4

    .line 1361
    const/16 v19, 0x1

    move/from16 v0, v19

    iput-boolean v0, v9, Lcom/vkontakte/android/Message;->isServiceMessage:Z

    .line 1364
    :cond_4
    iget-boolean v0, v9, Lcom/vkontakte/android/Message;->out:Z

    move/from16 v19, v0

    if-eqz v19, :cond_f

    iget-boolean v0, v9, Lcom/vkontakte/android/Message;->isServiceMessage:Z

    move/from16 v19, v0

    if-nez v19, :cond_f

    sget-object v19, Lcom/vkontakte/android/LongPollService;->sendingMessages:Ljava/util/ArrayList;

    invoke-virtual/range {v19 .. v19}, Ljava/util/ArrayList;->size()I

    move-result v19

    if-lez v19, :cond_f

    .line 1365
    sget-object v19, Lcom/vkontakte/android/LongPollService;->pendingReceivedMessages:Ljava/util/ArrayList;

    move-object/from16 v0, v19

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1408
    .end local v9    # "msg":Lcom/vkontakte/android/Message;
    .end local v14    # "sender":I
    :cond_5
    :goto_5
    return-void

    .line 1296
    .end local v7    # "isOut":Z
    :cond_6
    const/4 v7, 0x0

    goto/16 :goto_0

    .line 1300
    .restart local v7    # "isOut":Z
    :catch_0
    move-exception v18

    .line 1301
    .local v18, "x":Ljava/lang/Exception;
    const/16 v19, 0x0

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v19, v0

    invoke-static/range {v18 .. v19}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    goto/16 :goto_1

    .line 1405
    .end local v18    # "x":Ljava/lang/Exception;
    :catch_1
    move-exception v18

    .line 1406
    .restart local v18    # "x":Ljava/lang/Exception;
    const-string/jumbo v19, "vk_longpoll"

    const-string/jumbo v20, "Error processing message"

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, v18

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_5

    .end local v18    # "x":Ljava/lang/Exception;
    :cond_7
    move/from16 v14, p2

    .line 1306
    goto/16 :goto_2

    .line 1308
    :cond_8
    :try_start_4
    const-string/jumbo v19, "from"

    move-object/from16 v0, p7

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v14

    .restart local v14    # "sender":I
    goto/16 :goto_2

    .line 1319
    .restart local v5    # "getMsg":Lcom/vkontakte/android/api/VKAPIRequest;
    :catch_2
    move-exception v18

    .line 1320
    .restart local v18    # "x":Ljava/lang/Exception;
    const/16 v19, 0x0

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v19, v0

    invoke-static/range {v18 .. v19}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto/16 :goto_3

    .line 1327
    .end local v18    # "x":Ljava/lang/Exception;
    .restart local v13    # "res":Lorg/json/JSONObject;
    :cond_9
    const-string/jumbo v19, "vk_longpoll"

    const-string/jumbo v20, "Error getting full message"

    invoke-static/range {v19 .. v20}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_5

    .line 1331
    .end local v5    # "getMsg":Lcom/vkontakte/android/api/VKAPIRequest;
    .end local v13    # "res":Lorg/json/JSONObject;
    :cond_a
    new-instance v9, Lcom/vkontakte/android/Message;

    invoke-direct {v9}, Lcom/vkontakte/android/Message;-><init>()V

    .line 1332
    .restart local v9    # "msg":Lcom/vkontakte/android/Message;
    move/from16 v0, p2

    iput v0, v9, Lcom/vkontakte/android/Message;->peer:I

    .line 1333
    iput v14, v9, Lcom/vkontakte/android/Message;->sender:I

    .line 1334
    move-object/from16 v0, p5

    invoke-virtual {v9, v0}, Lcom/vkontakte/android/Message;->setText(Ljava/lang/String;)V

    .line 1335
    move/from16 v0, p8

    iput v0, v9, Lcom/vkontakte/android/Message;->randomId:I

    .line 1336
    move/from16 v0, p4

    iput v0, v9, Lcom/vkontakte/android/Message;->time:I

    .line 1337
    move/from16 v0, p1

    iput v0, v9, Lcom/vkontakte/android/Message;->id:I

    .line 1338
    iput-boolean v7, v9, Lcom/vkontakte/android/Message;->out:Z

    .line 1339
    const/16 v19, 0x0

    move/from16 v0, v19

    iput-boolean v0, v9, Lcom/vkontakte/android/Message;->readState:Z

    .line 1340
    const v19, 0x77359400

    move/from16 v0, p2

    move/from16 v1, v19

    if-le v0, v1, :cond_b

    .line 1341
    move-object/from16 v0, p6

    iput-object v0, v9, Lcom/vkontakte/android/Message;->title:Ljava/lang/String;

    .line 1343
    :cond_b
    if-eqz p7, :cond_3

    .line 1344
    const-string/jumbo v19, "source_act"

    move-object/from16 v0, p7

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_3

    .line 1345
    const-string/jumbo v19, "source_act"

    move-object/from16 v0, p7

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1346
    .local v3, "act":Ljava/lang/String;
    const-string/jumbo v19, "action"

    move-object/from16 v0, v19

    invoke-virtual {v9, v0, v3}, Lcom/vkontakte/android/Message;->putStringExtra(Ljava/lang/String;Ljava/lang/String;)V

    .line 1347
    const-string/jumbo v19, "chat_invite_user"

    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_c

    const-string/jumbo v19, "chat_kick_user"

    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_d

    .line 1348
    :cond_c
    const-string/jumbo v19, "source_mid"

    move-object/from16 v0, p7

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v16

    .line 1349
    .local v16, "uid":I
    const-string/jumbo v19, "action_mid"

    move-object/from16 v0, v19

    move/from16 v1, v16

    invoke-virtual {v9, v0, v1}, Lcom/vkontakte/android/Message;->putIntExtra(Ljava/lang/String;I)V

    .line 1351
    .end local v16    # "uid":I
    :cond_d
    const-string/jumbo v19, "source_text"

    move-object/from16 v0, p7

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_e

    .line 1352
    const-string/jumbo v19, "action_text"

    const-string/jumbo v20, "source_text"

    move-object/from16 v0, p7

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v9, v0, v1}, Lcom/vkontakte/android/Message;->putStringExtra(Ljava/lang/String;Ljava/lang/String;)V

    .line 1354
    :cond_e
    const-string/jumbo v19, "source_email"

    move-object/from16 v0, p7

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_3

    .line 1355
    const-string/jumbo v19, "action_email"

    const-string/jumbo v20, "source_email"

    move-object/from16 v0, p7

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v9, v0, v1}, Lcom/vkontakte/android/Message;->putStringExtra(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_4

    .line 1369
    .end local v3    # "act":Ljava/lang/String;
    :cond_f
    new-instance v6, Landroid/content/Intent;

    const-string/jumbo v19, "com.vkontakte.android.UPDATE_MESSAGE"

    move-object/from16 v0, v19

    invoke-direct {v6, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1370
    .local v6, "intent":Landroid/content/Intent;
    iget-object v0, v9, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    move-object/from16 v19, v0

    const-string/jumbo v20, "action_mid"

    invoke-virtual/range {v19 .. v20}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_10

    .line 1371
    iget-object v0, v9, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    move-object/from16 v19, v0

    const-string/jumbo v20, "action_mid"

    const/16 v21, 0x0

    invoke-virtual/range {v19 .. v21}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v4

    .line 1372
    .local v4, "actMid":I
    const/16 v19, 0x1

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/Integer;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v21

    aput-object v21, v19, v20

    invoke-static/range {v19 .. v19}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v19

    const/16 v20, 0x3

    invoke-static/range {v19 .. v20}, Lcom/vkontakte/android/data/Friends;->getUsersBlocking(Ljava/util/List;I)Ljava/util/ArrayList;

    move-result-object v17

    .line 1373
    .local v17, "users":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    const-string/jumbo v20, "action_user_name_acc"

    const/16 v19, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lcom/vkontakte/android/UserProfile;

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v19

    invoke-virtual {v6, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1374
    const-string/jumbo v20, "action_user_name_acc"

    const/16 v19, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lcom/vkontakte/android/UserProfile;

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v19

    invoke-virtual {v9, v0, v1}, Lcom/vkontakte/android/Message;->putStringExtra(Ljava/lang/String;Ljava/lang/String;)V

    .line 1376
    .end local v4    # "actMid":I
    .end local v17    # "users":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    :cond_10
    sget-boolean v19, Lcom/vkontakte/android/LongPollService;->DEBUG:Z

    if-eqz v19, :cond_11

    .line 1377
    const-string/jumbo v19, "vk_longpoll"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v21, "Message: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1379
    :cond_11
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 1380
    .local v10, "needUsers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v10, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1381
    invoke-static {v10}, Lcom/vkontakte/android/data/Friends;->getUsersBlocking(Ljava/util/List;)Ljava/util/ArrayList;

    move-result-object v19

    const/16 v20, 0x0

    invoke-virtual/range {v19 .. v20}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/vkontakte/android/UserProfile;

    .line 1382
    .local v15, "senderProfile":Lcom/vkontakte/android/UserProfile;
    if-nez v15, :cond_12

    .line 1383
    new-instance v15, Lcom/vkontakte/android/UserProfile;

    .end local v15    # "senderProfile":Lcom/vkontakte/android/UserProfile;
    invoke-direct {v15}, Lcom/vkontakte/android/UserProfile;-><init>()V

    .line 1384
    .restart local v15    # "senderProfile":Lcom/vkontakte/android/UserProfile;
    iput v14, v15, Lcom/vkontakte/android/UserProfile;->uid:I

    .line 1385
    sget-object v19, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const v20, 0x7f08033d

    invoke-virtual/range {v19 .. v20}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    iput-object v0, v15, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    move-object/from16 v0, v19

    iput-object v0, v15, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    .line 1386
    const-string/jumbo v19, ""

    move-object/from16 v0, v19

    iput-object v0, v15, Lcom/vkontakte/android/UserProfile;->lastName:Ljava/lang/String;

    .line 1387
    const-string/jumbo v19, "http://vk.com/images/camera_100.gif"

    move-object/from16 v0, v19

    iput-object v0, v15, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    .line 1389
    :cond_12
    const-string/jumbo v19, "sender_profile"

    move-object/from16 v0, v19

    invoke-virtual {v6, v0, v15}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 1390
    const-string/jumbo v19, "peer_id"

    move-object/from16 v0, v19

    move/from16 v1, p2

    invoke-virtual {v6, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1391
    const-string/jumbo v19, "message"

    move-object/from16 v0, v19

    invoke-virtual {v6, v0, v9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 1392
    const-string/jumbo v19, "is_out"

    move-object/from16 v0, v19

    invoke-virtual {v6, v0, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 1393
    const-string/jumbo v19, "sender_photo"

    iget-object v0, v15, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    move-object/from16 v20, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v6, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1394
    const/4 v11, 0x0

    .line 1395
    .local v11, "peerProfile":Lcom/vkontakte/android/UserProfile;
    const v19, 0x77359400

    move/from16 v0, p2

    move/from16 v1, v19

    if-ge v0, v1, :cond_13

    .line 1396
    const/16 v19, 0x1

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/Integer;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    invoke-static/range {p2 .. p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v21

    aput-object v21, v19, v20

    invoke-static/range {v19 .. v19}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v19

    invoke-static/range {v19 .. v19}, Lcom/vkontakte/android/data/Friends;->getUsersBlocking(Ljava/util/List;)Ljava/util/ArrayList;

    move-result-object v12

    .line 1397
    .local v12, "pp":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    const-string/jumbo v19, "peer_profile"

    const/16 v20, 0x0

    move/from16 v0, v20

    invoke-virtual {v12, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    .end local v11    # "peerProfile":Lcom/vkontakte/android/UserProfile;
    check-cast v11, Lcom/vkontakte/android/UserProfile;

    .restart local v11    # "peerProfile":Lcom/vkontakte/android/UserProfile;
    move-object/from16 v0, v19

    invoke-virtual {v6, v0, v11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 1400
    .end local v12    # "pp":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    :cond_13
    iget v0, v9, Lcom/vkontakte/android/Message;->id:I

    move/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/vkontakte/android/cache/Cache;->containsMessage(I)Z

    move-result v19

    if-eqz v19, :cond_5

    .line 1401
    iget-object v0, v15, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-static {v9, v11, v0}, Lcom/vkontakte/android/data/Messages;->add(Lcom/vkontakte/android/Message;Lcom/vkontakte/android/UserProfile;Ljava/lang/String;)V

    .line 1402
    const-string/jumbo v19, "com.vkontakte.android.permission.ACCESS_DATA"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v6, v1}, Lcom/vkontakte/android/LongPollService;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    goto/16 :goto_5
.end method

.method private processNotifySettings(Lorg/json/JSONObject;)V
    .locals 10
    .param p1, "settings"    # Lorg/json/JSONObject;

    .prologue
    const v9, 0x77359400

    const/4 v2, 0x1

    const/4 v6, 0x0

    .line 1440
    :try_start_0
    const-string/jumbo v7, "peer_id"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    .line 1441
    .local v3, "peer":I
    const-string/jumbo v7, "sound"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v7

    if-eq v7, v2, :cond_1

    .line 1442
    .local v2, "mute":Z
    :goto_0
    const-string/jumbo v6, "disabled_until"

    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    .line 1443
    .local v0, "dnd":I
    const-string/jumbo v6, "notify"

    const/4 v7, 0x0

    invoke-virtual {p0, v6, v7}, Lcom/vkontakte/android/LongPollService;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    .line 1444
    .local v4, "prefs":Landroid/content/SharedPreferences;
    const/4 v6, -0x1

    if-ne v0, v6, :cond_0

    .line 1445
    const v0, 0x7fffffff

    .line 1447
    :cond_0
    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "mute"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "dnd"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7, v0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    invoke-interface {v6}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 1448
    if-le v3, v9, :cond_2

    .line 1449
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v6, "com.vkontakte.android.CHAT_CHANGED"

    invoke-direct {v1, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1450
    .local v1, "intent":Landroid/content/Intent;
    const-string/jumbo v6, "id"

    sub-int v7, v3, v9

    invoke-virtual {v1, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1451
    sget-object v6, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const-string/jumbo v7, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v6, v1, v7}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 1460
    .end local v0    # "dnd":I
    .end local v1    # "intent":Landroid/content/Intent;
    .end local v2    # "mute":Z
    .end local v3    # "peer":I
    .end local v4    # "prefs":Landroid/content/SharedPreferences;
    :goto_1
    return-void

    .restart local v3    # "peer":I
    :cond_1
    move v2, v6

    .line 1441
    goto :goto_0

    .line 1453
    .restart local v0    # "dnd":I
    .restart local v2    # "mute":Z
    .restart local v4    # "prefs":Landroid/content/SharedPreferences;
    :cond_2
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v6, "com.vkontakte.android.DIALOG_CHANGED"

    invoke-direct {v1, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1454
    .restart local v1    # "intent":Landroid/content/Intent;
    const-string/jumbo v6, "id"

    invoke-virtual {v1, v6, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1455
    sget-object v6, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const-string/jumbo v7, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v6, v1, v7}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 1457
    .end local v0    # "dnd":I
    .end local v1    # "intent":Landroid/content/Intent;
    .end local v2    # "mute":Z
    .end local v3    # "peer":I
    .end local v4    # "prefs":Landroid/content/SharedPreferences;
    :catch_0
    move-exception v5

    .line 1458
    .local v5, "x":Ljava/lang/Exception;
    const-string/jumbo v6, "vk"

    invoke-static {v6, v5}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method private processOnlineChange(II)V
    .locals 2
    .param p1, "uid"    # I
    .param p2, "online"    # I

    .prologue
    .line 861
    invoke-static {p1, p2}, Lcom/vkontakte/android/data/Friends;->setOnlineStatus(II)V

    .line 863
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "com.vkontakte.android.USER_PRESENCE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 864
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "uid"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 865
    const-string/jumbo v1, "online"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 866
    const-string/jumbo v1, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/LongPollService;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 867
    return-void
.end method

.method private processReadUpto(IIZ)V
    .locals 3
    .param p1, "peerID"    # I
    .param p2, "msgID"    # I
    .param p3, "in"    # Z

    .prologue
    .line 1411
    if-nez p3, :cond_0

    .line 1413
    :try_start_0
    sget-object v1, Lcom/vkontakte/android/LongPollService;->addOwnMessage:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->acquire()V

    .line 1414
    sget-object v1, Lcom/vkontakte/android/LongPollService;->addOwnMessage:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->release()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1419
    :cond_0
    :goto_0
    invoke-static {p1, p2, p3}, Lcom/vkontakte/android/data/Messages;->setReadStateUpto(IIZ)V

    .line 1420
    invoke-static {p1, p2, p3}, Lcom/vkontakte/android/LongPollService;->createActionMessageRSteteChangedIntent(IIZ)Landroid/content/Intent;

    move-result-object v1

    const-string/jumbo v2, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {p0, v1, v2}, Lcom/vkontakte/android/LongPollService;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 1421
    return-void

    .line 1415
    :catch_0
    move-exception v0

    .line 1416
    .local v0, "x":Ljava/lang/Exception;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method private processTyping(II)V
    .locals 8
    .param p1, "peerID"    # I
    .param p2, "userID"    # I

    .prologue
    .line 871
    int-to-long v0, p1

    .line 872
    .local v0, "id":J
    const v4, 0x77359400

    if-le p1, v4, :cond_0

    .line 873
    int-to-long v4, p2

    const/16 v6, 0x20

    shl-long/2addr v4, v6

    or-long/2addr v0, v4

    .line 876
    :cond_0
    :try_start_0
    iget-object v4, p0, Lcom/vkontakte/android/LongPollService;->typingLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v4}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 880
    :goto_0
    iget-object v4, p0, Lcom/vkontakte/android/LongPollService;->typings:Ljava/util/HashMap;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 881
    iget-object v4, p0, Lcom/vkontakte/android/LongPollService;->typingLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v4}, Ljava/util/concurrent/Semaphore;->release()V

    .line 882
    iget-object v4, p0, Lcom/vkontakte/android/LongPollService;->typingCancelThread:Lcom/vkontakte/android/background/WorkerThread;

    new-instance v5, Lcom/vkontakte/android/LongPollService$7;

    invoke-direct {v5, p0}, Lcom/vkontakte/android/LongPollService$7;-><init>(Lcom/vkontakte/android/LongPollService;)V

    const-wide/16 v6, 0x1bbc

    invoke-virtual {v4, v5, v6, v7}, Lcom/vkontakte/android/background/WorkerThread;->postRunnable(Ljava/lang/Runnable;J)V

    .line 908
    new-instance v2, Landroid/content/Intent;

    const-string/jumbo v4, "com.vkontakte.android.TYPING"

    invoke-direct {v2, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 909
    .local v2, "intent":Landroid/content/Intent;
    const-string/jumbo v4, "uid"

    invoke-virtual {v2, v4, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 910
    const-string/jumbo v4, "user"

    invoke-virtual {v2, v4, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 911
    const-string/jumbo v4, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {p0, v2, v4}, Lcom/vkontakte/android/LongPollService;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 912
    return-void

    .line 877
    .end local v2    # "intent":Landroid/content/Intent;
    :catch_0
    move-exception v3

    .line 878
    .local v3, "x":Ljava/lang/Exception;
    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v3, v4}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method private processUpdateCounter(I)V
    .locals 3
    .param p1, "counter"    # I

    .prologue
    const/4 v2, 0x1

    .line 1430
    iget-boolean v0, p0, Lcom/vkontakte/android/LongPollService;->newSystem:Z

    if-nez v0, :cond_0

    .line 1431
    iput-boolean v2, p0, Lcom/vkontakte/android/LongPollService;->newSystem:Z

    .line 1432
    const-string/jumbo v0, "longpoll"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/LongPollService;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "new_system"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 1434
    :cond_0
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/LongPollService;->setNumUnread(I)V

    .line 1435
    return-void
.end method

.method public static resetNotifications()V
    .locals 1

    .prologue
    .line 254
    const/4 v0, 0x0

    sput v0, Lcom/vkontakte/android/LongPollService;->numNotifications:I

    .line 255
    invoke-static {}, Lcom/vkontakte/android/LongPollService;->notifyCountersChanged()V

    .line 256
    return-void
.end method

.method private runLongPoll()V
    .locals 26

    .prologue
    .line 1463
    const-string/jumbo v2, "vk_longpoll"

    const-string/jumbo v3, "LongPoll starting"

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1464
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/LongPollService;->onlineTimer:Ljava/util/Timer;

    if-nez v2, :cond_0

    .line 1465
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LongPollService;->startSendingOnline()V

    .line 1467
    :cond_0
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/auth/VKAccount;->isReal()Z

    move-result v2

    if-nez v2, :cond_1

    .line 1468
    const-string/jumbo v2, "vk_longpoll"

    const-string/jumbo v3, "No user, stopping"

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1469
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LongPollService;->stopSelf()V

    .line 1642
    :goto_0
    return-void

    .line 1473
    :cond_1
    const/4 v15, 0x0

    .local v15, "nAttempts":I
    const/16 v23, 0x0

    .line 1476
    .local v23, "updateRetries":I
    const/16 v21, 0x0

    .line 1477
    .local v21, "serverUpdateSuccess":Z
    :cond_2
    :goto_1
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/vkontakte/android/LongPollService;->needStop:Z

    if-nez v2, :cond_14

    .line 1478
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/LongPollService;->server:Ljava/lang/String;

    if-eqz v2, :cond_3

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/LongPollService;->key:Ljava/lang/String;

    if-eqz v2, :cond_3

    if-nez v21, :cond_5

    .line 1479
    :cond_3
    const/4 v2, 0x0

    sput-boolean v2, Lcom/vkontakte/android/LongPollService;->connected:Z

    .line 1480
    invoke-static {}, Lcom/vkontakte/android/LongPollService;->broadcastStateChanged()V

    .line 1481
    const-string/jumbo v2, "vk_longpoll"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "no server info, force updating [retries="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, v23

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1482
    invoke-direct/range {p0 .. p0}, Lcom/vkontakte/android/LongPollService;->updateServerInfo()Z

    move-result v21

    .line 1483
    const-string/jumbo v2, "vk"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "success="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, v21

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1484
    add-int/lit8 v23, v23, 0x1

    .line 1485
    if-nez v21, :cond_2

    invoke-static {}, Lcom/vkontakte/android/NetworkStateReceiver;->isConnected()Z

    move-result v2

    if-eqz v2, :cond_4

    const/4 v2, 0x2

    move/from16 v0, v23

    if-lt v0, v2, :cond_2

    .line 1486
    :cond_4
    const/16 v23, 0x0

    .line 1487
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LongPollService;->stopSelf()V

    goto :goto_0

    .line 1493
    :cond_5
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "https://"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/LongPollService;->server:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "?act=a_check&key="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/LongPollService;->key:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "&ts="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p0

    iget v3, v0, Lcom/vkontakte/android/LongPollService;->ts:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "&wait=25&mode=234&version="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "1"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    .line 1495
    .local v24, "url":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/vkontakte/android/LongPollService;->needStop:Z

    if-eqz v2, :cond_6

    .line 1496
    const-string/jumbo v2, "vk_longpoll"

    const-string/jumbo v3, "LongPoll STOPPED"

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1500
    :cond_6
    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-direct {v0, v1}, Lcom/vkontakte/android/LongPollService;->getURL(Ljava/lang/String;)[B

    move-result-object v19

    .line 1501
    .local v19, "rdata":[B
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/vkontakte/android/LongPollService;->needStop:Z

    if-eqz v2, :cond_7

    .line 1502
    const-string/jumbo v2, "vk_longpoll"

    const-string/jumbo v3, "LongPoll STOPPED"

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1506
    :cond_7
    if-nez v19, :cond_b

    .line 1507
    sget-boolean v2, Lcom/vkontakte/android/LongPollService;->connected:Z

    if-eqz v2, :cond_8

    .line 1508
    const/4 v2, 0x0

    sput-boolean v2, Lcom/vkontakte/android/LongPollService;->connected:Z

    .line 1509
    invoke-static {}, Lcom/vkontakte/android/LongPollService;->broadcastStateChanged()V

    .line 1511
    :cond_8
    const/4 v2, 0x6

    if-lt v15, v2, :cond_a

    .line 1512
    invoke-static {}, Lcom/vkontakte/android/NetworkStateReceiver;->isConnected()Z

    move-result v2

    if-nez v2, :cond_9

    .line 1513
    const-string/jumbo v2, "vk_longpoll"

    const-string/jumbo v3, "No network connection, stopping longpoll"

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1514
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LongPollService;->stopSelf()V

    goto/16 :goto_0

    .line 1518
    :cond_9
    invoke-direct/range {p0 .. p0}, Lcom/vkontakte/android/LongPollService;->updateServerInfo()Z

    move-result v21

    .line 1519
    const/4 v15, 0x0

    .line 1520
    const-string/jumbo v2, "vk_longpoll"

    const-string/jumbo v3, "6 errors, reloading server info"

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 1523
    :cond_a
    const-string/jumbo v2, "vk_longpoll"

    const-string/jumbo v3, "Connection error. Retry in 5 sec"

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 1525
    const-wide/16 v2, 0x1388

    :try_start_0
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1529
    :goto_2
    add-int/lit8 v15, v15, 0x1

    .line 1530
    goto/16 :goto_1

    .line 1526
    :catch_0
    move-exception v25

    .line 1527
    .local v25, "x":Ljava/lang/Exception;
    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    move-object/from16 v0, v25

    invoke-static {v0, v2}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_2

    .line 1532
    .end local v25    # "x":Ljava/lang/Exception;
    :cond_b
    const/4 v2, 0x1

    sput-boolean v2, Lcom/vkontakte/android/LongPollService;->longPollActive:Z

    .line 1534
    :try_start_1
    new-instance v20, Ljava/lang/String;

    const-string/jumbo v2, "UTF-8"

    move-object/from16 v0, v20

    move-object/from16 v1, v19

    invoke-direct {v0, v1, v2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 1535
    .local v20, "resp":Ljava/lang/String;
    invoke-static/range {v20 .. v20}, Lcom/vkontakte/android/Global;->replaceHTML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    .line 1536
    sget-boolean v2, Lcom/vkontakte/android/LongPollService;->DEBUG:Z

    if-eqz v2, :cond_c

    .line 1537
    const-string/jumbo v2, "vk_longpoll"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Response: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v20

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1539
    :cond_c
    new-instance v2, Lorg/json/JSONTokener;

    move-object/from16 v0, v20

    invoke-direct {v2, v0}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lorg/json/JSONObject;

    .line 1540
    .local v18, "r":Lorg/json/JSONObject;
    const-string/jumbo v2, "failed"

    move-object/from16 v0, v18

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_d

    .line 1541
    const-string/jumbo v2, "vk_longpoll"

    const-string/jumbo v3, "Got \'failed\', reloading server info"

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 1542
    invoke-direct/range {p0 .. p0}, Lcom/vkontakte/android/LongPollService;->updateServerInfo()Z

    move-result v21

    .line 1543
    sget-boolean v2, Lcom/vkontakte/android/LongPollService;->connected:Z

    if-eqz v2, :cond_2

    .line 1544
    const/4 v2, 0x0

    sput-boolean v2, Lcom/vkontakte/android/LongPollService;->connected:Z

    .line 1545
    invoke-static {}, Lcom/vkontakte/android/LongPollService;->broadcastStateChanged()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto/16 :goto_1

    .line 1635
    .end local v18    # "r":Lorg/json/JSONObject;
    .end local v20    # "resp":Ljava/lang/String;
    :catch_1
    move-exception v25

    .line 1636
    .restart local v25    # "x":Ljava/lang/Exception;
    const-string/jumbo v2, "vk_longpoll"

    const-string/jumbo v3, "Exception while parsing"

    move-object/from16 v0, v25

    invoke-static {v2, v3, v0}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_1

    .line 1549
    .end local v25    # "x":Ljava/lang/Exception;
    .restart local v18    # "r":Lorg/json/JSONObject;
    .restart local v20    # "resp":Ljava/lang/String;
    :cond_d
    :try_start_2
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/vkontakte/android/LongPollService;->needResendOnline:Z

    if-eqz v2, :cond_e

    .line 1550
    invoke-direct/range {p0 .. p0}, Lcom/vkontakte/android/LongPollService;->sendOnline()V

    .line 1552
    :cond_e
    const-string/jumbo v2, "ts"

    move-object/from16 v0, v18

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    move-object/from16 v0, p0

    iput v2, v0, Lcom/vkontakte/android/LongPollService;->ts:I

    .line 1553
    const-string/jumbo v2, "pts"

    move-object/from16 v0, v18

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v17

    .line 1554
    .local v17, "pts":I
    if-lez v17, :cond_f

    .line 1555
    const-string/jumbo v2, "longpoll"

    const/4 v3, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3}, Lcom/vkontakte/android/LongPollService;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string/jumbo v3, "pts"

    move/from16 v0, v17

    invoke-interface {v2, v3, v0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 1557
    :cond_f
    const-string/jumbo v2, "updates"

    move-object/from16 v0, v18

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v22

    .line 1558
    .local v22, "u":Lorg/json/JSONArray;
    const/4 v13, 0x0

    .local v13, "i":I
    :goto_3
    invoke-virtual/range {v22 .. v22}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v13, v2, :cond_10

    .line 1559
    move-object/from16 v0, v22

    invoke-virtual {v0, v13}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v11

    .line 1560
    .local v11, "ev":Lorg/json/JSONArray;
    const/4 v2, 0x0

    invoke-virtual {v11, v2}, Lorg/json/JSONArray;->getInt(I)I

    move-result v12

    .line 1562
    .local v12, "evtype":I
    packed-switch v12, :pswitch_data_0

    .line 1558
    :goto_4
    add-int/lit8 v13, v13, 0x1

    goto :goto_3

    .line 1564
    :pswitch_0
    const/4 v2, 0x1

    invoke-virtual {v11, v2}, Lorg/json/JSONArray;->getInt(I)I

    move-result v2

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/vkontakte/android/LongPollService;->processUpdateCounter(I)V

    goto :goto_4

    .line 1568
    .end local v11    # "ev":Lorg/json/JSONArray;
    .end local v12    # "evtype":I
    :cond_10
    const/4 v13, 0x0

    :goto_5
    invoke-virtual/range {v22 .. v22}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v13, v2, :cond_2

    .line 1569
    move-object/from16 v0, v22

    invoke-virtual {v0, v13}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v11

    .line 1570
    .restart local v11    # "ev":Lorg/json/JSONArray;
    const/4 v2, 0x0

    invoke-virtual {v11, v2}, Lorg/json/JSONArray;->getInt(I)I

    move-result v12

    .line 1571
    .restart local v12    # "evtype":I
    sparse-switch v12, :sswitch_data_0

    .line 1631
    const-string/jumbo v2, "vk_longpoll"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Unknown event "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v11}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 1568
    :goto_6
    :sswitch_0
    add-int/lit8 v13, v13, 0x1

    goto :goto_5

    .line 1573
    :sswitch_1
    const/4 v2, 0x1

    invoke-virtual {v11, v2}, Lorg/json/JSONArray;->getInt(I)I

    move-result v3

    const/4 v2, 0x3

    invoke-virtual {v11, v2}, Lorg/json/JSONArray;->getInt(I)I

    move-result v4

    const/4 v2, 0x2

    invoke-virtual {v11, v2}, Lorg/json/JSONArray;->getInt(I)I

    move-result v5

    const/4 v2, 0x4

    invoke-virtual {v11, v2}, Lorg/json/JSONArray;->getInt(I)I

    move-result v6

    const/4 v2, 0x6

    invoke-virtual {v11, v2}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v7

    const/4 v2, 0x5

    invoke-virtual {v11, v2}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v8

    const/4 v2, 0x7

    invoke-virtual {v11, v2}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v9

    const/16 v2, 0x8

    invoke-virtual {v11, v2}, Lorg/json/JSONArray;->getInt(I)I

    move-result v10

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v10}, Lcom/vkontakte/android/LongPollService;->processMessageAdd(IIIILjava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;I)V

    goto :goto_6

    .line 1576
    :sswitch_2
    const/4 v2, 0x1

    invoke-virtual {v11, v2}, Lorg/json/JSONArray;->getInt(I)I

    move-result v3

    const/4 v2, 0x3

    invoke-virtual {v11, v2}, Lorg/json/JSONArray;->getInt(I)I

    move-result v4

    const/4 v2, 0x2

    invoke-virtual {v11, v2}, Lorg/json/JSONArray;->getInt(I)I

    move-result v5

    const/4 v2, 0x4

    invoke-virtual {v11, v2}, Lorg/json/JSONArray;->getInt(I)I

    move-result v6

    const/4 v2, 0x6

    invoke-virtual {v11, v2}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v7

    const/4 v2, 0x5

    invoke-virtual {v11, v2}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v8

    const/4 v2, 0x7

    invoke-virtual {v11, v2}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v9

    const/16 v2, 0x8

    invoke-virtual {v11, v2}, Lorg/json/JSONArray;->getInt(I)I

    move-result v10

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v10}, Lcom/vkontakte/android/LongPollService;->processMessageUpdate(IIIILjava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;I)V

    goto :goto_6

    .line 1579
    :sswitch_3
    const/4 v2, 0x1

    invoke-virtual {v11, v2}, Lorg/json/JSONArray;->getInt(I)I

    move-result v2

    const/4 v3, 0x3

    invoke-virtual {v11, v3}, Lorg/json/JSONArray;->getInt(I)I

    move-result v3

    const/4 v4, 0x2

    invoke-virtual {v11, v4}, Lorg/json/JSONArray;->getInt(I)I

    move-result v4

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v3, v4}, Lcom/vkontakte/android/LongPollService;->processClearFlags(III)V

    goto :goto_6

    .line 1582
    :sswitch_4
    const/4 v2, 0x1

    invoke-virtual {v11, v2}, Lorg/json/JSONArray;->getInt(I)I

    move-result v2

    const/4 v3, 0x3

    invoke-virtual {v11, v3}, Lorg/json/JSONArray;->getInt(I)I

    move-result v3

    const/4 v4, 0x2

    invoke-virtual {v11, v4}, Lorg/json/JSONArray;->getInt(I)I

    move-result v4

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v3, v4}, Lcom/vkontakte/android/LongPollService;->processAddFlags(III)V

    goto/16 :goto_6

    .line 1588
    :sswitch_5
    const/16 v16, 0x1

    .line 1589
    .local v16, "onl":I
    const/4 v2, 0x2

    invoke-virtual {v11, v2}, Lorg/json/JSONArray;->getInt(I)I

    move-result v2

    and-int/lit16 v14, v2, 0xff

    .line 1590
    .local v14, "lpo":I
    const/4 v2, 0x1

    if-ne v14, v2, :cond_11

    .line 1591
    const/16 v16, 0x2

    .line 1593
    :cond_11
    const/4 v2, 0x4

    if-eq v14, v2, :cond_12

    const/4 v2, 0x2

    if-eq v14, v2, :cond_12

    const/4 v2, 0x3

    if-eq v14, v2, :cond_12

    const/4 v2, 0x5

    if-ne v14, v2, :cond_13

    .line 1594
    :cond_12
    const/16 v16, 0x3

    .line 1596
    :cond_13
    const/4 v2, 0x1

    invoke-virtual {v11, v2}, Lorg/json/JSONArray;->getInt(I)I

    move-result v2

    neg-int v2, v2

    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-direct {v0, v2, v1}, Lcom/vkontakte/android/LongPollService;->processOnlineChange(II)V

    goto/16 :goto_6

    .line 1601
    .end local v14    # "lpo":I
    .end local v16    # "onl":I
    :sswitch_6
    const/4 v2, 0x1

    invoke-virtual {v11, v2}, Lorg/json/JSONArray;->getInt(I)I

    move-result v2

    neg-int v2, v2

    const/4 v3, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v3}, Lcom/vkontakte/android/LongPollService;->processOnlineChange(II)V

    goto/16 :goto_6

    .line 1604
    :sswitch_7
    const/4 v2, 0x1

    invoke-virtual {v11, v2}, Lorg/json/JSONArray;->getInt(I)I

    move-result v2

    const/4 v3, 0x1

    invoke-virtual {v11, v3}, Lorg/json/JSONArray;->getInt(I)I

    move-result v3

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v3}, Lcom/vkontakte/android/LongPollService;->processTyping(II)V

    goto/16 :goto_6

    .line 1607
    :sswitch_8
    const v2, 0x77359400

    const/4 v3, 0x2

    invoke-virtual {v11, v3}, Lorg/json/JSONArray;->getInt(I)I

    move-result v3

    add-int/2addr v2, v3

    const/4 v3, 0x1

    invoke-virtual {v11, v3}, Lorg/json/JSONArray;->getInt(I)I

    move-result v3

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v3}, Lcom/vkontakte/android/LongPollService;->processTyping(II)V

    goto/16 :goto_6

    .line 1620
    :sswitch_9
    const/4 v2, 0x1

    invoke-virtual {v11, v2}, Lorg/json/JSONArray;->getInt(I)I

    move-result v2

    const/4 v3, 0x2

    invoke-virtual {v11, v3}, Lorg/json/JSONArray;->getInt(I)I

    move-result v3

    const/4 v4, 0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v3, v4}, Lcom/vkontakte/android/LongPollService;->processReadUpto(IIZ)V

    goto/16 :goto_6

    .line 1623
    :sswitch_a
    const/4 v2, 0x1

    invoke-virtual {v11, v2}, Lorg/json/JSONArray;->getInt(I)I

    move-result v2

    const/4 v3, 0x2

    invoke-virtual {v11, v3}, Lorg/json/JSONArray;->getInt(I)I

    move-result v3

    const/4 v4, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v3, v4}, Lcom/vkontakte/android/LongPollService;->processReadUpto(IIZ)V

    goto/16 :goto_6

    .line 1626
    :sswitch_b
    const/4 v2, 0x1

    invoke-virtual {v11, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/vkontakte/android/LongPollService;->processNotifySettings(Lorg/json/JSONObject;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto/16 :goto_6

    .line 1639
    .end local v11    # "ev":Lorg/json/JSONArray;
    .end local v12    # "evtype":I
    .end local v13    # "i":I
    .end local v17    # "pts":I
    .end local v18    # "r":Lorg/json/JSONObject;
    .end local v19    # "rdata":[B
    .end local v20    # "resp":Ljava/lang/String;
    .end local v22    # "u":Lorg/json/JSONArray;
    .end local v24    # "url":Ljava/lang/String;
    :cond_14
    const-string/jumbo v2, "vk_longpoll"

    const-string/jumbo v3, "LongPoll exiting"

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1641
    new-instance v2, Ljava/lang/Thread;

    move-object/from16 v0, p0

    invoke-direct {v2, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/vkontakte/android/LongPollService;->lpThread:Ljava/lang/Thread;

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    goto/16 :goto_0

    .line 1562
    nop

    :pswitch_data_0
    .packed-switch 0x50
        :pswitch_0
    .end packed-switch

    .line 1571
    :sswitch_data_0
    .sparse-switch
        0x2 -> :sswitch_4
        0x3 -> :sswitch_3
        0x4 -> :sswitch_1
        0x5 -> :sswitch_2
        0x6 -> :sswitch_9
        0x7 -> :sswitch_a
        0x8 -> :sswitch_5
        0x9 -> :sswitch_6
        0x3d -> :sswitch_7
        0x3e -> :sswitch_8
        0x50 -> :sswitch_0
        0x72 -> :sswitch_b
    .end sparse-switch
.end method

.method public static sendAnalyticsNow()V
    .locals 3

    .prologue
    .line 1904
    invoke-static {}, Lcom/vkontakte/android/LongPollService;->getTrackEventsString()Ljava/lang/String;

    move-result-object v0

    .line 1905
    .local v0, "code":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1916
    :goto_0
    return-void

    .line 1908
    :cond_0
    new-instance v1, Lcom/vkontakte/android/api/VKAPIRequest;

    const-string/jumbo v2, "execute"

    invoke-direct {v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    const-string/jumbo v2, "code"

    invoke-virtual {v1, v2, v0}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    new-instance v2, Lcom/vkontakte/android/LongPollService$13;

    invoke-direct {v2}, Lcom/vkontakte/android/LongPollService$13;-><init>()V

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    .line 1915
    invoke-virtual {v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0
.end method

.method private sendOffline()V
    .locals 4

    .prologue
    .line 1888
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->isReal()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1901
    :goto_0
    return-void

    .line 1891
    :cond_0
    const-string/jumbo v0, "vk"

    const-string/jumbo v1, "Sending offline."

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1892
    new-instance v0, Lcom/vkontakte/android/api/VKAPIRequest;

    const-string/jumbo v1, "execute"

    invoke-direct {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    const-string/jumbo v1, "code"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "API.account.setOffline();"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Lcom/vkontakte/android/LongPollService;->getTrackEventsString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    new-instance v1, Lcom/vkontakte/android/LongPollService$12;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/LongPollService$12;-><init>(Lcom/vkontakte/android/LongPollService;)V

    .line 1893
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 1900
    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0
.end method

.method private sendOnline()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 1839
    sget-boolean v0, Lcom/vkontakte/android/LongPollService;->longPollRunning:Z

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/vkontakte/android/AppStateTracker;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v0

    if-nez v0, :cond_1

    .line 1885
    :cond_0
    :goto_0
    return-void

    .line 1842
    :cond_1
    const-string/jumbo v0, "vk"

    const-string/jumbo v1, "Sending online."

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1844
    invoke-static {}, Lcom/vkontakte/android/data/Analytics;->sendGeoData()V

    .line 1845
    sget-object v0, Lcom/vkontakte/android/data/Analytics;->viewPostTime:Lcom/vkontakte/android/data/Analytics$ViewPostTime;

    invoke-virtual {v0}, Lcom/vkontakte/android/data/Analytics$ViewPostTime;->commit()V

    .line 1848
    new-instance v0, Lcom/vkontakte/android/api/VKAPIRequest;

    const-string/jumbo v1, "execute"

    invoke-direct {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    const-string/jumbo v1, "code"

    const-string/jumbo v2, "API.account.setOnline({push_count: %d});%s"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    sget-object v4, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const/4 v5, 0x0

    invoke-virtual {v4, v5, v6}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    const-string/jumbo v5, "push_counter"

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v6

    const/4 v4, 0x1

    invoke-static {}, Lcom/vkontakte/android/LongPollService;->getTrackEventsString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    new-instance v1, Lcom/vkontakte/android/LongPollService$10;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/LongPollService$10;-><init>(Lcom/vkontakte/android/LongPollService;)V

    .line 1849
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 1863
    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->execSync()Z

    .line 1865
    new-instance v0, Lcom/vkontakte/android/api/account/AccountGetPingUrl;

    invoke-direct {v0}, Lcom/vkontakte/android/api/account/AccountGetPingUrl;-><init>()V

    new-instance v1, Lcom/vkontakte/android/LongPollService$11;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/LongPollService$11;-><init>(Lcom/vkontakte/android/LongPollService;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/account/AccountGetPingUrl;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 1882
    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->execSync()Z

    .line 1884
    invoke-static {}, Lcom/vkontakte/android/data/BenchmarkTracker;->getInstance()Lcom/vkontakte/android/data/BenchmarkTracker;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/data/BenchmarkTracker;->sendBenchmarkData()V

    goto :goto_0
.end method

.method public static setNumAppRequests(I)V
    .locals 1
    .param p0, "value"    # I

    .prologue
    .line 217
    invoke-static {p0}, Lcom/vkontakte/android/LongPollService;->clampCounter(I)I

    move-result v0

    sput v0, Lcom/vkontakte/android/LongPollService;->numAppRequests:I

    .line 218
    return-void
.end method

.method public static setNumFriendRequests(I)V
    .locals 1
    .param p0, "value"    # I

    .prologue
    .line 263
    invoke-static {p0}, Lcom/vkontakte/android/LongPollService;->clampCounter(I)I

    move-result v0

    sput v0, Lcom/vkontakte/android/LongPollService;->numFriendRequests:I

    .line 264
    return-void
.end method

.method public static setNumFriendSuggestions(I)V
    .locals 1
    .param p0, "value"    # I

    .prologue
    .line 271
    invoke-static {p0}, Lcom/vkontakte/android/LongPollService;->clampCounter(I)I

    move-result v0

    sput v0, Lcom/vkontakte/android/LongPollService;->numFriendSuggestions:I

    .line 272
    return-void
.end method

.method public static setNumGroupInvitations(I)V
    .locals 1
    .param p0, "value"    # I

    .prologue
    .line 246
    invoke-static {p0}, Lcom/vkontakte/android/LongPollService;->clampCounter(I)I

    move-result v0

    sput v0, Lcom/vkontakte/android/LongPollService;->numGroupInvitations:I

    .line 247
    return-void
.end method

.method public static setNumNewMessages(I)V
    .locals 1
    .param p0, "value"    # I

    .prologue
    .line 222
    invoke-static {p0}, Lcom/vkontakte/android/LongPollService;->clampCounter(I)I

    move-result v0

    sput v0, Lcom/vkontakte/android/LongPollService;->numNewMessages:I

    .line 223
    return-void
.end method

.method public static setNumPhotosMarks(I)V
    .locals 1
    .param p0, "value"    # I

    .prologue
    .line 209
    invoke-static {p0}, Lcom/vkontakte/android/LongPollService;->clampCounter(I)I

    move-result v0

    sput v0, Lcom/vkontakte/android/LongPollService;->numPhotosMarks:I

    .line 210
    return-void
.end method

.method public static setNumVideosMarks(I)V
    .locals 1
    .param p0, "value"    # I

    .prologue
    .line 213
    invoke-static {p0}, Lcom/vkontakte/android/LongPollService;->clampCounter(I)I

    move-result v0

    sput v0, Lcom/vkontakte/android/LongPollService;->numVideosMarks:I

    .line 214
    return-void
.end method

.method private start()V
    .locals 3

    .prologue
    .line 711
    const-string/jumbo v0, "vk_longpoll"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "started = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/vkontakte/android/LongPollService;->started:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 712
    iget-boolean v0, p0, Lcom/vkontakte/android/LongPollService;->started:Z

    if-eqz v0, :cond_0

    .line 719
    :goto_0
    return-void

    .line 715
    :cond_0
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v0, p0, Lcom/vkontakte/android/LongPollService;->lpThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 716
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/LongPollService;->started:Z

    .line 717
    invoke-static {}, Lcom/vkontakte/android/LongPollService;->broadcastStateChanged()V

    goto :goto_0
.end method

.method private stop()V
    .locals 1

    .prologue
    .line 722
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/LongPollService;->needStop:Z

    .line 723
    iget-object v0, p0, Lcom/vkontakte/android/LongPollService;->onlineTimer:Ljava/util/Timer;

    if-eqz v0, :cond_0

    .line 724
    iget-object v0, p0, Lcom/vkontakte/android/LongPollService;->onlineTimer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 726
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/LongPollService;->stopSelf()V

    .line 727
    const/4 v0, 0x0

    sput-object v0, Lcom/vkontakte/android/Global;->longPoll:Lcom/vkontakte/android/LongPollService;

    .line 728
    return-void
.end method

.method public static syncStateWithServer()V
    .locals 11

    .prologue
    const/4 v9, 0x1

    const/4 v10, 0x0

    .line 365
    sget-boolean v7, Lcom/vkontakte/android/LongPollService;->updating:Z

    if-eqz v7, :cond_1

    .line 366
    sget-boolean v7, Lcom/vkontakte/android/LongPollService;->DEBUG:Z

    if-eqz v7, :cond_0

    .line 367
    const-string/jumbo v7, "vk"

    const-string/jumbo v8, "already updating"

    invoke-static {v7, v8}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 671
    .local v4, "pts":I
    :cond_0
    :goto_0
    return-void

    .line 371
    .end local v4    # "pts":I
    :cond_1
    sget-object v7, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const-string/jumbo v8, "longpoll"

    invoke-virtual {v7, v8, v10}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v7

    const-string/jumbo v8, "pts"

    invoke-interface {v7, v8, v10}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v4

    .line 378
    .restart local v4    # "pts":I
    invoke-static {}, Lcom/vkontakte/android/NetworkStateReceiver;->isConnected()Z

    move-result v7

    if-nez v7, :cond_2

    .line 379
    const-string/jumbo v7, "vk"

    const-string/jumbo v8, "No network, won\'t update"

    invoke-static {v7, v8}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 382
    :cond_2
    sput-boolean v9, Lcom/vkontakte/android/LongPollService;->updating:Z

    .line 384
    :try_start_0
    invoke-static {}, Lcom/vkontakte/android/LongPollService;->broadcastStateChanged()V

    .line 385
    const-string/jumbo v7, "vk_longpoll"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "Before get long poll history, pts="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 386
    if-gtz v4, :cond_3

    .line 387
    invoke-static {}, Lcom/vkontakte/android/data/Messages;->reset()V

    .line 388
    invoke-static {}, Lcom/vkontakte/android/data/Messages;->resetCache()V

    .line 648
    :goto_1
    sget-object v7, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v7

    const-string/jumbo v8, "android_id"

    invoke-static {v7, v8}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 649
    .local v0, "deviceID":Ljava/lang/String;
    new-instance v7, Lcom/vkontakte/android/api/VKAPIRequest;

    const-string/jumbo v8, "account.getPushSettings"

    invoke-direct {v7, v8}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    const-string/jumbo v8, "device_id"

    .line 650
    invoke-virtual {v7, v8, v0}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v7

    new-instance v8, Lcom/vkontakte/android/LongPollService$4;

    invoke-direct {v8}, Lcom/vkontakte/android/LongPollService$4;-><init>()V

    .line 651
    invoke-virtual {v7, v8}, Lcom/vkontakte/android/api/VKAPIRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v7

    .line 666
    invoke-virtual {v7}, Lcom/vkontakte/android/api/VKAPIRequest;->exec()Lcom/vkontakte/android/api/VKAPIRequest;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 668
    sput-boolean v10, Lcom/vkontakte/android/LongPollService;->updating:Z

    .line 670
    invoke-static {}, Lcom/vkontakte/android/LongPollService;->broadcastStateChanged()V

    goto :goto_0

    .line 390
    .end local v0    # "deviceID":Ljava/lang/String;
    :cond_3
    const/4 v7, 0x1

    :try_start_1
    new-array v3, v7, [I

    .line 391
    .local v3, "maxMid":[I
    new-instance v7, Lcom/vkontakte/android/api/VKAPIRequest;

    const-string/jumbo v8, "execute.getMaxMsgIdNew"

    invoke-direct {v7, v8}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    new-instance v8, Lcom/vkontakte/android/LongPollService$2;

    invoke-direct {v8, v3}, Lcom/vkontakte/android/LongPollService$2;-><init>([I)V

    .line 392
    invoke-virtual {v7, v8}, Lcom/vkontakte/android/api/VKAPIRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v7

    .line 405
    invoke-virtual {v7}, Lcom/vkontakte/android/api/VKAPIRequest;->execSync()Z

    move-result v5

    .line 406
    .local v5, "r":Z
    if-nez v5, :cond_4

    .line 407
    new-instance v7, Ljava/lang/RuntimeException;

    const-string/jumbo v8, "Error getting max msg id"

    invoke-direct {v7, v8}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 668
    .end local v3    # "maxMid":[I
    .end local v5    # "r":Z
    :catchall_0
    move-exception v7

    sput-boolean v10, Lcom/vkontakte/android/LongPollService;->updating:Z

    throw v7

    .line 409
    .restart local v3    # "maxMid":[I
    .restart local v5    # "r":Z
    :cond_4
    :try_start_2
    invoke-static {}, Lcom/vkontakte/android/cache/Cache;->getMaxMsgId()I

    move-result v2

    .line 410
    .local v2, "localMaxMid":I
    const/4 v7, 0x0

    aget v7, v3, v7

    sub-int v1, v7, v2

    .line 411
    .local v1, "diff":I
    const-string/jumbo v7, "vk_longpoll"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "Msg diff="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, " [server="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const/4 v9, 0x0

    aget v9, v3, v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, ", client="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, "]"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 412
    const/16 v7, 0x3e8

    if-lt v1, v7, :cond_5

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v7

    invoke-virtual {v7}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v7

    const v8, 0x1a10c7

    if-eq v7, v8, :cond_5

    .line 413
    const-string/jumbo v7, "vk_longpoll"

    const-string/jumbo v8, "Too many new messages, resetting cache"

    invoke-static {v7, v8}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 414
    invoke-static {}, Lcom/vkontakte/android/data/Messages;->reset()V

    .line 415
    invoke-static {}, Lcom/vkontakte/android/data/Messages;->resetCache()V

    .line 416
    sget-object v7, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    new-instance v8, Landroid/content/Intent;

    const-string/jumbo v9, "com.vkontakte.android.REFRESH_DIALOGS"

    invoke-direct {v8, v9}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string/jumbo v9, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v7, v8, v9}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 668
    sput-boolean v10, Lcom/vkontakte/android/LongPollService;->updating:Z

    goto/16 :goto_0

    .line 419
    :cond_5
    const/4 v7, 0x1

    :try_start_3
    new-array v6, v7, [Z

    const/4 v7, 0x0

    const/4 v8, 0x0

    aput-boolean v8, v6, v7

    .line 421
    .local v6, "sendNextRequest":[Z
    :cond_6
    sget-object v7, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const-string/jumbo v8, "longpoll"

    const/4 v9, 0x0

    invoke-virtual {v7, v8, v9}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v7

    const-string/jumbo v8, "pts"

    const/4 v9, 0x0

    invoke-interface {v7, v8, v9}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v4

    .line 422
    const-string/jumbo v7, "vk_longpoll"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "Get long poll history, old ts="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 423
    new-instance v7, Lcom/vkontakte/android/api/VKAPIRequest;

    const-string/jumbo v8, "messages.getLongPollHistory"

    invoke-direct {v7, v8}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    const-string/jumbo v8, "pts"

    .line 424
    invoke-virtual {v7, v8, v4}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v7

    const-string/jumbo v8, "photo_sizes"

    const/4 v9, 0x1

    .line 425
    invoke-virtual {v7, v8, v9}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v7

    const-string/jumbo v8, "fields"

    const-string/jumbo v9, "first_name,last_name,photo_100,photo_50"

    .line 426
    invoke-virtual {v7, v8, v9}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v7

    const-string/jumbo v8, "msgs_limit"

    const/16 v9, 0xfa

    .line 427
    invoke-virtual {v7, v8, v9}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v7

    const-string/jumbo v8, "events_limit"

    const/16 v9, 0x1388

    .line 428
    invoke-virtual {v7, v8, v9}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v7

    new-instance v8, Lcom/vkontakte/android/LongPollService$3;

    invoke-direct {v8, v6}, Lcom/vkontakte/android/LongPollService$3;-><init>([Z)V

    .line 430
    invoke-virtual {v7, v8}, Lcom/vkontakte/android/api/VKAPIRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v7

    .line 643
    invoke-virtual {v7}, Lcom/vkontakte/android/api/VKAPIRequest;->execSync()Z

    .line 644
    const/4 v7, 0x0

    aget-boolean v7, v6, v7

    if-nez v7, :cond_6

    .line 645
    const-string/jumbo v7, "vk_longpoll"

    const-string/jumbo v8, "Get long poll hisrory done."

    invoke-static {v7, v8}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto/16 :goto_1
.end method

.method public static updateCounters()V
    .locals 3

    .prologue
    .line 731
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string/jumbo v1, "uid"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 775
    :goto_0
    return-void

    .line 734
    :cond_0
    new-instance v0, Lcom/vkontakte/android/api/VKAPIRequest;

    const-string/jumbo v1, "execute.getCountersAndInfo"

    invoke-direct {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    new-instance v1, Lcom/vkontakte/android/LongPollService$6;

    invoke-direct {v1}, Lcom/vkontakte/android/LongPollService$6;-><init>()V

    .line 735
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 774
    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0
.end method

.method public static updateNotification(Ljava/lang/CharSequence;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZI)V
    .locals 24
    .param p0, "text"    # Ljava/lang/CharSequence;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p1, "chatTitle"    # Ljava/lang/String;
    .param p2, "userName"    # Ljava/lang/String;
    .param p3, "userPhoto"    # Ljava/lang/String;
    .param p4, "hasMention"    # Z
    .param p5, "userId"    # I

    .prologue
    .line 1661
    sget-object v12, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    .line 1662
    .local v12, "context":Landroid/content/Context;
    const-string/jumbo v2, "notify"

    const/4 v3, 0x0

    invoke-virtual {v12, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v15

    .line 1663
    .local v15, "nprefs":Landroid/content/SharedPreferences;
    invoke-static {v12}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v17

    .line 1664
    .local v17, "prefs":Landroid/content/SharedPreferences;
    if-nez p4, :cond_1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "dnd"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move/from16 v0, p5

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-interface {v15, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    const-wide/16 v22, 0x3e8

    div-long v4, v4, v22

    long-to-int v3, v4

    if-le v2, v3, :cond_1

    .line 1665
    const-string/jumbo v2, "vk"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "dnd for peer "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, p5

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " is active, is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "dnd"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, p5

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-interface {v15, v4, v5}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1733
    :cond_0
    :goto_0
    return-void

    .line 1668
    :cond_1
    const-string/jumbo v2, "dnd_end"

    const-wide/16 v4, 0x0

    move-object/from16 v0, v17

    invoke-interface {v0, v2, v4, v5}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-lez v2, :cond_2

    .line 1669
    const-string/jumbo v2, "vk"

    const-string/jumbo v3, "global dnd is active"

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 1672
    :cond_2
    const v2, 0x77359400

    move/from16 v0, p5

    if-ge v0, v2, :cond_3

    sget-object v19, Lcom/vkontakte/android/NotificationUtils$Type;->PrivateMessages:Lcom/vkontakte/android/NotificationUtils$Type;

    .line 1673
    .local v19, "type":Lcom/vkontakte/android/NotificationUtils$Type;
    :goto_1
    move-object/from16 v0, v19

    invoke-static {v12, v0}, Lcom/vkontakte/android/NotificationUtils;->areNotificationsEnabled(Landroid/content/Context;Lcom/vkontakte/android/NotificationUtils$Type;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 1674
    const-string/jumbo v2, "vk"

    const-string/jumbo v3, "message notifications disabled"

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 1672
    .end local v19    # "type":Lcom/vkontakte/android/NotificationUtils$Type;
    :cond_3
    sget-object v19, Lcom/vkontakte/android/NotificationUtils$Type;->ChatMessages:Lcom/vkontakte/android/NotificationUtils$Type;

    goto :goto_1

    .line 1681
    .restart local v19    # "type":Lcom/vkontakte/android/NotificationUtils$Type;
    :cond_4
    sget-object v2, Lcom/vkontakte/android/fragments/messages/ChatFragment;->activeInstance:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    if-eqz v2, :cond_5

    sget-object v2, Lcom/vkontakte/android/fragments/messages/ChatFragment;->activeInstance:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getPeerID()I

    move-result v2

    move/from16 v0, p5

    if-ne v2, v0, :cond_5

    .line 1682
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "mute"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move/from16 v0, p5

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-interface {v15, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-nez v2, :cond_0

    move-object/from16 v0, v19

    invoke-static {v12, v0}, Lcom/vkontakte/android/NotificationUtils;->isSoundEnabled(Landroid/content/Context;Lcom/vkontakte/android/NotificationUtils$Type;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1683
    invoke-static/range {p5 .. p5}, Lcom/vkontakte/android/LongPollService;->playNotificationSound(I)V

    goto :goto_0

    .line 1689
    :cond_5
    :try_start_0
    const-string/jumbo v2, "notification"

    invoke-virtual {v12, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroid/app/NotificationManager;

    .line 1690
    .local v13, "mNotificationManager":Landroid/app/NotificationManager;
    invoke-static {}, Lcom/vkontakte/android/LongPollService;->notifyCountersChanged()V

    .line 1691
    invoke-static {}, Lcom/vkontakte/android/LongPollService;->getNumNewMessages()I

    move-result v2

    if-nez v2, :cond_6

    .line 1692
    const/4 v2, 0x0

    sput v2, Lcom/vkontakte/android/LongPollService;->prevNumNewMessages:I

    .line 1693
    const/16 v2, 0xa

    invoke-virtual {v13, v2}, Landroid/app/NotificationManager;->cancel(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 1730
    .end local v13    # "mNotificationManager":Landroid/app/NotificationManager;
    :catch_0
    move-exception v20

    .line 1731
    .local v20, "x":Ljava/lang/Exception;
    const-string/jumbo v2, "vk"

    move-object/from16 v0, v20

    invoke-static {v2, v0}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 1699
    .end local v20    # "x":Ljava/lang/Exception;
    .restart local v13    # "mNotificationManager":Landroid/app/NotificationManager;
    :cond_6
    :try_start_1
    new-instance v2, Landroid/net/Uri$Builder;

    invoke-direct {v2}, Landroid/net/Uri$Builder;-><init>()V

    const-string/jumbo v3, "vkontakte"

    invoke-virtual {v2, v3}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v2

    const-string/jumbo v3, "chat"

    .line 1700
    invoke-virtual {v2, v3}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v2

    const-string/jumbo v3, "peer"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    move/from16 v0, p5

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1701
    invoke-virtual {v2, v3, v4}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v3

    const-string/jumbo v4, "title"

    if-eqz p1, :cond_9

    move-object/from16 v2, p1

    .line 1702
    :goto_2
    invoke-virtual {v3, v4, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v10

    .line 1703
    .local v10, "bldr":Landroid/net/Uri$Builder;
    if-eqz p3, :cond_7

    .line 1704
    const-string/jumbo v2, "photo"

    move-object/from16 v0, p3

    invoke-virtual {v10, v2, v0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 1706
    :cond_7
    invoke-static {v12}, Lcom/vkontakte/android/LinkRedirActivity;->createIntentForNotification(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v14

    .line 1707
    .local v14, "notificationIntent":Landroid/content/Intent;
    invoke-virtual {v10}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v14, v2}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 1708
    const/high16 v2, 0x10000000

    invoke-virtual {v14, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 1709
    const/4 v2, 0x0

    const/high16 v3, 0x8000000

    invoke-static {v12, v2, v14, v3}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v7

    .line 1711
    .local v7, "contentIntent":Landroid/app/PendingIntent;
    new-instance v11, Landroid/content/Intent;

    const-class v2, Lcom/vkontakte/android/LongPollService;

    invoke-direct {v11, v12, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1712
    .local v11, "cancelIntent":Landroid/content/Intent;
    const-string/jumbo v2, "com.vkontakte.android.CANCEL_NOTIFICATION"

    invoke-virtual {v11, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 1713
    const/4 v2, 0x0

    const/high16 v3, 0x8000000

    invoke-static {v12, v2, v11, v3}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v16

    .line 1715
    .local v16, "pendingCancel":Landroid/app/PendingIntent;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    if-eqz p1, :cond_a

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v4, " "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v12}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f08045f

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_3
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ": "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 1716
    .local v8, "ticker":Ljava/lang/String;
    const/16 v18, 0x0

    .line 1717
    .local v18, "truncatedChatTitle":Ljava/lang/String;
    if-eqz p1, :cond_8

    .line 1718
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v3, 0x28

    if-le v2, v3, :cond_b

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v3, 0x0

    const/16 v4, 0x28

    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "..."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    .line 1720
    :cond_8
    :goto_4
    if-eqz p1, :cond_c

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, v18

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_5
    if-eqz p1, :cond_d

    invoke-virtual {v12}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v4, 0x7f080460

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    invoke-virtual {v2, v4, v5}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    :goto_6
    move-object/from16 v2, p0

    move-object/from16 v4, p2

    move-object/from16 v6, p3

    move/from16 v9, p5

    invoke-static/range {v2 .. v9}, Lcom/vkontakte/android/LongPollService;->createNotification(Ljava/lang/CharSequence;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Ljava/lang/String;I)Landroid/app/Notification;

    move-result-object v2

    sput-object v2, Lcom/vkontakte/android/LongPollService;->notification1:Landroid/app/Notification;

    .line 1721
    sget-object v2, Lcom/vkontakte/android/LongPollService;->notification1:Landroid/app/Notification;

    iget v3, v2, Landroid/app/Notification;->flags:I

    or-int/lit8 v3, v3, 0x10

    iput v3, v2, Landroid/app/Notification;->flags:I

    .line 1722
    const-string/jumbo v2, "vk_longpoll"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget v4, Lcom/vkontakte/android/LongPollService;->prevNumNewMessages:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "->"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {}, Lcom/vkontakte/android/LongPollService;->getNumNewMessages()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1723
    sget-object v2, Lcom/vkontakte/android/LongPollService;->notification1:Landroid/app/Notification;

    const/4 v3, 0x1

    move-object/from16 v0, v19

    invoke-static {v12, v2, v0, v3}, Lcom/vkontakte/android/NotificationUtils;->applySettings(Landroid/content/Context;Landroid/app/Notification;Lcom/vkontakte/android/NotificationUtils$Type;Z)V

    .line 1724
    invoke-static {}, Lcom/vkontakte/android/LongPollService;->getNumNewMessages()I

    move-result v2

    sput v2, Lcom/vkontakte/android/LongPollService;->prevNumNewMessages:I

    .line 1725
    sget-object v2, Lcom/vkontakte/android/LongPollService;->notification1:Landroid/app/Notification;

    invoke-static {}, Lcom/vkontakte/android/LongPollService;->getNumNewMessages()I

    move-result v3

    iput v3, v2, Landroid/app/Notification;->number:I

    .line 1726
    sget-object v2, Lcom/vkontakte/android/LongPollService;->notification1:Landroid/app/Notification;

    move-object/from16 v0, v16

    iput-object v0, v2, Landroid/app/Notification;->deleteIntent:Landroid/app/PendingIntent;

    .line 1728
    const/16 v2, 0xa

    invoke-virtual {v13, v2}, Landroid/app/NotificationManager;->cancel(I)V

    .line 1729
    const/16 v2, 0xa

    sget-object v3, Lcom/vkontakte/android/LongPollService;->notification1:Landroid/app/Notification;

    invoke-virtual {v13, v2, v3}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    goto/16 :goto_0

    .end local v7    # "contentIntent":Landroid/app/PendingIntent;
    .end local v8    # "ticker":Ljava/lang/String;
    .end local v10    # "bldr":Landroid/net/Uri$Builder;
    .end local v11    # "cancelIntent":Landroid/content/Intent;
    .end local v14    # "notificationIntent":Landroid/content/Intent;
    .end local v16    # "pendingCancel":Landroid/app/PendingIntent;
    .end local v18    # "truncatedChatTitle":Ljava/lang/String;
    :cond_9
    move-object/from16 v2, p2

    .line 1701
    goto/16 :goto_2

    .restart local v7    # "contentIntent":Landroid/app/PendingIntent;
    .restart local v10    # "bldr":Landroid/net/Uri$Builder;
    .restart local v11    # "cancelIntent":Landroid/content/Intent;
    .restart local v14    # "notificationIntent":Landroid/content/Intent;
    .restart local v16    # "pendingCancel":Landroid/app/PendingIntent;
    :cond_a
    move-object/from16 v2, p2

    .line 1715
    goto/16 :goto_3

    .restart local v8    # "ticker":Ljava/lang/String;
    .restart local v18    # "truncatedChatTitle":Ljava/lang/String;
    :cond_b
    move-object/from16 v18, p1

    .line 1718
    goto/16 :goto_4

    :cond_c
    move-object/from16 v3, p2

    .line 1720
    goto/16 :goto_5

    :cond_d
    const-string/jumbo v5, " "
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_6
.end method

.method private updateServerInfo()Z
    .locals 5

    .prologue
    .line 280
    :try_start_0
    sget-boolean v2, Lcom/vkontakte/android/Global;->inited:Z

    if-nez v2, :cond_0

    .line 281
    const/4 v2, 0x1

    sput-boolean v2, Lcom/vkontakte/android/Global;->inited:Z

    .line 282
    invoke-virtual {p0}, Lcom/vkontakte/android/LongPollService;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    sput-object v2, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    .line 284
    :cond_0
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/vkontakte/android/LongPollService;->server:Ljava/lang/String;

    .line 288
    new-instance v2, Lcom/vkontakte/android/api/VKAPIRequest;

    const-string/jumbo v3, "execute"

    invoke-direct {v2, v3}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    const-string/jumbo v3, "code"

    const-string/jumbo v4, "return {c:API.getCounters(),s:API.messages.getLongPollServer({use_ssl:1}),fo:API.friends.getOnline({online_mobile:1})};"

    .line 289
    invoke-virtual {v2, v3, v4}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    new-instance v3, Lcom/vkontakte/android/LongPollService$1;

    invoke-direct {v3, p0}, Lcom/vkontakte/android/LongPollService$1;-><init>(Lcom/vkontakte/android/LongPollService;)V

    .line 290
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/VKAPIRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    .line 332
    invoke-virtual {v2}, Lcom/vkontakte/android/api/VKAPIRequest;->execSync()Z

    move-result v0

    .line 333
    .local v0, "res":Z
    invoke-static {}, Lcom/vkontakte/android/LongPollService;->syncStateWithServer()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 340
    .end local v0    # "res":Z
    :goto_0
    return v0

    .line 335
    :catch_0
    move-exception v1

    .line 336
    .local v1, "x":Ljava/lang/Exception;
    sget-boolean v2, Lcom/vkontakte/android/LongPollService;->DEBUG:Z

    if-eqz v2, :cond_1

    .line 337
    const-string/jumbo v2, "vk"

    const-string/jumbo v3, "error updating longpoll server"

    invoke-static {v2, v3, v1}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 340
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public cancelDelayedStop()V
    .locals 1

    .prologue
    .line 2029
    iget-object v0, p0, Lcom/vkontakte/android/LongPollService;->stopDelayTimer:Ljava/util/Timer;

    if-eqz v0, :cond_1

    .line 2030
    iget-object v0, p0, Lcom/vkontakte/android/LongPollService;->stopDelayTimer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 2031
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/LongPollService;->stopDelayTimer:Ljava/util/Timer;

    .line 2042
    :cond_0
    :goto_0
    return-void

    .line 2033
    :cond_1
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/LongPollService;->needStop:Z

    .line 2038
    iget-object v0, p0, Lcom/vkontakte/android/LongPollService;->lpThread:Ljava/lang/Thread;

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcom/vkontakte/android/LongPollService;->started:Z

    if-nez v0, :cond_0

    .line 2039
    :cond_2
    invoke-direct {p0}, Lcom/vkontakte/android/LongPollService;->start()V

    goto :goto_0
.end method

.method public getTypings(I)Ljava/util/List;
    .locals 18
    .param p1, "peer"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 915
    const v11, 0x77359400

    move/from16 v0, p1

    if-ge v0, v11, :cond_1

    .line 916
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/vkontakte/android/LongPollService;->typings:Ljava/util/HashMap;

    if-eqz v11, :cond_0

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/vkontakte/android/LongPollService;->typings:Ljava/util/HashMap;

    move/from16 v0, p1

    int-to-long v12, v0

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_0

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/vkontakte/android/LongPollService;->typings:Ljava/util/HashMap;

    move/from16 v0, p1

    int-to-long v12, v0

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    if-eqz v11, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/vkontakte/android/LongPollService;->typings:Ljava/util/HashMap;

    move/from16 v0, p1

    int-to-long v14, v0

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v14

    invoke-virtual {v11, v14}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/Long;

    invoke-virtual {v11}, Ljava/lang/Long;->longValue()J

    move-result-wide v14

    sub-long/2addr v12, v14

    const-wide/16 v14, 0x1b58

    cmp-long v11, v12, v14

    if-gez v11, :cond_0

    .line 917
    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Integer;

    const/4 v12, 0x0

    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-static {v11}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    .line 937
    :goto_0
    return-object v6

    .line 919
    :cond_0
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    goto :goto_0

    .line 922
    :cond_1
    :try_start_0
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/vkontakte/android/LongPollService;->typingLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v11}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 926
    :goto_1
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/vkontakte/android/LongPollService;->typings:Ljava/util/HashMap;

    invoke-virtual {v11}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v4

    .line 927
    .local v4, "keys":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Long;>;"
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 928
    .local v6, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :cond_2
    :goto_2
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_3

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/Long;

    invoke-virtual {v11}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    .line 929
    .local v2, "k":J
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/vkontakte/android/LongPollService;->typings:Ljava/util/HashMap;

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    invoke-virtual {v11, v13}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/Long;

    invoke-virtual {v11}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    .line 930
    .local v8, "time":J
    long-to-int v5, v2

    .line 931
    .local v5, "peerID":I
    const/16 v11, 0x20

    shr-long v14, v2, v11

    long-to-int v7, v14

    .line 932
    .local v7, "userID":I
    move/from16 v0, p1

    if-ne v5, v0, :cond_2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    sub-long/2addr v14, v8

    const-wide/16 v16, 0x1b58

    cmp-long v11, v14, v16

    if-gez v11, :cond_2

    .line 933
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v6, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 923
    .end local v2    # "k":J
    .end local v4    # "keys":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Long;>;"
    .end local v5    # "peerID":I
    .end local v6    # "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    .end local v7    # "userID":I
    .end local v8    # "time":J
    :catch_0
    move-exception v10

    .line 924
    .local v10, "x":Ljava/lang/Exception;
    const/4 v11, 0x0

    new-array v11, v11, [Ljava/lang/Object;

    invoke-static {v10, v11}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_1

    .line 936
    .end local v10    # "x":Ljava/lang/Exception;
    .restart local v4    # "keys":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Long;>;"
    .restart local v6    # "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    :cond_3
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/vkontakte/android/LongPollService;->typingLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v11}, Ljava/util/concurrent/Semaphore;->release()V

    goto :goto_0
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .param p1, "arg0"    # Landroid/content/Intent;

    .prologue
    .line 1947
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreate()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 1965
    const-string/jumbo v0, "vk_longpoll"

    const-string/jumbo v1, "Starting LongPoll service."

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1966
    sput-object p0, Lcom/vkontakte/android/Global;->longPoll:Lcom/vkontakte/android/LongPollService;

    .line 1968
    iget-object v0, p0, Lcom/vkontakte/android/LongPollService;->typingCancelThread:Lcom/vkontakte/android/background/WorkerThread;

    invoke-virtual {v0}, Lcom/vkontakte/android/background/WorkerThread;->start()V

    .line 1969
    const-string/jumbo v0, "longpoll"

    invoke-virtual {p0, v0, v2}, Lcom/vkontakte/android/LongPollService;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string/jumbo v1, "new_system"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/vkontakte/android/LongPollService;->newSystem:Z

    .line 1970
    invoke-direct {p0}, Lcom/vkontakte/android/LongPollService;->start()V

    .line 1971
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 1975
    const-string/jumbo v0, "vk_longpoll"

    const-string/jumbo v1, "Stopping LongPoll service."

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1976
    invoke-direct {p0}, Lcom/vkontakte/android/LongPollService;->sendOffline()V

    .line 1977
    invoke-direct {p0}, Lcom/vkontakte/android/LongPollService;->stop()V

    .line 1978
    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 3
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "flags"    # I
    .param p3, "startId"    # I

    .prologue
    .line 1952
    const-string/jumbo v0, "LocalService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Received start id "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1953
    if-eqz p1, :cond_0

    const-string/jumbo v0, "com.vkontakte.android.CANCEL_NOTIFICATION"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1954
    const/4 v0, 0x0

    sput-object v0, Lcom/vkontakte/android/LongPollService;->notification1:Landroid/app/Notification;

    .line 1956
    :cond_0
    const/4 v0, 0x2

    return v0
.end method

.method public run()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 943
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    const-string/jumbo v1, "LongPoll"

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 944
    iget-boolean v0, p0, Lcom/vkontakte/android/LongPollService;->needStop:Z

    if-nez v0, :cond_0

    .line 945
    const/4 v0, 0x1

    sput-boolean v0, Lcom/vkontakte/android/LongPollService;->longPollRunning:Z

    .line 946
    invoke-direct {p0}, Lcom/vkontakte/android/LongPollService;->runLongPoll()V

    .line 947
    sput-boolean v2, Lcom/vkontakte/android/LongPollService;->longPollRunning:Z

    sput-boolean v2, Lcom/vkontakte/android/LongPollService;->longPollActive:Z

    .line 949
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/LongPollService;->lpThread:Ljava/lang/Thread;

    .line 950
    iput-boolean v2, p0, Lcom/vkontakte/android/LongPollService;->started:Z

    .line 951
    return-void
.end method

.method public setNumUnread(I)V
    .locals 2
    .param p1, "n"    # I

    .prologue
    .line 702
    invoke-static {p1}, Lcom/vkontakte/android/LongPollService;->setNumNewMessages(I)V

    .line 703
    invoke-static {}, Lcom/vkontakte/android/LongPollService;->notifyCountersChanged()V

    .line 704
    invoke-static {}, Lcom/vkontakte/android/LongPollService;->getNumNewMessages()I

    move-result v1

    if-nez v1, :cond_0

    .line 705
    const-string/jumbo v1, "notification"

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/LongPollService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    .line 706
    .local v0, "mgr":Landroid/app/NotificationManager;
    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->cancel(I)V

    .line 708
    .end local v0    # "mgr":Landroid/app/NotificationManager;
    :cond_0
    return-void
.end method

.method public startSendingOnline()V
    .locals 6

    .prologue
    .line 1821
    new-instance v1, Lcom/vkontakte/android/LongPollService$9;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/LongPollService$9;-><init>(Lcom/vkontakte/android/LongPollService;)V

    .line 1828
    .local v1, "tt":Ljava/util/TimerTask;
    iget-object v0, p0, Lcom/vkontakte/android/LongPollService;->onlineTimer:Ljava/util/Timer;

    if-eqz v0, :cond_0

    .line 1830
    :try_start_0
    iget-object v0, p0, Lcom/vkontakte/android/LongPollService;->onlineTimer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1834
    :cond_0
    :goto_0
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/LongPollService;->onlineTimer:Ljava/util/Timer;

    .line 1835
    iget-object v0, p0, Lcom/vkontakte/android/LongPollService;->onlineTimer:Ljava/util/Timer;

    const-wide/16 v2, 0x2710

    const-wide/32 v4, 0x1d4c0

    invoke-virtual/range {v0 .. v5}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;JJ)V

    .line 1836
    return-void

    .line 1831
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public stopDelayed()V
    .locals 6

    .prologue
    .line 2010
    iget-object v1, p0, Lcom/vkontakte/android/LongPollService;->stopDelayTimer:Ljava/util/Timer;

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lcom/vkontakte/android/LongPollService;->needStop:Z

    if-eqz v1, :cond_1

    .line 2026
    :cond_0
    :goto_0
    return-void

    .line 2014
    :cond_1
    :try_start_0
    new-instance v1, Ljava/util/Timer;

    invoke-direct {v1}, Ljava/util/Timer;-><init>()V

    iput-object v1, p0, Lcom/vkontakte/android/LongPollService;->stopDelayTimer:Ljava/util/Timer;

    .line 2015
    iget-object v1, p0, Lcom/vkontakte/android/LongPollService;->stopDelayTimer:Ljava/util/Timer;

    new-instance v2, Lcom/vkontakte/android/LongPollService$14;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/LongPollService$14;-><init>(Lcom/vkontakte/android/LongPollService;)V

    const-wide/32 v4, 0x2bf20

    invoke-virtual {v1, v2, v4, v5}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 2023
    :catch_0
    move-exception v0

    .line 2024
    .local v0, "x":Ljava/lang/Exception;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0
.end method
