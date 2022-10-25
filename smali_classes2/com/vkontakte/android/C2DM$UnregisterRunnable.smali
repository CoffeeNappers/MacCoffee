.class Lcom/vkontakte/android/C2DM$UnregisterRunnable;
.super Ljava/lang/Object;
.source "C2DM.java"

# interfaces
.implements Lcom/vkontakte/android/C2DM$ThrowableRunnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/C2DM;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "UnregisterRunnable"
.end annotation


# instance fields
.field final accessToken:Ljava/lang/String;

.field final ctx:Landroid/content/Context;

.field final prefsGcm:Landroid/content/SharedPreferences;

.field final secret:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/content/SharedPreferences;)V
    .locals 0
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "accessToken"    # Ljava/lang/String;
    .param p3, "secret"    # Ljava/lang/String;
    .param p4, "prefsGcm"    # Landroid/content/SharedPreferences;

    .prologue
    .line 151
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 152
    iput-object p1, p0, Lcom/vkontakte/android/C2DM$UnregisterRunnable;->ctx:Landroid/content/Context;

    .line 153
    iput-object p2, p0, Lcom/vkontakte/android/C2DM$UnregisterRunnable;->accessToken:Ljava/lang/String;

    .line 154
    iput-object p3, p0, Lcom/vkontakte/android/C2DM$UnregisterRunnable;->secret:Ljava/lang/String;

    .line 155
    iput-object p4, p0, Lcom/vkontakte/android/C2DM$UnregisterRunnable;->prefsGcm:Landroid/content/SharedPreferences;

    .line 156
    return-void
.end method


# virtual methods
.method public run()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 160
    iget-object v3, p0, Lcom/vkontakte/android/C2DM$UnregisterRunnable;->ctx:Landroid/content/Context;

    invoke-static {v3}, Lcom/google/android/gms/iid/InstanceID;->getInstance(Landroid/content/Context;)Lcom/google/android/gms/iid/InstanceID;

    move-result-object v3

    const-string/jumbo v4, "841415684880"

    const-string/jumbo v5, "GCM"

    invoke-virtual {v3, v4, v5}, Lcom/google/android/gms/iid/InstanceID;->deleteToken(Ljava/lang/String;Ljava/lang/String;)V

    .line 162
    new-array v3, v7, [Ljava/lang/Object;

    const-string/jumbo v4, "Kill GCM"

    aput-object v4, v3, v6

    invoke-static {v3}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 164
    iget-object v3, p0, Lcom/vkontakte/android/C2DM$UnregisterRunnable;->prefsGcm:Landroid/content/SharedPreferences;

    const-string/jumbo v4, "reg"

    const-string/jumbo v5, ""

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 165
    .local v2, "token":Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 166
    new-array v3, v7, [Ljava/lang/Object;

    const-string/jumbo v4, "Unregister does is not need"

    aput-object v4, v3, v6

    invoke-static {v3}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 167
    iget-object v3, p0, Lcom/vkontakte/android/C2DM$UnregisterRunnable;->prefsGcm:Landroid/content/SharedPreferences;

    invoke-static {v3}, Lcom/vkontakte/android/C2DM;->access$000(Landroid/content/SharedPreferences;)V

    .line 168
    invoke-static {}, Lcom/vkontakte/android/C2DM;->access$200()Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v4

    monitor-enter v4

    .line 169
    :try_start_0
    invoke-static {}, Lcom/vkontakte/android/C2DM;->access$200()Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 170
    monitor-exit v4

    .line 207
    :goto_0
    return-void

    .line 170
    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3

    .line 174
    :cond_0
    iget-object v3, p0, Lcom/vkontakte/android/C2DM$UnregisterRunnable;->prefsGcm:Landroid/content/SharedPreferences;

    invoke-static {v3}, Lcom/vkontakte/android/C2DM;->access$000(Landroid/content/SharedPreferences;)V

    .line 176
    iget-object v3, p0, Lcom/vkontakte/android/C2DM$UnregisterRunnable;->accessToken:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1

    iget-object v3, p0, Lcom/vkontakte/android/C2DM$UnregisterRunnable;->secret:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 177
    :cond_1
    new-array v3, v7, [Ljava/lang/Object;

    const-string/jumbo v4, "User for unregister not found"

    aput-object v4, v3, v6

    invoke-static {v3}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 178
    invoke-static {}, Lcom/vkontakte/android/C2DM;->access$200()Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v4

    monitor-enter v4

    .line 179
    :try_start_1
    invoke-static {}, Lcom/vkontakte/android/C2DM;->access$200()Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 180
    monitor-exit v4

    goto :goto_0

    :catchall_1
    move-exception v3

    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    throw v3

    .line 184
    :cond_2
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v6}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 185
    .local v0, "atomicBoolean":Ljava/util/concurrent/atomic/AtomicBoolean;
    new-instance v3, Lcom/vkontakte/android/api/account/C2DMUnregisterDevice;

    invoke-direct {v3}, Lcom/vkontakte/android/api/account/C2DMUnregisterDevice;-><init>()V

    const-string/jumbo v4, "access_token"

    iget-object v5, p0, Lcom/vkontakte/android/C2DM$UnregisterRunnable;->accessToken:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Lcom/vkontakte/android/api/account/C2DMUnregisterDevice;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    .line 186
    .local v1, "req":Lcom/vkontakte/android/api/VKAPIRequest;, "Lcom/vkontakte/android/api/VKAPIRequest<Ljava/lang/Boolean;>;"
    const-string/jumbo v3, "sig"

    iget-object v4, p0, Lcom/vkontakte/android/C2DM$UnregisterRunnable;->secret:Ljava/lang/String;

    invoke-virtual {v1, v4}, Lcom/vkontakte/android/api/VKAPIRequest;->getSig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/api/VKAPIRequest;->persistWithToken()Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    new-instance v4, Lcom/vkontakte/android/C2DM$UnregisterRunnable$1;

    invoke-direct {v4, p0, v0}, Lcom/vkontakte/android/C2DM$UnregisterRunnable$1;-><init>(Lcom/vkontakte/android/C2DM$UnregisterRunnable;Ljava/util/concurrent/atomic/AtomicBoolean;)V

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/api/VKAPIRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    .line 200
    invoke-virtual {v3}, Lcom/vkontakte/android/api/VKAPIRequest;->execSync()Z

    .line 202
    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const-string/jumbo v4, "Unregister is"

    aput-object v4, v3, v6

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v4

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v3, v7

    invoke-static {v3}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 204
    invoke-static {}, Lcom/vkontakte/android/C2DM;->access$200()Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v4

    monitor-enter v4

    .line 205
    :try_start_2
    invoke-static {}, Lcom/vkontakte/android/C2DM;->access$200()Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 206
    monitor-exit v4

    goto/16 :goto_0

    :catchall_2
    move-exception v3

    monitor-exit v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    throw v3
.end method
