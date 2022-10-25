.class Lcom/vkontakte/android/AudioPlayerActivity$Holder$1;
.super Ljava/lang/Object;
.source "AudioPlayerActivity.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/AudioPlayerActivity$Holder;->fillPlayerTrack(Lcom/vkontakte/android/audio/player/PlayerTrack;)Lcom/vkontakte/android/AudioPlayerActivity$Holder;
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
        "Lcom/vkontakte/android/api/audio/AudioGetLyrics$Result;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/AudioPlayerActivity$Holder;

.field final synthetic val$track:Lcom/vkontakte/android/audio/player/PlayerTrack;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/AudioPlayerActivity$Holder;Lcom/vkontakte/android/audio/player/PlayerTrack;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/AudioPlayerActivity$Holder;

    .prologue
    .line 989
    iput-object p1, p0, Lcom/vkontakte/android/AudioPlayerActivity$Holder$1;->this$0:Lcom/vkontakte/android/AudioPlayerActivity$Holder;

    iput-object p2, p0, Lcom/vkontakte/android/AudioPlayerActivity$Holder$1;->val$track:Lcom/vkontakte/android/audio/player/PlayerTrack;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 0
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 1003
    return-void
.end method

.method public success(Lcom/vkontakte/android/api/audio/AudioGetLyrics$Result;)V
    .locals 2
    .param p1, "res"    # Lcom/vkontakte/android/api/audio/AudioGetLyrics$Result;

    .prologue
    .line 992
    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity$Holder$1;->val$track:Lcom/vkontakte/android/audio/player/PlayerTrack;

    iget-object v1, p1, Lcom/vkontakte/android/api/audio/AudioGetLyrics$Result;->text:Ljava/lang/String;

    iput-object v1, v0, Lcom/vkontakte/android/audio/player/PlayerTrack;->lyricsText:Ljava/lang/String;

    .line 993
    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity$Holder$1;->this$0:Lcom/vkontakte/android/AudioPlayerActivity$Holder;

    iget-object v0, v0, Lcom/vkontakte/android/AudioPlayerActivity$Holder;->lastTrack:Lcom/vkontakte/android/audio/player/PlayerTrack;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity$Holder$1;->this$0:Lcom/vkontakte/android/AudioPlayerActivity$Holder;

    iget-object v0, v0, Lcom/vkontakte/android/AudioPlayerActivity$Holder;->lastTrack:Lcom/vkontakte/android/audio/player/PlayerTrack;

    iget v0, v0, Lcom/vkontakte/android/audio/player/PlayerTrack;->lyricsID:I

    iget v1, p1, Lcom/vkontakte/android/api/audio/AudioGetLyrics$Result;->id:I

    if-eq v0, v1, :cond_1

    .line 999
    :cond_0
    :goto_0
    return-void

    .line 996
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity$Holder$1;->this$0:Lcom/vkontakte/android/AudioPlayerActivity$Holder;

    iget-object v0, v0, Lcom/vkontakte/android/AudioPlayerActivity$Holder;->lyrics:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/vkontakte/android/api/audio/AudioGetLyrics$Result;->text:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 997
    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity$Holder$1;->this$0:Lcom/vkontakte/android/AudioPlayerActivity$Holder;

    iget-object v0, v0, Lcom/vkontakte/android/AudioPlayerActivity$Holder;->itemView:Landroid/view/View;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/vkontakte/android/ViewUtils;->setEnabled(Landroid/view/View;Z)V

    .line 998
    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity$Holder$1;->this$0:Lcom/vkontakte/android/AudioPlayerActivity$Holder;

    iget-object v0, v0, Lcom/vkontakte/android/AudioPlayerActivity$Holder;->activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->invalidateOptionsMenu()V

    goto :goto_0
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 989
    check-cast p1, Lcom/vkontakte/android/api/audio/AudioGetLyrics$Result;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/AudioPlayerActivity$Holder$1;->success(Lcom/vkontakte/android/api/audio/AudioGetLyrics$Result;)V

    return-void
.end method
