.class public abstract Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderBase;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "AudioViewHolderBase.java"

# interfaces
.implements Lme/grishka/appkit/views/UsableRecyclerView$Clickable;
.implements Lme/grishka/appkit/views/UsableRecyclerView$LongClickable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderBase$AudioViewHolderDelegate;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/audio/MusicTrack;",
        ">;",
        "Lme/grishka/appkit/views/UsableRecyclerView$Clickable;",
        "Lme/grishka/appkit/views/UsableRecyclerView$LongClickable;"
    }
.end annotation


# instance fields
.field protected artist:Landroid/widget/TextView;

.field protected audioViewHolderDelegate:Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderBase$AudioViewHolderDelegate;

.field protected cacheIcon:Landroid/widget/ImageView;

.field protected duration:Landroid/widget/TextView;

.field protected progressBar:Landroid/widget/ProgressBar;

.field protected section:I

.field protected title:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(ILandroid/view/ViewGroup;ILcom/vkontakte/android/ui/holder/audio/AudioViewHolderBase$AudioViewHolderDelegate;)V
    .locals 1
    .param p1, "layout"    # I
    .param p2, "parent"    # Landroid/view/ViewGroup;
    .param p3, "section"    # I
    .param p4, "audioViewHolderDelegate"    # Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderBase$AudioViewHolderDelegate;

    .prologue
    .line 40
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0, p1, p2}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(Landroid/content/Context;ILandroid/view/ViewGroup;)V

    .line 42
    iput-object p4, p0, Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderBase;->audioViewHolderDelegate:Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderBase$AudioViewHolderDelegate;

    .line 44
    const v0, 0x7f100216

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderBase;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderBase;->title:Landroid/widget/TextView;

    .line 45
    const v0, 0x7f100217

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderBase;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderBase;->artist:Landroid/widget/TextView;

    .line 46
    const v0, 0x7f100219

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderBase;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderBase;->duration:Landroid/widget/TextView;

    .line 48
    const v0, 0x7f100214

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderBase;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderBase;->progressBar:Landroid/widget/ProgressBar;

    .line 49
    const v0, 0x7f100218

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderBase;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderBase;->cacheIcon:Landroid/widget/ImageView;

    .line 50
    iput p3, p0, Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderBase;->section:I

    .line 51
    return-void
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/audio/MusicTrack;)V
    .locals 5
    .param p1, "item"    # Lcom/vkontakte/android/audio/MusicTrack;

    .prologue
    .line 55
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderBase;->title:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/vkontakte/android/audio/MusicTrack;->title:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 56
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderBase;->artist:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/vkontakte/android/audio/MusicTrack;->artist:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 57
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderBase;->duration:Landroid/widget/TextView;

    const-string/jumbo v1, "%d:%02d"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget v4, p1, Lcom/vkontakte/android/audio/MusicTrack;->duration:I

    div-int/lit8 v4, v4, 0x3c

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    iget v4, p1, Lcom/vkontakte/android/audio/MusicTrack;->duration:I

    rem-int/lit8 v4, v4, 0x3c

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 58
    return-void
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 17
    check-cast p1, Lcom/vkontakte/android/audio/MusicTrack;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderBase;->onBind(Lcom/vkontakte/android/audio/MusicTrack;)V

    return-void
.end method

.method protected playPause(Lcom/vkontakte/android/audio/MusicTrack;)V
    .locals 4
    .param p1, "file"    # Lcom/vkontakte/android/audio/MusicTrack;

    .prologue
    .line 62
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getPlayerState()Lcom/vkontakte/android/audio/player/PlayerState;

    move-result-object v0

    .line 63
    .local v0, "state":Lcom/vkontakte/android/audio/player/PlayerState;
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getCurrentTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/audio/MusicTrack;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    sget-object v1, Lcom/vkontakte/android/audio/player/PlayerState;->PAUSED:Lcom/vkontakte/android/audio/player/PlayerState;

    if-eq v0, v1, :cond_0

    sget-object v1, Lcom/vkontakte/android/audio/player/PlayerState;->PLAYING:Lcom/vkontakte/android/audio/player/PlayerState;

    if-ne v0, v1, :cond_1

    .line 65
    :cond_0
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->toggleResumePause()V

    .line 70
    :goto_0
    return-void

    .line 69
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderBase;->audioViewHolderDelegate:Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderBase$AudioViewHolderDelegate;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderBase;->getAdapterPosition()I

    move-result v2

    iget v3, p0, Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderBase;->section:I

    invoke-interface {v1, v2, v3}, Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderBase$AudioViewHolderDelegate;->playTrack(II)V

    goto :goto_0
.end method
