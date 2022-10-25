.class public final Lcom/vk/music/view/adapter/PlaylistBinder;
.super Ljava/lang/Object;
.source "PlaylistBinder.java"

# interfaces
.implements Lcom/vk/music/view/adapter/ItemViewHolder$Binder;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vk/music/view/adapter/ItemViewHolder$Binder",
        "<",
        "Lcom/vk/music/dto/Playlist;",
        ">;"
    }
.end annotation


# instance fields
.field private final resourcer:Lcom/vk/core/util/Resourcer;


# direct methods
.method public constructor <init>(Lcom/vk/core/util/Resourcer;)V
    .locals 0
    .param p1, "resourcer"    # Lcom/vk/core/util/Resourcer;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-object p1, p0, Lcom/vk/music/view/adapter/PlaylistBinder;->resourcer:Lcom/vk/core/util/Resourcer;

    .line 24
    return-void
.end method

.method private static formatSnippet1(Lcom/vk/core/util/Resourcer;Lcom/vk/music/dto/Playlist;)Ljava/lang/CharSequence;
    .locals 2
    .param p0, "resourcer"    # Lcom/vk/core/util/Resourcer;
    .param p1, "playlist"    # Lcom/vk/music/dto/Playlist;

    .prologue
    .line 50
    iget v0, p1, Lcom/vk/music/dto/Playlist;->type:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 51
    iget-object v0, p1, Lcom/vk/music/dto/Playlist;->artists:Ljava/util/List;

    invoke-static {p0, v0}, Lcom/vk/music/formatter/PlaylistFormatter;->formatArtists(Lcom/vk/core/util/Resourcer;Ljava/util/List;)Ljava/lang/CharSequence;

    move-result-object v0

    .line 53
    :goto_0
    return-object v0

    :cond_0
    const-string/jumbo v0, ""

    goto :goto_0
.end method

.method private static formatSnippet2(Lcom/vk/core/util/Resourcer;Lcom/vk/music/dto/Playlist;)Ljava/lang/CharSequence;
    .locals 2
    .param p0, "resourcer"    # Lcom/vk/core/util/Resourcer;
    .param p1, "playlist"    # Lcom/vk/music/dto/Playlist;

    .prologue
    .line 58
    iget v0, p1, Lcom/vk/music/dto/Playlist;->type:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 59
    iget-object v0, p1, Lcom/vk/music/dto/Playlist;->genres:Ljava/util/List;

    iget v1, p1, Lcom/vk/music/dto/Playlist;->year:I

    invoke-static {p0, v0, v1}, Lcom/vk/music/formatter/PlaylistFormatter;->formatGenreYear(Lcom/vk/core/util/Resourcer;Ljava/util/List;I)Ljava/lang/CharSequence;

    move-result-object v0

    .line 61
    :goto_0
    return-object v0

    :cond_0
    iget v0, p1, Lcom/vk/music/dto/Playlist;->listeningsCount:I

    invoke-static {p0, v0}, Lcom/vk/music/formatter/PlaylistFormatter;->formatListenings(Lcom/vk/core/util/Resourcer;I)Ljava/lang/CharSequence;

    move-result-object v0

    goto :goto_0
.end method

.method private static setTextOrHide(Landroid/widget/TextView;Ljava/lang/CharSequence;)V
    .locals 1
    .param p0, "view"    # Landroid/widget/TextView;
    .param p1, "text"    # Ljava/lang/CharSequence;

    .prologue
    .line 66
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 67
    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 72
    :goto_0
    return-void

    .line 69
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 70
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method


# virtual methods
.method public onBind(Lcom/vk/music/view/adapter/ViewRefs;Lcom/vk/music/dto/Playlist;I)V
    .locals 3
    .param p1, "viewRefs"    # Lcom/vk/music/view/adapter/ViewRefs;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "playlist"    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "position"    # I

    .prologue
    .line 38
    invoke-virtual {p1}, Lcom/vk/music/view/adapter/ViewRefs;->next()Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/music/view/ThumbsImageView;

    .line 39
    .local v0, "image":Lcom/vk/music/view/ThumbsImageView;
    iget-object v1, p2, Lcom/vk/music/dto/Playlist;->photo:Lcom/vk/music/dto/Thumb;

    if-eqz v1, :cond_0

    .line 40
    iget-object v1, p2, Lcom/vk/music/dto/Playlist;->photo:Lcom/vk/music/dto/Thumb;

    invoke-virtual {v0, v1}, Lcom/vk/music/view/ThumbsImageView;->setThumb(Lcom/vk/music/dto/Thumb;)V

    .line 44
    :goto_0
    invoke-virtual {p1}, Lcom/vk/music/view/adapter/ViewRefs;->next()Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iget-object v2, p2, Lcom/vk/music/dto/Playlist;->title:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 45
    invoke-virtual {p1}, Lcom/vk/music/view/adapter/ViewRefs;->next()Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iget-object v2, p0, Lcom/vk/music/view/adapter/PlaylistBinder;->resourcer:Lcom/vk/core/util/Resourcer;

    invoke-static {v2, p2}, Lcom/vk/music/view/adapter/PlaylistBinder;->formatSnippet1(Lcom/vk/core/util/Resourcer;Lcom/vk/music/dto/Playlist;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vk/music/view/adapter/PlaylistBinder;->setTextOrHide(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    .line 46
    invoke-virtual {p1}, Lcom/vk/music/view/adapter/ViewRefs;->next()Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iget-object v2, p0, Lcom/vk/music/view/adapter/PlaylistBinder;->resourcer:Lcom/vk/core/util/Resourcer;

    invoke-static {v2, p2}, Lcom/vk/music/view/adapter/PlaylistBinder;->formatSnippet2(Lcom/vk/core/util/Resourcer;Lcom/vk/music/dto/Playlist;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vk/music/view/adapter/PlaylistBinder;->setTextOrHide(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    .line 47
    return-void

    .line 42
    :cond_0
    iget-object v1, p2, Lcom/vk/music/dto/Playlist;->thumbs:Ljava/util/List;

    invoke-virtual {v0, v1}, Lcom/vk/music/view/ThumbsImageView;->setThumbs(Ljava/util/List;)V

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
    .line 18
    check-cast p2, Lcom/vk/music/dto/Playlist;

    invoke-virtual {p0, p1, p2, p3}, Lcom/vk/music/view/adapter/PlaylistBinder;->onBind(Lcom/vk/music/view/adapter/ViewRefs;Lcom/vk/music/dto/Playlist;I)V

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
    .line 29
    new-instance v0, Lcom/vk/music/view/adapter/ViewRefs;

    invoke-direct {v0}, Lcom/vk/music/view/adapter/ViewRefs;-><init>()V

    const v1, 0x7f1003cb

    .line 30
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/view/adapter/ViewRefs;->put(Landroid/view/View;)Lcom/vk/music/view/adapter/ViewRefs;

    move-result-object v0

    const v1, 0x7f1003cc

    .line 31
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/view/adapter/ViewRefs;->put(Landroid/view/View;)Lcom/vk/music/view/adapter/ViewRefs;

    move-result-object v0

    const v1, 0x7f1003de

    .line 32
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/view/adapter/ViewRefs;->put(Landroid/view/View;)Lcom/vk/music/view/adapter/ViewRefs;

    move-result-object v0

    const v1, 0x7f1003e0

    .line 33
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/view/adapter/ViewRefs;->put(Landroid/view/View;)Lcom/vk/music/view/adapter/ViewRefs;

    move-result-object v0

    return-object v0
.end method
