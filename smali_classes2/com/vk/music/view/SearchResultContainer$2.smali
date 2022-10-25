.class Lcom/vk/music/view/SearchResultContainer$2;
.super Lcom/vk/music/view/adapter/PlayingMusicBinder;
.source "SearchResultContainer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/music/view/SearchResultContainer;-><init>(Landroid/content/Context;Lcom/vk/music/model/SearchResultModel;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/music/view/SearchResultContainer;


# direct methods
.method constructor <init>(Lcom/vk/music/view/SearchResultContainer;Lcom/vk/music/model/PlayerModel;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/music/view/SearchResultContainer;
    .param p2, "model"    # Lcom/vk/music/model/PlayerModel;

    .prologue
    .line 247
    iput-object p1, p0, Lcom/vk/music/view/SearchResultContainer$2;->this$0:Lcom/vk/music/view/SearchResultContainer;

    invoke-direct {p0, p2}, Lcom/vk/music/view/adapter/PlayingMusicBinder;-><init>(Lcom/vk/music/model/PlayerModel;)V

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
    .line 257
    invoke-super {p0, p1, p2, p3}, Lcom/vk/music/view/adapter/PlayingMusicBinder;->onBind(Lcom/vk/music/view/adapter/ViewRefs;Lcom/vkontakte/android/audio/MusicTrack;I)V

    .line 258
    invoke-virtual {p1}, Lcom/vk/music/view/adapter/ViewRefs;->next()Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget v1, p2, Lcom/vkontakte/android/audio/MusicTrack;->duration:I

    int-to-long v2, v1

    invoke-static {v2, v3}, Lcom/vk/music/formatter/DurationFormatter;->formatDurationShort(J)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 259
    return-void
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
    .line 247
    check-cast p2, Lcom/vkontakte/android/audio/MusicTrack;

    invoke-virtual {p0, p1, p2, p3}, Lcom/vk/music/view/SearchResultContainer$2;->onBind(Lcom/vk/music/view/adapter/ViewRefs;Lcom/vkontakte/android/audio/MusicTrack;I)V

    return-void
.end method

.method public onCreate(Landroid/view/View;)Lcom/vk/music/view/adapter/ViewRefs;
    .locals 2
    .param p1, "itemView"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 251
    invoke-super {p0, p1}, Lcom/vk/music/view/adapter/PlayingMusicBinder;->onCreate(Landroid/view/View;)Lcom/vk/music/view/adapter/ViewRefs;

    move-result-object v0

    const v1, 0x7f100219

    .line 252
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/view/adapter/ViewRefs;->put(Landroid/view/View;)Lcom/vk/music/view/adapter/ViewRefs;

    move-result-object v0

    return-object v0
.end method
