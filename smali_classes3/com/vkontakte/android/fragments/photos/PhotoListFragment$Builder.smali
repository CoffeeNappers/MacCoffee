.class public Lcom/vkontakte/android/fragments/photos/PhotoListFragment$Builder;
.super Lcom/vkontakte/android/navigation/Navigator;
.source "PhotoListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/photos/PhotoListFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/api/PhotoAlbum;)V
    .locals 2
    .param p1, "album"    # Lcom/vkontakte/android/api/PhotoAlbum;

    .prologue
    .line 86
    const-class v0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;)V

    .line 87
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "album"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 88
    return-void
.end method


# virtual methods
.method public setSelect(Z)Lcom/vkontakte/android/fragments/photos/PhotoListFragment$Builder;
    .locals 2
    .param p1, "select"    # Z

    .prologue
    .line 91
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "select"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 92
    return-object p0
.end method
