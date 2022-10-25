.class public Lcom/vkontakte/android/statistics/Statistic$StatisticHelper;
.super Ljava/lang/Object;
.source "Statistic.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/statistics/Statistic;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "StatisticHelper"
.end annotation


# instance fields
.field private final statistics:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/statistics/StatisticUrl;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/statistics/Statistic$StatisticHelper;->statistics:Ljava/util/HashMap;

    return-void
.end method


# virtual methods
.method public addStatisticUrl(Lcom/vkontakte/android/statistics/StatisticUrl;)V
    .locals 3
    .param p1, "url"    # Lcom/vkontakte/android/statistics/StatisticUrl;

    .prologue
    .line 52
    iget-object v1, p0, Lcom/vkontakte/android/statistics/Statistic$StatisticHelper;->statistics:Ljava/util/HashMap;

    iget-object v2, p1, Lcom/vkontakte/android/statistics/StatisticUrl;->type:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 53
    .local v0, "urls":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/statistics/StatisticUrl;>;"
    if-nez v0, :cond_0

    .line 54
    new-instance v0, Ljava/util/ArrayList;

    .end local v0    # "urls":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/statistics/StatisticUrl;>;"
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 55
    .restart local v0    # "urls":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/statistics/StatisticUrl;>;"
    iget-object v1, p0, Lcom/vkontakte/android/statistics/Statistic$StatisticHelper;->statistics:Ljava/util/HashMap;

    iget-object v2, p1, Lcom/vkontakte/android/statistics/StatisticUrl;->type:Ljava/lang/String;

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    :cond_0
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 58
    return-void
.end method

.method public getStatisticByType(Ljava/lang/String;)Ljava/util/List;
    .locals 2
    .param p1, "type"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/statistics/StatisticUrl;",
            ">;"
        }
    .end annotation

    .prologue
    .line 66
    iget-object v1, p0, Lcom/vkontakte/android/statistics/Statistic$StatisticHelper;->statistics:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 67
    .local v0, "urls":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/statistics/StatisticUrl;>;"
    if-nez v0, :cond_0

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    .end local v0    # "urls":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/statistics/StatisticUrl;>;"
    :cond_0
    return-object v0
.end method

.method public getStatisticSizeByType(Ljava/lang/String;)I
    .locals 2
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 61
    iget-object v1, p0, Lcom/vkontakte/android/statistics/Statistic$StatisticHelper;->statistics:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 62
    .local v0, "urls":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/statistics/StatisticUrl;>;"
    if-nez v0, :cond_0

    const/4 v1, 0x0

    :goto_0
    return v1

    :cond_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    goto :goto_0
.end method

.method public readFromSerializer(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 5
    .param p1, "is"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 79
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    .line 80
    .local v0, "c":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_1

    .line 81
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v2

    .line 82
    .local v2, "key":Ljava/lang/String;
    sget-object v4, Lcom/vkontakte/android/statistics/StatisticUrl;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    invoke-virtual {p1, v4}, Lcom/vkontakte/android/utils/Serializer;->createTypedArrayList(Lcom/vkontakte/android/utils/Serializer$Creator;)Ljava/util/ArrayList;

    move-result-object v3

    .line 83
    .local v3, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/statistics/StatisticUrl;>;"
    if-eqz v3, :cond_0

    .line 84
    iget-object v4, p0, Lcom/vkontakte/android/statistics/Statistic$StatisticHelper;->statistics:Ljava/util/HashMap;

    invoke-virtual {v4, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 87
    .end local v2    # "key":Ljava/lang/String;
    .end local v3    # "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/statistics/StatisticUrl;>;"
    :cond_1
    return-void
.end method

.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 3
    .param p1, "os"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 71
    iget-object v1, p0, Lcom/vkontakte/android/statistics/Statistic$StatisticHelper;->statistics:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->size()I

    move-result v1

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 72
    iget-object v1, p0, Lcom/vkontakte/android/statistics/Statistic$StatisticHelper;->statistics:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 73
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/ArrayList<Lcom/vkontakte/android/statistics/StatisticUrl;>;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 74
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeTypedList(Ljava/util/List;)V

    goto :goto_0

    .line 76
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/ArrayList<Lcom/vkontakte/android/statistics/StatisticUrl;>;>;"
    :cond_0
    return-void
.end method
