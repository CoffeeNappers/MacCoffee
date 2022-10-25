.class public Lcom/vkontakte/android/utils/RangesList;
.super Ljava/lang/Object;
.source "RangesList.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/utils/RangesList$RangesListIterator;,
        Lcom/vkontakte/android/utils/RangesList$Entry;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable",
        "<",
        "Lcom/vkontakte/android/utils/RangesList$Entry;",
        ">;"
    }
.end annotation


# instance fields
.field private first:Lcom/vkontakte/android/utils/RangesList$Entry;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/utils/RangesList;->first:Lcom/vkontakte/android/utils/RangesList$Entry;

    return-void
.end method

.method static synthetic access$600(Lcom/vkontakte/android/utils/RangesList;)Lcom/vkontakte/android/utils/RangesList$Entry;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/utils/RangesList;

    .prologue
    .line 5
    iget-object v0, p0, Lcom/vkontakte/android/utils/RangesList;->first:Lcom/vkontakte/android/utils/RangesList$Entry;

    return-object v0
.end method

.method static synthetic access$602(Lcom/vkontakte/android/utils/RangesList;Lcom/vkontakte/android/utils/RangesList$Entry;)Lcom/vkontakte/android/utils/RangesList$Entry;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/utils/RangesList;
    .param p1, "x1"    # Lcom/vkontakte/android/utils/RangesList$Entry;

    .prologue
    .line 5
    iput-object p1, p0, Lcom/vkontakte/android/utils/RangesList;->first:Lcom/vkontakte/android/utils/RangesList$Entry;

    return-object p1
.end method


# virtual methods
.method public add(JJ)V
    .locals 11
    .param p1, "from"    # J
    .param p3, "to"    # J

    .prologue
    .line 10
    cmp-long v2, p1, p3

    if-lez v2, :cond_0

    .line 11
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v4, "from > to"

    invoke-direct {v2, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 12
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/utils/RangesList;->first:Lcom/vkontakte/android/utils/RangesList$Entry;

    if-nez v2, :cond_2

    .line 13
    new-instance v1, Lcom/vkontakte/android/utils/RangesList$Entry;

    const/4 v6, 0x0

    move-wide v2, p1

    move-wide v4, p3

    invoke-direct/range {v1 .. v6}, Lcom/vkontakte/android/utils/RangesList$Entry;-><init>(JJLcom/vkontakte/android/utils/RangesList$1;)V

    iput-object v1, p0, Lcom/vkontakte/android/utils/RangesList;->first:Lcom/vkontakte/android/utils/RangesList$Entry;

    .line 51
    :cond_1
    :goto_0
    return-void

    .line 15
    :cond_2
    const/4 v1, 0x0

    .line 16
    .local v1, "entryFrom":Lcom/vkontakte/android/utils/RangesList$Entry;
    const/4 v3, 0x0

    .line 18
    .local v3, "entryTo":Lcom/vkontakte/android/utils/RangesList$Entry;
    iget-object v9, p0, Lcom/vkontakte/android/utils/RangesList;->first:Lcom/vkontakte/android/utils/RangesList$Entry;

    .local v9, "i":Lcom/vkontakte/android/utils/RangesList$Entry;
    move-object v0, v3

    .line 19
    .end local v3    # "entryTo":Lcom/vkontakte/android/utils/RangesList$Entry;
    .local v0, "entryTo":Lcom/vkontakte/android/utils/RangesList$Entry;
    :goto_1
    if-eqz v9, :cond_c

    .line 20
    if-nez v1, :cond_4

    .line 21
    invoke-virtual {v9, p1, p2}, Lcom/vkontakte/android/utils/RangesList$Entry;->contains(J)Z

    move-result v2

    if-nez v2, :cond_3

    const-wide/16 v4, 0x1

    add-long/2addr v4, p1

    invoke-static {v9}, Lcom/vkontakte/android/utils/RangesList$Entry;->access$100(Lcom/vkontakte/android/utils/RangesList$Entry;)J

    move-result-wide v6

    cmp-long v2, v4, v6

    if-eqz v2, :cond_3

    const-wide/16 v4, 0x1

    sub-long v4, p1, v4

    invoke-static {v9}, Lcom/vkontakte/android/utils/RangesList$Entry;->access$200(Lcom/vkontakte/android/utils/RangesList$Entry;)J

    move-result-wide v6

    cmp-long v2, v4, v6

    if-nez v2, :cond_5

    .line 22
    :cond_3
    move-object v1, v9

    .line 23
    invoke-static {v1}, Lcom/vkontakte/android/utils/RangesList$Entry;->access$100(Lcom/vkontakte/android/utils/RangesList$Entry;)J

    move-result-wide v4

    invoke-static {v4, v5, p1, p2}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    invoke-static {v1, v4, v5}, Lcom/vkontakte/android/utils/RangesList$Entry;->access$102(Lcom/vkontakte/android/utils/RangesList$Entry;J)J

    .line 24
    invoke-static {v1}, Lcom/vkontakte/android/utils/RangesList$Entry;->access$200(Lcom/vkontakte/android/utils/RangesList$Entry;)J

    move-result-wide v4

    invoke-static {v4, v5, p1, p2}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v4

    invoke-static {v1, v4, v5}, Lcom/vkontakte/android/utils/RangesList$Entry;->access$202(Lcom/vkontakte/android/utils/RangesList$Entry;J)J

    .line 29
    :cond_4
    :goto_2
    if-nez v0, :cond_b

    .line 30
    invoke-virtual {v9}, Lcom/vkontakte/android/utils/RangesList$Entry;->next()Lcom/vkontakte/android/utils/RangesList$Entry;

    move-result-object v2

    if-eqz v2, :cond_6

    invoke-virtual {v9}, Lcom/vkontakte/android/utils/RangesList$Entry;->next()Lcom/vkontakte/android/utils/RangesList$Entry;

    move-result-object v2

    invoke-virtual {v2, p3, p4}, Lcom/vkontakte/android/utils/RangesList$Entry;->contains(J)Z

    move-result v2

    if-nez v2, :cond_b

    const-wide/16 v4, 0x1

    add-long/2addr v4, p3

    invoke-virtual {v9}, Lcom/vkontakte/android/utils/RangesList$Entry;->next()Lcom/vkontakte/android/utils/RangesList$Entry;

    move-result-object v2

    invoke-static {v2}, Lcom/vkontakte/android/utils/RangesList$Entry;->access$100(Lcom/vkontakte/android/utils/RangesList$Entry;)J

    move-result-wide v6

    cmp-long v2, v4, v6

    if-eqz v2, :cond_b

    const-wide/16 v4, 0x1

    sub-long v4, p3, v4

    invoke-virtual {v9}, Lcom/vkontakte/android/utils/RangesList$Entry;->next()Lcom/vkontakte/android/utils/RangesList$Entry;

    move-result-object v2

    invoke-static {v2}, Lcom/vkontakte/android/utils/RangesList$Entry;->access$200(Lcom/vkontakte/android/utils/RangesList$Entry;)J

    move-result-wide v6

    cmp-long v2, v4, v6

    if-nez v2, :cond_6

    move-object v3, v0

    .line 40
    .end local v0    # "entryTo":Lcom/vkontakte/android/utils/RangesList$Entry;
    .restart local v3    # "entryTo":Lcom/vkontakte/android/utils/RangesList$Entry;
    :goto_3
    invoke-virtual {v9}, Lcom/vkontakte/android/utils/RangesList$Entry;->next()Lcom/vkontakte/android/utils/RangesList$Entry;

    move-result-object v2

    if-nez v2, :cond_a

    if-nez v3, :cond_a

    .line 41
    new-instance v3, Lcom/vkontakte/android/utils/RangesList$Entry;

    .end local v3    # "entryTo":Lcom/vkontakte/android/utils/RangesList$Entry;
    if-nez v1, :cond_9

    move-wide v4, p1

    :goto_4
    const/4 v8, 0x0

    move-wide v6, p3

    invoke-direct/range {v3 .. v8}, Lcom/vkontakte/android/utils/RangesList$Entry;-><init>(JJLcom/vkontakte/android/utils/RangesList$1;)V

    .restart local v3    # "entryTo":Lcom/vkontakte/android/utils/RangesList$Entry;
    invoke-static {v9, v3}, Lcom/vkontakte/android/utils/RangesList$Entry;->access$400(Lcom/vkontakte/android/utils/RangesList$Entry;Lcom/vkontakte/android/utils/RangesList$Entry;)V

    .line 46
    :goto_5
    if-eqz v1, :cond_1

    if-eqz v3, :cond_1

    if-eq v1, v3, :cond_1

    .line 47
    invoke-static {v3}, Lcom/vkontakte/android/utils/RangesList$Entry;->access$200(Lcom/vkontakte/android/utils/RangesList$Entry;)J

    move-result-wide v4

    invoke-static {v1, v4, v5}, Lcom/vkontakte/android/utils/RangesList$Entry;->access$202(Lcom/vkontakte/android/utils/RangesList$Entry;J)J

    .line 48
    invoke-static {v3}, Lcom/vkontakte/android/utils/RangesList$Entry;->access$500(Lcom/vkontakte/android/utils/RangesList$Entry;)Lcom/vkontakte/android/utils/RangesList$Entry;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vkontakte/android/utils/RangesList$Entry;->access$400(Lcom/vkontakte/android/utils/RangesList$Entry;Lcom/vkontakte/android/utils/RangesList$Entry;)V

    goto/16 :goto_0

    .line 25
    .end local v3    # "entryTo":Lcom/vkontakte/android/utils/RangesList$Entry;
    .restart local v0    # "entryTo":Lcom/vkontakte/android/utils/RangesList$Entry;
    :cond_5
    invoke-static {v9}, Lcom/vkontakte/android/utils/RangesList$Entry;->access$100(Lcom/vkontakte/android/utils/RangesList$Entry;)J

    move-result-wide v4

    cmp-long v2, p1, v4

    if-gez v2, :cond_4

    .line 26
    new-instance v1, Lcom/vkontakte/android/utils/RangesList$Entry;

    .end local v1    # "entryFrom":Lcom/vkontakte/android/utils/RangesList$Entry;
    const/4 v6, 0x0

    move-wide v2, p1

    move-wide v4, p1

    invoke-direct/range {v1 .. v6}, Lcom/vkontakte/android/utils/RangesList$Entry;-><init>(JJLcom/vkontakte/android/utils/RangesList$1;)V

    .restart local v1    # "entryFrom":Lcom/vkontakte/android/utils/RangesList$Entry;
    invoke-static {v9, p0, v1}, Lcom/vkontakte/android/utils/RangesList$Entry;->access$300(Lcom/vkontakte/android/utils/RangesList$Entry;Lcom/vkontakte/android/utils/RangesList;Lcom/vkontakte/android/utils/RangesList$Entry;)V

    goto :goto_2

    .line 32
    :cond_6
    invoke-virtual {v9, p3, p4}, Lcom/vkontakte/android/utils/RangesList$Entry;->contains(J)Z

    move-result v2

    if-nez v2, :cond_7

    const-wide/16 v4, 0x1

    add-long/2addr v4, p3

    invoke-static {v9}, Lcom/vkontakte/android/utils/RangesList$Entry;->access$100(Lcom/vkontakte/android/utils/RangesList$Entry;)J

    move-result-wide v6

    cmp-long v2, v4, v6

    if-eqz v2, :cond_7

    const-wide/16 v4, 0x1

    sub-long v4, p3, v4

    invoke-static {v9}, Lcom/vkontakte/android/utils/RangesList$Entry;->access$200(Lcom/vkontakte/android/utils/RangesList$Entry;)J

    move-result-wide v6

    cmp-long v2, v4, v6

    if-nez v2, :cond_8

    .line 33
    :cond_7
    move-object v3, v9

    .line 34
    .end local v0    # "entryTo":Lcom/vkontakte/android/utils/RangesList$Entry;
    .restart local v3    # "entryTo":Lcom/vkontakte/android/utils/RangesList$Entry;
    invoke-static {v3}, Lcom/vkontakte/android/utils/RangesList$Entry;->access$100(Lcom/vkontakte/android/utils/RangesList$Entry;)J

    move-result-wide v4

    invoke-static {v4, v5, p3, p4}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    invoke-static {v3, v4, v5}, Lcom/vkontakte/android/utils/RangesList$Entry;->access$102(Lcom/vkontakte/android/utils/RangesList$Entry;J)J

    .line 35
    invoke-static {v3}, Lcom/vkontakte/android/utils/RangesList$Entry;->access$200(Lcom/vkontakte/android/utils/RangesList$Entry;)J

    move-result-wide v4

    invoke-static {v4, v5, p3, p4}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v4

    invoke-static {v3, v4, v5}, Lcom/vkontakte/android/utils/RangesList$Entry;->access$202(Lcom/vkontakte/android/utils/RangesList$Entry;J)J

    goto :goto_3

    .line 36
    .end local v3    # "entryTo":Lcom/vkontakte/android/utils/RangesList$Entry;
    .restart local v0    # "entryTo":Lcom/vkontakte/android/utils/RangesList$Entry;
    :cond_8
    invoke-static {v9}, Lcom/vkontakte/android/utils/RangesList$Entry;->access$100(Lcom/vkontakte/android/utils/RangesList$Entry;)J

    move-result-wide v4

    cmp-long v2, p3, v4

    if-gez v2, :cond_b

    .line 37
    new-instance v3, Lcom/vkontakte/android/utils/RangesList$Entry;

    const/4 v8, 0x0

    move-wide v4, p3

    move-wide v6, p3

    invoke-direct/range {v3 .. v8}, Lcom/vkontakte/android/utils/RangesList$Entry;-><init>(JJLcom/vkontakte/android/utils/RangesList$1;)V

    .end local v0    # "entryTo":Lcom/vkontakte/android/utils/RangesList$Entry;
    .restart local v3    # "entryTo":Lcom/vkontakte/android/utils/RangesList$Entry;
    invoke-static {v9, p0, v3}, Lcom/vkontakte/android/utils/RangesList$Entry;->access$300(Lcom/vkontakte/android/utils/RangesList$Entry;Lcom/vkontakte/android/utils/RangesList;Lcom/vkontakte/android/utils/RangesList$Entry;)V

    goto/16 :goto_3

    .end local v3    # "entryTo":Lcom/vkontakte/android/utils/RangesList$Entry;
    :cond_9
    move-wide v4, p3

    .line 41
    goto :goto_4

    .line 44
    .restart local v3    # "entryTo":Lcom/vkontakte/android/utils/RangesList$Entry;
    :cond_a
    invoke-virtual {v9}, Lcom/vkontakte/android/utils/RangesList$Entry;->next()Lcom/vkontakte/android/utils/RangesList$Entry;

    move-result-object v9

    move-object v0, v3

    .end local v3    # "entryTo":Lcom/vkontakte/android/utils/RangesList$Entry;
    .restart local v0    # "entryTo":Lcom/vkontakte/android/utils/RangesList$Entry;
    goto/16 :goto_1

    :cond_b
    move-object v3, v0

    .end local v0    # "entryTo":Lcom/vkontakte/android/utils/RangesList$Entry;
    .restart local v3    # "entryTo":Lcom/vkontakte/android/utils/RangesList$Entry;
    goto/16 :goto_3

    .end local v3    # "entryTo":Lcom/vkontakte/android/utils/RangesList$Entry;
    .restart local v0    # "entryTo":Lcom/vkontakte/android/utils/RangesList$Entry;
    :cond_c
    move-object v3, v0

    .end local v0    # "entryTo":Lcom/vkontakte/android/utils/RangesList$Entry;
    .restart local v3    # "entryTo":Lcom/vkontakte/android/utils/RangesList$Entry;
    goto/16 :goto_5
.end method

.method public clear()V
    .locals 1

    .prologue
    .line 54
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/utils/RangesList;->first:Lcom/vkontakte/android/utils/RangesList$Entry;

    .line 55
    return-void
.end method

.method public getFirst()Lcom/vkontakte/android/utils/RangesList$Entry;
    .locals 1

    .prologue
    .line 62
    iget-object v0, p0, Lcom/vkontakte/android/utils/RangesList;->first:Lcom/vkontakte/android/utils/RangesList$Entry;

    return-object v0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lcom/vkontakte/android/utils/RangesList;->first:Lcom/vkontakte/android/utils/RangesList$Entry;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lcom/vkontakte/android/utils/RangesList$Entry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 149
    new-instance v0, Lcom/vkontakte/android/utils/RangesList$RangesListIterator;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/utils/RangesList$RangesListIterator;-><init>(Lcom/vkontakte/android/utils/RangesList;)V

    return-object v0
.end method

.method public size()I
    .locals 4

    .prologue
    .line 66
    invoke-virtual {p0}, Lcom/vkontakte/android/utils/RangesList;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 67
    const/4 v1, 0x0

    .line 73
    :cond_0
    return v1

    .line 69
    :cond_1
    const/4 v1, 0x0

    .line 70
    .local v1, "size":I
    invoke-virtual {p0}, Lcom/vkontakte/android/utils/RangesList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/utils/RangesList$Entry;

    .line 71
    .local v0, "entry":Lcom/vkontakte/android/utils/RangesList$Entry;
    add-int/lit8 v1, v1, 0x1

    .line 72
    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 6

    .prologue
    .line 79
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v3, 0x7b

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 80
    .local v1, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Lcom/vkontakte/android/utils/RangesList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/utils/RangesList$Entry;

    .line 81
    .local v0, "entry":Lcom/vkontakte/android/utils/RangesList$Entry;
    const/16 v3, 0x5b

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {v0}, Lcom/vkontakte/android/utils/RangesList$Entry;->access$100(Lcom/vkontakte/android/utils/RangesList$Entry;)J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x2c

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {v0}, Lcom/vkontakte/android/utils/RangesList$Entry;->access$200(Lcom/vkontakte/android/utils/RangesList$Entry;)J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x5d

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 83
    .end local v0    # "entry":Lcom/vkontakte/android/utils/RangesList$Entry;
    :cond_0
    const/16 v2, 0x7d

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
