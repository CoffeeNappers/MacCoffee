.class final Lcom/vk/music/view/MusicContainer$UserListener;
.super Ljava/lang/Object;
.source "MusicContainer.java"

# interfaces
.implements Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;
.implements Landroid/view/View$OnClickListener;
.implements Landroid/support/v4/widget/SwipeRefreshLayout$OnRefreshListener;
.implements Lcom/vk/music/view/LastReachedScrollListener$OnLastReachedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/view/MusicContainer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "UserListener"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback",
        "<",
        "Lcom/vkontakte/android/audio/MusicTrack;",
        ">;",
        "Landroid/view/View$OnClickListener;",
        "Landroid/support/v4/widget/SwipeRefreshLayout$OnRefreshListener;",
        "Lcom/vk/music/view/LastReachedScrollListener$OnLastReachedListener;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/music/view/MusicContainer;


# direct methods
.method private constructor <init>(Lcom/vk/music/view/MusicContainer;)V
    .locals 0

    .prologue
    .line 83
    iput-object p1, p0, Lcom/vk/music/view/MusicContainer$UserListener;->this$0:Lcom/vk/music/view/MusicContainer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vk/music/view/MusicContainer;Lcom/vk/music/view/MusicContainer$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vk/music/view/MusicContainer;
    .param p2, "x1"    # Lcom/vk/music/view/MusicContainer$1;

    .prologue
    .line 83
    invoke-direct {p0, p1}, Lcom/vk/music/view/MusicContainer$UserListener;-><init>(Lcom/vk/music/view/MusicContainer;)V

    return-void
.end method

.method static synthetic lambda$onActionClick$1(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p0, "dialog"    # Landroid/content/DialogInterface;
    .param p1, "which"    # I

    .prologue
    .line 104
    invoke-interface {p0}, Landroid/content/DialogInterface;->dismiss()V

    return-void
.end method


# virtual methods
.method synthetic lambda$onActionClick$0(Lcom/vkontakte/android/audio/MusicTrack;Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "dialog"    # Landroid/content/DialogInterface;
    .param p3, "which"    # I

    .prologue
    .line 102
    iget-object v0, p0, Lcom/vk/music/view/MusicContainer$UserListener;->this$0:Lcom/vk/music/view/MusicContainer;

    iget-object v0, v0, Lcom/vk/music/view/MusicContainer;->model:Lcom/vk/music/model/MusicModel;

    invoke-interface {v0}, Lcom/vk/music/model/MusicModel;->getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, p1, v1}, Lcom/vk/music/model/MusicTrackModel;->removeAudio(Lcom/vkontakte/android/audio/MusicTrack;Lcom/vk/music/dto/Playlist;)V

    .line 103
    return-void
.end method

.method public onActionClick(Lcom/vkontakte/android/audio/MusicTrack;I)V
    .locals 3
    .param p1, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "actionId"    # I

    .prologue
    .line 90
    packed-switch p2, :pswitch_data_0

    .line 134
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 92
    :pswitch_1
    iget-object v1, p0, Lcom/vk/music/view/MusicContainer$UserListener;->this$0:Lcom/vk/music/view/MusicContainer;

    iget-object v1, v1, Lcom/vk/music/view/MusicContainer;->model:Lcom/vk/music/model/MusicModel;

    invoke-interface {v1}, Lcom/vk/music/model/MusicModel;->getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;

    move-result-object v1

    invoke-interface {v1, p1}, Lcom/vk/music/model/MusicTrackModel;->canAddAudio(Lcom/vkontakte/android/audio/MusicTrack;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 93
    iget-object v1, p0, Lcom/vk/music/view/MusicContainer$UserListener;->this$0:Lcom/vk/music/view/MusicContainer;

    iget-object v1, v1, Lcom/vk/music/view/MusicContainer;->model:Lcom/vk/music/model/MusicModel;

    invoke-interface {v1}, Lcom/vk/music/model/MusicModel;->getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v1, p1, v2}, Lcom/vk/music/model/MusicTrackModel;->addAudio(Lcom/vkontakte/android/audio/MusicTrack;Lcom/vk/music/dto/Playlist;)V

    goto :goto_0

    .line 97
    :pswitch_2
    iget-object v1, p0, Lcom/vk/music/view/MusicContainer$UserListener;->this$0:Lcom/vk/music/view/MusicContainer;

    iget-object v1, v1, Lcom/vk/music/view/MusicContainer;->model:Lcom/vk/music/model/MusicModel;

    invoke-interface {v1}, Lcom/vk/music/model/MusicModel;->getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;

    move-result-object v1

    invoke-interface {v1, p1}, Lcom/vk/music/model/MusicTrackModel;->canRemoveAudio(Lcom/vkontakte/android/audio/MusicTrack;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 98
    new-instance v0, Lcom/vkontakte/android/VKAlertDialog$Builder;

    iget-object v1, p0, Lcom/vk/music/view/MusicContainer$UserListener;->this$0:Lcom/vk/music/view/MusicContainer;

    invoke-virtual {v1}, Lcom/vk/music/view/MusicContainer;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 99
    .local v0, "builder":Lcom/vkontakte/android/VKAlertDialog$Builder;
    const v1, 0x7f080176

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 100
    const v1, 0x7f08039f

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    .line 101
    const v1, 0x7f0804f4

    invoke-static {p0, p1}, Lcom/vk/music/view/MusicContainer$UserListener$$Lambda$1;->lambdaFactory$(Lcom/vk/music/view/MusicContainer$UserListener;Lcom/vkontakte/android/audio/MusicTrack;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 104
    const v1, 0x7f0804d6

    invoke-static {}, Lcom/vk/music/view/MusicContainer$UserListener$$Lambda$2;->lambdaFactory$()Landroid/content/DialogInterface$OnClickListener;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 105
    invoke-virtual {v0}, Lcom/vkontakte/android/VKAlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0

    .line 109
    .end local v0    # "builder":Lcom/vkontakte/android/VKAlertDialog$Builder;
    :pswitch_3
    iget-object v1, p0, Lcom/vk/music/view/MusicContainer$UserListener;->this$0:Lcom/vk/music/view/MusicContainer;

    iget-object v1, v1, Lcom/vk/music/view/MusicContainer;->model:Lcom/vk/music/model/MusicModel;

    invoke-interface {v1}, Lcom/vk/music/model/MusicModel;->getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;

    move-result-object v1

    invoke-interface {v1, p1}, Lcom/vk/music/model/MusicTrackModel;->isDownloaded(Lcom/vkontakte/android/audio/MusicTrack;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 110
    iget-object v1, p0, Lcom/vk/music/view/MusicContainer$UserListener;->this$0:Lcom/vk/music/view/MusicContainer;

    iget-object v1, v1, Lcom/vk/music/view/MusicContainer;->model:Lcom/vk/music/model/MusicModel;

    invoke-interface {v1}, Lcom/vk/music/model/MusicModel;->getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/music/view/MusicContainer$UserListener;->this$0:Lcom/vk/music/view/MusicContainer;

    invoke-virtual {v2}, Lcom/vk/music/view/MusicContainer;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-interface {v1, p1, v2}, Lcom/vk/music/model/MusicTrackModel;->download(Lcom/vkontakte/android/audio/MusicTrack;Landroid/content/Context;)V

    goto :goto_0

    .line 112
    :cond_1
    iget-object v1, p0, Lcom/vk/music/view/MusicContainer$UserListener;->this$0:Lcom/vk/music/view/MusicContainer;

    iget-object v1, v1, Lcom/vk/music/view/MusicContainer;->model:Lcom/vk/music/model/MusicModel;

    invoke-interface {v1}, Lcom/vk/music/model/MusicModel;->getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;

    move-result-object v1

    invoke-interface {v1, p1}, Lcom/vk/music/model/MusicTrackModel;->clearDownloaded(Lcom/vkontakte/android/audio/MusicTrack;)V

    goto/16 :goto_0

    .line 116
    :pswitch_4
    iget-object v1, p0, Lcom/vk/music/view/MusicContainer$UserListener;->this$0:Lcom/vk/music/view/MusicContainer;

    iget-object v1, v1, Lcom/vk/music/view/MusicContainer;->activity:Landroid/app/Activity;

    invoke-static {v1}, Lcom/vk/sharing/Sharing;->from(Landroid/content/Context;)Lcom/vk/sharing/Sharing$Builder;

    move-result-object v1

    const-string/jumbo v2, "music"

    .line 117
    invoke-static {p1, v2}, Lcom/vk/sharing/attachment/Attachments;->createInfo(Lcom/vkontakte/android/audio/MusicTrack;Ljava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vk/sharing/Sharing$Builder;->withAttachment(Lcom/vk/sharing/attachment/AttachmentInfo;)Lcom/vk/sharing/Sharing$Builder;

    move-result-object v1

    .line 118
    invoke-static {p1}, Lcom/vk/sharing/action/Actions;->createInfo(Lcom/vkontakte/android/audio/MusicTrack;)Lcom/vk/sharing/action/ActionsInfo;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vk/sharing/Sharing$Builder;->withActions(Lcom/vk/sharing/action/ActionsInfo;)Lcom/vk/sharing/Sharing$Builder;

    move-result-object v1

    .line 119
    invoke-virtual {v1}, Lcom/vk/sharing/Sharing$Builder;->share()V

    goto/16 :goto_0

    .line 122
    :pswitch_5
    iget-object v1, p0, Lcom/vk/music/view/MusicContainer$UserListener;->this$0:Lcom/vk/music/view/MusicContainer;

    iget-object v1, v1, Lcom/vk/music/view/MusicContainer;->model:Lcom/vk/music/model/MusicModel;

    invoke-interface {v1}, Lcom/vk/music/model/MusicModel;->getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;

    move-result-object v1

    invoke-interface {v1, p1}, Lcom/vk/music/model/MusicTrackModel;->setTarget(Lcom/vkontakte/android/audio/MusicTrack;)V

    .line 123
    iget-object v1, p0, Lcom/vk/music/view/MusicContainer$UserListener;->this$0:Lcom/vk/music/view/MusicContainer;

    iget-object v1, v1, Lcom/vk/music/view/MusicContainer;->host:Lcom/vk/music/view/MusicContainer$Host;

    if-eqz v1, :cond_0

    .line 124
    iget-object v1, p0, Lcom/vk/music/view/MusicContainer$UserListener;->this$0:Lcom/vk/music/view/MusicContainer;

    iget-object v1, v1, Lcom/vk/music/view/MusicContainer;->host:Lcom/vk/music/view/MusicContainer$Host;

    invoke-interface {v1}, Lcom/vk/music/view/MusicContainer$Host;->requestPlaylist()V

    goto/16 :goto_0

    .line 128
    :pswitch_6
    iget-object v1, p0, Lcom/vk/music/view/MusicContainer$UserListener;->this$0:Lcom/vk/music/view/MusicContainer;

    iget-object v1, v1, Lcom/vk/music/view/MusicContainer;->model:Lcom/vk/music/model/MusicModel;

    invoke-interface {v1}, Lcom/vk/music/model/MusicModel;->getPlayerModel()Lcom/vk/music/model/PlayerModel;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/music/view/MusicContainer$UserListener;->this$0:Lcom/vk/music/view/MusicContainer;

    invoke-virtual {v2}, Lcom/vk/music/view/MusicContainer;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-interface {v1, v2, p1}, Lcom/vk/music/model/PlayerModel;->addToPlayNext(Landroid/content/Context;Lcom/vkontakte/android/audio/MusicTrack;)V

    goto/16 :goto_0

    .line 131
    :pswitch_7
    iget-object v1, p0, Lcom/vk/music/view/MusicContainer$UserListener;->this$0:Lcom/vk/music/view/MusicContainer;

    iget-object v1, v1, Lcom/vk/music/view/MusicContainer;->model:Lcom/vk/music/model/MusicModel;

    invoke-interface {v1}, Lcom/vk/music/model/MusicModel;->getPlayerModel()Lcom/vk/music/model/PlayerModel;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/music/view/MusicContainer$UserListener;->this$0:Lcom/vk/music/view/MusicContainer;

    invoke-virtual {v2}, Lcom/vk/music/view/MusicContainer;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-interface {v1, v2, p1}, Lcom/vk/music/model/PlayerModel;->loadAndPlayTheSame(Landroid/content/Context;Lcom/vkontakte/android/audio/MusicTrack;)V

    goto/16 :goto_0

    .line 90
    nop

    :pswitch_data_0
    .packed-switch 0x7f10005e
        :pswitch_1
        :pswitch_5
        :pswitch_0
        :pswitch_6
        :pswitch_7
        :pswitch_2
        :pswitch_4
        :pswitch_3
    .end packed-switch
.end method

.method public bridge synthetic onActionClick(Ljava/lang/Object;I)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 83
    check-cast p1, Lcom/vkontakte/android/audio/MusicTrack;

    invoke-virtual {p0, p1, p2}, Lcom/vk/music/view/MusicContainer$UserListener;->onActionClick(Lcom/vkontakte/android/audio/MusicTrack;I)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 138
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    .line 153
    :goto_0
    return-void

    .line 140
    :sswitch_0
    new-instance v0, Lcom/vk/music/fragment/PlaylistsFragment$Builder;

    invoke-direct {v0}, Lcom/vk/music/fragment/PlaylistsFragment$Builder;-><init>()V

    iget-object v1, p0, Lcom/vk/music/view/MusicContainer$UserListener;->this$0:Lcom/vk/music/view/MusicContainer;

    iget-object v1, v1, Lcom/vk/music/view/MusicContainer;->model:Lcom/vk/music/model/MusicModel;

    invoke-interface {v1}, Lcom/vk/music/model/MusicModel;->getOwnerId()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vk/music/fragment/PlaylistsFragment$Builder;->ownerId(I)Lcom/vk/music/fragment/PlaylistsFragment$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/music/view/MusicContainer$UserListener;->this$0:Lcom/vk/music/view/MusicContainer;

    iget-object v1, v1, Lcom/vk/music/view/MusicContainer;->activity:Landroid/app/Activity;

    invoke-virtual {v0, v1}, Lcom/vk/music/fragment/PlaylistsFragment$Builder;->go(Landroid/content/Context;)Z

    goto :goto_0

    .line 143
    :sswitch_1
    new-instance v0, Lcom/vk/music/fragment/EditPlaylistFragment$Builder;

    invoke-direct {v0}, Lcom/vk/music/fragment/EditPlaylistFragment$Builder;-><init>()V

    iget-object v1, p0, Lcom/vk/music/view/MusicContainer$UserListener;->this$0:Lcom/vk/music/view/MusicContainer;

    iget-object v1, v1, Lcom/vk/music/view/MusicContainer;->activity:Landroid/app/Activity;

    invoke-virtual {v0, v1}, Lcom/vk/music/fragment/EditPlaylistFragment$Builder;->go(Landroid/content/Context;)Z

    goto :goto_0

    .line 146
    :sswitch_2
    iget-object v0, p0, Lcom/vk/music/view/MusicContainer$UserListener;->this$0:Lcom/vk/music/view/MusicContainer;

    iget-object v0, v0, Lcom/vk/music/view/MusicContainer;->model:Lcom/vk/music/model/MusicModel;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/vk/music/model/MusicModel;->loadAndPlayShuffleAll(Landroid/content/Context;)V

    goto :goto_0

    .line 149
    :sswitch_3
    iget-object v0, p0, Lcom/vk/music/view/MusicContainer$UserListener;->this$0:Lcom/vk/music/view/MusicContainer;

    invoke-virtual {v0}, Lcom/vk/music/view/MusicContainer;->onErrorRetryClick()V

    goto :goto_0

    .line 138
    :sswitch_data_0
    .sparse-switch
        0x7f1001a2 -> :sswitch_3
        0x7f1003d0 -> :sswitch_1
        0x7f1003d4 -> :sswitch_0
        0x7f1003d5 -> :sswitch_2
    .end sparse-switch
.end method

.method public onClick(Lcom/vk/music/dto/Playlist;)V
    .locals 2
    .param p1, "playlist"    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 168
    new-instance v0, Lcom/vk/music/fragment/PlaylistFragment$Builder;

    iget-object v1, p0, Lcom/vk/music/view/MusicContainer$UserListener;->this$0:Lcom/vk/music/view/MusicContainer;

    iget-object v1, v1, Lcom/vk/music/view/MusicContainer;->model:Lcom/vk/music/model/MusicModel;

    invoke-interface {v1, p1}, Lcom/vk/music/model/MusicModel;->getOriginalPlaylist(Lcom/vk/music/dto/Playlist;)Lcom/vk/music/dto/Playlist;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vk/music/fragment/PlaylistFragment$Builder;-><init>(Lcom/vk/music/dto/Playlist;)V

    iget-object v1, p0, Lcom/vk/music/view/MusicContainer$UserListener;->this$0:Lcom/vk/music/view/MusicContainer;

    iget-object v1, v1, Lcom/vk/music/view/MusicContainer;->activity:Landroid/app/Activity;

    invoke-virtual {v0, v1}, Lcom/vk/music/fragment/PlaylistFragment$Builder;->go(Landroid/content/Context;)Z

    .line 169
    return-void
.end method

.method public onClick(Lcom/vkontakte/android/audio/MusicTrack;)V
    .locals 2
    .param p1, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 172
    iget-object v0, p0, Lcom/vk/music/view/MusicContainer$UserListener;->this$0:Lcom/vk/music/view/MusicContainer;

    iget-object v0, v0, Lcom/vk/music/view/MusicContainer;->model:Lcom/vk/music/model/MusicModel;

    invoke-interface {v0}, Lcom/vk/music/model/MusicModel;->getPlayerModel()Lcom/vk/music/model/PlayerModel;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/music/view/MusicContainer$UserListener;->this$0:Lcom/vk/music/view/MusicContainer;

    iget-object v1, v1, Lcom/vk/music/view/MusicContainer;->model:Lcom/vk/music/model/MusicModel;

    invoke-interface {v1}, Lcom/vk/music/model/MusicModel;->getMusicTracks()Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Lcom/vk/music/model/PlayerModel;->togglePlayer(Lcom/vkontakte/android/audio/MusicTrack;Ljava/util/List;)V

    .line 173
    return-void
.end method

.method public onLastReached()V
    .locals 1

    .prologue
    .line 162
    iget-object v0, p0, Lcom/vk/music/view/MusicContainer$UserListener;->this$0:Lcom/vk/music/view/MusicContainer;

    iget-object v0, v0, Lcom/vk/music/view/MusicContainer;->model:Lcom/vk/music/model/MusicModel;

    invoke-interface {v0}, Lcom/vk/music/model/MusicModel;->canLoadMoreAudio()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 163
    iget-object v0, p0, Lcom/vk/music/view/MusicContainer$UserListener;->this$0:Lcom/vk/music/view/MusicContainer;

    iget-object v0, v0, Lcom/vk/music/view/MusicContainer;->model:Lcom/vk/music/model/MusicModel;

    invoke-interface {v0}, Lcom/vk/music/model/MusicModel;->loadMoreAudio()V

    .line 165
    :cond_0
    return-void
.end method

.method onMenuClick(Lcom/vkontakte/android/audio/MusicTrack;)V
    .locals 3
    .param p1, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 176
    new-instance v0, Lcom/vk/music/fragment/menu/AudioActionsBottomSheet$Builder;

    iget-object v1, p0, Lcom/vk/music/view/MusicContainer$UserListener;->this$0:Lcom/vk/music/view/MusicContainer;

    iget-object v1, v1, Lcom/vk/music/view/MusicContainer;->model:Lcom/vk/music/model/MusicModel;

    .line 177
    invoke-interface {v1}, Lcom/vk/music/model/MusicModel;->getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;

    move-result-object v1

    invoke-interface {v1, p1}, Lcom/vk/music/model/MusicTrackModel;->canAddAudio(Lcom/vkontakte/android/audio/MusicTrack;)Z

    move-result v1

    iget-object v2, p0, Lcom/vk/music/view/MusicContainer$UserListener;->this$0:Lcom/vk/music/view/MusicContainer;

    iget-object v2, v2, Lcom/vk/music/view/MusicContainer;->model:Lcom/vk/music/model/MusicModel;

    .line 178
    invoke-interface {v2}, Lcom/vk/music/model/MusicModel;->getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;

    move-result-object v2

    invoke-interface {v2, p1}, Lcom/vk/music/model/MusicTrackModel;->canRemoveAudio(Lcom/vkontakte/android/audio/MusicTrack;)Z

    move-result v2

    invoke-direct {v0, p1, p0, v1, v2}, Lcom/vk/music/fragment/menu/AudioActionsBottomSheet$Builder;-><init>(Lcom/vkontakte/android/audio/MusicTrack;Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;ZZ)V

    iget-object v1, p0, Lcom/vk/music/view/MusicContainer$UserListener;->this$0:Lcom/vk/music/view/MusicContainer;

    iget-object v1, v1, Lcom/vk/music/view/MusicContainer;->activity:Landroid/app/Activity;

    .line 179
    invoke-virtual {v0, v1}, Lcom/vk/music/fragment/menu/AudioActionsBottomSheet$Builder;->show(Landroid/app/Activity;)V

    .line 180
    return-void
.end method

.method public onRefresh()V
    .locals 1

    .prologue
    .line 157
    iget-object v0, p0, Lcom/vk/music/view/MusicContainer$UserListener;->this$0:Lcom/vk/music/view/MusicContainer;

    iget-object v0, v0, Lcom/vk/music/view/MusicContainer;->model:Lcom/vk/music/model/MusicModel;

    invoke-interface {v0}, Lcom/vk/music/model/MusicModel;->loadPage()V

    .line 158
    return-void
.end method
