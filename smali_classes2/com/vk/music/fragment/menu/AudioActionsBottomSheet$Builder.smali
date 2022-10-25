.class public final Lcom/vk/music/fragment/menu/AudioActionsBottomSheet$Builder;
.super Lcom/vk/music/fragment/menu/ActionsBottomSheet$ArgsBuilder;
.source "AudioActionsBottomSheet.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/fragment/menu/AudioActionsBottomSheet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vk/music/fragment/menu/ActionsBottomSheet$ArgsBuilder",
        "<",
        "Lcom/vkontakte/android/audio/MusicTrack;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/audio/MusicTrack;Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;ZZ)V
    .locals 3
    .param p1, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "canAdd"    # Z
    .param p4, "canRemove"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            "Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;ZZ)V"
        }
    .end annotation

    .prologue
    .line 30
    .local p2, "callback":Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;, "Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback<Lcom/vkontakte/android/audio/MusicTrack;>;"
    invoke-direct {p0, p1}, Lcom/vk/music/fragment/menu/ActionsBottomSheet$ArgsBuilder;-><init>(Landroid/os/Parcelable;)V

    .line 32
    if-eqz p3, :cond_1

    .line 33
    const v0, 0x7f10005e

    const v1, 0x7f02015e

    invoke-virtual {p0, v0, v1}, Lcom/vk/music/fragment/menu/AudioActionsBottomSheet$Builder;->addExtAction(II)V

    .line 37
    :cond_0
    :goto_0
    invoke-virtual {p0, p2}, Lcom/vk/music/fragment/menu/AudioActionsBottomSheet$Builder;->callback(Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;)V

    .line 38
    const v0, 0x7f100065

    const v1, 0x7f0201a0

    invoke-virtual {p0, v0, v1}, Lcom/vk/music/fragment/menu/AudioActionsBottomSheet$Builder;->addExtAction(II)V

    .line 39
    const v0, 0x7f100064

    const v1, 0x7f020288

    invoke-virtual {p0, v0, v1}, Lcom/vk/music/fragment/menu/AudioActionsBottomSheet$Builder;->addExtAction(II)V

    .line 40
    const v0, 0x7f10005f

    const v1, 0x7f02021e

    const v2, 0x7f08039e

    invoke-virtual {p0, v0, v1, v2}, Lcom/vk/music/fragment/menu/AudioActionsBottomSheet$Builder;->addAction(III)V

    .line 41
    const v0, 0x7f100061

    const v1, 0x7f020242

    const v2, 0x7f0803ba

    invoke-virtual {p0, v0, v1, v2}, Lcom/vk/music/fragment/menu/AudioActionsBottomSheet$Builder;->addAction(III)V

    .line 42
    const v0, 0x7f100062

    const v1, 0x7f020290

    const v2, 0x7f0803bb

    invoke-virtual {p0, v0, v1, v2}, Lcom/vk/music/fragment/menu/AudioActionsBottomSheet$Builder;->addAction(III)V

    .line 43
    return-void

    .line 34
    :cond_1
    if-eqz p4, :cond_0

    .line 35
    const v0, 0x7f100063

    const v1, 0x7f020151

    invoke-virtual {p0, v0, v1}, Lcom/vk/music/fragment/menu/AudioActionsBottomSheet$Builder;->addExtAction(II)V

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
    .line 27
    invoke-super {p0, p1}, Lcom/vk/music/fragment/menu/ActionsBottomSheet$ArgsBuilder;->callback(Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;)V

    return-void
.end method

.method public show(Landroid/app/Activity;)V
    .locals 4
    .param p1, "activity"    # Landroid/app/Activity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 46
    instance-of v3, p1, Landroid/support/v7/app/AppCompatActivity;

    if-eqz v3, :cond_0

    .line 47
    check-cast p1, Landroid/support/v7/app/AppCompatActivity;

    .end local p1    # "activity":Landroid/app/Activity;
    invoke-virtual {p1}, Landroid/support/v7/app/AppCompatActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    .line 48
    .local v2, "fragmentManager":Landroid/support/v4/app/FragmentManager;
    invoke-static {v2}, Lcom/vk/music/fragment/menu/AudioActionsBottomSheet;->access$000(Landroid/support/v4/app/FragmentManager;)Lcom/vk/music/fragment/menu/AudioActionsBottomSheet;

    move-result-object v0

    .line 49
    .local v0, "bottomSheet":Lcom/vk/music/fragment/menu/AudioActionsBottomSheet;
    if-nez v0, :cond_0

    .line 50
    new-instance v0, Lcom/vk/music/fragment/menu/AudioActionsBottomSheet;

    .end local v0    # "bottomSheet":Lcom/vk/music/fragment/menu/AudioActionsBottomSheet;
    invoke-direct {v0}, Lcom/vk/music/fragment/menu/AudioActionsBottomSheet;-><init>()V

    .line 51
    .restart local v0    # "bottomSheet":Lcom/vk/music/fragment/menu/AudioActionsBottomSheet;
    invoke-virtual {p0}, Lcom/vk/music/fragment/menu/AudioActionsBottomSheet$Builder;->build()Landroid/os/Bundle;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/vk/music/fragment/menu/AudioActionsBottomSheet;->setArguments(Landroid/os/Bundle;)V

    .line 52
    iget-object v3, p0, Lcom/vk/music/fragment/menu/AudioActionsBottomSheet$Builder;->callback:Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;

    invoke-virtual {v0, v3}, Lcom/vk/music/fragment/menu/AudioActionsBottomSheet;->setCallback(Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;)V

    .line 54
    :try_start_0
    invoke-static {}, Lcom/vk/music/fragment/menu/AudioActionsBottomSheet;->access$100()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/vk/music/fragment/menu/AudioActionsBottomSheet;->show(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 60
    .end local v0    # "bottomSheet":Lcom/vk/music/fragment/menu/AudioActionsBottomSheet;
    .end local v2    # "fragmentManager":Landroid/support/v4/app/FragmentManager;
    :cond_0
    :goto_0
    return-void

    .line 55
    .restart local v0    # "bottomSheet":Lcom/vk/music/fragment/menu/AudioActionsBottomSheet;
    .restart local v2    # "fragmentManager":Landroid/support/v4/app/FragmentManager;
    :catch_0
    move-exception v1

    .line 56
    .local v1, "e":Ljava/lang/IllegalStateException;
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v1, v3}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0
.end method
