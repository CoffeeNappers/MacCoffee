.class Lcom/vk/music/view/RecommendedContainer$1;
.super Ljava/lang/Object;
.source "RecommendedContainer.java"

# interfaces
.implements Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/view/RecommendedContainer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback",
        "<",
        "Lcom/vkontakte/android/audio/MusicTrack;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/music/view/RecommendedContainer;


# direct methods
.method constructor <init>(Lcom/vk/music/view/RecommendedContainer;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/music/view/RecommendedContainer;

    .prologue
    .line 267
    iput-object p1, p0, Lcom/vk/music/view/RecommendedContainer$1;->this$0:Lcom/vk/music/view/RecommendedContainer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic lambda$onActionClick$1(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p0, "dialog"    # Landroid/content/DialogInterface;
    .param p1, "which"    # I

    .prologue
    .line 284
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
    .line 282
    iget-object v0, p0, Lcom/vk/music/view/RecommendedContainer$1;->this$0:Lcom/vk/music/view/RecommendedContainer;

    iget-object v0, v0, Lcom/vk/music/view/RecommendedContainer;->model:Lcom/vk/music/model/RecommendedModel;

    invoke-interface {v0}, Lcom/vk/music/model/RecommendedModel;->getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, p1, v1}, Lcom/vk/music/model/MusicTrackModel;->removeAudio(Lcom/vkontakte/android/audio/MusicTrack;Lcom/vk/music/dto/Playlist;)V

    .line 283
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
    .line 270
    packed-switch p2, :pswitch_data_0

    .line 314
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 272
    :pswitch_1
    iget-object v1, p0, Lcom/vk/music/view/RecommendedContainer$1;->this$0:Lcom/vk/music/view/RecommendedContainer;

    iget-object v1, v1, Lcom/vk/music/view/RecommendedContainer;->model:Lcom/vk/music/model/RecommendedModel;

    invoke-interface {v1}, Lcom/vk/music/model/RecommendedModel;->getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;

    move-result-object v1

    invoke-interface {v1, p1}, Lcom/vk/music/model/MusicTrackModel;->canAddAudio(Lcom/vkontakte/android/audio/MusicTrack;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 273
    iget-object v1, p0, Lcom/vk/music/view/RecommendedContainer$1;->this$0:Lcom/vk/music/view/RecommendedContainer;

    iget-object v1, v1, Lcom/vk/music/view/RecommendedContainer;->model:Lcom/vk/music/model/RecommendedModel;

    invoke-interface {v1}, Lcom/vk/music/model/RecommendedModel;->getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v1, p1, v2}, Lcom/vk/music/model/MusicTrackModel;->addAudio(Lcom/vkontakte/android/audio/MusicTrack;Lcom/vk/music/dto/Playlist;)V

    goto :goto_0

    .line 277
    :pswitch_2
    iget-object v1, p0, Lcom/vk/music/view/RecommendedContainer$1;->this$0:Lcom/vk/music/view/RecommendedContainer;

    iget-object v1, v1, Lcom/vk/music/view/RecommendedContainer;->model:Lcom/vk/music/model/RecommendedModel;

    invoke-interface {v1}, Lcom/vk/music/model/RecommendedModel;->getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;

    move-result-object v1

    invoke-interface {v1, p1}, Lcom/vk/music/model/MusicTrackModel;->canRemoveAudio(Lcom/vkontakte/android/audio/MusicTrack;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 278
    new-instance v0, Lcom/vkontakte/android/VKAlertDialog$Builder;

    iget-object v1, p0, Lcom/vk/music/view/RecommendedContainer$1;->this$0:Lcom/vk/music/view/RecommendedContainer;

    invoke-virtual {v1}, Lcom/vk/music/view/RecommendedContainer;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 279
    .local v0, "builder":Lcom/vkontakte/android/VKAlertDialog$Builder;
    const v1, 0x7f080176

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 280
    const v1, 0x7f08039f

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    .line 281
    const v1, 0x7f0804f4

    invoke-static {p0, p1}, Lcom/vk/music/view/RecommendedContainer$1$$Lambda$1;->lambdaFactory$(Lcom/vk/music/view/RecommendedContainer$1;Lcom/vkontakte/android/audio/MusicTrack;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 284
    const v1, 0x7f0804d6

    invoke-static {}, Lcom/vk/music/view/RecommendedContainer$1$$Lambda$2;->lambdaFactory$()Landroid/content/DialogInterface$OnClickListener;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 285
    invoke-virtual {v0}, Lcom/vkontakte/android/VKAlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0

    .line 289
    .end local v0    # "builder":Lcom/vkontakte/android/VKAlertDialog$Builder;
    :pswitch_3
    iget-object v1, p0, Lcom/vk/music/view/RecommendedContainer$1;->this$0:Lcom/vk/music/view/RecommendedContainer;

    iget-object v1, v1, Lcom/vk/music/view/RecommendedContainer;->model:Lcom/vk/music/model/RecommendedModel;

    invoke-interface {v1}, Lcom/vk/music/model/RecommendedModel;->getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;

    move-result-object v1

    invoke-interface {v1, p1}, Lcom/vk/music/model/MusicTrackModel;->isDownloaded(Lcom/vkontakte/android/audio/MusicTrack;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 290
    iget-object v1, p0, Lcom/vk/music/view/RecommendedContainer$1;->this$0:Lcom/vk/music/view/RecommendedContainer;

    iget-object v1, v1, Lcom/vk/music/view/RecommendedContainer;->model:Lcom/vk/music/model/RecommendedModel;

    invoke-interface {v1}, Lcom/vk/music/model/RecommendedModel;->getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/music/view/RecommendedContainer$1;->this$0:Lcom/vk/music/view/RecommendedContainer;

    invoke-virtual {v2}, Lcom/vk/music/view/RecommendedContainer;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-interface {v1, p1, v2}, Lcom/vk/music/model/MusicTrackModel;->download(Lcom/vkontakte/android/audio/MusicTrack;Landroid/content/Context;)V

    goto :goto_0

    .line 292
    :cond_1
    iget-object v1, p0, Lcom/vk/music/view/RecommendedContainer$1;->this$0:Lcom/vk/music/view/RecommendedContainer;

    iget-object v1, v1, Lcom/vk/music/view/RecommendedContainer;->model:Lcom/vk/music/model/RecommendedModel;

    invoke-interface {v1}, Lcom/vk/music/model/RecommendedModel;->getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;

    move-result-object v1

    invoke-interface {v1, p1}, Lcom/vk/music/model/MusicTrackModel;->clearDownloaded(Lcom/vkontakte/android/audio/MusicTrack;)V

    goto/16 :goto_0

    .line 296
    :pswitch_4
    iget-object v1, p0, Lcom/vk/music/view/RecommendedContainer$1;->this$0:Lcom/vk/music/view/RecommendedContainer;

    invoke-virtual {v1}, Lcom/vk/music/view/RecommendedContainer;->getContext()Landroid/content/Context;

    move-result-object v1

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
    iget-object v1, p0, Lcom/vk/music/view/RecommendedContainer$1;->this$0:Lcom/vk/music/view/RecommendedContainer;

    iget-object v1, v1, Lcom/vk/music/view/RecommendedContainer;->model:Lcom/vk/music/model/RecommendedModel;

    invoke-interface {v1}, Lcom/vk/music/model/RecommendedModel;->getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;

    move-result-object v1

    invoke-interface {v1, p1}, Lcom/vk/music/model/MusicTrackModel;->setTarget(Lcom/vkontakte/android/audio/MusicTrack;)V

    .line 303
    iget-object v1, p0, Lcom/vk/music/view/RecommendedContainer$1;->this$0:Lcom/vk/music/view/RecommendedContainer;

    iget-object v1, v1, Lcom/vk/music/view/RecommendedContainer;->host:Lcom/vk/music/view/RecommendedContainer$Host;

    if-eqz v1, :cond_0

    .line 304
    iget-object v1, p0, Lcom/vk/music/view/RecommendedContainer$1;->this$0:Lcom/vk/music/view/RecommendedContainer;

    iget-object v1, v1, Lcom/vk/music/view/RecommendedContainer;->host:Lcom/vk/music/view/RecommendedContainer$Host;

    invoke-interface {v1}, Lcom/vk/music/view/RecommendedContainer$Host;->requestPlaylist()V

    goto/16 :goto_0

    .line 308
    :pswitch_6
    iget-object v1, p0, Lcom/vk/music/view/RecommendedContainer$1;->this$0:Lcom/vk/music/view/RecommendedContainer;

    iget-object v1, v1, Lcom/vk/music/view/RecommendedContainer;->model:Lcom/vk/music/model/RecommendedModel;

    invoke-interface {v1}, Lcom/vk/music/model/RecommendedModel;->getPlayerModel()Lcom/vk/music/model/PlayerModel;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/music/view/RecommendedContainer$1;->this$0:Lcom/vk/music/view/RecommendedContainer;

    invoke-virtual {v2}, Lcom/vk/music/view/RecommendedContainer;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-interface {v1, v2, p1}, Lcom/vk/music/model/PlayerModel;->addToPlayNext(Landroid/content/Context;Lcom/vkontakte/android/audio/MusicTrack;)V

    goto/16 :goto_0

    .line 311
    :pswitch_7
    iget-object v1, p0, Lcom/vk/music/view/RecommendedContainer$1;->this$0:Lcom/vk/music/view/RecommendedContainer;

    iget-object v1, v1, Lcom/vk/music/view/RecommendedContainer;->model:Lcom/vk/music/model/RecommendedModel;

    invoke-interface {v1}, Lcom/vk/music/model/RecommendedModel;->getPlayerModel()Lcom/vk/music/model/PlayerModel;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/music/view/RecommendedContainer$1;->this$0:Lcom/vk/music/view/RecommendedContainer;

    invoke-virtual {v2}, Lcom/vk/music/view/RecommendedContainer;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-interface {v1, v2, p1}, Lcom/vk/music/model/PlayerModel;->loadAndPlayTheSame(Landroid/content/Context;Lcom/vkontakte/android/audio/MusicTrack;)V

    goto/16 :goto_0

    .line 270
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
    .line 267
    check-cast p1, Lcom/vkontakte/android/audio/MusicTrack;

    invoke-virtual {p0, p1, p2}, Lcom/vk/music/view/RecommendedContainer$1;->onActionClick(Lcom/vkontakte/android/audio/MusicTrack;I)V

    return-void
.end method
