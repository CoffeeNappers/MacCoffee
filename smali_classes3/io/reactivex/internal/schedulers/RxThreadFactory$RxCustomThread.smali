.class final Lio/reactivex/internal/schedulers/RxThreadFactory$RxCustomThread;
.super Ljava/lang/Thread;
.source "RxThreadFactory.java"

# interfaces
.implements Lio/reactivex/internal/schedulers/NonBlockingThread;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/schedulers/RxThreadFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "RxCustomThread"
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/Runnable;Ljava/lang/String;)V
    .locals 0
    .param p1, "run"    # Ljava/lang/Runnable;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 87
    invoke-direct {p0, p1, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 88
    return-void
.end method
