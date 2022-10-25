.class final Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter$LikeFormatter;
.super Ljava/lang/Object;
.source "LikeBarBinder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "LikeFormatter"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 124
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method format(ILjava/util/List;)Ljava/lang/String;
    .locals 12
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
    const v11, 0x7f0d0048

    const/4 v10, 0x2

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 128
    sget-object v2, Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter;->isFriend:Lcom/vkontakte/android/functions/Predicate;

    invoke-static {p2, v2}, Lcom/vk/core/util/CollectionUtils;->count(Ljava/util/List;Lcom/vkontakte/android/functions/Predicate;)I

    move-result v1

    .line 129
    .local v1, "friendsCount":I
    sub-int v0, p1, v1

    .line 130
    .local v0, "fixedCount":I
    if-ne v1, v9, :cond_1

    .line 131
    if-ne p1, v1, :cond_0

    .line 133
    sget-object v2, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const v3, 0x7f080512

    new-array v4, v9, [Ljava/lang/Object;

    sget-object v5, Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter;->formatUserFullDat:Lcom/vkontakte/android/functions/F1;

    invoke-interface {p2, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-interface {v5, v6}, Lcom/vkontakte/android/functions/F1;->f(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    aput-object v5, v4, v8

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 156
    :goto_0
    return-object v2

    .line 136
    :cond_0
    sget-object v2, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const v3, 0x7f080513

    new-array v4, v10, [Ljava/lang/Object;

    sget-object v5, Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter;->formatUserFullDat:Lcom/vkontakte/android/functions/F1;

    .line 138
    invoke-interface {p2, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-interface {v5, v6}, Lcom/vkontakte/android/functions/F1;->f(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    aput-object v5, v4, v8

    sget-object v5, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    .line 139
    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    new-array v6, v9, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-virtual {v5, v11, v0, v6}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v9

    .line 136
    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 142
    :cond_1
    if-ne v1, v10, :cond_3

    .line 143
    if-ne p1, v1, :cond_2

    .line 145
    sget-object v2, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const v3, 0x7f080514

    new-array v4, v10, [Ljava/lang/Object;

    sget-object v5, Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter;->formatUserDat:Lcom/vkontakte/android/functions/F1;

    invoke-interface {p2, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-interface {v5, v6}, Lcom/vkontakte/android/functions/F1;->f(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    aput-object v5, v4, v8

    sget-object v5, Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter;->formatUserDat:Lcom/vkontakte/android/functions/F1;

    invoke-interface {p2, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-interface {v5, v6}, Lcom/vkontakte/android/functions/F1;->f(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    aput-object v5, v4, v9

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 148
    :cond_2
    sget-object v2, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const v3, 0x7f080515

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Object;

    sget-object v5, Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter;->formatUserDat:Lcom/vkontakte/android/functions/F1;

    .line 149
    invoke-interface {p2, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-interface {v5, v6}, Lcom/vkontakte/android/functions/F1;->f(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    aput-object v5, v4, v8

    sget-object v5, Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter;->formatUserDat:Lcom/vkontakte/android/functions/F1;

    .line 150
    invoke-interface {p2, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-interface {v5, v6}, Lcom/vkontakte/android/functions/F1;->f(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    aput-object v5, v4, v9

    sget-object v5, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    .line 151
    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    new-array v6, v9, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-virtual {v5, v11, v0, v6}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v10

    .line 148
    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_0

    .line 156
    :cond_3
    sget-object v2, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const v3, 0x7f080511

    new-array v4, v9, [Ljava/lang/Object;

    sget-object v5, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    .line 158
    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    new-array v6, v9, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-virtual {v5, v11, v0, v6}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v8

    .line 156
    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_0
.end method
