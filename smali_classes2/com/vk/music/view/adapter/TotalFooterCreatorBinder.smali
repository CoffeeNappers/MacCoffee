.class public Lcom/vk/music/view/adapter/TotalFooterCreatorBinder;
.super Ljava/lang/Object;
.source "TotalFooterCreatorBinder.java"

# interfaces
.implements Lcom/vkontakte/android/functions/F1;
.implements Lcom/vkontakte/android/functions/VoidF;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/music/view/adapter/TotalFooterCreatorBinder$Interactor;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vkontakte/android/functions/F1",
        "<",
        "Landroid/view/View;",
        "Landroid/view/ViewGroup;",
        ">;",
        "Lcom/vkontakte/android/functions/VoidF;"
    }
.end annotation


# instance fields
.field private final interactor:Lcom/vk/music/view/adapter/TotalFooterCreatorBinder$Interactor;

.field total:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Lcom/vk/music/view/adapter/TotalFooterCreatorBinder$Interactor;)V
    .locals 0
    .param p1, "interactor"    # Lcom/vk/music/view/adapter/TotalFooterCreatorBinder$Interactor;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-object p1, p0, Lcom/vk/music/view/adapter/TotalFooterCreatorBinder;->interactor:Lcom/vk/music/view/adapter/TotalFooterCreatorBinder$Interactor;

    .line 43
    return-void
.end method


# virtual methods
.method public f(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3
    .param p1, "viewGroup"    # Landroid/view/ViewGroup;

    .prologue
    .line 47
    iget-object v0, p0, Lcom/vk/music/view/adapter/TotalFooterCreatorBinder;->interactor:Lcom/vk/music/view/adapter/TotalFooterCreatorBinder$Interactor;

    invoke-interface {v0}, Lcom/vk/music/view/adapter/TotalFooterCreatorBinder$Interactor;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f03013e

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vk/music/view/adapter/TotalFooterCreatorBinder;->total:Landroid/widget/TextView;

    return-object v0
.end method

.method public bridge synthetic f(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 24
    check-cast p1, Landroid/view/ViewGroup;

    invoke-virtual {p0, p1}, Lcom/vk/music/view/adapter/TotalFooterCreatorBinder;->f(Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public f()V
    .locals 8

    .prologue
    .line 52
    iget-object v3, p0, Lcom/vk/music/view/adapter/TotalFooterCreatorBinder;->interactor:Lcom/vk/music/view/adapter/TotalFooterCreatorBinder$Interactor;

    invoke-interface {v3}, Lcom/vk/music/view/adapter/TotalFooterCreatorBinder$Interactor;->getMusicTracks()Ljava/util/List;

    move-result-object v1

    .line 53
    .local v1, "musicTracks":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/MusicTrack;>;"
    invoke-static {v1}, Lcom/vk/core/util/CollectionUtils;->isEmpty(Ljava/util/Collection;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 54
    const/4 v2, 0x0

    .line 55
    .local v2, "totalDuration":I
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/MusicTrack;

    .line 56
    .local v0, "musicTrack":Lcom/vkontakte/android/audio/MusicTrack;
    iget v4, v0, Lcom/vkontakte/android/audio/MusicTrack;->duration:I

    add-int/2addr v2, v4

    .line 57
    goto :goto_0

    .line 58
    .end local v0    # "musicTrack":Lcom/vkontakte/android/audio/MusicTrack;
    :cond_0
    iget-object v3, p0, Lcom/vk/music/view/adapter/TotalFooterCreatorBinder;->total:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/vk/music/view/adapter/TotalFooterCreatorBinder;->interactor:Lcom/vk/music/view/adapter/TotalFooterCreatorBinder$Interactor;

    invoke-interface {v4}, Lcom/vk/music/view/adapter/TotalFooterCreatorBinder$Interactor;->getResourcer()Lcom/vk/core/util/Resourcer;

    move-result-object v4

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v5

    int-to-long v6, v2

    invoke-static {v4, v5, v6, v7}, Lcom/vk/music/formatter/PlaylistFormatter;->formatTotalSongsDuration(Lcom/vk/core/util/Resourcer;IJ)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 60
    .end local v2    # "totalDuration":I
    :cond_1
    return-void
.end method
