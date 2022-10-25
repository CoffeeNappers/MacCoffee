.class Lcom/vk/music/attach/controller/AdapterHelper;
.super Ljava/lang/Object;
.source "AdapterHelper.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static createEmptyAdapter(Landroid/view/LayoutInflater;)Lcom/vk/music/view/adapter/ViewAdapter;
    .locals 3
    .param p0, "inflater"    # Landroid/view/LayoutInflater;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 58
    new-instance v0, Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-static {p0}, Lcom/vk/music/attach/controller/AdapterHelper$$Lambda$5;->lambdaFactory$(Landroid/view/LayoutInflater;)Lcom/vkontakte/android/functions/F1;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/vk/music/view/adapter/ViewAdapter;-><init>(Lcom/vkontakte/android/functions/F1;I)V

    return-object v0
.end method

.method static createErrorAdapter(Landroid/view/LayoutInflater;Lcom/vkontakte/android/functions/VoidF;)Lcom/vk/music/view/adapter/ViewAdapter;
    .locals 3
    .param p0, "inflater"    # Landroid/view/LayoutInflater;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "onRetryClick"    # Lcom/vkontakte/android/functions/VoidF;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 46
    new-instance v0, Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-static {p0, p1}, Lcom/vk/music/attach/controller/AdapterHelper$$Lambda$4;->lambdaFactory$(Landroid/view/LayoutInflater;Lcom/vkontakte/android/functions/VoidF;)Lcom/vkontakte/android/functions/F1;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/vk/music/view/adapter/ViewAdapter;-><init>(Lcom/vkontakte/android/functions/F1;I)V

    return-object v0
.end method

.method static createLoaderAdapter(Landroid/view/LayoutInflater;)Lcom/vk/music/view/adapter/ViewAdapter;
    .locals 3
    .param p0, "inflater"    # Landroid/view/LayoutInflater;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 70
    new-instance v0, Lcom/vk/music/view/adapter/ViewAdapter;

    const v1, 0x7f030138

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lcom/vk/music/view/adapter/ViewAdapter;-><init>(Landroid/view/LayoutInflater;II)V

    return-object v0
.end method

.method static createLoadingFooterAdapter(Landroid/view/LayoutInflater;I)Lcom/vk/music/view/adapter/ViewAdapter;
    .locals 2
    .param p0, "inflater"    # Landroid/view/LayoutInflater;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "viewType"    # I
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 41
    new-instance v0, Lcom/vk/music/view/adapter/ViewAdapter;

    const v1, 0x7f030132

    invoke-direct {v0, p0, v1, p1}, Lcom/vk/music/view/adapter/ViewAdapter;-><init>(Landroid/view/LayoutInflater;II)V

    return-object v0
.end method

.method static createMusicAdapter(Landroid/view/LayoutInflater;Lcom/vk/music/attach/controller/Controller$HostController;I)Lcom/vk/music/view/adapter/ItemAdapter;
    .locals 3
    .param p0, "inflater"    # Landroid/view/LayoutInflater;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "hostController"    # Lcom/vk/music/attach/controller/Controller$HostController;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "viewType"    # I
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/LayoutInflater;",
            "Lcom/vk/music/attach/controller/Controller$HostController;",
            "I)",
            "Lcom/vk/music/view/adapter/ItemAdapter",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;"
        }
    .end annotation

    .prologue
    .line 22
    new-instance v0, Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    invoke-direct {v0, p0}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;-><init>(Landroid/view/LayoutInflater;)V

    const v1, 0x7f030127

    .line 23
    invoke-virtual {v0, v1}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->layout(I)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v0

    invoke-static {}, Lcom/vk/music/attach/controller/AdapterHelper$$Lambda$1;->lambdaFactory$()Lcom/vk/music/view/adapter/ItemViewHolder$Builder$Init;

    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->init(Lcom/vk/music/view/adapter/ItemViewHolder$Builder$Init;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v0

    new-instance v1, Lcom/vk/music/view/adapter/SelectableMusicBinder;

    .line 25
    invoke-interface {p1}, Lcom/vk/music/attach/controller/Controller$HostController;->getAttachedTracks()Ljava/util/Collection;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/vk/music/view/adapter/SelectableMusicBinder;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0, v1}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->binder(Lcom/vk/music/view/adapter/ItemViewHolder$Binder;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v0

    invoke-static {p1}, Lcom/vk/music/attach/controller/AdapterHelper$$Lambda$2;->lambdaFactory$(Lcom/vk/music/attach/controller/Controller$HostController;)Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener;

    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->registerClickListener(Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v0

    .line 34
    invoke-virtual {v0, p2}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->viewType(I)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v0

    invoke-static {}, Lcom/vk/music/attach/controller/AdapterHelper$$Lambda$3;->lambdaFactory$()Lcom/vk/music/view/adapter/IdResolver;

    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->resolver(Lcom/vk/music/view/adapter/IdResolver;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v0

    .line 36
    invoke-virtual {v0}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->build()Lcom/vk/music/view/adapter/ItemAdapter;

    move-result-object v0

    return-object v0
.end method

.method static synthetic lambda$createEmptyAdapter$4(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3
    .param p0, "inflater"    # Landroid/view/LayoutInflater;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "viewGroup"    # Landroid/view/ViewGroup;

    .prologue
    .line 60
    const v1, 0x7f030025

    const/4 v2, 0x0

    invoke-virtual {p0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 61
    .local v0, "view":Landroid/view/View;
    const v1, 0x7f10019e

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    const v2, 0x7f0803c9

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 62
    return-object v0
.end method

.method static synthetic lambda$createErrorAdapter$3(Landroid/view/LayoutInflater;Lcom/vkontakte/android/functions/VoidF;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3
    .param p0, "inflater"    # Landroid/view/LayoutInflater;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "onRetryClick"    # Lcom/vkontakte/android/functions/VoidF;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "viewGroup"    # Landroid/view/ViewGroup;

    .prologue
    .line 48
    const v1, 0x7f030026

    const/4 v2, 0x0

    invoke-virtual {p0, v1, p2, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 49
    .local v0, "view":Landroid/view/View;
    const v1, 0x7f1001a2

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-static {p1}, Lcom/vk/music/attach/controller/AdapterHelper$$Lambda$6;->lambdaFactory$(Lcom/vkontakte/android/functions/VoidF;)Landroid/view/View$OnClickListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 50
    return-object v0
.end method

.method static synthetic lambda$createMusicAdapter$0(Landroid/view/View;)V
    .locals 1
    .param p0, "itemView"    # Landroid/view/View;

    .prologue
    .line 24
    const v0, 0x7f1003c1

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic lambda$createMusicAdapter$1(Lcom/vk/music/attach/controller/Controller$HostController;Landroid/view/View;Lcom/vkontakte/android/audio/MusicTrack;I)V
    .locals 2
    .param p0, "hostController"    # Lcom/vk/music/attach/controller/Controller$HostController;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "v"    # Landroid/view/View;
    .param p2, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;
    .param p3, "position"    # I

    .prologue
    .line 27
    invoke-interface {p0, p2}, Lcom/vk/music/attach/controller/Controller$HostController;->tryToggleAttached(Lcom/vkontakte/android/audio/MusicTrack;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 28
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 29
    .local v0, "clickReceiver":Landroid/view/View;
    if-eqz v0, :cond_0

    .line 30
    invoke-virtual {v0}, Landroid/view/View;->performClick()Z

    .line 33
    .end local v0    # "clickReceiver":Landroid/view/View;
    :cond_0
    return-void
.end method

.method static synthetic lambda$null$2(Lcom/vkontakte/android/functions/VoidF;Landroid/view/View;)V
    .locals 0
    .param p0, "onRetryClick"    # Lcom/vkontakte/android/functions/VoidF;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 49
    invoke-interface {p0}, Lcom/vkontakte/android/functions/VoidF;->f()V

    return-void
.end method
