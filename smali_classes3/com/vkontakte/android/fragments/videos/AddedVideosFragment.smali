.class public Lcom/vkontakte/android/fragments/videos/AddedVideosFragment;
.super Lcom/vkontakte/android/fragments/videos/VideoAlbumFragment;
.source "AddedVideosFragment.java"


# instance fields
.field mReceiver:Landroid/content/BroadcastReceiver;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/videos/VideoAlbumFragment;-><init>()V

    .line 41
    new-instance v0, Lcom/vkontakte/android/fragments/videos/AddedVideosFragment$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/videos/AddedVideosFragment$1;-><init>(Lcom/vkontakte/android/fragments/videos/AddedVideosFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/videos/AddedVideosFragment;->mReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method public static newInstance(IZ)Lcom/vkontakte/android/fragments/videos/AddedVideosFragment;
    .locals 4
    .param p0, "ownerId"    # I
    .param p1, "select"    # Z

    .prologue
    .line 31
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 32
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v2, "album_id"

    const/4 v3, -0x2

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 33
    const-string/jumbo v2, "uid"

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 34
    const-string/jumbo v2, "select"

    invoke-virtual {v0, v2, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 36
    new-instance v1, Lcom/vkontakte/android/fragments/videos/AddedVideosFragment;

    invoke-direct {v1}, Lcom/vkontakte/android/fragments/videos/AddedVideosFragment;-><init>()V

    .line 37
    .local v1, "result":Lcom/vkontakte/android/fragments/videos/AddedVideosFragment;
    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/videos/AddedVideosFragment;->setArguments(Landroid/os/Bundle;)V

    .line 38
    return-object v1
.end method


# virtual methods
.method deleteVideo(Lcom/vkontakte/android/api/VideoFile;)V
    .locals 0
    .param p1, "video"    # Lcom/vkontakte/android/api/VideoFile;

    .prologue
    .line 103
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/videos/AddedVideosFragment;->deleteVideoFile(Lcom/vkontakte/android/api/VideoFile;)V

    .line 104
    return-void
.end method

.method public disableRefresh()V
    .locals 1

    .prologue
    .line 107
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/videos/AddedVideosFragment;->setRefreshEnabled(Z)V

    .line 108
    return-void
.end method

.method protected getRequest(II)Lcom/vkontakte/android/api/VKAPIRequest;
    .locals 1
    .param p1, "offset"    # I
    .param p2, "count"    # I
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Lcom/vkontakte/android/api/VKAPIRequest",
            "<",
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Lcom/vkontakte/android/api/VideoFile;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 93
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/AddedVideosFragment;->getOwnerID()I

    move-result v0

    invoke-static {v0, p1, p2}, Lcom/vkontakte/android/api/video/VideoGet;->getAdded(III)Lcom/vkontakte/android/api/video/VideoGet;

    move-result-object v0

    return-object v0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 78
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/videos/VideoAlbumFragment;->onCreate(Landroid/os/Bundle;)V

    .line 79
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/AddedVideosFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/AddedVideosFragment;->mReceiver:Landroid/content/BroadcastReceiver;

    new-instance v2, Landroid/content/IntentFilter;

    const-string/jumbo v3, "com.vkontakte.android.VIDEO_ADDED"

    invoke-direct {v2, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/content/LocalBroadcastManager;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V

    .line 80
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/AddedVideosFragment;->mReceiver:Landroid/content/BroadcastReceiver;

    new-instance v2, Landroid/content/IntentFilter;

    const-string/jumbo v3, "com.vkontakte.android.UPLOAD_DONE"

    invoke-direct {v2, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const-string/jumbo v3, "com.vkontakte.android.permission.ACCESS_DATA"

    const/4 v4, 0x0

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 81
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 85
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/AddedVideosFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/AddedVideosFragment;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/support/v4/content/LocalBroadcastManager;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 86
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/AddedVideosFragment;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 87
    invoke-super {p0}, Lcom/vkontakte/android/fragments/videos/VideoAlbumFragment;->onDestroy()V

    .line 88
    return-void
.end method

.method showDeleteDialog(Lcom/vkontakte/android/api/VideoFile;)V
    .locals 0
    .param p1, "video"    # Lcom/vkontakte/android/api/VideoFile;

    .prologue
    .line 98
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/videos/AddedVideosFragment;->showVideoFileDeleteDialog(Lcom/vkontakte/android/api/VideoFile;)V

    .line 99
    return-void
.end method
