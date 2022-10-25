.class public Lcom/vkontakte/android/data/Messages;
.super Ljava/lang/Object;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/data/Messages$GetUnreadCountCallback;,
        Lcom/vkontakte/android/data/Messages$GetChatUsersCallback;,
        Lcom/vkontakte/android/data/Messages$GetMessagesCallback;,
        Lcom/vkontakte/android/data/Messages$SearchCallback;,
        Lcom/vkontakte/android/data/Messages$SearchDialogsCallback;,
        Lcom/vkontakte/android/data/Messages$GetDialogsCallback;
    }
.end annotation


# static fields
.field public static final ACTION_MESSAGE_ID_CHANGED:Ljava/lang/String; = "com.vkontakte.android.MESSAGE_ID_CHANGED"

.field public static final ACTION_SEND_FAILED:Ljava/lang/String; = "com.vkontakte.android.MESSAGE_SEND_FAILED"

.field private static final DEBUG:Z = true

.field public static final METHOD_NAME:Ljava/lang/String; = "messages.getById"

.field public static counterLock:Ljava/util/concurrent/Semaphore;

.field private static dialogs:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/DialogEntry;",
            ">;"
        }
    .end annotation
.end field

.field private static histories:Landroid/util/LruCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/LruCache",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/Message;",
            ">;>;"
        }
    .end annotation
.end field

.field private static lastUpdated:J

.field private static loadDlgsReq:Lcom/vkontakte/android/api/VKAPIRequest;

.field private static pendingUploads:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/Message;",
            ">;"
        }
    .end annotation
.end field

.field public static sendLock:Lcom/vkontakte/android/background/CountingLock;

.field public static updateLock:Ljava/util/concurrent/Semaphore;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 73
    new-instance v0, Landroid/util/LruCache;

    const/16 v1, 0x14

    invoke-direct {v0, v1}, Landroid/util/LruCache;-><init>(I)V

    sput-object v0, Lcom/vkontakte/android/data/Messages;->histories:Landroid/util/LruCache;

    .line 74
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/vkontakte/android/data/Messages;->dialogs:Ljava/util/ArrayList;

    .line 75
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/vkontakte/android/data/Messages;->pendingUploads:Ljava/util/ArrayList;

    .line 79
    const-wide/16 v0, -0x1

    sput-wide v0, Lcom/vkontakte/android/data/Messages;->lastUpdated:J

    .line 81
    new-instance v0, Ljava/util/concurrent/Semaphore;

    invoke-direct {v0, v2, v2}, Ljava/util/concurrent/Semaphore;-><init>(IZ)V

    sput-object v0, Lcom/vkontakte/android/data/Messages;->updateLock:Ljava/util/concurrent/Semaphore;

    new-instance v0, Ljava/util/concurrent/Semaphore;

    invoke-direct {v0, v2, v2}, Ljava/util/concurrent/Semaphore;-><init>(IZ)V

    sput-object v0, Lcom/vkontakte/android/data/Messages;->counterLock:Ljava/util/concurrent/Semaphore;

    .line 82
    new-instance v0, Lcom/vkontakte/android/background/CountingLock;

    invoke-direct {v0}, Lcom/vkontakte/android/background/CountingLock;-><init>()V

    sput-object v0, Lcom/vkontakte/android/data/Messages;->sendLock:Lcom/vkontakte/android/background/CountingLock;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Ljava/util/ArrayList;
    .locals 1

    .prologue
    .line 69
    sget-object v0, Lcom/vkontakte/android/data/Messages;->dialogs:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vkontakte/android/Message;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/Message;

    .prologue
    .line 69
    invoke-static {p0}, Lcom/vkontakte/android/data/Messages;->removeFromSending(Lcom/vkontakte/android/Message;)V

    return-void
.end method

.method static synthetic access$200(Lcom/vkontakte/android/Message;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/Message;

    .prologue
    .line 69
    invoke-static {p0}, Lcom/vkontakte/android/data/Messages;->broadcastNewMessage(Lcom/vkontakte/android/Message;)V

    return-void
.end method

.method static synthetic access$300()Landroid/util/LruCache;
    .locals 1

    .prologue
    .line 69
    sget-object v0, Lcom/vkontakte/android/data/Messages;->histories:Landroid/util/LruCache;

    return-object v0
.end method

.method static synthetic access$400()J
    .locals 2

    .prologue
    .line 69
    sget-wide v0, Lcom/vkontakte/android/data/Messages;->lastUpdated:J

    return-wide v0
.end method

.method static synthetic access$402(J)J
    .locals 0
    .param p0, "x0"    # J

    .prologue
    .line 69
    sput-wide p0, Lcom/vkontakte/android/data/Messages;->lastUpdated:J

    return-wide p0
.end method

.method public static add(Lcom/vkontakte/android/Message;Lcom/vkontakte/android/UserProfile;Ljava/lang/String;)V
    .locals 18
    .param p0, "msg"    # Lcom/vkontakte/android/Message;
    .param p1, "peerProfile"    # Lcom/vkontakte/android/UserProfile;
    .param p2, "senderPhoto"    # Ljava/lang/String;

    .prologue
    .line 85
    if-nez p2, :cond_0

    .line 86
    const-string/jumbo v13, "vk"

    const-string/jumbo v14, "sender photo is null!"

    invoke-static {v13, v14}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    :cond_0
    const-string/jumbo v13, "vk"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v15, "Add message "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p0

    iget v15, v0, Lcom/vkontakte/android/Message;->id:I

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string/jumbo v15, " START"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 91
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/vkontakte/android/Message;->out:Z

    if-nez v13, :cond_1

    .line 93
    :try_start_0
    sget-object v13, Lcom/vkontakte/android/data/Messages;->counterLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v13}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3

    .line 98
    :cond_1
    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    sput-wide v14, Lcom/vkontakte/android/data/Messages;->lastUpdated:J

    .line 99
    sget-object v13, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const-string/jumbo v14, "msg"

    const/4 v15, 0x0

    invoke-virtual {v13, v14, v15}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v13

    invoke-interface {v13}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v13

    const-string/jumbo v14, "updated"

    sget-wide v16, Lcom/vkontakte/android/data/Messages;->lastUpdated:J

    move-wide/from16 v0, v16

    invoke-interface {v13, v14, v0, v1}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v13

    invoke-interface {v13}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 100
    sget-object v13, Lcom/vkontakte/android/data/Messages;->histories:Landroid/util/LruCache;

    move-object/from16 v0, p0

    iget v14, v0, Lcom/vkontakte/android/Message;->peer:I

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v13, v14}, Landroid/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    if-nez v13, :cond_2

    .line 101
    sget-object v13, Lcom/vkontakte/android/data/Messages;->histories:Landroid/util/LruCache;

    move-object/from16 v0, p0

    iget v14, v0, Lcom/vkontakte/android/Message;->peer:I

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    new-instance v15, Ljava/util/ArrayList;

    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v13, v14, v15}, Landroid/util/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    :cond_2
    sget-object v13, Lcom/vkontakte/android/data/Messages;->histories:Landroid/util/LruCache;

    move-object/from16 v0, p0

    iget v14, v0, Lcom/vkontakte/android/Message;->peer:I

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v13, v14}, Landroid/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/ArrayList;

    .line 105
    .local v8, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/Message;>;"
    const/4 v3, 0x1

    .line 106
    .local v3, "appended":Z
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v13

    if-nez v13, :cond_5

    .line 107
    move-object/from16 v0, p0

    invoke-virtual {v8, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 125
    :goto_1
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/vkontakte/android/Message;->out:Z

    if-nez v13, :cond_3

    .line 126
    sget-object v13, Lcom/vkontakte/android/data/Messages;->counterLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v13}, Ljava/util/concurrent/Semaphore;->release()V

    .line 130
    :cond_3
    invoke-static/range {p0 .. p0}, Lcom/vkontakte/android/data/Messages$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/Message;)Ljava/lang/Runnable;

    move-result-object v11

    .line 141
    .local v11, "rr":Ljava/lang/Runnable;
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v13

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v14

    if-ne v13, v14, :cond_9

    .line 142
    invoke-static {v11}, Lcom/vkontakte/android/api/APIController;->runInBg(Ljava/lang/Runnable;)V

    .line 146
    :goto_2
    if-nez v3, :cond_c

    .line 147
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/vkontakte/android/Message;->out:Z

    if-nez v13, :cond_b

    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/vkontakte/android/Message;->readState:Z

    if-nez v13, :cond_b

    .line 149
    :try_start_1
    sget-object v13, Lcom/vkontakte/android/data/Messages;->updateLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v13}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    .line 153
    :goto_3
    sget-object v13, Lcom/vkontakte/android/data/Messages;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v13}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :cond_4
    :goto_4
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_a

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/DialogEntry;

    .line 154
    .local v4, "e":Lcom/vkontakte/android/DialogEntry;
    iget-object v14, v4, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget v14, v14, Lcom/vkontakte/android/UserProfile;->uid:I

    move-object/from16 v0, p0

    iget v15, v0, Lcom/vkontakte/android/Message;->peer:I

    if-ne v14, v15, :cond_4

    .line 155
    iget v14, v4, Lcom/vkontakte/android/DialogEntry;->unreadCount:I

    add-int/lit8 v14, v14, 0x1

    iput v14, v4, Lcom/vkontakte/android/DialogEntry;->unreadCount:I

    goto :goto_4

    .line 109
    .end local v4    # "e":Lcom/vkontakte/android/DialogEntry;
    .end local v11    # "rr":Ljava/lang/Runnable;
    :cond_5
    const/4 v13, 0x0

    invoke-virtual {v8, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/vkontakte/android/Message;

    iget v13, v13, Lcom/vkontakte/android/Message;->time:I

    move-object/from16 v0, p0

    iget v14, v0, Lcom/vkontakte/android/Message;->time:I

    if-ge v13, v14, :cond_6

    .line 110
    const/4 v13, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v8, v13, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    goto :goto_1

    .line 112
    :cond_6
    const v9, 0x7fffffff

    .line 113
    .local v9, "prevTime":I
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_5
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v13

    if-ge v6, v13, :cond_7

    .line 114
    move-object/from16 v0, p0

    iget v13, v0, Lcom/vkontakte/android/Message;->time:I

    if-lt v13, v9, :cond_8

    invoke-virtual {v8, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/vkontakte/android/Message;

    iget v13, v13, Lcom/vkontakte/android/Message;->time:I

    move-object/from16 v0, p0

    iget v14, v0, Lcom/vkontakte/android/Message;->time:I

    if-gt v13, v14, :cond_8

    .line 115
    move-object/from16 v0, p0

    invoke-virtual {v8, v6, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 120
    :cond_7
    const/4 v3, 0x0

    goto/16 :goto_1

    .line 118
    :cond_8
    invoke-virtual {v8, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/vkontakte/android/Message;

    iget v9, v13, Lcom/vkontakte/android/Message;->time:I

    .line 113
    add-int/lit8 v6, v6, 0x1

    goto :goto_5

    .line 144
    .end local v6    # "i":I
    .end local v9    # "prevTime":I
    .restart local v11    # "rr":Ljava/lang/Runnable;
    :cond_9
    invoke-interface {v11}, Ljava/lang/Runnable;->run()V

    goto :goto_2

    .line 158
    :cond_a
    sget-object v13, Lcom/vkontakte/android/data/Messages;->updateLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v13}, Ljava/util/concurrent/Semaphore;->release()V

    .line 318
    :cond_b
    :goto_6
    return-void

    .line 164
    :cond_c
    :try_start_2
    sget-object v13, Lcom/vkontakte/android/data/Messages;->updateLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v13}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 168
    :goto_7
    const/4 v5, 0x0

    .line 169
    .local v5, "found":Z
    sget-object v13, Lcom/vkontakte/android/data/Messages;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v13}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :cond_d
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_10

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/DialogEntry;

    .line 170
    .restart local v4    # "e":Lcom/vkontakte/android/DialogEntry;
    iget-object v14, v4, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget v14, v14, Lcom/vkontakte/android/UserProfile;->uid:I

    move-object/from16 v0, p0

    iget v15, v0, Lcom/vkontakte/android/Message;->peer:I

    if-ne v14, v15, :cond_d

    .line 171
    move-object/from16 v0, p0

    iput-object v0, v4, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    .line 172
    move-object/from16 v0, p2

    iput-object v0, v4, Lcom/vkontakte/android/DialogEntry;->lastMessagePhoto:Ljava/lang/String;

    .line 173
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/vkontakte/android/Message;->out:Z

    if-nez v13, :cond_e

    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/vkontakte/android/Message;->readState:Z

    if-nez v13, :cond_e

    .line 174
    iget v13, v4, Lcom/vkontakte/android/DialogEntry;->unreadCount:I

    add-int/lit8 v13, v13, 0x1

    iput v13, v4, Lcom/vkontakte/android/DialogEntry;->unreadCount:I

    .line 176
    :cond_e
    sget-object v13, Lcom/vkontakte/android/data/Messages;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v13, v4}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 177
    const v9, 0x7fffffff

    .line 178
    .restart local v9    # "prevTime":I
    const/4 v6, 0x0

    .restart local v6    # "i":I
    :goto_8
    sget-object v13, Lcom/vkontakte/android/data/Messages;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v13

    if-ge v6, v13, :cond_f

    .line 179
    iget-object v13, v4, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    iget v13, v13, Lcom/vkontakte/android/Message;->time:I

    if-lt v13, v9, :cond_13

    sget-object v13, Lcom/vkontakte/android/data/Messages;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v13, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/vkontakte/android/DialogEntry;

    iget-object v13, v13, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    iget v13, v13, Lcom/vkontakte/android/Message;->time:I

    iget-object v14, v4, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    iget v14, v14, Lcom/vkontakte/android/Message;->time:I

    if-gt v13, v14, :cond_13

    .line 180
    sget-object v13, Lcom/vkontakte/android/data/Messages;->dialogs:Ljava/util/ArrayList;

    add-int/lit8 v14, v6, -0x1

    const/4 v15, 0x0

    invoke-static {v14, v15}, Ljava/lang/Math;->max(II)I

    move-result v14

    invoke-virtual {v13, v14, v4}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 185
    :cond_f
    const/4 v5, 0x1

    .line 189
    .end local v4    # "e":Lcom/vkontakte/android/DialogEntry;
    .end local v6    # "i":I
    .end local v9    # "prevTime":I
    :cond_10
    sget-object v13, Lcom/vkontakte/android/data/Messages;->updateLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v13}, Ljava/util/concurrent/Semaphore;->release()V

    .line 191
    if-nez v5, :cond_12

    .line 192
    const-string/jumbo v13, "vk"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v15, "didn\'t find dialog for "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p0

    iget v15, v0, Lcom/vkontakte/android/Message;->peer:I

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 193
    const/4 v2, 0x0

    .line 194
    .local v2, "_unreadCount":I
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/vkontakte/android/Message;->out:Z

    if-nez v13, :cond_11

    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/vkontakte/android/Message;->readState:Z

    if-nez v13, :cond_11

    .line 195
    const-string/jumbo v13, "vk"

    const-string/jumbo v14, "getting unread count from cache"

    invoke-static {v13, v14}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 196
    move-object/from16 v0, p0

    iget v13, v0, Lcom/vkontakte/android/Message;->peer:I

    invoke-static {v13}, Lcom/vkontakte/android/cache/Cache;->getNumUnreadMessages(I)I

    move-result v2

    .line 197
    const-string/jumbo v13, "vk"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v15, "result="

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 198
    const/4 v13, -0x1

    if-ne v2, v13, :cond_11

    .line 199
    const/4 v13, 0x1

    new-array v10, v13, [I

    const/4 v13, 0x0

    const/4 v14, 0x0

    aput v14, v10, v13

    .line 200
    .local v10, "res":[I
    new-instance v13, Lcom/vkontakte/android/api/messages/MessagesGetUnreadCount;

    move-object/from16 v0, p0

    iget v14, v0, Lcom/vkontakte/android/Message;->peer:I

    invoke-direct {v13, v14}, Lcom/vkontakte/android/api/messages/MessagesGetUnreadCount;-><init>(I)V

    new-instance v14, Lcom/vkontakte/android/data/Messages$1;

    invoke-direct {v14, v10}, Lcom/vkontakte/android/data/Messages$1;-><init>([I)V

    .line 201
    invoke-virtual {v13, v14}, Lcom/vkontakte/android/api/messages/MessagesGetUnreadCount;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v13

    .line 212
    invoke-virtual {v13}, Lcom/vkontakte/android/api/VKAPIRequest;->execSync()Z

    .line 213
    const/4 v13, 0x0

    aget v2, v10, v13

    .line 219
    .end local v10    # "res":[I
    :cond_11
    move v12, v2

    .line 220
    .local v12, "unreadCount":I
    const-string/jumbo v13, "vk"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v15, "Final unread count value "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 221
    if-eqz p1, :cond_14

    .line 222
    new-instance v4, Lcom/vkontakte/android/DialogEntry;

    invoke-direct {v4}, Lcom/vkontakte/android/DialogEntry;-><init>()V

    .line 223
    .restart local v4    # "e":Lcom/vkontakte/android/DialogEntry;
    move-object/from16 v0, p0

    iput-object v0, v4, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    .line 224
    move-object/from16 v0, p2

    iput-object v0, v4, Lcom/vkontakte/android/DialogEntry;->lastMessagePhoto:Ljava/lang/String;

    .line 225
    move-object/from16 v0, p1

    iput-object v0, v4, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    .line 226
    iput v12, v4, Lcom/vkontakte/android/DialogEntry;->unreadCount:I

    .line 228
    :try_start_3
    sget-object v13, Lcom/vkontakte/android/data/Messages;->updateLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v13}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 232
    :goto_9
    sget-object v13, Lcom/vkontakte/android/data/Messages;->dialogs:Ljava/util/ArrayList;

    const/4 v14, 0x0

    invoke-virtual {v13, v14, v4}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 233
    sget-object v13, Lcom/vkontakte/android/data/Messages;->updateLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v13}, Ljava/util/concurrent/Semaphore;->release()V

    .line 316
    .end local v2    # "_unreadCount":I
    .end local v4    # "e":Lcom/vkontakte/android/DialogEntry;
    .end local v12    # "unreadCount":I
    :cond_12
    :goto_a
    const-string/jumbo v13, "vk"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v15, "Add message "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p0

    iget v15, v0, Lcom/vkontakte/android/Message;->id:I

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string/jumbo v15, " END"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_6

    .line 183
    .restart local v4    # "e":Lcom/vkontakte/android/DialogEntry;
    .restart local v6    # "i":I
    .restart local v9    # "prevTime":I
    :cond_13
    sget-object v13, Lcom/vkontakte/android/data/Messages;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v13, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/vkontakte/android/DialogEntry;

    iget-object v13, v13, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    iget v9, v13, Lcom/vkontakte/android/Message;->time:I

    .line 178
    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_8

    .line 235
    .end local v4    # "e":Lcom/vkontakte/android/DialogEntry;
    .end local v6    # "i":I
    .end local v9    # "prevTime":I
    .restart local v2    # "_unreadCount":I
    .restart local v12    # "unreadCount":I
    :cond_14
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 236
    .local v7, "ids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    move-object/from16 v0, p0

    iget v13, v0, Lcom/vkontakte/android/Message;->peer:I

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v7, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 237
    move-object/from16 v0, p0

    iget v13, v0, Lcom/vkontakte/android/Message;->peer:I

    const v14, 0x77359400

    if-ge v13, v14, :cond_15

    .line 238
    new-instance v13, Lcom/vkontakte/android/data/Messages$2;

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v13, v0, v1, v12}, Lcom/vkontakte/android/data/Messages$2;-><init>(Lcom/vkontakte/android/Message;Ljava/lang/String;I)V

    invoke-static {v7, v13}, Lcom/vkontakte/android/data/Friends;->getUsers(Ljava/util/Collection;Lcom/vkontakte/android/data/Friends$GetUsersCallback;)V

    goto :goto_a

    .line 270
    :cond_15
    move-object/from16 v0, p0

    iget v13, v0, Lcom/vkontakte/android/Message;->peer:I

    const v14, 0x77359400

    sub-int/2addr v13, v14

    new-instance v14, Lcom/vkontakte/android/data/Messages$3;

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v14, v0, v1, v12}, Lcom/vkontakte/android/data/Messages$3;-><init>(Lcom/vkontakte/android/Message;Ljava/lang/String;I)V

    invoke-static {v13, v14}, Lcom/vkontakte/android/data/Messages;->getChatUsers(ILcom/vkontakte/android/data/Messages$GetChatUsersCallback;)V

    goto :goto_a

    .line 229
    .end local v7    # "ids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    .restart local v4    # "e":Lcom/vkontakte/android/DialogEntry;
    :catch_0
    move-exception v13

    goto :goto_9

    .line 165
    .end local v2    # "_unreadCount":I
    .end local v4    # "e":Lcom/vkontakte/android/DialogEntry;
    .end local v5    # "found":Z
    .end local v12    # "unreadCount":I
    :catch_1
    move-exception v13

    goto/16 :goto_7

    .line 150
    :catch_2
    move-exception v13

    goto/16 :goto_3

    .line 94
    .end local v3    # "appended":Z
    .end local v8    # "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/Message;>;"
    .end local v11    # "rr":Ljava/lang/Runnable;
    :catch_3
    move-exception v13

    goto/16 :goto_0
.end method

.method public static applyActions(Ljava/util/ArrayList;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/cache/MessagesAction;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p0, "actions":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/cache/MessagesAction;>;"
    const v5, 0x77359400

    .line 1261
    invoke-static {p0}, Lcom/vkontakte/android/cache/Cache;->applyMessagesActions(Ljava/util/ArrayList;)I

    .line 1262
    sget-object v2, Lcom/vkontakte/android/data/Messages;->histories:Landroid/util/LruCache;

    invoke-virtual {v2}, Landroid/util/LruCache;->evictAll()V

    .line 1264
    :try_start_0
    sget-object v2, Lcom/vkontakte/android/data/Messages;->updateLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v2}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1268
    :goto_0
    sget-object v2, Lcom/vkontakte/android/data/Messages;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 1269
    sget-object v2, Lcom/vkontakte/android/data/Messages;->dialogs:Ljava/util/ArrayList;

    const/4 v3, 0x0

    const/16 v4, 0x14

    invoke-static {v3, v4}, Lcom/vkontakte/android/cache/Cache;->getDialogs(II)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 1270
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 1271
    .local v1, "uids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    sget-object v2, Lcom/vkontakte/android/data/Messages;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/DialogEntry;

    .line 1272
    .local v0, "e":Lcom/vkontakte/android/DialogEntry;
    iget-object v3, v0, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget v3, v3, Lcom/vkontakte/android/UserProfile;->uid:I

    if-le v3, v5, :cond_1

    iget-object v3, v0, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    iget-boolean v3, v3, Lcom/vkontakte/android/Message;->out:Z

    if-nez v3, :cond_1

    .line 1273
    iget-object v3, v0, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    iget v3, v3, Lcom/vkontakte/android/Message;->sender:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 1274
    iget-object v3, v0, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    iget v3, v3, Lcom/vkontakte/android/Message;->sender:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1277
    :cond_1
    iget-object v3, v0, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget v3, v3, Lcom/vkontakte/android/UserProfile;->uid:I

    if-ge v3, v5, :cond_0

    iget-object v3, v0, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v3, v3, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    if-nez v3, :cond_0

    .line 1278
    iget-object v3, v0, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget v3, v3, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 1279
    iget-object v3, v0, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget v3, v3, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 1283
    .end local v0    # "e":Lcom/vkontakte/android/DialogEntry;
    :cond_2
    sget-object v2, Lcom/vkontakte/android/data/Messages;->updateLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v2}, Ljava/util/concurrent/Semaphore;->release()V

    .line 1284
    invoke-static {}, Lcom/vkontakte/android/data/Messages$$Lambda$9;->lambdaFactory$()Lcom/vkontakte/android/data/Friends$GetUsersCallback;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vkontakte/android/data/Friends;->getUsers(Ljava/util/Collection;Lcom/vkontakte/android/data/Friends$GetUsersCallback;)V

    .line 1320
    return-void

    .line 1265
    .end local v1    # "uids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    :catch_0
    move-exception v2

    goto/16 :goto_0
.end method

.method private static broadcastNewMessage(Lcom/vkontakte/android/Message;)V
    .locals 3
    .param p0, "m"    # Lcom/vkontakte/android/Message;

    .prologue
    const v2, 0x77359400

    .line 1045
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1046
    .local v0, "ids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    iget v1, p0, Lcom/vkontakte/android/Message;->peer:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1047
    iget v1, p0, Lcom/vkontakte/android/Message;->peer:I

    if-ge v1, v2, :cond_0

    .line 1048
    invoke-static {p0}, Lcom/vkontakte/android/data/Messages$$Lambda$6;->lambdaFactory$(Lcom/vkontakte/android/Message;)Lcom/vkontakte/android/data/Friends$GetUsersCallback;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/data/Friends;->getUsers(Ljava/util/Collection;Lcom/vkontakte/android/data/Friends$GetUsersCallback;)V

    .line 1074
    :goto_0
    return-void

    .line 1057
    :cond_0
    iget v1, p0, Lcom/vkontakte/android/Message;->peer:I

    sub-int/2addr v1, v2

    invoke-static {p0}, Lcom/vkontakte/android/data/Messages$$Lambda$7;->lambdaFactory$(Lcom/vkontakte/android/Message;)Lcom/vkontakte/android/data/Messages$GetChatUsersCallback;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vkontakte/android/data/Messages;->getChatUsers(ILcom/vkontakte/android/data/Messages$GetChatUsersCallback;)V

    goto :goto_0
.end method

.method public static createChatPhoto(Ljava/util/ArrayList;)Ljava/lang/String;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/ChatUser;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 1498
    .local p0, "users":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/ChatUser;>;"
    new-instance v0, Landroid/net/Uri$Builder;

    invoke-direct {v0}, Landroid/net/Uri$Builder;-><init>()V

    .line 1499
    .local v0, "bldr":Landroid/net/Uri$Builder;
    const-string/jumbo v5, "vkchatphoto"

    invoke-virtual {v0, v5}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v5

    const-string/jumbo v6, "c"

    invoke-virtual {v5, v6}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 1500
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 1501
    .local v4, "pp":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v2, v5, :cond_2

    .line 1502
    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/ChatUser;

    .line 1503
    .local v1, "cu":Lcom/vkontakte/android/ChatUser;
    iget-object v5, v1, Lcom/vkontakte/android/ChatUser;->user:Lcom/vkontakte/android/UserProfile;

    iget v5, v5, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v6

    invoke-virtual {v6}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v6

    if-ne v5, v6, :cond_1

    .line 1501
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1506
    :cond_1
    iget-object v5, v1, Lcom/vkontakte/android/ChatUser;->user:Lcom/vkontakte/android/UserProfile;

    iget-object v5, v5, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 1509
    iget-object v5, v1, Lcom/vkontakte/android/ChatUser;->user:Lcom/vkontakte/android/UserProfile;

    iget-object v5, v5, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1510
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v5

    const/4 v6, 0x4

    if-ne v5, v6, :cond_0

    .line 1514
    .end local v1    # "cu":Lcom/vkontakte/android/ChatUser;
    :cond_2
    const/4 v2, 0x0

    .line 1515
    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 1516
    .local v3, "photo":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "photo"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 1517
    add-int/lit8 v2, v2, 0x1

    .line 1518
    goto :goto_1

    .line 1519
    .end local v3    # "photo":Ljava/lang/String;
    :cond_3
    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v5

    invoke-virtual {v5}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method public static createShortcutIcon(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 12
    .param p0, "url"    # Ljava/lang/String;

    .prologue
    const/4 v11, 0x1

    const/4 v10, 0x0

    const/high16 v8, -0x1000000

    const/4 v9, 0x0

    .line 1470
    sget-object v6, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const-string/jumbo v7, "activity"

    invoke-virtual {v6, v7}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    .line 1471
    .local v0, "am":Landroid/app/ActivityManager;
    invoke-virtual {v0}, Landroid/app/ActivityManager;->getLauncherLargeIconSize()I

    move-result v3

    .line 1472
    .local v3, "iconSize":I
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    invoke-static {v6}, Lcom/vk/imageloader/VKImageLoader;->getBitmap(Landroid/net/Uri;)Lio/reactivex/Observable;

    move-result-object v6

    invoke-static {v6}, Lcom/vk/core/util/RxUtil;->blockingGetWithNull(Lio/reactivex/Observable;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/graphics/Bitmap;

    .line 1473
    .local v5, "photo":Landroid/graphics/Bitmap;
    sget-object v6, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v3, v3, v6}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 1474
    .local v2, "icon":Landroid/graphics/Bitmap;
    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 1475
    .local v1, "c":Landroid/graphics/Canvas;
    new-instance v4, Landroid/graphics/Paint;

    invoke-direct {v4}, Landroid/graphics/Paint;-><init>()V

    .line 1476
    .local v4, "paint":Landroid/graphics/Paint;
    invoke-virtual {v4, v8}, Landroid/graphics/Paint;->setColor(I)V

    .line 1477
    invoke-virtual {v4, v11}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 1478
    invoke-virtual {v4, v11}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 1479
    sget-object v6, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v1, v8, v6}, Landroid/graphics/Canvas;->drawColor(ILandroid/graphics/PorterDuff$Mode;)V

    .line 1480
    new-instance v6, Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v7

    int-to-float v7, v7

    invoke-virtual {v1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v8

    int-to-float v8, v8

    invoke-direct {v6, v9, v9, v7, v8}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-virtual {v1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v7

    div-int/lit8 v7, v7, 0x2

    int-to-float v7, v7

    invoke-virtual {v1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v8

    div-int/lit8 v8, v8, 0x2

    int-to-float v8, v8

    invoke-virtual {v1, v6, v7, v8, v4}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 1481
    new-instance v6, Landroid/graphics/PorterDuffXfermode;

    sget-object v7, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v6, v7}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v4, v6}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 1482
    const/4 v6, 0x0

    new-instance v7, Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v8

    invoke-virtual {v1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v9

    invoke-direct {v7, v10, v10, v8, v9}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {v1, v5, v6, v7, v4}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 1483
    return-object v2
.end method

.method public static delete(Ljava/util/List;Z)V
    .locals 12
    .param p1, "onlyLocal"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .line 1215
    .local p0, "_ids":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    :try_start_0
    sget-object v9, Lcom/vkontakte/android/data/Messages;->updateLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v9}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1219
    :goto_0
    sget-object v9, Lcom/vkontakte/android/data/Messages;->histories:Landroid/util/LruCache;

    invoke-virtual {v9}, Landroid/util/LruCache;->snapshot()Ljava/util/Map;

    move-result-object v2

    .line 1220
    .local v2, "histories":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/ArrayList<Lcom/vkontakte/android/Message;>;>;"
    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    .line 1221
    .local v0, "cachedChats":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :cond_0
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_2

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v8

    .line 1222
    .local v8, "peer":I
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-interface {v2, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 1223
    .local v3, "history":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/vkontakte/android/Message;>;"
    :cond_1
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_0

    .line 1224
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/vkontakte/android/Message;

    .line 1225
    .local v7, "msg":Lcom/vkontakte/android/Message;
    iget v9, v7, Lcom/vkontakte/android/Message;->id:I

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-interface {p0, v9}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 1226
    invoke-interface {v3}, Ljava/util/Iterator;->remove()V

    goto :goto_1

    .line 1230
    .end local v3    # "history":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/vkontakte/android/Message;>;"
    .end local v7    # "msg":Lcom/vkontakte/android/Message;
    .end local v8    # "peer":I
    :cond_2
    sget-object v9, Lcom/vkontakte/android/data/Messages;->updateLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v9}, Ljava/util/concurrent/Semaphore;->release()V

    .line 1231
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 1232
    .local v1, "failed":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 1233
    .local v5, "ids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    invoke-virtual {v5, p0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 1234
    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :cond_3
    :goto_2
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_4

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 1235
    .local v4, "id":I
    if-gez v4, :cond_3

    .line 1236
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v1, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 1239
    .end local v4    # "id":I
    :cond_4
    invoke-static {v1}, Lcom/vkontakte/android/cache/Cache;->deleteMessages(Ljava/util/List;)V

    .line 1240
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_3
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_5

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 1241
    .restart local v4    # "id":I
    new-instance v6, Landroid/content/Intent;

    const-string/jumbo v9, "com.vkontakte.android.MESSAGE_DELETED"

    invoke-direct {v6, v9}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1242
    .local v6, "intent":Landroid/content/Intent;
    const-string/jumbo v9, "msg_id"

    invoke-virtual {v6, v9, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1243
    sget-object v9, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const-string/jumbo v11, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v9, v6, v11}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    goto :goto_3

    .line 1245
    .end local v4    # "id":I
    .end local v6    # "intent":Landroid/content/Intent;
    :cond_5
    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    .line 1246
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-lez v9, :cond_6

    if-nez p1, :cond_6

    .line 1247
    new-instance v10, Lcom/vkontakte/android/api/messages/MessagesDelete;

    invoke-direct {v10, v5}, Lcom/vkontakte/android/api/messages/MessagesDelete;-><init>(Ljava/util/List;)V

    new-instance v11, Lcom/vkontakte/android/data/Messages$14;

    const/4 v9, 0x0

    check-cast v9, Landroid/content/Context;

    invoke-direct {v11, v9, v5}, Lcom/vkontakte/android/data/Messages$14;-><init>(Landroid/content/Context;Ljava/util/ArrayList;)V

    invoke-virtual {v10, v11}, Lcom/vkontakte/android/api/messages/MessagesDelete;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v9

    .line 1252
    invoke-virtual {v9}, Lcom/vkontakte/android/api/VKAPIRequest;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    .line 1254
    :cond_6
    return-void

    .line 1216
    .end local v0    # "cachedChats":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    .end local v1    # "failed":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    .end local v2    # "histories":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/ArrayList<Lcom/vkontakte/android/Message;>;>;"
    .end local v5    # "ids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    :catch_0
    move-exception v9

    goto/16 :goto_0
.end method

.method public static deleteMessageLocally(I)V
    .locals 6
    .param p0, "mid"    # I

    .prologue
    const/4 v5, 0x0

    .line 1170
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-static {v2}, Lcom/vkontakte/android/cache/Cache;->deleteMessages(Ljava/util/List;)V

    .line 1172
    :try_start_0
    sget-object v2, Lcom/vkontakte/android/data/Messages;->updateLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v2}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1176
    :goto_0
    sget-object v2, Lcom/vkontakte/android/data/Messages;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/DialogEntry;

    .line 1177
    .local v0, "d":Lcom/vkontakte/android/DialogEntry;
    iget-object v3, v0, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    iget v3, v3, Lcom/vkontakte/android/Message;->id:I

    if-ne v3, p0, :cond_0

    .line 1178
    sget-object v2, Lcom/vkontakte/android/data/Messages;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 1179
    move-object v1, v0

    .line 1180
    .local v1, "dlg":Lcom/vkontakte/android/DialogEntry;
    iget-object v2, v0, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget v2, v2, Lcom/vkontakte/android/UserProfile;->uid:I

    const/4 v3, 0x1

    new-instance v4, Lcom/vkontakte/android/data/Messages$13;

    invoke-direct {v4, v1}, Lcom/vkontakte/android/data/Messages$13;-><init>(Lcom/vkontakte/android/DialogEntry;)V

    invoke-static {v2, v5, v3, v5, v4}, Lcom/vkontakte/android/data/Messages;->getHistory(IIIILcom/vkontakte/android/data/Messages$GetMessagesCallback;)V

    .line 1210
    .end local v0    # "d":Lcom/vkontakte/android/DialogEntry;
    .end local v1    # "dlg":Lcom/vkontakte/android/DialogEntry;
    :cond_1
    sget-object v2, Lcom/vkontakte/android/data/Messages;->updateLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v2}, Ljava/util/concurrent/Semaphore;->release()V

    .line 1211
    return-void

    .line 1173
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public static getAllLoadedDialogs(Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/DialogEntry;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 321
    .local p0, "out":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/DialogEntry;>;"
    sget-object v0, Lcom/vkontakte/android/data/Messages;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 322
    return-void
.end method

.method public static getById(I)Lcom/vkontakte/android/Message;
    .locals 5
    .param p0, "id"    # I

    .prologue
    const/4 v4, 0x0

    .line 325
    invoke-static {p0}, Lcom/vkontakte/android/cache/Cache;->getMessageByID(I)Lcom/vkontakte/android/Message;

    move-result-object v0

    .line 326
    .local v0, "m":Lcom/vkontakte/android/Message;
    if-eqz v0, :cond_0

    .line 346
    .end local v0    # "m":Lcom/vkontakte/android/Message;
    :goto_0
    return-object v0

    .line 329
    .restart local v0    # "m":Lcom/vkontakte/android/Message;
    :cond_0
    const/4 v2, 0x1

    new-array v1, v2, [Lcom/vkontakte/android/Message;

    const/4 v2, 0x0

    aput-object v2, v1, v4

    .line 330
    .local v1, "res":[Lcom/vkontakte/android/Message;
    new-instance v2, Lcom/vkontakte/android/api/VKAPIRequest;

    const-string/jumbo v3, "messages.getById"

    invoke-direct {v2, v3}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    const-string/jumbo v3, "message_ids"

    .line 331
    invoke-virtual {v2, v3, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    new-instance v3, Lcom/vkontakte/android/data/Messages$4;

    invoke-direct {v3, v1}, Lcom/vkontakte/android/data/Messages$4;-><init>([Lcom/vkontakte/android/Message;)V

    .line 332
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/VKAPIRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    .line 345
    invoke-virtual {v2}, Lcom/vkontakte/android/api/VKAPIRequest;->execSync()Z

    .line 346
    aget-object v0, v1, v4

    goto :goto_0
.end method

.method public static getChatAdmin(I)I
    .locals 1
    .param p0, "chatID"    # I

    .prologue
    .line 1257
    invoke-static {p0}, Lcom/vkontakte/android/cache/Cache;->getChatAdmin(I)I

    move-result v0

    return v0
.end method

.method public static getChatUsers(ILcom/vkontakte/android/data/Messages$GetChatUsersCallback;)V
    .locals 3
    .param p0, "chatID"    # I
    .param p1, "getChatUsersCallback"    # Lcom/vkontakte/android/data/Messages$GetChatUsersCallback;

    .prologue
    .line 1077
    invoke-static {p0}, Lcom/vkontakte/android/cache/Cache;->needUpdateChat(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1078
    const-string/jumbo v0, "vk"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "need update chat "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 1079
    invoke-static {p0, p1}, Lcom/vkontakte/android/data/Messages;->getChatUsersFromApi(ILcom/vkontakte/android/data/Messages$GetChatUsersCallback;)V

    .line 1099
    :goto_0
    return-void

    .line 1081
    :cond_0
    new-instance v0, Ljava/lang/Thread;

    invoke-static {p0, p1}, Lcom/vkontakte/android/data/Messages$$Lambda$8;->lambdaFactory$(ILcom/vkontakte/android/data/Messages$GetChatUsersCallback;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 1097
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    goto :goto_0
.end method

.method private static getChatUsersFromApi(ILcom/vkontakte/android/data/Messages$GetChatUsersCallback;)V
    .locals 2
    .param p0, "chatID"    # I
    .param p1, "getChatUsersCallback"    # Lcom/vkontakte/android/data/Messages$GetChatUsersCallback;

    .prologue
    .line 1113
    new-instance v0, Lcom/vkontakte/android/api/messages/MessagesGetChat;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/api/messages/MessagesGetChat;-><init>(I)V

    new-instance v1, Lcom/vkontakte/android/data/Messages$10;

    invoke-direct {v1, p0, p1}, Lcom/vkontakte/android/data/Messages$10;-><init>(ILcom/vkontakte/android/data/Messages$GetChatUsersCallback;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/messages/MessagesGetChat;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 1141
    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    .line 1142
    return-void
.end method

.method public static getDialogs(IILcom/vkontakte/android/data/Messages$GetDialogsCallback;)V
    .locals 7
    .param p0, "offset"    # I
    .param p1, "count"    # I
    .param p2, "callback"    # Lcom/vkontakte/android/data/Messages$GetDialogsCallback;

    .prologue
    .line 351
    const-string/jumbo v3, "vk"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "getDialogs "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ", "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " [size="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Lcom/vkontakte/android/data/Messages;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "]"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 353
    sget-object v3, Lcom/vkontakte/android/data/Messages;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int v4, p0, p1

    if-lt v3, v4, :cond_2

    .line 354
    sget-object v3, Lcom/vkontakte/android/data/Messages;->updateLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v3}, Ljava/util/concurrent/Semaphore;->tryAcquire()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 355
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 356
    .local v2, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/DialogEntry;>;"
    sget-object v3, Lcom/vkontakte/android/data/Messages;->dialogs:Ljava/util/ArrayList;

    add-int v4, p0, p1

    invoke-virtual {v3, p0, v4}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/DialogEntry;

    .line 358
    .local v0, "e":Lcom/vkontakte/android/DialogEntry;
    const-string/jumbo v4, "vk"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "added "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 360
    iget-object v4, v0, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget v4, v4, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-static {v4}, Lcom/vkontakte/android/data/Friends;->get(I)Lcom/vkontakte/android/UserProfile;

    move-result-object v1

    .line 361
    .local v1, "p":Lcom/vkontakte/android/UserProfile;
    if-eqz v1, :cond_0

    .line 362
    iput-object v1, v0, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    .line 364
    :cond_0
    new-instance v4, Lcom/vkontakte/android/DialogEntry;

    invoke-direct {v4, v0}, Lcom/vkontakte/android/DialogEntry;-><init>(Lcom/vkontakte/android/DialogEntry;)V

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 366
    .end local v0    # "e":Lcom/vkontakte/android/DialogEntry;
    .end local v1    # "p":Lcom/vkontakte/android/UserProfile;
    :cond_1
    sget-object v3, Lcom/vkontakte/android/data/Messages;->updateLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v3}, Ljava/util/concurrent/Semaphore;->release()V

    .line 368
    const-string/jumbo v3, "vk"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Returned dialogs from ram "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 370
    invoke-interface {p2, v2}, Lcom/vkontakte/android/data/Messages$GetDialogsCallback;->onDialogsLoaded(Ljava/util/ArrayList;)V

    .line 511
    .end local v2    # "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/DialogEntry;>;"
    :goto_1
    return-void

    .line 374
    :cond_2
    new-instance v3, Ljava/lang/Thread;

    invoke-static {p0, p1, p2}, Lcom/vkontakte/android/data/Messages$$Lambda$2;->lambdaFactory$(IILcom/vkontakte/android/data/Messages$GetDialogsCallback;)Ljava/lang/Runnable;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 510
    invoke-virtual {v3}, Ljava/lang/Thread;->start()V

    goto :goto_1
.end method

.method public static getHistory(IIIILcom/vkontakte/android/data/Messages$GetMessagesCallback;)V
    .locals 2
    .param p0, "peer"    # I
    .param p1, "offset"    # I
    .param p2, "count"    # I
    .param p3, "startMsgID"    # I
    .param p4, "callback"    # Lcom/vkontakte/android/data/Messages$GetMessagesCallback;

    .prologue
    .line 679
    new-instance v0, Ljava/lang/Thread;

    invoke-static {p0, p1, p2, p3, p4}, Lcom/vkontakte/android/data/Messages$$Lambda$5;->lambdaFactory$(IIIILcom/vkontakte/android/data/Messages$GetMessagesCallback;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 786
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 787
    return-void
.end method

.method public static getLastUpdated()J
    .locals 4

    .prologue
    .line 1363
    sget-wide v0, Lcom/vkontakte/android/data/Messages;->lastUpdated:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 1364
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const-string/jumbo v1, "msg"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string/jumbo v1, "updated"

    sget-wide v2, Lcom/vkontakte/android/data/Messages;->lastUpdated:J

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    sput-wide v0, Lcom/vkontakte/android/data/Messages;->lastUpdated:J

    .line 1366
    :cond_0
    sget-wide v0, Lcom/vkontakte/android/data/Messages;->lastUpdated:J

    return-wide v0
.end method

.method public static getShortcutIntent(Lcom/vkontakte/android/UserProfile;)Landroid/content/Intent;
    .locals 6
    .param p0, "profile"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    .line 1487
    iget-object v3, p0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-static {v3}, Lcom/vkontakte/android/data/Messages;->createShortcutIcon(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 1488
    .local v0, "icon":Landroid/graphics/Bitmap;
    new-instance v2, Landroid/content/Intent;

    const-string/jumbo v3, "android.intent.action.VIEW"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "vkontakte://vk.com/write"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 1489
    .local v2, "sIntent":Landroid/content/Intent;
    const/high16 v3, 0x10000000

    invoke-virtual {v2, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 1490
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v3, "com.android.launcher.action.INSTALL_SHORTCUT"

    invoke-direct {v1, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1491
    .local v1, "intent":Landroid/content/Intent;
    const-string/jumbo v3, "android.intent.extra.shortcut.INTENT"

    invoke-virtual {v1, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 1492
    const-string/jumbo v3, "android.intent.extra.shortcut.NAME"

    iget-object v4, p0, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1493
    const-string/jumbo v3, "android.intent.extra.shortcut.ICON"

    invoke-virtual {v1, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 1494
    return-object v1
.end method

.method public static getUnreadCount(I)I
    .locals 7
    .param p0, "peer"    # I

    .prologue
    .line 603
    :try_start_0
    sget-object v3, Lcom/vkontakte/android/data/Messages;->updateLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v3}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 608
    :goto_0
    :try_start_1
    sget-object v3, Lcom/vkontakte/android/data/Messages;->counterLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v3}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 613
    :goto_1
    const-string/jumbo v3, "vk"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Get unread count "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " START"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 616
    :try_start_2
    sget-object v3, Lcom/vkontakte/android/data/Messages;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/DialogEntry;

    .line 617
    .local v1, "e":Lcom/vkontakte/android/DialogEntry;
    iget-object v4, v1, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    iget v4, v4, Lcom/vkontakte/android/Message;->peer:I

    if-ne v4, p0, :cond_0

    .line 618
    sget-object v3, Lcom/vkontakte/android/data/Messages;->updateLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v3}, Ljava/util/concurrent/Semaphore;->release()V

    .line 619
    iget v0, v1, Lcom/vkontakte/android/DialogEntry;->unreadCount:I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 641
    const-string/jumbo v3, "vk"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Get unread count "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " END"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 643
    sget-object v3, Lcom/vkontakte/android/data/Messages;->counterLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v3}, Ljava/util/concurrent/Semaphore;->release()V

    .end local v1    # "e":Lcom/vkontakte/android/DialogEntry;
    :goto_2
    return v0

    .line 622
    :cond_1
    :try_start_3
    sget-object v3, Lcom/vkontakte/android/data/Messages;->updateLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v3}, Ljava/util/concurrent/Semaphore;->release()V

    .line 624
    invoke-static {p0}, Lcom/vkontakte/android/cache/Cache;->getNumUnreadMessages(I)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result v0

    .line 625
    .local v0, "cache":I
    const/4 v3, -0x1

    if-eq v0, v3, :cond_2

    .line 641
    const-string/jumbo v3, "vk"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Get unread count "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " END"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 643
    sget-object v3, Lcom/vkontakte/android/data/Messages;->counterLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v3}, Ljava/util/concurrent/Semaphore;->release()V

    goto :goto_2

    .line 629
    :cond_2
    const/4 v3, 0x1

    :try_start_4
    new-array v2, v3, [I

    const/4 v3, 0x0

    const/4 v4, 0x0

    aput v4, v2, v3

    .line 630
    .local v2, "res":[I
    new-instance v3, Lcom/vkontakte/android/api/messages/MessagesGetUnreadCount;

    invoke-direct {v3, p0}, Lcom/vkontakte/android/api/messages/MessagesGetUnreadCount;-><init>(I)V

    new-instance v4, Lcom/vkontakte/android/data/Messages$6;

    invoke-direct {v4, v2}, Lcom/vkontakte/android/data/Messages$6;-><init>([I)V

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/api/messages/MessagesGetUnreadCount;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    .line 635
    invoke-virtual {v3}, Lcom/vkontakte/android/api/VKAPIRequest;->execSync()Z

    .line 637
    new-instance v3, Landroid/util/Pair;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x0

    aget v5, v2, v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-static {v3}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-static {v3}, Lcom/vkontakte/android/cache/Cache;->updateMessagesUnreadCount(Ljava/util/List;)V

    .line 638
    const/4 v3, 0x0

    aget v0, v2, v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 641
    .end local v0    # "cache":I
    const-string/jumbo v3, "vk"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Get unread count "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " END"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 643
    sget-object v3, Lcom/vkontakte/android/data/Messages;->counterLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v3}, Ljava/util/concurrent/Semaphore;->release()V

    goto/16 :goto_2

    .line 640
    .end local v2    # "res":[I
    :catchall_0
    move-exception v3

    .line 641
    const-string/jumbo v4, "vk"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Get unread count "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, " END"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 643
    sget-object v4, Lcom/vkontakte/android/data/Messages;->counterLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v4}, Ljava/util/concurrent/Semaphore;->release()V

    throw v3

    .line 609
    :catch_0
    move-exception v3

    goto/16 :goto_1

    .line 604
    :catch_1
    move-exception v3

    goto/16 :goto_0
.end method

.method public static getUnreadCount(ILcom/vkontakte/android/data/Messages$GetUnreadCountCallback;)V
    .locals 1
    .param p0, "peer"    # I
    .param p1, "callback"    # Lcom/vkontakte/android/data/Messages$GetUnreadCountCallback;

    .prologue
    .line 648
    invoke-static {p1, p0}, Lcom/vkontakte/android/data/Messages$$Lambda$4;->lambdaFactory$(Lcom/vkontakte/android/data/Messages$GetUnreadCountCallback;I)Ljava/lang/Runnable;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/api/APIController;->runInBg(Ljava/lang/Runnable;)V

    .line 649
    return-void
.end method

.method public static getUnreadCountFast(I)I
    .locals 4
    .param p0, "peer"    # I

    .prologue
    const/4 v2, -0x1

    .line 584
    const/4 v1, -0x1

    .line 585
    .local v1, "result":I
    sget-object v3, Lcom/vkontakte/android/data/Messages;->updateLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v3}, Ljava/util/concurrent/Semaphore;->tryAcquire()Z

    move-result v3

    if-nez v3, :cond_1

    .line 598
    :cond_0
    :goto_0
    return v2

    .line 588
    :cond_1
    sget-object v3, Lcom/vkontakte/android/data/Messages;->counterLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v3}, Ljava/util/concurrent/Semaphore;->tryAcquire()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 591
    sget-object v2, Lcom/vkontakte/android/data/Messages;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_2
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/DialogEntry;

    .line 592
    .local v0, "e":Lcom/vkontakte/android/DialogEntry;
    iget-object v3, v0, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    iget v3, v3, Lcom/vkontakte/android/Message;->peer:I

    if-ne v3, p0, :cond_2

    .line 593
    iget v1, v0, Lcom/vkontakte/android/DialogEntry;->unreadCount:I

    goto :goto_1

    .line 596
    .end local v0    # "e":Lcom/vkontakte/android/DialogEntry;
    :cond_3
    sget-object v2, Lcom/vkontakte/android/data/Messages;->counterLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v2}, Ljava/util/concurrent/Semaphore;->release()V

    .line 597
    sget-object v2, Lcom/vkontakte/android/data/Messages;->updateLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v2}, Ljava/util/concurrent/Semaphore;->release()V

    move v2, v1

    .line 598
    goto :goto_0
.end method

.method private static haveUserDomains(Ljava/util/ArrayList;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/ChatUser;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 1103
    .local p0, "users":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/ChatUser;>;"
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ChatUser;

    .line 1104
    .local v0, "cu":Lcom/vkontakte/android/ChatUser;
    iget-object v2, v0, Lcom/vkontakte/android/ChatUser;->user:Lcom/vkontakte/android/UserProfile;

    if-eqz v2, :cond_0

    iget-object v2, v0, Lcom/vkontakte/android/ChatUser;->user:Lcom/vkontakte/android/UserProfile;

    iget-object v2, v2, Lcom/vkontakte/android/UserProfile;->domain:Ljava/lang/String;

    if-eqz v2, :cond_1

    iget-object v2, v0, Lcom/vkontakte/android/ChatUser;->user:Lcom/vkontakte/android/UserProfile;

    iget-object v2, v2, Lcom/vkontakte/android/UserProfile;->domain:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1105
    :cond_1
    const/4 v1, 0x0

    .line 1109
    .end local v0    # "cu":Lcom/vkontakte/android/ChatUser;
    :goto_0
    return v1

    :cond_2
    const/4 v1, 0x1

    goto :goto_0
.end method

.method static synthetic lambda$add$0(Lcom/vkontakte/android/Message;)V
    .locals 2
    .param p0, "msg"    # Lcom/vkontakte/android/Message;

    .prologue
    .line 132
    :try_start_0
    sget-object v1, Lcom/vkontakte/android/data/Messages;->updateLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 136
    :goto_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 137
    .local v0, "al":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/Message;>;"
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 138
    invoke-static {v0}, Lcom/vkontakte/android/cache/Cache;->addMessages(Ljava/util/List;)V

    .line 139
    sget-object v1, Lcom/vkontakte/android/data/Messages;->updateLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->release()V

    .line 140
    return-void

    .line 133
    .end local v0    # "al":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/Message;>;"
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method static synthetic lambda$applyActions$9(Ljava/util/ArrayList;)V
    .locals 8
    .param p0, "users"    # Ljava/util/ArrayList;

    .prologue
    const v7, 0x77359400

    .line 1286
    const-string/jumbo v3, "vk"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "On users loaded "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1288
    new-instance v2, Landroid/util/SparseArray;

    invoke-direct {v2}, Landroid/util/SparseArray;-><init>()V

    .line 1289
    .local v2, "u":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/vkontakte/android/UserProfile;>;"
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/UserProfile;

    .line 1290
    .local v1, "p":Lcom/vkontakte/android/UserProfile;
    iget v4, v1, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-virtual {v2, v4, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_0

    .line 1293
    .end local v1    # "p":Lcom/vkontakte/android/UserProfile;
    :cond_0
    const-string/jumbo v3, "vk"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "U="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1296
    :try_start_0
    sget-object v3, Lcom/vkontakte/android/data/Messages;->updateLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v3}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1300
    :goto_1
    sget-object v3, Lcom/vkontakte/android/data/Messages;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_1
    :goto_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/DialogEntry;

    .line 1302
    .local v0, "e":Lcom/vkontakte/android/DialogEntry;
    iget-object v3, v0, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget v3, v3, Lcom/vkontakte/android/UserProfile;->uid:I

    if-le v3, v7, :cond_2

    iget-object v3, v0, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    iget-boolean v3, v3, Lcom/vkontakte/android/Message;->out:Z

    if-nez v3, :cond_2

    .line 1303
    iget-object v3, v0, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    iget v3, v3, Lcom/vkontakte/android/Message;->sender:I

    invoke-static {v2, v3}, Lcom/vkontakte/android/utils/Utils;->containsKey(Landroid/util/SparseArray;I)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 1304
    iget-object v3, v0, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    iget v3, v3, Lcom/vkontakte/android/Message;->sender:I

    invoke-virtual {v2, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/UserProfile;

    iget-object v3, v3, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    iput-object v3, v0, Lcom/vkontakte/android/DialogEntry;->lastMessagePhoto:Ljava/lang/String;

    .line 1310
    :cond_2
    :goto_3
    iget-object v3, v0, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget v3, v3, Lcom/vkontakte/android/UserProfile;->uid:I

    if-ge v3, v7, :cond_1

    iget-object v3, v0, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v3, v3, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    if-nez v3, :cond_1

    .line 1311
    iget-object v3, v0, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget v3, v3, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-static {v2, v3}, Lcom/vkontakte/android/utils/Utils;->containsKey(Landroid/util/SparseArray;I)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 1312
    iget-object v3, v0, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget v3, v3, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-virtual {v2, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/UserProfile;

    iput-object v3, v0, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    goto :goto_2

    .line 1297
    .end local v0    # "e":Lcom/vkontakte/android/DialogEntry;
    :catch_0
    move-exception v0

    .line 1298
    .local v0, "e":Ljava/lang/Exception;
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v0, v3}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_1

    .line 1307
    .local v0, "e":Lcom/vkontakte/android/DialogEntry;
    :cond_3
    const-string/jumbo v3, "vk"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Can\'t find photo for "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, v0, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    iget v6, v6, Lcom/vkontakte/android/Message;->sender:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    .line 1314
    :cond_4
    const-string/jumbo v3, "vk"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Can\'t find profile for "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, v0, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget v6, v6, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_2

    .line 1318
    .end local v0    # "e":Lcom/vkontakte/android/DialogEntry;
    :cond_5
    sget-object v3, Lcom/vkontakte/android/data/Messages;->updateLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v3}, Ljava/util/concurrent/Semaphore;->release()V

    .line 1319
    return-void
.end method

.method static synthetic lambda$broadcastNewMessage$6(Lcom/vkontakte/android/Message;Ljava/util/ArrayList;)V
    .locals 3
    .param p0, "m"    # Lcom/vkontakte/android/Message;
    .param p1, "users"    # Ljava/util/ArrayList;

    .prologue
    .line 1049
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "com.vkontakte.android.NEW_MESSAGE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1050
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "message"

    invoke-virtual {v0, v1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 1051
    const-string/jumbo v1, "peer_id"

    iget v2, p0, Lcom/vkontakte/android/Message;->peer:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1052
    const-string/jumbo v2, "peer_profile"

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/Parcelable;

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 1053
    const-string/jumbo v1, "sender_photo"

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/auth/VKAccount;->getPhoto()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1054
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const-string/jumbo v2, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v1, v0, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 1055
    return-void
.end method

.method static synthetic lambda$broadcastNewMessage$7(Lcom/vkontakte/android/Message;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p0, "m"    # Lcom/vkontakte/android/Message;
    .param p1, "users"    # Ljava/util/ArrayList;
    .param p2, "title"    # Ljava/lang/String;
    .param p3, "photo"    # Ljava/lang/String;

    .prologue
    .line 1058
    new-instance v1, Lcom/vkontakte/android/UserProfile;

    invoke-direct {v1}, Lcom/vkontakte/android/UserProfile;-><init>()V

    .line 1059
    .local v1, "p":Lcom/vkontakte/android/UserProfile;
    iput-object p2, v1, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    .line 1060
    iget v2, p0, Lcom/vkontakte/android/Message;->peer:I

    iput v2, v1, Lcom/vkontakte/android/UserProfile;->uid:I

    .line 1061
    if-eqz p3, :cond_0

    .line 1062
    iput-object p3, v1, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    .line 1066
    :goto_0
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v2, "com.vkontakte.android.NEW_MESSAGE"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1067
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v2, "message"

    invoke-virtual {v0, v2, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 1068
    const-string/jumbo v2, "peer_id"

    iget v3, p0, Lcom/vkontakte/android/Message;->peer:I

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1069
    const-string/jumbo v2, "peer_profile"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 1070
    const-string/jumbo v2, "sender_photo"

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/auth/VKAccount;->getPhoto()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1071
    sget-object v2, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const-string/jumbo v3, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v2, v0, v3}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 1072
    return-void

    .line 1064
    .end local v0    # "intent":Landroid/content/Intent;
    :cond_0
    invoke-static {p1}, Lcom/vkontakte/android/data/Messages;->createChatPhoto(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    goto :goto_0
.end method

.method static synthetic lambda$getChatUsers$8(ILcom/vkontakte/android/data/Messages$GetChatUsersCallback;)V
    .locals 5
    .param p0, "chatID"    # I
    .param p1, "getChatUsersCallback"    # Lcom/vkontakte/android/data/Messages$GetChatUsersCallback;

    .prologue
    .line 1082
    invoke-static {p0}, Lcom/vkontakte/android/cache/Cache;->getChatUsers(I)Ljava/util/ArrayList;

    move-result-object v1

    .line 1083
    .local v1, "users":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/ChatUser;>;"
    const-string/jumbo v2, "vk"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "get users from cache, size="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1085
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-nez v2, :cond_0

    .line 1086
    const-string/jumbo v2, "vk"

    const-string/jumbo v3, "cache returned empty list, fallback to api"

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1087
    invoke-static {p0, p1}, Lcom/vkontakte/android/data/Messages;->getChatUsersFromApi(ILcom/vkontakte/android/data/Messages$GetChatUsersCallback;)V

    .line 1097
    :goto_0
    return-void

    .line 1089
    :cond_0
    invoke-static {v1}, Lcom/vkontakte/android/data/Messages;->haveUserDomains(Ljava/util/ArrayList;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 1090
    const-string/jumbo v2, "vk"

    const-string/jumbo v3, "cache returned chat users without domains, fallback to api"

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1091
    invoke-static {p0, p1}, Lcom/vkontakte/android/data/Messages;->getChatUsersFromApi(ILcom/vkontakte/android/data/Messages$GetChatUsersCallback;)V

    goto :goto_0

    .line 1094
    :cond_1
    invoke-static {p0}, Lcom/vkontakte/android/cache/Cache;->getChatInfo(I)[Ljava/lang/String;

    move-result-object v0

    .line 1095
    .local v0, "info":[Ljava/lang/String;
    const/4 v2, 0x0

    aget-object v2, v0, v2

    const/4 v3, 0x1

    aget-object v3, v0, v3

    invoke-interface {p1, v1, v2, v3}, Lcom/vkontakte/android/data/Messages$GetChatUsersCallback;->onUsersLoaded(Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method static synthetic lambda$getDialogs$2(IILcom/vkontakte/android/data/Messages$GetDialogsCallback;)V
    .locals 8
    .param p0, "offset"    # I
    .param p1, "count"    # I
    .param p2, "callback"    # Lcom/vkontakte/android/data/Messages$GetDialogsCallback;

    .prologue
    const v7, 0x77359400

    .line 375
    invoke-static {}, Lcom/vkontakte/android/cache/Cache;->getDialogsCount()I

    move-result v0

    .line 376
    .local v0, "cacheCount":I
    const-string/jumbo v4, "vk"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "cache count "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 377
    sget-object v4, Lcom/vkontakte/android/data/Messages;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v4, v0, :cond_3

    add-int v4, p0, p1

    if-lt v0, v4, :cond_3

    .line 380
    :try_start_0
    sget-object v4, Lcom/vkontakte/android/data/Messages;->updateLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v4}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 384
    :goto_0
    sget-object v4, Lcom/vkontakte/android/data/Messages;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    sget-object v5, Lcom/vkontakte/android/data/Messages;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    sub-int v5, v0, v5

    invoke-static {v5, p1}, Ljava/lang/Math;->min(II)I

    move-result v5

    invoke-static {v4, v5}, Lcom/vkontakte/android/cache/Cache;->getDialogs(II)Ljava/util/ArrayList;

    move-result-object v1

    .line 385
    .local v1, "cached":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/DialogEntry;>;"
    sget-object v4, Lcom/vkontakte/android/data/Messages;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 386
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 387
    .local v3, "uids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/DialogEntry;

    .line 388
    .local v2, "e":Lcom/vkontakte/android/DialogEntry;
    iget-object v5, v2, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget v5, v5, Lcom/vkontakte/android/UserProfile;->uid:I

    if-le v5, v7, :cond_1

    iget-object v5, v2, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    iget-boolean v5, v5, Lcom/vkontakte/android/Message;->out:Z

    if-nez v5, :cond_1

    .line 389
    iget-object v5, v2, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    iget v5, v5, Lcom/vkontakte/android/Message;->sender:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 390
    iget-object v5, v2, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    iget v5, v5, Lcom/vkontakte/android/Message;->sender:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 393
    :cond_1
    iget-object v5, v2, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget v5, v5, Lcom/vkontakte/android/UserProfile;->uid:I

    if-ge v5, v7, :cond_0

    iget-object v5, v2, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v5, v5, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    if-nez v5, :cond_0

    .line 394
    iget-object v5, v2, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget v5, v5, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 395
    iget-object v5, v2, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget v5, v5, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 399
    .end local v2    # "e":Lcom/vkontakte/android/DialogEntry;
    :cond_2
    sget-object v4, Lcom/vkontakte/android/data/Messages;->updateLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v4}, Ljava/util/concurrent/Semaphore;->release()V

    .line 400
    invoke-static {v1, p0, p1, p2}, Lcom/vkontakte/android/data/Messages$$Lambda$10;->lambdaFactory$(Ljava/util/ArrayList;IILcom/vkontakte/android/data/Messages$GetDialogsCallback;)Lcom/vkontakte/android/data/Friends$GetUsersCallback;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/vkontakte/android/data/Friends;->getUsers(Ljava/util/Collection;Lcom/vkontakte/android/data/Friends$GetUsersCallback;)V

    .line 510
    .end local v1    # "cached":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/DialogEntry;>;"
    .end local v3    # "uids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    :goto_2
    return-void

    .line 448
    :cond_3
    new-instance v4, Lcom/vkontakte/android/api/messages/MessagesGetDialogs;

    mul-int/lit8 v5, p1, 0x2

    invoke-direct {v4, p0, v5}, Lcom/vkontakte/android/api/messages/MessagesGetDialogs;-><init>(II)V

    new-instance v5, Lcom/vkontakte/android/data/Messages$5;

    invoke-direct {v5, p2, p1}, Lcom/vkontakte/android/data/Messages$5;-><init>(Lcom/vkontakte/android/data/Messages$GetDialogsCallback;I)V

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/api/messages/MessagesGetDialogs;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v4

    sput-object v4, Lcom/vkontakte/android/data/Messages;->loadDlgsReq:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 508
    sget-object v4, Lcom/vkontakte/android/data/Messages;->loadDlgsReq:Lcom/vkontakte/android/api/VKAPIRequest;

    invoke-virtual {v4}, Lcom/vkontakte/android/api/VKAPIRequest;->execSync()Z

    .line 509
    const/4 v4, 0x0

    sput-object v4, Lcom/vkontakte/android/data/Messages;->loadDlgsReq:Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_2

    .line 381
    :catch_0
    move-exception v4

    goto/16 :goto_0
.end method

.method static synthetic lambda$getHistory$5(IIIILcom/vkontakte/android/data/Messages$GetMessagesCallback;)V
    .locals 13
    .param p0, "peer"    # I
    .param p1, "offset"    # I
    .param p2, "count"    # I
    .param p3, "startMsgID"    # I
    .param p4, "callback"    # Lcom/vkontakte/android/data/Messages$GetMessagesCallback;

    .prologue
    .line 680
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "GetHistory "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 682
    const-string/jumbo v1, "vk"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Messages.getHistory("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, p3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p4

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 684
    const/4 v10, 0x0

    .line 685
    .local v10, "numUnread1":I
    const/4 v1, -0x1

    move/from16 v0, p3

    if-ne v0, v1, :cond_0

    .line 686
    invoke-static {p0}, Lcom/vkontakte/android/data/Messages;->getUnreadCount(I)I

    move-result v10

    .line 689
    :cond_0
    :try_start_0
    sget-object v1, Lcom/vkontakte/android/LongPollService;->addMessage:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 693
    :goto_0
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 717
    .local v2, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/Message;>;"
    invoke-static {p0}, Lcom/vkontakte/android/cache/Cache;->getMessagesHistoryCount(I)I

    move-result v7

    .line 718
    .local v7, "ccnt":I
    if-eqz p3, :cond_1

    const/4 v1, -0x1

    move/from16 v0, p3

    if-ne v0, v1, :cond_8

    .line 720
    :cond_1
    const-string/jumbo v1, "vk"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "get history "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ", offset="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    add-int v4, p1, v10

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ", count="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ", cached="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 722
    add-int v1, p1, v10

    const/4 v3, 0x0

    invoke-static {v1, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    if-eqz p1, :cond_6

    move v1, p2

    :goto_1
    add-int/2addr v1, v3

    if-lt v7, v1, :cond_8

    .line 723
    add-int v1, p1, v10

    const/4 v3, 0x0

    invoke-static {v1, v3}, Ljava/lang/Math;->max(II)I

    move-result v1

    invoke-static {p0, v1, p2}, Lcom/vkontakte/android/cache/Cache;->getMessagesHistory(III)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 724
    if-eqz p3, :cond_2

    add-int v1, p1, v10

    if-gtz v1, :cond_7

    :cond_2
    const/4 v1, 0x0

    :goto_2
    move-object/from16 v0, p4

    invoke-interface {v0, v2, v1}, Lcom/vkontakte/android/data/Messages$GetMessagesCallback;->onMessagesLoaded(Ljava/util/ArrayList;I)V

    .line 725
    sget-object v1, Lcom/vkontakte/android/data/Messages;->histories:Landroid/util/LruCache;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_3

    .line 726
    sget-object v1, Lcom/vkontakte/android/data/Messages;->histories:Landroid/util/LruCache;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v1, v3, v4}, Landroid/util/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 728
    :cond_3
    sget-object v1, Lcom/vkontakte/android/data/Messages;->histories:Landroid/util/LruCache;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/util/ArrayList;

    .line 729
    .local v11, "ramCache":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/Message;>;"
    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int v3, p1, v10

    const/4 v4, 0x0

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v3

    if-le v1, v3, :cond_4

    .line 730
    add-int v1, p1, v10

    const/4 v3, 0x0

    invoke-static {v1, v3}, Ljava/lang/Math;->max(II)I

    move-result v1

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v3

    invoke-virtual {v11, v1, v3}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 732
    :cond_4
    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int v3, p1, v10

    const/4 v4, 0x0

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v3

    if-ne v1, v3, :cond_5

    .line 733
    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v9

    .line 734
    .local v9, "len":I
    invoke-virtual {v11, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 735
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/2addr v1, v9

    invoke-virtual {v11, v9, v1}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    .line 738
    .end local v9    # "len":I
    :cond_5
    const-string/jumbo v1, "vk"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Returinig peer "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " history from cache"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 740
    sget-object v1, Lcom/vkontakte/android/LongPollService;->addMessage:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->release()V

    .line 786
    .end local v11    # "ramCache":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/Message;>;"
    :goto_3
    return-void

    .line 722
    :cond_6
    const/4 v1, 0x1

    goto/16 :goto_1

    .line 724
    :cond_7
    add-int v1, p1, v10

    goto/16 :goto_2

    .line 745
    :cond_8
    move v6, v10

    .line 747
    .local v6, "_numUnread":I
    new-instance v12, Lcom/vkontakte/android/api/messages/MessagesGetHistory;

    if-lez p3, :cond_9

    move v1, p1

    :goto_4
    move/from16 v0, p3

    invoke-direct {v12, p0, v1, p2, v0}, Lcom/vkontakte/android/api/messages/MessagesGetHistory;-><init>(IIII)V

    new-instance v1, Lcom/vkontakte/android/data/Messages$7;

    move-object/from16 v3, p4

    move/from16 v4, p3

    move v5, p1

    move v8, p0

    invoke-direct/range {v1 .. v8}, Lcom/vkontakte/android/data/Messages$7;-><init>(Ljava/util/ArrayList;Lcom/vkontakte/android/data/Messages$GetMessagesCallback;IIIII)V

    .line 748
    invoke-virtual {v12, v1}, Lcom/vkontakte/android/api/messages/MessagesGetHistory;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    .line 784
    invoke-virtual {v1}, Lcom/vkontakte/android/api/VKAPIRequest;->execSync()Z

    .line 785
    sget-object v1, Lcom/vkontakte/android/LongPollService;->addMessage:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->release()V

    goto :goto_3

    .line 747
    :cond_9
    const/4 v1, 0x0

    add-int v3, p1, v10

    invoke-static {v1, v3}, Ljava/lang/Math;->max(II)I

    move-result v1

    goto :goto_4

    .line 690
    .end local v2    # "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/Message;>;"
    .end local v6    # "_numUnread":I
    .end local v7    # "ccnt":I
    :catch_0
    move-exception v1

    goto/16 :goto_0
.end method

.method static synthetic lambda$getUnreadCount$4(Lcom/vkontakte/android/data/Messages$GetUnreadCountCallback;I)V
    .locals 1
    .param p0, "callback"    # Lcom/vkontakte/android/data/Messages$GetUnreadCountCallback;
    .param p1, "peer"    # I

    .prologue
    .line 648
    invoke-static {p1}, Lcom/vkontakte/android/data/Messages;->getUnreadCount(I)I

    move-result v0

    invoke-interface {p0, p1, v0}, Lcom/vkontakte/android/data/Messages$GetUnreadCountCallback;->onUnreadCountLoaded(II)V

    return-void
.end method

.method static synthetic lambda$null$1(Ljava/util/ArrayList;IILcom/vkontakte/android/data/Messages$GetDialogsCallback;Ljava/util/ArrayList;)V
    .locals 9
    .param p0, "cached"    # Ljava/util/ArrayList;
    .param p1, "offset"    # I
    .param p2, "count"    # I
    .param p3, "callback"    # Lcom/vkontakte/android/data/Messages$GetDialogsCallback;
    .param p4, "users"    # Ljava/util/ArrayList;

    .prologue
    const v8, 0x77359400

    .line 402
    const-string/jumbo v4, "vk"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "On users loaded "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 404
    new-instance v3, Landroid/util/SparseArray;

    invoke-direct {v3}, Landroid/util/SparseArray;-><init>()V

    .line 405
    .local v3, "u":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/vkontakte/android/UserProfile;>;"
    invoke-virtual {p4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/UserProfile;

    .line 406
    .local v1, "p":Lcom/vkontakte/android/UserProfile;
    iget v5, v1, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-virtual {v3, v5, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_0

    .line 409
    .end local v1    # "p":Lcom/vkontakte/android/UserProfile;
    :cond_0
    const-string/jumbo v4, "vk"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "U="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 411
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_1
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/DialogEntry;

    .line 413
    .local v0, "e":Lcom/vkontakte/android/DialogEntry;
    iget-object v4, v0, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget v4, v4, Lcom/vkontakte/android/UserProfile;->uid:I

    if-le v4, v8, :cond_2

    iget-object v4, v0, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    iget-boolean v4, v4, Lcom/vkontakte/android/Message;->out:Z

    if-nez v4, :cond_2

    .line 414
    iget-object v4, v0, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    iget v4, v4, Lcom/vkontakte/android/Message;->sender:I

    invoke-static {v3, v4}, Lcom/vkontakte/android/utils/Utils;->containsKey(Landroid/util/SparseArray;I)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 415
    iget-object v4, v0, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    iget v4, v4, Lcom/vkontakte/android/Message;->sender:I

    invoke-virtual {v3, v4}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/UserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    iput-object v4, v0, Lcom/vkontakte/android/DialogEntry;->lastMessagePhoto:Ljava/lang/String;

    .line 421
    :cond_2
    :goto_2
    iget-object v4, v0, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget v4, v4, Lcom/vkontakte/android/UserProfile;->uid:I

    if-ge v4, v8, :cond_1

    iget-object v4, v0, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    if-nez v4, :cond_1

    .line 422
    iget-object v4, v0, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget v4, v4, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-static {v3, v4}, Lcom/vkontakte/android/utils/Utils;->containsKey(Landroid/util/SparseArray;I)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 423
    iget-object v4, v0, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget v4, v4, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-virtual {v3, v4}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/UserProfile;

    iput-object v4, v0, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    goto :goto_1

    .line 418
    :cond_3
    const-string/jumbo v4, "vk"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Can\'t find photo for "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, v0, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    iget v7, v7, Lcom/vkontakte/android/Message;->sender:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 425
    :cond_4
    const-string/jumbo v4, "vk"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Can\'t find profile for "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, v0, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget v7, v7, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 429
    .end local v0    # "e":Lcom/vkontakte/android/DialogEntry;
    :cond_5
    sget-object v4, Lcom/vkontakte/android/data/Messages;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int v5, p1, p2

    if-lt v4, v5, :cond_8

    .line 431
    :try_start_0
    sget-object v4, Lcom/vkontakte/android/data/Messages;->updateLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v4}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 435
    :goto_3
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 436
    .local v2, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/DialogEntry;>;"
    sget-object v4, Lcom/vkontakte/android/data/Messages;->dialogs:Ljava/util/ArrayList;

    add-int v5, p1, p2

    invoke-virtual {v4, p1, v5}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_4
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_6

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/DialogEntry;

    .line 437
    .restart local v0    # "e":Lcom/vkontakte/android/DialogEntry;
    new-instance v5, Lcom/vkontakte/android/DialogEntry;

    invoke-direct {v5, v0}, Lcom/vkontakte/android/DialogEntry;-><init>(Lcom/vkontakte/android/DialogEntry;)V

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4

    .line 439
    .end local v0    # "e":Lcom/vkontakte/android/DialogEntry;
    :cond_6
    if-eqz p3, :cond_7

    .line 440
    invoke-interface {p3, v2}, Lcom/vkontakte/android/data/Messages$GetDialogsCallback;->onDialogsLoaded(Ljava/util/ArrayList;)V

    .line 442
    :cond_7
    sget-object v4, Lcom/vkontakte/android/data/Messages;->updateLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v4}, Ljava/util/concurrent/Semaphore;->release()V

    .line 444
    .end local v2    # "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/DialogEntry;>;"
    :cond_8
    return-void

    .line 432
    :catch_0
    move-exception v4

    goto :goto_3
.end method

.method static synthetic lambda$setReadState$3(IZ)V
    .locals 8
    .param p0, "mid"    # I
    .param p1, "state"    # Z

    .prologue
    .line 516
    :try_start_0
    sget-object v5, Lcom/vkontakte/android/data/Messages;->updateLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v5}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 520
    :goto_0
    invoke-static {p0, p1}, Lcom/vkontakte/android/cache/Cache;->setMessageReadState(IZ)V

    .line 521
    sget-object v5, Lcom/vkontakte/android/data/Messages;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/DialogEntry;

    .line 522
    .local v0, "e":Lcom/vkontakte/android/DialogEntry;
    iget-object v6, v0, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    iget v6, v6, Lcom/vkontakte/android/Message;->id:I

    if-ne v6, p0, :cond_0

    .line 523
    iget-object v5, v0, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    iput-boolean p1, v5, Lcom/vkontakte/android/Message;->readState:Z

    .line 529
    .end local v0    # "e":Lcom/vkontakte/android/DialogEntry;
    :cond_1
    sget-object v5, Lcom/vkontakte/android/data/Messages;->histories:Landroid/util/LruCache;

    invoke-virtual {v5}, Landroid/util/LruCache;->snapshot()Ljava/util/Map;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    .line 530
    .local v2, "keys":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 531
    .local v1, "k":I
    sget-object v5, Lcom/vkontakte/android/data/Messages;->histories:Landroid/util/LruCache;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v5, v7}, Landroid/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/ArrayList;

    .line 532
    .local v4, "msgs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/Message;>;"
    if-eqz v4, :cond_2

    .line 535
    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_3
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/Message;

    .line 536
    .local v3, "msg":Lcom/vkontakte/android/Message;
    iget v7, v3, Lcom/vkontakte/android/Message;->id:I

    if-ne v7, p0, :cond_3

    .line 537
    iput-boolean p1, v3, Lcom/vkontakte/android/Message;->readState:Z

    .line 538
    sget-object v5, Lcom/vkontakte/android/data/Messages;->updateLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v5}, Ljava/util/concurrent/Semaphore;->release()V

    .line 544
    .end local v1    # "k":I
    .end local v3    # "msg":Lcom/vkontakte/android/Message;
    .end local v4    # "msgs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/Message;>;"
    :goto_1
    return-void

    .line 543
    :cond_4
    sget-object v5, Lcom/vkontakte/android/data/Messages;->updateLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v5}, Ljava/util/concurrent/Semaphore;->release()V

    goto :goto_1

    .line 517
    .end local v2    # "keys":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    :catch_0
    move-exception v5

    goto :goto_0
.end method

.method public static markAsRead(II)V
    .locals 2
    .param p0, "peer"    # I
    .param p1, "id"    # I

    .prologue
    .line 1161
    new-instance v0, Lcom/vkontakte/android/api/messages/MessagesMarkAsRead;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/api/messages/MessagesMarkAsRead;-><init>(II)V

    new-instance v1, Lcom/vkontakte/android/data/Messages$12;

    invoke-direct {v1, p0, p1}, Lcom/vkontakte/android/data/Messages$12;-><init>(II)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/messages/MessagesMarkAsRead;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 1166
    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    .line 1167
    return-void
.end method

.method public static markAsRead(Ljava/util/ArrayList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1146
    .local p0, "ids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    new-instance v0, Lcom/vkontakte/android/api/messages/MessagesMarkAsRead;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/api/messages/MessagesMarkAsRead;-><init>(Ljava/util/List;)V

    new-instance v1, Lcom/vkontakte/android/data/Messages$11;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/data/Messages$11;-><init>(Ljava/util/ArrayList;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/messages/MessagesMarkAsRead;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 1156
    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    .line 1157
    return-void
.end method

.method public static removeDialog(I)V
    .locals 4
    .param p0, "peer"    # I

    .prologue
    .line 1336
    invoke-static {p0}, Lcom/vkontakte/android/cache/Cache;->deleteDialog(I)V

    .line 1337
    sget-object v2, Lcom/vkontakte/android/data/Messages;->histories:Landroid/util/LruCache;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/util/LruCache;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1339
    :try_start_0
    sget-object v2, Lcom/vkontakte/android/data/Messages;->updateLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v2}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1343
    :goto_0
    sget-object v2, Lcom/vkontakte/android/data/Messages;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 1344
    .local v1, "itr":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/vkontakte/android/DialogEntry;>;"
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1345
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/DialogEntry;

    .line 1346
    .local v0, "e":Lcom/vkontakte/android/DialogEntry;
    iget-object v2, v0, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget v2, v2, Lcom/vkontakte/android/UserProfile;->uid:I

    if-ne v2, p0, :cond_0

    .line 1347
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    .line 1351
    .end local v0    # "e":Lcom/vkontakte/android/DialogEntry;
    :cond_1
    sget-object v2, Lcom/vkontakte/android/data/Messages;->updateLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v2}, Ljava/util/concurrent/Semaphore;->release()V

    .line 1352
    return-void

    .line 1340
    .end local v1    # "itr":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/vkontakte/android/DialogEntry;>;"
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method private static removeFromSending(Lcom/vkontakte/android/Message;)V
    .locals 5
    .param p0, "m"    # Lcom/vkontakte/android/Message;

    .prologue
    .line 1018
    const-string/jumbo v2, "vk"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "remove from sending: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/vkontakte/android/Message;->id:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1019
    sget-object v2, Lcom/vkontakte/android/LongPollService;->sendingMessages:Ljava/util/ArrayList;

    invoke-virtual {v2, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 1020
    sget-object v2, Lcom/vkontakte/android/LongPollService;->sendingMessages:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-nez v2, :cond_4

    sget-object v2, Lcom/vkontakte/android/LongPollService;->pendingReceivedMessages:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_4

    .line 1021
    sget-object v2, Lcom/vkontakte/android/LongPollService;->pendingReceivedMessages:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/Message;

    .line 1022
    .local v0, "msg":Lcom/vkontakte/android/Message;
    iget v3, v0, Lcom/vkontakte/android/Message;->id:I

    iget v4, p0, Lcom/vkontakte/android/Message;->id:I

    if-ne v3, v4, :cond_0

    .line 1023
    sget-object v2, Lcom/vkontakte/android/LongPollService;->pendingReceivedMessages:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 1027
    .end local v0    # "msg":Lcom/vkontakte/android/Message;
    :cond_1
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 1028
    .local v1, "toRemove":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/Message;>;"
    sget-object v2, Lcom/vkontakte/android/LongPollService;->pendingReceivedMessages:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_2
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/Message;

    .line 1029
    .restart local v0    # "msg":Lcom/vkontakte/android/Message;
    iget v3, v0, Lcom/vkontakte/android/Message;->id:I

    invoke-static {v3}, Lcom/vkontakte/android/cache/Cache;->containsMessage(I)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 1030
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 1033
    .end local v0    # "msg":Lcom/vkontakte/android/Message;
    :cond_3
    sget-object v2, Lcom/vkontakte/android/LongPollService;->pendingReceivedMessages:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    .line 1034
    sget-object v2, Lcom/vkontakte/android/LongPollService;->pendingReceivedMessages:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-nez v2, :cond_5

    .line 1042
    .end local v1    # "toRemove":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/Message;>;"
    :cond_4
    return-void

    .line 1037
    .restart local v1    # "toRemove":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/Message;>;"
    :cond_5
    sget-object v2, Lcom/vkontakte/android/LongPollService;->pendingReceivedMessages:Ljava/util/ArrayList;

    invoke-static {v2}, Lcom/vkontakte/android/cache/Cache;->addMessages(Ljava/util/List;)V

    .line 1038
    sget-object v2, Lcom/vkontakte/android/LongPollService;->pendingReceivedMessages:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/Message;

    .line 1039
    .restart local v0    # "msg":Lcom/vkontakte/android/Message;
    invoke-static {v0}, Lcom/vkontakte/android/data/Messages;->broadcastNewMessage(Lcom/vkontakte/android/Message;)V

    goto :goto_1
.end method

.method public static reset()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 1323
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const-string/jumbo v1, "longpoll"

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "pts"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 1325
    :try_start_0
    sget-object v0, Lcom/vkontakte/android/data/Messages;->updateLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1329
    :goto_0
    sget-object v0, Lcom/vkontakte/android/data/Messages;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 1330
    sget-object v0, Lcom/vkontakte/android/data/Messages;->updateLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->release()V

    .line 1331
    sget-object v0, Lcom/vkontakte/android/data/Messages;->histories:Landroid/util/LruCache;

    invoke-virtual {v0}, Landroid/util/LruCache;->evictAll()V

    .line 1332
    sget-object v0, Lcom/vkontakte/android/data/Messages;->pendingUploads:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 1333
    return-void

    .line 1326
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public static resetCache()V
    .locals 1

    .prologue
    .line 1355
    invoke-static {}, Lcom/vkontakte/android/cache/Cache;->deleteAllMessages()V

    .line 1356
    sget-object v0, Lcom/vkontakte/android/data/Messages;->loadDlgsReq:Lcom/vkontakte/android/api/VKAPIRequest;

    if-eqz v0, :cond_0

    .line 1357
    sget-object v0, Lcom/vkontakte/android/data/Messages;->loadDlgsReq:Lcom/vkontakte/android/api/VKAPIRequest;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->cancel()V

    .line 1358
    const/4 v0, 0x0

    sput-object v0, Lcom/vkontakte/android/data/Messages;->loadDlgsReq:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 1360
    :cond_0
    return-void
.end method

.method public static search(Ljava/lang/String;IILcom/vkontakte/android/data/Messages$SearchCallback;)V
    .locals 2
    .param p0, "q"    # Ljava/lang/String;
    .param p1, "offset"    # I
    .param p2, "count"    # I
    .param p3, "callback"    # Lcom/vkontakte/android/data/Messages$SearchCallback;

    .prologue
    .line 1370
    new-instance v0, Lcom/vkontakte/android/api/messages/MessagesSearch;

    invoke-direct {v0, p0, p1, p2}, Lcom/vkontakte/android/api/messages/MessagesSearch;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lcom/vkontakte/android/data/Messages$15;

    invoke-direct {v1, p3}, Lcom/vkontakte/android/data/Messages$15;-><init>(Lcom/vkontakte/android/data/Messages$SearchCallback;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/messages/MessagesSearch;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 1448
    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    .line 1449
    return-void
.end method

.method public static searchDialogs(Ljava/lang/String;Lcom/vkontakte/android/data/Messages$SearchDialogsCallback;)V
    .locals 2
    .param p0, "query"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "callback"    # Lcom/vkontakte/android/data/Messages$SearchDialogsCallback;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 1452
    new-instance v0, Lcom/vkontakte/android/api/messages/MessagesSearchDialogs;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/api/messages/MessagesSearchDialogs;-><init>(Ljava/lang/String;)V

    new-instance v1, Lcom/vkontakte/android/data/Messages$16;

    invoke-direct {v1, p1}, Lcom/vkontakte/android/data/Messages$16;-><init>(Lcom/vkontakte/android/data/Messages$SearchDialogsCallback;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/messages/MessagesSearchDialogs;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 1466
    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    .line 1467
    return-void
.end method

.method public static send(ILjava/lang/String;Ljava/util/List;Ljava/util/List;I)Lcom/vkontakte/android/Message;
    .locals 7
    .param p0, "peer"    # I
    .param p1, "text"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p4, "_id"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/attachments/Attachment;",
            ">;",
            "Ljava/util/List",
            "<*>;I)",
            "Lcom/vkontakte/android/Message;"
        }
    .end annotation

    .prologue
    .local p2, "attachments":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/attachments/Attachment;>;"
    .local p3, "fwd":Ljava/util/List;, "Ljava/util/List<*>;"
    const/4 v5, 0x0

    .line 796
    move v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    move-object v6, v5

    invoke-static/range {v0 .. v6}, Lcom/vkontakte/android/data/Messages;->send(ILjava/lang/String;Ljava/util/List;Ljava/util/List;ILjava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/Message;

    move-result-object v0

    return-object v0
.end method

.method public static send(ILjava/lang/String;Ljava/util/List;Ljava/util/List;ILjava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/Message;
    .locals 14
    .param p0, "peer"    # I
    .param p1, "text"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p4, "_id"    # I
    .param p5, "ref"    # Ljava/lang/String;
    .param p6, "refSource"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/attachments/Attachment;",
            ">;",
            "Ljava/util/List",
            "<*>;I",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lcom/vkontakte/android/Message;"
        }
    .end annotation

    .prologue
    .line 800
    .local p2, "attachments":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/attachments/Attachment;>;"
    .local p3, "fwd":Ljava/util/List;, "Ljava/util/List<*>;"
    new-instance v3, Lcom/vkontakte/android/Message;

    invoke-direct {v3}, Lcom/vkontakte/android/Message;-><init>()V

    .line 802
    .local v3, "m":Lcom/vkontakte/android/Message;
    invoke-static/range {p5 .. p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 803
    const-string/jumbo v1, "ref"

    move-object/from16 v0, p5

    invoke-virtual {v3, v1, v0}, Lcom/vkontakte/android/Message;->putStringExtra(Ljava/lang/String;Ljava/lang/String;)V

    .line 805
    :cond_0
    invoke-static/range {p6 .. p6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 806
    const-string/jumbo v1, "ref_source"

    move-object/from16 v0, p6

    invoke-virtual {v3, v1, v0}, Lcom/vkontakte/android/Message;->putStringExtra(Ljava/lang/String;Ljava/lang/String;)V

    .line 809
    :cond_1
    if-nez p4, :cond_5

    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const-string/jumbo v2, "longpoll"

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string/jumbo v2, "tmp_msg_id"

    const/4 v4, -0x1

    invoke-interface {v1, v2, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v11

    .line 810
    .local v11, "id":I
    :goto_0
    if-nez p4, :cond_2

    .line 811
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const-string/jumbo v2, "longpoll"

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string/jumbo v2, "tmp_msg_id"

    add-int/lit8 v4, v11, -0x1

    invoke-interface {v1, v2, v4}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 813
    :cond_2
    iput v11, v3, Lcom/vkontakte/android/Message;->id:I

    .line 814
    iput p0, v3, Lcom/vkontakte/android/Message;->peer:I

    .line 815
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v1

    if-eq p0, v1, :cond_6

    const/4 v1, 0x1

    :goto_1
    iput-boolean v1, v3, Lcom/vkontakte/android/Message;->out:Z

    .line 816
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v1

    iput v1, v3, Lcom/vkontakte/android/Message;->sender:I

    .line 817
    invoke-static {}, Lcom/vkontakte/android/TimeUtils;->getCurrentTime()I

    move-result v1

    iput v1, v3, Lcom/vkontakte/android/Message;->time:I

    .line 818
    invoke-virtual {v3}, Lcom/vkontakte/android/Message;->generateRandomId()V

    .line 820
    invoke-virtual {v3, p1}, Lcom/vkontakte/android/Message;->setText(Ljava/lang/String;)V

    .line 821
    move-object/from16 v0, p2

    invoke-virtual {v3, v0}, Lcom/vkontakte/android/Message;->addAttachments(Ljava/util/Collection;)V

    .line 822
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 823
    .local v5, "fwdIds":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    if-eqz p3, :cond_7

    .line 824
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_2
    invoke-interface/range {p3 .. p3}, Ljava/util/List;->size()I

    move-result v1

    if-ge v10, v1, :cond_7

    .line 825
    move-object/from16 v0, p3

    invoke-interface {v0, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    .line 826
    .local v9, "fm":Ljava/lang/Object;
    instance-of v1, v9, Lcom/vkontakte/android/Message;

    if-eqz v1, :cond_3

    move-object v1, v9

    .line 827
    check-cast v1, Lcom/vkontakte/android/Message;

    iget v1, v1, Lcom/vkontakte/android/Message;->id:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-object v1, v9

    .line 828
    check-cast v1, Lcom/vkontakte/android/Message;

    invoke-virtual {v1}, Lcom/vkontakte/android/Message;->forward()Lcom/vkontakte/android/Message$FwdMessage;

    move-result-object v1

    invoke-interface/range {p3 .. p3}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v3, v1, v2}, Lcom/vkontakte/android/Message;->addFwdMessage(Lcom/vkontakte/android/Message$FwdMessage;I)V

    .line 830
    :cond_3
    instance-of v1, v9, Lcom/vkontakte/android/Message$FwdMessage;

    if-eqz v1, :cond_4

    move-object v1, v9

    .line 831
    check-cast v1, Lcom/vkontakte/android/Message$FwdMessage;

    iget v1, v1, Lcom/vkontakte/android/Message$FwdMessage;->id:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 832
    check-cast v9, Lcom/vkontakte/android/Message$FwdMessage;

    .end local v9    # "fm":Ljava/lang/Object;
    invoke-interface/range {p3 .. p3}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {v3, v9, v1}, Lcom/vkontakte/android/Message;->addFwdMessage(Lcom/vkontakte/android/Message$FwdMessage;I)V

    .line 824
    :cond_4
    add-int/lit8 v10, v10, 0x1

    goto :goto_2

    .end local v5    # "fwdIds":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    .end local v10    # "i":I
    .end local v11    # "id":I
    :cond_5
    move/from16 v11, p4

    .line 809
    goto/16 :goto_0

    .line 815
    .restart local v11    # "id":I
    :cond_6
    const/4 v1, 0x0

    goto :goto_1

    .line 836
    .restart local v5    # "fwdIds":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    :cond_7
    const/4 v6, 0x0

    .line 837
    .local v6, "geo":Lcom/vkontakte/android/attachments/GeoAttachment;
    invoke-interface/range {p2 .. p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_8
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_9

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/vkontakte/android/attachments/Attachment;

    .line 838
    .local v7, "att":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v2, v7, Lcom/vkontakte/android/attachments/GeoAttachment;

    if-eqz v2, :cond_8

    .line 839
    move-object/from16 v0, p2

    invoke-interface {v0, v7}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-object v6, v7

    .line 840
    check-cast v6, Lcom/vkontakte/android/attachments/GeoAttachment;

    .line 845
    .end local v7    # "att":Lcom/vkontakte/android/attachments/Attachment;
    :cond_9
    const/4 v13, -0x1

    .line 846
    .local v13, "uploadId":I
    invoke-interface/range {p2 .. p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_b

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/vkontakte/android/attachments/Attachment;

    .line 847
    .restart local v7    # "att":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v2, v7, Lcom/vkontakte/android/attachments/PendingAttachment;

    if-eqz v2, :cond_a

    .line 848
    check-cast v7, Lcom/vkontakte/android/attachments/PendingAttachment;

    .end local v7    # "att":Lcom/vkontakte/android/attachments/Attachment;
    invoke-interface {v7}, Lcom/vkontakte/android/attachments/PendingAttachment;->getUploadId()I

    move-result v13

    .line 853
    :cond_b
    const/4 v1, -0x1

    if-ne v13, v1, :cond_c

    .line 855
    sget-object v1, Lcom/vkontakte/android/LongPollService;->sendingMessages:Ljava/util/ArrayList;

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 856
    sget-object v1, Lcom/vkontakte/android/data/Messages;->sendLock:Lcom/vkontakte/android/background/CountingLock;

    invoke-virtual {v1}, Lcom/vkontakte/android/background/CountingLock;->increment()V

    .line 857
    new-instance v1, Lcom/vkontakte/android/api/messages/MessagesSend;

    move v2, p0

    move-object/from16 v4, p2

    invoke-direct/range {v1 .. v6}, Lcom/vkontakte/android/api/messages/MessagesSend;-><init>(ILcom/vkontakte/android/Message;Ljava/util/List;Ljava/util/List;Lcom/vkontakte/android/attachments/GeoAttachment;)V

    new-instance v2, Lcom/vkontakte/android/data/Messages$8;

    invoke-direct {v2, v3, v11}, Lcom/vkontakte/android/data/Messages$8;-><init>(Lcom/vkontakte/android/Message;I)V

    .line 858
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/messages/MessagesSend;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    .line 892
    invoke-virtual {v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    .line 908
    :goto_3
    const/4 v1, 0x0

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/auth/VKAccount;->getPhoto()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v1, v2}, Lcom/vkontakte/android/data/Messages;->add(Lcom/vkontakte/android/Message;Lcom/vkontakte/android/UserProfile;Ljava/lang/String;)V

    .line 909
    return-object v3

    .line 894
    :cond_c
    const/4 v10, 0x0

    .restart local v10    # "i":I
    :goto_4
    iget-object v1, v3, Lcom/vkontakte/android/Message;->attachments:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v10, v1, :cond_f

    .line 895
    iget-object v1, v3, Lcom/vkontakte/android/Message;->attachments:Ljava/util/List;

    invoke-interface {v1, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/vkontakte/android/attachments/Attachment;

    .line 896
    .restart local v7    # "att":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v1, v7, Lcom/vkontakte/android/attachments/PendingAttachment;

    if-eqz v1, :cond_d

    move-object v12, v7

    .line 897
    check-cast v12, Lcom/vkontakte/android/attachments/PendingAttachment;

    .line 898
    .local v12, "pa":Lcom/vkontakte/android/attachments/PendingAttachment;
    invoke-interface {v12}, Lcom/vkontakte/android/attachments/PendingAttachment;->getUploadId()I

    move-result v1

    invoke-static {v1}, Lcom/vkontakte/android/upload/UploaderIntentService;->hasTaskWithID(I)Z

    move-result v1

    if-nez v1, :cond_e

    .line 899
    sget-object v8, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    .line 900
    .local v8, "context":Landroid/content/Context;
    invoke-interface {v12, v8}, Lcom/vkontakte/android/attachments/PendingAttachment;->createUploadTask(Landroid/content/Context;)Lcom/vkontakte/android/upload/UploadTask;

    move-result-object v1

    invoke-static {v8, v1}, Lcom/vkontakte/android/upload/Upload;->start(Landroid/content/Context;Lcom/vkontakte/android/upload/UploadTask;)V

    .line 894
    .end local v8    # "context":Landroid/content/Context;
    .end local v12    # "pa":Lcom/vkontakte/android/attachments/PendingAttachment;
    :cond_d
    :goto_5
    add-int/lit8 v10, v10, 0x1

    goto :goto_4

    .line 901
    .restart local v12    # "pa":Lcom/vkontakte/android/attachments/PendingAttachment;
    :cond_e
    invoke-interface {v12}, Lcom/vkontakte/android/attachments/PendingAttachment;->getUploadId()I

    move-result v1

    invoke-static {v1}, Lcom/vkontakte/android/upload/UploaderIntentService;->isTaskFailed(I)Z

    move-result v1

    if-eqz v1, :cond_d

    .line 902
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-interface {v12}, Lcom/vkontakte/android/attachments/PendingAttachment;->getUploadId()I

    move-result v2

    invoke-static {v1, v2}, Lcom/vkontakte/android/upload/Upload;->retry(Landroid/content/Context;I)V

    goto :goto_5

    .line 906
    .end local v7    # "att":Lcom/vkontakte/android/attachments/Attachment;
    .end local v12    # "pa":Lcom/vkontakte/android/attachments/PendingAttachment;
    :cond_f
    sget-object v1, Lcom/vkontakte/android/data/Messages;->pendingUploads:Ljava/util/ArrayList;

    new-instance v2, Lcom/vkontakte/android/Message;

    invoke-direct {v2, v3}, Lcom/vkontakte/android/Message;-><init>(Lcom/vkontakte/android/Message;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3
.end method

.method public static send(Lcom/vkontakte/android/Message;)Lcom/vkontakte/android/Message;
    .locals 7
    .param p0, "m"    # Lcom/vkontakte/android/Message;

    .prologue
    .line 790
    iget-object v0, p0, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    const-string/jumbo v1, "ref"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 791
    .local v5, "ref":Ljava/lang/String;
    iget-object v0, p0, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    const-string/jumbo v1, "ref_source"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 792
    .local v6, "refSource":Ljava/lang/String;
    iget v0, p0, Lcom/vkontakte/android/Message;->peer:I

    iget-object v1, p0, Lcom/vkontakte/android/Message;->text:Ljava/lang/String;

    iget-object v2, p0, Lcom/vkontakte/android/Message;->attachments:Ljava/util/List;

    iget-object v3, p0, Lcom/vkontakte/android/Message;->fwdMessages:Ljava/util/List;

    iget v4, p0, Lcom/vkontakte/android/Message;->id:I

    invoke-static/range {v0 .. v6}, Lcom/vkontakte/android/data/Messages;->send(ILjava/lang/String;Ljava/util/List;Ljava/util/List;ILjava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/Message;

    move-result-object v0

    return-object v0
.end method

.method public static setDnd(IIZ)V
    .locals 0
    .param p0, "peer"    # I
    .param p1, "time"    # I
    .param p2, "mute"    # Z

    .prologue
    .line 1524
    return-void
.end method

.method public static setReadState(IZ)V
    .locals 1
    .param p0, "mid"    # I
    .param p1, "state"    # Z

    .prologue
    .line 514
    invoke-static {p0, p1}, Lcom/vkontakte/android/data/Messages$$Lambda$3;->lambdaFactory$(IZ)Ljava/lang/Runnable;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/api/APIController;->runInBg(Ljava/lang/Runnable;)V

    .line 545
    return-void
.end method

.method public static setReadStateBefore(II)V
    .locals 3
    .param p0, "peer"    # I
    .param p1, "mid"    # I

    .prologue
    const/4 v1, 0x1

    .line 548
    invoke-static {p0, p1, v1}, Lcom/vkontakte/android/data/Messages;->setReadStateUpto(IIZ)V

    .line 549
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {p0, p1, v1}, Lcom/vkontakte/android/LongPollService;->createActionMessageRSteteChangedIntent(IIZ)Landroid/content/Intent;

    move-result-object v1

    const-string/jumbo v2, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 551
    return-void
.end method

.method public static setReadStateUpto(IIZ)V
    .locals 6
    .param p0, "peer"    # I
    .param p1, "mid"    # I
    .param p2, "in"    # Z

    .prologue
    const/4 v5, 0x1

    .line 554
    if-nez p2, :cond_0

    .line 555
    sget-object v3, Lcom/vkontakte/android/data/Messages;->sendLock:Lcom/vkontakte/android/background/CountingLock;

    invoke-virtual {v3}, Lcom/vkontakte/android/background/CountingLock;->await()V

    .line 558
    :cond_0
    :try_start_0
    sget-object v3, Lcom/vkontakte/android/data/Messages;->updateLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v3}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 562
    :goto_0
    invoke-static {p1, p0, v5, p2}, Lcom/vkontakte/android/cache/Cache;->setMessageReadStateUpto(IIZZ)V

    .line 563
    sget-object v3, Lcom/vkontakte/android/data/Messages;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/DialogEntry;

    .line 564
    .local v0, "e":Lcom/vkontakte/android/DialogEntry;
    iget-object v4, v0, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    iget v4, v4, Lcom/vkontakte/android/Message;->peer:I

    if-ne v4, p0, :cond_1

    iget-object v4, v0, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    iget v4, v4, Lcom/vkontakte/android/Message;->id:I

    if-gt v4, p1, :cond_1

    iget-object v4, v0, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    iget-boolean v4, v4, Lcom/vkontakte/android/Message;->out:Z

    if-eq v4, p2, :cond_1

    .line 565
    iget-object v3, v0, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    iput-boolean v5, v3, Lcom/vkontakte/android/Message;->readState:Z

    .line 566
    const/4 v3, 0x0

    iput v3, v0, Lcom/vkontakte/android/DialogEntry;->unreadCount:I

    .line 572
    .end local v0    # "e":Lcom/vkontakte/android/DialogEntry;
    :cond_2
    sget-object v3, Lcom/vkontakte/android/data/Messages;->histories:Landroid/util/LruCache;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/ArrayList;

    .line 573
    .local v2, "msgs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/Message;>;"
    if-eqz v2, :cond_4

    .line 574
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_3
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/Message;

    .line 575
    .local v1, "msg":Lcom/vkontakte/android/Message;
    iget v4, v1, Lcom/vkontakte/android/Message;->id:I

    if-gt v4, p1, :cond_3

    iget-boolean v4, v1, Lcom/vkontakte/android/Message;->out:Z

    if-eq v4, p2, :cond_3

    .line 576
    iput-boolean v5, v1, Lcom/vkontakte/android/Message;->readState:Z

    goto :goto_1

    .line 580
    .end local v1    # "msg":Lcom/vkontakte/android/Message;
    :cond_4
    sget-object v3, Lcom/vkontakte/android/data/Messages;->updateLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v3}, Ljava/util/concurrent/Semaphore;->release()V

    .line 581
    return-void

    .line 559
    .end local v2    # "msgs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/Message;>;"
    :catch_0
    move-exception v3

    goto :goto_0
.end method

.method public static uploadDone(ILcom/vkontakte/android/attachments/Attachment;)V
    .locals 13
    .param p0, "id"    # I
    .param p1, "result"    # Lcom/vkontakte/android/attachments/Attachment;

    .prologue
    const/4 v12, 0x0

    .line 913
    const/4 v2, 0x0

    .line 914
    .local v2, "msg":Lcom/vkontakte/android/Message;
    sget-object v0, Lcom/vkontakte/android/data/Messages;->pendingUploads:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/vkontakte/android/Message;

    .line 915
    .local v9, "m":Lcom/vkontakte/android/Message;
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_0
    iget-object v1, v9, Lcom/vkontakte/android/Message;->attachments:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v8, v1, :cond_1

    .line 916
    iget-object v1, v9, Lcom/vkontakte/android/Message;->attachments:Ljava/util/List;

    invoke-interface {v1, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/vkontakte/android/attachments/Attachment;

    .line 917
    .local v6, "a":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v1, v6, Lcom/vkontakte/android/attachments/PendingAttachment;

    if-eqz v1, :cond_4

    check-cast v6, Lcom/vkontakte/android/attachments/PendingAttachment;

    .end local v6    # "a":Lcom/vkontakte/android/attachments/Attachment;
    invoke-interface {v6}, Lcom/vkontakte/android/attachments/PendingAttachment;->getUploadId()I

    move-result v1

    if-ne v1, p0, :cond_4

    .line 918
    iget-object v1, v9, Lcom/vkontakte/android/Message;->attachments:Ljava/util/List;

    invoke-interface {v1, v8, p1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 919
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const/4 v10, 0x0

    invoke-virtual {v1, v12, v10}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string/jumbo v10, "userphoto"

    const-string/jumbo v11, ""

    invoke-interface {v1, v10, v11}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v9, v12, v1}, Lcom/vkontakte/android/data/Messages;->add(Lcom/vkontakte/android/Message;Lcom/vkontakte/android/UserProfile;Ljava/lang/String;)V

    .line 920
    move-object v2, v9

    .line 924
    :cond_1
    if-eqz v2, :cond_0

    .line 928
    .end local v8    # "i":I
    .end local v9    # "m":Lcom/vkontakte/android/Message;
    :cond_2
    if-nez v2, :cond_5

    .line 986
    :cond_3
    :goto_1
    return-void

    .line 915
    .restart local v8    # "i":I
    .restart local v9    # "m":Lcom/vkontakte/android/Message;
    :cond_4
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 931
    .end local v8    # "i":I
    .end local v9    # "m":Lcom/vkontakte/android/Message;
    :cond_5
    const/4 v8, 0x0

    .restart local v8    # "i":I
    :goto_2
    iget-object v0, v2, Lcom/vkontakte/android/Message;->attachments:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge v8, v0, :cond_6

    .line 932
    iget-object v0, v2, Lcom/vkontakte/android/Message;->attachments:Ljava/util/List;

    invoke-interface {v0, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/vkontakte/android/attachments/Attachment;

    .line 933
    .local v7, "att":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v0, v7, Lcom/vkontakte/android/attachments/PendingAttachment;

    if-nez v0, :cond_3

    .line 931
    add-int/lit8 v8, v8, 0x1

    goto :goto_2

    .line 937
    .end local v7    # "att":Lcom/vkontakte/android/attachments/Attachment;
    :cond_6
    sget-object v0, Lcom/vkontakte/android/data/Messages;->pendingUploads:Ljava/util/ArrayList;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 938
    const/4 v5, 0x0

    .line 939
    .local v5, "geo":Lcom/vkontakte/android/attachments/GeoAttachment;
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 940
    .local v3, "attachments":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/Attachment;>;"
    iget-object v0, v2, Lcom/vkontakte/android/Message;->attachments:Ljava/util/List;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 941
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_7
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_8

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/vkontakte/android/attachments/Attachment;

    .line 942
    .restart local v7    # "att":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v1, v7, Lcom/vkontakte/android/attachments/GeoAttachment;

    if-eqz v1, :cond_7

    .line 943
    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-object v5, v7

    .line 944
    check-cast v5, Lcom/vkontakte/android/attachments/GeoAttachment;

    .line 948
    .end local v7    # "att":Lcom/vkontakte/android/attachments/Attachment;
    :cond_8
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 949
    .local v4, "fwdIds":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    const/4 v8, 0x0

    :goto_3
    iget-object v0, v2, Lcom/vkontakte/android/Message;->fwdMessages:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge v8, v0, :cond_9

    .line 950
    iget-object v0, v2, Lcom/vkontakte/android/Message;->fwdMessages:Ljava/util/List;

    invoke-interface {v0, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/Message$FwdMessage;

    iget v0, v0, Lcom/vkontakte/android/Message$FwdMessage;->id:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 949
    add-int/lit8 v8, v8, 0x1

    goto :goto_3

    .line 952
    :cond_9
    move-object v9, v2

    .line 954
    .restart local v9    # "m":Lcom/vkontakte/android/Message;
    sget-object v0, Lcom/vkontakte/android/data/Messages;->sendLock:Lcom/vkontakte/android/background/CountingLock;

    invoke-virtual {v0}, Lcom/vkontakte/android/background/CountingLock;->increment()V

    .line 955
    sget-object v0, Lcom/vkontakte/android/LongPollService;->sendingMessages:Ljava/util/ArrayList;

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 956
    new-instance v0, Lcom/vkontakte/android/api/messages/MessagesSend;

    iget v1, v2, Lcom/vkontakte/android/Message;->peer:I

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/api/messages/MessagesSend;-><init>(ILcom/vkontakte/android/Message;Ljava/util/List;Ljava/util/List;Lcom/vkontakte/android/attachments/GeoAttachment;)V

    new-instance v1, Lcom/vkontakte/android/data/Messages$9;

    invoke-direct {v1, v9}, Lcom/vkontakte/android/data/Messages$9;-><init>(Lcom/vkontakte/android/Message;)V

    .line 957
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/messages/MessagesSend;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 985
    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    goto/16 :goto_1
.end method

.method public static uploadFailed(I)V
    .locals 7
    .param p0, "id"    # I

    .prologue
    .line 989
    const/4 v4, 0x0

    .line 990
    .local v4, "msg":Lcom/vkontakte/android/Message;
    sget-object v5, Lcom/vkontakte/android/data/Messages;->pendingUploads:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/Message;

    .line 991
    .local v3, "m":Lcom/vkontakte/android/Message;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v6, v3, Lcom/vkontakte/android/Message;->attachments:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    if-ge v1, v6, :cond_1

    .line 992
    iget-object v6, v3, Lcom/vkontakte/android/Message;->attachments:Ljava/util/List;

    invoke-interface {v6, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/Attachment;

    .line 994
    .local v0, "a":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v6, v0, Lcom/vkontakte/android/attachments/PendingAttachment;

    if-eqz v6, :cond_3

    .line 995
    check-cast v0, Lcom/vkontakte/android/attachments/PendingAttachment;

    .end local v0    # "a":Lcom/vkontakte/android/attachments/Attachment;
    invoke-interface {v0}, Lcom/vkontakte/android/attachments/PendingAttachment;->getUploadId()I

    move-result v6

    if-ne v6, p0, :cond_3

    .line 996
    move-object v4, v3

    .line 1001
    :cond_1
    if-eqz v4, :cond_0

    .line 1005
    .end local v1    # "i":I
    .end local v3    # "m":Lcom/vkontakte/android/Message;
    :cond_2
    if-nez v4, :cond_4

    .line 1015
    :goto_1
    return-void

    .line 991
    .restart local v1    # "i":I
    .restart local v3    # "m":Lcom/vkontakte/android/Message;
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1008
    .end local v1    # "i":I
    .end local v3    # "m":Lcom/vkontakte/android/Message;
    :cond_4
    sget-object v5, Lcom/vkontakte/android/data/Messages;->pendingUploads:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 1009
    invoke-static {v4}, Lcom/vkontakte/android/data/Messages;->removeFromSending(Lcom/vkontakte/android/Message;)V

    .line 1010
    const/4 v5, 0x1

    iput-boolean v5, v4, Lcom/vkontakte/android/Message;->sendFailed:Z

    .line 1011
    const/4 v5, 0x0

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v6

    invoke-virtual {v6}, Lcom/vkontakte/android/auth/VKAccount;->getPhoto()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcom/vkontakte/android/data/Messages;->add(Lcom/vkontakte/android/Message;Lcom/vkontakte/android/UserProfile;Ljava/lang/String;)V

    .line 1012
    new-instance v2, Landroid/content/Intent;

    const-string/jumbo v5, "com.vkontakte.android.MESSAGE_SEND_FAILED"

    invoke-direct {v2, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1013
    .local v2, "intent":Landroid/content/Intent;
    const-string/jumbo v5, "id"

    iget v6, v4, Lcom/vkontakte/android/Message;->id:I

    invoke-virtual {v2, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1014
    sget-object v5, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const-string/jumbo v6, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v5, v2, v6}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    goto :goto_1
.end method
