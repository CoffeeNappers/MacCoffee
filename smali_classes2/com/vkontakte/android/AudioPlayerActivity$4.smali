.class Lcom/vkontakte/android/AudioPlayerActivity$4;
.super Lcom/vkontakte/android/api/ResultlessCallback;
.source "AudioPlayerActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/AudioPlayerActivity;->deleteFile(Lcom/vkontakte/android/audio/player/PlayerTrack;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/AudioPlayerActivity;

.field final synthetic val$playerTrack:Lcom/vkontakte/android/audio/player/PlayerTrack;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/AudioPlayerActivity;Landroid/content/Context;Lcom/vkontakte/android/audio/player/PlayerTrack;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/AudioPlayerActivity;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 466
    iput-object p1, p0, Lcom/vkontakte/android/AudioPlayerActivity$4;->this$0:Lcom/vkontakte/android/AudioPlayerActivity;

    iput-object p3, p0, Lcom/vkontakte/android/AudioPlayerActivity$4;->val$playerTrack:Lcom/vkontakte/android/audio/player/PlayerTrack;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/ResultlessCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 483
    invoke-super {p0, p1}, Lcom/vkontakte/android/api/ResultlessCallback;->fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    .line 484
    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity$4;->this$0:Lcom/vkontakte/android/AudioPlayerActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/AudioPlayerActivity;->access$502(Lcom/vkontakte/android/AudioPlayerActivity;Lcom/vkontakte/android/api/VKAPIRequest;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 486
    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity$4;->this$0:Lcom/vkontakte/android/AudioPlayerActivity;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/vkontakte/android/AudioPlayerActivity;->access$400(Lcom/vkontakte/android/AudioPlayerActivity;Z)V

    .line 487
    return-void
.end method

.method public success()V
    .locals 4

    .prologue
    .line 470
    iget-object v1, p0, Lcom/vkontakte/android/AudioPlayerActivity$4;->this$0:Lcom/vkontakte/android/AudioPlayerActivity;

    const v2, 0x7f0800e8

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 471
    iget-object v1, p0, Lcom/vkontakte/android/AudioPlayerActivity$4;->val$playerTrack:Lcom/vkontakte/android/audio/player/PlayerTrack;

    invoke-static {v1}, Lcom/vkontakte/android/audio/AudioFacade;->deleteAudio(Lcom/vkontakte/android/audio/MusicTrack;)Z

    move-result v0

    .line 472
    .local v0, "playerWasStoped":Z
    iget-object v1, p0, Lcom/vkontakte/android/AudioPlayerActivity$4;->this$0:Lcom/vkontakte/android/AudioPlayerActivity;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/vkontakte/android/AudioPlayerActivity;->access$502(Lcom/vkontakte/android/AudioPlayerActivity;Lcom/vkontakte/android/api/VKAPIRequest;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 474
    iget-object v1, p0, Lcom/vkontakte/android/AudioPlayerActivity$4;->this$0:Lcom/vkontakte/android/AudioPlayerActivity;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/vkontakte/android/AudioPlayerActivity;->access$400(Lcom/vkontakte/android/AudioPlayerActivity;Z)V

    .line 476
    if-eqz v0, :cond_0

    .line 477
    iget-object v1, p0, Lcom/vkontakte/android/AudioPlayerActivity$4;->this$0:Lcom/vkontakte/android/AudioPlayerActivity;

    invoke-virtual {v1}, Lcom/vkontakte/android/AudioPlayerActivity;->finish()V

    .line 479
    :cond_0
    return-void
.end method
