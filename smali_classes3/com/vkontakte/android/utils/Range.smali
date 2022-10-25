.class public Lcom/vkontakte/android/utils/Range;
.super Ljava/lang/Object;
.source "Range.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable",
        "<",
        "Lcom/vkontakte/android/utils/Range;",
        ">;"
    }
.end annotation


# static fields
.field private static final PARSING_ERROR_EMPTY:Ljava/lang/String; = "Range string cannot be empty"

.field private static final PARSING_ERROR_FORMAT:Ljava/lang/String; = "Range string should consists of two long values divided by \'-\' sign. Passed string is "


# instance fields
.field private end:J

.field private start:J


# direct methods
.method public constructor <init>(JJ)V
    .locals 1
    .param p1, "start"    # J
    .param p3, "end"    # J

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-wide p1, p0, Lcom/vkontakte/android/utils/Range;->start:J

    .line 22
    iput-wide p3, p0, Lcom/vkontakte/android/utils/Range;->end:J

    .line 23
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 5
    .param p1, "range"    # Ljava/lang/String;

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 27
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v3, "Range string cannot be empty"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 29
    :cond_0
    const-string/jumbo v2, "-"

    invoke-virtual {p1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 30
    .local v1, "split":[Ljava/lang/String;
    array-length v2, v1

    const/4 v3, 0x2

    if-ne v2, v3, :cond_1

    .line 32
    const/4 v2, 0x0

    :try_start_0
    aget-object v2, v1, v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    int-to-long v2, v2

    iput-wide v2, p0, Lcom/vkontakte/android/utils/Range;->start:J

    .line 33
    const/4 v2, 0x1

    aget-object v2, v1, v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    int-to-long v2, v2

    iput-wide v2, p0, Lcom/vkontakte/android/utils/Range;->end:J
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 41
    return-void

    .line 34
    :catch_0
    move-exception v0

    .line 35
    .local v0, "e":Ljava/lang/NumberFormatException;
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Range string should consists of two long values divided by \'-\' sign. Passed string is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 38
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    :cond_1
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Range string should consists of two long values divided by \'-\' sign. Passed string is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public static getLength(Ljava/util/Collection;)J
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lcom/vkontakte/android/utils/Range;",
            ">;)J"
        }
    .end annotation

    .prologue
    .line 119
    .local p0, "intervals":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/vkontakte/android/utils/Range;>;"
    const-wide/16 v2, 0x0

    .line 120
    .local v2, "result":J
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/utils/Range;

    .line 121
    .local v0, "range":Lcom/vkontakte/android/utils/Range;
    invoke-virtual {v0}, Lcom/vkontakte/android/utils/Range;->getLength()J

    move-result-wide v4

    add-long/2addr v2, v4

    .line 122
    goto :goto_0

    .line 123
    .end local v0    # "range":Lcom/vkontakte/android/utils/Range;
    :cond_0
    return-wide v2
.end method

.method public static merge(Ljava/util/List;)Ljava/util/Set;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/utils/Range;",
            ">;)",
            "Ljava/util/Set",
            "<",
            "Lcom/vkontakte/android/utils/Range;",
            ">;"
        }
    .end annotation

    .prologue
    .local p0, "intervals":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/utils/Range;>;"
    const/4 v10, 0x0

    .line 90
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_0

    .line 91
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v5

    .line 114
    :goto_0
    return-object v5

    .line 92
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v8

    const/4 v9, 0x1

    if-ne v8, v9, :cond_1

    .line 93
    invoke-interface {p0, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    invoke-static {v8}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v5

    goto :goto_0

    .line 95
    :cond_1
    invoke-static {p0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 97
    invoke-interface {p0, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/utils/Range;

    .line 98
    .local v1, "first":Lcom/vkontakte/android/utils/Range;
    iget-wide v6, v1, Lcom/vkontakte/android/utils/Range;->start:J

    .line 99
    .local v6, "start":J
    iget-wide v2, v1, Lcom/vkontakte/android/utils/Range;->end:J

    .line 101
    .local v2, "end":J
    new-instance v5, Ljava/util/LinkedHashSet;

    invoke-direct {v5}, Ljava/util/LinkedHashSet;-><init>()V

    .line 102
    .local v5, "result":Ljava/util/Set;, "Ljava/util/Set<Lcom/vkontakte/android/utils/Range;>;"
    const/4 v4, 0x1

    .local v4, "i":I
    :goto_1
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v8

    if-ge v4, v8, :cond_3

    .line 103
    invoke-interface {p0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/utils/Range;

    .line 104
    .local v0, "current":Lcom/vkontakte/android/utils/Range;
    iget-wide v8, v0, Lcom/vkontakte/android/utils/Range;->start:J

    cmp-long v8, v8, v2

    if-gtz v8, :cond_2

    .line 105
    iget-wide v8, v0, Lcom/vkontakte/android/utils/Range;->end:J

    invoke-static {v8, v9, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    .line 102
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 107
    :cond_2
    new-instance v8, Lcom/vkontakte/android/utils/Range;

    invoke-direct {v8, v6, v7, v2, v3}, Lcom/vkontakte/android/utils/Range;-><init>(JJ)V

    invoke-interface {v5, v8}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 108
    iget-wide v6, v0, Lcom/vkontakte/android/utils/Range;->start:J

    .line 109
    iget-wide v2, v0, Lcom/vkontakte/android/utils/Range;->end:J

    goto :goto_2

    .line 113
    .end local v0    # "current":Lcom/vkontakte/android/utils/Range;
    :cond_3
    new-instance v8, Lcom/vkontakte/android/utils/Range;

    invoke-direct {v8, v6, v7, v2, v3}, Lcom/vkontakte/android/utils/Range;-><init>(JJ)V

    invoke-interface {v5, v8}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method


# virtual methods
.method public compareTo(Lcom/vkontakte/android/utils/Range;)I
    .locals 4
    .param p1, "another"    # Lcom/vkontakte/android/utils/Range;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 61
    iget-wide v0, p0, Lcom/vkontakte/android/utils/Range;->start:J

    iget-wide v2, p1, Lcom/vkontakte/android/utils/Range;->start:J

    sub-long/2addr v0, v2

    long-to-int v0, v0

    return v0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 12
    check-cast p1, Lcom/vkontakte/android/utils/Range;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/utils/Range;->compareTo(Lcom/vkontakte/android/utils/Range;)I

    move-result v0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 8
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 66
    if-ne p0, p1, :cond_1

    .line 72
    :cond_0
    :goto_0
    return v1

    .line 68
    :cond_1
    if-eqz p1, :cond_2

    instance-of v3, p1, Lcom/vkontakte/android/utils/Range;

    if-nez v3, :cond_3

    :cond_2
    move v1, v2

    .line 69
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 71
    check-cast v0, Lcom/vkontakte/android/utils/Range;

    .line 72
    .local v0, "range":Lcom/vkontakte/android/utils/Range;
    iget-wide v4, p0, Lcom/vkontakte/android/utils/Range;->start:J

    iget-wide v6, v0, Lcom/vkontakte/android/utils/Range;->start:J

    cmp-long v3, v4, v6

    if-nez v3, :cond_4

    iget-wide v4, p0, Lcom/vkontakte/android/utils/Range;->end:J

    iget-wide v6, v0, Lcom/vkontakte/android/utils/Range;->end:J

    cmp-long v3, v4, v6

    if-eqz v3, :cond_0

    :cond_4
    move v1, v2

    goto :goto_0
.end method

.method public getEnd()J
    .locals 2

    .prologue
    .line 48
    iget-wide v0, p0, Lcom/vkontakte/android/utils/Range;->end:J

    return-wide v0
.end method

.method public getLength()J
    .locals 4

    .prologue
    .line 56
    iget-wide v0, p0, Lcom/vkontakte/android/utils/Range;->end:J

    iget-wide v2, p0, Lcom/vkontakte/android/utils/Range;->start:J

    sub-long/2addr v0, v2

    return-wide v0
.end method

.method public getStart()J
    .locals 2

    .prologue
    .line 44
    iget-wide v0, p0, Lcom/vkontakte/android/utils/Range;->start:J

    return-wide v0
.end method

.method public hashCode()I
    .locals 7

    .prologue
    const/16 v6, 0x20

    .line 78
    iget-wide v2, p0, Lcom/vkontakte/android/utils/Range;->start:J

    iget-wide v4, p0, Lcom/vkontakte/android/utils/Range;->start:J

    ushr-long/2addr v4, v6

    xor-long/2addr v2, v4

    long-to-int v0, v2

    .line 79
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget-wide v2, p0, Lcom/vkontakte/android/utils/Range;->end:J

    iget-wide v4, p0, Lcom/vkontakte/android/utils/Range;->end:J

    ushr-long/2addr v4, v6

    xor-long/2addr v2, v4

    long-to-int v2, v2

    add-int v0, v1, v2

    .line 80
    return v0
.end method

.method public setEnd(J)V
    .locals 1
    .param p1, "end"    # J

    .prologue
    .line 52
    iput-wide p1, p0, Lcom/vkontakte/android/utils/Range;->end:J

    .line 53
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 85
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v2, p0, Lcom/vkontakte/android/utils/Range;->start:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/vkontakte/android/utils/Range;->end:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
