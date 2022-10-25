.class final Lio/reactivex/disposables/ActionDisposable;
.super Lio/reactivex/disposables/ReferenceDisposable;
.source "ActionDisposable.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lio/reactivex/disposables/ReferenceDisposable",
        "<",
        "Lio/reactivex/functions/Action;",
        ">;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x721258278bee89a1L


# direct methods
.method constructor <init>(Lio/reactivex/functions/Action;)V
    .locals 0
    .param p1, "value"    # Lio/reactivex/functions/Action;

    .prologue
    .line 23
    invoke-direct {p0, p1}, Lio/reactivex/disposables/ReferenceDisposable;-><init>(Ljava/lang/Object;)V

    .line 24
    return-void
.end method


# virtual methods
.method protected onDisposed(Lio/reactivex/functions/Action;)V
    .locals 2
    .param p1, "value"    # Lio/reactivex/functions/Action;

    .prologue
    .line 29
    :try_start_0
    invoke-interface {p1}, Lio/reactivex/functions/Action;->run()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 33
    return-void

    .line 30
    :catch_0
    move-exception v0

    .line 31
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/internal/util/ExceptionHelper;->wrapOrThrow(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1
.end method

.method protected bridge synthetic onDisposed(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 18
    check-cast p1, Lio/reactivex/functions/Action;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lio/reactivex/disposables/ActionDisposable;->onDisposed(Lio/reactivex/functions/Action;)V

    return-void
.end method
