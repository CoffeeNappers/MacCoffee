.class final Lio/reactivex/internal/operators/single/SingleZipArray$SingletonArrayFunc;
.super Ljava/lang/Object;
.source "SingleZipArray.java"

# interfaces
.implements Lio/reactivex/functions/Function;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/single/SingleZipArray;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "SingletonArrayFunc"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/functions/Function",
        "<TT;TR;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lio/reactivex/internal/operators/single/SingleZipArray;


# direct methods
.method constructor <init>(Lio/reactivex/internal/operators/single/SingleZipArray;)V
    .locals 0

    .prologue
    .line 181
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleZipArray$SingletonArrayFunc;, "Lio/reactivex/internal/operators/single/SingleZipArray<TT;TR;>.SingletonArrayFunc;"
    iput-object p1, p0, Lio/reactivex/internal/operators/single/SingleZipArray$SingletonArrayFunc;->this$0:Lio/reactivex/internal/operators/single/SingleZipArray;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)TR;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 184
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleZipArray$SingletonArrayFunc;, "Lio/reactivex/internal/operators/single/SingleZipArray<TT;TR;>.SingletonArrayFunc;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lio/reactivex/internal/operators/single/SingleZipArray$SingletonArrayFunc;->this$0:Lio/reactivex/internal/operators/single/SingleZipArray;

    iget-object v0, v0, Lio/reactivex/internal/operators/single/SingleZipArray;->zipper:Lio/reactivex/functions/Function;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-interface {v0, v1}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
