.class public Lcom/vkontakte/android/fragments/MusicCatalogBlockProfilesFragment$Builder;
.super Lcom/vkontakte/android/navigation/Navigator;
.source "MusicCatalogBlockProfilesFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/MusicCatalogBlockProfilesFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# direct methods
.method public constructor <init>(I)V
    .locals 2
    .param p1, "catalogBlockId"    # I

    .prologue
    .line 26
    const-class v0, Lcom/vkontakte/android/fragments/MusicCatalogBlockProfilesFragment;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;)V

    .line 27
    iget-object v0, p0, Lcom/vkontakte/android/fragments/MusicCatalogBlockProfilesFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "catalogBlockId"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 28
    return-void
.end method


# virtual methods
.method public title(Ljava/lang/String;)Lcom/vkontakte/android/fragments/MusicCatalogBlockProfilesFragment$Builder;
    .locals 2
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/vkontakte/android/fragments/MusicCatalogBlockProfilesFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "title"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    return-object p0
.end method
