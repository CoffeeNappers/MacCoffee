.class final Lio/reactivex/internal/functions/Functions$ToMultimapKeyValueSelector;
.super Ljava/lang/Object;
.source "Functions.java"

# interfaces
.implements Lio/reactivex/functions/BiConsumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/functions/Functions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ToMultimapKeyValueSelector"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        "T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lio/reactivex/functions/BiConsumer",
        "<",
        "Ljava/util/Map",
        "<TK;",
        "Ljava/util/Collection",
        "<TV;>;>;TT;>;"
    }
.end annotation


# instance fields
.field private final collectionFactory:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-TK;+",
            "Ljava/util/Collection",
            "<-TV;>;>;"
        }
    .end annotation
.end field

.field private final keySelector:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-TT;+TK;>;"
        }
    .end annotation
.end field

.field private final valueSelector:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-TT;+TV;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lio/reactivex/functions/Function;Lio/reactivex/functions/Function;Lio/reactivex/functions/Function;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Function",
            "<-TK;+",
            "Ljava/util/Collection",
            "<-TV;>;>;",
            "Lio/reactivex/functions/Function",
            "<-TT;+TV;>;",
            "Lio/reactivex/functions/Function",
            "<-TT;+TK;>;)V"
        }
    .end annotation

    .prologue
    .line 452
    .local p0, "this":Lio/reactivex/internal/functions/Functions$ToMultimapKeyValueSelector;, "Lio/reactivex/internal/functions/Functions$ToMultimapKeyValueSelector<TK;TV;TT;>;"
    .local p1, "collectionFactory":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TK;+Ljava/util/Collection<-TV;>;>;"
    .local p2, "valueSelector":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+TV;>;"
    .local p3, "keySelector":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+TK;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 453
    iput-object p1, p0, Lio/reactivex/internal/functions/Functions$ToMultimapKeyValueSelector;->collectionFactory:Lio/reactivex/functions/Function;

    .line 454
    iput-object p2, p0, Lio/reactivex/internal/functions/Functions$ToMultimapKeyValueSelector;->valueSelector:Lio/reactivex/functions/Function;

    .line 455
    iput-object p3, p0, Lio/reactivex/internal/functions/Functions$ToMultimapKeyValueSelector;->keySelector:Lio/reactivex/functions/Function;

    .line 456
    return-void
.end method


# virtual methods
.method public bridge synthetic accept(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 446
    .local p0, "this":Lio/reactivex/internal/functions/Functions$ToMultimapKeyValueSelector;, "Lio/reactivex/internal/functions/Functions$ToMultimapKeyValueSelector<TK;TV;TT;>;"
    check-cast p1, Ljava/util/Map;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lio/reactivex/internal/functions/Functions$ToMultimapKeyValueSelector;->accept(Ljava/util/Map;Ljava/lang/Object;)V

    return-void
.end method

.method public accept(Ljava/util/Map;Ljava/lang/Object;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<TK;",
            "Ljava/util/Collection",
            "<TV;>;>;TT;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 461
    .local p0, "this":Lio/reactivex/internal/functions/Functions$ToMultimapKeyValueSelector;, "Lio/reactivex/internal/functions/Functions$ToMultimapKeyValueSelector<TK;TV;TT;>;"
    .local p1, "m":Ljava/util/Map;, "Ljava/util/Map<TK;Ljava/util/Collection<TV;>;>;"
    .local p2, "t":Ljava/lang/Object;, "TT;"
    iget-object v3, p0, Lio/reactivex/internal/functions/Functions$ToMultimapKeyValueSelector;->keySelector:Lio/reactivex/functions/Function;

    invoke-interface {v3, p2}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 463
    .local v1, "key":Ljava/lang/Object;, "TK;"
    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Collection;

    .line 464
    .local v0, "coll":Ljava/util/Collection;, "Ljava/util/Collection<TV;>;"
    if-nez v0, :cond_0

    .line 465
    iget-object v3, p0, Lio/reactivex/internal/functions/Functions$ToMultimapKeyValueSelector;->collectionFactory:Lio/reactivex/functions/Function;

    invoke-interface {v3, v1}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "coll":Ljava/util/Collection;, "Ljava/util/Collection<TV;>;"
    check-cast v0, Ljava/util/Collection;

    .line 466
    .restart local v0    # "coll":Ljava/util/Collection;, "Ljava/util/Collection<TV;>;"
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 469
    :cond_0
    iget-object v3, p0, Lio/reactivex/internal/functions/Functions$ToMultimapKeyValueSelector;->valueSelector:Lio/reactivex/functions/Function;

    invoke-interface {v3, p2}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 471
    .local v2, "value":Ljava/lang/Object;, "TV;"
    invoke-interface {v0, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 472
    return-void
.end method
