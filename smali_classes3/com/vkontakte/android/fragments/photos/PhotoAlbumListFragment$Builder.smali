.class public Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$Builder;
.super Lcom/vkontakte/android/navigation/Navigator;
.source "PhotoAlbumListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 67
    const-class v0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;)V

    .line 68
    return-void
.end method


# virtual methods
.method public setSelectAlbumMode()Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$Builder;
    .locals 3

    .prologue
    .line 76
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "select_album"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 77
    return-object p0
.end method

.method public setSelectMode()Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$Builder;
    .locals 3

    .prologue
    .line 71
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "select"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 72
    return-object p0
.end method
