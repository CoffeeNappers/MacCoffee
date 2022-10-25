.class final Lcom/vkontakte/android/data/Messages$3;
.super Ljava/lang/Object;
.source "Messages.java"

# interfaces
.implements Lcom/vkontakte/android/data/Messages$GetChatUsersCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/data/Messages;->add(Lcom/vkontakte/android/Message;Lcom/vkontakte/android/UserProfile;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$msg:Lcom/vkontakte/android/Message;

.field final synthetic val$senderPhoto:Ljava/lang/String;

.field final synthetic val$unreadCount:I


# direct methods
.method constructor <init>(Lcom/vkontakte/android/Message;Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 270
    iput-object p1, p0, Lcom/vkontakte/android/data/Messages$3;->val$msg:Lcom/vkontakte/android/Message;

    iput-object p2, p0, Lcom/vkontakte/android/data/Messages$3;->val$senderPhoto:Ljava/lang/String;

    iput p3, p0, Lcom/vkontakte/android/data/Messages$3;->val$unreadCount:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onUsersLoaded(Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)V
    .locals 10
    .param p2, "title"    # Ljava/lang/String;
    .param p3, "photo"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/ChatUser;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .local p1, "users":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/ChatUser;>;"
    const v7, 0x77359400

    const/4 v9, 0x0

    .line 274
    new-instance v3, Lcom/vkontakte/android/UserProfile;

    invoke-direct {v3}, Lcom/vkontakte/android/UserProfile;-><init>()V

    .line 275
    .local v3, "p":Lcom/vkontakte/android/UserProfile;
    iput-object p2, v3, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    .line 276
    if-nez p2, :cond_0

    .line 277
    iget-object v5, p0, Lcom/vkontakte/android/data/Messages$3;->val$msg:Lcom/vkontakte/android/Message;

    iget-object v5, v5, Lcom/vkontakte/android/Message;->title:Ljava/lang/String;

    iput-object v5, v3, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    .line 279
    :cond_0
    iget-object v5, p0, Lcom/vkontakte/android/data/Messages$3;->val$msg:Lcom/vkontakte/android/Message;

    iget v5, v5, Lcom/vkontakte/android/Message;->peer:I

    iput v5, v3, Lcom/vkontakte/android/UserProfile;->uid:I

    .line 280
    if-eqz p3, :cond_3

    .line 281
    iput-object p3, v3, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    .line 285
    :cond_1
    :goto_0
    new-instance v2, Lcom/vkontakte/android/DialogEntry;

    invoke-direct {v2}, Lcom/vkontakte/android/DialogEntry;-><init>()V

    .line 286
    .local v2, "e":Lcom/vkontakte/android/DialogEntry;
    iget-object v5, p0, Lcom/vkontakte/android/data/Messages$3;->val$msg:Lcom/vkontakte/android/Message;

    iput-object v5, v2, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    .line 287
    iget-object v5, p0, Lcom/vkontakte/android/data/Messages$3;->val$senderPhoto:Ljava/lang/String;

    iput-object v5, v2, Lcom/vkontakte/android/DialogEntry;->lastMessagePhoto:Ljava/lang/String;

    .line 288
    iput-object v3, v2, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    .line 289
    iget v5, p0, Lcom/vkontakte/android/data/Messages$3;->val$unreadCount:I

    iput v5, v2, Lcom/vkontakte/android/DialogEntry;->unreadCount:I

    .line 291
    :try_start_0
    sget-object v5, Lcom/vkontakte/android/data/Messages;->updateLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v5}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 295
    :goto_1
    invoke-static {}, Lcom/vkontakte/android/data/Messages;->access$000()Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5, v9, v2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 296
    sget-object v5, Lcom/vkontakte/android/data/Messages;->updateLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v5}, Ljava/util/concurrent/Semaphore;->release()V

    .line 297
    if-nez p2, :cond_2

    .line 299
    :try_start_1
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 300
    .local v0, "args":Lorg/json/JSONObject;
    const-string/jumbo v5, "chat_id"

    iget-object v6, p0, Lcom/vkontakte/android/data/Messages$3;->val$msg:Lcom/vkontakte/android/Message;

    iget v6, v6, Lcom/vkontakte/android/Message;->peer:I

    sub-int/2addr v6, v7

    invoke-virtual {v0, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 301
    const-string/jumbo v5, "fields"

    const-string/jumbo v6, "photo_rec,photo_medium_rec,sex"

    invoke-virtual {v0, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 302
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 303
    .local v1, "data":Lorg/json/JSONObject;
    const-string/jumbo v5, "id"

    iget-object v6, p0, Lcom/vkontakte/android/data/Messages$3;->val$msg:Lcom/vkontakte/android/Message;

    iget v6, v6, Lcom/vkontakte/android/Message;->peer:I

    sub-int/2addr v6, v7

    invoke-virtual {v1, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 304
    const-string/jumbo v5, "messages.getChat"

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    const-string/jumbo v7, "getChatUsersResult"

    const/4 v8, 0x0

    new-array v8, v8, [Ljava/lang/Class;

    invoke-virtual {v6, v7, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    invoke-static {v5, v0, v6, v1}, Lcom/vkontakte/android/cache/Cache;->putApiRequest(Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/reflect/Method;Lorg/json/JSONObject;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 309
    .end local v0    # "args":Lorg/json/JSONObject;
    .end local v1    # "data":Lorg/json/JSONObject;
    :cond_2
    :goto_2
    return-void

    .line 282
    .end local v2    # "e":Lcom/vkontakte/android/DialogEntry;
    :cond_3
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-lez v5, :cond_1

    .line 283
    invoke-static {p1}, Lcom/vkontakte/android/data/Messages;->createChatPhoto(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v3, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    goto :goto_0

    .line 305
    .restart local v2    # "e":Lcom/vkontakte/android/DialogEntry;
    :catch_0
    move-exception v4

    .line 306
    .local v4, "x":Ljava/lang/Exception;
    new-array v5, v9, [Ljava/lang/Object;

    invoke-static {v4, v5}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_2

    .line 292
    .end local v4    # "x":Ljava/lang/Exception;
    :catch_1
    move-exception v5

    goto :goto_1
.end method
