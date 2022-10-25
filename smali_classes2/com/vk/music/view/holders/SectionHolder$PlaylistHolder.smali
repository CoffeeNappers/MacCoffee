.class Lcom/vk/music/view/holders/SectionHolder$PlaylistHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "SectionHolder.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/view/holders/SectionHolder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PlaylistHolder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<TT;>;",
        "Landroid/view/View$OnClickListener;"
    }
.end annotation


# instance fields
.field final subtitle:Landroid/widget/TextView;

.field final thumbsImageView:Lcom/vk/music/view/ThumbsImageView;

.field final title:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/view/ViewGroup;)V
    .locals 1
    .param p1, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 329
    .local p0, "this":Lcom/vk/music/view/holders/SectionHolder$PlaylistHolder;, "Lcom/vk/music/view/holders/SectionHolder$PlaylistHolder<TT;>;"
    const v0, 0x7f030142

    invoke-direct {p0, v0, p1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/view/ViewGroup;)V

    .line 330
    const v0, 0x7f1003cc

    invoke-virtual {p0, v0}, Lcom/vk/music/view/holders/SectionHolder$PlaylistHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vk/music/view/holders/SectionHolder$PlaylistHolder;->title:Landroid/widget/TextView;

    .line 331
    const v0, 0x7f1003e2

    invoke-virtual {p0, v0}, Lcom/vk/music/view/holders/SectionHolder$PlaylistHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vk/music/view/holders/SectionHolder$PlaylistHolder;->subtitle:Landroid/widget/TextView;

    .line 332
    const v0, 0x7f1003cb

    invoke-virtual {p0, v0}, Lcom/vk/music/view/holders/SectionHolder$PlaylistHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/music/view/ThumbsImageView;

    iput-object v0, p0, Lcom/vk/music/view/holders/SectionHolder$PlaylistHolder;->thumbsImageView:Lcom/vk/music/view/ThumbsImageView;

    .line 334
    iget-object v0, p0, Lcom/vk/music/view/holders/SectionHolder$PlaylistHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 335
    return-void
.end method


# virtual methods
.method public onBind(Ljava/lang/Object;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 339
    .local p0, "this":Lcom/vk/music/view/holders/SectionHolder$PlaylistHolder;, "Lcom/vk/music/view/holders/SectionHolder$PlaylistHolder<TT;>;"
    .local p1, "item":Ljava/lang/Object;, "TT;"
    instance-of v2, p1, Lcom/vk/music/dto/Playlist;

    if-eqz v2, :cond_1

    move-object v1, p1

    .line 340
    check-cast v1, Lcom/vk/music/dto/Playlist;

    .line 341
    .local v1, "pl":Lcom/vk/music/dto/Playlist;
    iget-object v3, v1, Lcom/vk/music/dto/Playlist;->title:Ljava/lang/String;

    iget-object v2, v1, Lcom/vk/music/dto/Playlist;->artists:Ljava/util/List;

    if-eqz v2, :cond_0

    iget-object v2, v1, Lcom/vk/music/dto/Playlist;->artists:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    iget-object v2, v1, Lcom/vk/music/dto/Playlist;->artists:Ljava/util/List;

    const/4 v4, 0x0

    .line 342
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vk/music/dto/Artist;

    iget-object v2, v2, Lcom/vk/music/dto/Artist;->name:Ljava/lang/String;

    .line 341
    :goto_0
    invoke-virtual {p0, v1, v3, v2}, Lcom/vk/music/view/holders/SectionHolder$PlaylistHolder;->onBindPlaylist(Lcom/vk/music/dto/Playlist;Ljava/lang/String;Ljava/lang/String;)V

    .line 347
    .end local v1    # "pl":Lcom/vk/music/dto/Playlist;
    :goto_1
    return-void

    .line 342
    .restart local v1    # "pl":Lcom/vk/music/dto/Playlist;
    :cond_0
    const/4 v2, 0x0

    goto :goto_0

    .end local v1    # "pl":Lcom/vk/music/dto/Playlist;
    :cond_1
    move-object v0, p1

    .line 344
    check-cast v0, Lcom/vk/music/dto/ExtendedPlaylist;

    .line 345
    .local v0, "ePlaylist":Lcom/vk/music/dto/ExtendedPlaylist;
    iget-object v2, v0, Lcom/vk/music/dto/ExtendedPlaylist;->playlist:Lcom/vk/music/dto/Playlist;

    iget-object v3, v0, Lcom/vk/music/dto/ExtendedPlaylist;->title:Ljava/lang/String;

    iget-object v4, v0, Lcom/vk/music/dto/ExtendedPlaylist;->subtitle:Ljava/lang/String;

    invoke-virtual {p0, v2, v3, v4}, Lcom/vk/music/view/holders/SectionHolder$PlaylistHolder;->onBindPlaylist(Lcom/vk/music/dto/Playlist;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1
.end method

.method onBindPlaylist(Lcom/vk/music/dto/Playlist;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "item"    # Lcom/vk/music/dto/Playlist;
    .param p2, "title"    # Ljava/lang/String;
    .param p3, "subtitle"    # Ljava/lang/String;

    .prologue
    .line 350
    .local p0, "this":Lcom/vk/music/view/holders/SectionHolder$PlaylistHolder;, "Lcom/vk/music/view/holders/SectionHolder$PlaylistHolder<TT;>;"
    iget-object v0, p1, Lcom/vk/music/dto/Playlist;->photo:Lcom/vk/music/dto/Thumb;

    if-eqz v0, :cond_0

    .line 351
    iget-object v0, p0, Lcom/vk/music/view/holders/SectionHolder$PlaylistHolder;->thumbsImageView:Lcom/vk/music/view/ThumbsImageView;

    iget-object v1, p1, Lcom/vk/music/dto/Playlist;->photo:Lcom/vk/music/dto/Thumb;

    invoke-virtual {v0, v1}, Lcom/vk/music/view/ThumbsImageView;->setThumb(Lcom/vk/music/dto/Thumb;)V

    .line 355
    :goto_0
    iget-object v0, p0, Lcom/vk/music/view/holders/SectionHolder$PlaylistHolder;->title:Landroid/widget/TextView;

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 356
    iget-object v0, p0, Lcom/vk/music/view/holders/SectionHolder$PlaylistHolder;->subtitle:Landroid/widget/TextView;

    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 357
    return-void

    .line 353
    :cond_0
    iget-object v0, p0, Lcom/vk/music/view/holders/SectionHolder$PlaylistHolder;->thumbsImageView:Lcom/vk/music/view/ThumbsImageView;

    iget-object v1, p1, Lcom/vk/music/dto/Playlist;->thumbs:Ljava/util/List;

    invoke-virtual {v0, v1}, Lcom/vk/music/view/ThumbsImageView;->setThumbs(Ljava/util/List;)V

    goto :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 361
    .local p0, "this":Lcom/vk/music/view/holders/SectionHolder$PlaylistHolder;, "Lcom/vk/music/view/holders/SectionHolder$PlaylistHolder<TT;>;"
    iget-object v0, p0, Lcom/vk/music/view/holders/SectionHolder$PlaylistHolder;->item:Ljava/lang/Object;

    instance-of v0, v0, Lcom/vk/music/dto/Playlist;

    if-eqz v0, :cond_0

    .line 362
    new-instance v1, Lcom/vk/music/fragment/PlaylistFragment$Builder;

    iget-object v0, p0, Lcom/vk/music/view/holders/SectionHolder$PlaylistHolder;->item:Ljava/lang/Object;

    check-cast v0, Lcom/vk/music/dto/Playlist;

    invoke-direct {v1, v0}, Lcom/vk/music/fragment/PlaylistFragment$Builder;-><init>(Lcom/vk/music/dto/Playlist;)V

    invoke-virtual {p0}, Lcom/vk/music/view/holders/SectionHolder$PlaylistHolder;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/vk/music/fragment/PlaylistFragment$Builder;->go(Landroid/content/Context;)Z

    .line 366
    :goto_0
    return-void

    .line 364
    :cond_0
    new-instance v1, Lcom/vk/music/fragment/PlaylistFragment$Builder;

    iget-object v0, p0, Lcom/vk/music/view/holders/SectionHolder$PlaylistHolder;->item:Ljava/lang/Object;

    check-cast v0, Lcom/vk/music/dto/ExtendedPlaylist;

    iget-object v0, v0, Lcom/vk/music/dto/ExtendedPlaylist;->playlist:Lcom/vk/music/dto/Playlist;

    invoke-direct {v1, v0}, Lcom/vk/music/fragment/PlaylistFragment$Builder;-><init>(Lcom/vk/music/dto/Playlist;)V

    invoke-virtual {p0}, Lcom/vk/music/view/holders/SectionHolder$PlaylistHolder;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/vk/music/fragment/PlaylistFragment$Builder;->go(Landroid/content/Context;)Z

    goto :goto_0
.end method
