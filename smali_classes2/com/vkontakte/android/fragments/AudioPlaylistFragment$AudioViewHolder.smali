.class Lcom/vkontakte/android/fragments/AudioPlaylistFragment$AudioViewHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "AudioPlaylistFragment.java"

# interfaces
.implements Lme/grishka/appkit/views/UsableRecyclerView$Clickable;
.implements Lme/grishka/appkit/views/UsableRecyclerView$LongClickable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/AudioPlaylistFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AudioViewHolder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/audio/player/PlayerTrack;",
        ">;",
        "Lme/grishka/appkit/views/UsableRecyclerView$Clickable;",
        "Lme/grishka/appkit/views/UsableRecyclerView$LongClickable;"
    }
.end annotation


# instance fields
.field private artist:Landroid/widget/TextView;

.field private cacheIcon:Landroid/widget/ImageView;

.field private duration:Landroid/widget/TextView;

.field private playIcon:Landroid/widget/ImageView;

.field final synthetic this$0:Lcom/vkontakte/android/fragments/AudioPlaylistFragment;

.field private title:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/fragments/AudioPlaylistFragment;)V
    .locals 5

    .prologue
    const/4 v4, 0x0

    const/high16 v3, 0x41800000    # 16.0f

    .line 329
    iput-object p1, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$AudioViewHolder;->this$0:Lcom/vkontakte/android/fragments/AudioPlaylistFragment;

    .line 330
    invoke-virtual {p1}, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const v1, 0x7f03005a

    invoke-static {p1}, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->access$500(Lcom/vkontakte/android/fragments/AudioPlaylistFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(Landroid/content/Context;ILandroid/view/ViewGroup;)V

    .line 331
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$AudioViewHolder;->itemView:Landroid/view/View;

    const v1, 0x7f100216

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$AudioViewHolder;->title:Landroid/widget/TextView;

    .line 332
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$AudioViewHolder;->itemView:Landroid/view/View;

    const v1, 0x7f100217

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$AudioViewHolder;->artist:Landroid/widget/TextView;

    .line 333
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$AudioViewHolder;->itemView:Landroid/view/View;

    const v1, 0x7f100219

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$AudioViewHolder;->duration:Landroid/widget/TextView;

    .line 334
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$AudioViewHolder;->itemView:Landroid/view/View;

    const v1, 0x7f100212

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$AudioViewHolder;->playIcon:Landroid/widget/ImageView;

    .line 335
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$AudioViewHolder;->itemView:Landroid/view/View;

    const v1, 0x7f100218

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$AudioViewHolder;->cacheIcon:Landroid/widget/ImageView;

    .line 336
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$AudioViewHolder;->playIcon:Landroid/widget/ImageView;

    new-instance v1, Lcom/vkontakte/android/ui/drawable/AudioVisualizerDrawable;

    invoke-direct {v1}, Lcom/vkontakte/android/ui/drawable/AudioVisualizerDrawable;-><init>()V

    const v2, -0x393634

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/ui/drawable/AudioVisualizerDrawable;->setColor(I)Lcom/vkontakte/android/ui/drawable/AudioVisualizerDrawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 337
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$AudioViewHolder;->itemView:Landroid/view/View;

    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v1

    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    invoke-virtual {v0, v1, v4, v2, v4}, Landroid/view/View;->setPadding(IIII)V

    .line 338
    return-void
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/audio/player/PlayerTrack;)V
    .locals 10
    .param p1, "item"    # Lcom/vkontakte/android/audio/player/PlayerTrack;

    .prologue
    const/16 v6, 0x8

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 342
    iget-object v5, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$AudioViewHolder;->title:Landroid/widget/TextView;

    iget-object v7, p1, Lcom/vkontakte/android/audio/player/PlayerTrack;->title:Ljava/lang/String;

    invoke-virtual {v5, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 343
    iget-object v5, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$AudioViewHolder;->artist:Landroid/widget/TextView;

    iget-object v7, p1, Lcom/vkontakte/android/audio/player/PlayerTrack;->artist:Ljava/lang/String;

    invoke-virtual {v5, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 344
    iget-object v5, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$AudioViewHolder;->duration:Landroid/widget/TextView;

    const-string/jumbo v7, "%d:%02d"

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Object;

    iget v9, p1, Lcom/vkontakte/android/audio/player/PlayerTrack;->duration:I

    div-int/lit8 v9, v9, 0x3c

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, v4

    iget v9, p1, Lcom/vkontakte/android/audio/player/PlayerTrack;->duration:I

    rem-int/lit8 v9, v9, 0x3c

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, v3

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 345
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getCurrentTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v2

    .line 346
    .local v2, "musicTrack":Lcom/vkontakte/android/audio/MusicTrack;
    invoke-virtual {p1, v2}, Lcom/vkontakte/android/audio/player/PlayerTrack;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 347
    .local v1, "isCurrent":Z
    invoke-virtual {p1}, Lcom/vkontakte/android/audio/player/PlayerTrack;->getMid()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/vkontakte/android/audio/AudioFacade;->isCached(Ljava/lang/String;)Z

    move-result v0

    .line 348
    .local v0, "isCached":Z
    if-eqz v1, :cond_1

    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getPlayerState()Lcom/vkontakte/android/audio/player/PlayerState;

    move-result-object v5

    invoke-virtual {v5}, Lcom/vkontakte/android/audio/player/PlayerState;->isPlayState()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 349
    .local v3, "pt":Z
    :goto_0
    iget-object v5, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$AudioViewHolder;->this$0:Lcom/vkontakte/android/fragments/AudioPlaylistFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->access$300(Lcom/vkontakte/android/fragments/AudioPlaylistFragment;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 350
    iget-object v7, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$AudioViewHolder;->playIcon:Landroid/widget/ImageView;

    if-eqz v1, :cond_2

    move v5, v4

    :goto_1
    invoke-virtual {v7, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 352
    :cond_0
    iget-object v5, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$AudioViewHolder;->playIcon:Landroid/widget/ImageView;

    invoke-virtual {v5, v3}, Landroid/widget/ImageView;->setSelected(Z)V

    .line 353
    iget-object v5, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$AudioViewHolder;->cacheIcon:Landroid/widget/ImageView;

    if-eqz v0, :cond_3

    :goto_2
    invoke-virtual {v5, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 354
    return-void

    .end local v3    # "pt":Z
    :cond_1
    move v3, v4

    .line 348
    goto :goto_0

    .restart local v3    # "pt":Z
    :cond_2
    move v5, v6

    .line 350
    goto :goto_1

    :cond_3
    move v4, v6

    .line 353
    goto :goto_2
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 324
    check-cast p1, Lcom/vkontakte/android/audio/player/PlayerTrack;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$AudioViewHolder;->onBind(Lcom/vkontakte/android/audio/player/PlayerTrack;)V

    return-void
.end method

.method public onClick()V
    .locals 3

    .prologue
    .line 358
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getCurrentTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v0

    .line 359
    .local v0, "track":Lcom/vkontakte/android/audio/player/PlayerTrack;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    move-object v2, v1

    :goto_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$AudioViewHolder;->item:Ljava/lang/Object;

    check-cast v1, Lcom/vkontakte/android/audio/player/PlayerTrack;

    iget-object v1, v1, Lcom/vkontakte/android/audio/player/PlayerTrack;->uuid:Ljava/lang/String;

    invoke-static {v2, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 360
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->toggleResumePause()V

    .line 364
    :goto_1
    return-void

    .line 359
    :cond_0
    iget-object v1, v0, Lcom/vkontakte/android/audio/player/PlayerTrack;->uuid:Ljava/lang/String;

    move-object v2, v1

    goto :goto_0

    .line 362
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$AudioViewHolder;->item:Ljava/lang/Object;

    check-cast v1, Lcom/vkontakte/android/audio/player/PlayerTrack;

    iget-object v1, v1, Lcom/vkontakte/android/audio/player/PlayerTrack;->uuid:Ljava/lang/String;

    invoke-static {v1}, Lcom/vkontakte/android/audio/AudioFacade;->playTrack(Ljava/lang/String;)V

    goto :goto_1
.end method

.method public onLongClick()Z
    .locals 1

    .prologue
    .line 368
    const/4 v0, 0x0

    return v0
.end method
