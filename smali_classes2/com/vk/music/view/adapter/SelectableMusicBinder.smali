.class public final Lcom/vk/music/view/adapter/SelectableMusicBinder;
.super Lcom/vk/music/view/adapter/MusicBinder;
.source "SelectableMusicBinder.java"


# instance fields
.field private final selection:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/Collection;)V
    .locals 0
    .param p1    # Ljava/util/Collection;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 20
    .local p1, "selection":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/vkontakte/android/audio/MusicTrack;>;"
    invoke-direct {p0}, Lcom/vk/music/view/adapter/MusicBinder;-><init>()V

    .line 21
    iput-object p1, p0, Lcom/vk/music/view/adapter/SelectableMusicBinder;->selection:Ljava/util/Collection;

    .line 22
    return-void
.end method


# virtual methods
.method public onBind(Lcom/vk/music/view/adapter/ViewRefs;Lcom/vkontakte/android/audio/MusicTrack;I)V
    .locals 2
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
    .line 33
    invoke-super {p0, p1, p2, p3}, Lcom/vk/music/view/adapter/MusicBinder;->onBind(Lcom/vk/music/view/adapter/ViewRefs;Lcom/vkontakte/android/audio/MusicTrack;I)V

    .line 34
    invoke-virtual {p1}, Lcom/vk/music/view/adapter/ViewRefs;->next()Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    iget-object v1, p0, Lcom/vk/music/view/adapter/SelectableMusicBinder;->selection:Ljava/util/Collection;

    invoke-interface {v1, p2}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 35
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
    .line 16
    check-cast p2, Lcom/vkontakte/android/audio/MusicTrack;

    invoke-virtual {p0, p1, p2, p3}, Lcom/vk/music/view/adapter/SelectableMusicBinder;->onBind(Lcom/vk/music/view/adapter/ViewRefs;Lcom/vkontakte/android/audio/MusicTrack;I)V

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
    .line 27
    invoke-super {p0, p1}, Lcom/vk/music/view/adapter/MusicBinder;->onCreate(Landroid/view/View;)Lcom/vk/music/view/adapter/ViewRefs;

    move-result-object v0

    const v1, 0x7f1003c1

    .line 28
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/view/adapter/ViewRefs;->put(Landroid/view/View;)Lcom/vk/music/view/adapter/ViewRefs;

    move-result-object v0

    return-object v0
.end method
