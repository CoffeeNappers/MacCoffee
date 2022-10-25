.class Lcom/vk/music/view/PlaylistContainer$1;
.super Ljava/lang/Object;
.source "PlaylistContainer.java"

# interfaces
.implements Lcom/vk/music/view/adapter/TotalFooterCreatorBinder$Interactor;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/music/view/PlaylistContainer;-><init>(Landroid/content/Context;Lcom/vk/music/model/PlaylistModel;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/music/view/PlaylistContainer;

.field final synthetic val$model:Lcom/vk/music/model/PlaylistModel;


# direct methods
.method constructor <init>(Lcom/vk/music/view/PlaylistContainer;Lcom/vk/music/model/PlaylistModel;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/music/view/PlaylistContainer;

    .prologue
    .line 489
    iput-object p1, p0, Lcom/vk/music/view/PlaylistContainer$1;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iput-object p2, p0, Lcom/vk/music/view/PlaylistContainer$1;->val$model:Lcom/vk/music/model/PlaylistModel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getLayoutInflater()Landroid/view/LayoutInflater;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 493
    iget-object v0, p0, Lcom/vk/music/view/PlaylistContainer$1;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v0, v0, Lcom/vk/music/view/PlaylistContainer;->inflater:Landroid/view/LayoutInflater;

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
    .line 505
    iget-object v0, p0, Lcom/vk/music/view/PlaylistContainer$1;->val$model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v0}, Lcom/vk/music/model/PlaylistModel;->getMusicTracks()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getResourcer()Lcom/vk/core/util/Resourcer;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 499
    iget-object v0, p0, Lcom/vk/music/view/PlaylistContainer$1;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v0, v0, Lcom/vk/music/view/PlaylistContainer;->resourcer:Lcom/vk/core/util/Resourcer;

    return-object v0
.end method
