.class public Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderAttach;
.super Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderBase;
.source "AudioViewHolderAttach.java"


# instance fields
.field private playPauseIcon:Landroid/widget/ImageView;


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;ILcom/vkontakte/android/ui/holder/audio/AudioViewHolderBase$AudioViewHolderDelegate;)V
    .locals 2
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "section"    # I
    .param p3, "audioViewHolderDelegate"    # Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderBase$AudioViewHolderDelegate;

    .prologue
    .line 19
    const v0, 0x7f03005b

    invoke-direct {p0, v0, p1, p2, p3}, Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderBase;-><init>(ILandroid/view/ViewGroup;ILcom/vkontakte/android/ui/holder/audio/AudioViewHolderBase$AudioViewHolderDelegate;)V

    .line 21
    const v0, 0x7f100213

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderAttach;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderAttach;->playPauseIcon:Landroid/widget/ImageView;

    .line 22
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderAttach;->playPauseIcon:Landroid/widget/ImageView;

    invoke-static {p0}, Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderAttach$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderAttach;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 24
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderAttach;->cacheIcon:Landroid/widget/ImageView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 25
    return-void
.end method


# virtual methods
.method synthetic lambda$new$0(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 22
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderAttach;->item:Ljava/lang/Object;

    check-cast v0, Lcom/vkontakte/android/audio/MusicTrack;

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderAttach;->playPause(Lcom/vkontakte/android/audio/MusicTrack;)V

    return-void
.end method

.method public onBind(Lcom/vkontakte/android/audio/MusicTrack;)V
    .locals 5
    .param p1, "item"    # Lcom/vkontakte/android/audio/MusicTrack;

    .prologue
    const/4 v2, 0x0

    .line 29
    invoke-super {p0, p1}, Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderBase;->onBind(Lcom/vkontakte/android/audio/MusicTrack;)V

    .line 31
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getCurrentTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v3

    invoke-static {p1, v3}, Lcom/vkontakte/android/utils/Utils;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    .line 32
    .local v0, "isCurrent":Z
    if-eqz v0, :cond_0

    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getPlayerState()Lcom/vkontakte/android/audio/player/PlayerState;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/audio/player/PlayerState;->isPlayState()Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v1, 0x1

    .line 34
    .local v1, "isPlaying":Z
    :goto_0
    if-eqz v1, :cond_1

    .line 35
    iget-object v3, p0, Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderAttach;->playPauseIcon:Landroid/widget/ImageView;

    const v4, 0x7f020232

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 40
    :goto_1
    if-eqz v0, :cond_2

    .line 41
    iget-object v3, p0, Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderAttach;->progressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v3, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 42
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderAttach;->audioViewHolderDelegate:Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderBase$AudioViewHolderDelegate;

    iget-object v3, p0, Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderAttach;->progressBar:Landroid/widget/ProgressBar;

    invoke-interface {v2, v3}, Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderBase$AudioViewHolderDelegate;->setItemProgressBar(Landroid/widget/ProgressBar;)V

    .line 47
    :goto_2
    return-void

    .end local v1    # "isPlaying":Z
    :cond_0
    move v1, v2

    .line 32
    goto :goto_0

    .line 37
    .restart local v1    # "isPlaying":Z
    :cond_1
    iget-object v3, p0, Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderAttach;->playPauseIcon:Landroid/widget/ImageView;

    const v4, 0x7f020241

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_1

    .line 44
    :cond_2
    iget-object v3, p0, Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderAttach;->progressBar:Landroid/widget/ProgressBar;

    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 45
    iget-object v3, p0, Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderAttach;->progressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v3, v2}, Landroid/widget/ProgressBar;->setProgress(I)V

    goto :goto_2
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 14
    check-cast p1, Lcom/vkontakte/android/audio/MusicTrack;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderAttach;->onBind(Lcom/vkontakte/android/audio/MusicTrack;)V

    return-void
.end method

.method public onClick()V
    .locals 4

    .prologue
    .line 51
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    const-string/jumbo v3, "audio"

    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderAttach;->item:Ljava/lang/Object;

    check-cast v1, Landroid/os/Parcelable;

    invoke-virtual {v2, v3, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    move-result-object v0

    .line 52
    .local v0, "result":Landroid/content/Intent;
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderAttach;->itemView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    instance-of v1, v1, Landroid/app/Activity;

    if-eqz v1, :cond_0

    .line 53
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderAttach;->itemView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v1

    const/4 v2, -0x1

    invoke-virtual {v1, v2, v0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 54
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderAttach;->itemView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->finish()V

    .line 56
    :cond_0
    return-void
.end method

.method public onLongClick()Z
    .locals 1

    .prologue
    .line 60
    const/4 v0, 0x0

    return v0
.end method
