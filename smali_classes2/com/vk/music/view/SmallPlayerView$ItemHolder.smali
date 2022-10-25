.class Lcom/vk/music/view/SmallPlayerView$ItemHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "SmallPlayerView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/view/SmallPlayerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ItemHolder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Landroid/util/Pair",
        "<",
        "Lcom/vkontakte/android/audio/player/PlayerState;",
        "Lcom/vkontakte/android/audio/player/TrackInfo;",
        ">;>;",
        "Landroid/view/View$OnClickListener;"
    }
.end annotation


# instance fields
.field final image:Lcom/vk/music/view/ThumbsImageView;

.field final playPause:Landroid/widget/ImageButton;

.field final progress:Landroid/widget/ProgressBar;

.field final title:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/view/ViewGroup;)V
    .locals 1
    .param p1, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 68
    const v0, 0x7f030154

    invoke-direct {p0, v0, p1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/view/ViewGroup;)V

    .line 69
    const v0, 0x7f100124

    invoke-virtual {p0, v0}, Lcom/vk/music/view/SmallPlayerView$ItemHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/music/view/ThumbsImageView;

    iput-object v0, p0, Lcom/vk/music/view/SmallPlayerView$ItemHolder;->image:Lcom/vk/music/view/ThumbsImageView;

    .line 70
    const v0, 0x7f100128

    invoke-virtual {p0, v0}, Lcom/vk/music/view/SmallPlayerView$ItemHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vk/music/view/SmallPlayerView$ItemHolder;->title:Landroid/widget/TextView;

    .line 71
    const v0, 0x7f1003f3

    invoke-virtual {p0, v0}, Lcom/vk/music/view/SmallPlayerView$ItemHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/vk/music/view/SmallPlayerView$ItemHolder;->playPause:Landroid/widget/ImageButton;

    invoke-virtual {v0, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 72
    const v0, 0x7f10021d

    invoke-virtual {p0, v0}, Lcom/vk/music/view/SmallPlayerView$ItemHolder;->$(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 73
    iget-object v0, p0, Lcom/vk/music/view/SmallPlayerView$ItemHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 74
    iget-object v0, p0, Lcom/vk/music/view/SmallPlayerView$ItemHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 75
    const v0, 0x7f10039a

    invoke-virtual {p0, v0}, Lcom/vk/music/view/SmallPlayerView$ItemHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/vk/music/view/SmallPlayerView$ItemHolder;->progress:Landroid/widget/ProgressBar;

    .line 76
    return-void
.end method


# virtual methods
.method public onBind(Landroid/util/Pair;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Pair",
            "<",
            "Lcom/vkontakte/android/audio/player/PlayerState;",
            "Lcom/vkontakte/android/audio/player/TrackInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 80
    .local p1, "item":Landroid/util/Pair;, "Landroid/util/Pair<Lcom/vkontakte/android/audio/player/PlayerState;Lcom/vkontakte/android/audio/player/TrackInfo;>;"
    iget-object v0, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Lcom/vkontakte/android/audio/player/TrackInfo;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/TrackInfo;->hasTrack()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 81
    iget-object v1, p0, Lcom/vk/music/view/SmallPlayerView$ItemHolder;->image:Lcom/vk/music/view/ThumbsImageView;

    iget-object v0, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Lcom/vkontakte/android/audio/player/TrackInfo;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/TrackInfo;->getTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/PlayerTrack;->getThumb()Lcom/vk/music/dto/Thumb;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/vk/music/view/ThumbsImageView;->setThumb(Lcom/vk/music/dto/Thumb;)V

    .line 82
    iget-object v1, p0, Lcom/vk/music/view/SmallPlayerView$ItemHolder;->title:Landroid/widget/TextView;

    iget-object v0, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Lcom/vkontakte/android/audio/player/TrackInfo;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/TrackInfo;->getTitle()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 84
    :cond_0
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    sget-object v1, Lcom/vkontakte/android/audio/player/PlayerState;->PLAYING:Lcom/vkontakte/android/audio/player/PlayerState;

    if-ne v0, v1, :cond_1

    .line 85
    iget-object v0, p0, Lcom/vk/music/view/SmallPlayerView$ItemHolder;->playPause:Landroid/widget/ImageButton;

    const v1, 0x7f0201fd

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 89
    :goto_0
    iget-object v0, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Lcom/vkontakte/android/audio/player/TrackInfo;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/TrackInfo;->isContentMode()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 90
    iget-object v0, p0, Lcom/vk/music/view/SmallPlayerView$ItemHolder;->progress:Landroid/widget/ProgressBar;

    invoke-virtual {p0}, Lcom/vk/music/view/SmallPlayerView$ItemHolder;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f020128

    invoke-static {v1, v2}, Lcom/vkontakte/android/ViewUtils;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 94
    :goto_1
    iget-object v0, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Lcom/vkontakte/android/audio/player/TrackInfo;

    invoke-virtual {p0, v0}, Lcom/vk/music/view/SmallPlayerView$ItemHolder;->onBufferingProgress(Lcom/vkontakte/android/audio/player/TrackInfo;)V

    .line 95
    iget-object v0, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Lcom/vkontakte/android/audio/player/TrackInfo;

    invoke-virtual {p0, v0}, Lcom/vk/music/view/SmallPlayerView$ItemHolder;->onProgress(Lcom/vkontakte/android/audio/player/TrackInfo;)V

    .line 96
    return-void

    .line 87
    :cond_1
    iget-object v0, p0, Lcom/vk/music/view/SmallPlayerView$ItemHolder;->playPause:Landroid/widget/ImageButton;

    const v1, 0x7f0201fe

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setImageResource(I)V

    goto :goto_0

    .line 92
    :cond_2
    iget-object v0, p0, Lcom/vk/music/view/SmallPlayerView$ItemHolder;->progress:Landroid/widget/ProgressBar;

    invoke-virtual {p0}, Lcom/vk/music/view/SmallPlayerView$ItemHolder;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f020129

    invoke-static {v1, v2}, Lcom/vkontakte/android/ViewUtils;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_1
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 59
    check-cast p1, Landroid/util/Pair;

    invoke-virtual {p0, p1}, Lcom/vk/music/view/SmallPlayerView$ItemHolder;->onBind(Landroid/util/Pair;)V

    return-void
.end method

.method public onBufferingProgress(Lcom/vkontakte/android/audio/player/TrackInfo;)V
    .locals 0
    .param p1, "trackInfo"    # Lcom/vkontakte/android/audio/player/TrackInfo;

    .prologue
    .line 100
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 108
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    .line 120
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->showPlayer()V

    .line 123
    :goto_0
    return-void

    .line 110
    :sswitch_0
    invoke-virtual {p0}, Lcom/vk/music/view/SmallPlayerView$ItemHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/Pair;

    iget-object v0, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    sget-object v1, Lcom/vkontakte/android/audio/player/PlayerState;->PLAYING:Lcom/vkontakte/android/audio/player/PlayerState;

    if-ne v0, v1, :cond_0

    .line 111
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->pause()V

    goto :goto_0

    .line 113
    :cond_0
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->resume()V

    goto :goto_0

    .line 117
    :sswitch_1
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->next()V

    goto :goto_0

    .line 108
    nop

    :sswitch_data_0
    .sparse-switch
        0x7f10021d -> :sswitch_1
        0x7f1003f3 -> :sswitch_0
    .end sparse-switch
.end method

.method public onProgress(Lcom/vkontakte/android/audio/player/TrackInfo;)V
    .locals 2
    .param p1, "trackInfo"    # Lcom/vkontakte/android/audio/player/TrackInfo;

    .prologue
    .line 103
    iget-object v0, p0, Lcom/vk/music/view/SmallPlayerView$ItemHolder;->progress:Landroid/widget/ProgressBar;

    invoke-virtual {p1}, Lcom/vkontakte/android/audio/player/TrackInfo;->getPositionPercent()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 104
    return-void
.end method
