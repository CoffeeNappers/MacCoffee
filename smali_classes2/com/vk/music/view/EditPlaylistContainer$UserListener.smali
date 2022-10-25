.class Lcom/vk/music/view/EditPlaylistContainer$UserListener;
.super Lcom/vk/core/widget/LifecycleListener;
.source "EditPlaylistContainer.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/vk/music/view/LastReachedScrollListener$OnLastReachedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/view/EditPlaylistContainer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "UserListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/music/view/EditPlaylistContainer;


# direct methods
.method private constructor <init>(Lcom/vk/music/view/EditPlaylistContainer;)V
    .locals 0

    .prologue
    .line 167
    iput-object p1, p0, Lcom/vk/music/view/EditPlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/EditPlaylistContainer;

    invoke-direct {p0}, Lcom/vk/core/widget/LifecycleListener;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vk/music/view/EditPlaylistContainer;Lcom/vk/music/view/EditPlaylistContainer$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vk/music/view/EditPlaylistContainer;
    .param p2, "x1"    # Lcom/vk/music/view/EditPlaylistContainer$1;

    .prologue
    .line 167
    invoke-direct {p0, p1}, Lcom/vk/music/view/EditPlaylistContainer$UserListener;-><init>(Lcom/vk/music/view/EditPlaylistContainer;)V

    return-void
.end method


# virtual methods
.method public onActionClick(Lcom/vkontakte/android/audio/MusicTrack;)V
    .locals 1
    .param p1, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 221
    iget-object v0, p0, Lcom/vk/music/view/EditPlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/EditPlaylistContainer;

    iget-object v0, v0, Lcom/vk/music/view/EditPlaylistContainer;->model:Lcom/vk/music/model/EditPlaylistModel;

    invoke-interface {v0, p1}, Lcom/vk/music/model/EditPlaylistModel;->isTrackAttached(Lcom/vkontakte/android/audio/MusicTrack;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 222
    iget-object v0, p0, Lcom/vk/music/view/EditPlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/EditPlaylistContainer;

    iget-object v0, v0, Lcom/vk/music/view/EditPlaylistContainer;->model:Lcom/vk/music/model/EditPlaylistModel;

    invoke-interface {v0, p1}, Lcom/vk/music/model/EditPlaylistModel;->removeAttachedTrack(Lcom/vkontakte/android/audio/MusicTrack;)V

    .line 223
    iget-object v0, p0, Lcom/vk/music/view/EditPlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/EditPlaylistContainer;

    iget-object v0, v0, Lcom/vk/music/view/EditPlaylistContainer;->musicTracksAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v0, p1}, Lcom/vk/music/view/adapter/ItemAdapter;->removeItem(Ljava/lang/Object;)V

    .line 224
    iget-object v0, p0, Lcom/vk/music/view/EditPlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/EditPlaylistContainer;

    invoke-static {v0}, Lcom/vk/music/view/EditPlaylistContainer;->access$100(Lcom/vk/music/view/EditPlaylistContainer;)V

    .line 225
    iget-object v0, p0, Lcom/vk/music/view/EditPlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/EditPlaylistContainer;

    invoke-static {v0}, Lcom/vk/music/view/EditPlaylistContainer;->access$200(Lcom/vk/music/view/EditPlaylistContainer;)V

    .line 230
    :goto_0
    return-void

    .line 227
    :cond_0
    iget-object v0, p0, Lcom/vk/music/view/EditPlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/EditPlaylistContainer;

    iget-object v0, v0, Lcom/vk/music/view/EditPlaylistContainer;->model:Lcom/vk/music/model/EditPlaylistModel;

    invoke-interface {v0, p1}, Lcom/vk/music/model/EditPlaylistModel;->toggleRemoved(Lcom/vkontakte/android/audio/MusicTrack;)Z

    .line 228
    iget-object v0, p0, Lcom/vk/music/view/EditPlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/EditPlaylistContainer;

    invoke-static {v0, p1}, Lcom/vk/music/view/EditPlaylistContainer;->access$300(Lcom/vk/music/view/EditPlaylistContainer;Lcom/vkontakte/android/audio/MusicTrack;)V

    goto :goto_0
.end method

.method public onActivityResult(Ljava/lang/String;IILandroid/content/Intent;)V
    .locals 7
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
    const/16 v6, 0x64

    .line 171
    invoke-super {p0, p1, p2, p3, p4}, Lcom/vk/core/widget/LifecycleListener;->onActivityResult(Ljava/lang/String;IILandroid/content/Intent;)V

    .line 173
    const/4 v2, -0x1

    if-eq p3, v2, :cond_1

    .line 190
    :cond_0
    :goto_0
    return-void

    .line 177
    :cond_1
    const/16 v2, 0xa

    if-ne p2, v2, :cond_0

    .line 178
    if-eqz p4, :cond_0

    const-string/jumbo v2, "result"

    invoke-virtual {p4, v2}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 179
    const-string/jumbo v2, "result"

    invoke-virtual {p4, v2}, Landroid/content/Intent;->getParcelableArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    .line 180
    .local v1, "musicTracksToAttach":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/audio/MusicTrack;>;"
    iget-object v2, p0, Lcom/vk/music/view/EditPlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/EditPlaylistContainer;

    iget-object v2, v2, Lcom/vk/music/view/EditPlaylistContainer;->model:Lcom/vk/music/model/EditPlaylistModel;

    invoke-interface {v2}, Lcom/vk/music/model/EditPlaylistModel;->getAttached()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->size()I

    move-result v0

    .line 181
    .local v0, "attachedCount":I
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/2addr v2, v0

    if-le v2, v6, :cond_2

    .line 182
    iget-object v2, p0, Lcom/vk/music/view/EditPlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/EditPlaylistContainer;

    iget-object v2, v2, Lcom/vk/music/view/EditPlaylistContainer;->resourcer:Lcom/vk/core/util/Resourcer;

    const v3, 0x7f080404

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Lcom/vk/core/util/Resourcer;->str(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/vk/core/util/ToastUtils;->showToast(Ljava/lang/String;)V

    .line 184
    :cond_2
    iget-object v2, p0, Lcom/vk/music/view/EditPlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/EditPlaylistContainer;

    iget-object v2, v2, Lcom/vk/music/view/EditPlaylistContainer;->model:Lcom/vk/music/model/EditPlaylistModel;

    rsub-int/lit8 v3, v0, 0x64

    invoke-static {v1, v3}, Lcom/vk/core/util/CollectionUtils;->subList(Ljava/util/List;I)Ljava/util/List;

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/vk/music/model/EditPlaylistModel;->attachTracks(Ljava/util/List;)V

    .line 185
    iget-object v2, p0, Lcom/vk/music/view/EditPlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/EditPlaylistContainer;

    iget-object v2, v2, Lcom/vk/music/view/EditPlaylistContainer;->musicTracksAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    iget-object v3, p0, Lcom/vk/music/view/EditPlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/EditPlaylistContainer;

    iget-object v3, v3, Lcom/vk/music/view/EditPlaylistContainer;->model:Lcom/vk/music/model/EditPlaylistModel;

    invoke-interface {v3}, Lcom/vk/music/model/EditPlaylistModel;->getMusicTracks()Ljava/util/List;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/vk/music/view/adapter/ItemAdapter;->setItems(Ljava/util/Collection;)V

    .line 186
    iget-object v2, p0, Lcom/vk/music/view/EditPlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/EditPlaylistContainer;

    invoke-static {v2}, Lcom/vk/music/view/EditPlaylistContainer;->access$100(Lcom/vk/music/view/EditPlaylistContainer;)V

    .line 187
    iget-object v2, p0, Lcom/vk/music/view/EditPlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/EditPlaylistContainer;

    invoke-static {v2}, Lcom/vk/music/view/EditPlaylistContainer;->access$200(Lcom/vk/music/view/EditPlaylistContainer;)V

    goto :goto_0
.end method

.method public onActivityStopped(Landroid/app/Activity;)V
    .locals 2
    .param p1, "activity"    # Landroid/app/Activity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 194
    invoke-super {p0, p1}, Lcom/vk/core/widget/LifecycleListener;->onActivityStopped(Landroid/app/Activity;)V

    .line 195
    iget-object v0, p0, Lcom/vk/music/view/EditPlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/EditPlaylistContainer;

    iget-object v0, v0, Lcom/vk/music/view/EditPlaylistContainer;->model:Lcom/vk/music/model/EditPlaylistModel;

    iget-object v1, p0, Lcom/vk/music/view/EditPlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/EditPlaylistContainer;

    iget-object v1, v1, Lcom/vk/music/view/EditPlaylistContainer;->infoHeaderCreatorBinder:Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;

    invoke-virtual {v1}, Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;->getTitle()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/vk/music/model/EditPlaylistModel;->setTitle(Ljava/lang/String;)V

    .line 196
    iget-object v0, p0, Lcom/vk/music/view/EditPlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/EditPlaylistContainer;

    iget-object v0, v0, Lcom/vk/music/view/EditPlaylistContainer;->model:Lcom/vk/music/model/EditPlaylistModel;

    iget-object v1, p0, Lcom/vk/music/view/EditPlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/EditPlaylistContainer;

    iget-object v1, v1, Lcom/vk/music/view/EditPlaylistContainer;->infoHeaderCreatorBinder:Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;

    invoke-virtual {v1}, Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;->getDescription()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/vk/music/model/EditPlaylistModel;->setDescription(Ljava/lang/String;)V

    .line 197
    return-void
.end method

.method public onAttachMusicClick()V
    .locals 5

    .prologue
    .line 233
    iget-object v0, p0, Lcom/vk/music/view/EditPlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/EditPlaylistContainer;

    iget-object v0, v0, Lcom/vk/music/view/EditPlaylistContainer;->lifecycleHandler:Lcom/vk/core/widget/LifecycleHandler;

    .line 234
    invoke-virtual {p0}, Lcom/vk/music/view/EditPlaylistContainer$UserListener;->getUniqueId()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Landroid/content/Intent;

    iget-object v3, p0, Lcom/vk/music/view/EditPlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/EditPlaylistContainer;

    iget-object v3, v3, Lcom/vk/music/view/EditPlaylistContainer;->activity:Landroid/app/Activity;

    const-class v4, Lcom/vk/music/attach/AttachMusicActivity;

    invoke-direct {v2, v3, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/16 v3, 0xa

    .line 233
    invoke-virtual {v0, v1, v2, v3}, Lcom/vk/core/widget/LifecycleHandler;->startActivityForResult(Ljava/lang/String;Landroid/content/Intent;I)V

    .line 238
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 201
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    .line 211
    :goto_0
    return-void

    .line 203
    :sswitch_0
    iget-object v0, p0, Lcom/vk/music/view/EditPlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/EditPlaylistContainer;

    iget-object v0, v0, Lcom/vk/music/view/EditPlaylistContainer;->activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    goto :goto_0

    .line 206
    :sswitch_1
    iget-object v0, p0, Lcom/vk/music/view/EditPlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/EditPlaylistContainer;

    iget-object v0, v0, Lcom/vk/music/view/EditPlaylistContainer;->model:Lcom/vk/music/model/EditPlaylistModel;

    iget-object v1, p0, Lcom/vk/music/view/EditPlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/EditPlaylistContainer;

    iget-object v1, v1, Lcom/vk/music/view/EditPlaylistContainer;->infoHeaderCreatorBinder:Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;

    invoke-virtual {v1}, Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;->getTitle()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/vk/music/model/EditPlaylistModel;->setTitle(Ljava/lang/String;)V

    .line 207
    iget-object v0, p0, Lcom/vk/music/view/EditPlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/EditPlaylistContainer;

    iget-object v0, v0, Lcom/vk/music/view/EditPlaylistContainer;->model:Lcom/vk/music/model/EditPlaylistModel;

    iget-object v1, p0, Lcom/vk/music/view/EditPlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/EditPlaylistContainer;

    iget-object v1, v1, Lcom/vk/music/view/EditPlaylistContainer;->infoHeaderCreatorBinder:Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;

    invoke-virtual {v1}, Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;->getDescription()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/vk/music/model/EditPlaylistModel;->setDescription(Ljava/lang/String;)V

    .line 208
    iget-object v0, p0, Lcom/vk/music/view/EditPlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/EditPlaylistContainer;

    iget-object v0, v0, Lcom/vk/music/view/EditPlaylistContainer;->model:Lcom/vk/music/model/EditPlaylistModel;

    invoke-interface {v0}, Lcom/vk/music/model/EditPlaylistModel;->savePlaylist()V

    goto :goto_0

    .line 201
    :sswitch_data_0
    .sparse-switch
        0x7f10029a -> :sswitch_0
        0x7f1003ca -> :sswitch_1
    .end sparse-switch
.end method

.method public onLastReached()V
    .locals 1

    .prologue
    .line 215
    iget-object v0, p0, Lcom/vk/music/view/EditPlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/EditPlaylistContainer;

    iget-object v0, v0, Lcom/vk/music/view/EditPlaylistContainer;->model:Lcom/vk/music/model/EditPlaylistModel;

    invoke-interface {v0}, Lcom/vk/music/model/EditPlaylistModel;->canLoadMore()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 216
    iget-object v0, p0, Lcom/vk/music/view/EditPlaylistContainer$UserListener;->this$0:Lcom/vk/music/view/EditPlaylistContainer;

    iget-object v0, v0, Lcom/vk/music/view/EditPlaylistContainer;->model:Lcom/vk/music/model/EditPlaylistModel;

    invoke-interface {v0}, Lcom/vk/music/model/EditPlaylistModel;->loadMore()V

    .line 218
    :cond_0
    return-void
.end method
