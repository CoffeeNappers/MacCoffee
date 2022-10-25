.class public final Lio/reactivex/internal/util/MergerBiFunction;
.super Ljava/lang/Object;
.source "MergerBiFunction.java"

# interfaces
.implements Lio/reactivex/functions/BiFunction;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lio/reactivex/functions/BiFunction",
        "<",
        "Ljava/util/List",
        "<TT;>;",
        "Ljava/util/List",
        "<TT;>;",
        "Ljava/util/List",
        "<TT;>;>;"
    }
.end annotation


# instance fields
.field final comparator:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<-TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/Comparator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Comparator",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 28
    .local p0, "this":Lio/reactivex/internal/util/MergerBiFunction;, "Lio/reactivex/internal/util/MergerBiFunction<TT;>;"
    .local p1, "comparator":Ljava/util/Comparator;, "Ljava/util/Comparator<-TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-object p1, p0, Lio/reactivex/internal/util/MergerBiFunction;->comparator:Ljava/util/Comparator;

    .line 30
    return-void
.end method


# virtual methods
.method public bridge synthetic apply(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 24
    .local p0, "this":Lio/reactivex/internal/util/MergerBiFunction;, "Lio/reactivex/internal/util/MergerBiFunction<TT;>;"
    check-cast p1, Ljava/util/List;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Ljava/util/List;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lio/reactivex/internal/util/MergerBiFunction;->apply(Ljava/util/List;Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public apply(Ljava/util/List;Ljava/util/List;)Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<TT;>;",
            "Ljava/util/List",
            "<TT;>;)",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/util/MergerBiFunction;, "Lio/reactivex/internal/util/MergerBiFunction<TT;>;"
    .local p1, "a":Ljava/util/List;, "Ljava/util/List<TT;>;"
    .local p2, "b":Ljava/util/List;, "Ljava/util/List<TT;>;"
    const/4 v6, 0x0

    .line 34
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v7

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v8

    add-int v3, v7, v8

    .line 35
    .local v3, "n":I
    if-nez v3, :cond_1

    .line 36
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 69
    :cond_0
    return-object v1

    .line 38
    :cond_1
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 40
    .local v1, "both":Ljava/util/List;, "Ljava/util/List<TT;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 41
    .local v0, "at":Ljava/util/Iterator;, "Ljava/util/Iterator<TT;>;"
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 43
    .local v2, "bt":Ljava/util/Iterator;, "Ljava/util/Iterator<TT;>;"
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    .line 44
    .local v4, "s1":Ljava/lang/Object;, "TT;"
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    .line 46
    .local v5, "s2":Ljava/lang/Object;, "TT;"
    :goto_1
    if-eqz v4, :cond_7

    if-eqz v5, :cond_7

    .line 47
    iget-object v7, p0, Lio/reactivex/internal/util/MergerBiFunction;->comparator:Ljava/util/Comparator;

    invoke-interface {v7, v4, v5}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v7

    if-gez v7, :cond_5

    .line 48
    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 49
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    :goto_2
    goto :goto_1

    .end local v4    # "s1":Ljava/lang/Object;, "TT;"
    .end local v5    # "s2":Ljava/lang/Object;, "TT;"
    :cond_2
    move-object v4, v6

    .line 43
    goto :goto_0

    .restart local v4    # "s1":Ljava/lang/Object;, "TT;"
    :cond_3
    move-object v5, v6

    .line 44
    goto :goto_1

    .restart local v5    # "s2":Ljava/lang/Object;, "TT;"
    :cond_4
    move-object v4, v6

    .line 49
    goto :goto_2

    .line 51
    :cond_5
    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 52
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_6

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    :goto_3
    goto :goto_1

    :cond_6
    move-object v5, v6

    goto :goto_3

    .line 56
    :cond_7
    if-eqz v4, :cond_8

    .line 57
    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 58
    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 59
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    invoke-interface {v1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_4

    .line 62
    :cond_8
    if-eqz v5, :cond_0

    .line 63
    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 64
    :goto_5
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 65
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    invoke-interface {v1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_5
.end method
