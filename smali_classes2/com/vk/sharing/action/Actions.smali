.class public final Lcom/vk/sharing/action/Actions;
.super Ljava/lang/Object;
.source "Actions.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 100
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createInfo(Lcom/vk/music/dto/Playlist;)Lcom/vk/sharing/action/ActionsInfo;
    .locals 1
    .param p0, "playlist"    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 65
    new-instance v0, Lcom/vk/sharing/action/ActionsInfo$Builder;

    invoke-direct {v0}, Lcom/vk/sharing/action/ActionsInfo$Builder;-><init>()V

    .line 66
    invoke-virtual {v0}, Lcom/vk/sharing/action/ActionsInfo$Builder;->build()Lcom/vk/sharing/action/ActionsInfo;

    move-result-object v0

    return-object v0
.end method

.method public static createInfo(Lcom/vkontakte/android/NewsEntry;)Lcom/vk/sharing/action/ActionsInfo;
    .locals 6
    .param p0, "entry"    # Lcom/vkontakte/android/NewsEntry;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 22
    const/16 v2, 0x200

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 23
    invoke-static {}, Lcom/vk/sharing/action/Actions;->createInfoExcludeRepost()Lcom/vk/sharing/action/ActionsInfo;

    move-result-object v2

    .line 30
    :goto_0
    return-object v2

    .line 25
    :cond_0
    invoke-virtual {p0, v3}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v0

    .line 26
    .local v0, "canRepost":Z
    iget v2, p0, Lcom/vkontakte/android/NewsEntry;->userID:I

    invoke-static {v2}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v1

    .line 27
    .local v1, "isCurrentUserPost":Z
    new-instance v5, Lcom/vk/sharing/action/ActionsInfo$Builder;

    invoke-direct {v5}, Lcom/vk/sharing/action/ActionsInfo$Builder;-><init>()V

    if-eqz v0, :cond_3

    if-nez v1, :cond_3

    move v2, v3

    .line 28
    :goto_1
    invoke-virtual {v5, v2}, Lcom/vk/sharing/action/ActionsInfo$Builder;->postUserWall(Z)Lcom/vk/sharing/action/ActionsInfo$Builder;

    move-result-object v2

    if-nez v0, :cond_1

    if-eqz v1, :cond_2

    :cond_1
    move v4, v3

    .line 29
    :cond_2
    invoke-virtual {v2, v4}, Lcom/vk/sharing/action/ActionsInfo$Builder;->postGroupWall(Z)Lcom/vk/sharing/action/ActionsInfo$Builder;

    move-result-object v2

    .line 30
    invoke-virtual {v2}, Lcom/vk/sharing/action/ActionsInfo$Builder;->build()Lcom/vk/sharing/action/ActionsInfo;

    move-result-object v2

    goto :goto_0

    :cond_3
    move v2, v4

    .line 27
    goto :goto_1
.end method

.method public static createInfo(Lcom/vkontakte/android/NewsEntry;Lcom/vkontakte/android/NewsComment;)Lcom/vk/sharing/action/ActionsInfo;
    .locals 2
    .param p0, "entry"    # Lcom/vkontakte/android/NewsEntry;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "comment"    # Lcom/vkontakte/android/NewsComment;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 36
    const/16 v1, 0x200

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 37
    invoke-static {}, Lcom/vk/sharing/action/Actions;->createInfoExcludeRepost()Lcom/vk/sharing/action/ActionsInfo;

    move-result-object v1

    .line 43
    :goto_0
    return-object v1

    .line 39
    :cond_0
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v0

    .line 40
    .local v0, "canRepost":Z
    new-instance v1, Lcom/vk/sharing/action/ActionsInfo$Builder;

    invoke-direct {v1}, Lcom/vk/sharing/action/ActionsInfo$Builder;-><init>()V

    .line 41
    invoke-virtual {v1, v0}, Lcom/vk/sharing/action/ActionsInfo$Builder;->postUserWall(Z)Lcom/vk/sharing/action/ActionsInfo$Builder;

    move-result-object v1

    .line 42
    invoke-virtual {v1, v0}, Lcom/vk/sharing/action/ActionsInfo$Builder;->postGroupWall(Z)Lcom/vk/sharing/action/ActionsInfo$Builder;

    move-result-object v1

    .line 43
    invoke-virtual {v1}, Lcom/vk/sharing/action/ActionsInfo$Builder;->build()Lcom/vk/sharing/action/ActionsInfo;

    move-result-object v1

    goto :goto_0
.end method

.method public static createInfo(Lcom/vkontakte/android/Photo;)Lcom/vk/sharing/action/ActionsInfo;
    .locals 2
    .param p0, "photo"    # Lcom/vkontakte/android/Photo;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 49
    new-instance v1, Lcom/vk/sharing/action/ActionsInfo$Builder;

    invoke-direct {v1}, Lcom/vk/sharing/action/ActionsInfo$Builder;-><init>()V

    iget-boolean v0, p0, Lcom/vkontakte/android/Photo;->canRepost:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/vkontakte/android/Photo;->ownerID:I

    .line 50
    invoke-static {v0}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v1, v0}, Lcom/vk/sharing/action/ActionsInfo$Builder;->postUserWall(Z)Lcom/vk/sharing/action/ActionsInfo$Builder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/vkontakte/android/Photo;->canRepost:Z

    .line 51
    invoke-virtual {v0, v1}, Lcom/vk/sharing/action/ActionsInfo$Builder;->postGroupWall(Z)Lcom/vk/sharing/action/ActionsInfo$Builder;

    move-result-object v0

    .line 52
    invoke-virtual {v0}, Lcom/vk/sharing/action/ActionsInfo$Builder;->build()Lcom/vk/sharing/action/ActionsInfo;

    move-result-object v0

    return-object v0

    .line 50
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static createInfo(Lcom/vkontakte/android/api/VideoFile;)Lcom/vk/sharing/action/ActionsInfo;
    .locals 2
    .param p0, "file"    # Lcom/vkontakte/android/api/VideoFile;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 57
    new-instance v1, Lcom/vk/sharing/action/ActionsInfo$Builder;

    invoke-direct {v1}, Lcom/vk/sharing/action/ActionsInfo$Builder;-><init>()V

    iget-boolean v0, p0, Lcom/vkontakte/android/api/VideoFile;->canRepost:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/vkontakte/android/api/VideoFile;->oid:I

    .line 58
    invoke-static {v0}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v1, v0}, Lcom/vk/sharing/action/ActionsInfo$Builder;->postUserWall(Z)Lcom/vk/sharing/action/ActionsInfo$Builder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/vkontakte/android/api/VideoFile;->canRepost:Z

    .line 59
    invoke-virtual {v0, v1}, Lcom/vk/sharing/action/ActionsInfo$Builder;->postGroupWall(Z)Lcom/vk/sharing/action/ActionsInfo$Builder;

    move-result-object v0

    .line 60
    invoke-virtual {v0}, Lcom/vk/sharing/action/ActionsInfo$Builder;->build()Lcom/vk/sharing/action/ActionsInfo;

    move-result-object v0

    return-object v0

    .line 58
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static createInfo(Lcom/vkontakte/android/audio/MusicTrack;)Lcom/vk/sharing/action/ActionsInfo;
    .locals 2
    .param p0, "track"    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 71
    new-instance v0, Lcom/vk/sharing/action/ActionsInfo$Builder;

    invoke-direct {v0}, Lcom/vk/sharing/action/ActionsInfo$Builder;-><init>()V

    const/4 v1, 0x0

    .line 72
    invoke-virtual {v0, v1}, Lcom/vk/sharing/action/ActionsInfo$Builder;->copyLink(Z)Lcom/vk/sharing/action/ActionsInfo$Builder;

    move-result-object v0

    .line 73
    invoke-virtual {v0}, Lcom/vk/sharing/action/ActionsInfo$Builder;->build()Lcom/vk/sharing/action/ActionsInfo;

    move-result-object v0

    return-object v0
.end method

.method public static createInfo(Lcom/vkontakte/android/data/Good;)Lcom/vk/sharing/action/ActionsInfo;
    .locals 2
    .param p0, "good"    # Lcom/vkontakte/android/data/Good;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 78
    new-instance v1, Lcom/vk/sharing/action/ActionsInfo$Builder;

    invoke-direct {v1}, Lcom/vk/sharing/action/ActionsInfo$Builder;-><init>()V

    iget-boolean v0, p0, Lcom/vkontakte/android/data/Good;->can_repost:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/vkontakte/android/data/Good;->owner_id:I

    .line 79
    invoke-static {v0}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v1, v0}, Lcom/vk/sharing/action/ActionsInfo$Builder;->postUserWall(Z)Lcom/vk/sharing/action/ActionsInfo$Builder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/vkontakte/android/data/Good;->can_repost:Z

    .line 80
    invoke-virtual {v0, v1}, Lcom/vk/sharing/action/ActionsInfo$Builder;->postGroupWall(Z)Lcom/vk/sharing/action/ActionsInfo$Builder;

    move-result-object v0

    .line 81
    invoke-virtual {v0}, Lcom/vk/sharing/action/ActionsInfo$Builder;->build()Lcom/vk/sharing/action/ActionsInfo;

    move-result-object v0

    return-object v0

    .line 79
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static createInfoDialogsShareOnly(Ljava/lang/String;)Lcom/vk/sharing/action/ActionsInfo;
    .locals 1
    .param p0, "comment"    # Ljava/lang/String;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 94
    new-instance v0, Lcom/vk/sharing/action/ActionsInfo$Builder;

    invoke-direct {v0}, Lcom/vk/sharing/action/ActionsInfo$Builder;-><init>()V

    .line 95
    invoke-virtual {v0}, Lcom/vk/sharing/action/ActionsInfo$Builder;->disableAllActions()Lcom/vk/sharing/action/ActionsInfo$Builder;

    move-result-object v0

    .line 96
    invoke-virtual {v0, p0}, Lcom/vk/sharing/action/ActionsInfo$Builder;->predefineComment(Ljava/lang/String;)Lcom/vk/sharing/action/ActionsInfo$Builder;

    move-result-object v0

    .line 97
    invoke-virtual {v0}, Lcom/vk/sharing/action/ActionsInfo$Builder;->build()Lcom/vk/sharing/action/ActionsInfo;

    move-result-object v0

    return-object v0
.end method

.method public static createInfoExcludeRepost()Lcom/vk/sharing/action/ActionsInfo;
    .locals 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 86
    new-instance v0, Lcom/vk/sharing/action/ActionsInfo$Builder;

    invoke-direct {v0}, Lcom/vk/sharing/action/ActionsInfo$Builder;-><init>()V

    .line 87
    invoke-virtual {v0, v1}, Lcom/vk/sharing/action/ActionsInfo$Builder;->postUserWall(Z)Lcom/vk/sharing/action/ActionsInfo$Builder;

    move-result-object v0

    .line 88
    invoke-virtual {v0, v1}, Lcom/vk/sharing/action/ActionsInfo$Builder;->postGroupWall(Z)Lcom/vk/sharing/action/ActionsInfo$Builder;

    move-result-object v0

    .line 89
    invoke-virtual {v0}, Lcom/vk/sharing/action/ActionsInfo$Builder;->build()Lcom/vk/sharing/action/ActionsInfo;

    move-result-object v0

    return-object v0
.end method
