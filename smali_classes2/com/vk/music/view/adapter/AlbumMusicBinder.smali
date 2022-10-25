.class public Lcom/vk/music/view/adapter/AlbumMusicBinder;
.super Ljava/lang/Object;
.source "AlbumMusicBinder.java"

# interfaces
.implements Lcom/vk/music/view/adapter/ItemViewHolder$Binder;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vk/music/view/adapter/ItemViewHolder$Binder",
        "<",
        "Lcom/vkontakte/android/audio/MusicTrack;",
        ">;"
    }
.end annotation


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
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput-object p1, p0, Lcom/vk/music/view/adapter/AlbumMusicBinder;->model:Lcom/vk/music/model/PlayerModel;

    .line 23
    return-void
.end method


# virtual methods
.method public onBind(Lcom/vk/music/view/adapter/ViewRefs;Lcom/vkontakte/android/audio/MusicTrack;I)V
    .locals 4
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
    const/4 v3, 0x0

    .line 48
    invoke-virtual {p1}, Lcom/vk/music/view/adapter/ViewRefs;->next()Landroid/view/View;

    move-result-object v0

    .line 49
    .local v0, "playingIndicator":Landroid/view/View;
    iget-object v1, p0, Lcom/vk/music/view/adapter/AlbumMusicBinder;->model:Lcom/vk/music/model/PlayerModel;

    invoke-interface {v1}, Lcom/vk/music/model/PlayerModel;->getPlayingTrack()Lcom/vkontakte/android/audio/MusicTrack;

    move-result-object v1

    invoke-virtual {p2, v1}, Lcom/vkontakte/android/audio/MusicTrack;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 50
    invoke-virtual {p1}, Lcom/vk/music/view/adapter/ViewRefs;->next()Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 51
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 52
    iget-object v1, p0, Lcom/vk/music/view/adapter/AlbumMusicBinder;->model:Lcom/vk/music/model/PlayerModel;

    invoke-interface {v1}, Lcom/vk/music/model/PlayerModel;->isPlayerPlaying()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setActivated(Z)V

    .line 58
    :goto_0
    invoke-virtual {p1}, Lcom/vk/music/view/adapter/ViewRefs;->next()Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iget-object v2, p2, Lcom/vkontakte/android/audio/MusicTrack;->title:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 59
    invoke-virtual {p1}, Lcom/vk/music/view/adapter/ViewRefs;->next()Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iget v2, p2, Lcom/vkontakte/android/audio/MusicTrack;->duration:I

    int-to-long v2, v2

    invoke-static {v2, v3}, Lcom/vk/music/formatter/DurationFormatter;->formatDurationShort(J)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 60
    return-void

    .line 54
    :cond_0
    invoke-virtual {p1}, Lcom/vk/music/view/adapter/ViewRefs;->next()Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    add-int/lit8 v2, p3, 0x1

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 55
    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 56
    invoke-virtual {v0, v3}, Landroid/view/View;->setActivated(Z)V

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
    .line 17
    check-cast p2, Lcom/vkontakte/android/audio/MusicTrack;

    invoke-virtual {p0, p1, p2, p3}, Lcom/vk/music/view/adapter/AlbumMusicBinder;->onBind(Lcom/vk/music/view/adapter/ViewRefs;Lcom/vkontakte/android/audio/MusicTrack;I)V

    return-void
.end method

.method public onCreate(Landroid/view/View;)Lcom/vk/music/view/adapter/ViewRefs;
    .locals 3
    .param p1, "itemView"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 28
    const v1, 0x7f1003be

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 29
    .local v0, "playingIndicator":Landroid/view/View;
    new-instance v1, Lcom/vk/music/graphics/PlayingDrawable$ResourceBuilder;

    .line 30
    invoke-static {p1}, Lcom/vk/core/util/Resourcer;->from(Landroid/view/View;)Lcom/vk/core/util/Resourcer;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/vk/music/graphics/PlayingDrawable$ResourceBuilder;-><init>(Lcom/vk/core/util/Resourcer;)V

    const v2, 0x7f0a0017

    .line 31
    invoke-virtual {v1, v2}, Lcom/vk/music/graphics/PlayingDrawable$ResourceBuilder;->count(I)Lcom/vk/music/graphics/PlayingDrawable$Builder;

    move-result-object v1

    const v2, 0x7f090113

    .line 32
    invoke-virtual {v1, v2}, Lcom/vk/music/graphics/PlayingDrawable$Builder;->rectWidth(I)Lcom/vk/music/graphics/PlayingDrawable$Builder;

    move-result-object v1

    const v2, 0x7f090111

    .line 33
    invoke-virtual {v1, v2}, Lcom/vk/music/graphics/PlayingDrawable$Builder;->rectHeight(I)Lcom/vk/music/graphics/PlayingDrawable$Builder;

    move-result-object v1

    const v2, 0x7f090112

    .line 34
    invoke-virtual {v1, v2}, Lcom/vk/music/graphics/PlayingDrawable$Builder;->rectMinHeight(I)Lcom/vk/music/graphics/PlayingDrawable$Builder;

    move-result-object v1

    const v2, 0x7f0f009b

    .line 35
    invoke-virtual {v1, v2}, Lcom/vk/music/graphics/PlayingDrawable$Builder;->rectColor(I)Lcom/vk/music/graphics/PlayingDrawable$Builder;

    move-result-object v1

    const v2, 0x7f090110

    .line 36
    invoke-virtual {v1, v2}, Lcom/vk/music/graphics/PlayingDrawable$Builder;->gapWidth(I)Lcom/vk/music/graphics/PlayingDrawable$Builder;

    move-result-object v1

    .line 37
    invoke-virtual {v1}, Lcom/vk/music/graphics/PlayingDrawable$Builder;->build()Lcom/vk/music/graphics/PlayingDrawable;

    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 39
    new-instance v1, Lcom/vk/music/view/adapter/ViewRefs;

    invoke-direct {v1}, Lcom/vk/music/view/adapter/ViewRefs;-><init>()V

    .line 40
    invoke-virtual {v1, v0}, Lcom/vk/music/view/adapter/ViewRefs;->put(Landroid/view/View;)Lcom/vk/music/view/adapter/ViewRefs;

    move-result-object v1

    const v2, 0x7f1003c0

    .line 41
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vk/music/view/adapter/ViewRefs;->put(Landroid/view/View;)Lcom/vk/music/view/adapter/ViewRefs;

    move-result-object v1

    const v2, 0x7f100216

    .line 42
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vk/music/view/adapter/ViewRefs;->put(Landroid/view/View;)Lcom/vk/music/view/adapter/ViewRefs;

    move-result-object v1

    const v2, 0x7f100219

    .line 43
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vk/music/view/adapter/ViewRefs;->put(Landroid/view/View;)Lcom/vk/music/view/adapter/ViewRefs;

    move-result-object v1

    return-object v1
.end method
