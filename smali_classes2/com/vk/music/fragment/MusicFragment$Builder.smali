.class public final Lcom/vk/music/fragment/MusicFragment$Builder;
.super Lcom/vkontakte/android/navigation/Navigator;
.source "MusicFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/fragment/MusicFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 39
    const-class v0, Lcom/vk/music/fragment/MusicFragment;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;)V

    .line 40
    return-void
.end method


# virtual methods
.method public catalogBlockId(Lcom/vk/music/dto/Section;)Lcom/vk/music/fragment/MusicFragment$Builder;
    .locals 2
    .param p1, "section"    # Lcom/vk/music/dto/Section;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/vk/music/fragment/MusicFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "catalogBlock"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 49
    return-object p0
.end method

.method public ownerId(I)Lcom/vk/music/fragment/MusicFragment$Builder;
    .locals 2
    .param p1, "ownerId"    # I

    .prologue
    .line 43
    iget-object v0, p0, Lcom/vk/music/fragment/MusicFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "ownerId"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 44
    return-object p0
.end method

.method public sectionRecommended()Lcom/vk/music/fragment/MusicFragment$Builder;
    .locals 3

    .prologue
    .line 53
    iget-object v0, p0, Lcom/vk/music/fragment/MusicFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "section"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 54
    return-object p0
.end method

.method public setOwnerImage(Ljava/lang/String;)Lcom/vk/music/fragment/MusicFragment$Builder;
    .locals 2
    .param p1, "image"    # Ljava/lang/String;

    .prologue
    .line 58
    iget-object v0, p0, Lcom/vk/music/fragment/MusicFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "ownerImage"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    return-object p0
.end method

.method public setOwnerNameFull(Ljava/lang/String;)Lcom/vk/music/fragment/MusicFragment$Builder;
    .locals 2
    .param p1, "fullName"    # Ljava/lang/String;

    .prologue
    .line 68
    iget-object v0, p0, Lcom/vk/music/fragment/MusicFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "ownerNameFull"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    return-object p0
.end method

.method public setOwnerNameGen(Ljava/lang/String;)Lcom/vk/music/fragment/MusicFragment$Builder;
    .locals 2
    .param p1, "nameGen"    # Ljava/lang/String;

    .prologue
    .line 63
    iget-object v0, p0, Lcom/vk/music/fragment/MusicFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "ownerNameGen"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    return-object p0
.end method
