.class final Lcom/vk/music/view/PlaylistsContainer$UserListener;
.super Lcom/vk/core/widget/LifecycleListener;
.source "PlaylistsContainer.java"

# interfaces
.implements Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;
.implements Landroid/view/View$OnClickListener;
.implements Landroid/support/v4/widget/SwipeRefreshLayout$OnRefreshListener;
.implements Lcom/vk/music/view/LastReachedScrollListener$OnLastReachedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/view/PlaylistsContainer;
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
        "Lcom/vk/music/dto/Playlist;",
        ">;",
        "Landroid/view/View$OnClickListener;",
        "Landroid/support/v4/widget/SwipeRefreshLayout$OnRefreshListener;",
        "Lcom/vk/music/view/LastReachedScrollListener$OnLastReachedListener;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/music/view/PlaylistsContainer;


# direct methods
.method private constructor <init>(Lcom/vk/music/view/PlaylistsContainer;)V
    .locals 0

    .prologue
    .line 80
    iput-object p1, p0, Lcom/vk/music/view/PlaylistsContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistsContainer;

    invoke-direct {p0}, Lcom/vk/core/widget/LifecycleListener;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vk/music/view/PlaylistsContainer;Lcom/vk/music/view/PlaylistsContainer$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vk/music/view/PlaylistsContainer;
    .param p2, "x1"    # Lcom/vk/music/view/PlaylistsContainer$1;

    .prologue
    .line 80
    invoke-direct {p0, p1}, Lcom/vk/music/view/PlaylistsContainer$UserListener;-><init>(Lcom/vk/music/view/PlaylistsContainer;)V

    return-void
.end method

.method static synthetic lambda$onActionClick$1(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p0, "dialog"    # Landroid/content/DialogInterface;
    .param p1, "which"    # I

    .prologue
    .line 107
    invoke-interface {p0}, Landroid/content/DialogInterface;->dismiss()V

    return-void
.end method


# virtual methods
.method synthetic lambda$onActionClick$0(Lcom/vk/music/dto/Playlist;Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "playlist"    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "dialog"    # Landroid/content/DialogInterface;
    .param p3, "which"    # I

    .prologue
    .line 105
    iget-object v0, p0, Lcom/vk/music/view/PlaylistsContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistsContainer;

    iget-object v0, v0, Lcom/vk/music/view/PlaylistsContainer;->model:Lcom/vk/music/model/PlaylistsModel;

    invoke-interface {v0, p1}, Lcom/vk/music/model/PlaylistsModel;->deletePlaylist(Lcom/vk/music/dto/Playlist;)V

    .line 106
    return-void
.end method

.method public onActionClick(Lcom/vk/music/dto/Playlist;I)V
    .locals 3
    .param p1, "playlist"    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "actionId"    # I

    .prologue
    .line 93
    packed-switch p2, :pswitch_data_0

    .line 133
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 95
    :pswitch_1
    invoke-virtual {p0, p1}, Lcom/vk/music/view/PlaylistsContainer$UserListener;->onClick(Lcom/vk/music/dto/Playlist;)V

    goto :goto_0

    .line 98
    :pswitch_2
    iget-object v1, p0, Lcom/vk/music/view/PlaylistsContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistsContainer;

    iget-object v1, v1, Lcom/vk/music/view/PlaylistsContainer;->model:Lcom/vk/music/model/PlaylistsModel;

    invoke-interface {v1, p1}, Lcom/vk/music/model/PlaylistsModel;->canAddPlaylist(Lcom/vk/music/dto/Playlist;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 99
    iget-object v1, p0, Lcom/vk/music/view/PlaylistsContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistsContainer;

    iget-object v1, v1, Lcom/vk/music/view/PlaylistsContainer;->model:Lcom/vk/music/model/PlaylistsModel;

    invoke-interface {v1, p1}, Lcom/vk/music/model/PlaylistsModel;->addPlaylist(Lcom/vk/music/dto/Playlist;)V

    goto :goto_0

    .line 100
    :cond_1
    iget-object v1, p0, Lcom/vk/music/view/PlaylistsContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistsContainer;

    iget-object v1, v1, Lcom/vk/music/view/PlaylistsContainer;->model:Lcom/vk/music/model/PlaylistsModel;

    invoke-interface {v1, p1}, Lcom/vk/music/model/PlaylistsModel;->canDeletePlaylist(Lcom/vk/music/dto/Playlist;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 101
    new-instance v0, Lcom/vkontakte/android/VKAlertDialog$Builder;

    iget-object v1, p0, Lcom/vk/music/view/PlaylistsContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistsContainer;

    invoke-virtual {v1}, Lcom/vk/music/view/PlaylistsContainer;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 102
    .local v0, "builder":Lcom/vkontakte/android/VKAlertDialog$Builder;
    const v1, 0x7f080176

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 103
    const v1, 0x7f0803a0

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    .line 104
    const v1, 0x7f0804f4

    invoke-static {p0, p1}, Lcom/vk/music/view/PlaylistsContainer$UserListener$$Lambda$1;->lambdaFactory$(Lcom/vk/music/view/PlaylistsContainer$UserListener;Lcom/vk/music/dto/Playlist;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 107
    const v1, 0x7f0804d6

    invoke-static {}, Lcom/vk/music/view/PlaylistsContainer$UserListener$$Lambda$2;->lambdaFactory$()Landroid/content/DialogInterface$OnClickListener;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 108
    invoke-virtual {v0}, Lcom/vkontakte/android/VKAlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0

    .line 112
    .end local v0    # "builder":Lcom/vkontakte/android/VKAlertDialog$Builder;
    :pswitch_3
    new-instance v1, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;

    invoke-direct {v1, p1}, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;-><init>(Lcom/vk/music/dto/Playlist;)V

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;->audioOffset(I)Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;

    move-result-object v1

    const/16 v2, 0x64

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;->audioCount(I)Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;

    move-result-object v1

    .line 113
    invoke-virtual {v1}, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;->build()Lcom/vkontakte/android/api/audio/AudioGetPlaylist;

    move-result-object v1

    new-instance v2, Lcom/vk/music/view/PlaylistsContainer$UserListener$1;

    invoke-direct {v2, p0}, Lcom/vk/music/view/PlaylistsContainer$UserListener$1;-><init>(Lcom/vk/music/view/PlaylistsContainer$UserListener;)V

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/audio/AudioGetPlaylist;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    .line 124
    invoke-virtual {v1, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Ljava/lang/Object;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0

    .line 127
    :pswitch_4
    iget-object v1, p0, Lcom/vk/music/view/PlaylistsContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistsContainer;

    iget-object v1, v1, Lcom/vk/music/view/PlaylistsContainer;->activity:Landroid/app/Activity;

    invoke-static {v1}, Lcom/vk/sharing/Sharing;->from(Landroid/content/Context;)Lcom/vk/sharing/Sharing$Builder;

    move-result-object v1

    const-string/jumbo v2, "playlists"

    .line 128
    invoke-static {p1, v2}, Lcom/vk/sharing/attachment/Attachments;->createInfo(Lcom/vk/music/dto/Playlist;Ljava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vk/sharing/Sharing$Builder;->withAttachment(Lcom/vk/sharing/attachment/AttachmentInfo;)Lcom/vk/sharing/Sharing$Builder;

    move-result-object v1

    .line 129
    invoke-static {p1}, Lcom/vk/sharing/action/Actions;->createInfo(Lcom/vk/music/dto/Playlist;)Lcom/vk/sharing/action/ActionsInfo;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vk/sharing/Sharing$Builder;->withActions(Lcom/vk/sharing/action/ActionsInfo;)Lcom/vk/sharing/Sharing$Builder;

    move-result-object v1

    .line 130
    invoke-virtual {v1}, Lcom/vk/sharing/Sharing$Builder;->share()V

    goto/16 :goto_0

    .line 93
    :pswitch_data_0
    .packed-switch 0x7f100060
        :pswitch_1
        :pswitch_3
        :pswitch_0
        :pswitch_2
        :pswitch_4
    .end packed-switch
.end method

.method public bridge synthetic onActionClick(Ljava/lang/Object;I)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 80
    check-cast p1, Lcom/vk/music/dto/Playlist;

    invoke-virtual {p0, p1, p2}, Lcom/vk/music/view/PlaylistsContainer$UserListener;->onActionClick(Lcom/vk/music/dto/Playlist;I)V

    return-void
.end method

.method public onActivityStarted(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 87
    invoke-super {p0, p1}, Lcom/vk/core/widget/LifecycleListener;->onActivityStarted(Landroid/app/Activity;)V

    .line 88
    iget-object v0, p0, Lcom/vk/music/view/PlaylistsContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistsContainer;

    iget-object v0, v0, Lcom/vk/music/view/PlaylistsContainer;->model:Lcom/vk/music/model/PlaylistsModel;

    invoke-interface {v0}, Lcom/vk/music/model/PlaylistsModel;->loadPlaylists()V

    .line 89
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 137
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    .line 151
    :goto_0
    return-void

    .line 139
    :sswitch_0
    iget-object v0, p0, Lcom/vk/music/view/PlaylistsContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistsContainer;

    iget-object v0, v0, Lcom/vk/music/view/PlaylistsContainer;->activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    goto :goto_0

    .line 143
    :sswitch_1
    new-instance v0, Lcom/vk/music/fragment/EditPlaylistFragment$Builder;

    invoke-direct {v0}, Lcom/vk/music/fragment/EditPlaylistFragment$Builder;-><init>()V

    iget-object v1, p0, Lcom/vk/music/view/PlaylistsContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistsContainer;

    iget-object v1, v1, Lcom/vk/music/view/PlaylistsContainer;->activity:Landroid/app/Activity;

    invoke-virtual {v0, v1}, Lcom/vk/music/fragment/EditPlaylistFragment$Builder;->go(Landroid/content/Context;)Z

    goto :goto_0

    .line 147
    :sswitch_2
    iget-object v0, p0, Lcom/vk/music/view/PlaylistsContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistsContainer;

    invoke-virtual {v0}, Lcom/vk/music/view/PlaylistsContainer;->onErrorRetryClick()V

    goto :goto_0

    .line 137
    nop

    :sswitch_data_0
    .sparse-switch
        0x7f1001a2 -> :sswitch_2
        0x7f1003d0 -> :sswitch_1
        0x7f1003d8 -> :sswitch_0
    .end sparse-switch
.end method

.method public onClick(Lcom/vk/music/dto/Playlist;)V
    .locals 4
    .param p1, "playlist"    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 166
    iget-object v2, p0, Lcom/vk/music/view/PlaylistsContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistsContainer;

    iget-object v2, v2, Lcom/vk/music/view/PlaylistsContainer;->model:Lcom/vk/music/model/PlaylistsModel;

    invoke-interface {v2}, Lcom/vk/music/model/PlaylistsModel;->isSelect()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 167
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 168
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v2, "result"

    invoke-virtual {v0, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 169
    iget-object v2, p0, Lcom/vk/music/view/PlaylistsContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistsContainer;

    iget-object v2, v2, Lcom/vk/music/view/PlaylistsContainer;->activity:Landroid/app/Activity;

    const/4 v3, -0x1

    invoke-virtual {v2, v3, v0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 170
    iget-object v2, p0, Lcom/vk/music/view/PlaylistsContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistsContainer;

    iget-object v2, v2, Lcom/vk/music/view/PlaylistsContainer;->activity:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->finish()V

    .line 175
    .end local v0    # "intent":Landroid/content/Intent;
    :goto_0
    return-void

    .line 172
    :cond_0
    iget-object v2, p0, Lcom/vk/music/view/PlaylistsContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistsContainer;

    iget-object v2, v2, Lcom/vk/music/view/PlaylistsContainer;->model:Lcom/vk/music/model/PlaylistsModel;

    invoke-interface {v2, p1}, Lcom/vk/music/model/PlaylistsModel;->getOriginalPlaylist(Lcom/vk/music/dto/Playlist;)Lcom/vk/music/dto/Playlist;

    move-result-object v1

    .line 173
    .local v1, "original":Lcom/vk/music/dto/Playlist;
    new-instance v2, Lcom/vk/music/fragment/PlaylistFragment$Builder;

    invoke-direct {v2, v1}, Lcom/vk/music/fragment/PlaylistFragment$Builder;-><init>(Lcom/vk/music/dto/Playlist;)V

    iget-object v3, p0, Lcom/vk/music/view/PlaylistsContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistsContainer;

    iget-object v3, v3, Lcom/vk/music/view/PlaylistsContainer;->activity:Landroid/app/Activity;

    invoke-virtual {v2, v3}, Lcom/vk/music/fragment/PlaylistFragment$Builder;->go(Landroid/content/Context;)Z

    goto :goto_0
.end method

.method public onLastReached()V
    .locals 1

    .prologue
    .line 160
    iget-object v0, p0, Lcom/vk/music/view/PlaylistsContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistsContainer;

    iget-object v0, v0, Lcom/vk/music/view/PlaylistsContainer;->model:Lcom/vk/music/model/PlaylistsModel;

    invoke-interface {v0}, Lcom/vk/music/model/PlaylistsModel;->canLoadMore()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 161
    iget-object v0, p0, Lcom/vk/music/view/PlaylistsContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistsContainer;

    iget-object v0, v0, Lcom/vk/music/view/PlaylistsContainer;->model:Lcom/vk/music/model/PlaylistsModel;

    invoke-interface {v0}, Lcom/vk/music/model/PlaylistsModel;->loadMore()V

    .line 163
    :cond_0
    return-void
.end method

.method onMenuClick(Lcom/vk/music/dto/Playlist;)V
    .locals 3
    .param p1, "playlist"    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 178
    new-instance v0, Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet$Builder;

    iget-object v1, p0, Lcom/vk/music/view/PlaylistsContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistsContainer;

    iget-object v1, v1, Lcom/vk/music/view/PlaylistsContainer;->model:Lcom/vk/music/model/PlaylistsModel;

    .line 179
    invoke-interface {v1, p1}, Lcom/vk/music/model/PlaylistsModel;->canAddPlaylist(Lcom/vk/music/dto/Playlist;)Z

    move-result v1

    iget-object v2, p0, Lcom/vk/music/view/PlaylistsContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistsContainer;

    iget-object v2, v2, Lcom/vk/music/view/PlaylistsContainer;->model:Lcom/vk/music/model/PlaylistsModel;

    .line 180
    invoke-interface {v2, p1}, Lcom/vk/music/model/PlaylistsModel;->canDeletePlaylist(Lcom/vk/music/dto/Playlist;)Z

    move-result v2

    invoke-direct {v0, p1, p0, v1, v2}, Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet$Builder;-><init>(Lcom/vk/music/dto/Playlist;Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;ZZ)V

    iget-object v1, p0, Lcom/vk/music/view/PlaylistsContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistsContainer;

    iget-object v1, v1, Lcom/vk/music/view/PlaylistsContainer;->activity:Landroid/app/Activity;

    .line 181
    invoke-virtual {v0, v1}, Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet$Builder;->show(Landroid/app/Activity;)V

    .line 182
    return-void
.end method

.method public onRefresh()V
    .locals 1

    .prologue
    .line 155
    iget-object v0, p0, Lcom/vk/music/view/PlaylistsContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistsContainer;

    iget-object v0, v0, Lcom/vk/music/view/PlaylistsContainer;->model:Lcom/vk/music/model/PlaylistsModel;

    invoke-interface {v0}, Lcom/vk/music/model/PlaylistsModel;->loadPlaylists()V

    .line 156
    return-void
.end method
