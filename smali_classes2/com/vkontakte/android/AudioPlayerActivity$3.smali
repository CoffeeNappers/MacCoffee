.class Lcom/vkontakte/android/AudioPlayerActivity$3;
.super Ljava/lang/Object;
.source "AudioPlayerActivity.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/AudioPlayerActivity;->addCurrent()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vkontakte/android/api/Callback",
        "<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/AudioPlayerActivity;

.field final synthetic val$file:Lcom/vkontakte/android/audio/player/PlayerTrack;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/AudioPlayerActivity;Lcom/vkontakte/android/audio/player/PlayerTrack;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/AudioPlayerActivity;

    .prologue
    .line 417
    iput-object p1, p0, Lcom/vkontakte/android/AudioPlayerActivity$3;->this$0:Lcom/vkontakte/android/AudioPlayerActivity;

    iput-object p2, p0, Lcom/vkontakte/android/AudioPlayerActivity$3;->val$file:Lcom/vkontakte/android/audio/player/PlayerTrack;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 3
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 449
    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity$3;->this$0:Lcom/vkontakte/android/AudioPlayerActivity;

    const v1, 0x7f0800e3

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 450
    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity$3;->this$0:Lcom/vkontakte/android/AudioPlayerActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/AudioPlayerActivity;->access$302(Lcom/vkontakte/android/AudioPlayerActivity;Lcom/vkontakte/android/api/VKAPIRequest;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 452
    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity$3;->this$0:Lcom/vkontakte/android/AudioPlayerActivity;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/vkontakte/android/AudioPlayerActivity;->access$400(Lcom/vkontakte/android/AudioPlayerActivity;Z)V

    .line 453
    return-void
.end method

.method public success(Ljava/lang/Integer;)V
    .locals 9
    .param p1, "id"    # Ljava/lang/Integer;

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 421
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v7

    invoke-virtual {v7}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v4

    .line 422
    .local v4, "newOid":I
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 423
    .local v2, "newAid":I
    iget-object v7, p0, Lcom/vkontakte/android/AudioPlayerActivity$3;->val$file:Lcom/vkontakte/android/audio/player/PlayerTrack;

    iget v7, v7, Lcom/vkontakte/android/audio/player/PlayerTrack;->oid:I

    iget-object v8, p0, Lcom/vkontakte/android/AudioPlayerActivity$3;->val$file:Lcom/vkontakte/android/audio/player/PlayerTrack;

    iget v8, v8, Lcom/vkontakte/android/audio/player/PlayerTrack;->aid:I

    invoke-static {v7, v8}, Lcom/vkontakte/android/audio/AudioFacade;->getTrackDownloadFile(II)Ljava/io/File;

    move-result-object v0

    .line 424
    .local v0, "cacheFile":Ljava/io/File;
    invoke-static {v4, v2}, Lcom/vkontakte/android/audio/AudioFacade;->getTrackDownloadFile(II)Ljava/io/File;

    move-result-object v3

    .line 425
    .local v3, "newCacheFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 426
    invoke-virtual {v0, v3}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 429
    :cond_0
    iget-object v7, p0, Lcom/vkontakte/android/AudioPlayerActivity$3;->val$file:Lcom/vkontakte/android/audio/player/PlayerTrack;

    invoke-virtual {v7}, Lcom/vkontakte/android/audio/player/PlayerTrack;->getMid()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/vkontakte/android/audio/AudioFacade;->isCached(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_1

    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->isAudioCacheEnable()Z

    move-result v7

    if-eqz v7, :cond_4

    :cond_1
    move v1, v6

    .line 431
    .local v1, "cashedTrack":Z
    :goto_0
    if-eqz v1, :cond_2

    .line 432
    new-array v7, v6, [Ljava/lang/String;

    iget-object v8, p0, Lcom/vkontakte/android/AudioPlayerActivity$3;->val$file:Lcom/vkontakte/android/audio/player/PlayerTrack;

    invoke-virtual {v8}, Lcom/vkontakte/android/audio/player/PlayerTrack;->getMid()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v5

    invoke-static {v7}, Lcom/vkontakte/android/audio/AudioFacade;->removeSavedTrack([Ljava/lang/String;)V

    .line 434
    :cond_2
    iget-object v7, p0, Lcom/vkontakte/android/AudioPlayerActivity$3;->val$file:Lcom/vkontakte/android/audio/player/PlayerTrack;

    invoke-virtual {v7, v4, v2}, Lcom/vkontakte/android/audio/player/PlayerTrack;->changeIds(II)V

    .line 435
    if-eqz v1, :cond_3

    .line 436
    iget-object v7, p0, Lcom/vkontakte/android/AudioPlayerActivity$3;->val$file:Lcom/vkontakte/android/audio/player/PlayerTrack;

    invoke-static {v7, v5}, Lcom/vkontakte/android/audio/AudioFacade;->startDownloadTracks(Lcom/vkontakte/android/audio/MusicTrack;Z)V

    .line 439
    :cond_3
    iget-object v7, p0, Lcom/vkontakte/android/AudioPlayerActivity$3;->this$0:Lcom/vkontakte/android/AudioPlayerActivity;

    const v8, 0x7f0800e5

    invoke-static {v7, v8, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v5

    invoke-virtual {v5}, Landroid/widget/Toast;->show()V

    .line 440
    iget-object v5, p0, Lcom/vkontakte/android/AudioPlayerActivity$3;->val$file:Lcom/vkontakte/android/audio/player/PlayerTrack;

    invoke-static {v5}, Lcom/vkontakte/android/audio/AudioFacade;->sendUserAudioAdded(Lcom/vkontakte/android/audio/MusicTrack;)V

    .line 441
    iget-object v5, p0, Lcom/vkontakte/android/AudioPlayerActivity$3;->this$0:Lcom/vkontakte/android/AudioPlayerActivity;

    invoke-virtual {v5}, Lcom/vkontakte/android/AudioPlayerActivity;->invalidateOptionsMenu()V

    .line 442
    iget-object v5, p0, Lcom/vkontakte/android/AudioPlayerActivity$3;->this$0:Lcom/vkontakte/android/AudioPlayerActivity;

    const/4 v7, 0x0

    invoke-static {v5, v7}, Lcom/vkontakte/android/AudioPlayerActivity;->access$302(Lcom/vkontakte/android/AudioPlayerActivity;Lcom/vkontakte/android/api/VKAPIRequest;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 444
    iget-object v5, p0, Lcom/vkontakte/android/AudioPlayerActivity$3;->this$0:Lcom/vkontakte/android/AudioPlayerActivity;

    invoke-static {v5, v6}, Lcom/vkontakte/android/AudioPlayerActivity;->access$400(Lcom/vkontakte/android/AudioPlayerActivity;Z)V

    .line 445
    return-void

    .end local v1    # "cashedTrack":Z
    :cond_4
    move v1, v5

    .line 429
    goto :goto_0
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 417
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/AudioPlayerActivity$3;->success(Ljava/lang/Integer;)V

    return-void
.end method
