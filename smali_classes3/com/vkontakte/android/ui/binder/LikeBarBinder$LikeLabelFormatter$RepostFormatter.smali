.class final Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter$RepostFormatter;
.super Ljava/lang/Object;
.source "LikeBarBinder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "RepostFormatter"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 164
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method format(ILjava/util/List;)Ljava/lang/String;
    .locals 11
    .param p1, "count"    # I
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x1L
        .end annotation
    .end param
    .param p2    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation

        .annotation build Landroid/support/annotation/Size;
            min = 0x1L
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/data/LikeInfo;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .local p2, "likes":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/data/LikeInfo;>;"
    const v6, 0x7f08051a

    const/4 v10, 0x2

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 168
    sget-object v3, Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter;->isFriend:Lcom/vkontakte/android/functions/Predicate;

    invoke-static {p2, v3}, Lcom/vk/core/util/CollectionUtils;->count(Ljava/util/List;Lcom/vkontakte/android/functions/Predicate;)I

    move-result v1

    .line 169
    .local v1, "friendsCount":I
    sub-int v0, p1, v1

    .line 170
    .local v0, "fixedCount":I
    if-ne v1, v9, :cond_3

    .line 171
    if-ne p1, v1, :cond_1

    .line 172
    invoke-interface {p2, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/data/LikeInfo;

    .line 173
    .local v2, "like":Lcom/vkontakte/android/data/LikeInfo;
    sget-object v3, Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter;->isMale:Lcom/vkontakte/android/functions/Predicate;

    invoke-interface {v3, v2}, Lcom/vkontakte/android/functions/Predicate;->f(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 175
    sget-object v3, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const v4, 0x7f080519

    new-array v5, v9, [Ljava/lang/Object;

    sget-object v6, Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter;->formatUserFull:Lcom/vkontakte/android/functions/F1;

    invoke-interface {v6, v2}, Lcom/vkontakte/android/functions/F1;->f(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    aput-object v6, v5, v8

    invoke-virtual {v3, v4, v5}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 209
    .end local v2    # "like":Lcom/vkontakte/android/data/LikeInfo;
    :goto_0
    return-object v3

    .line 178
    .restart local v2    # "like":Lcom/vkontakte/android/data/LikeInfo;
    :cond_0
    sget-object v3, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const v4, 0x7f080518

    new-array v5, v9, [Ljava/lang/Object;

    sget-object v6, Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter;->formatUserFull:Lcom/vkontakte/android/functions/F1;

    invoke-interface {v6, v2}, Lcom/vkontakte/android/functions/F1;->f(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    aput-object v6, v5, v8

    invoke-virtual {v3, v4, v5}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 181
    .end local v2    # "like":Lcom/vkontakte/android/data/LikeInfo;
    :cond_1
    sget-object v3, Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter;->isUser:Lcom/vkontakte/android/functions/Predicate;

    sget-object v4, Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter;->isFriend:Lcom/vkontakte/android/functions/Predicate;

    invoke-static {v3, v4}, Lcom/vkontakte/android/functions/Functions;->combineAnd(Lcom/vkontakte/android/functions/Predicate;Lcom/vkontakte/android/functions/Predicate;)Lcom/vkontakte/android/functions/Predicate;

    move-result-object v3

    invoke-static {p2, v3}, Lcom/vk/core/util/CollectionUtils;->findFirst(Ljava/util/List;Lcom/vkontakte/android/functions/Predicate;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/data/LikeInfo;

    .line 182
    .restart local v2    # "like":Lcom/vkontakte/android/data/LikeInfo;
    sget-object v3, Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter;->isMale:Lcom/vkontakte/android/functions/Predicate;

    invoke-interface {v3, v2}, Lcom/vkontakte/android/functions/Predicate;->f(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 184
    sget-object v3, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    new-array v4, v10, [Ljava/lang/Object;

    sget-object v5, Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter;->formatUserFull:Lcom/vkontakte/android/functions/F1;

    invoke-interface {v5, v2}, Lcom/vkontakte/android/functions/F1;->f(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    aput-object v5, v4, v8

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v9

    invoke-virtual {v3, v6, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 187
    :cond_2
    sget-object v3, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    new-array v4, v10, [Ljava/lang/Object;

    sget-object v5, Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter;->formatUserFull:Lcom/vkontakte/android/functions/F1;

    invoke-interface {v5, v2}, Lcom/vkontakte/android/functions/F1;->f(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    aput-object v5, v4, v8

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v9

    invoke-virtual {v3, v6, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 190
    .end local v2    # "like":Lcom/vkontakte/android/data/LikeInfo;
    :cond_3
    if-ne v1, v10, :cond_5

    .line 191
    if-ne p1, v1, :cond_4

    .line 193
    sget-object v3, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const v4, 0x7f08051b

    new-array v5, v10, [Ljava/lang/Object;

    sget-object v6, Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter;->formatUser:Lcom/vkontakte/android/functions/F1;

    invoke-interface {p2, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    invoke-interface {v6, v7}, Lcom/vkontakte/android/functions/F1;->f(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    aput-object v6, v5, v8

    sget-object v6, Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter;->formatUser:Lcom/vkontakte/android/functions/F1;

    invoke-interface {p2, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    invoke-interface {v6, v7}, Lcom/vkontakte/android/functions/F1;->f(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    aput-object v6, v5, v9

    invoke-virtual {v3, v4, v5}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 196
    :cond_4
    sget-object v3, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const v4, 0x7f08051c

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    sget-object v6, Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter;->formatUser:Lcom/vkontakte/android/functions/F1;

    .line 198
    invoke-interface {p2, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    invoke-interface {v6, v7}, Lcom/vkontakte/android/functions/F1;->f(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    aput-object v6, v5, v8

    sget-object v6, Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter;->formatUser:Lcom/vkontakte/android/functions/F1;

    .line 199
    invoke-interface {p2, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    invoke-interface {v6, v7}, Lcom/vkontakte/android/functions/F1;->f(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    aput-object v6, v5, v9

    .line 200
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v10

    .line 196
    invoke-virtual {v3, v4, v5}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    goto/16 :goto_0

    .line 204
    :cond_5
    sget-object v3, Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter;->isNotUser:Lcom/vkontakte/android/functions/Predicate;

    invoke-static {p2, v3}, Lcom/vk/core/util/CollectionUtils;->count(Ljava/util/List;Lcom/vkontakte/android/functions/Predicate;)I

    move-result v3

    if-ne p1, v3, :cond_6

    .line 206
    sget-object v3, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0d0049

    new-array v5, v9, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v8

    invoke-virtual {v3, v4, v0, v5}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    goto/16 :goto_0

    .line 209
    :cond_6
    sget-object v3, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0d004a

    new-array v5, v9, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v8

    invoke-virtual {v3, v4, v0, v5}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    goto/16 :goto_0
.end method
