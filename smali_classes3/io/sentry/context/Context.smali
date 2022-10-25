.class public Lio/sentry/context/Context;
.super Ljava/lang/Object;
.source "Context.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final DEFAULT_BREADCRUMB_LIMIT:I = 0x64


# instance fields
.field private breadcrumbs:Lio/sentry/util/CircularFifoQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/sentry/util/CircularFifoQueue",
            "<",
            "Lio/sentry/event/Breadcrumb;",
            ">;"
        }
    .end annotation
.end field

.field private lastEventId:Ljava/util/UUID;

.field private user:Lio/sentry/event/User;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 41
    const/16 v0, 0x64

    invoke-direct {p0, v0}, Lio/sentry/context/Context;-><init>(I)V

    .line 42
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "breadcrumbLimit"    # I

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    new-instance v0, Lio/sentry/util/CircularFifoQueue;

    invoke-direct {v0, p1}, Lio/sentry/util/CircularFifoQueue;-><init>(I)V

    iput-object v0, p0, Lio/sentry/context/Context;->breadcrumbs:Lio/sentry/util/CircularFifoQueue;

    .line 51
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 57
    iget-object v0, p0, Lio/sentry/context/Context;->breadcrumbs:Lio/sentry/util/CircularFifoQueue;

    invoke-virtual {v0}, Lio/sentry/util/CircularFifoQueue;->clear()V

    .line 58
    iput-object v1, p0, Lio/sentry/context/Context;->lastEventId:Ljava/util/UUID;

    .line 59
    iput-object v1, p0, Lio/sentry/context/Context;->user:Lio/sentry/event/User;

    .line 60
    return-void
.end method

.method public clearUser()V
    .locals 1

    .prologue
    .line 115
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lio/sentry/context/Context;->setUser(Lio/sentry/event/User;)V

    .line 116
    return-void
.end method

.method public getBreadcrumbs()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lio/sentry/event/Breadcrumb;",
            ">;"
        }
    .end annotation

    .prologue
    .line 68
    iget-object v0, p0, Lio/sentry/context/Context;->breadcrumbs:Lio/sentry/util/CircularFifoQueue;

    invoke-virtual {v0}, Lio/sentry/util/CircularFifoQueue;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public getLastEventId()Ljava/util/UUID;
    .locals 1

    .prologue
    .line 99
    iget-object v0, p0, Lio/sentry/context/Context;->lastEventId:Ljava/util/UUID;

    return-object v0
.end method

.method public getUser()Lio/sentry/event/User;
    .locals 1

    .prologue
    .line 124
    iget-object v0, p0, Lio/sentry/context/Context;->user:Lio/sentry/event/User;

    return-object v0
.end method

.method public recordBreadcrumb(Lio/sentry/event/Breadcrumb;)V
    .locals 1
    .param p1, "breadcrumb"    # Lio/sentry/event/Breadcrumb;

    .prologue
    .line 77
    iget-object v0, p0, Lio/sentry/context/Context;->breadcrumbs:Lio/sentry/util/CircularFifoQueue;

    invoke-virtual {v0, p1}, Lio/sentry/util/CircularFifoQueue;->add(Ljava/lang/Object;)Z

    .line 78
    return-void
.end method

.method public setLastEventId(Ljava/util/UUID;)V
    .locals 0
    .param p1, "id"    # Ljava/util/UUID;

    .prologue
    .line 86
    iput-object p1, p0, Lio/sentry/context/Context;->lastEventId:Ljava/util/UUID;

    .line 87
    return-void
.end method

.method public setUser(Lio/sentry/event/User;)V
    .locals 0
    .param p1, "user"    # Lio/sentry/event/User;

    .prologue
    .line 108
    iput-object p1, p0, Lio/sentry/context/Context;->user:Lio/sentry/event/User;

    .line 109
    return-void
.end method
