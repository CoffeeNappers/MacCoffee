.class public final Lcom/vk/music/view/adapter/ViewRefs;
.super Ljava/lang/Object;
.source "ViewRefs.java"


# instance fields
.field private it:Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Iterator",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private views:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public apply(ILcom/vkontakte/android/functions/VoidF1;)V
    .locals 3
    .param p1, "id"    # I
        .annotation build Landroid/support/annotation/IdRes;
        .end annotation
    .end param
    .param p2    # Lcom/vkontakte/android/functions/VoidF1;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/vkontakte/android/functions/VoidF1",
            "<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 59
    .local p2, "f":Lcom/vkontakte/android/functions/VoidF1;, "Lcom/vkontakte/android/functions/VoidF1<Landroid/view/View;>;"
    iget-object v1, p0, Lcom/vk/music/view/adapter/ViewRefs;->views:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 60
    .local v0, "view":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getId()I

    move-result v2

    if-ne v2, p1, :cond_0

    .line 61
    invoke-interface {p2, v0}, Lcom/vkontakte/android/functions/VoidF1;->f(Ljava/lang/Object;)V

    .line 65
    .end local v0    # "view":Landroid/view/View;
    :cond_1
    return-void
.end method

.method public apply(Lcom/vkontakte/android/functions/VoidF1;)V
    .locals 1
    .param p1    # Lcom/vkontakte/android/functions/VoidF1;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/functions/VoidF1",
            "<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 55
    .local p1, "f":Lcom/vkontakte/android/functions/VoidF1;, "Lcom/vkontakte/android/functions/VoidF1<Landroid/view/View;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lcom/vk/music/view/adapter/ViewRefs;->apply([ILcom/vkontakte/android/functions/VoidF1;)V

    .line 56
    return-void
.end method

.method public apply([ILcom/vkontakte/android/functions/VoidF1;)V
    .locals 7
    .param p1, "excludeIds"    # [I
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Lcom/vkontakte/android/functions/VoidF1;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([I",
            "Lcom/vkontakte/android/functions/VoidF1",
            "<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 38
    .local p2, "f":Lcom/vkontakte/android/functions/VoidF1;, "Lcom/vkontakte/android/functions/VoidF1<Landroid/view/View;>;"
    iget-object v3, p0, Lcom/vk/music/view/adapter/ViewRefs;->views:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    .line 39
    .local v2, "view":Landroid/view/View;
    const/4 v1, 0x0

    .line 40
    .local v1, "skip":Z
    if-eqz p1, :cond_1

    .line 41
    array-length v5, p1

    const/4 v3, 0x0

    :goto_1
    if-ge v3, v5, :cond_1

    aget v0, p1, v3

    .line 42
    .local v0, "excludeId":I
    invoke-virtual {v2}, Landroid/view/View;->getId()I

    move-result v6

    if-ne v0, v6, :cond_2

    .line 43
    const/4 v1, 0x1

    .line 48
    .end local v0    # "excludeId":I
    :cond_1
    if-nez v1, :cond_0

    .line 49
    invoke-interface {p2, v2}, Lcom/vkontakte/android/functions/VoidF1;->f(Ljava/lang/Object;)V

    goto :goto_0

    .line 41
    .restart local v0    # "excludeId":I
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 52
    .end local v0    # "excludeId":I
    .end local v1    # "skip":Z
    .end local v2    # "view":Landroid/view/View;
    :cond_3
    return-void
.end method

.method public next()Landroid/view/View;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/view/View;",
            ">()TT;"
        }
    .end annotation

    .prologue
    .line 33
    iget-object v0, p0, Lcom/vk/music/view/adapter/ViewRefs;->it:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    return-object v0
.end method

.method public put(Landroid/view/View;)Lcom/vk/music/view/adapter/ViewRefs;
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 23
    iget-object v0, p0, Lcom/vk/music/view/adapter/ViewRefs;->views:Ljava/util/List;

    if-nez v0, :cond_0

    .line 24
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/vk/music/view/adapter/ViewRefs;->views:Ljava/util/List;

    .line 25
    iget-object v0, p0, Lcom/vk/music/view/adapter/ViewRefs;->views:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/view/adapter/ViewRefs;->it:Ljava/util/Iterator;

    .line 27
    :cond_0
    iget-object v0, p0, Lcom/vk/music/view/adapter/ViewRefs;->views:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 28
    return-object p0
.end method

.method reset()Lcom/vk/music/view/adapter/ViewRefs;
    .locals 1

    .prologue
    .line 68
    iget-object v0, p0, Lcom/vk/music/view/adapter/ViewRefs;->views:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/view/adapter/ViewRefs;->it:Ljava/util/Iterator;

    .line 69
    return-object p0
.end method
