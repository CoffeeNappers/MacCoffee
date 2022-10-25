.class public Lcom/vk/music/view/adapter/PlayingMusicBinder;
.super Lcom/vk/music/view/adapter/MusicBinder;
.source "PlayingMusicBinder.java"


# instance fields
.field private final model:Lcom/vk/music/model/PlayerModel;


# direct methods
.method public constructor <init>(Lcom/vk/music/model/PlayerModel;)V
    .locals 0
    .param p1, "model"    # Lcom/vk/music/model/PlayerModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 20
    invoke-direct {p0}, Lcom/vk/music/view/adapter/MusicBinder;-><init>()V

    .line 21
    iput-object p1, p0, Lcom/vk/music/view/adapter/PlayingMusicBinder;->model:Lcom/vk/music/model/PlayerModel;

    .line 22
    return-void
.end method


# virtual methods
.method public onBind(Lcom/vk/music/view/adapter/ViewRefs;Lcom/vkontakte/android/audio/MusicTrack;I)V
    .locals 3
    .param p1, "refs"    # Lcom/vk/music/view/adapter/ViewRefs;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "position"    # I

    .prologue
    const/4 v2, 0x0

    .line 44
    invoke-super {p0, p1, p2, p3}, Lcom/vk/music/view/adapter/MusicBinder;->onBind(Lcom/vk/music/view/adapter/ViewRefs;Lcom/vkontakte/android/audio/MusicTrack;I)V

    .line 45
    invoke-virtual {p1}, Lcom/vk/music/view/adapter/ViewRefs;->next()Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 46
    .local v0, "playingIndicator":Landroid/widget/ImageView;
    iget-object v1, p0, Lcom/vk/music/view/adapter/PlayingMusicBinder;->model:Lcom/vk/music/model/PlayerModel;

    invoke-interface {v1}, Lcom/vk/music/model/PlayerModel;->getPlayingTrack()Lcom/vkontakte/android/audio/MusicTrack;

    move-result-object v1

    invoke-virtual {p2, v1}, Lcom/vkontakte/android/audio/MusicTrack;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 47
    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 48
    iget-object v1, p0, Lcom/vk/music/view/adapter/PlayingMusicBinder;->model:Lcom/vk/music/model/PlayerModel;

    invoke-interface {v1}, Lcom/vk/music/model/PlayerModel;->isPlayerPlaying()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setActivated(Z)V

    .line 53
    :goto_0
    return-void

    .line 50
    :cond_0
    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 51
    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setActivated(Z)V

    goto :goto_0
.end method

.method public bridge synthetic onBind(Lcom/vk/music/view/adapter/ViewRefs;Ljava/lang/Object;I)V
    .locals 0
    .param p1    # Lcom/vk/music/view/adapter/ViewRefs;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 16
    check-cast p2, Lcom/vkontakte/android/audio/MusicTrack;

    invoke-virtual {p0, p1, p2, p3}, Lcom/vk/music/view/adapter/PlayingMusicBinder;->onBind(Lcom/vk/music/view/adapter/ViewRefs;Lcom/vkontakte/android/audio/MusicTrack;I)V

    return-void
.end method

.method public onCreate(Landroid/view/View;)Lcom/vk/music/view/adapter/ViewRefs;
    .locals 4
    .param p1, "itemView"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 27
    invoke-super {p0, p1}, Lcom/vk/music/view/adapter/MusicBinder;->onCreate(Landroid/view/View;)Lcom/vk/music/view/adapter/ViewRefs;

    move-result-object v1

    .line 28
    .local v1, "viewRefs":Lcom/vk/music/view/adapter/ViewRefs;
    const v2, 0x7f1003be

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 29
    .local v0, "playingIndicator":Landroid/widget/ImageView;
    new-instance v2, Lcom/vk/music/graphics/PlayingDrawable$ResourceBuilder;

    .line 30
    invoke-static {p1}, Lcom/vk/core/util/Resourcer;->from(Landroid/view/View;)Lcom/vk/core/util/Resourcer;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/vk/music/graphics/PlayingDrawable$ResourceBuilder;-><init>(Lcom/vk/core/util/Resourcer;)V

    const v3, 0x7f0a0017

    .line 31
    invoke-virtual {v2, v3}, Lcom/vk/music/graphics/PlayingDrawable$ResourceBuilder;->count(I)Lcom/vk/music/graphics/PlayingDrawable$Builder;

    move-result-object v2

    const v3, 0x7f090113

    .line 32
    invoke-virtual {v2, v3}, Lcom/vk/music/graphics/PlayingDrawable$Builder;->rectWidth(I)Lcom/vk/music/graphics/PlayingDrawable$Builder;

    move-result-object v2

    const v3, 0x7f090111

    .line 33
    invoke-virtual {v2, v3}, Lcom/vk/music/graphics/PlayingDrawable$Builder;->rectHeight(I)Lcom/vk/music/graphics/PlayingDrawable$Builder;

    move-result-object v2

    const v3, 0x7f090112

    .line 34
    invoke-virtual {v2, v3}, Lcom/vk/music/graphics/PlayingDrawable$Builder;->rectMinHeight(I)Lcom/vk/music/graphics/PlayingDrawable$Builder;

    move-result-object v2

    const v3, 0x7f0f009c

    .line 35
    invoke-virtual {v2, v3}, Lcom/vk/music/graphics/PlayingDrawable$Builder;->rectColor(I)Lcom/vk/music/graphics/PlayingDrawable$Builder;

    move-result-object v2

    const v3, 0x7f090110

    .line 36
    invoke-virtual {v2, v3}, Lcom/vk/music/graphics/PlayingDrawable$Builder;->gapWidth(I)Lcom/vk/music/graphics/PlayingDrawable$Builder;

    move-result-object v2

    .line 37
    invoke-virtual {v2}, Lcom/vk/music/graphics/PlayingDrawable$Builder;->build()Lcom/vk/music/graphics/PlayingDrawable;

    move-result-object v2

    .line 29
    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 39
    invoke-virtual {v1, v0}, Lcom/vk/music/view/adapter/ViewRefs;->put(Landroid/view/View;)Lcom/vk/music/view/adapter/ViewRefs;

    move-result-object v2

    return-object v2
.end method
