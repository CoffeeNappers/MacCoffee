.class final Lcom/vk/music/view/SearchResultContainer$UserListener;
.super Ljava/lang/Object;
.source "SearchResultContainer.java"

# interfaces
.implements Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;
.implements Landroid/view/View$OnClickListener;
.implements Lcom/vk/music/view/LastReachedScrollListener$OnLastReachedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/view/SearchResultContainer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
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
        "Lcom/vk/music/view/LastReachedScrollListener$OnLastReachedListener;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/music/view/SearchResultContainer;


# direct methods
.method constructor <init>(Lcom/vk/music/view/SearchResultContainer;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/music/view/SearchResultContainer;

    .prologue
    .line 82
    iput-object p1, p0, Lcom/vk/music/view/SearchResultContainer$UserListener;->this$0:Lcom/vk/music/view/SearchResultContainer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic lambda$onActionClick$1(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p0, "dialog"    # Landroid/content/DialogInterface;
    .param p1, "which"    # I

    .prologue
    .line 100
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
    .line 98
    iget-object v0, p0, Lcom/vk/music/view/SearchResultContainer$UserListener;->this$0:Lcom/vk/music/view/SearchResultContainer;

    iget-object v0, v0, Lcom/vk/music/view/SearchResultContainer;->model:Lcom/vk/music/model/SearchResultModel;

    invoke-interface {v0}, Lcom/vk/music/model/SearchResultModel;->getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, p1, v1}, Lcom/vk/music/model/MusicTrackModel;->removeAudio(Lcom/vkontakte/android/audio/MusicTrack;Lcom/vk/music/dto/Playlist;)V

    .line 99
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
    .line 86
    packed-switch p2, :pswitch_data_0

    .line 130
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 88
    :pswitch_1
    iget-object v1, p0, Lcom/vk/music/view/SearchResultContainer$UserListener;->this$0:Lcom/vk/music/view/SearchResultContainer;

    iget-object v1, v1, Lcom/vk/music/view/SearchResultContainer;->model:Lcom/vk/music/model/SearchResultModel;

    invoke-interface {v1}, Lcom/vk/music/model/SearchResultModel;->getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;

    move-result-object v1

    invoke-interface {v1, p1}, Lcom/vk/music/model/MusicTrackModel;->canAddAudio(Lcom/vkontakte/android/audio/MusicTrack;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 89
    iget-object v1, p0, Lcom/vk/music/view/SearchResultContainer$UserListener;->this$0:Lcom/vk/music/view/SearchResultContainer;

    iget-object v1, v1, Lcom/vk/music/view/SearchResultContainer;->model:Lcom/vk/music/model/SearchResultModel;

    invoke-interface {v1}, Lcom/vk/music/model/SearchResultModel;->getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v1, p1, v2}, Lcom/vk/music/model/MusicTrackModel;->addAudio(Lcom/vkontakte/android/audio/MusicTrack;Lcom/vk/music/dto/Playlist;)V

    goto :goto_0

    .line 93
    :pswitch_2
    iget-object v1, p0, Lcom/vk/music/view/SearchResultContainer$UserListener;->this$0:Lcom/vk/music/view/SearchResultContainer;

    iget-object v1, v1, Lcom/vk/music/view/SearchResultContainer;->model:Lcom/vk/music/model/SearchResultModel;

    invoke-interface {v1}, Lcom/vk/music/model/SearchResultModel;->getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;

    move-result-object v1

    invoke-interface {v1, p1}, Lcom/vk/music/model/MusicTrackModel;->canRemoveAudio(Lcom/vkontakte/android/audio/MusicTrack;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 94
    new-instance v0, Lcom/vkontakte/android/VKAlertDialog$Builder;

    iget-object v1, p0, Lcom/vk/music/view/SearchResultContainer$UserListener;->this$0:Lcom/vk/music/view/SearchResultContainer;

    invoke-virtual {v1}, Lcom/vk/music/view/SearchResultContainer;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 95
    .local v0, "builder":Lcom/vkontakte/android/VKAlertDialog$Builder;
    const v1, 0x7f080176

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 96
    const v1, 0x7f08039f

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    .line 97
    const v1, 0x7f0804f4

    invoke-static {p0, p1}, Lcom/vk/music/view/SearchResultContainer$UserListener$$Lambda$1;->lambdaFactory$(Lcom/vk/music/view/SearchResultContainer$UserListener;Lcom/vkontakte/android/audio/MusicTrack;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 100
    const v1, 0x7f0804d6

    invoke-static {}, Lcom/vk/music/view/SearchResultContainer$UserListener$$Lambda$2;->lambdaFactory$()Landroid/content/DialogInterface$OnClickListener;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 101
    invoke-virtual {v0}, Lcom/vkontakte/android/VKAlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0

    .line 105
    .end local v0    # "builder":Lcom/vkontakte/android/VKAlertDialog$Builder;
    :pswitch_3
    iget-object v1, p0, Lcom/vk/music/view/SearchResultContainer$UserListener;->this$0:Lcom/vk/music/view/SearchResultContainer;

    iget-object v1, v1, Lcom/vk/music/view/SearchResultContainer;->model:Lcom/vk/music/model/SearchResultModel;

    invoke-interface {v1}, Lcom/vk/music/model/SearchResultModel;->getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;

    move-result-object v1

    invoke-interface {v1, p1}, Lcom/vk/music/model/MusicTrackModel;->isDownloaded(Lcom/vkontakte/android/audio/MusicTrack;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 106
    iget-object v1, p0, Lcom/vk/music/view/SearchResultContainer$UserListener;->this$0:Lcom/vk/music/view/SearchResultContainer;

    iget-object v1, v1, Lcom/vk/music/view/SearchResultContainer;->model:Lcom/vk/music/model/SearchResultModel;

    invoke-interface {v1}, Lcom/vk/music/model/SearchResultModel;->getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/music/view/SearchResultContainer$UserListener;->this$0:Lcom/vk/music/view/SearchResultContainer;

    invoke-virtual {v2}, Lcom/vk/music/view/SearchResultContainer;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-interface {v1, p1, v2}, Lcom/vk/music/model/MusicTrackModel;->download(Lcom/vkontakte/android/audio/MusicTrack;Landroid/content/Context;)V

    goto :goto_0

    .line 108
    :cond_1
    iget-object v1, p0, Lcom/vk/music/view/SearchResultContainer$UserListener;->this$0:Lcom/vk/music/view/SearchResultContainer;

    iget-object v1, v1, Lcom/vk/music/view/SearchResultContainer;->model:Lcom/vk/music/model/SearchResultModel;

    invoke-interface {v1}, Lcom/vk/music/model/SearchResultModel;->getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;

    move-result-object v1

    invoke-interface {v1, p1}, Lcom/vk/music/model/MusicTrackModel;->clearDownloaded(Lcom/vkontakte/android/audio/MusicTrack;)V

    goto/16 :goto_0

    .line 112
    :pswitch_4
    iget-object v1, p0, Lcom/vk/music/view/SearchResultContainer$UserListener;->this$0:Lcom/vk/music/view/SearchResultContainer;

    iget-object v1, v1, Lcom/vk/music/view/SearchResultContainer;->activity:Landroid/app/Activity;

    invoke-static {v1}, Lcom/vk/sharing/Sharing;->from(Landroid/content/Context;)Lcom/vk/sharing/Sharing$Builder;

    move-result-object v1

    const-string/jumbo v2, "music"

    .line 113
    invoke-static {p1, v2}, Lcom/vk/sharing/attachment/Attachments;->createInfo(Lcom/vkontakte/android/audio/MusicTrack;Ljava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vk/sharing/Sharing$Builder;->withAttachment(Lcom/vk/sharing/attachment/AttachmentInfo;)Lcom/vk/sharing/Sharing$Builder;

    move-result-object v1

    .line 114
    invoke-static {p1}, Lcom/vk/sharing/action/Actions;->createInfo(Lcom/vkontakte/android/audio/MusicTrack;)Lcom/vk/sharing/action/ActionsInfo;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vk/sharing/Sharing$Builder;->withActions(Lcom/vk/sharing/action/ActionsInfo;)Lcom/vk/sharing/Sharing$Builder;

    move-result-object v1

    .line 115
    invoke-virtual {v1}, Lcom/vk/sharing/Sharing$Builder;->share()V

    goto/16 :goto_0

    .line 118
    :pswitch_5
    iget-object v1, p0, Lcom/vk/music/view/SearchResultContainer$UserListener;->this$0:Lcom/vk/music/view/SearchResultContainer;

    iget-object v1, v1, Lcom/vk/music/view/SearchResultContainer;->model:Lcom/vk/music/model/SearchResultModel;

    invoke-interface {v1}, Lcom/vk/music/model/SearchResultModel;->getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;

    move-result-object v1

    invoke-interface {v1, p1}, Lcom/vk/music/model/MusicTrackModel;->setTarget(Lcom/vkontakte/android/audio/MusicTrack;)V

    .line 119
    iget-object v1, p0, Lcom/vk/music/view/SearchResultContainer$UserListener;->this$0:Lcom/vk/music/view/SearchResultContainer;

    invoke-static {v1}, Lcom/vk/music/view/SearchResultContainer;->access$000(Lcom/vk/music/view/SearchResultContainer;)Lcom/vk/music/view/SearchResultContainer$Host;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 120
    iget-object v1, p0, Lcom/vk/music/view/SearchResultContainer$UserListener;->this$0:Lcom/vk/music/view/SearchResultContainer;

    invoke-static {v1}, Lcom/vk/music/view/SearchResultContainer;->access$000(Lcom/vk/music/view/SearchResultContainer;)Lcom/vk/music/view/SearchResultContainer$Host;

    move-result-object v1

    invoke-interface {v1}, Lcom/vk/music/view/SearchResultContainer$Host;->requestPlaylist()V

    goto/16 :goto_0

    .line 124
    :pswitch_6
    iget-object v1, p0, Lcom/vk/music/view/SearchResultContainer$UserListener;->this$0:Lcom/vk/music/view/SearchResultContainer;

    iget-object v1, v1, Lcom/vk/music/view/SearchResultContainer;->model:Lcom/vk/music/model/SearchResultModel;

    invoke-interface {v1}, Lcom/vk/music/model/SearchResultModel;->getPlayerModel()Lcom/vk/music/model/PlayerModel;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/music/view/SearchResultContainer$UserListener;->this$0:Lcom/vk/music/view/SearchResultContainer;

    invoke-virtual {v2}, Lcom/vk/music/view/SearchResultContainer;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-interface {v1, v2, p1}, Lcom/vk/music/model/PlayerModel;->addToPlayNext(Landroid/content/Context;Lcom/vkontakte/android/audio/MusicTrack;)V

    goto/16 :goto_0

    .line 127
    :pswitch_7
    iget-object v1, p0, Lcom/vk/music/view/SearchResultContainer$UserListener;->this$0:Lcom/vk/music/view/SearchResultContainer;

    iget-object v1, v1, Lcom/vk/music/view/SearchResultContainer;->model:Lcom/vk/music/model/SearchResultModel;

    invoke-interface {v1}, Lcom/vk/music/model/SearchResultModel;->getPlayerModel()Lcom/vk/music/model/PlayerModel;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/music/view/SearchResultContainer$UserListener;->this$0:Lcom/vk/music/view/SearchResultContainer;

    invoke-virtual {v2}, Lcom/vk/music/view/SearchResultContainer;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-interface {v1, v2, p1}, Lcom/vk/music/model/PlayerModel;->loadAndPlayTheSame(Landroid/content/Context;Lcom/vkontakte/android/audio/MusicTrack;)V

    goto/16 :goto_0

    .line 86
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
    .line 82
    check-cast p1, Lcom/vkontakte/android/audio/MusicTrack;

    invoke-virtual {p0, p1, p2}, Lcom/vk/music/view/SearchResultContainer$UserListener;->onActionClick(Lcom/vkontakte/android/audio/MusicTrack;I)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 145
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    .line 155
    :goto_0
    :sswitch_0
    return-void

    .line 151
    :sswitch_1
    iget-object v0, p0, Lcom/vk/music/view/SearchResultContainer$UserListener;->this$0:Lcom/vk/music/view/SearchResultContainer;

    invoke-virtual {v0}, Lcom/vk/music/view/SearchResultContainer;->onErrorRetryClick()V

    goto :goto_0

    .line 145
    :sswitch_data_0
    .sparse-switch
        0x7f1001a2 -> :sswitch_1
        0x7f1003d4 -> :sswitch_0
    .end sparse-switch
.end method

.method public onClick(Lcom/vkontakte/android/audio/MusicTrack;)V
    .locals 2
    .param p1, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 133
    iget-object v0, p0, Lcom/vk/music/view/SearchResultContainer$UserListener;->this$0:Lcom/vk/music/view/SearchResultContainer;

    iget-object v0, v0, Lcom/vk/music/view/SearchResultContainer;->model:Lcom/vk/music/model/SearchResultModel;

    invoke-interface {v0}, Lcom/vk/music/model/SearchResultModel;->getPlayerModel()Lcom/vk/music/model/PlayerModel;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/music/view/SearchResultContainer$UserListener;->this$0:Lcom/vk/music/view/SearchResultContainer;

    iget-object v1, v1, Lcom/vk/music/view/SearchResultContainer;->model:Lcom/vk/music/model/SearchResultModel;

    invoke-interface {v1}, Lcom/vk/music/model/SearchResultModel;->getResults()Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Lcom/vk/music/model/PlayerModel;->togglePlayer(Lcom/vkontakte/android/audio/MusicTrack;Ljava/util/List;)V

    .line 134
    return-void
.end method

.method public onLastReached()V
    .locals 1

    .prologue
    .line 159
    iget-object v0, p0, Lcom/vk/music/view/SearchResultContainer$UserListener;->this$0:Lcom/vk/music/view/SearchResultContainer;

    iget-object v0, v0, Lcom/vk/music/view/SearchResultContainer;->model:Lcom/vk/music/model/SearchResultModel;

    invoke-interface {v0}, Lcom/vk/music/model/SearchResultModel;->canLoadMore()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 160
    iget-object v0, p0, Lcom/vk/music/view/SearchResultContainer$UserListener;->this$0:Lcom/vk/music/view/SearchResultContainer;

    iget-object v0, v0, Lcom/vk/music/view/SearchResultContainer;->model:Lcom/vk/music/model/SearchResultModel;

    invoke-interface {v0}, Lcom/vk/music/model/SearchResultModel;->loadMoreResults()V

    .line 162
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
    .line 137
    new-instance v0, Lcom/vk/music/fragment/menu/AudioActionsBottomSheet$Builder;

    iget-object v1, p0, Lcom/vk/music/view/SearchResultContainer$UserListener;->this$0:Lcom/vk/music/view/SearchResultContainer;

    iget-object v1, v1, Lcom/vk/music/view/SearchResultContainer;->model:Lcom/vk/music/model/SearchResultModel;

    .line 138
    invoke-interface {v1}, Lcom/vk/music/model/SearchResultModel;->getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;

    move-result-object v1

    invoke-interface {v1, p1}, Lcom/vk/music/model/MusicTrackModel;->canAddAudio(Lcom/vkontakte/android/audio/MusicTrack;)Z

    move-result v1

    iget-object v2, p0, Lcom/vk/music/view/SearchResultContainer$UserListener;->this$0:Lcom/vk/music/view/SearchResultContainer;

    iget-object v2, v2, Lcom/vk/music/view/SearchResultContainer;->model:Lcom/vk/music/model/SearchResultModel;

    .line 139
    invoke-interface {v2}, Lcom/vk/music/model/SearchResultModel;->getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;

    move-result-object v2

    invoke-interface {v2, p1}, Lcom/vk/music/model/MusicTrackModel;->canRemoveAudio(Lcom/vkontakte/android/audio/MusicTrack;)Z

    move-result v2

    invoke-direct {v0, p1, p0, v1, v2}, Lcom/vk/music/fragment/menu/AudioActionsBottomSheet$Builder;-><init>(Lcom/vkontakte/android/audio/MusicTrack;Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;ZZ)V

    iget-object v1, p0, Lcom/vk/music/view/SearchResultContainer$UserListener;->this$0:Lcom/vk/music/view/SearchResultContainer;

    iget-object v1, v1, Lcom/vk/music/view/SearchResultContainer;->activity:Landroid/app/Activity;

    .line 140
    invoke-virtual {v0, v1}, Lcom/vk/music/fragment/menu/AudioActionsBottomSheet$Builder;->show(Landroid/app/Activity;)V

    .line 141
    return-void
.end method
