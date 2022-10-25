.class final Lio/reactivex/internal/functions/Functions$ToMapKeyValueSelector;
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
    name = "ToMapKeyValueSelector"
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
        "<TK;TV;>;TT;>;"
    }
.end annotation


# instance fields
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
.method constructor <init>(Lio/reactivex/functions/Function;Lio/reactivex/functions/Function;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Function",
            "<-TT;+TV;>;",
            "Lio/reactivex/functions/Function",
            "<-TT;+TK;>;)V"
        }
    .end annotation

    .prologue
    .line 429
    .local p0, "this":Lio/reactivex/internal/functions/Functions$ToMapKeyValueSelector;, "Lio/reactivex/internal/functions/Functions$ToMapKeyValueSelector<TK;TV;TT;>;"
    .local p1, "valueSelector":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+TV;>;"
    .local p2, "keySelector":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+TK;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 430
    iput-object p1, p0, Lio/reactivex/internal/functions/Functions$ToMapKeyValueSelector;->valueSelector:Lio/reactivex/functions/Function;

    .line 431
    iput-object p2, p0, Lio/reactivex/internal/functions/Functions$ToMapKeyValueSelector;->keySelector:Lio/reactivex/functions/Function;

    .line 432
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
    .line 424
    .local p0, "this":Lio/reactivex/internal/functions/Functions$ToMapKeyValueSelector;, "Lio/reactivex/internal/functions/Functions$ToMapKeyValueSelector<TK;TV;TT;>;"
    check-cast p1, Ljava/util/Map;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lio/reactivex/internal/functions/Functions$ToMapKeyValueSelector;->accept(Ljava/util/Map;Ljava/lang/Object;)V

    return-void
.end method

.method public accept(Ljava/util/Map;Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<TK;TV;>;TT;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 436
    .local p0, "this":Lio/reactivex/internal/functions/Functions$ToMapKeyValueSelector;, "Lio/reactivex/internal/functions/Functions$ToMapKeyValueSelector<TK;TV;TT;>;"
    .local p1, "m":Ljava/util/Map;, "Ljava/util/Map<TK;TV;>;"
    .local p2, "t":Ljava/lang/Object;, "TT;"
    iget-object v2, p0, Lio/reactivex/internal/functions/Functions$ToMapKeyValueSelector;->keySelector:Lio/reactivex/functions/Function;

    invoke-interface {v2, p2}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 437
    .local v0, "key":Ljava/lang/Object;, "TK;"
    iget-object v2, p0, Lio/reactivex/internal/functions/Functions$ToMapKeyValueSelector;->valueSelector:Lio/reactivex/functions/Function;

    invoke-interface {v2, p2}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 438
    .local v1, "value":Ljava/lang/Object;, "TV;"
    invoke-interface {p1, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 439
    return-void
.end method
