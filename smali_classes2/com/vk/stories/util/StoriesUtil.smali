.class public Lcom/vk/stories/util/StoriesUtil;
.super Ljava/lang/Object;
.source "StoriesUtil.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static filterStories(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/stories/model/StoriesContainer;",
            ">;)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/stories/model/StoriesContainer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 50
    .local p0, "storiesContainers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/stories/model/StoriesContainer;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 51
    .local v1, "res":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/stories/model/StoriesContainer;>;"
    if-eqz p0, :cond_1

    .line 52
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 53
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vk/stories/model/StoriesContainer;

    invoke-virtual {v2}, Lcom/vk/stories/model/StoriesContainer;->hasValidStories()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 54
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 52
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 58
    .end local v0    # "i":I
    :cond_1
    return-object v1
.end method

.method public static filterStoriesWithNewContent(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/stories/model/StoriesContainer;",
            ">;)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/stories/model/StoriesContainer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 35
    .local p0, "storiesContainers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/stories/model/StoriesContainer;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 36
    .local v1, "res":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/stories/model/StoriesContainer;>;"
    if-eqz p0, :cond_2

    .line 37
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 38
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vk/stories/model/StoriesContainer;

    invoke-virtual {v2}, Lcom/vk/stories/model/StoriesContainer;->hasNewStories()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 39
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 37
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 42
    :cond_1
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-nez v2, :cond_2

    .line 43
    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 46
    .end local v0    # "i":I
    :cond_2
    return-object v1
.end method

.method public static findStoryByAuthorId(Ljava/util/ArrayList;I)Lcom/vk/stories/model/StoriesContainer;
    .locals 2
    .param p1, "uid"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/stories/model/StoriesContainer;",
            ">;I)",
            "Lcom/vk/stories/model/StoriesContainer;"
        }
    .end annotation

    .prologue
    .line 62
    .local p0, "storiesContainers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/stories/model/StoriesContainer;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 63
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vk/stories/model/StoriesContainer;

    invoke-virtual {v1}, Lcom/vk/stories/model/StoriesContainer;->getAuthorId()I

    move-result v1

    if-ne v1, p1, :cond_0

    .line 64
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vk/stories/model/StoriesContainer;

    .line 67
    :goto_1
    return-object v1

    .line 62
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 67
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public static getCounterText(I)Ljava/lang/String;
    .locals 10
    .param p0, "counterValue"    # I

    .prologue
    const v9, 0xf4240

    const/4 v8, 0x1

    const/4 v7, 0x0

    const v6, 0x3d4ccccd    # 0.05f

    const-wide v4, 0x3fb999999999999aL    # 0.1

    .line 13
    const/16 v2, 0x3e8

    if-ge p0, v2, :cond_0

    .line 14
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    .line 29
    :goto_0
    return-object v2

    .line 15
    :cond_0
    if-ge p0, v9, :cond_2

    .line 16
    int-to-float v2, p0

    const/high16 v3, 0x447a0000    # 1000.0f

    div-float v0, v2, v3

    .line 17
    .local v0, "fValue":F
    div-int/lit16 v1, p0, 0x3e8

    .line 18
    .local v1, "iValue":I
    int-to-float v2, v1

    sub-float v2, v0, v2

    float-to-double v2, v2

    cmpg-double v2, v2, v4

    if-gez v2, :cond_1

    .line 19
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "k"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 21
    :cond_1
    const-string/jumbo v2, "%.1fk"

    new-array v3, v8, [Ljava/lang/Object;

    sub-float v4, v0, v6

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    aput-object v4, v3, v7

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 24
    .end local v0    # "fValue":F
    .end local v1    # "iValue":I
    :cond_2
    int-to-float v2, p0

    const v3, 0x49742400    # 1000000.0f

    div-float v0, v2, v3

    .line 25
    .restart local v0    # "fValue":F
    div-int v1, p0, v9

    .line 26
    .restart local v1    # "iValue":I
    int-to-float v2, v1

    sub-float v2, v0, v2

    float-to-double v2, v2

    cmpg-double v2, v2, v4

    if-gez v2, :cond_3

    .line 27
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "m"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 29
    :cond_3
    const-string/jumbo v2, "%.1fm"

    new-array v3, v8, [Ljava/lang/Object;

    sub-float v4, v0, v6

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    aput-object v4, v3, v7

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method
