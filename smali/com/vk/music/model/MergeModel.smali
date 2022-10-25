.class public Lcom/vk/music/model/MergeModel;
.super Ljava/lang/Object;
.source "MergeModel.java"

# interfaces
.implements Lcom/vk/music/model/ActiveModel;


# instance fields
.field private final models:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vk/music/model/ActiveModel;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public varargs constructor <init>([Lcom/vk/music/model/ActiveModel;)V
    .locals 1
    .param p1, "models"    # [Lcom/vk/music/model/ActiveModel;

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    invoke-static {p1}, Lcom/vk/core/util/CollectionUtils;->listOf([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/model/MergeModel;->models:Ljava/util/List;

    .line 19
    return-void
.end method


# virtual methods
.method public clearCallbacks()V
    .locals 3

    .prologue
    .line 49
    iget-object v1, p0, Lcom/vk/music/model/MergeModel;->models:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/music/model/ActiveModel;

    .line 50
    .local v0, "model":Lcom/vk/music/model/ActiveModel;
    invoke-interface {v0}, Lcom/vk/music/model/ActiveModel;->clearCallbacks()V

    goto :goto_0

    .line 52
    .end local v0    # "model":Lcom/vk/music/model/ActiveModel;
    :cond_0
    return-void
.end method

.method protected final model(I)Ljava/lang/Object;
    .locals 1
    .param p1, "i"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(I)TT;"
        }
    .end annotation

    .prologue
    .line 22
    iget-object v0, p0, Lcom/vk/music/model/MergeModel;->models:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public release()V
    .locals 3

    .prologue
    .line 56
    iget-object v1, p0, Lcom/vk/music/model/MergeModel;->models:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/music/model/ActiveModel;

    .line 57
    .local v0, "model":Lcom/vk/music/model/ActiveModel;
    invoke-interface {v0}, Lcom/vk/music/model/ActiveModel;->release()V

    goto :goto_0

    .line 59
    .end local v0    # "model":Lcom/vk/music/model/ActiveModel;
    :cond_0
    return-void
.end method

.method public restore(Landroid/os/Bundle;)V
    .locals 7
    .param p1, "state"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 28
    const/4 v0, 0x0

    .line 29
    .local v0, "i":I
    iget-object v4, p0, Lcom/vk/music/model/MergeModel;->models:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vk/music/model/ActiveModel;

    .line 30
    .local v2, "model":Lcom/vk/music/model/ActiveModel;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "s"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    add-int/lit8 v1, v0, 0x1

    .end local v0    # "i":I
    .local v1, "i":I
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v3

    .local v3, "s":Landroid/os/Bundle;
    if-eqz v3, :cond_0

    .line 31
    invoke-interface {v2, v3}, Lcom/vk/music/model/ActiveModel;->restore(Landroid/os/Bundle;)V

    :cond_0
    move v0, v1

    .line 33
    .end local v1    # "i":I
    .restart local v0    # "i":I
    goto :goto_0

    .line 34
    .end local v2    # "model":Lcom/vk/music/model/ActiveModel;
    .end local v3    # "s":Landroid/os/Bundle;
    :cond_1
    return-void
.end method

.method public save()Landroid/os/Bundle;
    .locals 7
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 39
    new-instance v3, Landroid/os/Bundle;

    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    .line 40
    .local v3, "state":Landroid/os/Bundle;
    const/4 v0, 0x0

    .line 41
    .local v0, "i":I
    iget-object v4, p0, Lcom/vk/music/model/MergeModel;->models:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vk/music/model/ActiveModel;

    .line 42
    .local v2, "model":Lcom/vk/music/model/ActiveModel;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "s"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    add-int/lit8 v1, v0, 0x1

    .end local v0    # "i":I
    .local v1, "i":I
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2}, Lcom/vk/music/model/ActiveModel;->save()Landroid/os/Bundle;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    move v0, v1

    .line 43
    .end local v1    # "i":I
    .restart local v0    # "i":I
    goto :goto_0

    .line 44
    .end local v2    # "model":Lcom/vk/music/model/ActiveModel;
    :cond_0
    return-object v3
.end method
