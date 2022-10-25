.class Lcom/vk/music/fragment/FragmentDelegateActiveModel;
.super Lcom/vk/music/fragment/FragmentDelegate;
.source "FragmentDelegateActiveModel.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/music/fragment/FragmentDelegateActiveModel$ViewCreator;
    }
.end annotation


# instance fields
.field private final activeModels:[Lcom/vk/music/model/ActiveModel;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private final viewCreator:Lcom/vk/music/fragment/FragmentDelegateActiveModel$ViewCreator;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field


# direct methods
.method varargs constructor <init>(Lcom/vk/music/fragment/FragmentDelegateActiveModel$ViewCreator;[Lcom/vk/music/model/ActiveModel;)V
    .locals 0
    .param p1, "viewCreator"    # Lcom/vk/music/fragment/FragmentDelegateActiveModel$ViewCreator;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "activeModels"    # [Lcom/vk/music/model/ActiveModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 20
    invoke-direct {p0}, Lcom/vk/music/fragment/FragmentDelegate;-><init>()V

    .line 21
    iput-object p1, p0, Lcom/vk/music/fragment/FragmentDelegateActiveModel;->viewCreator:Lcom/vk/music/fragment/FragmentDelegateActiveModel$ViewCreator;

    .line 22
    iput-object p2, p0, Lcom/vk/music/fragment/FragmentDelegateActiveModel;->activeModels:[Lcom/vk/music/model/ActiveModel;

    .line 23
    return-void
.end method


# virtual methods
.method createView()Landroid/view/View;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 32
    iget-object v0, p0, Lcom/vk/music/fragment/FragmentDelegateActiveModel;->viewCreator:Lcom/vk/music/fragment/FragmentDelegateActiveModel$ViewCreator;

    invoke-interface {v0, p0}, Lcom/vk/music/fragment/FragmentDelegateActiveModel$ViewCreator;->createView(Lcom/vk/music/fragment/FragmentDelegateActiveModel;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method destroy()V
    .locals 4

    .prologue
    .line 44
    iget-object v2, p0, Lcom/vk/music/fragment/FragmentDelegateActiveModel;->activeModels:[Lcom/vk/music/model/ActiveModel;

    array-length v3, v2

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v3, :cond_0

    aget-object v0, v2, v1

    .line 45
    .local v0, "model":Lcom/vk/music/model/ActiveModel;
    invoke-interface {v0}, Lcom/vk/music/model/ActiveModel;->release()V

    .line 44
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 47
    .end local v0    # "model":Lcom/vk/music/model/ActiveModel;
    :cond_0
    return-void
.end method

.method destroyView()V
    .locals 4

    .prologue
    .line 37
    iget-object v2, p0, Lcom/vk/music/fragment/FragmentDelegateActiveModel;->activeModels:[Lcom/vk/music/model/ActiveModel;

    array-length v3, v2

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v3, :cond_0

    aget-object v0, v2, v1

    .line 38
    .local v0, "model":Lcom/vk/music/model/ActiveModel;
    invoke-interface {v0}, Lcom/vk/music/model/ActiveModel;->clearCallbacks()V

    .line 37
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 40
    .end local v0    # "model":Lcom/vk/music/model/ActiveModel;
    :cond_0
    return-void
.end method

.method protected model(I)Lcom/vk/music/model/ActiveModel;
    .locals 1
    .param p1, "i"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/vk/music/model/ActiveModel;",
            ">(I)TT;"
        }
    .end annotation

    .prologue
    .line 26
    iget-object v0, p0, Lcom/vk/music/fragment/FragmentDelegateActiveModel;->activeModels:[Lcom/vk/music/model/ActiveModel;

    aget-object v0, v0, p1

    return-object v0
.end method

.method restoreInstanceState(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "state"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 61
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lcom/vk/music/fragment/FragmentDelegateActiveModel;->activeModels:[Lcom/vk/music/model/ActiveModel;

    array-length v2, v2

    if-ge v0, v2, :cond_1

    .line 62
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "s"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    .line 63
    .local v1, "s":Landroid/os/Bundle;
    if-eqz v1, :cond_0

    .line 64
    iget-object v2, p0, Lcom/vk/music/fragment/FragmentDelegateActiveModel;->activeModels:[Lcom/vk/music/model/ActiveModel;

    aget-object v2, v2, v0

    invoke-interface {v2, v1}, Lcom/vk/music/model/ActiveModel;->restore(Landroid/os/Bundle;)V

    .line 61
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 67
    .end local v1    # "s":Landroid/os/Bundle;
    :cond_1
    return-void
.end method

.method saveInstanceState()Landroid/os/Bundle;
    .locals 4
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 52
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 53
    .local v1, "state":Landroid/os/Bundle;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lcom/vk/music/fragment/FragmentDelegateActiveModel;->activeModels:[Lcom/vk/music/model/ActiveModel;

    array-length v2, v2

    if-ge v0, v2, :cond_0

    .line 54
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "s"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/vk/music/fragment/FragmentDelegateActiveModel;->activeModels:[Lcom/vk/music/model/ActiveModel;

    aget-object v3, v3, v0

    invoke-interface {v3}, Lcom/vk/music/model/ActiveModel;->save()Landroid/os/Bundle;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 53
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 56
    :cond_0
    return-object v1
.end method
