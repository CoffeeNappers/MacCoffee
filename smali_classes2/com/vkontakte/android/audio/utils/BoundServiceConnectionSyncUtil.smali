.class public Lcom/vkontakte/android/audio/utils/BoundServiceConnectionSyncUtil;
.super Ljava/lang/Object;
.source "BoundServiceConnectionSyncUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/audio/utils/BoundServiceConnectionSyncUtil$Listener;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static waitListenerFinished(Lcom/vkontakte/android/audio/utils/BoundServiceConnectionSyncUtil$Listener;)V
    .locals 3
    .param p0, "listener"    # Lcom/vkontakte/android/audio/utils/BoundServiceConnectionSyncUtil$Listener;

    .prologue
    .line 108
    invoke-static {p0}, Lcom/vkontakte/android/audio/utils/BoundServiceConnectionSyncUtil$Listener;->access$000(Lcom/vkontakte/android/audio/utils/BoundServiceConnectionSyncUtil$Listener;)Ljava/lang/Object;

    move-result-object v2

    monitor-enter v2

    .line 109
    :goto_0
    :try_start_0
    invoke-static {p0}, Lcom/vkontakte/android/audio/utils/BoundServiceConnectionSyncUtil$Listener;->access$100(Lcom/vkontakte/android/audio/utils/BoundServiceConnectionSyncUtil$Listener;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    if-nez v1, :cond_0

    .line 111
    :try_start_1
    invoke-static {p0}, Lcom/vkontakte/android/audio/utils/BoundServiceConnectionSyncUtil$Listener;->access$000(Lcom/vkontakte/android/audio/utils/BoundServiceConnectionSyncUtil$Listener;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 112
    :catch_0
    move-exception v0

    .line 113
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_2
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0

    .line 116
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1

    :cond_0
    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 117
    return-void
.end method
