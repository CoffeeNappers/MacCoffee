.class public Lcom/vk/music/view/adapter/HighlightMusicBinder;
.super Lcom/vk/music/view/adapter/MusicBinder;
.source "HighlightMusicBinder.java"


# instance fields
.field private final exclusion:[I

.field private final inTrashDecorator:Lcom/vkontakte/android/functions/VoidF1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/functions/VoidF1",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private final notInTrashDecorator:Lcom/vkontakte/android/functions/VoidF1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/functions/VoidF1",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private final removed:Ljava/util/Collection;
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
    .locals 3
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
    .line 25
    .local p1, "removed":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/vkontakte/android/audio/MusicTrack;>;"
    invoke-direct {p0}, Lcom/vk/music/view/adapter/MusicBinder;-><init>()V

    .line 21
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const v2, 0x7f1003c2

    aput v2, v0, v1

    iput-object v0, p0, Lcom/vk/music/view/adapter/HighlightMusicBinder;->exclusion:[I

    .line 22
    invoke-static {}, Lcom/vk/music/view/adapter/HighlightMusicBinder$$Lambda$1;->lambdaFactory$()Lcom/vkontakte/android/functions/VoidF1;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/view/adapter/HighlightMusicBinder;->inTrashDecorator:Lcom/vkontakte/android/functions/VoidF1;

    .line 23
    invoke-static {}, Lcom/vk/music/view/adapter/HighlightMusicBinder$$Lambda$2;->lambdaFactory$()Lcom/vkontakte/android/functions/VoidF1;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/view/adapter/HighlightMusicBinder;->notInTrashDecorator:Lcom/vkontakte/android/functions/VoidF1;

    .line 26
    iput-object p1, p0, Lcom/vk/music/view/adapter/HighlightMusicBinder;->removed:Ljava/util/Collection;

    .line 27
    return-void
.end method

.method static synthetic lambda$new$0(Landroid/view/View;)V
    .locals 1
    .param p0, "v"    # Landroid/view/View;

    .prologue
    .line 22
    const v0, 0x3ecccccd    # 0.4f

    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    return-void
.end method

.method static synthetic lambda$new$1(Landroid/view/View;)V
    .locals 1
    .param p0, "v"    # Landroid/view/View;

    .prologue
    .line 23
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

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
    .line 38
    invoke-super {p0, p1, p2, p3}, Lcom/vk/music/view/adapter/MusicBinder;->onBind(Lcom/vk/music/view/adapter/ViewRefs;Lcom/vkontakte/android/audio/MusicTrack;I)V

    .line 39
    iget-object v0, p0, Lcom/vk/music/view/adapter/HighlightMusicBinder;->removed:Ljava/util/Collection;

    invoke-interface {v0, p2}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 40
    invoke-virtual {p1}, Lcom/vk/music/view/adapter/ViewRefs;->next()Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    const v1, 0x7f02015f

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 41
    iget-object v0, p0, Lcom/vk/music/view/adapter/HighlightMusicBinder;->exclusion:[I

    iget-object v1, p0, Lcom/vk/music/view/adapter/HighlightMusicBinder;->inTrashDecorator:Lcom/vkontakte/android/functions/VoidF1;

    invoke-virtual {p1, v0, v1}, Lcom/vk/music/view/adapter/ViewRefs;->apply([ILcom/vkontakte/android/functions/VoidF1;)V

    .line 46
    :goto_0
    return-void

    .line 43
    :cond_0
    invoke-virtual {p1}, Lcom/vk/music/view/adapter/ViewRefs;->next()Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    const v1, 0x7f020354

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 44
    iget-object v0, p0, Lcom/vk/music/view/adapter/HighlightMusicBinder;->exclusion:[I

    iget-object v1, p0, Lcom/vk/music/view/adapter/HighlightMusicBinder;->notInTrashDecorator:Lcom/vkontakte/android/functions/VoidF1;

    invoke-virtual {p1, v0, v1}, Lcom/vk/music/view/adapter/ViewRefs;->apply([ILcom/vkontakte/android/functions/VoidF1;)V

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

    invoke-virtual {p0, p1, p2, p3}, Lcom/vk/music/view/adapter/HighlightMusicBinder;->onBind(Lcom/vk/music/view/adapter/ViewRefs;Lcom/vkontakte/android/audio/MusicTrack;I)V

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
    .line 32
    invoke-super {p0, p1}, Lcom/vk/music/view/adapter/MusicBinder;->onCreate(Landroid/view/View;)Lcom/vk/music/view/adapter/ViewRefs;

    move-result-object v0

    const v1, 0x7f1003c2

    .line 33
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/view/adapter/ViewRefs;->put(Landroid/view/View;)Lcom/vk/music/view/adapter/ViewRefs;

    move-result-object v0

    return-object v0
.end method
