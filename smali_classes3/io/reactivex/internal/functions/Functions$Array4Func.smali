.class final Lio/reactivex/internal/functions/Functions$Array4Func;
.super Ljava/lang/Object;
.source "Functions.java"

# interfaces
.implements Lio/reactivex/functions/Function;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/functions/Functions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Array4Func"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T1:",
        "Ljava/lang/Object;",
        "T2:",
        "Ljava/lang/Object;",
        "T3:",
        "Ljava/lang/Object;",
        "T4:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lio/reactivex/functions/Function",
        "<[",
        "Ljava/lang/Object;",
        "TR;>;"
    }
.end annotation


# instance fields
.field final f:Lio/reactivex/functions/Function4;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function4",
            "<TT1;TT2;TT3;TT4;TR;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lio/reactivex/functions/Function4;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Function4",
            "<TT1;TT2;TT3;TT4;TR;>;)V"
        }
    .end annotation

    .prologue
    .line 553
    .local p0, "this":Lio/reactivex/internal/functions/Functions$Array4Func;, "Lio/reactivex/internal/functions/Functions$Array4Func<TT1;TT2;TT3;TT4;TR;>;"
    .local p1, "f":Lio/reactivex/functions/Function4;, "Lio/reactivex/functions/Function4<TT1;TT2;TT3;TT4;TR;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 554
    iput-object p1, p0, Lio/reactivex/internal/functions/Functions$Array4Func;->f:Lio/reactivex/functions/Function4;

    .line 555
    return-void
.end method


# virtual methods
.method public bridge synthetic apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 550
    .local p0, "this":Lio/reactivex/internal/functions/Functions$Array4Func;, "Lio/reactivex/internal/functions/Functions$Array4Func<TT1;TT2;TT3;TT4;TR;>;"
    check-cast p1, [Ljava/lang/Object;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lio/reactivex/internal/functions/Functions$Array4Func;->apply([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public apply([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5
    .param p1, "a"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Object;",
            ")TR;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 560
    .local p0, "this":Lio/reactivex/internal/functions/Functions$Array4Func;, "Lio/reactivex/internal/functions/Functions$Array4Func<TT1;TT2;TT3;TT4;TR;>;"
    array-length v0, p1

    const/4 v1, 0x4

    if-eq v0, v1, :cond_0

    .line 561
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Array of size 4 expected but got "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    array-length v2, p1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 563
    :cond_0
    iget-object v0, p0, Lio/reactivex/internal/functions/Functions$Array4Func;->f:Lio/reactivex/functions/Function4;

    const/4 v1, 0x0

    aget-object v1, p1, v1

    const/4 v2, 0x1

    aget-object v2, p1, v2

    const/4 v3, 0x2

    aget-object v3, p1, v3

    const/4 v4, 0x3

    aget-object v4, p1, v4

    invoke-interface {v0, v1, v2, v3, v4}, Lio/reactivex/functions/Function4;->apply(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method