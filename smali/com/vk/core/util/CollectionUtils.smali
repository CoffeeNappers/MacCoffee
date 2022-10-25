.class public final Lcom/vk/core/util/CollectionUtils;
.super Ljava/lang/Object;
.source "CollectionUtils.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static arrayOf(Ljava/util/Collection;)Ljava/util/ArrayList;
    .locals 1
    .param p0    # Ljava/util/Collection;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Collection",
            "<TT;>;)",
            "Ljava/util/ArrayList",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 39
    .local p0, "c":Ljava/util/Collection;, "Ljava/util/Collection<TT;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 40
    .local v0, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<TT;>;"
    if-eqz p0, :cond_0

    .line 41
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 43
    :cond_0
    return-object v0
.end method

.method public static varargs arrayOf([Ljava/lang/Object;)Ljava/util/ArrayList;
    .locals 1
    .param p0    # [Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)",
            "Ljava/util/ArrayList",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Ljava/lang/SafeVarargs;
    .end annotation

    .prologue
    .line 32
    .local p0, "items":[Ljava/lang/Object;, "[TT;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 33
    .local v0, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<TT;>;"
    invoke-static {v0, p0}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 34
    return-object v0
.end method

.method public static count(Ljava/util/Collection;)I
    .locals 1
    .param p0, "c"    # Ljava/util/Collection;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 118
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/vk/core/util/CollectionUtils;->count(Ljava/util/Collection;I)I

    move-result v0

    return v0
.end method

.method public static count(Ljava/util/Collection;I)I
    .locals 0
    .param p0, "c"    # Ljava/util/Collection;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p1, "defVal"    # I

    .prologue
    .line 122
    if-eqz p0, :cond_0

    invoke-interface {p0}, Ljava/util/Collection;->size()I

    move-result p1

    .end local p1    # "defVal":I
    :cond_0
    return p1
.end method

.method public static count(Ljava/util/List;Lcom/vkontakte/android/functions/Predicate;)I
    .locals 4
    .param p0    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Lcom/vkontakte/android/functions/Predicate;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List",
            "<TT;>;",
            "Lcom/vkontakte/android/functions/Predicate",
            "<TT;>;)I"
        }
    .end annotation

    .prologue
    .line 89
    .local p0, "src":Ljava/util/List;, "Ljava/util/List<TT;>;"
    .local p1, "p":Lcom/vkontakte/android/functions/Predicate;, "Lcom/vkontakte/android/functions/Predicate<TT;>;"
    const/4 v0, 0x0

    .line 90
    .local v0, "count":I
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 91
    .local v1, "t":Ljava/lang/Object;, "TT;"
    invoke-interface {p1, v1}, Lcom/vkontakte/android/functions/Predicate;->f(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 92
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 95
    .end local v1    # "t":Ljava/lang/Object;, "TT;"
    :cond_1
    return v0
.end method

.method public static varargs count([Ljava/util/Collection;)I
    .locals 5
    .param p0, "c"    # [Ljava/util/Collection;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 126
    const/4 v1, 0x0

    .line 127
    .local v1, "count":I
    if-eqz p0, :cond_0

    .line 128
    array-length v3, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v0, p0, v2

    .line 129
    .local v0, "collection":Ljava/util/Collection;
    invoke-static {v0}, Lcom/vk/core/util/CollectionUtils;->count(Ljava/util/Collection;)I

    move-result v4

    add-int/2addr v1, v4

    .line 128
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 132
    .end local v0    # "collection":Ljava/util/Collection;
    :cond_0
    return v1
.end method

.method public static countIfNotGreater(Ljava/util/Collection;I)I
    .locals 1
    .param p0, "c"    # Ljava/util/Collection;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p1, "countToCompare"    # I

    .prologue
    .line 156
    invoke-static {p0, p1, p1}, Lcom/vk/core/util/CollectionUtils;->countIfNotGreater(Ljava/util/Collection;II)I

    move-result v0

    return v0
.end method

.method public static countIfNotGreater(Ljava/util/Collection;II)I
    .locals 1
    .param p0, "c"    # Ljava/util/Collection;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p1, "countToCompare"    # I
    .param p2, "defVal"    # I

    .prologue
    .line 151
    invoke-static {p0}, Lcom/vk/core/util/CollectionUtils;->count(Ljava/util/Collection;)I

    move-result v0

    .line 152
    .local v0, "count":I
    if-gt v0, p1, :cond_0

    .end local v0    # "count":I
    :goto_0
    return v0

    .restart local v0    # "count":I
    :cond_0
    move v0, p2

    goto :goto_0
.end method

.method public static countIfNotLess(Ljava/util/Collection;I)I
    .locals 1
    .param p0, "c"    # Ljava/util/Collection;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p1, "countToCompare"    # I

    .prologue
    .line 144
    invoke-static {p0, p1, p1}, Lcom/vk/core/util/CollectionUtils;->countIfNotLess(Ljava/util/Collection;II)I

    move-result v0

    return v0
.end method

.method public static countIfNotLess(Ljava/util/Collection;II)I
    .locals 1
    .param p0, "c"    # Ljava/util/Collection;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p1, "countToCompare"    # I
    .param p2, "defVal"    # I

    .prologue
    .line 139
    invoke-static {p0}, Lcom/vk/core/util/CollectionUtils;->count(Ljava/util/Collection;)I

    move-result v0

    .line 140
    .local v0, "count":I
    if-lt v0, p1, :cond_0

    .end local v0    # "count":I
    :goto_0
    return v0

    .restart local v0    # "count":I
    :cond_0
    move v0, p2

    goto :goto_0
.end method

.method public static filter(Ljava/util/List;Lcom/vkontakte/android/functions/Predicate;)Ljava/util/List;
    .locals 4
    .param p0    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Lcom/vkontakte/android/functions/Predicate;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List",
            "<TT;>;",
            "Lcom/vkontakte/android/functions/Predicate",
            "<TT;>;)",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 75
    .local p0, "collection":Ljava/util/List;, "Ljava/util/List<TT;>;"
    .local p1, "p":Lcom/vkontakte/android/functions/Predicate;, "Lcom/vkontakte/android/functions/Predicate<TT;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 76
    .local v1, "result":Ljava/util/List;, "Ljava/util/List<TT;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 79
    .local v0, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<TT;>;"
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 80
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 81
    .local v2, "t":Ljava/lang/Object;, "TT;"
    invoke-interface {p1, v2}, Lcom/vkontakte/android/functions/Predicate;->f(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 82
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 85
    .end local v2    # "t":Ljava/lang/Object;, "TT;"
    :cond_1
    return-object v1
.end method

.method public static findFirst(Ljava/util/List;Lcom/vkontakte/android/functions/Predicate;)Ljava/lang/Object;
    .locals 3
    .param p0    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Lcom/vkontakte/android/functions/Predicate;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List",
            "<TT;>;",
            "Lcom/vkontakte/android/functions/Predicate",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 100
    .local p0, "src":Ljava/util/List;, "Ljava/util/List<TT;>;"
    .local p1, "p":Lcom/vkontakte/android/functions/Predicate;, "Lcom/vkontakte/android/functions/Predicate<TT;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 101
    .local v0, "t":Ljava/lang/Object;, "TT;"
    invoke-interface {p1, v0}, Lcom/vkontakte/android/functions/Predicate;->f(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 106
    .end local v0    # "t":Ljava/lang/Object;, "TT;"
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isEmpty(Ljava/util/Collection;)Z
    .locals 1
    .param p0, "c"    # Ljava/util/Collection;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 110
    if-eqz p0, :cond_0

    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isNotEmpty(Ljava/util/Collection;)Z
    .locals 1
    .param p0, "c"    # Ljava/util/Collection;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 114
    invoke-static {p0}, Lcom/vk/core/util/CollectionUtils;->isEmpty(Ljava/util/Collection;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static varargs listOf([Ljava/lang/Object;)Ljava/util/List;
    .locals 1
    .param p0    # [Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Ljava/lang/SafeVarargs;
    .end annotation

    .prologue
    .line 24
    .local p0, "items":[Ljava/lang/Object;, "[TT;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 25
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<TT;>;"
    invoke-static {v0, p0}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 26
    return-object v0
.end method

.method public static shift(Ljava/util/List;I)V
    .locals 4
    .param p0    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "shift"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List",
            "<TT;>;I)V"
        }
    .end annotation

    .prologue
    .local p0, "list":Ljava/util/List;, "Ljava/util/List<TT;>;"
    const/4 v3, 0x0

    .line 160
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    .line 161
    .local v1, "size":I
    if-lez p1, :cond_1

    .line 162
    if-le p1, v1, :cond_0

    .line 163
    move p1, v1

    .line 165
    :cond_0
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, p1, :cond_3

    .line 166
    const/4 v2, 0x0

    invoke-interface {p0, v3, v2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 165
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 169
    .end local v0    # "i":I
    :cond_1
    neg-int p1, p1

    .line 170
    if-le p1, v1, :cond_2

    .line 171
    move p1, v1

    .line 173
    :cond_2
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_1
    if-ge v0, p1, :cond_3

    .line 174
    invoke-interface {p0, v3}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 173
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 177
    :cond_3
    return-void
.end method

.method public static subList(Ljava/util/List;I)Ljava/util/List;
    .locals 1
    .param p0    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "dstSize"    # I
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List",
            "<TT;>;I)",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 70
    .local p0, "src":Ljava/util/List;, "Ljava/util/List<TT;>;"
    const/4 v0, 0x0

    invoke-static {p0, v0, p1}, Lcom/vk/core/util/CollectionUtils;->subList(Ljava/util/List;II)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public static subList(Ljava/util/List;II)Ljava/util/List;
    .locals 4
    .param p0    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "from"    # I
    .param p2, "to"    # I
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List",
            "<TT;>;II)",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 48
    .local p0, "src":Ljava/util/List;, "Ljava/util/List<TT;>;"
    if-gez p1, :cond_0

    .line 49
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v3, "Argument \'from\' must be positive"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 51
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v2

    if-le p2, v2, :cond_1

    .line 52
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p2

    .line 54
    :cond_1
    if-le p1, p2, :cond_2

    .line 55
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v3, "Argument \'from\' must be less or equal to argument \'to\'"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 57
    :cond_2
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 58
    .local v0, "dst":Ljava/util/List;, "Ljava/util/List<TT;>;"
    sub-int v2, p2, p1

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v3

    if-ne v2, v3, :cond_4

    .line 59
    invoke-interface {v0, p0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 65
    :cond_3
    return-object v0

    .line 61
    :cond_4
    move v1, p1

    .local v1, "i":I
    :goto_0
    if-ge v1, p2, :cond_3

    .line 62
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 61
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method
