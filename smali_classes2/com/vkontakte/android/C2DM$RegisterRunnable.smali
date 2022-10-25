.class Lcom/vkontakte/android/C2DM$RegisterRunnable;
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
    name = "RegisterRunnable"
.end annotation


# instance fields
.field final ctx:Landroid/content/Context;

.field final currentVersion:I

.field final prefsGcm:Landroid/content/SharedPreferences;

.field final vkAccount:Lcom/vkontakte/android/auth/VKAccount;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/vkontakte/android/auth/VKAccount;ILandroid/content/SharedPreferences;)V
    .locals 0
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "vkAccount"    # Lcom/vkontakte/android/auth/VKAccount;
    .param p3, "currentVersion"    # I
    .param p4, "prefsGcm"    # Landroid/content/SharedPreferences;

    .prologue
    .line 95
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 96
    iput-object p1, p0, Lcom/vkontakte/android/C2DM$RegisterRunnable;->ctx:Landroid/content/Context;

    .line 97
    iput-object p2, p0, Lcom/vkontakte/android/C2DM$RegisterRunnable;->vkAccount:Lcom/vkontakte/android/auth/VKAccount;

    .line 98
    iput p3, p0, Lcom/vkontakte/android/C2DM$RegisterRunnable;->currentVersion:I

    .line 99
    iput-object p4, p0, Lcom/vkontakte/android/C2DM$RegisterRunnable;->prefsGcm:Landroid/content/SharedPreferences;

    .line 100
    return-void
.end method


# virtual methods
.method public run()V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 104
    new-array v4, v8, [Ljava/lang/Object;

    const-string/jumbo v5, "Start register"

    aput-object v5, v4, v7

    invoke-static {v4}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 105
    iget-object v4, p0, Lcom/vkontakte/android/C2DM$RegisterRunnable;->ctx:Landroid/content/Context;

    invoke-static {v4}, Lcom/google/android/gms/iid/InstanceID;->getInstance(Landroid/content/Context;)Lcom/google/android/gms/iid/InstanceID;

    move-result-object v1

    .line 106
    .local v1, "instanceID":Lcom/google/android/gms/iid/InstanceID;
    const-string/jumbo v4, "841415684880"

    const-string/jumbo v5, "GCM"

    invoke-virtual {v1, v4, v5}, Lcom/google/android/gms/iid/InstanceID;->deleteToken(Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    const-string/jumbo v4, "841415684880"

    const-string/jumbo v5, "GCM"

    invoke-virtual {v1, v4, v5}, Lcom/google/android/gms/iid/InstanceID;->getToken(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 108
    .local v3, "token":Ljava/lang/String;
    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const-string/jumbo v5, "GCM received the token:"

    aput-object v5, v4, v7

    aput-object v3, v4, v8

    invoke-static {v4}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 109
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v7}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 110
    .local v0, "atomicBoolean":Ljava/util/concurrent/atomic/AtomicBoolean;
    new-instance v4, Lcom/vkontakte/android/api/account/C2DMRegisterDevice;

    invoke-direct {v4, v3}, Lcom/vkontakte/android/api/account/C2DMRegisterDevice;-><init>(Ljava/lang/String;)V

    const-string/jumbo v5, "access_token"

    iget-object v6, p0, Lcom/vkontakte/android/C2DM$RegisterRunnable;->vkAccount:Lcom/vkontakte/android/auth/VKAccount;

    invoke-virtual {v6}, Lcom/vkontakte/android/auth/VKAccount;->getAccessToken()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lcom/vkontakte/android/api/account/C2DMRegisterDevice;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    .line 111
    .local v2, "req":Lcom/vkontakte/android/api/VKAPIRequest;, "Lcom/vkontakte/android/api/VKAPIRequest<Ljava/lang/Boolean;>;"
    const-string/jumbo v4, "sig"

    iget-object v5, p0, Lcom/vkontakte/android/C2DM$RegisterRunnable;->vkAccount:Lcom/vkontakte/android/auth/VKAccount;

    invoke-virtual {v5}, Lcom/vkontakte/android/auth/VKAccount;->getSecret()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Lcom/vkontakte/android/api/VKAPIRequest;->getSig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vkontakte/android/api/VKAPIRequest;->persistWithToken()Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v4

    new-instance v5, Lcom/vkontakte/android/C2DM$RegisterRunnable$1;

    invoke-direct {v5, p0, v0}, Lcom/vkontakte/android/C2DM$RegisterRunnable$1;-><init>(Lcom/vkontakte/android/C2DM$RegisterRunnable;Ljava/util/concurrent/atomic/AtomicBoolean;)V

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/api/VKAPIRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v4

    .line 125
    invoke-virtual {v4}, Lcom/vkontakte/android/api/VKAPIRequest;->execSync()Z

    .line 127
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 128
    iget-object v4, p0, Lcom/vkontakte/android/C2DM$RegisterRunnable;->prefsGcm:Landroid/content/SharedPreferences;

    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string/jumbo v5, "current_user"

    iget-object v6, p0, Lcom/vkontakte/android/C2DM$RegisterRunnable;->vkAccount:Lcom/vkontakte/android/auth/VKAccount;

    .line 129
    invoke-virtual {v6}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v6

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string/jumbo v5, "reg"

    .line 130
    invoke-interface {v4, v5, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string/jumbo v5, "version"

    iget v6, p0, Lcom/vkontakte/android/C2DM$RegisterRunnable;->currentVersion:I

    .line 131
    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    .line 132
    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 133
    new-array v4, v8, [Ljava/lang/Object;

    const-string/jumbo v5, "GCM subscribed"

    aput-object v5, v4, v7

    invoke-static {v4}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 139
    :goto_0
    invoke-static {}, Lcom/vkontakte/android/C2DM;->access$100()Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v5

    monitor-enter v5

    .line 140
    :try_start_0
    invoke-static {}, Lcom/vkontakte/android/C2DM;->access$100()Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 141
    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 142
    return-void

    .line 135
    :cond_0
    const-string/jumbo v4, "841415684880"

    const-string/jumbo v5, "GCM"

    invoke-virtual {v1, v4, v5}, Lcom/google/android/gms/iid/InstanceID;->deleteToken(Ljava/lang/String;Ljava/lang/String;)V

    .line 136
    iget-object v4, p0, Lcom/vkontakte/android/C2DM$RegisterRunnable;->prefsGcm:Landroid/content/SharedPreferences;

    invoke-static {v4}, Lcom/vkontakte/android/C2DM;->access$000(Landroid/content/SharedPreferences;)V

    .line 137
    new-array v4, v8, [Ljava/lang/Object;

    const-string/jumbo v5, "GCM did not subscribe"

    aput-object v5, v4, v7

    invoke-static {v4}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    goto :goto_0

    .line 141
    :catchall_0
    move-exception v4

    :try_start_1
    monitor-exit v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v4
.end method
