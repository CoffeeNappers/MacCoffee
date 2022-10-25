.class public final Lcom/vk/music/view/ToolbarMusicContainer;
.super Landroid/widget/FrameLayout;
.source "ToolbarMusicContainer.java"

# interfaces
.implements Lcom/vk/music/model/MusicModel$Callback;
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "ViewConstructor"
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/music/view/ToolbarMusicContainer$UserListener;
    }
.end annotation


# static fields
.field public static final REQUEST_CODE_GET_PLAYLIST:I = 0xa


# instance fields
.field final activity:Landroid/app/Activity;

.field imageView:Lcom/vk/imageloader/view/VKImageView;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field final lifecycleHandler:Lcom/vk/core/widget/LifecycleHandler;

.field final model:Lcom/vk/music/model/MusicModel;

.field musicContainer:Lcom/vk/music/view/MusicContainer;

.field titleView:Landroid/widget/TextView;

.field final userListener:Lcom/vk/music/view/ToolbarMusicContainer$UserListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/vk/music/model/MusicModel;)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "model"    # Lcom/vk/music/model/MusicModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v6, -0x1

    .line 79
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 80
    invoke-static {p1}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v4

    iput-object v4, p0, Lcom/vk/music/view/ToolbarMusicContainer;->activity:Landroid/app/Activity;

    .line 81
    iput-object p2, p0, Lcom/vk/music/view/ToolbarMusicContainer;->model:Lcom/vk/music/model/MusicModel;

    .line 82
    new-instance v4, Lcom/vk/music/view/ToolbarMusicContainer$UserListener;

    invoke-direct {v4, p0}, Lcom/vk/music/view/ToolbarMusicContainer$UserListener;-><init>(Lcom/vk/music/view/ToolbarMusicContainer;)V

    iput-object v4, p0, Lcom/vk/music/view/ToolbarMusicContainer;->userListener:Lcom/vk/music/view/ToolbarMusicContainer$UserListener;

    .line 84
    iget-object v4, p0, Lcom/vk/music/view/ToolbarMusicContainer;->activity:Landroid/app/Activity;

    invoke-static {v4}, Lcom/vk/core/widget/LifecycleHandler;->install(Landroid/app/Activity;)Lcom/vk/core/widget/LifecycleHandler;

    move-result-object v4

    iput-object v4, p0, Lcom/vk/music/view/ToolbarMusicContainer;->lifecycleHandler:Lcom/vk/core/widget/LifecycleHandler;

    .line 85
    iget-object v4, p0, Lcom/vk/music/view/ToolbarMusicContainer;->lifecycleHandler:Lcom/vk/core/widget/LifecycleHandler;

    iget-object v5, p0, Lcom/vk/music/view/ToolbarMusicContainer;->userListener:Lcom/vk/music/view/ToolbarMusicContainer$UserListener;

    invoke-virtual {v4, v5}, Lcom/vk/core/widget/LifecycleHandler;->setLifecycleListener(Lcom/vk/core/widget/LifecycleListener;)V

    .line 87
    invoke-interface {p2}, Lcom/vk/music/model/MusicModel;->hasIcon()Z

    move-result v4

    if-eqz v4, :cond_2

    const v4, 0x7f030158

    :goto_0
    invoke-static {p1, v4, p0}, Lcom/vk/music/view/ToolbarMusicContainer;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 91
    const v4, 0x7f1003d8

    invoke-virtual {p0, v4}, Lcom/vk/music/view/ToolbarMusicContainer;->findViewById(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 92
    const v4, 0x7f1003f9

    invoke-virtual {p0, v4}, Lcom/vk/music/view/ToolbarMusicContainer;->findViewById(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 94
    const v4, 0x7f100128

    invoke-virtual {p0, v4}, Lcom/vk/music/view/ToolbarMusicContainer;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, p0, Lcom/vk/music/view/ToolbarMusicContainer;->titleView:Landroid/widget/TextView;

    .line 95
    const v4, 0x1020006

    invoke-virtual {p0, v4}, Lcom/vk/music/view/ToolbarMusicContainer;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/vk/imageloader/view/VKImageView;

    iput-object v4, p0, Lcom/vk/music/view/ToolbarMusicContainer;->imageView:Lcom/vk/imageloader/view/VKImageView;

    .line 97
    const v4, 0x7f10019c

    invoke-virtual {p0, v4}, Lcom/vk/music/view/ToolbarMusicContainer;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 98
    .local v3, "subtitleView":Landroid/widget/TextView;
    invoke-interface {p2}, Lcom/vk/music/model/MusicModel;->getOwnerId()I

    move-result v4

    if-gez v4, :cond_3

    invoke-virtual {p0}, Lcom/vk/music/view/ToolbarMusicContainer;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0803fe

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    :goto_1
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 100
    const v4, 0x7f1003fa

    invoke-virtual {p0, v4}, Lcom/vk/music/view/ToolbarMusicContainer;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 102
    .local v0, "headerViewGroup":Landroid/view/ViewGroup;
    invoke-static {p2}, Lcom/vk/music/view/ToolbarMusicContainer$$Lambda$1;->lambdaFactory$(Lcom/vk/music/model/MusicModel;)Landroid/view/View$OnClickListener;

    move-result-object v1

    .line 107
    .local v1, "listener":Landroid/view/View$OnClickListener;
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 109
    iget-object v4, p0, Lcom/vk/music/view/ToolbarMusicContainer;->imageView:Lcom/vk/imageloader/view/VKImageView;

    if-eqz v4, :cond_0

    .line 110
    iget-object v4, p0, Lcom/vk/music/view/ToolbarMusicContainer;->imageView:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v4, v1}, Lcom/vk/imageloader/view/VKImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 113
    :cond_0
    invoke-direct {p0, p2}, Lcom/vk/music/view/ToolbarMusicContainer;->fillNameAndImage(Lcom/vk/music/model/MusicModel;)V

    .line 115
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v2, v6, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 116
    .local v2, "params":Landroid/widget/FrameLayout$LayoutParams;
    const v4, 0x7f1001b0

    invoke-virtual {p0, v4}, Lcom/vk/music/view/ToolbarMusicContainer;->findViewById(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/View;->getMinimumHeight()I

    move-result v4

    iput v4, v2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 117
    new-instance v4, Lcom/vk/music/view/MusicContainer;

    invoke-direct {v4, p1, p2}, Lcom/vk/music/view/MusicContainer;-><init>(Landroid/content/Context;Lcom/vk/music/model/MusicModel;)V

    iput-object v4, p0, Lcom/vk/music/view/ToolbarMusicContainer;->musicContainer:Lcom/vk/music/view/MusicContainer;

    .line 118
    iget-object v4, p0, Lcom/vk/music/view/ToolbarMusicContainer;->musicContainer:Lcom/vk/music/view/MusicContainer;

    invoke-static {p0}, Lcom/vk/music/view/ToolbarMusicContainer$$Lambda$2;->lambdaFactory$(Lcom/vk/music/view/ToolbarMusicContainer;)Lcom/vk/music/view/MusicContainer$Host;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/vk/music/view/MusicContainer;->setHost(Lcom/vk/music/view/MusicContainer$Host;)V

    .line 123
    iget-object v4, p0, Lcom/vk/music/view/ToolbarMusicContainer;->musicContainer:Lcom/vk/music/view/MusicContainer;

    invoke-virtual {p0, v4, v2}, Lcom/vk/music/view/ToolbarMusicContainer;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 125
    invoke-interface {p2}, Lcom/vk/music/model/MusicModel;->isNeedLoadTitle()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 126
    invoke-interface {p2, p0}, Lcom/vk/music/model/MusicModel;->subscribe(Lcom/vk/music/model/MusicModel$Callback;)V

    .line 128
    :cond_1
    return-void

    .line 87
    .end local v0    # "headerViewGroup":Landroid/view/ViewGroup;
    .end local v1    # "listener":Landroid/view/View$OnClickListener;
    .end local v2    # "params":Landroid/widget/FrameLayout$LayoutParams;
    .end local v3    # "subtitleView":Landroid/widget/TextView;
    :cond_2
    const v4, 0x7f030157

    goto/16 :goto_0

    .line 98
    .restart local v3    # "subtitleView":Landroid/widget/TextView;
    :cond_3
    invoke-virtual {p0}, Lcom/vk/music/view/ToolbarMusicContainer;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f08039c

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    goto :goto_1
.end method

.method private fillNameAndImage(Lcom/vk/music/model/MusicModel;)V
    .locals 3
    .param p1, "model"    # Lcom/vk/music/model/MusicModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 136
    invoke-virtual {p0}, Lcom/vk/music/view/ToolbarMusicContainer;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-interface {p1, v2}, Lcom/vk/music/model/MusicModel;->getTitle(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 137
    .local v1, "ownerName":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 138
    iget-object v2, p0, Lcom/vk/music/view/ToolbarMusicContainer;->titleView:Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 140
    :cond_0
    invoke-interface {p1}, Lcom/vk/music/model/MusicModel;->hasIcon()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 141
    invoke-interface {p1}, Lcom/vk/music/model/MusicModel;->getIcon()Ljava/lang/String;

    move-result-object v0

    .line 142
    .local v0, "ownerImage":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    iget-object v2, p0, Lcom/vk/music/view/ToolbarMusicContainer;->imageView:Lcom/vk/imageloader/view/VKImageView;

    if-eqz v2, :cond_1

    .line 143
    iget-object v2, p0, Lcom/vk/music/view/ToolbarMusicContainer;->imageView:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v2, v0}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 146
    .end local v0    # "ownerImage":Ljava/lang/String;
    :cond_1
    return-void
.end method

.method static synthetic lambda$new$0(Lcom/vk/music/model/MusicModel;Landroid/view/View;)V
    .locals 2
    .param p0, "model"    # Lcom/vk/music/model/MusicModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 103
    invoke-interface {p0}, Lcom/vk/music/model/MusicModel;->getOwnerId()I

    move-result v0

    if-eqz v0, :cond_0

    .line 104
    new-instance v0, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;

    invoke-interface {p0}, Lcom/vk/music/model/MusicModel;->getOwnerId()I

    move-result v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;-><init>(I)V

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;->go(Landroid/content/Context;)Z

    .line 106
    :cond_0
    return-void
.end method


# virtual methods
.method synthetic lambda$new$1()V
    .locals 4

    .prologue
    .line 118
    iget-object v0, p0, Lcom/vk/music/view/ToolbarMusicContainer;->lifecycleHandler:Lcom/vk/core/widget/LifecycleHandler;

    iget-object v1, p0, Lcom/vk/music/view/ToolbarMusicContainer;->userListener:Lcom/vk/music/view/ToolbarMusicContainer$UserListener;

    .line 119
    invoke-virtual {v1}, Lcom/vk/music/view/ToolbarMusicContainer$UserListener;->getUniqueId()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/vk/music/fragment/PlaylistsFragment$Builder;

    invoke-direct {v2}, Lcom/vk/music/fragment/PlaylistsFragment$Builder;-><init>()V

    const/4 v3, 0x1

    .line 120
    invoke-virtual {v2, v3}, Lcom/vk/music/fragment/PlaylistsFragment$Builder;->selectMy(Z)Lcom/vk/music/fragment/PlaylistsFragment$Builder;

    move-result-object v2

    iget-object v3, p0, Lcom/vk/music/view/ToolbarMusicContainer;->activity:Landroid/app/Activity;

    invoke-virtual {v2, v3}, Lcom/vk/music/fragment/PlaylistsFragment$Builder;->intent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v2

    const/16 v3, 0xa

    .line 118
    invoke-virtual {v0, v1, v2, v3}, Lcom/vk/core/widget/LifecycleHandler;->startActivityForResult(Ljava/lang/String;Landroid/content/Intent;I)V

    return-void
.end method

.method public onAudioLoadingDone(Lcom/vk/music/model/MusicModel;Ljava/util/List;)V
    .locals 0
    .param p1, "model"    # Lcom/vk/music/model/MusicModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vk/music/model/MusicModel;",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 152
    .local p2, "musicTracks":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/MusicTrack;>;"
    return-void
.end method

.method public onAudioLoadingError(Lcom/vk/music/model/MusicModel;Lme/grishka/appkit/api/ErrorResponse;)V
    .locals 0
    .param p1, "model"    # Lcom/vk/music/model/MusicModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "response"    # Lme/grishka/appkit/api/ErrorResponse;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 155
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 168
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 173
    :goto_0
    return-void

    .line 170
    :pswitch_0
    iget-object v0, p0, Lcom/vk/music/view/ToolbarMusicContainer;->activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    goto :goto_0

    .line 168
    :pswitch_data_0
    .packed-switch 0x7f1003d8
        :pswitch_0
    .end packed-switch
.end method

.method public onLoadingDone(Lcom/vk/music/model/MusicModel;)V
    .locals 0
    .param p1, "model"    # Lcom/vk/music/model/MusicModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 132
    invoke-direct {p0, p1}, Lcom/vk/music/view/ToolbarMusicContainer;->fillNameAndImage(Lcom/vk/music/model/MusicModel;)V

    .line 133
    return-void
.end method

.method public onLoadingError(Lcom/vk/music/model/MusicModel;Lme/grishka/appkit/api/ErrorResponse;)V
    .locals 0
    .param p1, "model"    # Lcom/vk/music/model/MusicModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "response"    # Lme/grishka/appkit/api/ErrorResponse;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 149
    return-void
.end method

.method public onPlaylistChanged(Lcom/vk/music/model/MusicModel;Lcom/vk/music/dto/Playlist;)V
    .locals 0
    .param p1, "model"    # Lcom/vk/music/model/MusicModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "playlist"    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 158
    return-void
.end method

.method public onPlaylistCreated(Lcom/vk/music/model/MusicModel;Lcom/vk/music/dto/Playlist;)V
    .locals 0
    .param p1, "model"    # Lcom/vk/music/model/MusicModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "playlist"    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 161
    return-void
.end method

.method public onPlaylistRemoved(Lcom/vk/music/model/MusicModel;Lcom/vk/music/dto/Playlist;)V
    .locals 0
    .param p1, "model"    # Lcom/vk/music/model/MusicModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "playlist"    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 164
    return-void
.end method
