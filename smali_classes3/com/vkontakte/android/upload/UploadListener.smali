.class public Lcom/vkontakte/android/upload/UploadListener;
.super Ljava/lang/Object;
.source "UploadListener.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/upload/UploadListener$UploadListenerCallback;
    }
.end annotation


# instance fields
.field private final broadcastReceiver:Landroid/content/BroadcastReceiver;

.field private uploadListenerCallback:Lcom/vkontakte/android/upload/UploadListener$UploadListenerCallback;


# direct methods
.method public constructor <init>(ILcom/vkontakte/android/upload/UploadListener$UploadListenerCallback;)V
    .locals 1
    .param p1, "uploadTaskId"    # I
    .param p2, "uploadListenerCallback"    # Lcom/vkontakte/android/upload/UploadListener$UploadListenerCallback;

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-object p2, p0, Lcom/vkontakte/android/upload/UploadListener;->uploadListenerCallback:Lcom/vkontakte/android/upload/UploadListener$UploadListenerCallback;

    .line 19
    invoke-direct {p0, p1}, Lcom/vkontakte/android/upload/UploadListener;->createBroadcastReceiver(I)Landroid/content/BroadcastReceiver;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/upload/UploadListener;->broadcastReceiver:Landroid/content/BroadcastReceiver;

    .line 20
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/upload/UploadListener;)Lcom/vkontakte/android/upload/UploadListener$UploadListenerCallback;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/upload/UploadListener;

    .prologue
    .line 12
    iget-object v0, p0, Lcom/vkontakte/android/upload/UploadListener;->uploadListenerCallback:Lcom/vkontakte/android/upload/UploadListener$UploadListenerCallback;

    return-object v0
.end method

.method private createBroadcastReceiver(I)Landroid/content/BroadcastReceiver;
    .locals 1
    .param p1, "targetId"    # I

    .prologue
    .line 44
    new-instance v0, Lcom/vkontakte/android/upload/UploadListener$1;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/upload/UploadListener$1;-><init>(Lcom/vkontakte/android/upload/UploadListener;I)V

    return-object v0
.end method


# virtual methods
.method public setUploadListenerCallback(Lcom/vkontakte/android/upload/UploadListener$UploadListenerCallback;)V
    .locals 0
    .param p1, "uploadListenerCallback"    # Lcom/vkontakte/android/upload/UploadListener$UploadListenerCallback;

    .prologue
    .line 23
    iput-object p1, p0, Lcom/vkontakte/android/upload/UploadListener;->uploadListenerCallback:Lcom/vkontakte/android/upload/UploadListener$UploadListenerCallback;

    .line 24
    return-void
.end method

.method public startListener()V
    .locals 5

    .prologue
    .line 27
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 28
    .local v0, "filter":Landroid/content/IntentFilter;
    const-string/jumbo v1, "com.vkontakte.android.UPLOAD_PROGRESS"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 29
    const-string/jumbo v1, "com.vkontakte.android.UPLOAD_STARTED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 30
    const-string/jumbo v1, "com.vkontakte.android.UPLOAD_DONE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 31
    const-string/jumbo v1, "com.vkontakte.android.UPLOAD_FAILED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 32
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/vkontakte/android/upload/UploadListener;->broadcastReceiver:Landroid/content/BroadcastReceiver;

    const-string/jumbo v3, "com.vkontakte.android.permission.ACCESS_DATA"

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v0, v3, v4}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 33
    return-void
.end method

.method public stopListener()V
    .locals 2

    .prologue
    .line 37
    :try_start_0
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/vkontakte/android/upload/UploadListener;->broadcastReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 41
    :goto_0
    return-void

    .line 38
    :catch_0
    move-exception v0

    goto :goto_0
.end method
