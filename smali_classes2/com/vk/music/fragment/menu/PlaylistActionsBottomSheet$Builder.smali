.class public final Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet$Builder;
.super Lcom/vk/music/fragment/menu/ActionsBottomSheet$ArgsBuilder;
.source "PlaylistActionsBottomSheet.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vk/music/fragment/menu/ActionsBottomSheet$ArgsBuilder",
        "<",
        "Lcom/vk/music/dto/Playlist;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/vk/music/dto/Playlist;Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;ZZ)V
    .locals 3
    .param p1, "playlist"    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "canAdd"    # Z
    .param p4, "canRemove"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vk/music/dto/Playlist;",
            "Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback",
            "<",
            "Lcom/vk/music/dto/Playlist;",
            ">;ZZ)V"
        }
    .end annotation

    .prologue
    .line 25
    .local p2, "callback":Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;, "Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback<Lcom/vk/music/dto/Playlist;>;"
    invoke-direct {p0, p1}, Lcom/vk/music/fragment/menu/ActionsBottomSheet$ArgsBuilder;-><init>(Landroid/os/Parcelable;)V

    .line 26
    invoke-virtual {p0, p2}, Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet$Builder;->callback(Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;)V

    .line 27
    if-eqz p3, :cond_1

    .line 28
    const v0, 0x7f10005e

    const v1, 0x7f02015f

    const v2, 0x7f08039d

    invoke-virtual {p0, v0, v1, v2}, Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet$Builder;->addAction(III)V

    .line 32
    :cond_0
    :goto_0
    const v0, 0x7f100061

    const v1, 0x7f02021e

    const v2, 0x7f0803ba

    invoke-virtual {p0, v0, v1, v2}, Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet$Builder;->addAction(III)V

    .line 33
    const v0, 0x7f100064

    const v1, 0x7f020288

    const v2, 0x7f0803eb

    invoke-virtual {p0, v0, v1, v2}, Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet$Builder;->addAction(III)V

    .line 34
    return-void

    .line 29
    :cond_1
    if-eqz p4, :cond_0

    .line 30
    const v0, 0x7f100063

    const v1, 0x7f020151

    const v2, 0x7f0803de

    invoke-virtual {p0, v0, v1, v2}, Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet$Builder;->addAction(III)V

    goto :goto_0
.end method


# virtual methods
.method public bridge synthetic callback(Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;)V
    .locals 0
    .param p1    # Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 22
    invoke-super {p0, p1}, Lcom/vk/music/fragment/menu/ActionsBottomSheet$ArgsBuilder;->callback(Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;)V

    return-void
.end method

.method public show(Landroid/app/Activity;)V
    .locals 3
    .param p1, "activity"    # Landroid/app/Activity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 37
    instance-of v2, p1, Landroid/support/v7/app/AppCompatActivity;

    if-eqz v2, :cond_0

    .line 38
    check-cast p1, Landroid/support/v7/app/AppCompatActivity;

    .end local p1    # "activity":Landroid/app/Activity;
    invoke-virtual {p1}, Landroid/support/v7/app/AppCompatActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    .line 39
    .local v1, "fragmentManager":Landroid/support/v4/app/FragmentManager;
    invoke-static {v1}, Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet;->access$000(Landroid/support/v4/app/FragmentManager;)Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet;

    move-result-object v0

    .line 40
    .local v0, "bottomSheet":Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet;
    if-nez v0, :cond_0

    .line 41
    new-instance v0, Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet;

    .end local v0    # "bottomSheet":Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet;
    invoke-direct {v0}, Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet;-><init>()V

    .line 42
    .restart local v0    # "bottomSheet":Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet;
    invoke-virtual {p0}, Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet$Builder;->build()Landroid/os/Bundle;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet;->setArguments(Landroid/os/Bundle;)V

    .line 43
    iget-object v2, p0, Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet$Builder;->callback:Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;

    invoke-virtual {v0, v2}, Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet;->setCallback(Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;)V

    .line 44
    invoke-static {}, Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet;->access$100()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet;->show(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)V

    .line 47
    .end local v0    # "bottomSheet":Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet;
    .end local v1    # "fragmentManager":Landroid/support/v4/app/FragmentManager;
    :cond_0
    return-void
.end method
