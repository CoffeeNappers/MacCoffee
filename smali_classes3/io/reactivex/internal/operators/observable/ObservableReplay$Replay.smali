.class final Lio/reactivex/internal/operators/observable/ObservableReplay$Replay;
.super Lio/reactivex/observables/ConnectableObservable;
.source "ObservableReplay.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableReplay;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Replay"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/observables/ConnectableObservable",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private final co:Lio/reactivex/observables/ConnectableObservable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/observables/ConnectableObservable",
            "<TT;>;"
        }
    .end annotation
.end field

.field private final observable:Lio/reactivex/Observable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lio/reactivex/observables/ConnectableObservable;Lio/reactivex/Observable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/observables/ConnectableObservable",
            "<TT;>;",
            "Lio/reactivex/Observable",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 1049
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableReplay$Replay;, "Lio/reactivex/internal/operators/observable/ObservableReplay$Replay<TT;>;"
    .local p1, "co":Lio/reactivex/observables/ConnectableObservable;, "Lio/reactivex/observables/ConnectableObservable<TT;>;"
    .local p2, "observable":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-direct {p0}, Lio/reactivex/observables/ConnectableObservable;-><init>()V

    .line 1050
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableReplay$Replay;->co:Lio/reactivex/observables/ConnectableObservable;

    .line 1051
    iput-object p2, p0, Lio/reactivex/internal/operators/observable/ObservableReplay$Replay;->observable:Lio/reactivex/Observable;

    .line 1052
    return-void
.end method


# virtual methods
.method public connect(Lio/reactivex/functions/Consumer;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Consumer",
            "<-",
            "Lio/reactivex/disposables/Disposable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1056
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableReplay$Replay;, "Lio/reactivex/internal/operators/observable/ObservableReplay$Replay<TT;>;"
    .local p1, "connection":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-Lio/reactivex/disposables/Disposable;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableReplay$Replay;->co:Lio/reactivex/observables/ConnectableObservable;

    invoke-virtual {v0, p1}, Lio/reactivex/observables/ConnectableObservable;->connect(Lio/reactivex/functions/Consumer;)V

    .line 1057
    return-void
.end method

.method protected subscribeActual(Lio/reactivex/Observer;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 1061
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableReplay$Replay;, "Lio/reactivex/internal/operators/observable/ObservableReplay$Replay<TT;>;"
    .local p1, "observer":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableReplay$Replay;->observable:Lio/reactivex/Observable;

    invoke-virtual {v0, p1}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/Observer;)V

    .line 1062
    return-void
.end method
