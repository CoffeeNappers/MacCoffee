.class final Lcom/vk/music/view/PlaylistContainer$UserListener;
.super Lcom/vk/core/widget/LifecycleListener;
.source "PlaylistContainer.java"

# interfaces
.implements Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;
.implements Landroid/view/View$OnClickListener;
.implements Landroid/support/v4/widget/SwipeRefreshLayout$OnRefreshListener;
.implements Lcom/vk/music/view/LastReachedScrollListener$OnLastReachedListener;
.implements Landroid/support/v7/widget/PopupMenu$OnMenuItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/view/PlaylistContainer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "UserListener"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vk/core/widget/LifecycleListener;",
        "Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback",
        "<",
        "Lcom/vkontakte/android/audio/MusicTrack;",
        ">;",
        "Landroid/view/View$OnClickListener;",
        "Landroid/support/v4/widget/SwipeRefreshLayout$OnRefreshListener;",
        "Lcom/vk/music/view/LastReachedScrollListener$OnLastReachedListener;",
        "Landroid/support/v7/widget/PopupMenu$OnMenuItemClickListener;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/music/view/PlaylistContainer;


# direct methods
.method private constructor <init>(Lcom/vk/music/view/PlaylistContainer;)V
    .locals 0

    .prologue
    .line 224
    iput-object p1, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    invoke-direct {p0}, Lcom/vk/core/widget/LifecycleListener;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vk/music/view/PlaylistContainer;Lcom/vk/music/view/PlaylistContainer$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vk/music/view/PlaylistContainer;
    .param p2, "x1"    # Lcom/vk/music/view/PlaylistContainer$1;

    .prologue
    .line 224
    invoke-direct {p0, p1}, Lcom/vk/music/view/PlaylistContainer$UserListener;-><init>(Lcom/vk/music/view/PlaylistContainer;)V

    return-void
.end method

.method static synthetic lambda$onActionClick$1(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p0, "dialog"    # Landroid/content/DialogInterface;
    .param p1, "which"    # I

    .prologue
    .line 272
    invoke-interface {p0}, Landroid/content/DialogInterface;->dismiss()V

    return-void
.end method

.method static synthetic lambda$onMenuItemClick$3(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p0, "dialog"    # Landroid/content/DialogInterface;
    .param p1, "which"    # I

    .prologue
    .line 400
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
    .line 270
    iget-object v0, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v0, v0, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v0}, Lcom/vk/music/model/PlaylistModel;->getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v1, v1, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v1}, Lcom/vk/music/model/PlaylistModel;->getPlaylist()Lcom/vk/music/dto/Playlist;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Lcom/vk/music/model/MusicTrackModel;->removeAudio(Lcom/vkontakte/android/audio/MusicTrack;Lcom/vk/music/dto/Playlist;)V

    .line 271
    return-void
.end method

.method synthetic lambda$onMenuItemClick$2(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 398
    iget-object v0, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v0, v0, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v0}, Lcom/vk/music/model/PlaylistModel;->delete()V

    .line 399
    return-void
.end method

.method public onActionClick(Lcom/vkontakte/android/audio/MusicTrack;I)V
    .locals 5
    .param p1, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "actionId"    # I

    .prologue
    const/4 v4, 0x1

    .line 257
    packed-switch p2, :pswitch_data_0

    .line 318
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 259
    :pswitch_1
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v1, v1, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v1}, Lcom/vk/music/model/PlaylistModel;->getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;

    move-result-object v1

    invoke-interface {v1, p1}, Lcom/vk/music/model/MusicTrackModel;->canAddAudio(Lcom/vkontakte/android/audio/MusicTrack;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 260
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v1, v1, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v1}, Lcom/vk/music/model/PlaylistModel;->getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v1, p1, v2}, Lcom/vk/music/model/MusicTrackModel;->addAudio(Lcom/vkontakte/android/audio/MusicTrack;Lcom/vk/music/dto/Playlist;)V

    goto :goto_0

    .line 264
    :pswitch_2
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v1, v1, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v1}, Lcom/vk/music/model/PlaylistModel;->getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;

    move-result-object v1

    invoke-interface {v1, p1}, Lcom/vk/music/model/MusicTrackModel;->canRemoveAudio(Lcom/vkontakte/android/audio/MusicTrack;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 265
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v1, v1, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v1}, Lcom/vk/music/model/PlaylistModel;->getPlaylist()Lcom/vk/music/dto/Playlist;

    move-result-object v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v1, v1, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v1}, Lcom/vk/music/model/PlaylistModel;->getPlaylist()Lcom/vk/music/dto/Playlist;

    move-result-object v1

    iget v1, v1, Lcom/vk/music/dto/Playlist;->type:I

    const/4 v2, 0x2

    if-eq v1, v2, :cond_2

    .line 266
    :cond_1
    new-instance v0, Lcom/vkontakte/android/VKAlertDialog$Builder;

    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    invoke-virtual {v1}, Lcom/vk/music/view/PlaylistContainer;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 267
    .local v0, "builder":Lcom/vkontakte/android/VKAlertDialog$Builder;
    const v1, 0x7f080176

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 268
    const v1, 0x7f08039f

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    .line 269
    const v1, 0x7f0804f4

    invoke-static {p0, p1}, Lcom/vk/music/view/PlaylistContainer$UserListener$$Lambda$1;->lambdaFactory$(Lcom/vk/music/view/PlaylistContainer$UserListener;Lcom/vkontakte/android/audio/MusicTrack;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 272
    const v1, 0x7f0804d6

    invoke-static {}, Lcom/vk/music/view/PlaylistContainer$UserListener$$Lambda$2;->lambdaFactory$()Landroid/content/DialogInterface$OnClickListener;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 273
    invoke-virtual {v0}, Lcom/vkontakte/android/VKAlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0

    .line 275
    .end local v0    # "builder":Lcom/vkontakte/android/VKAlertDialog$Builder;
    :cond_2
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v1, v1, Lcom/vk/music/view/PlaylistContainer;->musicTracksAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v1}, Lcom/vk/music/view/adapter/ItemAdapter;->getItemCount()I

    move-result v1

    if-ne v1, v4, :cond_3

    .line 276
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v1, v1, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v1}, Lcom/vk/music/model/PlaylistModel;->delete()V

    goto/16 :goto_0

    .line 278
    :cond_3
    new-array v1, v4, [Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {p1}, Lcom/vkontakte/android/audio/MusicTrack;->getMid()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v1}, Lcom/vkontakte/android/audio/AudioFacade;->removeSavedTrack([Ljava/lang/String;)V

    .line 279
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v1, v1, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v1}, Lcom/vk/music/model/PlaylistModel;->getMusicTracks()Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_4

    .line 280
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v1, v1, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v1}, Lcom/vk/music/model/PlaylistModel;->getMusicTracks()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 282
    :cond_4
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v2, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v2, v2, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v2}, Lcom/vk/music/model/PlaylistModel;->getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;

    move-result-object v2

    iget-object v3, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v3, v3, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v3}, Lcom/vk/music/model/PlaylistModel;->getPlaylist()Lcom/vk/music/dto/Playlist;

    move-result-object v3

    invoke-virtual {v1, v2, v3, p1}, Lcom/vk/music/view/PlaylistContainer;->onAudioRemovalFromPlaylistDone(Lcom/vk/music/model/MusicTrackModel;Lcom/vk/music/dto/Playlist;Lcom/vkontakte/android/audio/MusicTrack;)V

    goto/16 :goto_0

    .line 288
    :pswitch_3
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v1, v1, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v1}, Lcom/vk/music/model/PlaylistModel;->getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;

    move-result-object v1

    invoke-interface {v1, p1}, Lcom/vk/music/model/MusicTrackModel;->isDownloaded(Lcom/vkontakte/android/audio/MusicTrack;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 289
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/VKAccount;->isMusicRestricted()Z

    move-result v1

    if-eqz v1, :cond_6

    .line 290
    :cond_5
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v1, v1, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v1}, Lcom/vk/music/model/PlaylistModel;->getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    invoke-virtual {v2}, Lcom/vk/music/view/PlaylistContainer;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-interface {v1, p1, v2}, Lcom/vk/music/model/MusicTrackModel;->download(Lcom/vkontakte/android/audio/MusicTrack;Landroid/content/Context;)V

    goto/16 :goto_0

    .line 292
    :cond_6
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v1, v1, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v1}, Lcom/vk/music/model/PlaylistModel;->getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;

    move-result-object v1

    invoke-interface {v1, p1}, Lcom/vk/music/model/MusicTrackModel;->clearDownloaded(Lcom/vkontakte/android/audio/MusicTrack;)V

    goto/16 :goto_0

    .line 296
    :pswitch_4
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v1, v1, Lcom/vk/music/view/PlaylistContainer;->activity:Landroid/app/Activity;

    invoke-static {v1}, Lcom/vk/sharing/Sharing;->from(Landroid/content/Context;)Lcom/vk/sharing/Sharing$Builder;

    move-result-object v1

    const-string/jumbo v2, "music"

    .line 297
    invoke-static {p1, v2}, Lcom/vk/sharing/attachment/Attachments;->createInfo(Lcom/vkontakte/android/audio/MusicTrack;Ljava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vk/sharing/Sharing$Builder;->withAttachment(Lcom/vk/sharing/attachment/AttachmentInfo;)Lcom/vk/sharing/Sharing$Builder;

    move-result-object v1

    .line 298
    invoke-static {p1}, Lcom/vk/sharing/action/Actions;->createInfo(Lcom/vkontakte/android/audio/MusicTrack;)Lcom/vk/sharing/action/ActionsInfo;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vk/sharing/Sharing$Builder;->withActions(Lcom/vk/sharing/action/ActionsInfo;)Lcom/vk/sharing/Sharing$Builder;

    move-result-object v1

    .line 299
    invoke-virtual {v1}, Lcom/vk/sharing/Sharing$Builder;->share()V

    goto/16 :goto_0

    .line 302
    :pswitch_5
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v1, v1, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v1}, Lcom/vk/music/model/PlaylistModel;->getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;

    move-result-object v1

    invoke-interface {v1, p1}, Lcom/vk/music/model/MusicTrackModel;->setTarget(Lcom/vkontakte/android/audio/MusicTrack;)V

    .line 303
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v1, v1, Lcom/vk/music/view/PlaylistContainer;->lifecycleHandler:Lcom/vk/core/widget/LifecycleHandler;

    .line 304
    invoke-virtual {p0}, Lcom/vk/music/view/PlaylistContainer$UserListener;->getUniqueId()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/vk/music/fragment/PlaylistsFragment$Builder;

    invoke-direct {v3}, Lcom/vk/music/fragment/PlaylistsFragment$Builder;-><init>()V

    .line 306
    invoke-virtual {v3, v4}, Lcom/vk/music/fragment/PlaylistsFragment$Builder;->selectMy(Z)Lcom/vk/music/fragment/PlaylistsFragment$Builder;

    move-result-object v3

    iget-object v4, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v4, v4, Lcom/vk/music/view/PlaylistContainer;->activity:Landroid/app/Activity;

    .line 307
    invoke-virtual {v3, v4}, Lcom/vk/music/fragment/PlaylistsFragment$Builder;->intent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v3

    const/16 v4, 0xa

    .line 303
    invoke-virtual {v1, v2, v3, v4}, Lcom/vk/core/widget/LifecycleHandler;->startActivityForResult(Ljava/lang/String;Landroid/content/Intent;I)V

    goto/16 :goto_0

    .line 312
    :pswitch_6
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v1, v1, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v1}, Lcom/vk/music/model/PlaylistModel;->getPlayerModel()Lcom/vk/music/model/PlayerModel;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    invoke-virtual {v2}, Lcom/vk/music/view/PlaylistContainer;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-interface {v1, v2, p1}, Lcom/vk/music/model/PlayerModel;->addToPlayNext(Landroid/content/Context;Lcom/vkontakte/android/audio/MusicTrack;)V

    goto/16 :goto_0

    .line 315
    :pswitch_7
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v1, v1, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v1}, Lcom/vk/music/model/PlaylistModel;->getPlayerModel()Lcom/vk/music/model/PlayerModel;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    invoke-virtual {v2}, Lcom/vk/music/view/PlaylistContainer;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-interface {v1, v2, p1}, Lcom/vk/music/model/PlayerModel;->loadAndPlayTheSame(Landroid/content/Context;Lcom/vkontakte/android/audio/MusicTrack;)V

    goto/16 :goto_0

    .line 257
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
    .line 224
    check-cast p1, Lcom/vkontakte/android/audio/MusicTrack;

    invoke-virtual {p0, p1, p2}, Lcom/vk/music/view/PlaylistContainer$UserListener;->onActionClick(Lcom/vkontakte/android/audio/MusicTrack;I)V

    return-void
.end method

.method public onActivityResult(Ljava/lang/String;IILandroid/content/Intent;)V
    .locals 3
    .param p1, "instanceId"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "requestCode"    # I
    .param p3, "resultCode"    # I
    .param p4, "data"    # Landroid/content/Intent;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 238
    invoke-super {p0, p1, p2, p3, p4}, Lcom/vk/core/widget/LifecycleListener;->onActivityResult(Ljava/lang/String;IILandroid/content/Intent;)V

    .line 239
    const/4 v1, -0x1

    if-eq p3, v1, :cond_1

    .line 253
    :cond_0
    :goto_0
    return-void

    .line 243
    :cond_1
    const/16 v1, 0xa

    if-ne p2, v1, :cond_2

    .line 244
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v1, v1, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v1}, Lcom/vk/music/model/PlaylistModel;->getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;

    move-result-object v1

    invoke-interface {v1}, Lcom/vk/music/model/MusicTrackModel;->getTarget()Lcom/vkontakte/android/audio/MusicTrack;

    move-result-object v0

    .line 245
    .local v0, "targetTrack":Lcom/vkontakte/android/audio/MusicTrack;
    if-eqz v0, :cond_0

    if-eqz p4, :cond_0

    const-string/jumbo v1, "result"

    invoke-virtual {p4, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 246
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v1, v1, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v1}, Lcom/vk/music/model/PlaylistModel;->getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;

    move-result-object v2

    const-string/jumbo v1, "result"

    invoke-virtual {p4, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Lcom/vk/music/dto/Playlist;

    invoke-interface {v2, v0, v1}, Lcom/vk/music/model/MusicTrackModel;->addAudio(Lcom/vkontakte/android/audio/MusicTrack;Lcom/vk/music/dto/Playlist;)V

    goto :goto_0

    .line 248
    .end local v0    # "targetTrack":Lcom/vkontakte/android/audio/MusicTrack;
    :cond_2
    const/16 v1, 0xb

    if-ne p2, v1, :cond_0

    .line 249
    if-eqz p4, :cond_0

    const-string/jumbo v1, "result"

    invoke-virtual {p4, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 250
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v1, v1, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    const-string/jumbo v2, "result"

    invoke-virtual {p4, v2}, Landroid/content/Intent;->getParcelableArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/vk/music/model/PlaylistModel;->attachMusic(Ljava/util/List;)V

    goto :goto_0
.end method

.method public onActivityStarted(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 232
    invoke-super {p0, p1}, Lcom/vk/core/widget/LifecycleListener;->onActivityStarted(Landroid/app/Activity;)V

    .line 233
    iget-object v0, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v0, v0, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v0}, Lcom/vk/music/model/PlaylistModel;->load()V

    .line 234
    return-void
.end method

.method onArtistClick()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    .line 432
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v1, v1, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v1}, Lcom/vk/music/model/PlaylistModel;->getPlaylist()Lcom/vk/music/dto/Playlist;

    move-result-object v0

    .line 433
    .local v0, "playlist":Lcom/vk/music/dto/Playlist;
    if-eqz v0, :cond_0

    iget-object v1, v0, Lcom/vk/music/dto/Playlist;->artists:Ljava/util/List;

    invoke-static {v1}, Lcom/vk/core/util/CollectionUtils;->count(Ljava/util/Collection;)I

    move-result v1

    if-ne v1, v4, :cond_0

    .line 434
    new-instance v2, Lcom/vk/music/fragment/SearchFragment$Builder;

    invoke-direct {v2}, Lcom/vk/music/fragment/SearchFragment$Builder;-><init>()V

    iget-object v1, v0, Lcom/vk/music/dto/Playlist;->artists:Ljava/util/List;

    const/4 v3, 0x0

    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vk/music/dto/Artist;

    iget-object v1, v1, Lcom/vk/music/dto/Artist;->name:Ljava/lang/String;

    invoke-virtual {v2, v1}, Lcom/vk/music/fragment/SearchFragment$Builder;->query(Ljava/lang/String;)Lcom/vk/music/fragment/SearchFragment$Builder;

    move-result-object v1

    invoke-virtual {v1, v4}, Lcom/vk/music/fragment/SearchFragment$Builder;->openResults(Z)Lcom/vk/music/fragment/SearchFragment$Builder;

    move-result-object v1

    invoke-virtual {v1, v4}, Lcom/vk/music/fragment/SearchFragment$Builder;->openArtistPage(Z)Lcom/vk/music/fragment/SearchFragment$Builder;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v2, v2, Lcom/vk/music/view/PlaylistContainer;->activity:Landroid/app/Activity;

    invoke-virtual {v1, v2}, Lcom/vk/music/fragment/SearchFragment$Builder;->go(Landroid/content/Context;)Z

    .line 436
    :cond_0
    return-void
.end method

.method public onAttachMusicClick()V
    .locals 5

    .prologue
    .line 420
    iget-object v0, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v0, v0, Lcom/vk/music/view/PlaylistContainer;->lifecycleHandler:Lcom/vk/core/widget/LifecycleHandler;

    .line 421
    invoke-virtual {p0}, Lcom/vk/music/view/PlaylistContainer$UserListener;->getUniqueId()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Landroid/content/Intent;

    iget-object v3, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v3, v3, Lcom/vk/music/view/PlaylistContainer;->activity:Landroid/app/Activity;

    const-class v4, Lcom/vk/music/attach/AttachMusicActivity;

    invoke-direct {v2, v3, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/16 v3, 0xb

    .line 420
    invoke-virtual {v0, v1, v2, v3}, Lcom/vk/core/widget/LifecycleHandler;->startActivityForResult(Ljava/lang/String;Landroid/content/Intent;I)V

    .line 425
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 6
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 322
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    sparse-switch v1, :sswitch_data_0

    .line 364
    :goto_0
    return-void

    .line 324
    :sswitch_0
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v1, v1, Lcom/vk/music/view/PlaylistContainer;->activity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->finish()V

    goto :goto_0

    .line 328
    :sswitch_1
    new-instance v1, Lcom/vk/music/fragment/EditPlaylistFragment$Builder;

    invoke-direct {v1}, Lcom/vk/music/fragment/EditPlaylistFragment$Builder;-><init>()V

    iget-object v2, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v2, v2, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    .line 329
    invoke-interface {v2}, Lcom/vk/music/model/PlaylistModel;->getPlaylist()Lcom/vk/music/dto/Playlist;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vk/music/fragment/EditPlaylistFragment$Builder;->playlist(Lcom/vk/music/dto/Playlist;)Lcom/vk/music/fragment/EditPlaylistFragment$Builder;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v2, v2, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    .line 330
    invoke-interface {v2}, Lcom/vk/music/model/PlaylistModel;->getOffset()I

    move-result v2

    iget-object v3, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v3, v3, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v3}, Lcom/vk/music/model/PlaylistModel;->getMusicTracks()Ljava/util/List;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/vk/music/fragment/EditPlaylistFragment$Builder;->musicTracks(ILjava/util/Collection;)Lcom/vk/music/fragment/EditPlaylistFragment$Builder;

    move-result-object v1

    .line 331
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vk/music/fragment/EditPlaylistFragment$Builder;->go(Landroid/content/Context;)Z

    goto :goto_0

    .line 335
    :sswitch_2
    new-instance v0, Landroid/support/v7/widget/PopupMenu;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const/4 v3, 0x5

    const/4 v4, 0x0

    const v5, 0x7f0b013b

    move-object v2, p1

    invoke-direct/range {v0 .. v5}, Landroid/support/v7/widget/PopupMenu;-><init>(Landroid/content/Context;Landroid/view/View;III)V

    .line 336
    .local v0, "popup":Landroid/support/v7/widget/PopupMenu;
    const v1, 0x7f110008

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/PopupMenu;->inflate(I)V

    .line 337
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v1, v1, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v1}, Lcom/vk/music/model/PlaylistModel;->isCurrentUser()Z

    move-result v1

    if-nez v1, :cond_0

    .line 338
    invoke-virtual {v0}, Landroid/support/v7/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v1

    const v2, 0x7f1005ec

    invoke-interface {v1, v2}, Landroid/view/Menu;->removeItem(I)V

    .line 340
    :cond_0
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v1, v1, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v1}, Lcom/vk/music/model/PlaylistModel;->canShare()Z

    move-result v1

    if-nez v1, :cond_1

    .line 341
    invoke-virtual {v0}, Landroid/support/v7/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v1

    const v2, 0x7f1005ed

    invoke-interface {v1, v2}, Landroid/view/Menu;->removeItem(I)V

    .line 343
    :cond_1
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v1, v1, Lcom/vk/music/view/PlaylistContainer;->userListener:Lcom/vk/music/view/PlaylistContainer$UserListener;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/PopupMenu;->setOnMenuItemClickListener(Landroid/support/v7/widget/PopupMenu$OnMenuItemClickListener;)V

    .line 344
    invoke-virtual {v0}, Landroid/support/v7/widget/PopupMenu;->show()V

    goto :goto_0

    .line 348
    .end local v0    # "popup":Landroid/support/v7/widget/PopupMenu;
    :sswitch_3
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v1, v1, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/vk/music/model/PlaylistModel;->loadAndPlayShuffleAll(Landroid/content/Context;)V

    goto/16 :goto_0

    .line 352
    :sswitch_4
    new-instance v1, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;

    iget-object v2, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v2, v2, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v2}, Lcom/vk/music/model/PlaylistModel;->getOwnerId()I

    move-result v2

    invoke-direct {v1, v2}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;-><init>(I)V

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;->go(Landroid/content/Context;)Z

    goto/16 :goto_0

    .line 356
    :sswitch_5
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v1, v1, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v1}, Lcom/vk/music/model/PlaylistModel;->toggleFollowing()V

    goto/16 :goto_0

    .line 360
    :sswitch_6
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    invoke-virtual {v1}, Lcom/vk/music/view/PlaylistContainer;->onErrorRetryClick()V

    goto/16 :goto_0

    .line 322
    :sswitch_data_0
    .sparse-switch
        0x7f1001a2 -> :sswitch_6
        0x7f1003d5 -> :sswitch_3
        0x7f1003d8 -> :sswitch_0
        0x7f1003d9 -> :sswitch_1
        0x7f1003da -> :sswitch_2
        0x7f1003dd -> :sswitch_4
        0x7f1003df -> :sswitch_5
    .end sparse-switch
.end method

.method public onClick(Lcom/vkontakte/android/audio/MusicTrack;)V
    .locals 2
    .param p1, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 379
    iget-object v0, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v0, v0, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v0}, Lcom/vk/music/model/PlaylistModel;->getPlayerModel()Lcom/vk/music/model/PlayerModel;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v1, v1, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v1}, Lcom/vk/music/model/PlaylistModel;->getMusicTracks()Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Lcom/vk/music/model/PlayerModel;->togglePlayer(Lcom/vkontakte/android/audio/MusicTrack;Ljava/util/List;)V

    .line 380
    return-void
.end method

.method public onLastReached()V
    .locals 1

    .prologue
    .line 373
    iget-object v0, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v0, v0, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v0}, Lcom/vk/music/model/PlaylistModel;->canLoadMore()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 374
    iget-object v0, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v0, v0, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v0}, Lcom/vk/music/model/PlaylistModel;->loadMore()V

    .line 376
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
    .line 383
    new-instance v0, Lcom/vk/music/fragment/menu/AudioActionsBottomSheet$Builder;

    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v1, v1, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    .line 384
    invoke-interface {v1}, Lcom/vk/music/model/PlaylistModel;->getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;

    move-result-object v1

    invoke-interface {v1, p1}, Lcom/vk/music/model/MusicTrackModel;->canAddAudio(Lcom/vkontakte/android/audio/MusicTrack;)Z

    move-result v1

    iget-object v2, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v2, v2, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    .line 385
    invoke-interface {v2}, Lcom/vk/music/model/PlaylistModel;->getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;

    move-result-object v2

    invoke-interface {v2, p1}, Lcom/vk/music/model/MusicTrackModel;->canRemoveAudio(Lcom/vkontakte/android/audio/MusicTrack;)Z

    move-result v2

    invoke-direct {v0, p1, p0, v1, v2}, Lcom/vk/music/fragment/menu/AudioActionsBottomSheet$Builder;-><init>(Lcom/vkontakte/android/audio/MusicTrack;Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;ZZ)V

    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v1, v1, Lcom/vk/music/view/PlaylistContainer;->activity:Landroid/app/Activity;

    .line 386
    invoke-virtual {v0, v1}, Lcom/vk/music/fragment/menu/AudioActionsBottomSheet$Builder;->show(Landroid/app/Activity;)V

    .line 387
    return-void
.end method

.method public onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 4
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 391
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v2

    packed-switch v2, :pswitch_data_0

    .line 416
    :cond_0
    :goto_0
    const/4 v2, 0x1

    return v2

    .line 394
    :pswitch_0
    new-instance v0, Lcom/vkontakte/android/VKAlertDialog$Builder;

    iget-object v2, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    invoke-virtual {v2}, Lcom/vk/music/view/PlaylistContainer;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 395
    .local v0, "builder":Lcom/vkontakte/android/VKAlertDialog$Builder;
    const v2, 0x7f080176

    invoke-virtual {v0, v2}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 396
    const v2, 0x7f0803a0

    invoke-virtual {v0, v2}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    .line 397
    const v2, 0x7f0804f4

    invoke-static {p0}, Lcom/vk/music/view/PlaylistContainer$UserListener$$Lambda$3;->lambdaFactory$(Lcom/vk/music/view/PlaylistContainer$UserListener;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 400
    const v2, 0x7f0804d6

    invoke-static {}, Lcom/vk/music/view/PlaylistContainer$UserListener$$Lambda$4;->lambdaFactory$()Landroid/content/DialogInterface$OnClickListener;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 401
    invoke-virtual {v0}, Lcom/vkontakte/android/VKAlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0

    .line 406
    .end local v0    # "builder":Lcom/vkontakte/android/VKAlertDialog$Builder;
    :pswitch_1
    iget-object v2, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v2, v2, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v2}, Lcom/vk/music/model/PlaylistModel;->getPlaylist()Lcom/vk/music/dto/Playlist;

    move-result-object v1

    .line 407
    .local v1, "playlist":Lcom/vk/music/dto/Playlist;
    if-eqz v1, :cond_0

    .line 408
    iget-object v2, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v2, v2, Lcom/vk/music/view/PlaylistContainer;->activity:Landroid/app/Activity;

    invoke-static {v2}, Lcom/vk/sharing/Sharing;->from(Landroid/content/Context;)Lcom/vk/sharing/Sharing$Builder;

    move-result-object v2

    const-string/jumbo v3, "playlist"

    .line 409
    invoke-static {v1, v3}, Lcom/vk/sharing/attachment/Attachments;->createInfo(Lcom/vk/music/dto/Playlist;Ljava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/vk/sharing/Sharing$Builder;->withAttachment(Lcom/vk/sharing/attachment/AttachmentInfo;)Lcom/vk/sharing/Sharing$Builder;

    move-result-object v2

    .line 410
    invoke-static {v1}, Lcom/vk/sharing/action/Actions;->createInfo(Lcom/vk/music/dto/Playlist;)Lcom/vk/sharing/action/ActionsInfo;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/vk/sharing/Sharing$Builder;->withActions(Lcom/vk/sharing/action/ActionsInfo;)Lcom/vk/sharing/Sharing$Builder;

    move-result-object v2

    .line 411
    invoke-virtual {v2}, Lcom/vk/sharing/Sharing$Builder;->share()V

    goto :goto_0

    .line 391
    nop

    :pswitch_data_0
    .packed-switch 0x7f1005ec
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method onOwnerClick()V
    .locals 2

    .prologue
    .line 428
    new-instance v0, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;

    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v1, v1, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v1}, Lcom/vk/music/model/PlaylistModel;->getOwnerId()I

    move-result v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;-><init>(I)V

    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v1, v1, Lcom/vk/music/view/PlaylistContainer;->activity:Landroid/app/Activity;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;->go(Landroid/content/Context;)Z

    .line 429
    return-void
.end method

.method public onRefresh()V
    .locals 1

    .prologue
    .line 368
    iget-object v0, p0, Lcom/vk/music/view/PlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v0, v0, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v0}, Lcom/vk/music/model/PlaylistModel;->load()V

    .line 369
    return-void
.end method
