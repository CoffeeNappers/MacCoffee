.class public final Lio/reactivex/internal/operators/completable/CompletableNever;
.super Lio/reactivex/Completable;
.source "CompletableNever.java"


# static fields
.field public static final INSTANCE:Lio/reactivex/Completable;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 20
    new-instance v0, Lio/reactivex/internal/operators/completable/CompletableNever;

    invoke-direct {v0}, Lio/reactivex/internal/operators/completable/CompletableNever;-><init>()V

    sput-object v0, Lio/reactivex/internal/operators/completable/CompletableNever;->INSTANCE:Lio/reactivex/Completable;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Lio/reactivex/Completable;-><init>()V

    .line 23
    return-void
.end method


# virtual methods
.method protected subscribeActual(Lio/reactivex/CompletableObserver;)V
    .locals 1
    .param p1, "s"    # Lio/reactivex/CompletableObserver;

    .prologue
    .line 27
    sget-object v0, Lio/reactivex/internal/disposables/EmptyDisposable;->NEVER:Lio/reactivex/internal/disposables/EmptyDisposable;

    invoke-interface {p1, v0}, Lio/reactivex/CompletableObserver;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 28
    return-void
.end method
