.class final Lio/reactivex/internal/functions/Functions$ToMapKeySelector;
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
    name = "ToMapKeySelector"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lio/reactivex/functions/BiConsumer",
        "<",
        "Ljava/util/Map",
        "<TK;TT;>;TT;>;"
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


# direct methods
.method constructor <init>(Lio/reactivex/functions/Function;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Function",
            "<-TT;+TK;>;)V"
        }
    .end annotation

    .prologue
    .line 409
    .local p0, "this":Lio/reactivex/internal/functions/Functions$ToMapKeySelector;, "Lio/reactivex/internal/functions/Functions$ToMapKeySelector<TK;TT;>;"
    .local p1, "keySelector":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+TK;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 410
    iput-object p1, p0, Lio/reactivex/internal/functions/Functions$ToMapKeySelector;->keySelector:Lio/reactivex/functions/Function;

    .line 411
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
    .line 406
    .local p0, "this":Lio/reactivex/internal/functions/Functions$ToMapKeySelector;, "Lio/reactivex/internal/functions/Functions$ToMapKeySelector<TK;TT;>;"
    check-cast p1, Ljava/util/Map;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lio/reactivex/internal/functions/Functions$ToMapKeySelector;->accept(Ljava/util/Map;Ljava/lang/Object;)V

    return-void
.end method

.method public accept(Ljava/util/Map;Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<TK;TT;>;TT;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 415
    .local p0, "this":Lio/reactivex/internal/functions/Functions$ToMapKeySelector;, "Lio/reactivex/internal/functions/Functions$ToMapKeySelector<TK;TT;>;"
    .local p1, "m":Ljava/util/Map;, "Ljava/util/Map<TK;TT;>;"
    .local p2, "t":Ljava/lang/Object;, "TT;"
    iget-object v1, p0, Lio/reactivex/internal/functions/Functions$ToMapKeySelector;->keySelector:Lio/reactivex/functions/Function;

    invoke-interface {v1, p2}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 416
    .local v0, "key":Ljava/lang/Object;, "TK;"
    invoke-interface {p1, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 417
    return-void
.end method
