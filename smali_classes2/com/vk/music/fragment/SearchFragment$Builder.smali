.class public final Lcom/vk/music/fragment/SearchFragment$Builder;
.super Lcom/vkontakte/android/navigation/Navigator;
.source "SearchFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/fragment/SearchFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 28
    const-class v0, Lcom/vk/music/fragment/SearchFragment;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;)V

    .line 29
    return-void
.end method


# virtual methods
.method public openArtistPage(Z)Lcom/vk/music/fragment/SearchFragment$Builder;
    .locals 2
    .param p1, "val"    # Z

    .prologue
    .line 42
    iget-object v0, p0, Lcom/vk/music/fragment/SearchFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "SearchFragment.arg.openArtistsPage"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 43
    return-object p0
.end method

.method public openResults(Z)Lcom/vk/music/fragment/SearchFragment$Builder;
    .locals 2
    .param p1, "val"    # Z

    .prologue
    .line 37
    iget-object v0, p0, Lcom/vk/music/fragment/SearchFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "SearchFragment.arg.openResults"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 38
    return-object p0
.end method

.method public query(Ljava/lang/String;)Lcom/vk/music/fragment/SearchFragment$Builder;
    .locals 2
    .param p1, "val"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 32
    iget-object v0, p0, Lcom/vk/music/fragment/SearchFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "SearchFragment.arg.query"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    return-object p0
.end method
