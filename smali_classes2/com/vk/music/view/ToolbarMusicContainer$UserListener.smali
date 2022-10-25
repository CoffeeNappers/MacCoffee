.class final Lcom/vk/music/view/ToolbarMusicContainer$UserListener;
.super Lcom/vk/core/widget/LifecycleListener;
.source "ToolbarMusicContainer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/view/ToolbarMusicContainer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "UserListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/music/view/ToolbarMusicContainer;


# direct methods
.method constructor <init>(Lcom/vk/music/view/ToolbarMusicContainer;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/music/view/ToolbarMusicContainer;

    .prologue
    .line 55
    iput-object p1, p0, Lcom/vk/music/view/ToolbarMusicContainer$UserListener;->this$0:Lcom/vk/music/view/ToolbarMusicContainer;

    invoke-direct {p0}, Lcom/vk/core/widget/LifecycleListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onActivityResult(Ljava/lang/String;IILandroid/content/Intent;)V
    .locals 2
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
    .line 58
    invoke-super {p0, p1, p2, p3, p4}, Lcom/vk/core/widget/LifecycleListener;->onActivityResult(Ljava/lang/String;IILandroid/content/Intent;)V

    .line 59
    const/4 v0, -0x1

    if-eq p3, v0, :cond_1

    .line 70
    :cond_0
    :goto_0
    return-void

    .line 63
    :cond_1
    const/16 v0, 0xa

    if-ne p2, v0, :cond_0

    .line 64
    if-eqz p4, :cond_0

    .line 68
    iget-object v0, p0, Lcom/vk/music/view/ToolbarMusicContainer$UserListener;->this$0:Lcom/vk/music/view/ToolbarMusicContainer;

    iget-object v1, v0, Lcom/vk/music/view/ToolbarMusicContainer;->musicContainer:Lcom/vk/music/view/MusicContainer;

    const-string/jumbo v0, "result"

    invoke-virtual {p4, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vk/music/dto/Playlist;

    invoke-virtual {v1, v0}, Lcom/vk/music/view/MusicContainer;->onPlaylistResult(Lcom/vk/music/dto/Playlist;)V

    goto :goto_0
.end method

.method public onActivityStarted(Landroid/app/Activity;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 74
    invoke-super {p0, p1}, Lcom/vk/core/widget/LifecycleListener;->onActivityStarted(Landroid/app/Activity;)V

    .line 75
    return-void
.end method
