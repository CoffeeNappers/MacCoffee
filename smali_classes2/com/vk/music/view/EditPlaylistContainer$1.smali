.class Lcom/vk/music/view/EditPlaylistContainer$1;
.super Ljava/lang/Object;
.source "EditPlaylistContainer.java"

# interfaces
.implements Lcom/vk/music/view/adapter/TotalFooterCreatorBinder$Interactor;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/music/view/EditPlaylistContainer;-><init>(Landroid/content/Context;Lcom/vk/music/model/EditPlaylistModel;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/music/view/EditPlaylistContainer;

.field final synthetic val$model:Lcom/vk/music/model/EditPlaylistModel;


# direct methods
.method constructor <init>(Lcom/vk/music/view/EditPlaylistContainer;Lcom/vk/music/model/EditPlaylistModel;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/music/view/EditPlaylistContainer;

    .prologue
    .line 297
    iput-object p1, p0, Lcom/vk/music/view/EditPlaylistContainer$1;->this$0:Lcom/vk/music/view/EditPlaylistContainer;

    iput-object p2, p0, Lcom/vk/music/view/EditPlaylistContainer$1;->val$model:Lcom/vk/music/model/EditPlaylistModel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getLayoutInflater()Landroid/view/LayoutInflater;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 301
    iget-object v0, p0, Lcom/vk/music/view/EditPlaylistContainer$1;->this$0:Lcom/vk/music/view/EditPlaylistContainer;

    iget-object v0, v0, Lcom/vk/music/view/EditPlaylistContainer;->inflater:Landroid/view/LayoutInflater;

    return-object v0
.end method

.method public getMusicTracks()Ljava/util/List;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;"
        }
    .end annotation

    .prologue
    .line 313
    iget-object v0, p0, Lcom/vk/music/view/EditPlaylistContainer$1;->val$model:Lcom/vk/music/model/EditPlaylistModel;

    invoke-interface {v0}, Lcom/vk/music/model/EditPlaylistModel;->getMusicTracks()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getResourcer()Lcom/vk/core/util/Resourcer;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 307
    iget-object v0, p0, Lcom/vk/music/view/EditPlaylistContainer$1;->this$0:Lcom/vk/music/view/EditPlaylistContainer;

    iget-object v0, v0, Lcom/vk/music/view/EditPlaylistContainer;->resourcer:Lcom/vk/core/util/Resourcer;

    return-object v0
.end method
