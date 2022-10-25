.class public Lcom/vk/music/view/adapter/HorizontalPlaylistBinder;
.super Ljava/lang/Object;
.source "HorizontalPlaylistBinder.java"

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


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onBind(Lcom/vk/music/view/adapter/ViewRefs;Lcom/vk/music/dto/Playlist;I)V
    .locals 4
    .param p1, "viewRefs"    # Lcom/vk/music/view/adapter/ViewRefs;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "pl"    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "position"    # I

    .prologue
    .line 24
    invoke-virtual {p1}, Lcom/vk/music/view/adapter/ViewRefs;->next()Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/music/view/ThumbsImageView;

    .line 25
    .local v0, "image":Lcom/vk/music/view/ThumbsImageView;
    iget v2, p2, Lcom/vk/music/dto/Playlist;->type:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_0

    .line 26
    const v2, 0x7f020392

    invoke-virtual {v0, v2}, Lcom/vk/music/view/ThumbsImageView;->setPlaceholderImage(I)V

    .line 30
    :goto_0
    iget-object v2, p2, Lcom/vk/music/dto/Playlist;->photo:Lcom/vk/music/dto/Thumb;

    if-eqz v2, :cond_1

    .line 31
    iget-object v2, p2, Lcom/vk/music/dto/Playlist;->photo:Lcom/vk/music/dto/Thumb;

    invoke-virtual {v0, v2}, Lcom/vk/music/view/ThumbsImageView;->setThumb(Lcom/vk/music/dto/Thumb;)V

    .line 35
    :goto_1
    invoke-virtual {p1}, Lcom/vk/music/view/adapter/ViewRefs;->next()Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iget-object v3, p2, Lcom/vk/music/dto/Playlist;->title:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 36
    iget-object v2, p2, Lcom/vk/music/dto/Playlist;->artists:Ljava/util/List;

    if-eqz v2, :cond_2

    iget-object v2, p2, Lcom/vk/music/dto/Playlist;->artists:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2

    iget-object v2, p2, Lcom/vk/music/dto/Playlist;->artists:Ljava/util/List;

    const/4 v3, 0x0

    .line 37
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vk/music/dto/Artist;

    iget-object v1, v2, Lcom/vk/music/dto/Artist;->name:Ljava/lang/String;

    .line 38
    .local v1, "subtitle":Ljava/lang/String;
    :goto_2
    invoke-virtual {p1}, Lcom/vk/music/view/adapter/ViewRefs;->next()Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 39
    return-void

    .line 28
    .end local v1    # "subtitle":Ljava/lang/String;
    :cond_0
    const v2, 0x7f020391

    invoke-virtual {v0, v2}, Lcom/vk/music/view/ThumbsImageView;->setPlaceholderImage(I)V

    goto :goto_0

    .line 33
    :cond_1
    iget-object v2, p2, Lcom/vk/music/dto/Playlist;->thumbs:Ljava/util/List;

    invoke-virtual {v0, v2}, Lcom/vk/music/view/ThumbsImageView;->setThumbs(Ljava/util/List;)V

    goto :goto_1

    .line 37
    :cond_2
    const/4 v1, 0x0

    goto :goto_2
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
    .line 11
    check-cast p2, Lcom/vk/music/dto/Playlist;

    invoke-virtual {p0, p1, p2, p3}, Lcom/vk/music/view/adapter/HorizontalPlaylistBinder;->onBind(Lcom/vk/music/view/adapter/ViewRefs;Lcom/vk/music/dto/Playlist;I)V

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
    .line 16
    new-instance v0, Lcom/vk/music/view/adapter/ViewRefs;

    invoke-direct {v0}, Lcom/vk/music/view/adapter/ViewRefs;-><init>()V

    const v1, 0x7f1003cb

    .line 17
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/view/adapter/ViewRefs;->put(Landroid/view/View;)Lcom/vk/music/view/adapter/ViewRefs;

    move-result-object v0

    const v1, 0x7f1003cc

    .line 18
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/view/adapter/ViewRefs;->put(Landroid/view/View;)Lcom/vk/music/view/adapter/ViewRefs;

    move-result-object v0

    const v1, 0x7f1003e2

    .line 19
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/view/adapter/ViewRefs;->put(Landroid/view/View;)Lcom/vk/music/view/adapter/ViewRefs;

    move-result-object v0

    return-object v0
.end method
