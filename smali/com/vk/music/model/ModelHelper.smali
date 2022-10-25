.class final Lcom/vk/music/model/ModelHelper;
.super Ljava/lang/Object;
.source "ModelHelper.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static varargs clearCallbacksAll([Lcom/vk/music/model/ActiveModel;)V
    .locals 3
    .param p0, "models"    # [Lcom/vk/music/model/ActiveModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 30
    array-length v2, p0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v0, p0, v1

    .line 31
    .local v0, "model":Lcom/vk/music/model/ActiveModel;
    invoke-interface {v0}, Lcom/vk/music/model/ActiveModel;->clearCallbacks()V

    .line 30
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 33
    .end local v0    # "model":Lcom/vk/music/model/ActiveModel;
    :cond_0
    return-void
.end method

.method static varargs releaseAll([Lcom/vk/music/model/ActiveModel;)V
    .locals 3
    .param p0, "models"    # [Lcom/vk/music/model/ActiveModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 36
    array-length v2, p0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v0, p0, v1

    .line 37
    .local v0, "model":Lcom/vk/music/model/ActiveModel;
    invoke-interface {v0}, Lcom/vk/music/model/ActiveModel;->release()V

    .line 36
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 39
    .end local v0    # "model":Lcom/vk/music/model/ActiveModel;
    :cond_0
    return-void
.end method

.method static varargs restoreAll(Landroid/os/Bundle;[Lcom/vk/music/model/ActiveModel;)V
    .locals 8
    .param p0, "b"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "models"    # [Lcom/vk/music/model/ActiveModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 20
    const/4 v0, 0x0

    .line 21
    .local v0, "i":I
    array-length v5, p1

    const/4 v4, 0x0

    move v1, v0

    .end local v0    # "i":I
    .local v1, "i":I
    :goto_0
    if-ge v4, v5, :cond_1

    aget-object v2, p1, v4

    .line 22
    .local v2, "model":Lcom/vk/music/model/ActiveModel;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "s"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    add-int/lit8 v0, v1, 0x1

    .end local v1    # "i":I
    .restart local v0    # "i":I
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v3

    .line 23
    .local v3, "s":Landroid/os/Bundle;
    if-eqz v3, :cond_0

    .line 24
    invoke-interface {v2, v3}, Lcom/vk/music/model/ActiveModel;->restore(Landroid/os/Bundle;)V

    .line 21
    :cond_0
    add-int/lit8 v4, v4, 0x1

    move v1, v0

    .end local v0    # "i":I
    .restart local v1    # "i":I
    goto :goto_0

    .line 27
    .end local v2    # "model":Lcom/vk/music/model/ActiveModel;
    .end local v3    # "s":Landroid/os/Bundle;
    :cond_1
    return-void
.end method

.method static varargs saveAll(Landroid/os/Bundle;[Lcom/vk/music/model/ActiveModel;)V
    .locals 7
    .param p0, "b"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "models"    # [Lcom/vk/music/model/ActiveModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 13
    const/4 v0, 0x0

    .line 14
    .local v0, "i":I
    array-length v4, p1

    const/4 v3, 0x0

    move v1, v0

    .end local v0    # "i":I
    .local v1, "i":I
    :goto_0
    if-ge v3, v4, :cond_0

    aget-object v2, p1, v3

    .line 15
    .local v2, "model":Lcom/vk/music/model/ActiveModel;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "s"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    add-int/lit8 v0, v1, 0x1

    .end local v1    # "i":I
    .restart local v0    # "i":I
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2}, Lcom/vk/music/model/ActiveModel;->save()Landroid/os/Bundle;

    move-result-object v6

    invoke-virtual {p0, v5, v6}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 14
    add-int/lit8 v3, v3, 0x1

    move v1, v0

    .end local v0    # "i":I
    .restart local v1    # "i":I
    goto :goto_0

    .line 17
    .end local v2    # "model":Lcom/vk/music/model/ActiveModel;
    :cond_0
    return-void
.end method
