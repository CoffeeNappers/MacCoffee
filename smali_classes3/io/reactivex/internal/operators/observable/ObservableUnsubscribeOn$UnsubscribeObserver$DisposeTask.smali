.class final Lio/reactivex/internal/operators/observable/ObservableUnsubscribeOn$UnsubscribeObserver$DisposeTask;
.super Ljava/lang/Object;
.source "ObservableUnsubscribeOn.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableUnsubscribeOn$UnsubscribeObserver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "DisposeTask"
.end annotation


# instance fields
.field final synthetic this$0:Lio/reactivex/internal/operators/observable/ObservableUnsubscribeOn$UnsubscribeObserver;


# direct methods
.method constructor <init>(Lio/reactivex/internal/operators/observable/ObservableUnsubscribeOn$UnsubscribeObserver;)V
    .locals 0

    .prologue
    .line 92
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableUnsubscribeOn$UnsubscribeObserver$DisposeTask;, "Lio/reactivex/internal/operators/observable/ObservableUnsubscribeOn$UnsubscribeObserver<TT;>.DisposeTask;"
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableUnsubscribeOn$UnsubscribeObserver$DisposeTask;->this$0:Lio/reactivex/internal/operators/observable/ObservableUnsubscribeOn$UnsubscribeObserver;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 95
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableUnsubscribeOn$UnsubscribeObserver$DisposeTask;, "Lio/reactivex/internal/operators/observable/ObservableUnsubscribeOn$UnsubscribeObserver<TT;>.DisposeTask;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableUnsubscribeOn$UnsubscribeObserver$DisposeTask;->this$0:Lio/reactivex/internal/operators/observable/ObservableUnsubscribeOn$UnsubscribeObserver;

    iget-object v0, v0, Lio/reactivex/internal/operators/observable/ObservableUnsubscribeOn$UnsubscribeObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 96
    return-void
.end method
