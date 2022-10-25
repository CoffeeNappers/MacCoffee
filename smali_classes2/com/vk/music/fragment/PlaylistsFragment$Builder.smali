.class public Lcom/vk/music/fragment/PlaylistsFragment$Builder;
.super Lcom/vkontakte/android/navigation/Navigator;
.source "PlaylistsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/fragment/PlaylistsFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 39
    const-class v0, Lcom/vk/music/fragment/PlaylistsFragment;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;)V

    .line 40
    return-void
.end method


# virtual methods
.method public catalogBlockId(I)Lcom/vk/music/fragment/PlaylistsFragment$Builder;
    .locals 2
    .param p1, "catalogBlockId"    # I

    .prologue
    .line 48
    iget-object v0, p0, Lcom/vk/music/fragment/PlaylistsFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "catalogBlockId"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 49
    return-object p0
.end method

.method public ownerId(I)Lcom/vk/music/fragment/PlaylistsFragment$Builder;
    .locals 2
    .param p1, "ownerId"    # I

    .prologue
    .line 43
    iget-object v0, p0, Lcom/vk/music/fragment/PlaylistsFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "ownerId"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 44
    return-object p0
.end method

.method public select(Z)Lcom/vk/music/fragment/PlaylistsFragment$Builder;
    .locals 2
    .param p1, "val"    # Z

    .prologue
    .line 58
    iget-object v0, p0, Lcom/vk/music/fragment/PlaylistsFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "select"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 59
    return-object p0
.end method

.method public selectMy(Z)Lcom/vk/music/fragment/PlaylistsFragment$Builder;
    .locals 2
    .param p1, "val"    # Z

    .prologue
    .line 63
    invoke-virtual {p0, p1}, Lcom/vk/music/fragment/PlaylistsFragment$Builder;->select(Z)Lcom/vk/music/fragment/PlaylistsFragment$Builder;

    .line 64
    iget-object v0, p0, Lcom/vk/music/fragment/PlaylistsFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "selectMy"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 65
    return-object p0
.end method

.method public title(Ljava/lang/String;)Lcom/vk/music/fragment/PlaylistsFragment$Builder;
    .locals 2
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 53
    iget-object v0, p0, Lcom/vk/music/fragment/PlaylistsFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "title"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    return-object p0
.end method
