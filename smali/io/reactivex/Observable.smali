.class public abstract Lio/reactivex/Observable;
.super Ljava/lang/Object;
.source "Observable.java"

# interfaces
.implements Lio/reactivex/ObservableSource;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/Observable$1;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lio/reactivex/ObservableSource",
        "<TT;>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 58
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12580
    return-void
.end method

.method public static amb(Ljava/lang/Iterable;)Lio/reactivex/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Iterable",
            "<+",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 81
    .local p0, "sources":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Lio/reactivex/ObservableSource<+TT;>;>;"
    const-string/jumbo v0, "sources is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 82
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableAmb;

    const/4 v1, 0x0

    invoke-direct {v0, v1, p0}, Lio/reactivex/internal/operators/observable/ObservableAmb;-><init>([Lio/reactivex/ObservableSource;Ljava/lang/Iterable;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static varargs ambArray([Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 107
    .local p0, "sources":[Lio/reactivex/ObservableSource;, "[Lio/reactivex/ObservableSource<+TT;>;"
    const-string/jumbo v1, "sources is null"

    invoke-static {p0, v1}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 108
    array-length v0, p0

    .line 109
    .local v0, "len":I
    if-nez v0, :cond_0

    .line 110
    invoke-static {}, Lio/reactivex/Observable;->empty()Lio/reactivex/Observable;

    move-result-object v1

    .line 115
    :goto_0
    return-object v1

    .line 112
    :cond_0
    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 113
    const/4 v1, 0x0

    aget-object v1, p0, v1

    invoke-static {v1}, Lio/reactivex/Observable;->wrap(Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;

    move-result-object v1

    goto :goto_0

    .line 115
    :cond_1
    new-instance v1, Lio/reactivex/internal/operators/observable/ObservableAmb;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lio/reactivex/internal/operators/observable/ObservableAmb;-><init>([Lio/reactivex/ObservableSource;Ljava/lang/Iterable;)V

    invoke-static {v1}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v1

    goto :goto_0
.end method

.method public static bufferSize()I
    .locals 1

    .prologue
    .line 126
    invoke-static {}, Lio/reactivex/Flowable;->bufferSize()I

    move-result v0

    return v0
.end method

.method public static combineLatest(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function9;)Lio/reactivex/Observable;
    .locals 4
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
            "T5:",
            "Ljava/lang/Object;",
            "T6:",
            "Ljava/lang/Object;",
            "T7:",
            "Ljava/lang/Object;",
            "T8:",
            "Ljava/lang/Object;",
            "T9:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<+TT1;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT2;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT3;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT4;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT5;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT6;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT7;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT8;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT9;>;",
            "Lio/reactivex/functions/Function9",
            "<-TT1;-TT2;-TT3;-TT4;-TT5;-TT6;-TT7;-TT8;-TT9;+TR;>;)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 768
    .local p0, "source1":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT1;>;"
    .local p1, "source2":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT2;>;"
    .local p2, "source3":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT3;>;"
    .local p3, "source4":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT4;>;"
    .local p4, "source5":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT5;>;"
    .local p5, "source6":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT6;>;"
    .local p6, "source7":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT7;>;"
    .local p7, "source8":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT8;>;"
    .local p8, "source9":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT9;>;"
    .local p9, "combiner":Lio/reactivex/functions/Function9;, "Lio/reactivex/functions/Function9<-TT1;-TT2;-TT3;-TT4;-TT5;-TT6;-TT7;-TT8;-TT9;+TR;>;"
    const-string/jumbo v0, "source1 is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 769
    const-string/jumbo v0, "source2 is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 770
    const-string/jumbo v0, "source3 is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 771
    const-string/jumbo v0, "source4 is null"

    invoke-static {p3, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 772
    const-string/jumbo v0, "source5 is null"

    invoke-static {p4, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 773
    const-string/jumbo v0, "source6 is null"

    invoke-static {p5, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 774
    const-string/jumbo v0, "source7 is null"

    invoke-static {p6, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 775
    const-string/jumbo v0, "source8 is null"

    invoke-static {p7, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 776
    const-string/jumbo v0, "source9 is null"

    invoke-static {p8, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 777
    invoke-static {p9}, Lio/reactivex/internal/functions/Functions;->toFunction(Lio/reactivex/functions/Function9;)Lio/reactivex/functions/Function;

    move-result-object v0

    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v1

    const/16 v2, 0x9

    new-array v2, v2, [Lio/reactivex/ObservableSource;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    const/4 v3, 0x1

    aput-object p1, v2, v3

    const/4 v3, 0x2

    aput-object p2, v2, v3

    const/4 v3, 0x3

    aput-object p3, v2, v3

    const/4 v3, 0x4

    aput-object p4, v2, v3

    const/4 v3, 0x5

    aput-object p5, v2, v3

    const/4 v3, 0x6

    aput-object p6, v2, v3

    const/4 v3, 0x7

    aput-object p7, v2, v3

    const/16 v3, 0x8

    aput-object p8, v2, v3

    invoke-static {v0, v1, v2}, Lio/reactivex/Observable;->combineLatest(Lio/reactivex/functions/Function;I[Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static combineLatest(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function8;)Lio/reactivex/Observable;
    .locals 4
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
            "T5:",
            "Ljava/lang/Object;",
            "T6:",
            "Ljava/lang/Object;",
            "T7:",
            "Ljava/lang/Object;",
            "T8:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<+TT1;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT2;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT3;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT4;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT5;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT6;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT7;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT8;>;",
            "Lio/reactivex/functions/Function8",
            "<-TT1;-TT2;-TT3;-TT4;-TT5;-TT6;-TT7;-TT8;+TR;>;)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 698
    .local p0, "source1":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT1;>;"
    .local p1, "source2":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT2;>;"
    .local p2, "source3":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT3;>;"
    .local p3, "source4":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT4;>;"
    .local p4, "source5":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT5;>;"
    .local p5, "source6":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT6;>;"
    .local p6, "source7":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT7;>;"
    .local p7, "source8":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT8;>;"
    .local p8, "combiner":Lio/reactivex/functions/Function8;, "Lio/reactivex/functions/Function8<-TT1;-TT2;-TT3;-TT4;-TT5;-TT6;-TT7;-TT8;+TR;>;"
    const-string/jumbo v0, "source1 is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 699
    const-string/jumbo v0, "source2 is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 700
    const-string/jumbo v0, "source3 is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 701
    const-string/jumbo v0, "source4 is null"

    invoke-static {p3, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 702
    const-string/jumbo v0, "source5 is null"

    invoke-static {p4, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 703
    const-string/jumbo v0, "source6 is null"

    invoke-static {p5, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 704
    const-string/jumbo v0, "source7 is null"

    invoke-static {p6, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 705
    const-string/jumbo v0, "source8 is null"

    invoke-static {p7, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 706
    invoke-static {p8}, Lio/reactivex/internal/functions/Functions;->toFunction(Lio/reactivex/functions/Function8;)Lio/reactivex/functions/Function;

    move-result-object v0

    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v1

    const/16 v2, 0x8

    new-array v2, v2, [Lio/reactivex/ObservableSource;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    const/4 v3, 0x1

    aput-object p1, v2, v3

    const/4 v3, 0x2

    aput-object p2, v2, v3

    const/4 v3, 0x3

    aput-object p3, v2, v3

    const/4 v3, 0x4

    aput-object p4, v2, v3

    const/4 v3, 0x5

    aput-object p5, v2, v3

    const/4 v3, 0x6

    aput-object p6, v2, v3

    const/4 v3, 0x7

    aput-object p7, v2, v3

    invoke-static {v0, v1, v2}, Lio/reactivex/Observable;->combineLatest(Lio/reactivex/functions/Function;I[Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static combineLatest(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function7;)Lio/reactivex/Observable;
    .locals 4
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
            "T5:",
            "Ljava/lang/Object;",
            "T6:",
            "Ljava/lang/Object;",
            "T7:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<+TT1;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT2;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT3;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT4;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT5;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT6;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT7;>;",
            "Lio/reactivex/functions/Function7",
            "<-TT1;-TT2;-TT3;-TT4;-TT5;-TT6;-TT7;+TR;>;)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 633
    .local p0, "source1":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT1;>;"
    .local p1, "source2":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT2;>;"
    .local p2, "source3":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT3;>;"
    .local p3, "source4":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT4;>;"
    .local p4, "source5":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT5;>;"
    .local p5, "source6":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT6;>;"
    .local p6, "source7":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT7;>;"
    .local p7, "combiner":Lio/reactivex/functions/Function7;, "Lio/reactivex/functions/Function7<-TT1;-TT2;-TT3;-TT4;-TT5;-TT6;-TT7;+TR;>;"
    const-string/jumbo v0, "source1 is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 634
    const-string/jumbo v0, "source2 is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 635
    const-string/jumbo v0, "source3 is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 636
    const-string/jumbo v0, "source4 is null"

    invoke-static {p3, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 637
    const-string/jumbo v0, "source5 is null"

    invoke-static {p4, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 638
    const-string/jumbo v0, "source6 is null"

    invoke-static {p5, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 639
    const-string/jumbo v0, "source7 is null"

    invoke-static {p6, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 640
    invoke-static {p7}, Lio/reactivex/internal/functions/Functions;->toFunction(Lio/reactivex/functions/Function7;)Lio/reactivex/functions/Function;

    move-result-object v0

    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v1

    const/4 v2, 0x7

    new-array v2, v2, [Lio/reactivex/ObservableSource;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    const/4 v3, 0x1

    aput-object p1, v2, v3

    const/4 v3, 0x2

    aput-object p2, v2, v3

    const/4 v3, 0x3

    aput-object p3, v2, v3

    const/4 v3, 0x4

    aput-object p4, v2, v3

    const/4 v3, 0x5

    aput-object p5, v2, v3

    const/4 v3, 0x6

    aput-object p6, v2, v3

    invoke-static {v0, v1, v2}, Lio/reactivex/Observable;->combineLatest(Lio/reactivex/functions/Function;I[Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static combineLatest(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function6;)Lio/reactivex/Observable;
    .locals 4
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
            "T5:",
            "Ljava/lang/Object;",
            "T6:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<+TT1;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT2;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT3;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT4;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT5;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT6;>;",
            "Lio/reactivex/functions/Function6",
            "<-TT1;-TT2;-TT3;-TT4;-TT5;-TT6;+TR;>;)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 572
    .local p0, "source1":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT1;>;"
    .local p1, "source2":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT2;>;"
    .local p2, "source3":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT3;>;"
    .local p3, "source4":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT4;>;"
    .local p4, "source5":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT5;>;"
    .local p5, "source6":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT6;>;"
    .local p6, "combiner":Lio/reactivex/functions/Function6;, "Lio/reactivex/functions/Function6<-TT1;-TT2;-TT3;-TT4;-TT5;-TT6;+TR;>;"
    const-string/jumbo v0, "source1 is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 573
    const-string/jumbo v0, "source2 is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 574
    const-string/jumbo v0, "source3 is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 575
    const-string/jumbo v0, "source4 is null"

    invoke-static {p3, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 576
    const-string/jumbo v0, "source5 is null"

    invoke-static {p4, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 577
    const-string/jumbo v0, "source6 is null"

    invoke-static {p5, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 578
    invoke-static {p6}, Lio/reactivex/internal/functions/Functions;->toFunction(Lio/reactivex/functions/Function6;)Lio/reactivex/functions/Function;

    move-result-object v0

    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v1

    const/4 v2, 0x6

    new-array v2, v2, [Lio/reactivex/ObservableSource;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    const/4 v3, 0x1

    aput-object p1, v2, v3

    const/4 v3, 0x2

    aput-object p2, v2, v3

    const/4 v3, 0x3

    aput-object p3, v2, v3

    const/4 v3, 0x4

    aput-object p4, v2, v3

    const/4 v3, 0x5

    aput-object p5, v2, v3

    invoke-static {v0, v1, v2}, Lio/reactivex/Observable;->combineLatest(Lio/reactivex/functions/Function;I[Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static combineLatest(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function5;)Lio/reactivex/Observable;
    .locals 4
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
            "T5:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<+TT1;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT2;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT3;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT4;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT5;>;",
            "Lio/reactivex/functions/Function5",
            "<-TT1;-TT2;-TT3;-TT4;-TT5;+TR;>;)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 516
    .local p0, "source1":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT1;>;"
    .local p1, "source2":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT2;>;"
    .local p2, "source3":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT3;>;"
    .local p3, "source4":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT4;>;"
    .local p4, "source5":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT5;>;"
    .local p5, "combiner":Lio/reactivex/functions/Function5;, "Lio/reactivex/functions/Function5<-TT1;-TT2;-TT3;-TT4;-TT5;+TR;>;"
    const-string/jumbo v0, "source1 is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 517
    const-string/jumbo v0, "source2 is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 518
    const-string/jumbo v0, "source3 is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 519
    const-string/jumbo v0, "source4 is null"

    invoke-static {p3, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 520
    const-string/jumbo v0, "source5 is null"

    invoke-static {p4, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 521
    invoke-static {p5}, Lio/reactivex/internal/functions/Functions;->toFunction(Lio/reactivex/functions/Function5;)Lio/reactivex/functions/Function;

    move-result-object v0

    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v1

    const/4 v2, 0x5

    new-array v2, v2, [Lio/reactivex/ObservableSource;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    const/4 v3, 0x1

    aput-object p1, v2, v3

    const/4 v3, 0x2

    aput-object p2, v2, v3

    const/4 v3, 0x3

    aput-object p3, v2, v3

    const/4 v3, 0x4

    aput-object p4, v2, v3

    invoke-static {v0, v1, v2}, Lio/reactivex/Observable;->combineLatest(Lio/reactivex/functions/Function;I[Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static combineLatest(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function4;)Lio/reactivex/Observable;
    .locals 4
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
            ">(",
            "Lio/reactivex/ObservableSource",
            "<+TT1;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT2;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT3;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT4;>;",
            "Lio/reactivex/functions/Function4",
            "<-TT1;-TT2;-TT3;-TT4;+TR;>;)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 464
    .local p0, "source1":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT1;>;"
    .local p1, "source2":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT2;>;"
    .local p2, "source3":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT3;>;"
    .local p3, "source4":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT4;>;"
    .local p4, "combiner":Lio/reactivex/functions/Function4;, "Lio/reactivex/functions/Function4<-TT1;-TT2;-TT3;-TT4;+TR;>;"
    const-string/jumbo v0, "source1 is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 465
    const-string/jumbo v0, "source2 is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 466
    const-string/jumbo v0, "source3 is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 467
    const-string/jumbo v0, "source4 is null"

    invoke-static {p3, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 468
    invoke-static {p4}, Lio/reactivex/internal/functions/Functions;->toFunction(Lio/reactivex/functions/Function4;)Lio/reactivex/functions/Function;

    move-result-object v0

    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v1

    const/4 v2, 0x4

    new-array v2, v2, [Lio/reactivex/ObservableSource;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    const/4 v3, 0x1

    aput-object p1, v2, v3

    const/4 v3, 0x2

    aput-object p2, v2, v3

    const/4 v3, 0x3

    aput-object p3, v2, v3

    invoke-static {v0, v1, v2}, Lio/reactivex/Observable;->combineLatest(Lio/reactivex/functions/Function;I[Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static combineLatest(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function3;)Lio/reactivex/Observable;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            "T2:",
            "Ljava/lang/Object;",
            "T3:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<+TT1;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT2;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT3;>;",
            "Lio/reactivex/functions/Function3",
            "<-TT1;-TT2;-TT3;+TR;>;)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 417
    .local p0, "source1":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT1;>;"
    .local p1, "source2":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT2;>;"
    .local p2, "source3":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT3;>;"
    .local p3, "combiner":Lio/reactivex/functions/Function3;, "Lio/reactivex/functions/Function3<-TT1;-TT2;-TT3;+TR;>;"
    const-string/jumbo v0, "source1 is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 418
    const-string/jumbo v0, "source2 is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 419
    const-string/jumbo v0, "source3 is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 420
    invoke-static {p3}, Lio/reactivex/internal/functions/Functions;->toFunction(Lio/reactivex/functions/Function3;)Lio/reactivex/functions/Function;

    move-result-object v0

    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v1

    const/4 v2, 0x3

    new-array v2, v2, [Lio/reactivex/ObservableSource;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    const/4 v3, 0x1

    aput-object p1, v2, v3

    const/4 v3, 0x2

    aput-object p2, v2, v3

    invoke-static {v0, v1, v2}, Lio/reactivex/Observable;->combineLatest(Lio/reactivex/functions/Function;I[Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static combineLatest(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/functions/BiFunction;)Lio/reactivex/Observable;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            "T2:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<+TT1;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT2;>;",
            "Lio/reactivex/functions/BiFunction",
            "<-TT1;-TT2;+TR;>;)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 374
    .local p0, "source1":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT1;>;"
    .local p1, "source2":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT2;>;"
    .local p2, "combiner":Lio/reactivex/functions/BiFunction;, "Lio/reactivex/functions/BiFunction<-TT1;-TT2;+TR;>;"
    const-string/jumbo v0, "source1 is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 375
    const-string/jumbo v0, "source2 is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 376
    invoke-static {p2}, Lio/reactivex/internal/functions/Functions;->toFunction(Lio/reactivex/functions/BiFunction;)Lio/reactivex/functions/Function;

    move-result-object v0

    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v1

    const/4 v2, 0x2

    new-array v2, v2, [Lio/reactivex/ObservableSource;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    const/4 v3, 0x1

    aput-object p1, v2, v3

    invoke-static {v0, v1, v2}, Lio/reactivex/Observable;->combineLatest(Lio/reactivex/functions/Function;I[Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static varargs combineLatest(Lio/reactivex/functions/Function;I[Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;
    .locals 1
    .param p1, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-[",
            "Ljava/lang/Object;",
            "+TR;>;I[",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 165
    .local p0, "combiner":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-[Ljava/lang/Object;+TR;>;"
    .local p2, "sources":[Lio/reactivex/ObservableSource;, "[Lio/reactivex/ObservableSource<+TT;>;"
    invoke-static {p2, p0, p1}, Lio/reactivex/Observable;->combineLatest([Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;I)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static combineLatest(Ljava/lang/Iterable;Lio/reactivex/functions/Function;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Iterable",
            "<+",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;>;",
            "Lio/reactivex/functions/Function",
            "<-[",
            "Ljava/lang/Object;",
            "+TR;>;)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 203
    .local p0, "sources":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Lio/reactivex/ObservableSource<+TT;>;>;"
    .local p1, "combiner":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-[Ljava/lang/Object;+TR;>;"
    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v0

    invoke-static {p0, p1, v0}, Lio/reactivex/Observable;->combineLatest(Ljava/lang/Iterable;Lio/reactivex/functions/Function;I)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static combineLatest(Ljava/lang/Iterable;Lio/reactivex/functions/Function;I)Lio/reactivex/Observable;
    .locals 6
    .param p2, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Iterable",
            "<+",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;>;",
            "Lio/reactivex/functions/Function",
            "<-[",
            "Ljava/lang/Object;",
            "+TR;>;I)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 244
    .local p0, "sources":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Lio/reactivex/ObservableSource<+TT;>;>;"
    .local p1, "combiner":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-[Ljava/lang/Object;+TR;>;"
    const-string/jumbo v0, "sources is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 245
    const-string/jumbo v0, "combiner is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 246
    const-string/jumbo v0, "bufferSize"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(ILjava/lang/String;)I

    .line 249
    shl-int/lit8 v4, p2, 0x1

    .line 250
    .local v4, "s":I
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest;

    const/4 v1, 0x0

    const/4 v5, 0x0

    move-object v2, p0

    move-object v3, p1

    invoke-direct/range {v0 .. v5}, Lio/reactivex/internal/operators/observable/ObservableCombineLatest;-><init>([Lio/reactivex/ObservableSource;Ljava/lang/Iterable;Lio/reactivex/functions/Function;IZ)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static combineLatest([Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">([",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;",
            "Lio/reactivex/functions/Function",
            "<-[",
            "Ljava/lang/Object;",
            "+TR;>;)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 288
    .local p0, "sources":[Lio/reactivex/ObservableSource;, "[Lio/reactivex/ObservableSource<+TT;>;"
    .local p1, "combiner":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-[Ljava/lang/Object;+TR;>;"
    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v0

    invoke-static {p0, p1, v0}, Lio/reactivex/Observable;->combineLatest([Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;I)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static combineLatest([Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;I)Lio/reactivex/Observable;
    .locals 6
    .param p2, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">([",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;",
            "Lio/reactivex/functions/Function",
            "<-[",
            "Ljava/lang/Object;",
            "+TR;>;I)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 328
    .local p0, "sources":[Lio/reactivex/ObservableSource;, "[Lio/reactivex/ObservableSource<+TT;>;"
    .local p1, "combiner":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-[Ljava/lang/Object;+TR;>;"
    const-string/jumbo v0, "sources is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 329
    array-length v0, p0

    if-nez v0, :cond_0

    .line 330
    invoke-static {}, Lio/reactivex/Observable;->empty()Lio/reactivex/Observable;

    move-result-object v0

    .line 337
    :goto_0
    return-object v0

    .line 332
    :cond_0
    const-string/jumbo v0, "combiner is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 333
    const-string/jumbo v0, "bufferSize"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(ILjava/lang/String;)I

    .line 336
    shl-int/lit8 v4, p2, 0x1

    .line 337
    .local v4, "s":I
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest;

    const/4 v2, 0x0

    const/4 v5, 0x0

    move-object v1, p0

    move-object v3, p1

    invoke-direct/range {v0 .. v5}, Lio/reactivex/internal/operators/observable/ObservableCombineLatest;-><init>([Lio/reactivex/ObservableSource;Ljava/lang/Iterable;Lio/reactivex/functions/Function;IZ)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    goto :goto_0
.end method

.method public static varargs combineLatestDelayError(Lio/reactivex/functions/Function;I[Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;
    .locals 1
    .param p1, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-[",
            "Ljava/lang/Object;",
            "+TR;>;I[",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 854
    .local p0, "combiner":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-[Ljava/lang/Object;+TR;>;"
    .local p2, "sources":[Lio/reactivex/ObservableSource;, "[Lio/reactivex/ObservableSource<+TT;>;"
    invoke-static {p2, p0, p1}, Lio/reactivex/Observable;->combineLatestDelayError([Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;I)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static combineLatestDelayError(Ljava/lang/Iterable;Lio/reactivex/functions/Function;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Iterable",
            "<+",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;>;",
            "Lio/reactivex/functions/Function",
            "<-[",
            "Ljava/lang/Object;",
            "+TR;>;)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 941
    .local p0, "sources":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Lio/reactivex/ObservableSource<+TT;>;>;"
    .local p1, "combiner":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-[Ljava/lang/Object;+TR;>;"
    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v0

    invoke-static {p0, p1, v0}, Lio/reactivex/Observable;->combineLatestDelayError(Ljava/lang/Iterable;Lio/reactivex/functions/Function;I)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static combineLatestDelayError(Ljava/lang/Iterable;Lio/reactivex/functions/Function;I)Lio/reactivex/Observable;
    .locals 6
    .param p2, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Iterable",
            "<+",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;>;",
            "Lio/reactivex/functions/Function",
            "<-[",
            "Ljava/lang/Object;",
            "+TR;>;I)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 982
    .local p0, "sources":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Lio/reactivex/ObservableSource<+TT;>;>;"
    .local p1, "combiner":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-[Ljava/lang/Object;+TR;>;"
    const-string/jumbo v0, "sources is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 983
    const-string/jumbo v0, "combiner is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 984
    const-string/jumbo v0, "bufferSize"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(ILjava/lang/String;)I

    .line 987
    shl-int/lit8 v4, p2, 0x1

    .line 988
    .local v4, "s":I
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest;

    const/4 v1, 0x0

    const/4 v5, 0x1

    move-object v2, p0

    move-object v3, p1

    invoke-direct/range {v0 .. v5}, Lio/reactivex/internal/operators/observable/ObservableCombineLatest;-><init>([Lio/reactivex/ObservableSource;Ljava/lang/Iterable;Lio/reactivex/functions/Function;IZ)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static combineLatestDelayError([Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">([",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;",
            "Lio/reactivex/functions/Function",
            "<-[",
            "Ljava/lang/Object;",
            "+TR;>;)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 814
    .local p0, "sources":[Lio/reactivex/ObservableSource;, "[Lio/reactivex/ObservableSource<+TT;>;"
    .local p1, "combiner":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-[Ljava/lang/Object;+TR;>;"
    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v0

    invoke-static {p0, p1, v0}, Lio/reactivex/Observable;->combineLatestDelayError([Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;I)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static combineLatestDelayError([Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;I)Lio/reactivex/Observable;
    .locals 6
    .param p2, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">([",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;",
            "Lio/reactivex/functions/Function",
            "<-[",
            "Ljava/lang/Object;",
            "+TR;>;I)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 895
    .local p0, "sources":[Lio/reactivex/ObservableSource;, "[Lio/reactivex/ObservableSource<+TT;>;"
    .local p1, "combiner":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-[Ljava/lang/Object;+TR;>;"
    const-string/jumbo v0, "bufferSize"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(ILjava/lang/String;)I

    .line 896
    const-string/jumbo v0, "combiner is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 897
    array-length v0, p0

    if-nez v0, :cond_0

    .line 898
    invoke-static {}, Lio/reactivex/Observable;->empty()Lio/reactivex/Observable;

    move-result-object v0

    .line 902
    :goto_0
    return-object v0

    .line 901
    :cond_0
    shl-int/lit8 v4, p2, 0x1

    .line 902
    .local v4, "s":I
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest;

    const/4 v2, 0x0

    const/4 v5, 0x1

    move-object v1, p0

    move-object v3, p1

    invoke-direct/range {v0 .. v5}, Lio/reactivex/internal/operators/observable/ObservableCombineLatest;-><init>([Lio/reactivex/ObservableSource;Ljava/lang/Iterable;Lio/reactivex/functions/Function;IZ)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    goto :goto_0
.end method

.method public static concat(Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<+",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 1032
    .local p0, "sources":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+Lio/reactivex/ObservableSource<+TT;>;>;"
    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v0

    invoke-static {p0, v0}, Lio/reactivex/Observable;->concat(Lio/reactivex/ObservableSource;I)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static concat(Lio/reactivex/ObservableSource;I)Lio/reactivex/Observable;
    .locals 3
    .param p1, "prefetch"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<+",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;>;I)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 1058
    .local p0, "sources":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+Lio/reactivex/ObservableSource<+TT;>;>;"
    const-string/jumbo v0, "sources is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 1059
    const-string/jumbo v0, "prefetch"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(ILjava/lang/String;)I

    .line 1060
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableConcatMap;

    invoke-static {}, Lio/reactivex/internal/functions/Functions;->identity()Lio/reactivex/functions/Function;

    move-result-object v1

    sget-object v2, Lio/reactivex/internal/util/ErrorMode;->IMMEDIATE:Lio/reactivex/internal/util/ErrorMode;

    invoke-direct {v0, p0, v1, p1, v2}, Lio/reactivex/internal/operators/observable/ObservableConcatMap;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;ILio/reactivex/internal/util/ErrorMode;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static concat(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 1086
    .local p0, "source1":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    .local p1, "source2":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    const-string/jumbo v0, "source1 is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 1087
    const-string/jumbo v0, "source2 is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 1088
    const/4 v0, 0x2

    new-array v0, v0, [Lio/reactivex/ObservableSource;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    const/4 v1, 0x1

    aput-object p1, v0, v1

    invoke-static {v0}, Lio/reactivex/Observable;->concatArray([Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static concat(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 1118
    .local p0, "source1":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    .local p1, "source2":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    .local p2, "source3":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    const-string/jumbo v0, "source1 is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 1119
    const-string/jumbo v0, "source2 is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 1120
    const-string/jumbo v0, "source3 is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 1121
    const/4 v0, 0x3

    new-array v0, v0, [Lio/reactivex/ObservableSource;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    const/4 v1, 0x1

    aput-object p1, v0, v1

    const/4 v1, 0x2

    aput-object p2, v0, v1

    invoke-static {v0}, Lio/reactivex/Observable;->concatArray([Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static concat(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 1153
    .local p0, "source1":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    .local p1, "source2":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    .local p2, "source3":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    .local p3, "source4":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    const-string/jumbo v0, "source1 is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 1154
    const-string/jumbo v0, "source2 is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 1155
    const-string/jumbo v0, "source3 is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 1156
    const-string/jumbo v0, "source4 is null"

    invoke-static {p3, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 1157
    const/4 v0, 0x4

    new-array v0, v0, [Lio/reactivex/ObservableSource;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    const/4 v1, 0x1

    aput-object p1, v0, v1

    const/4 v1, 0x2

    aput-object p2, v0, v1

    const/4 v1, 0x3

    aput-object p3, v0, v1

    invoke-static {v0}, Lio/reactivex/Observable;->concatArray([Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static concat(Ljava/lang/Iterable;)Lio/reactivex/Observable;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Iterable",
            "<+",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 1008
    .local p0, "sources":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Lio/reactivex/ObservableSource<+TT;>;>;"
    const-string/jumbo v0, "sources is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 1009
    invoke-static {p0}, Lio/reactivex/Observable;->fromIterable(Ljava/lang/Iterable;)Lio/reactivex/Observable;

    move-result-object v0

    invoke-static {}, Lio/reactivex/internal/functions/Functions;->identity()Lio/reactivex/functions/Function;

    move-result-object v1

    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v2

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Lio/reactivex/Observable;->concatMapDelayError(Lio/reactivex/functions/Function;IZ)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static varargs concatArray([Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 1179
    .local p0, "sources":[Lio/reactivex/ObservableSource;, "[Lio/reactivex/ObservableSource<+TT;>;"
    array-length v0, p0

    if-nez v0, :cond_0

    .line 1180
    invoke-static {}, Lio/reactivex/Observable;->empty()Lio/reactivex/Observable;

    move-result-object v0

    .line 1185
    :goto_0
    return-object v0

    .line 1182
    :cond_0
    array-length v0, p0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 1183
    const/4 v0, 0x0

    aget-object v0, p0, v0

    invoke-static {v0}, Lio/reactivex/Observable;->wrap(Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;

    move-result-object v0

    goto :goto_0

    .line 1185
    :cond_1
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableConcatMap;

    invoke-static {p0}, Lio/reactivex/Observable;->fromArray([Ljava/lang/Object;)Lio/reactivex/Observable;

    move-result-object v1

    invoke-static {}, Lio/reactivex/internal/functions/Functions;->identity()Lio/reactivex/functions/Function;

    move-result-object v2

    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v3

    sget-object v4, Lio/reactivex/internal/util/ErrorMode;->BOUNDARY:Lio/reactivex/internal/util/ErrorMode;

    invoke-direct {v0, v1, v2, v3, v4}, Lio/reactivex/internal/operators/observable/ObservableConcatMap;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;ILio/reactivex/internal/util/ErrorMode;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    goto :goto_0
.end method

.method public static varargs concatArrayDelayError([Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 1206
    .local p0, "sources":[Lio/reactivex/ObservableSource;, "[Lio/reactivex/ObservableSource<+TT;>;"
    array-length v0, p0

    if-nez v0, :cond_0

    .line 1207
    invoke-static {}, Lio/reactivex/Observable;->empty()Lio/reactivex/Observable;

    move-result-object v0

    .line 1212
    :goto_0
    return-object v0

    .line 1209
    :cond_0
    array-length v0, p0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 1210
    const/4 v0, 0x0

    aget-object v0, p0, v0

    invoke-static {v0}, Lio/reactivex/Observable;->wrap(Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;

    move-result-object v0

    goto :goto_0

    .line 1212
    :cond_1
    invoke-static {p0}, Lio/reactivex/Observable;->fromArray([Ljava/lang/Object;)Lio/reactivex/Observable;

    move-result-object v0

    invoke-static {v0}, Lio/reactivex/Observable;->concatDelayError(Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;

    move-result-object v0

    goto :goto_0
.end method

.method public static varargs concatArrayEager(II[Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;
    .locals 3
    .param p0, "maxConcurrency"    # I
    .param p1, "prefetch"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(II[",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 1260
    .local p2, "sources":[Lio/reactivex/ObservableSource;, "[Lio/reactivex/ObservableSource<+TT;>;"
    invoke-static {p2}, Lio/reactivex/Observable;->fromArray([Ljava/lang/Object;)Lio/reactivex/Observable;

    move-result-object v0

    invoke-static {}, Lio/reactivex/internal/functions/Functions;->identity()Lio/reactivex/functions/Function;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p0, p1, v2}, Lio/reactivex/Observable;->concatMapEagerDelayError(Lio/reactivex/functions/Function;IIZ)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static varargs concatArrayEager([Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 1235
    .local p0, "sources":[Lio/reactivex/ObservableSource;, "[Lio/reactivex/ObservableSource<+TT;>;"
    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v0

    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v1

    invoke-static {v0, v1, p0}, Lio/reactivex/Observable;->concatArrayEager(II[Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static concatDelayError(Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<+",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 1301
    .local p0, "sources":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+Lio/reactivex/ObservableSource<+TT;>;>;"
    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v0

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Lio/reactivex/Observable;->concatDelayError(Lio/reactivex/ObservableSource;IZ)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static concatDelayError(Lio/reactivex/ObservableSource;IZ)Lio/reactivex/Observable;
    .locals 3
    .param p1, "prefetch"    # I
    .param p2, "tillTheEnd"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<+",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;>;IZ)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 1325
    .local p0, "sources":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+Lio/reactivex/ObservableSource<+TT;>;>;"
    const-string/jumbo v0, "sources is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 1326
    const-string/jumbo v0, "prefetch is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(ILjava/lang/String;)I

    .line 1327
    new-instance v1, Lio/reactivex/internal/operators/observable/ObservableConcatMap;

    invoke-static {}, Lio/reactivex/internal/functions/Functions;->identity()Lio/reactivex/functions/Function;

    move-result-object v2

    if-eqz p2, :cond_0

    sget-object v0, Lio/reactivex/internal/util/ErrorMode;->END:Lio/reactivex/internal/util/ErrorMode;

    :goto_0
    invoke-direct {v1, p0, v2, p1, v0}, Lio/reactivex/internal/operators/observable/ObservableConcatMap;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;ILio/reactivex/internal/util/ErrorMode;)V

    invoke-static {v1}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0

    :cond_0
    sget-object v0, Lio/reactivex/internal/util/ErrorMode;->BOUNDARY:Lio/reactivex/internal/util/ErrorMode;

    goto :goto_0
.end method

.method public static concatDelayError(Ljava/lang/Iterable;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Iterable",
            "<+",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 1280
    .local p0, "sources":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Lio/reactivex/ObservableSource<+TT;>;>;"
    const-string/jumbo v0, "sources is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 1281
    invoke-static {p0}, Lio/reactivex/Observable;->fromIterable(Ljava/lang/Iterable;)Lio/reactivex/Observable;

    move-result-object v0

    invoke-static {v0}, Lio/reactivex/Observable;->concatDelayError(Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static concatEager(Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<+",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 1350
    .local p0, "sources":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+Lio/reactivex/ObservableSource<+TT;>;>;"
    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v0

    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v1

    invoke-static {p0, v0, v1}, Lio/reactivex/Observable;->concatEager(Lio/reactivex/ObservableSource;II)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static concatEager(Lio/reactivex/ObservableSource;II)Lio/reactivex/Observable;
    .locals 2
    .param p1, "maxConcurrency"    # I
    .param p2, "prefetch"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<+",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;>;II)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 1377
    .local p0, "sources":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+Lio/reactivex/ObservableSource<+TT;>;>;"
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string/jumbo v1, "maxConcurrency is null"

    invoke-static {v0, v1}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 1378
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string/jumbo v1, "prefetch is null"

    invoke-static {v0, v1}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 1379
    invoke-static {p0}, Lio/reactivex/Observable;->wrap(Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;

    move-result-object v0

    invoke-static {}, Lio/reactivex/internal/functions/Functions;->identity()Lio/reactivex/functions/Function;

    move-result-object v1

    invoke-virtual {v0, v1, p1, p2}, Lio/reactivex/Observable;->concatMapEager(Lio/reactivex/functions/Function;II)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static concatEager(Ljava/lang/Iterable;)Lio/reactivex/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Iterable",
            "<+",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 1402
    .local p0, "sources":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Lio/reactivex/ObservableSource<+TT;>;>;"
    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v0

    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v1

    invoke-static {p0, v0, v1}, Lio/reactivex/Observable;->concatEager(Ljava/lang/Iterable;II)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static concatEager(Ljava/lang/Iterable;II)Lio/reactivex/Observable;
    .locals 3
    .param p1, "maxConcurrency"    # I
    .param p2, "prefetch"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Iterable",
            "<+",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;>;II)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 1429
    .local p0, "sources":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Lio/reactivex/ObservableSource<+TT;>;>;"
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string/jumbo v1, "maxConcurrency is null"

    invoke-static {v0, v1}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 1430
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string/jumbo v1, "prefetch is null"

    invoke-static {v0, v1}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 1431
    invoke-static {p0}, Lio/reactivex/Observable;->fromIterable(Ljava/lang/Iterable;)Lio/reactivex/Observable;

    move-result-object v0

    invoke-static {}, Lio/reactivex/internal/functions/Functions;->identity()Lio/reactivex/functions/Function;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, p2, v2}, Lio/reactivex/Observable;->concatMapEagerDelayError(Lio/reactivex/functions/Function;IIZ)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static create(Lio/reactivex/ObservableOnSubscribe;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableOnSubscribe",
            "<TT;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 1481
    .local p0, "source":Lio/reactivex/ObservableOnSubscribe;, "Lio/reactivex/ObservableOnSubscribe<TT;>;"
    const-string/jumbo v0, "source is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 1482
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableCreate;

    invoke-direct {v0, p0}, Lio/reactivex/internal/operators/observable/ObservableCreate;-><init>(Lio/reactivex/ObservableOnSubscribe;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static defer(Ljava/util/concurrent/Callable;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable",
            "<+",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 1512
    .local p0, "supplier":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<+Lio/reactivex/ObservableSource<+TT;>;>;"
    const-string/jumbo v0, "supplier is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 1513
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableDefer;

    invoke-direct {v0, p0}, Lio/reactivex/internal/operators/observable/ObservableDefer;-><init>(Ljava/util/concurrent/Callable;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method private doOnEach(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Action;Lio/reactivex/functions/Action;)Lio/reactivex/Observable;
    .locals 6
    .param p3, "onComplete"    # Lio/reactivex/functions/Action;
    .param p4, "onAfterTerminate"    # Lio/reactivex/functions/Action;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Consumer",
            "<-TT;>;",
            "Lio/reactivex/functions/Consumer",
            "<-",
            "Ljava/lang/Throwable;",
            ">;",
            "Lio/reactivex/functions/Action;",
            "Lio/reactivex/functions/Action;",
            ")",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 6951
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "onNext":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-TT;>;"
    .local p2, "onError":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-Ljava/lang/Throwable;>;"
    const-string/jumbo v0, "onNext is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 6952
    const-string/jumbo v0, "onError is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 6953
    const-string/jumbo v0, "onComplete is null"

    invoke-static {p3, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 6954
    const-string/jumbo v0, "onAfterTerminate is null"

    invoke-static {p4, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 6955
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableDoOnEach;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lio/reactivex/internal/operators/observable/ObservableDoOnEach;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Action;Lio/reactivex/functions/Action;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static empty()Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 1536
    sget-object v0, Lio/reactivex/internal/operators/observable/ObservableEmpty;->INSTANCE:Lio/reactivex/Observable;

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static error(Ljava/lang/Throwable;)Lio/reactivex/Observable;
    .locals 1
    .param p0, "exception"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Throwable;",
            ")",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 1585
    const-string/jumbo v0, "e is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 1586
    invoke-static {p0}, Lio/reactivex/internal/functions/Functions;->justCallable(Ljava/lang/Object;)Ljava/util/concurrent/Callable;

    move-result-object v0

    invoke-static {v0}, Lio/reactivex/Observable;->error(Ljava/util/concurrent/Callable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static error(Ljava/util/concurrent/Callable;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable",
            "<+",
            "Ljava/lang/Throwable;",
            ">;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 1560
    .local p0, "errorSupplier":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<+Ljava/lang/Throwable;>;"
    const-string/jumbo v0, "errorSupplier is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 1561
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableError;

    invoke-direct {v0, p0}, Lio/reactivex/internal/operators/observable/ObservableError;-><init>(Ljava/util/concurrent/Callable;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static varargs fromArray([Ljava/lang/Object;)Lio/reactivex/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 1608
    .local p0, "items":[Ljava/lang/Object;, "[TT;"
    const-string/jumbo v0, "items is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 1609
    array-length v0, p0

    if-nez v0, :cond_0

    .line 1610
    invoke-static {}, Lio/reactivex/Observable;->empty()Lio/reactivex/Observable;

    move-result-object v0

    .line 1615
    :goto_0
    return-object v0

    .line 1612
    :cond_0
    array-length v0, p0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 1613
    const/4 v0, 0x0

    aget-object v0, p0, v0

    invoke-static {v0}, Lio/reactivex/Observable;->just(Ljava/lang/Object;)Lio/reactivex/Observable;

    move-result-object v0

    goto :goto_0

    .line 1615
    :cond_1
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableFromArray;

    invoke-direct {v0, p0}, Lio/reactivex/internal/operators/observable/ObservableFromArray;-><init>([Ljava/lang/Object;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    goto :goto_0
.end method

.method public static fromCallable(Ljava/util/concurrent/Callable;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable",
            "<+TT;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 1643
    .local p0, "supplier":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<+TT;>;"
    const-string/jumbo v0, "supplier is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 1644
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableFromCallable;

    invoke-direct {v0, p0}, Lio/reactivex/internal/operators/observable/ObservableFromCallable;-><init>(Ljava/util/concurrent/Callable;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static fromFuture(Ljava/util/concurrent/Future;)Lio/reactivex/Observable;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Future",
            "<+TT;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 1676
    .local p0, "future":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<+TT;>;"
    const-string/jumbo v0, "future is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 1677
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableFromFuture;

    const-wide/16 v2, 0x0

    const/4 v1, 0x0

    invoke-direct {v0, p0, v2, v3, v1}, Lio/reactivex/internal/operators/observable/ObservableFromFuture;-><init>(Ljava/util/concurrent/Future;JLjava/util/concurrent/TimeUnit;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static fromFuture(Ljava/util/concurrent/Future;JLjava/util/concurrent/TimeUnit;)Lio/reactivex/Observable;
    .locals 1
    .param p1, "timeout"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Future",
            "<+TT;>;J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 1713
    .local p0, "future":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<+TT;>;"
    const-string/jumbo v0, "future is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 1714
    const-string/jumbo v0, "unit is null"

    invoke-static {p3, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 1715
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableFromFuture;

    invoke-direct {v0, p0, p1, p2, p3}, Lio/reactivex/internal/operators/observable/ObservableFromFuture;-><init>(Ljava/util/concurrent/Future;JLjava/util/concurrent/TimeUnit;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static fromFuture(Ljava/util/concurrent/Future;JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;
    .locals 3
    .param p1, "timeout"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "scheduler"    # Lio/reactivex/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Future",
            "<+TT;>;J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            ")",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "custom"
    .end annotation

    .prologue
    .line 1754
    .local p0, "future":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<+TT;>;"
    const-string/jumbo v1, "scheduler is null"

    invoke-static {p4, v1}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 1755
    invoke-static {p0, p1, p2, p3}, Lio/reactivex/Observable;->fromFuture(Ljava/util/concurrent/Future;JLjava/util/concurrent/TimeUnit;)Lio/reactivex/Observable;

    move-result-object v0

    .line 1756
    .local v0, "o":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-virtual {v0, p4}, Lio/reactivex/Observable;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v1

    return-object v1
.end method

.method public static fromFuture(Ljava/util/concurrent/Future;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;
    .locals 2
    .param p1, "scheduler"    # Lio/reactivex/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Future",
            "<+TT;>;",
            "Lio/reactivex/Scheduler;",
            ")",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "custom"
    .end annotation

    .prologue
    .line 1789
    .local p0, "future":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<+TT;>;"
    const-string/jumbo v1, "scheduler is null"

    invoke-static {p1, v1}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 1790
    invoke-static {p0}, Lio/reactivex/Observable;->fromFuture(Ljava/util/concurrent/Future;)Lio/reactivex/Observable;

    move-result-object v0

    .line 1791
    .local v0, "o":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-virtual {v0, p1}, Lio/reactivex/Observable;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v1

    return-object v1
.end method

.method public static fromIterable(Ljava/lang/Iterable;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Iterable",
            "<+TT;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 1814
    .local p0, "source":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+TT;>;"
    const-string/jumbo v0, "source is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 1815
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableFromIterable;

    invoke-direct {v0, p0}, Lio/reactivex/internal/operators/observable/ObservableFromIterable;-><init>(Ljava/lang/Iterable;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static fromPublisher(Lorg/reactivestreams/Publisher;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/reactivestreams/Publisher",
            "<+TT;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/BackpressureSupport;
        value = .enum Lio/reactivex/annotations/BackpressureKind;->UNBOUNDED_IN:Lio/reactivex/annotations/BackpressureKind;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 1836
    .local p0, "publisher":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<+TT;>;"
    const-string/jumbo v0, "publisher is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 1837
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableFromPublisher;

    invoke-direct {v0, p0}, Lio/reactivex/internal/operators/observable/ObservableFromPublisher;-><init>(Lorg/reactivestreams/Publisher;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static generate(Lio/reactivex/functions/Consumer;)Lio/reactivex/Observable;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Consumer",
            "<",
            "Lio/reactivex/Emitter",
            "<TT;>;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 1859
    .local p0, "generator":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<Lio/reactivex/Emitter<TT;>;>;"
    const-string/jumbo v0, "generator  is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 1860
    invoke-static {}, Lio/reactivex/internal/functions/Functions;->nullSupplier()Ljava/util/concurrent/Callable;

    move-result-object v0

    invoke-static {p0}, Lio/reactivex/internal/operators/observable/ObservableInternalHelper;->simpleGenerator(Lio/reactivex/functions/Consumer;)Lio/reactivex/functions/BiFunction;

    move-result-object v1

    invoke-static {}, Lio/reactivex/internal/functions/Functions;->emptyConsumer()Lio/reactivex/functions/Consumer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lio/reactivex/Observable;->generate(Ljava/util/concurrent/Callable;Lio/reactivex/functions/BiFunction;Lio/reactivex/functions/Consumer;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static generate(Ljava/util/concurrent/Callable;Lio/reactivex/functions/BiConsumer;)Lio/reactivex/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "S:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable",
            "<TS;>;",
            "Lio/reactivex/functions/BiConsumer",
            "<TS;",
            "Lio/reactivex/Emitter",
            "<TT;>;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 1885
    .local p0, "initialState":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<TS;>;"
    .local p1, "generator":Lio/reactivex/functions/BiConsumer;, "Lio/reactivex/functions/BiConsumer<TS;Lio/reactivex/Emitter<TT;>;>;"
    const-string/jumbo v0, "generator  is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 1886
    invoke-static {p1}, Lio/reactivex/internal/operators/observable/ObservableInternalHelper;->simpleBiGenerator(Lio/reactivex/functions/BiConsumer;)Lio/reactivex/functions/BiFunction;

    move-result-object v0

    invoke-static {}, Lio/reactivex/internal/functions/Functions;->emptyConsumer()Lio/reactivex/functions/Consumer;

    move-result-object v1

    invoke-static {p0, v0, v1}, Lio/reactivex/Observable;->generate(Ljava/util/concurrent/Callable;Lio/reactivex/functions/BiFunction;Lio/reactivex/functions/Consumer;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static generate(Ljava/util/concurrent/Callable;Lio/reactivex/functions/BiConsumer;Lio/reactivex/functions/Consumer;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "S:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable",
            "<TS;>;",
            "Lio/reactivex/functions/BiConsumer",
            "<TS;",
            "Lio/reactivex/Emitter",
            "<TT;>;>;",
            "Lio/reactivex/functions/Consumer",
            "<-TS;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 1915
    .local p0, "initialState":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<TS;>;"
    .local p1, "generator":Lio/reactivex/functions/BiConsumer;, "Lio/reactivex/functions/BiConsumer<TS;Lio/reactivex/Emitter<TT;>;>;"
    .local p2, "disposeState":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-TS;>;"
    const-string/jumbo v0, "generator  is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 1916
    invoke-static {p1}, Lio/reactivex/internal/operators/observable/ObservableInternalHelper;->simpleBiGenerator(Lio/reactivex/functions/BiConsumer;)Lio/reactivex/functions/BiFunction;

    move-result-object v0

    invoke-static {p0, v0, p2}, Lio/reactivex/Observable;->generate(Ljava/util/concurrent/Callable;Lio/reactivex/functions/BiFunction;Lio/reactivex/functions/Consumer;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static generate(Ljava/util/concurrent/Callable;Lio/reactivex/functions/BiFunction;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "S:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable",
            "<TS;>;",
            "Lio/reactivex/functions/BiFunction",
            "<TS;",
            "Lio/reactivex/Emitter",
            "<TT;>;TS;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 1941
    .local p0, "initialState":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<TS;>;"
    .local p1, "generator":Lio/reactivex/functions/BiFunction;, "Lio/reactivex/functions/BiFunction<TS;Lio/reactivex/Emitter<TT;>;TS;>;"
    invoke-static {}, Lio/reactivex/internal/functions/Functions;->emptyConsumer()Lio/reactivex/functions/Consumer;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lio/reactivex/Observable;->generate(Ljava/util/concurrent/Callable;Lio/reactivex/functions/BiFunction;Lio/reactivex/functions/Consumer;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static generate(Ljava/util/concurrent/Callable;Lio/reactivex/functions/BiFunction;Lio/reactivex/functions/Consumer;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "S:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable",
            "<TS;>;",
            "Lio/reactivex/functions/BiFunction",
            "<TS;",
            "Lio/reactivex/Emitter",
            "<TT;>;TS;>;",
            "Lio/reactivex/functions/Consumer",
            "<-TS;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 1969
    .local p0, "initialState":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<TS;>;"
    .local p1, "generator":Lio/reactivex/functions/BiFunction;, "Lio/reactivex/functions/BiFunction<TS;Lio/reactivex/Emitter<TT;>;TS;>;"
    .local p2, "disposeState":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-TS;>;"
    const-string/jumbo v0, "initialState is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 1970
    const-string/jumbo v0, "generator  is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 1971
    const-string/jumbo v0, "disposeState is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 1972
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableGenerate;

    invoke-direct {v0, p0, p1, p2}, Lio/reactivex/internal/operators/observable/ObservableGenerate;-><init>(Ljava/util/concurrent/Callable;Lio/reactivex/functions/BiFunction;Lio/reactivex/functions/Consumer;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static interval(JJLjava/util/concurrent/TimeUnit;)Lio/reactivex/Observable;
    .locals 6
    .param p0, "initialDelay"    # J
    .param p2, "period"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJ",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lio/reactivex/Observable",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "io.reactivex:computation"
    .end annotation

    .prologue
    .line 1999
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->computation()Lio/reactivex/Scheduler;

    move-result-object v5

    move-wide v0, p0

    move-wide v2, p2

    move-object v4, p4

    invoke-static/range {v0 .. v5}, Lio/reactivex/Observable;->interval(JJLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static interval(JJLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;
    .locals 8
    .param p0, "initialDelay"    # J
    .param p2, "period"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p5, "scheduler"    # Lio/reactivex/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJ",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            ")",
            "Lio/reactivex/Observable",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "custom"
    .end annotation

    .prologue
    const-wide/16 v4, 0x0

    .line 2028
    const-string/jumbo v0, "unit is null"

    invoke-static {p4, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2029
    const-string/jumbo v0, "scheduler is null"

    invoke-static {p5, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2031
    new-instance v1, Lio/reactivex/internal/operators/observable/ObservableInterval;

    invoke-static {v4, v5, p0, p1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    invoke-static {v4, v5, p2, p3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v4

    move-object v6, p4

    move-object v7, p5

    invoke-direct/range {v1 .. v7}, Lio/reactivex/internal/operators/observable/ObservableInterval;-><init>(JJLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)V

    invoke-static {v1}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static interval(JLjava/util/concurrent/TimeUnit;)Lio/reactivex/Observable;
    .locals 6
    .param p0, "period"    # J
    .param p2, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lio/reactivex/Observable",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "io.reactivex:computation"
    .end annotation

    .prologue
    .line 2053
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->computation()Lio/reactivex/Scheduler;

    move-result-object v5

    move-wide v0, p0

    move-wide v2, p0

    move-object v4, p2

    invoke-static/range {v0 .. v5}, Lio/reactivex/Observable;->interval(JJLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static interval(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;
    .locals 6
    .param p0, "period"    # J
    .param p2, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p3, "scheduler"    # Lio/reactivex/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            ")",
            "Lio/reactivex/Observable",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "custom"
    .end annotation

    .prologue
    .line 2078
    move-wide v0, p0

    move-wide v2, p0

    move-object v4, p2

    move-object v5, p3

    invoke-static/range {v0 .. v5}, Lio/reactivex/Observable;->interval(JJLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static intervalRange(JJJJLjava/util/concurrent/TimeUnit;)Lio/reactivex/Observable;
    .locals 10
    .param p0, "start"    # J
    .param p2, "count"    # J
    .param p4, "initialDelay"    # J
    .param p6, "period"    # J
    .param p8, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJJJ",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lio/reactivex/Observable",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "io.reactivex:computation"
    .end annotation

    .prologue
    .line 2101
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->computation()Lio/reactivex/Scheduler;

    move-result-object v9

    move-wide v0, p0

    move-wide v2, p2

    move-wide v4, p4

    move-wide/from16 v6, p6

    move-object/from16 v8, p8

    invoke-static/range {v0 .. v9}, Lio/reactivex/Observable;->intervalRange(JJJJLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static intervalRange(JJJJLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;
    .locals 16
    .param p0, "start"    # J
    .param p2, "count"    # J
    .param p4, "initialDelay"    # J
    .param p6, "period"    # J
    .param p8, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p9, "scheduler"    # Lio/reactivex/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJJJ",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            ")",
            "Lio/reactivex/Observable",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "custom"
    .end annotation

    .prologue
    .line 2124
    const-wide/16 v4, 0x0

    cmp-long v4, p2, v4

    if-gez v4, :cond_0

    .line 2125
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "count >= 0 required but it was "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-wide/from16 v0, p2

    invoke-virtual {v5, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 2128
    :cond_0
    const-wide/16 v4, 0x0

    cmp-long v4, p2, v4

    if-nez v4, :cond_1

    .line 2129
    invoke-static {}, Lio/reactivex/Observable;->empty()Lio/reactivex/Observable;

    move-result-object v4

    move-wide/from16 v0, p4

    move-object/from16 v2, p8

    move-object/from16 v3, p9

    invoke-virtual {v4, v0, v1, v2, v3}, Lio/reactivex/Observable;->delay(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v4

    .line 2139
    :goto_0
    return-object v4

    .line 2132
    :cond_1
    const-wide/16 v4, 0x1

    sub-long v4, p2, v4

    add-long v8, p0, v4

    .line 2133
    .local v8, "end":J
    const-wide/16 v4, 0x0

    cmp-long v4, p0, v4

    if-lez v4, :cond_2

    const-wide/16 v4, 0x0

    cmp-long v4, v8, v4

    if-gez v4, :cond_2

    .line 2134
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v5, "Overflow! start + count is bigger than Long.MAX_VALUE"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 2136
    :cond_2
    const-string/jumbo v4, "unit is null"

    move-object/from16 v0, p8

    invoke-static {v0, v4}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2137
    const-string/jumbo v4, "scheduler is null"

    move-object/from16 v0, p9

    invoke-static {v0, v4}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2139
    new-instance v5, Lio/reactivex/internal/operators/observable/ObservableIntervalRange;

    const-wide/16 v6, 0x0

    move-wide/from16 v0, p4

    invoke-static {v6, v7, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v10

    const-wide/16 v6, 0x0

    move-wide/from16 v0, p6

    invoke-static {v6, v7, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v12

    move-wide/from16 v6, p0

    move-object/from16 v14, p8

    move-object/from16 v15, p9

    invoke-direct/range {v5 .. v15}, Lio/reactivex/internal/operators/observable/ObservableIntervalRange;-><init>(JJJJLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)V

    invoke-static {v5}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v4

    goto :goto_0
.end method

.method public static just(Ljava/lang/Object;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 2169
    .local p0, "item":Ljava/lang/Object;, "TT;"
    const-string/jumbo v0, "The item is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2170
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableJust;

    invoke-direct {v0, p0}, Lio/reactivex/internal/operators/observable/ObservableJust;-><init>(Ljava/lang/Object;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static just(Ljava/lang/Object;Ljava/lang/Object;)Lio/reactivex/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;TT;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 2195
    .local p0, "item1":Ljava/lang/Object;, "TT;"
    .local p1, "item2":Ljava/lang/Object;, "TT;"
    const-string/jumbo v0, "The first item is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2196
    const-string/jumbo v0, "The second item is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2198
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    const/4 v1, 0x1

    aput-object p1, v0, v1

    invoke-static {v0}, Lio/reactivex/Observable;->fromArray([Ljava/lang/Object;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lio/reactivex/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;TT;TT;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 2225
    .local p0, "item1":Ljava/lang/Object;, "TT;"
    .local p1, "item2":Ljava/lang/Object;, "TT;"
    .local p2, "item3":Ljava/lang/Object;, "TT;"
    const-string/jumbo v0, "The first item is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2226
    const-string/jumbo v0, "The second item is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2227
    const-string/jumbo v0, "The third item is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2229
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    const/4 v1, 0x1

    aput-object p1, v0, v1

    const/4 v1, 0x2

    aput-object p2, v0, v1

    invoke-static {v0}, Lio/reactivex/Observable;->fromArray([Ljava/lang/Object;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lio/reactivex/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;TT;TT;TT;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 2258
    .local p0, "item1":Ljava/lang/Object;, "TT;"
    .local p1, "item2":Ljava/lang/Object;, "TT;"
    .local p2, "item3":Ljava/lang/Object;, "TT;"
    .local p3, "item4":Ljava/lang/Object;, "TT;"
    const-string/jumbo v0, "The first item is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2259
    const-string/jumbo v0, "The second item is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2260
    const-string/jumbo v0, "The third item is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2261
    const-string/jumbo v0, "The fourth item is null"

    invoke-static {p3, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2263
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    const/4 v1, 0x1

    aput-object p1, v0, v1

    const/4 v1, 0x2

    aput-object p2, v0, v1

    const/4 v1, 0x3

    aput-object p3, v0, v1

    invoke-static {v0}, Lio/reactivex/Observable;->fromArray([Ljava/lang/Object;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lio/reactivex/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;TT;TT;TT;TT;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 2294
    .local p0, "item1":Ljava/lang/Object;, "TT;"
    .local p1, "item2":Ljava/lang/Object;, "TT;"
    .local p2, "item3":Ljava/lang/Object;, "TT;"
    .local p3, "item4":Ljava/lang/Object;, "TT;"
    .local p4, "item5":Ljava/lang/Object;, "TT;"
    const-string/jumbo v0, "The first item is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2295
    const-string/jumbo v0, "The second item is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2296
    const-string/jumbo v0, "The third item is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2297
    const-string/jumbo v0, "The fourth item is null"

    invoke-static {p3, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2298
    const-string/jumbo v0, "The fifth item is null"

    invoke-static {p4, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2300
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    const/4 v1, 0x1

    aput-object p1, v0, v1

    const/4 v1, 0x2

    aput-object p2, v0, v1

    const/4 v1, 0x3

    aput-object p3, v0, v1

    const/4 v1, 0x4

    aput-object p4, v0, v1

    invoke-static {v0}, Lio/reactivex/Observable;->fromArray([Ljava/lang/Object;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lio/reactivex/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;TT;TT;TT;TT;TT;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 2333
    .local p0, "item1":Ljava/lang/Object;, "TT;"
    .local p1, "item2":Ljava/lang/Object;, "TT;"
    .local p2, "item3":Ljava/lang/Object;, "TT;"
    .local p3, "item4":Ljava/lang/Object;, "TT;"
    .local p4, "item5":Ljava/lang/Object;, "TT;"
    .local p5, "item6":Ljava/lang/Object;, "TT;"
    const-string/jumbo v0, "The first item is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2334
    const-string/jumbo v0, "The second item is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2335
    const-string/jumbo v0, "The third item is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2336
    const-string/jumbo v0, "The fourth item is null"

    invoke-static {p3, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2337
    const-string/jumbo v0, "The fifth item is null"

    invoke-static {p4, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2338
    const-string/jumbo v0, "The sixth item is null"

    invoke-static {p5, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2340
    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    const/4 v1, 0x1

    aput-object p1, v0, v1

    const/4 v1, 0x2

    aput-object p2, v0, v1

    const/4 v1, 0x3

    aput-object p3, v0, v1

    const/4 v1, 0x4

    aput-object p4, v0, v1

    const/4 v1, 0x5

    aput-object p5, v0, v1

    invoke-static {v0}, Lio/reactivex/Observable;->fromArray([Ljava/lang/Object;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lio/reactivex/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;TT;TT;TT;TT;TT;TT;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 2375
    .local p0, "item1":Ljava/lang/Object;, "TT;"
    .local p1, "item2":Ljava/lang/Object;, "TT;"
    .local p2, "item3":Ljava/lang/Object;, "TT;"
    .local p3, "item4":Ljava/lang/Object;, "TT;"
    .local p4, "item5":Ljava/lang/Object;, "TT;"
    .local p5, "item6":Ljava/lang/Object;, "TT;"
    .local p6, "item7":Ljava/lang/Object;, "TT;"
    const-string/jumbo v0, "The first item is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2376
    const-string/jumbo v0, "The second item is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2377
    const-string/jumbo v0, "The third item is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2378
    const-string/jumbo v0, "The fourth item is null"

    invoke-static {p3, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2379
    const-string/jumbo v0, "The fifth item is null"

    invoke-static {p4, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2380
    const-string/jumbo v0, "The sixth item is null"

    invoke-static {p5, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2381
    const-string/jumbo v0, "The seventh item is null"

    invoke-static {p6, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2383
    const/4 v0, 0x7

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    const/4 v1, 0x1

    aput-object p1, v0, v1

    const/4 v1, 0x2

    aput-object p2, v0, v1

    const/4 v1, 0x3

    aput-object p3, v0, v1

    const/4 v1, 0x4

    aput-object p4, v0, v1

    const/4 v1, 0x5

    aput-object p5, v0, v1

    const/4 v1, 0x6

    aput-object p6, v0, v1

    invoke-static {v0}, Lio/reactivex/Observable;->fromArray([Ljava/lang/Object;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lio/reactivex/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;TT;TT;TT;TT;TT;TT;TT;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 2420
    .local p0, "item1":Ljava/lang/Object;, "TT;"
    .local p1, "item2":Ljava/lang/Object;, "TT;"
    .local p2, "item3":Ljava/lang/Object;, "TT;"
    .local p3, "item4":Ljava/lang/Object;, "TT;"
    .local p4, "item5":Ljava/lang/Object;, "TT;"
    .local p5, "item6":Ljava/lang/Object;, "TT;"
    .local p6, "item7":Ljava/lang/Object;, "TT;"
    .local p7, "item8":Ljava/lang/Object;, "TT;"
    const-string/jumbo v0, "The first item is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2421
    const-string/jumbo v0, "The second item is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2422
    const-string/jumbo v0, "The third item is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2423
    const-string/jumbo v0, "The fourth item is null"

    invoke-static {p3, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2424
    const-string/jumbo v0, "The fifth item is null"

    invoke-static {p4, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2425
    const-string/jumbo v0, "The sixth item is null"

    invoke-static {p5, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2426
    const-string/jumbo v0, "The seventh item is null"

    invoke-static {p6, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2427
    const-string/jumbo v0, "The eighth item is null"

    invoke-static {p7, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2429
    const/16 v0, 0x8

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    const/4 v1, 0x1

    aput-object p1, v0, v1

    const/4 v1, 0x2

    aput-object p2, v0, v1

    const/4 v1, 0x3

    aput-object p3, v0, v1

    const/4 v1, 0x4

    aput-object p4, v0, v1

    const/4 v1, 0x5

    aput-object p5, v0, v1

    const/4 v1, 0x6

    aput-object p6, v0, v1

    const/4 v1, 0x7

    aput-object p7, v0, v1

    invoke-static {v0}, Lio/reactivex/Observable;->fromArray([Ljava/lang/Object;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lio/reactivex/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;TT;TT;TT;TT;TT;TT;TT;TT;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 2468
    .local p0, "item1":Ljava/lang/Object;, "TT;"
    .local p1, "item2":Ljava/lang/Object;, "TT;"
    .local p2, "item3":Ljava/lang/Object;, "TT;"
    .local p3, "item4":Ljava/lang/Object;, "TT;"
    .local p4, "item5":Ljava/lang/Object;, "TT;"
    .local p5, "item6":Ljava/lang/Object;, "TT;"
    .local p6, "item7":Ljava/lang/Object;, "TT;"
    .local p7, "item8":Ljava/lang/Object;, "TT;"
    .local p8, "item9":Ljava/lang/Object;, "TT;"
    const-string/jumbo v0, "The first item is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2469
    const-string/jumbo v0, "The second item is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2470
    const-string/jumbo v0, "The third item is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2471
    const-string/jumbo v0, "The fourth item is null"

    invoke-static {p3, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2472
    const-string/jumbo v0, "The fifth item is null"

    invoke-static {p4, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2473
    const-string/jumbo v0, "The sixth item is null"

    invoke-static {p5, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2474
    const-string/jumbo v0, "The seventh item is null"

    invoke-static {p6, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2475
    const-string/jumbo v0, "The eighth item is null"

    invoke-static {p7, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2476
    const-string/jumbo v0, "The ninth item is null"

    invoke-static {p8, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2478
    const/16 v0, 0x9

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    const/4 v1, 0x1

    aput-object p1, v0, v1

    const/4 v1, 0x2

    aput-object p2, v0, v1

    const/4 v1, 0x3

    aput-object p3, v0, v1

    const/4 v1, 0x4

    aput-object p4, v0, v1

    const/4 v1, 0x5

    aput-object p5, v0, v1

    const/4 v1, 0x6

    aput-object p6, v0, v1

    const/4 v1, 0x7

    aput-object p7, v0, v1

    const/16 v1, 0x8

    aput-object p8, v0, v1

    invoke-static {v0}, Lio/reactivex/Observable;->fromArray([Ljava/lang/Object;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lio/reactivex/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;TT;TT;TT;TT;TT;TT;TT;TT;TT;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 2519
    .local p0, "item1":Ljava/lang/Object;, "TT;"
    .local p1, "item2":Ljava/lang/Object;, "TT;"
    .local p2, "item3":Ljava/lang/Object;, "TT;"
    .local p3, "item4":Ljava/lang/Object;, "TT;"
    .local p4, "item5":Ljava/lang/Object;, "TT;"
    .local p5, "item6":Ljava/lang/Object;, "TT;"
    .local p6, "item7":Ljava/lang/Object;, "TT;"
    .local p7, "item8":Ljava/lang/Object;, "TT;"
    .local p8, "item9":Ljava/lang/Object;, "TT;"
    .local p9, "item10":Ljava/lang/Object;, "TT;"
    const-string/jumbo v0, "The first item is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2520
    const-string/jumbo v0, "The second item is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2521
    const-string/jumbo v0, "The third item is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2522
    const-string/jumbo v0, "The fourth item is null"

    invoke-static {p3, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2523
    const-string/jumbo v0, "The fifth item is null"

    invoke-static {p4, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2524
    const-string/jumbo v0, "The sixth item is null"

    invoke-static {p5, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2525
    const-string/jumbo v0, "The seventh item is null"

    invoke-static {p6, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2526
    const-string/jumbo v0, "The eighth item is null"

    invoke-static {p7, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2527
    const-string/jumbo v0, "The ninth item is null"

    invoke-static {p8, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2528
    const-string/jumbo v0, "The tenth item is null"

    invoke-static {p9, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2530
    const/16 v0, 0xa

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    const/4 v1, 0x1

    aput-object p1, v0, v1

    const/4 v1, 0x2

    aput-object p2, v0, v1

    const/4 v1, 0x3

    aput-object p3, v0, v1

    const/4 v1, 0x4

    aput-object p4, v0, v1

    const/4 v1, 0x5

    aput-object p5, v0, v1

    const/4 v1, 0x6

    aput-object p6, v0, v1

    const/4 v1, 0x7

    aput-object p7, v0, v1

    const/16 v1, 0x8

    aput-object p8, v0, v1

    const/16 v1, 0x9

    aput-object p9, v0, v1

    invoke-static {v0}, Lio/reactivex/Observable;->fromArray([Ljava/lang/Object;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static merge(Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<+",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 2680
    .local p0, "sources":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+Lio/reactivex/ObservableSource<+TT;>;>;"
    const-string/jumbo v0, "sources is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2681
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableFlatMap;

    invoke-static {}, Lio/reactivex/internal/functions/Functions;->identity()Lio/reactivex/functions/Function;

    move-result-object v2

    const/4 v3, 0x0

    const v4, 0x7fffffff

    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v5

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lio/reactivex/internal/operators/observable/ObservableFlatMap;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;ZII)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static merge(Lio/reactivex/ObservableSource;I)Lio/reactivex/Observable;
    .locals 6
    .param p1, "maxConcurrency"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<+",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;>;I)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 2714
    .local p0, "sources":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+Lio/reactivex/ObservableSource<+TT;>;>;"
    const-string/jumbo v0, "sources is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2715
    const-string/jumbo v0, "maxConcurrency"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(ILjava/lang/String;)I

    .line 2716
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableFlatMap;

    invoke-static {}, Lio/reactivex/internal/functions/Functions;->identity()Lio/reactivex/functions/Function;

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v5

    move-object v1, p0

    move v4, p1

    invoke-direct/range {v0 .. v5}, Lio/reactivex/internal/operators/observable/ObservableFlatMap;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;ZII)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static merge(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .local p0, "source1":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    .local p1, "source2":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    const/4 v3, 0x2

    const/4 v2, 0x0

    .line 2743
    const-string/jumbo v0, "source1 is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2744
    const-string/jumbo v0, "source2 is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2745
    new-array v0, v3, [Lio/reactivex/ObservableSource;

    aput-object p0, v0, v2

    const/4 v1, 0x1

    aput-object p1, v0, v1

    invoke-static {v0}, Lio/reactivex/Observable;->fromArray([Ljava/lang/Object;)Lio/reactivex/Observable;

    move-result-object v0

    invoke-static {}, Lio/reactivex/internal/functions/Functions;->identity()Lio/reactivex/functions/Function;

    move-result-object v1

    invoke-virtual {v0, v1, v2, v3}, Lio/reactivex/Observable;->flatMap(Lio/reactivex/functions/Function;ZI)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static merge(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .local p0, "source1":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    .local p1, "source2":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    .local p2, "source3":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    const/4 v3, 0x3

    const/4 v2, 0x0

    .line 2774
    const-string/jumbo v0, "source1 is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2775
    const-string/jumbo v0, "source2 is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2776
    const-string/jumbo v0, "source3 is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2777
    new-array v0, v3, [Lio/reactivex/ObservableSource;

    aput-object p0, v0, v2

    const/4 v1, 0x1

    aput-object p1, v0, v1

    const/4 v1, 0x2

    aput-object p2, v0, v1

    invoke-static {v0}, Lio/reactivex/Observable;->fromArray([Ljava/lang/Object;)Lio/reactivex/Observable;

    move-result-object v0

    invoke-static {}, Lio/reactivex/internal/functions/Functions;->identity()Lio/reactivex/functions/Function;

    move-result-object v1

    invoke-virtual {v0, v1, v2, v3}, Lio/reactivex/Observable;->flatMap(Lio/reactivex/functions/Function;ZI)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static merge(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .local p0, "source1":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    .local p1, "source2":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    .local p2, "source3":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    .local p3, "source4":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    const/4 v3, 0x4

    const/4 v2, 0x0

    .line 2810
    const-string/jumbo v0, "source1 is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2811
    const-string/jumbo v0, "source2 is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2812
    const-string/jumbo v0, "source3 is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2813
    const-string/jumbo v0, "source4 is null"

    invoke-static {p3, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2814
    new-array v0, v3, [Lio/reactivex/ObservableSource;

    aput-object p0, v0, v2

    const/4 v1, 0x1

    aput-object p1, v0, v1

    const/4 v1, 0x2

    aput-object p2, v0, v1

    const/4 v1, 0x3

    aput-object p3, v0, v1

    invoke-static {v0}, Lio/reactivex/Observable;->fromArray([Ljava/lang/Object;)Lio/reactivex/Observable;

    move-result-object v0

    invoke-static {}, Lio/reactivex/internal/functions/Functions;->identity()Lio/reactivex/functions/Function;

    move-result-object v1

    invoke-virtual {v0, v1, v2, v3}, Lio/reactivex/Observable;->flatMap(Lio/reactivex/functions/Function;ZI)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static merge(Ljava/lang/Iterable;)Lio/reactivex/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Iterable",
            "<+",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 2622
    .local p0, "sources":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Lio/reactivex/ObservableSource<+TT;>;>;"
    invoke-static {p0}, Lio/reactivex/Observable;->fromIterable(Ljava/lang/Iterable;)Lio/reactivex/Observable;

    move-result-object v0

    invoke-static {}, Lio/reactivex/internal/functions/Functions;->identity()Lio/reactivex/functions/Function;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->flatMap(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static merge(Ljava/lang/Iterable;I)Lio/reactivex/Observable;
    .locals 2
    .param p1, "maxConcurrency"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Iterable",
            "<+",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;>;I)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 2653
    .local p0, "sources":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Lio/reactivex/ObservableSource<+TT;>;>;"
    invoke-static {p0}, Lio/reactivex/Observable;->fromIterable(Ljava/lang/Iterable;)Lio/reactivex/Observable;

    move-result-object v0

    invoke-static {}, Lio/reactivex/internal/functions/Functions;->identity()Lio/reactivex/functions/Function;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lio/reactivex/Observable;->flatMap(Lio/reactivex/functions/Function;I)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static merge(Ljava/lang/Iterable;II)Lio/reactivex/Observable;
    .locals 3
    .param p1, "maxConcurrency"    # I
    .param p2, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Iterable",
            "<+",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;>;II)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 2563
    .local p0, "sources":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Lio/reactivex/ObservableSource<+TT;>;>;"
    invoke-static {p0}, Lio/reactivex/Observable;->fromIterable(Ljava/lang/Iterable;)Lio/reactivex/Observable;

    move-result-object v0

    invoke-static {}, Lio/reactivex/internal/functions/Functions;->identity()Lio/reactivex/functions/Function;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, p1, p2}, Lio/reactivex/Observable;->flatMap(Lio/reactivex/functions/Function;ZII)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static varargs mergeArray(II[Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;
    .locals 3
    .param p0, "maxConcurrency"    # I
    .param p1, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(II[",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 2596
    .local p2, "sources":[Lio/reactivex/ObservableSource;, "[Lio/reactivex/ObservableSource<+TT;>;"
    invoke-static {p2}, Lio/reactivex/Observable;->fromArray([Ljava/lang/Object;)Lio/reactivex/Observable;

    move-result-object v0

    invoke-static {}, Lio/reactivex/internal/functions/Functions;->identity()Lio/reactivex/functions/Function;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, p0, p1}, Lio/reactivex/Observable;->flatMap(Lio/reactivex/functions/Function;ZII)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static varargs mergeArray([Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 2839
    .local p0, "sources":[Lio/reactivex/ObservableSource;, "[Lio/reactivex/ObservableSource<+TT;>;"
    invoke-static {p0}, Lio/reactivex/Observable;->fromArray([Ljava/lang/Object;)Lio/reactivex/Observable;

    move-result-object v0

    invoke-static {}, Lio/reactivex/internal/functions/Functions;->identity()Lio/reactivex/functions/Function;

    move-result-object v1

    array-length v2, p0

    invoke-virtual {v0, v1, v2}, Lio/reactivex/Observable;->flatMap(Lio/reactivex/functions/Function;I)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static varargs mergeArrayDelayError(II[Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;
    .locals 3
    .param p0, "maxConcurrency"    # I
    .param p1, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(II[",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 2943
    .local p2, "sources":[Lio/reactivex/ObservableSource;, "[Lio/reactivex/ObservableSource<+TT;>;"
    invoke-static {p2}, Lio/reactivex/Observable;->fromArray([Ljava/lang/Object;)Lio/reactivex/Observable;

    move-result-object v0

    invoke-static {}, Lio/reactivex/internal/functions/Functions;->identity()Lio/reactivex/functions/Function;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2, p0, p1}, Lio/reactivex/Observable;->flatMap(Lio/reactivex/functions/Function;ZII)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static varargs mergeArrayDelayError([Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 3198
    .local p0, "sources":[Lio/reactivex/ObservableSource;, "[Lio/reactivex/ObservableSource<+TT;>;"
    invoke-static {p0}, Lio/reactivex/Observable;->fromArray([Ljava/lang/Object;)Lio/reactivex/Observable;

    move-result-object v0

    invoke-static {}, Lio/reactivex/internal/functions/Functions;->identity()Lio/reactivex/functions/Function;

    move-result-object v1

    const/4 v2, 0x1

    array-length v3, p0

    invoke-virtual {v0, v1, v2, v3}, Lio/reactivex/Observable;->flatMap(Lio/reactivex/functions/Function;ZI)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static mergeDelayError(Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<+",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 3009
    .local p0, "sources":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+Lio/reactivex/ObservableSource<+TT;>;>;"
    const-string/jumbo v0, "sources is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 3010
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableFlatMap;

    invoke-static {}, Lio/reactivex/internal/functions/Functions;->identity()Lio/reactivex/functions/Function;

    move-result-object v2

    const/4 v3, 0x1

    const v4, 0x7fffffff

    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v5

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lio/reactivex/internal/operators/observable/ObservableFlatMap;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;ZII)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static mergeDelayError(Lio/reactivex/ObservableSource;I)Lio/reactivex/Observable;
    .locals 6
    .param p1, "maxConcurrency"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<+",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;>;I)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 3046
    .local p0, "sources":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+Lio/reactivex/ObservableSource<+TT;>;>;"
    const-string/jumbo v0, "sources is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 3047
    const-string/jumbo v0, "maxConcurrency"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(ILjava/lang/String;)I

    .line 3048
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableFlatMap;

    invoke-static {}, Lio/reactivex/internal/functions/Functions;->identity()Lio/reactivex/functions/Function;

    move-result-object v2

    const/4 v3, 0x1

    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v5

    move-object v1, p0

    move v4, p1

    invoke-direct/range {v0 .. v5}, Lio/reactivex/internal/operators/observable/ObservableFlatMap;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;ZII)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static mergeDelayError(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .local p0, "source1":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    .local p1, "source2":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    const/4 v3, 0x2

    const/4 v2, 0x1

    .line 3081
    const-string/jumbo v0, "source1 is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 3082
    const-string/jumbo v0, "source2 is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 3083
    new-array v0, v3, [Lio/reactivex/ObservableSource;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    aput-object p1, v0, v2

    invoke-static {v0}, Lio/reactivex/Observable;->fromArray([Ljava/lang/Object;)Lio/reactivex/Observable;

    move-result-object v0

    invoke-static {}, Lio/reactivex/internal/functions/Functions;->identity()Lio/reactivex/functions/Function;

    move-result-object v1

    invoke-virtual {v0, v1, v2, v3}, Lio/reactivex/Observable;->flatMap(Lio/reactivex/functions/Function;ZI)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static mergeDelayError(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .local p0, "source1":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    .local p1, "source2":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    .local p2, "source3":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    const/4 v3, 0x3

    const/4 v2, 0x1

    .line 3119
    const-string/jumbo v0, "source1 is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 3120
    const-string/jumbo v0, "source2 is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 3121
    const-string/jumbo v0, "source3 is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 3122
    new-array v0, v3, [Lio/reactivex/ObservableSource;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    aput-object p1, v0, v2

    const/4 v1, 0x2

    aput-object p2, v0, v1

    invoke-static {v0}, Lio/reactivex/Observable;->fromArray([Ljava/lang/Object;)Lio/reactivex/Observable;

    move-result-object v0

    invoke-static {}, Lio/reactivex/internal/functions/Functions;->identity()Lio/reactivex/functions/Function;

    move-result-object v1

    invoke-virtual {v0, v1, v2, v3}, Lio/reactivex/Observable;->flatMap(Lio/reactivex/functions/Function;ZI)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static mergeDelayError(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .local p0, "source1":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    .local p1, "source2":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    .local p2, "source3":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    .local p3, "source4":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    const/4 v3, 0x4

    const/4 v2, 0x1

    .line 3162
    const-string/jumbo v0, "source1 is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 3163
    const-string/jumbo v0, "source2 is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 3164
    const-string/jumbo v0, "source3 is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 3165
    const-string/jumbo v0, "source4 is null"

    invoke-static {p3, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 3166
    new-array v0, v3, [Lio/reactivex/ObservableSource;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    aput-object p1, v0, v2

    const/4 v1, 0x2

    aput-object p2, v0, v1

    const/4 v1, 0x3

    aput-object p3, v0, v1

    invoke-static {v0}, Lio/reactivex/Observable;->fromArray([Ljava/lang/Object;)Lio/reactivex/Observable;

    move-result-object v0

    invoke-static {}, Lio/reactivex/internal/functions/Functions;->identity()Lio/reactivex/functions/Function;

    move-result-object v1

    invoke-virtual {v0, v1, v2, v3}, Lio/reactivex/Observable;->flatMap(Lio/reactivex/functions/Function;ZI)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static mergeDelayError(Ljava/lang/Iterable;)Lio/reactivex/Observable;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Iterable",
            "<+",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 2871
    .local p0, "sources":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Lio/reactivex/ObservableSource<+TT;>;>;"
    invoke-static {p0}, Lio/reactivex/Observable;->fromIterable(Ljava/lang/Iterable;)Lio/reactivex/Observable;

    move-result-object v0

    invoke-static {}, Lio/reactivex/internal/functions/Functions;->identity()Lio/reactivex/functions/Function;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lio/reactivex/Observable;->flatMap(Lio/reactivex/functions/Function;Z)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static mergeDelayError(Ljava/lang/Iterable;I)Lio/reactivex/Observable;
    .locals 3
    .param p1, "maxConcurrency"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Iterable",
            "<+",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;>;I)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 2977
    .local p0, "sources":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Lio/reactivex/ObservableSource<+TT;>;>;"
    invoke-static {p0}, Lio/reactivex/Observable;->fromIterable(Ljava/lang/Iterable;)Lio/reactivex/Observable;

    move-result-object v0

    invoke-static {}, Lio/reactivex/internal/functions/Functions;->identity()Lio/reactivex/functions/Function;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2, p1}, Lio/reactivex/Observable;->flatMap(Lio/reactivex/functions/Function;ZI)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static mergeDelayError(Ljava/lang/Iterable;II)Lio/reactivex/Observable;
    .locals 3
    .param p1, "maxConcurrency"    # I
    .param p2, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Iterable",
            "<+",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;>;II)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 2907
    .local p0, "sources":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Lio/reactivex/ObservableSource<+TT;>;>;"
    invoke-static {p0}, Lio/reactivex/Observable;->fromIterable(Ljava/lang/Iterable;)Lio/reactivex/Observable;

    move-result-object v0

    invoke-static {}, Lio/reactivex/internal/functions/Functions;->identity()Lio/reactivex/functions/Function;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2, p1, p2}, Lio/reactivex/Observable;->flatMap(Lio/reactivex/functions/Function;ZII)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static never()Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 3221
    sget-object v0, Lio/reactivex/internal/operators/observable/ObservableNever;->INSTANCE:Lio/reactivex/Observable;

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static range(II)Lio/reactivex/Observable;
    .locals 4
    .param p0, "start"    # I
    .param p1, "count"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Lio/reactivex/Observable",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 3246
    if-gez p1, :cond_0

    .line 3247
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "count >= 0 required but it was "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 3249
    :cond_0
    if-nez p1, :cond_1

    .line 3250
    invoke-static {}, Lio/reactivex/Observable;->empty()Lio/reactivex/Observable;

    move-result-object v0

    .line 3258
    :goto_0
    return-object v0

    .line 3252
    :cond_1
    const/4 v0, 0x1

    if-ne p1, v0, :cond_2

    .line 3253
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v0}, Lio/reactivex/Observable;->just(Ljava/lang/Object;)Lio/reactivex/Observable;

    move-result-object v0

    goto :goto_0

    .line 3255
    :cond_2
    int-to-long v0, p0

    add-int/lit8 v2, p1, -0x1

    int-to-long v2, v2

    add-long/2addr v0, v2

    const-wide/32 v2, 0x7fffffff

    cmp-long v0, v0, v2

    if-lez v0, :cond_3

    .line 3256
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Integer overflow"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 3258
    :cond_3
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableRange;

    invoke-direct {v0, p0, p1}, Lio/reactivex/internal/operators/observable/ObservableRange;-><init>(II)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    goto :goto_0
.end method

.method public static rangeLong(JJ)Lio/reactivex/Observable;
    .locals 8
    .param p0, "start"    # J
    .param p2, "count"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJ)",
            "Lio/reactivex/Observable",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    const-wide/16 v6, 0x1

    const-wide/16 v4, 0x0

    .line 3283
    cmp-long v2, p2, v4

    if-gez v2, :cond_0

    .line 3284
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "count >= 0 required but it was "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 3287
    :cond_0
    cmp-long v2, p2, v4

    if-nez v2, :cond_1

    .line 3288
    invoke-static {}, Lio/reactivex/Observable;->empty()Lio/reactivex/Observable;

    move-result-object v2

    .line 3300
    :goto_0
    return-object v2

    .line 3291
    :cond_1
    cmp-long v2, p2, v6

    if-nez v2, :cond_2

    .line 3292
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {v2}, Lio/reactivex/Observable;->just(Ljava/lang/Object;)Lio/reactivex/Observable;

    move-result-object v2

    goto :goto_0

    .line 3295
    :cond_2
    sub-long v2, p2, v6

    add-long v0, p0, v2

    .line 3296
    .local v0, "end":J
    cmp-long v2, p0, v4

    if-lez v2, :cond_3

    cmp-long v2, v0, v4

    if-gez v2, :cond_3

    .line 3297
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v3, "Overflow! start + count is bigger than Long.MAX_VALUE"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 3300
    :cond_3
    new-instance v2, Lio/reactivex/internal/operators/observable/ObservableRangeLong;

    invoke-direct {v2, p0, p1, p2, p3}, Lio/reactivex/internal/operators/observable/ObservableRangeLong;-><init>(JJ)V

    invoke-static {v2}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v2

    goto :goto_0
.end method

.method public static sequenceEqual(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;)Lio/reactivex/Single;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;)",
            "Lio/reactivex/Single",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 3325
    .local p0, "source1":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    .local p1, "source2":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    invoke-static {}, Lio/reactivex/internal/functions/ObjectHelper;->equalsPredicate()Lio/reactivex/functions/BiPredicate;

    move-result-object v0

    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v1

    invoke-static {p0, p1, v0, v1}, Lio/reactivex/Observable;->sequenceEqual(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/functions/BiPredicate;I)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public static sequenceEqual(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;I)Lio/reactivex/Single;
    .locals 1
    .param p2, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;I)",
            "Lio/reactivex/Single",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 3419
    .local p0, "source1":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    .local p1, "source2":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    invoke-static {}, Lio/reactivex/internal/functions/ObjectHelper;->equalsPredicate()Lio/reactivex/functions/BiPredicate;

    move-result-object v0

    invoke-static {p0, p1, v0, p2}, Lio/reactivex/Observable;->sequenceEqual(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/functions/BiPredicate;I)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public static sequenceEqual(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/functions/BiPredicate;)Lio/reactivex/Single;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;",
            "Lio/reactivex/functions/BiPredicate",
            "<-TT;-TT;>;)",
            "Lio/reactivex/Single",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 3355
    .local p0, "source1":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    .local p1, "source2":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    .local p2, "isEqual":Lio/reactivex/functions/BiPredicate;, "Lio/reactivex/functions/BiPredicate<-TT;-TT;>;"
    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v0

    invoke-static {p0, p1, p2, v0}, Lio/reactivex/Observable;->sequenceEqual(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/functions/BiPredicate;I)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public static sequenceEqual(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/functions/BiPredicate;I)Lio/reactivex/Single;
    .locals 1
    .param p3, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;",
            "Lio/reactivex/functions/BiPredicate",
            "<-TT;-TT;>;I)",
            "Lio/reactivex/Single",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 3387
    .local p0, "source1":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    .local p1, "source2":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    .local p2, "isEqual":Lio/reactivex/functions/BiPredicate;, "Lio/reactivex/functions/BiPredicate<-TT;-TT;>;"
    const-string/jumbo v0, "source1 is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 3388
    const-string/jumbo v0, "source2 is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 3389
    const-string/jumbo v0, "isEqual is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 3390
    const-string/jumbo v0, "bufferSize"

    invoke-static {p3, v0}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(ILjava/lang/String;)I

    .line 3391
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle;

    invoke-direct {v0, p0, p1, p2, p3}, Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/functions/BiPredicate;I)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Single;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public static switchOnNext(Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<+",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 3486
    .local p0, "sources":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+Lio/reactivex/ObservableSource<+TT;>;>;"
    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v0

    invoke-static {p0, v0}, Lio/reactivex/Observable;->switchOnNext(Lio/reactivex/ObservableSource;I)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static switchOnNext(Lio/reactivex/ObservableSource;I)Lio/reactivex/Observable;
    .locals 3
    .param p1, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<+",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;>;I)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 3453
    .local p0, "sources":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+Lio/reactivex/ObservableSource<+TT;>;>;"
    const-string/jumbo v0, "sources is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 3454
    const-string/jumbo v0, "bufferSize"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(ILjava/lang/String;)I

    .line 3455
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableSwitchMap;

    invoke-static {}, Lio/reactivex/internal/functions/Functions;->identity()Lio/reactivex/functions/Function;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, p1, v2}, Lio/reactivex/internal/operators/observable/ObservableSwitchMap;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;IZ)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static switchOnNextDelayError(Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<+",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 3519
    .local p0, "sources":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+Lio/reactivex/ObservableSource<+TT;>;>;"
    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v0

    invoke-static {p0, v0}, Lio/reactivex/Observable;->switchOnNextDelayError(Lio/reactivex/ObservableSource;I)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static switchOnNextDelayError(Lio/reactivex/ObservableSource;I)Lio/reactivex/Observable;
    .locals 3
    .param p1, "prefetch"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<+",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;>;I)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 3555
    .local p0, "sources":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+Lio/reactivex/ObservableSource<+TT;>;>;"
    const-string/jumbo v0, "sources is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 3556
    const-string/jumbo v0, "prefetch"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(ILjava/lang/String;)I

    .line 3557
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableSwitchMap;

    invoke-static {}, Lio/reactivex/internal/functions/Functions;->identity()Lio/reactivex/functions/Function;

    move-result-object v1

    const/4 v2, 0x1

    invoke-direct {v0, p0, v1, p1, v2}, Lio/reactivex/internal/operators/observable/ObservableSwitchMap;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;IZ)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method private timeout0(JLjava/util/concurrent/TimeUnit;Lio/reactivex/ObservableSource;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;
    .locals 7
    .param p1, "timeout"    # J
    .param p3, "timeUnit"    # Ljava/util/concurrent/TimeUnit;
    .param p5, "scheduler"    # Lio/reactivex/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;",
            "Lio/reactivex/Scheduler;",
            ")",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 12110
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p4, "other":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    const-string/jumbo v0, "timeUnit is null"

    invoke-static {p3, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 12111
    const-string/jumbo v0, "scheduler is null"

    invoke-static {p5, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 12112
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableTimeoutTimed;

    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    move-object v5, p5

    move-object v6, p4

    invoke-direct/range {v0 .. v6}, Lio/reactivex/internal/operators/observable/ObservableTimeoutTimed;-><init>(Lio/reactivex/ObservableSource;JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;Lio/reactivex/ObservableSource;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method private timeout0(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<TU;>;",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/ObservableSource",
            "<TV;>;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 12119
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "firstTimeoutIndicator":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TU;>;"
    .local p2, "itemTimeoutIndicator":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lio/reactivex/ObservableSource<TV;>;>;"
    .local p3, "other":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    const-string/jumbo v0, "itemTimeoutIndicator is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 12120
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableTimeout;

    invoke-direct {v0, p0, p1, p2, p3}, Lio/reactivex/internal/operators/observable/ObservableTimeout;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;Lio/reactivex/ObservableSource;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static timer(JLjava/util/concurrent/TimeUnit;)Lio/reactivex/Observable;
    .locals 2
    .param p0, "delay"    # J
    .param p2, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lio/reactivex/Observable",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "io.reactivex:computation"
    .end annotation

    .prologue
    .line 3579
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->computation()Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-static {p0, p1, p2, v0}, Lio/reactivex/Observable;->timer(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static timer(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;
    .locals 4
    .param p0, "delay"    # J
    .param p2, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p3, "scheduler"    # Lio/reactivex/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            ")",
            "Lio/reactivex/Observable",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "custom"
    .end annotation

    .prologue
    .line 3605
    const-string/jumbo v0, "unit is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 3606
    const-string/jumbo v0, "scheduler is null"

    invoke-static {p3, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 3608
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableTimer;

    const-wide/16 v2, 0x0

    invoke-static {p0, p1, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    invoke-direct {v0, v2, v3, p2, p3}, Lio/reactivex/internal/operators/observable/ObservableTimer;-><init>(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static unsafeCreate(Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<TT;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 3626
    .local p0, "onSubscribe":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TT;>;"
    const-string/jumbo v0, "source is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 3627
    const-string/jumbo v0, "onSubscribe is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 3628
    instance-of v0, p0, Lio/reactivex/Observable;

    if-eqz v0, :cond_0

    .line 3629
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "unsafeCreate(Observable) should be upgraded"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 3631
    :cond_0
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableFromUnsafeSource;

    invoke-direct {v0, p0}, Lio/reactivex/internal/operators/observable/ObservableFromUnsafeSource;-><init>(Lio/reactivex/ObservableSource;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static using(Ljava/util/concurrent/Callable;Lio/reactivex/functions/Function;Lio/reactivex/functions/Consumer;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "D:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable",
            "<+TD;>;",
            "Lio/reactivex/functions/Function",
            "<-TD;+",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;>;",
            "Lio/reactivex/functions/Consumer",
            "<-TD;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 3658
    .local p0, "resourceSupplier":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<+TD;>;"
    .local p1, "sourceSupplier":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TD;+Lio/reactivex/ObservableSource<+TT;>;>;"
    .local p2, "disposer":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-TD;>;"
    const/4 v0, 0x1

    invoke-static {p0, p1, p2, v0}, Lio/reactivex/Observable;->using(Ljava/util/concurrent/Callable;Lio/reactivex/functions/Function;Lio/reactivex/functions/Consumer;Z)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static using(Ljava/util/concurrent/Callable;Lio/reactivex/functions/Function;Lio/reactivex/functions/Consumer;Z)Lio/reactivex/Observable;
    .locals 1
    .param p3, "eager"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "D:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable",
            "<+TD;>;",
            "Lio/reactivex/functions/Function",
            "<-TD;+",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;>;",
            "Lio/reactivex/functions/Consumer",
            "<-TD;>;Z)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 3692
    .local p0, "resourceSupplier":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<+TD;>;"
    .local p1, "sourceSupplier":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TD;+Lio/reactivex/ObservableSource<+TT;>;>;"
    .local p2, "disposer":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-TD;>;"
    const-string/jumbo v0, "resourceSupplier is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 3693
    const-string/jumbo v0, "sourceSupplier is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 3694
    const-string/jumbo v0, "disposer is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 3695
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableUsing;

    invoke-direct {v0, p0, p1, p2, p3}, Lio/reactivex/internal/operators/observable/ObservableUsing;-><init>(Ljava/util/concurrent/Callable;Lio/reactivex/functions/Function;Lio/reactivex/functions/Consumer;Z)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static wrap(Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<TT;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 3714
    .local p0, "source":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TT;>;"
    const-string/jumbo v0, "source is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 3715
    instance-of v0, p0, Lio/reactivex/Observable;

    if-eqz v0, :cond_0

    .line 3716
    check-cast p0, Lio/reactivex/Observable;

    .end local p0    # "source":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TT;>;"
    invoke-static {p0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    .line 3718
    .restart local p0    # "source":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TT;>;"
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableFromUnsafeSource;

    invoke-direct {v0, p0}, Lio/reactivex/internal/operators/observable/ObservableFromUnsafeSource;-><init>(Lio/reactivex/ObservableSource;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    goto :goto_0
.end method

.method public static zip(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function9;)Lio/reactivex/Observable;
    .locals 5
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
            "T5:",
            "Ljava/lang/Object;",
            "T6:",
            "Ljava/lang/Object;",
            "T7:",
            "Ljava/lang/Object;",
            "T8:",
            "Ljava/lang/Object;",
            "T9:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<+TT1;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT2;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT3;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT4;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT5;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT6;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT7;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT8;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT9;>;",
            "Lio/reactivex/functions/Function9",
            "<-TT1;-TT2;-TT3;-TT4;-TT5;-TT6;-TT7;-TT8;-TT9;+TR;>;)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .local p0, "source1":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT1;>;"
    .local p1, "source2":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT2;>;"
    .local p2, "source3":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT3;>;"
    .local p3, "source4":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT4;>;"
    .local p4, "source5":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT5;>;"
    .local p5, "source6":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT6;>;"
    .local p6, "source7":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT7;>;"
    .local p7, "source8":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT8;>;"
    .local p8, "source9":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT9;>;"
    .local p9, "zipper":Lio/reactivex/functions/Function9;, "Lio/reactivex/functions/Function9<-TT1;-TT2;-TT3;-TT4;-TT5;-TT6;-TT7;-TT8;-TT9;+TR;>;"
    const/4 v4, 0x0

    .line 4494
    const-string/jumbo v0, "source1 is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 4495
    const-string/jumbo v0, "source2 is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 4496
    const-string/jumbo v0, "source3 is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 4497
    const-string/jumbo v0, "source4 is null"

    invoke-static {p3, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 4498
    const-string/jumbo v0, "source5 is null"

    invoke-static {p4, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 4499
    const-string/jumbo v0, "source6 is null"

    invoke-static {p5, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 4500
    const-string/jumbo v0, "source7 is null"

    invoke-static {p6, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 4501
    const-string/jumbo v0, "source8 is null"

    invoke-static {p7, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 4502
    const-string/jumbo v0, "source9 is null"

    invoke-static {p8, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 4503
    invoke-static {p9}, Lio/reactivex/internal/functions/Functions;->toFunction(Lio/reactivex/functions/Function9;)Lio/reactivex/functions/Function;

    move-result-object v0

    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v1

    const/16 v2, 0x9

    new-array v2, v2, [Lio/reactivex/ObservableSource;

    aput-object p0, v2, v4

    const/4 v3, 0x1

    aput-object p1, v2, v3

    const/4 v3, 0x2

    aput-object p2, v2, v3

    const/4 v3, 0x3

    aput-object p3, v2, v3

    const/4 v3, 0x4

    aput-object p4, v2, v3

    const/4 v3, 0x5

    aput-object p5, v2, v3

    const/4 v3, 0x6

    aput-object p6, v2, v3

    const/4 v3, 0x7

    aput-object p7, v2, v3

    const/16 v3, 0x8

    aput-object p8, v2, v3

    invoke-static {v0, v4, v1, v2}, Lio/reactivex/Observable;->zipArray(Lio/reactivex/functions/Function;ZI[Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static zip(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function8;)Lio/reactivex/Observable;
    .locals 5
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
            "T5:",
            "Ljava/lang/Object;",
            "T6:",
            "Ljava/lang/Object;",
            "T7:",
            "Ljava/lang/Object;",
            "T8:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<+TT1;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT2;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT3;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT4;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT5;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT6;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT7;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT8;>;",
            "Lio/reactivex/functions/Function8",
            "<-TT1;-TT2;-TT3;-TT4;-TT5;-TT6;-TT7;-TT8;+TR;>;)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .local p0, "source1":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT1;>;"
    .local p1, "source2":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT2;>;"
    .local p2, "source3":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT3;>;"
    .local p3, "source4":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT4;>;"
    .local p4, "source5":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT5;>;"
    .local p5, "source6":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT6;>;"
    .local p6, "source7":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT7;>;"
    .local p7, "source8":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT8;>;"
    .local p8, "zipper":Lio/reactivex/functions/Function8;, "Lio/reactivex/functions/Function8<-TT1;-TT2;-TT3;-TT4;-TT5;-TT6;-TT7;-TT8;+TR;>;"
    const/4 v4, 0x0

    .line 4410
    const-string/jumbo v0, "source1 is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 4411
    const-string/jumbo v0, "source2 is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 4412
    const-string/jumbo v0, "source3 is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 4413
    const-string/jumbo v0, "source4 is null"

    invoke-static {p3, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 4414
    const-string/jumbo v0, "source5 is null"

    invoke-static {p4, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 4415
    const-string/jumbo v0, "source6 is null"

    invoke-static {p5, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 4416
    const-string/jumbo v0, "source7 is null"

    invoke-static {p6, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 4417
    const-string/jumbo v0, "source8 is null"

    invoke-static {p7, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 4418
    invoke-static {p8}, Lio/reactivex/internal/functions/Functions;->toFunction(Lio/reactivex/functions/Function8;)Lio/reactivex/functions/Function;

    move-result-object v0

    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v1

    const/16 v2, 0x8

    new-array v2, v2, [Lio/reactivex/ObservableSource;

    aput-object p0, v2, v4

    const/4 v3, 0x1

    aput-object p1, v2, v3

    const/4 v3, 0x2

    aput-object p2, v2, v3

    const/4 v3, 0x3

    aput-object p3, v2, v3

    const/4 v3, 0x4

    aput-object p4, v2, v3

    const/4 v3, 0x5

    aput-object p5, v2, v3

    const/4 v3, 0x6

    aput-object p6, v2, v3

    const/4 v3, 0x7

    aput-object p7, v2, v3

    invoke-static {v0, v4, v1, v2}, Lio/reactivex/Observable;->zipArray(Lio/reactivex/functions/Function;ZI[Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static zip(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function7;)Lio/reactivex/Observable;
    .locals 5
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
            "T5:",
            "Ljava/lang/Object;",
            "T6:",
            "Ljava/lang/Object;",
            "T7:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<+TT1;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT2;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT3;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT4;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT5;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT6;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT7;>;",
            "Lio/reactivex/functions/Function7",
            "<-TT1;-TT2;-TT3;-TT4;-TT5;-TT6;-TT7;+TR;>;)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .local p0, "source1":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT1;>;"
    .local p1, "source2":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT2;>;"
    .local p2, "source3":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT3;>;"
    .local p3, "source4":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT4;>;"
    .local p4, "source5":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT5;>;"
    .local p5, "source6":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT6;>;"
    .local p6, "source7":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT7;>;"
    .local p7, "zipper":Lio/reactivex/functions/Function7;, "Lio/reactivex/functions/Function7<-TT1;-TT2;-TT3;-TT4;-TT5;-TT6;-TT7;+TR;>;"
    const/4 v4, 0x0

    .line 4330
    const-string/jumbo v0, "source1 is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 4331
    const-string/jumbo v0, "source2 is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 4332
    const-string/jumbo v0, "source3 is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 4333
    const-string/jumbo v0, "source4 is null"

    invoke-static {p3, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 4334
    const-string/jumbo v0, "source5 is null"

    invoke-static {p4, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 4335
    const-string/jumbo v0, "source6 is null"

    invoke-static {p5, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 4336
    const-string/jumbo v0, "source7 is null"

    invoke-static {p6, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 4337
    invoke-static {p7}, Lio/reactivex/internal/functions/Functions;->toFunction(Lio/reactivex/functions/Function7;)Lio/reactivex/functions/Function;

    move-result-object v0

    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v1

    const/4 v2, 0x7

    new-array v2, v2, [Lio/reactivex/ObservableSource;

    aput-object p0, v2, v4

    const/4 v3, 0x1

    aput-object p1, v2, v3

    const/4 v3, 0x2

    aput-object p2, v2, v3

    const/4 v3, 0x3

    aput-object p3, v2, v3

    const/4 v3, 0x4

    aput-object p4, v2, v3

    const/4 v3, 0x5

    aput-object p5, v2, v3

    const/4 v3, 0x6

    aput-object p6, v2, v3

    invoke-static {v0, v4, v1, v2}, Lio/reactivex/Observable;->zipArray(Lio/reactivex/functions/Function;ZI[Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static zip(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function6;)Lio/reactivex/Observable;
    .locals 5
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
            "T5:",
            "Ljava/lang/Object;",
            "T6:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<+TT1;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT2;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT3;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT4;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT5;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT6;>;",
            "Lio/reactivex/functions/Function6",
            "<-TT1;-TT2;-TT3;-TT4;-TT5;-TT6;+TR;>;)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .local p0, "source1":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT1;>;"
    .local p1, "source2":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT2;>;"
    .local p2, "source3":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT3;>;"
    .local p3, "source4":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT4;>;"
    .local p4, "source5":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT5;>;"
    .local p5, "source6":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT6;>;"
    .local p6, "zipper":Lio/reactivex/functions/Function6;, "Lio/reactivex/functions/Function6<-TT1;-TT2;-TT3;-TT4;-TT5;-TT6;+TR;>;"
    const/4 v4, 0x0

    .line 4254
    const-string/jumbo v0, "source1 is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 4255
    const-string/jumbo v0, "source2 is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 4256
    const-string/jumbo v0, "source3 is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 4257
    const-string/jumbo v0, "source4 is null"

    invoke-static {p3, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 4258
    const-string/jumbo v0, "source5 is null"

    invoke-static {p4, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 4259
    const-string/jumbo v0, "source6 is null"

    invoke-static {p5, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 4260
    invoke-static {p6}, Lio/reactivex/internal/functions/Functions;->toFunction(Lio/reactivex/functions/Function6;)Lio/reactivex/functions/Function;

    move-result-object v0

    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v1

    const/4 v2, 0x6

    new-array v2, v2, [Lio/reactivex/ObservableSource;

    aput-object p0, v2, v4

    const/4 v3, 0x1

    aput-object p1, v2, v3

    const/4 v3, 0x2

    aput-object p2, v2, v3

    const/4 v3, 0x3

    aput-object p3, v2, v3

    const/4 v3, 0x4

    aput-object p4, v2, v3

    const/4 v3, 0x5

    aput-object p5, v2, v3

    invoke-static {v0, v4, v1, v2}, Lio/reactivex/Observable;->zipArray(Lio/reactivex/functions/Function;ZI[Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static zip(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function5;)Lio/reactivex/Observable;
    .locals 5
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
            "T5:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<+TT1;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT2;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT3;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT4;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT5;>;",
            "Lio/reactivex/functions/Function5",
            "<-TT1;-TT2;-TT3;-TT4;-TT5;+TR;>;)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .local p0, "source1":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT1;>;"
    .local p1, "source2":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT2;>;"
    .local p2, "source3":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT3;>;"
    .local p3, "source4":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT4;>;"
    .local p4, "source5":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT5;>;"
    .local p5, "zipper":Lio/reactivex/functions/Function5;, "Lio/reactivex/functions/Function5<-TT1;-TT2;-TT3;-TT4;-TT5;+TR;>;"
    const/4 v4, 0x0

    .line 4183
    const-string/jumbo v0, "source1 is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 4184
    const-string/jumbo v0, "source2 is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 4185
    const-string/jumbo v0, "source3 is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 4186
    const-string/jumbo v0, "source4 is null"

    invoke-static {p3, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 4187
    const-string/jumbo v0, "source5 is null"

    invoke-static {p4, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 4188
    invoke-static {p5}, Lio/reactivex/internal/functions/Functions;->toFunction(Lio/reactivex/functions/Function5;)Lio/reactivex/functions/Function;

    move-result-object v0

    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v1

    const/4 v2, 0x5

    new-array v2, v2, [Lio/reactivex/ObservableSource;

    aput-object p0, v2, v4

    const/4 v3, 0x1

    aput-object p1, v2, v3

    const/4 v3, 0x2

    aput-object p2, v2, v3

    const/4 v3, 0x3

    aput-object p3, v2, v3

    const/4 v3, 0x4

    aput-object p4, v2, v3

    invoke-static {v0, v4, v1, v2}, Lio/reactivex/Observable;->zipArray(Lio/reactivex/functions/Function;ZI[Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static zip(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function4;)Lio/reactivex/Observable;
    .locals 5
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
            ">(",
            "Lio/reactivex/ObservableSource",
            "<+TT1;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT2;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT3;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT4;>;",
            "Lio/reactivex/functions/Function4",
            "<-TT1;-TT2;-TT3;-TT4;+TR;>;)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .local p0, "source1":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT1;>;"
    .local p1, "source2":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT2;>;"
    .local p2, "source3":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT3;>;"
    .local p3, "source4":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT4;>;"
    .local p4, "zipper":Lio/reactivex/functions/Function4;, "Lio/reactivex/functions/Function4<-TT1;-TT2;-TT3;-TT4;+TR;>;"
    const/4 v4, 0x0

    .line 4115
    const-string/jumbo v0, "source1 is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 4116
    const-string/jumbo v0, "source2 is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 4117
    const-string/jumbo v0, "source3 is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 4118
    const-string/jumbo v0, "source4 is null"

    invoke-static {p3, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 4119
    invoke-static {p4}, Lio/reactivex/internal/functions/Functions;->toFunction(Lio/reactivex/functions/Function4;)Lio/reactivex/functions/Function;

    move-result-object v0

    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v1

    const/4 v2, 0x4

    new-array v2, v2, [Lio/reactivex/ObservableSource;

    aput-object p0, v2, v4

    const/4 v3, 0x1

    aput-object p1, v2, v3

    const/4 v3, 0x2

    aput-object p2, v2, v3

    const/4 v3, 0x3

    aput-object p3, v2, v3

    invoke-static {v0, v4, v1, v2}, Lio/reactivex/Observable;->zipArray(Lio/reactivex/functions/Function;ZI[Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static zip(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function3;)Lio/reactivex/Observable;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            "T2:",
            "Ljava/lang/Object;",
            "T3:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<+TT1;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT2;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT3;>;",
            "Lio/reactivex/functions/Function3",
            "<-TT1;-TT2;-TT3;+TR;>;)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .local p0, "source1":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT1;>;"
    .local p1, "source2":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT2;>;"
    .local p2, "source3":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT3;>;"
    .local p3, "zipper":Lio/reactivex/functions/Function3;, "Lio/reactivex/functions/Function3<-TT1;-TT2;-TT3;+TR;>;"
    const/4 v4, 0x0

    .line 4051
    const-string/jumbo v0, "source1 is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 4052
    const-string/jumbo v0, "source2 is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 4053
    const-string/jumbo v0, "source3 is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 4054
    invoke-static {p3}, Lio/reactivex/internal/functions/Functions;->toFunction(Lio/reactivex/functions/Function3;)Lio/reactivex/functions/Function;

    move-result-object v0

    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v1

    const/4 v2, 0x3

    new-array v2, v2, [Lio/reactivex/ObservableSource;

    aput-object p0, v2, v4

    const/4 v3, 0x1

    aput-object p1, v2, v3

    const/4 v3, 0x2

    aput-object p2, v2, v3

    invoke-static {v0, v4, v1, v2}, Lio/reactivex/Observable;->zipArray(Lio/reactivex/functions/Function;ZI[Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static zip(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/functions/BiFunction;)Lio/reactivex/Observable;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            "T2:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<+TT1;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT2;>;",
            "Lio/reactivex/functions/BiFunction",
            "<-TT1;-TT2;+TR;>;)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .local p0, "source1":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT1;>;"
    .local p1, "source2":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT2;>;"
    .local p2, "zipper":Lio/reactivex/functions/BiFunction;, "Lio/reactivex/functions/BiFunction<-TT1;-TT2;+TR;>;"
    const/4 v4, 0x0

    .line 3879
    const-string/jumbo v0, "source1 is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 3880
    const-string/jumbo v0, "source2 is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 3881
    invoke-static {p2}, Lio/reactivex/internal/functions/Functions;->toFunction(Lio/reactivex/functions/BiFunction;)Lio/reactivex/functions/Function;

    move-result-object v0

    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v1

    const/4 v2, 0x2

    new-array v2, v2, [Lio/reactivex/ObservableSource;

    aput-object p0, v2, v4

    const/4 v3, 0x1

    aput-object p1, v2, v3

    invoke-static {v0, v4, v1, v2}, Lio/reactivex/Observable;->zipArray(Lio/reactivex/functions/Function;ZI[Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static zip(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/functions/BiFunction;Z)Lio/reactivex/Observable;
    .locals 4
    .param p3, "delayError"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            "T2:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<+TT1;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT2;>;",
            "Lio/reactivex/functions/BiFunction",
            "<-TT1;-TT2;+TR;>;Z)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 3935
    .local p0, "source1":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT1;>;"
    .local p1, "source2":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT2;>;"
    .local p2, "zipper":Lio/reactivex/functions/BiFunction;, "Lio/reactivex/functions/BiFunction<-TT1;-TT2;+TR;>;"
    const-string/jumbo v0, "source1 is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 3936
    const-string/jumbo v0, "source2 is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 3937
    invoke-static {p2}, Lio/reactivex/internal/functions/Functions;->toFunction(Lio/reactivex/functions/BiFunction;)Lio/reactivex/functions/Function;

    move-result-object v0

    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v1

    const/4 v2, 0x2

    new-array v2, v2, [Lio/reactivex/ObservableSource;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    const/4 v3, 0x1

    aput-object p1, v2, v3

    invoke-static {v0, p3, v1, v2}, Lio/reactivex/Observable;->zipArray(Lio/reactivex/functions/Function;ZI[Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static zip(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/functions/BiFunction;ZI)Lio/reactivex/Observable;
    .locals 3
    .param p3, "delayError"    # Z
    .param p4, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            "T2:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<+TT1;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT2;>;",
            "Lio/reactivex/functions/BiFunction",
            "<-TT1;-TT2;+TR;>;ZI)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 3992
    .local p0, "source1":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT1;>;"
    .local p1, "source2":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT2;>;"
    .local p2, "zipper":Lio/reactivex/functions/BiFunction;, "Lio/reactivex/functions/BiFunction<-TT1;-TT2;+TR;>;"
    const-string/jumbo v0, "source1 is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 3993
    const-string/jumbo v0, "source2 is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 3994
    invoke-static {p2}, Lio/reactivex/internal/functions/Functions;->toFunction(Lio/reactivex/functions/BiFunction;)Lio/reactivex/functions/Function;

    move-result-object v0

    const/4 v1, 0x2

    new-array v1, v1, [Lio/reactivex/ObservableSource;

    const/4 v2, 0x0

    aput-object p0, v1, v2

    const/4 v2, 0x1

    aput-object p1, v1, v2

    invoke-static {v0, p3, p4, v1}, Lio/reactivex/Observable;->zipArray(Lio/reactivex/functions/Function;ZI[Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static zip(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;)Lio/reactivex/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<+",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;>;",
            "Lio/reactivex/functions/Function",
            "<-[",
            "Ljava/lang/Object;",
            "+TR;>;)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 3823
    .local p0, "sources":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+Lio/reactivex/ObservableSource<+TT;>;>;"
    .local p1, "zipper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-[Ljava/lang/Object;+TR;>;"
    const-string/jumbo v0, "zipper is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 3824
    const-string/jumbo v0, "sources is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 3825
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableToList;

    const/16 v1, 0x10

    invoke-direct {v0, p0, v1}, Lio/reactivex/internal/operators/observable/ObservableToList;-><init>(Lio/reactivex/ObservableSource;I)V

    invoke-static {p1}, Lio/reactivex/internal/operators/observable/ObservableInternalHelper;->zipIterable(Lio/reactivex/functions/Function;)Lio/reactivex/functions/Function;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/internal/operators/observable/ObservableToList;->flatMap(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object v0

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static zip(Ljava/lang/Iterable;Lio/reactivex/functions/Function;)Lio/reactivex/Observable;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Iterable",
            "<+",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;>;",
            "Lio/reactivex/functions/Function",
            "<-[",
            "Ljava/lang/Object;",
            "+TR;>;)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 3769
    .local p0, "sources":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Lio/reactivex/ObservableSource<+TT;>;>;"
    .local p1, "zipper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-[Ljava/lang/Object;+TR;>;"
    const-string/jumbo v0, "zipper is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 3770
    const-string/jumbo v0, "sources is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 3771
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableZip;

    const/4 v1, 0x0

    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v4

    const/4 v5, 0x0

    move-object v2, p0

    move-object v3, p1

    invoke-direct/range {v0 .. v5}, Lio/reactivex/internal/operators/observable/ObservableZip;-><init>([Lio/reactivex/ObservableSource;Ljava/lang/Iterable;Lio/reactivex/functions/Function;IZ)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static varargs zipArray(Lio/reactivex/functions/Function;ZI[Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;
    .locals 6
    .param p1, "delayError"    # Z
    .param p2, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-[",
            "Ljava/lang/Object;",
            "+TR;>;ZI[",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 4560
    .local p0, "zipper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-[Ljava/lang/Object;+TR;>;"
    .local p3, "sources":[Lio/reactivex/ObservableSource;, "[Lio/reactivex/ObservableSource<+TT;>;"
    array-length v0, p3

    if-nez v0, :cond_0

    .line 4561
    invoke-static {}, Lio/reactivex/Observable;->empty()Lio/reactivex/Observable;

    move-result-object v0

    .line 4565
    :goto_0
    return-object v0

    .line 4563
    :cond_0
    const-string/jumbo v0, "zipper is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 4564
    const-string/jumbo v0, "bufferSize"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(ILjava/lang/String;)I

    .line 4565
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableZip;

    const/4 v2, 0x0

    move-object v1, p3

    move-object v3, p0

    move v4, p2

    move v5, p1

    invoke-direct/range {v0 .. v5}, Lio/reactivex/internal/operators/observable/ObservableZip;-><init>([Lio/reactivex/ObservableSource;Ljava/lang/Iterable;Lio/reactivex/functions/Function;IZ)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    goto :goto_0
.end method

.method public static zipIterable(Ljava/lang/Iterable;Lio/reactivex/functions/Function;ZI)Lio/reactivex/Observable;
    .locals 6
    .param p2, "delayError"    # Z
    .param p3, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Iterable",
            "<+",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;>;",
            "Lio/reactivex/functions/Function",
            "<-[",
            "Ljava/lang/Object;",
            "+TR;>;ZI)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 4623
    .local p0, "sources":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Lio/reactivex/ObservableSource<+TT;>;>;"
    .local p1, "zipper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-[Ljava/lang/Object;+TR;>;"
    const-string/jumbo v0, "zipper is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 4624
    const-string/jumbo v0, "sources is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 4625
    const-string/jumbo v0, "bufferSize"

    invoke-static {p3, v0}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(ILjava/lang/String;)I

    .line 4626
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableZip;

    const/4 v1, 0x0

    move-object v2, p0

    move-object v3, p1

    move v4, p3

    move v5, p2

    invoke-direct/range {v0 .. v5}, Lio/reactivex/internal/operators/observable/ObservableZip;-><init>([Lio/reactivex/ObservableSource;Ljava/lang/Iterable;Lio/reactivex/functions/Function;IZ)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public final all(Lio/reactivex/functions/Predicate;)Lio/reactivex/Single;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Predicate",
            "<-TT;>;)",
            "Lio/reactivex/Single",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 4652
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "predicate":Lio/reactivex/functions/Predicate;, "Lio/reactivex/functions/Predicate<-TT;>;"
    const-string/jumbo v0, "predicate is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 4653
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableAllSingle;

    invoke-direct {v0, p0, p1}, Lio/reactivex/internal/operators/observable/ObservableAllSingle;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Predicate;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Single;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public final ambWith(Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 4677
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "other":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    const-string/jumbo v0, "other is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 4678
    const/4 v0, 0x2

    new-array v0, v0, [Lio/reactivex/ObservableSource;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    const/4 v1, 0x1

    aput-object p1, v0, v1

    invoke-static {v0}, Lio/reactivex/Observable;->ambArray([Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final any(Lio/reactivex/functions/Predicate;)Lio/reactivex/Single;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Predicate",
            "<-TT;>;)",
            "Lio/reactivex/Single",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 4704
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "predicate":Lio/reactivex/functions/Predicate;, "Lio/reactivex/functions/Predicate<-TT;>;"
    const-string/jumbo v0, "predicate is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 4705
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableAnySingle;

    invoke-direct {v0, p0, p1}, Lio/reactivex/internal/operators/observable/ObservableAnySingle;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Predicate;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Single;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public final blockingFirst()Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 4724
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    new-instance v0, Lio/reactivex/internal/observers/BlockingFirstObserver;

    invoke-direct {v0}, Lio/reactivex/internal/observers/BlockingFirstObserver;-><init>()V

    .line 4725
    .local v0, "s":Lio/reactivex/internal/observers/BlockingFirstObserver;, "Lio/reactivex/internal/observers/BlockingFirstObserver<TT;>;"
    invoke-virtual {p0, v0}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/Observer;)V

    .line 4726
    invoke-virtual {v0}, Lio/reactivex/internal/observers/BlockingFirstObserver;->blockingGet()Ljava/lang/Object;

    move-result-object v1

    .line 4727
    .local v1, "v":Ljava/lang/Object;, "TT;"
    if-eqz v1, :cond_0

    .line 4728
    return-object v1

    .line 4730
    :cond_0
    new-instance v2, Ljava/util/NoSuchElementException;

    invoke-direct {v2}, Ljava/util/NoSuchElementException;-><init>()V

    throw v2
.end method

.method public final blockingFirst(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)TT;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 4750
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "defaultItem":Ljava/lang/Object;, "TT;"
    new-instance v0, Lio/reactivex/internal/observers/BlockingFirstObserver;

    invoke-direct {v0}, Lio/reactivex/internal/observers/BlockingFirstObserver;-><init>()V

    .line 4751
    .local v0, "s":Lio/reactivex/internal/observers/BlockingFirstObserver;, "Lio/reactivex/internal/observers/BlockingFirstObserver<TT;>;"
    invoke-virtual {p0, v0}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/Observer;)V

    .line 4752
    invoke-virtual {v0}, Lio/reactivex/internal/observers/BlockingFirstObserver;->blockingGet()Ljava/lang/Object;

    move-result-object v1

    .line 4753
    .local v1, "v":Ljava/lang/Object;, "TT;"
    if-eqz v1, :cond_0

    .end local v1    # "v":Ljava/lang/Object;, "TT;"
    :goto_0
    return-object v1

    .restart local v1    # "v":Ljava/lang/Object;, "TT;"
    :cond_0
    move-object v1, p1

    goto :goto_0
.end method

.method public final blockingForEach(Lio/reactivex/functions/Consumer;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Consumer",
            "<-TT;>;)V"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 4785
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "onNext":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-TT;>;"
    invoke-virtual {p0}, Lio/reactivex/Observable;->blockingIterable()Ljava/lang/Iterable;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 4786
    .local v1, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<TT;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 4788
    :try_start_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {p1, v2}, Lio/reactivex/functions/Consumer;->accept(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 4789
    :catch_0
    move-exception v0

    .line 4790
    .local v0, "e":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 4791
    check-cast v1, Lio/reactivex/disposables/Disposable;

    .end local v1    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<TT;>;"
    invoke-interface {v1}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 4792
    invoke-static {v0}, Lio/reactivex/internal/util/ExceptionHelper;->wrapOrThrow(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 4795
    .end local v0    # "e":Ljava/lang/Throwable;
    .restart local v1    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<TT;>;"
    :cond_0
    return-void
.end method

.method public final blockingIterable()Ljava/lang/Iterable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Iterable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 4812
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v0

    invoke-virtual {p0, v0}, Lio/reactivex/Observable;->blockingIterable(I)Ljava/lang/Iterable;

    move-result-object v0

    return-object v0
.end method

.method public final blockingIterable(I)Ljava/lang/Iterable;
    .locals 1
    .param p1, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/lang/Iterable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 4831
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    const-string/jumbo v0, "bufferSize"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(ILjava/lang/String;)I

    .line 4832
    new-instance v0, Lio/reactivex/internal/operators/observable/BlockingObservableIterable;

    invoke-direct {v0, p0, p1}, Lio/reactivex/internal/operators/observable/BlockingObservableIterable;-><init>(Lio/reactivex/ObservableSource;I)V

    return-object v0
.end method

.method public final blockingLast()Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 4853
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    new-instance v0, Lio/reactivex/internal/observers/BlockingLastObserver;

    invoke-direct {v0}, Lio/reactivex/internal/observers/BlockingLastObserver;-><init>()V

    .line 4854
    .local v0, "s":Lio/reactivex/internal/observers/BlockingLastObserver;, "Lio/reactivex/internal/observers/BlockingLastObserver<TT;>;"
    invoke-virtual {p0, v0}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/Observer;)V

    .line 4855
    invoke-virtual {v0}, Lio/reactivex/internal/observers/BlockingLastObserver;->blockingGet()Ljava/lang/Object;

    move-result-object v1

    .line 4856
    .local v1, "v":Ljava/lang/Object;, "TT;"
    if-eqz v1, :cond_0

    .line 4857
    return-object v1

    .line 4859
    :cond_0
    new-instance v2, Ljava/util/NoSuchElementException;

    invoke-direct {v2}, Ljava/util/NoSuchElementException;-><init>()V

    throw v2
.end method

.method public final blockingLast(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)TT;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 4881
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "defaultItem":Ljava/lang/Object;, "TT;"
    new-instance v0, Lio/reactivex/internal/observers/BlockingLastObserver;

    invoke-direct {v0}, Lio/reactivex/internal/observers/BlockingLastObserver;-><init>()V

    .line 4882
    .local v0, "s":Lio/reactivex/internal/observers/BlockingLastObserver;, "Lio/reactivex/internal/observers/BlockingLastObserver<TT;>;"
    invoke-virtual {p0, v0}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/Observer;)V

    .line 4883
    invoke-virtual {v0}, Lio/reactivex/internal/observers/BlockingLastObserver;->blockingGet()Ljava/lang/Object;

    move-result-object v1

    .line 4884
    .local v1, "v":Ljava/lang/Object;, "TT;"
    if-eqz v1, :cond_0

    .end local v1    # "v":Ljava/lang/Object;, "TT;"
    :goto_0
    return-object v1

    .restart local v1    # "v":Ljava/lang/Object;, "TT;"
    :cond_0
    move-object v1, p1

    goto :goto_0
.end method

.method public final blockingLatest()Ljava/lang/Iterable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Iterable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 4907
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    new-instance v0, Lio/reactivex/internal/operators/observable/BlockingObservableLatest;

    invoke-direct {v0, p0}, Lio/reactivex/internal/operators/observable/BlockingObservableLatest;-><init>(Lio/reactivex/ObservableSource;)V

    return-object v0
.end method

.method public final blockingMostRecent(Ljava/lang/Object;)Ljava/lang/Iterable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Ljava/lang/Iterable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 4930
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "initialValue":Ljava/lang/Object;, "TT;"
    new-instance v0, Lio/reactivex/internal/operators/observable/BlockingObservableMostRecent;

    invoke-direct {v0, p0, p1}, Lio/reactivex/internal/operators/observable/BlockingObservableMostRecent;-><init>(Lio/reactivex/ObservableSource;Ljava/lang/Object;)V

    return-object v0
.end method

.method public final blockingNext()Ljava/lang/Iterable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Iterable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 4950
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    new-instance v0, Lio/reactivex/internal/operators/observable/BlockingObservableNext;

    invoke-direct {v0, p0}, Lio/reactivex/internal/operators/observable/BlockingObservableNext;-><init>(Lio/reactivex/ObservableSource;)V

    return-object v0
.end method

.method public final blockingSingle()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 4969
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/Observable;->singleElement()Lio/reactivex/Maybe;

    move-result-object v1

    invoke-virtual {v1}, Lio/reactivex/Maybe;->blockingGet()Ljava/lang/Object;

    move-result-object v0

    .line 4970
    .local v0, "v":Ljava/lang/Object;, "TT;"
    if-nez v0, :cond_0

    .line 4971
    new-instance v1, Ljava/util/NoSuchElementException;

    invoke-direct {v1}, Ljava/util/NoSuchElementException;-><init>()V

    throw v1

    .line 4973
    :cond_0
    return-object v0
.end method

.method public final blockingSingle(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)TT;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 4996
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "defaultItem":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0, p1}, Lio/reactivex/Observable;->single(Ljava/lang/Object;)Lio/reactivex/Single;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Single;->blockingGet()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final blockingSubscribe()V
    .locals 0
    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 5033
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-static {p0}, Lio/reactivex/internal/operators/observable/ObservableBlockingSubscribe;->subscribe(Lio/reactivex/ObservableSource;)V

    .line 5034
    return-void
.end method

.method public final blockingSubscribe(Lio/reactivex/Observer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TT;>;)V"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 5099
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "subscriber":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    invoke-static {p0, p1}, Lio/reactivex/internal/operators/observable/ObservableBlockingSubscribe;->subscribe(Lio/reactivex/ObservableSource;Lio/reactivex/Observer;)V

    .line 5100
    return-void
.end method

.method public final blockingSubscribe(Lio/reactivex/functions/Consumer;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Consumer",
            "<-TT;>;)V"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 5051
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "onNext":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-TT;>;"
    sget-object v0, Lio/reactivex/internal/functions/Functions;->ON_ERROR_MISSING:Lio/reactivex/functions/Consumer;

    sget-object v1, Lio/reactivex/internal/functions/Functions;->EMPTY_ACTION:Lio/reactivex/functions/Action;

    invoke-static {p0, p1, v0, v1}, Lio/reactivex/internal/operators/observable/ObservableBlockingSubscribe;->subscribe(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Action;)V

    .line 5052
    return-void
.end method

.method public final blockingSubscribe(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Consumer",
            "<-TT;>;",
            "Lio/reactivex/functions/Consumer",
            "<-",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 5066
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "onNext":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-TT;>;"
    .local p2, "onError":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-Ljava/lang/Throwable;>;"
    sget-object v0, Lio/reactivex/internal/functions/Functions;->EMPTY_ACTION:Lio/reactivex/functions/Action;

    invoke-static {p0, p1, p2, v0}, Lio/reactivex/internal/operators/observable/ObservableBlockingSubscribe;->subscribe(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Action;)V

    .line 5067
    return-void
.end method

.method public final blockingSubscribe(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Action;)V
    .locals 0
    .param p3, "onComplete"    # Lio/reactivex/functions/Action;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Consumer",
            "<-TT;>;",
            "Lio/reactivex/functions/Consumer",
            "<-",
            "Ljava/lang/Throwable;",
            ">;",
            "Lio/reactivex/functions/Action;",
            ")V"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 5083
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "onNext":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-TT;>;"
    .local p2, "onError":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-Ljava/lang/Throwable;>;"
    invoke-static {p0, p1, p2, p3}, Lio/reactivex/internal/operators/observable/ObservableBlockingSubscribe;->subscribe(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Action;)V

    .line 5084
    return-void
.end method

.method public final buffer(I)Lio/reactivex/Observable;
    .locals 1
    .param p1, "count"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lio/reactivex/Observable",
            "<",
            "Ljava/util/List",
            "<TT;>;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 5123
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-virtual {p0, p1, p1}, Lio/reactivex/Observable;->buffer(II)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final buffer(II)Lio/reactivex/Observable;
    .locals 1
    .param p1, "count"    # I
    .param p2, "skip"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Lio/reactivex/Observable",
            "<",
            "Ljava/util/List",
            "<TT;>;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 5151
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-static {}, Lio/reactivex/internal/util/ArrayListSupplier;->asCallable()Ljava/util/concurrent/Callable;

    move-result-object v0

    invoke-virtual {p0, p1, p2, v0}, Lio/reactivex/Observable;->buffer(IILjava/util/concurrent/Callable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final buffer(IILjava/util/concurrent/Callable;)Lio/reactivex/Observable;
    .locals 1
    .param p1, "count"    # I
    .param p2, "skip"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U::",
            "Ljava/util/Collection",
            "<-TT;>;>(II",
            "Ljava/util/concurrent/Callable",
            "<TU;>;)",
            "Lio/reactivex/Observable",
            "<TU;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 5183
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p3, "bufferSupplier":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<TU;>;"
    const-string/jumbo v0, "count"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(ILjava/lang/String;)I

    .line 5184
    const-string/jumbo v0, "skip"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(ILjava/lang/String;)I

    .line 5185
    const-string/jumbo v0, "bufferSupplier is null"

    invoke-static {p3, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 5186
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableBuffer;

    invoke-direct {v0, p0, p1, p2, p3}, Lio/reactivex/internal/operators/observable/ObservableBuffer;-><init>(Lio/reactivex/ObservableSource;IILjava/util/concurrent/Callable;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final buffer(ILjava/util/concurrent/Callable;)Lio/reactivex/Observable;
    .locals 1
    .param p1, "count"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U::",
            "Ljava/util/Collection",
            "<-TT;>;>(I",
            "Ljava/util/concurrent/Callable",
            "<TU;>;)",
            "Lio/reactivex/Observable",
            "<TU;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 5214
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p2, "bufferSupplier":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<TU;>;"
    invoke-virtual {p0, p1, p1, p2}, Lio/reactivex/Observable;->buffer(IILjava/util/concurrent/Callable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final buffer(JJLjava/util/concurrent/TimeUnit;)Lio/reactivex/Observable;
    .locals 9
    .param p1, "timespan"    # J
    .param p3, "timeskip"    # J
    .param p5, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJ",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lio/reactivex/Observable",
            "<",
            "Ljava/util/List",
            "<TT;>;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "io.reactivex:computation"
    .end annotation

    .prologue
    .line 5243
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->computation()Lio/reactivex/Scheduler;

    move-result-object v7

    invoke-static {}, Lio/reactivex/internal/util/ArrayListSupplier;->asCallable()Ljava/util/concurrent/Callable;

    move-result-object v8

    move-object v1, p0

    move-wide v2, p1

    move-wide v4, p3

    move-object v6, p5

    invoke-virtual/range {v1 .. v8}, Lio/reactivex/Observable;->buffer(JJLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;Ljava/util/concurrent/Callable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final buffer(JJLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;
    .locals 9
    .param p1, "timespan"    # J
    .param p3, "timeskip"    # J
    .param p5, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p6, "scheduler"    # Lio/reactivex/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJ",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            ")",
            "Lio/reactivex/Observable",
            "<",
            "Ljava/util/List",
            "<TT;>;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "custom"
    .end annotation

    .prologue
    .line 5274
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-static {}, Lio/reactivex/internal/util/ArrayListSupplier;->asCallable()Ljava/util/concurrent/Callable;

    move-result-object v8

    move-object v1, p0

    move-wide v2, p1

    move-wide v4, p3

    move-object v6, p5

    move-object v7, p6

    invoke-virtual/range {v1 .. v8}, Lio/reactivex/Observable;->buffer(JJLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;Ljava/util/concurrent/Callable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final buffer(JJLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;Ljava/util/concurrent/Callable;)Lio/reactivex/Observable;
    .locals 13
    .param p1, "timespan"    # J
    .param p3, "timeskip"    # J
    .param p5, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p6, "scheduler"    # Lio/reactivex/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U::",
            "Ljava/util/Collection",
            "<-TT;>;>(JJ",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            "Ljava/util/concurrent/Callable",
            "<TU;>;)",
            "Lio/reactivex/Observable",
            "<TU;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "custom"
    .end annotation

    .prologue
    .line 5309
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p7, "bufferSupplier":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<TU;>;"
    const-string/jumbo v2, "unit is null"

    move-object/from16 v0, p5

    invoke-static {v0, v2}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 5310
    const-string/jumbo v2, "scheduler is null"

    move-object/from16 v0, p6

    invoke-static {v0, v2}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 5311
    const-string/jumbo v2, "bufferSupplier is null"

    move-object/from16 v0, p7

    invoke-static {v0, v2}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 5312
    new-instance v2, Lio/reactivex/internal/operators/observable/ObservableBufferTimed;

    const v11, 0x7fffffff

    const/4 v12, 0x0

    move-object v3, p0

    move-wide v4, p1

    move-wide/from16 v6, p3

    move-object/from16 v8, p5

    move-object/from16 v9, p6

    move-object/from16 v10, p7

    invoke-direct/range {v2 .. v12}, Lio/reactivex/internal/operators/observable/ObservableBufferTimed;-><init>(Lio/reactivex/ObservableSource;JJLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;Ljava/util/concurrent/Callable;IZ)V

    invoke-static {v2}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v2

    return-object v2
.end method

.method public final buffer(JLjava/util/concurrent/TimeUnit;)Lio/reactivex/Observable;
    .locals 7
    .param p1, "timespan"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lio/reactivex/Observable",
            "<",
            "Ljava/util/List",
            "<TT;>;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "io.reactivex:computation"
    .end annotation

    .prologue
    .line 5339
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->computation()Lio/reactivex/Scheduler;

    move-result-object v5

    const v6, 0x7fffffff

    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    invoke-virtual/range {v1 .. v6}, Lio/reactivex/Observable;->buffer(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;I)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final buffer(JLjava/util/concurrent/TimeUnit;I)Lio/reactivex/Observable;
    .locals 7
    .param p1, "timespan"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "count"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "I)",
            "Lio/reactivex/Observable",
            "<",
            "Ljava/util/List",
            "<TT;>;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "io.reactivex:computation"
    .end annotation

    .prologue
    .line 5370
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->computation()Lio/reactivex/Scheduler;

    move-result-object v5

    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    move v6, p4

    invoke-virtual/range {v1 .. v6}, Lio/reactivex/Observable;->buffer(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;I)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final buffer(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;
    .locals 9
    .param p1, "timespan"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "scheduler"    # Lio/reactivex/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            ")",
            "Lio/reactivex/Observable",
            "<",
            "Ljava/util/List",
            "<TT;>;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "custom"
    .end annotation

    .prologue
    .line 5482
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    const v6, 0x7fffffff

    invoke-static {}, Lio/reactivex/internal/util/ArrayListSupplier;->asCallable()Ljava/util/concurrent/Callable;

    move-result-object v7

    const/4 v8, 0x0

    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    move-object v5, p4

    invoke-virtual/range {v1 .. v8}, Lio/reactivex/Observable;->buffer(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;ILjava/util/concurrent/Callable;Z)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final buffer(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;I)Lio/reactivex/Observable;
    .locals 9
    .param p1, "timespan"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "scheduler"    # Lio/reactivex/Scheduler;
    .param p5, "count"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            "I)",
            "Lio/reactivex/Observable",
            "<",
            "Ljava/util/List",
            "<TT;>;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "custom"
    .end annotation

    .prologue
    .line 5404
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-static {}, Lio/reactivex/internal/util/ArrayListSupplier;->asCallable()Ljava/util/concurrent/Callable;

    move-result-object v7

    const/4 v8, 0x0

    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    move-object v5, p4

    move v6, p5

    invoke-virtual/range {v1 .. v8}, Lio/reactivex/Observable;->buffer(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;ILjava/util/concurrent/Callable;Z)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final buffer(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;ILjava/util/concurrent/Callable;Z)Lio/reactivex/Observable;
    .locals 13
    .param p1, "timespan"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "scheduler"    # Lio/reactivex/Scheduler;
    .param p5, "count"    # I
    .param p7, "restartTimerOnMaxSize"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U::",
            "Ljava/util/Collection",
            "<-TT;>;>(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            "I",
            "Ljava/util/concurrent/Callable",
            "<TU;>;Z)",
            "Lio/reactivex/Observable",
            "<TU;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "custom"
    .end annotation

    .prologue
    .line 5448
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p6, "bufferSupplier":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<TU;>;"
    const-string/jumbo v2, "unit is null"

    move-object/from16 v0, p3

    invoke-static {v0, v2}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 5449
    const-string/jumbo v2, "scheduler is null"

    move-object/from16 v0, p4

    invoke-static {v0, v2}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 5450
    const-string/jumbo v2, "bufferSupplier is null"

    move-object/from16 v0, p6

    invoke-static {v0, v2}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 5451
    const-string/jumbo v2, "count"

    move/from16 v0, p5

    invoke-static {v0, v2}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(ILjava/lang/String;)I

    .line 5452
    new-instance v2, Lio/reactivex/internal/operators/observable/ObservableBufferTimed;

    move-object v3, p0

    move-wide v4, p1

    move-wide v6, p1

    move-object/from16 v8, p3

    move-object/from16 v9, p4

    move-object/from16 v10, p6

    move/from16 v11, p5

    move/from16 v12, p7

    invoke-direct/range {v2 .. v12}, Lio/reactivex/internal/operators/observable/ObservableBufferTimed;-><init>(Lio/reactivex/ObservableSource;JJLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;Ljava/util/concurrent/Callable;IZ)V

    invoke-static {v2}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v2

    return-object v2
.end method

.method public final buffer(Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<B:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<TB;>;)",
            "Lio/reactivex/Observable",
            "<",
            "Ljava/util/List",
            "<TT;>;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 5578
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "boundary":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TB;>;"
    invoke-static {}, Lio/reactivex/internal/util/ArrayListSupplier;->asCallable()Ljava/util/concurrent/Callable;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lio/reactivex/Observable;->buffer(Lio/reactivex/ObservableSource;Ljava/util/concurrent/Callable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final buffer(Lio/reactivex/ObservableSource;I)Lio/reactivex/Observable;
    .locals 1
    .param p2, "initialCapacity"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<B:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<TB;>;I)",
            "Lio/reactivex/Observable",
            "<",
            "Ljava/util/List",
            "<TT;>;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 5608
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "boundary":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TB;>;"
    const-string/jumbo v0, "initialCapacity"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(ILjava/lang/String;)I

    .line 5609
    invoke-static {p2}, Lio/reactivex/internal/functions/Functions;->createArrayList(I)Ljava/util/concurrent/Callable;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lio/reactivex/Observable;->buffer(Lio/reactivex/ObservableSource;Ljava/util/concurrent/Callable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final buffer(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TOpening:",
            "Ljava/lang/Object;",
            "TClosing:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<+TTOpening;>;",
            "Lio/reactivex/functions/Function",
            "<-TTOpening;+",
            "Lio/reactivex/ObservableSource",
            "<+TTClosing;>;>;)",
            "Lio/reactivex/Observable",
            "<",
            "Ljava/util/List",
            "<TT;>;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 5512
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "openingIndicator":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TTOpening;>;"
    .local p2, "closingIndicator":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TTOpening;+Lio/reactivex/ObservableSource<+TTClosing;>;>;"
    invoke-static {}, Lio/reactivex/internal/util/ArrayListSupplier;->asCallable()Ljava/util/concurrent/Callable;

    move-result-object v0

    invoke-virtual {p0, p1, p2, v0}, Lio/reactivex/Observable;->buffer(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;Ljava/util/concurrent/Callable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final buffer(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;Ljava/util/concurrent/Callable;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TOpening:",
            "Ljava/lang/Object;",
            "TClosing:",
            "Ljava/lang/Object;",
            "U::",
            "Ljava/util/Collection",
            "<-TT;>;>(",
            "Lio/reactivex/ObservableSource",
            "<+TTOpening;>;",
            "Lio/reactivex/functions/Function",
            "<-TTOpening;+",
            "Lio/reactivex/ObservableSource",
            "<+TTClosing;>;>;",
            "Ljava/util/concurrent/Callable",
            "<TU;>;)",
            "Lio/reactivex/Observable",
            "<TU;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 5547
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "openingIndicator":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TTOpening;>;"
    .local p2, "closingIndicator":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TTOpening;+Lio/reactivex/ObservableSource<+TTClosing;>;>;"
    .local p3, "bufferSupplier":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<TU;>;"
    const-string/jumbo v0, "openingIndicator is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 5548
    const-string/jumbo v0, "closingIndicator is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 5549
    const-string/jumbo v0, "bufferSupplier is null"

    invoke-static {p3, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 5550
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableBufferBoundary;

    invoke-direct {v0, p0, p1, p2, p3}, Lio/reactivex/internal/operators/observable/ObservableBufferBoundary;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;Ljava/util/concurrent/Callable;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final buffer(Lio/reactivex/ObservableSource;Ljava/util/concurrent/Callable;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<B:",
            "Ljava/lang/Object;",
            "U::",
            "Ljava/util/Collection",
            "<-TT;>;>(",
            "Lio/reactivex/ObservableSource",
            "<TB;>;",
            "Ljava/util/concurrent/Callable",
            "<TU;>;)",
            "Lio/reactivex/Observable",
            "<TU;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 5641
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "boundary":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TB;>;"
    .local p2, "bufferSupplier":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<TU;>;"
    const-string/jumbo v0, "boundary is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 5642
    const-string/jumbo v0, "bufferSupplier is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 5643
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary;

    invoke-direct {v0, p0, p1, p2}, Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Ljava/util/concurrent/Callable;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final buffer(Ljava/util/concurrent/Callable;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<B:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable",
            "<+",
            "Lio/reactivex/ObservableSource",
            "<TB;>;>;)",
            "Lio/reactivex/Observable",
            "<",
            "Ljava/util/List",
            "<TT;>;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 5669
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "boundarySupplier":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<+Lio/reactivex/ObservableSource<TB;>;>;"
    invoke-static {}, Lio/reactivex/internal/util/ArrayListSupplier;->asCallable()Ljava/util/concurrent/Callable;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lio/reactivex/Observable;->buffer(Ljava/util/concurrent/Callable;Ljava/util/concurrent/Callable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final buffer(Ljava/util/concurrent/Callable;Ljava/util/concurrent/Callable;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<B:",
            "Ljava/lang/Object;",
            "U::",
            "Ljava/util/Collection",
            "<-TT;>;>(",
            "Ljava/util/concurrent/Callable",
            "<+",
            "Lio/reactivex/ObservableSource",
            "<TB;>;>;",
            "Ljava/util/concurrent/Callable",
            "<TU;>;)",
            "Lio/reactivex/Observable",
            "<TU;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 5700
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "boundarySupplier":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<+Lio/reactivex/ObservableSource<TB;>;>;"
    .local p2, "bufferSupplier":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<TU;>;"
    const-string/jumbo v0, "boundarySupplier is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 5701
    const-string/jumbo v0, "bufferSupplier is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 5702
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableBufferBoundarySupplier;

    invoke-direct {v0, p0, p1, p2}, Lio/reactivex/internal/operators/observable/ObservableBufferBoundarySupplier;-><init>(Lio/reactivex/ObservableSource;Ljava/util/concurrent/Callable;Ljava/util/concurrent/Callable;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final cache()Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 5756
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-static {p0}, Lio/reactivex/internal/operators/observable/ObservableCache;->from(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final cacheWithInitialCapacity(I)Lio/reactivex/Observable;
    .locals 1
    .param p1, "initialCapacity"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 5814
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-static {p0, p1}, Lio/reactivex/internal/operators/observable/ObservableCache;->from(Lio/reactivex/Observable;I)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final cast(Ljava/lang/Class;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TU;>;)",
            "Lio/reactivex/Observable",
            "<TU;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 5838
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TU;>;"
    const-string/jumbo v0, "clazz is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 5839
    invoke-static {p1}, Lio/reactivex/internal/functions/Functions;->castFunction(Ljava/lang/Class;)Lio/reactivex/functions/Function;

    move-result-object v0

    invoke-virtual {p0, v0}, Lio/reactivex/Observable;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final collect(Ljava/util/concurrent/Callable;Lio/reactivex/functions/BiConsumer;)Lio/reactivex/Single;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable",
            "<+TU;>;",
            "Lio/reactivex/functions/BiConsumer",
            "<-TU;-TT;>;)",
            "Lio/reactivex/Single",
            "<TU;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 5867
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "initialValueSupplier":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<+TU;>;"
    .local p2, "collector":Lio/reactivex/functions/BiConsumer;, "Lio/reactivex/functions/BiConsumer<-TU;-TT;>;"
    const-string/jumbo v0, "initialValueSupplier is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 5868
    const-string/jumbo v0, "collector is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 5869
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableCollectSingle;

    invoke-direct {v0, p0, p1, p2}, Lio/reactivex/internal/operators/observable/ObservableCollectSingle;-><init>(Lio/reactivex/ObservableSource;Ljava/util/concurrent/Callable;Lio/reactivex/functions/BiConsumer;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Single;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public final collectInto(Ljava/lang/Object;Lio/reactivex/functions/BiConsumer;)Lio/reactivex/Single;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            ">(TU;",
            "Lio/reactivex/functions/BiConsumer",
            "<-TU;-TT;>;)",
            "Lio/reactivex/Single",
            "<TU;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 5897
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "initialValue":Ljava/lang/Object;, "TU;"
    .local p2, "collector":Lio/reactivex/functions/BiConsumer;, "Lio/reactivex/functions/BiConsumer<-TU;-TT;>;"
    const-string/jumbo v0, "initialValue is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 5898
    invoke-static {p1}, Lio/reactivex/internal/functions/Functions;->justCallable(Ljava/lang/Object;)Ljava/util/concurrent/Callable;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Lio/reactivex/Observable;->collect(Ljava/util/concurrent/Callable;Lio/reactivex/functions/BiConsumer;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public final compose(Lio/reactivex/ObservableTransformer;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableTransformer",
            "<-TT;+TR;>;)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 5924
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "composer":Lio/reactivex/ObservableTransformer;, "Lio/reactivex/ObservableTransformer<-TT;+TR;>;"
    const-string/jumbo v0, "composer is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/reactivex/ObservableTransformer;

    invoke-interface {v0, p0}, Lio/reactivex/ObservableTransformer;->apply(Lio/reactivex/Observable;)Lio/reactivex/ObservableSource;

    move-result-object v0

    invoke-static {v0}, Lio/reactivex/Observable;->wrap(Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final concatMap(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/ObservableSource",
            "<+TR;>;>;)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 5949
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lio/reactivex/ObservableSource<+TR;>;>;"
    const/4 v0, 0x2

    invoke-virtual {p0, p1, v0}, Lio/reactivex/Observable;->concatMap(Lio/reactivex/functions/Function;I)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final concatMap(Lio/reactivex/functions/Function;I)Lio/reactivex/Observable;
    .locals 3
    .param p2, "prefetch"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/ObservableSource",
            "<+TR;>;>;I)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 5976
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lio/reactivex/ObservableSource<+TR;>;>;"
    const-string/jumbo v1, "mapper is null"

    invoke-static {p1, v1}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 5977
    const-string/jumbo v1, "prefetch"

    invoke-static {p2, v1}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(ILjava/lang/String;)I

    .line 5978
    instance-of v1, p0, Lio/reactivex/internal/fuseable/ScalarCallable;

    if-eqz v1, :cond_1

    .line 5980
    check-cast p0, Lio/reactivex/internal/fuseable/ScalarCallable;

    .end local p0    # "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-interface {p0}, Lio/reactivex/internal/fuseable/ScalarCallable;->call()Ljava/lang/Object;

    move-result-object v0

    .line 5981
    .local v0, "v":Ljava/lang/Object;, "TT;"
    if-nez v0, :cond_0

    .line 5982
    invoke-static {}, Lio/reactivex/Observable;->empty()Lio/reactivex/Observable;

    move-result-object v1

    .line 5986
    .end local v0    # "v":Ljava/lang/Object;, "TT;"
    :goto_0
    return-object v1

    .line 5984
    .restart local v0    # "v":Ljava/lang/Object;, "TT;"
    :cond_0
    invoke-static {v0, p1}, Lio/reactivex/internal/operators/observable/ObservableScalarXMap;->scalarXMap(Ljava/lang/Object;Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object v1

    goto :goto_0

    .line 5986
    .end local v0    # "v":Ljava/lang/Object;, "TT;"
    .restart local p0    # "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    :cond_1
    new-instance v1, Lio/reactivex/internal/operators/observable/ObservableConcatMap;

    sget-object v2, Lio/reactivex/internal/util/ErrorMode;->IMMEDIATE:Lio/reactivex/internal/util/ErrorMode;

    invoke-direct {v1, p0, p1, p2, v2}, Lio/reactivex/internal/operators/observable/ObservableConcatMap;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;ILio/reactivex/internal/util/ErrorMode;)V

    invoke-static {v1}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v1

    goto :goto_0
.end method

.method public final concatMapDelayError(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/ObservableSource",
            "<+TR;>;>;)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 6007
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lio/reactivex/ObservableSource<+TR;>;>;"
    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v0

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v0, v1}, Lio/reactivex/Observable;->concatMapDelayError(Lio/reactivex/functions/Function;IZ)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final concatMapDelayError(Lio/reactivex/functions/Function;IZ)Lio/reactivex/Observable;
    .locals 3
    .param p2, "prefetch"    # I
    .param p3, "tillTheEnd"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/ObservableSource",
            "<+TR;>;>;IZ)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 6034
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lio/reactivex/ObservableSource<+TR;>;>;"
    const-string/jumbo v1, "mapper is null"

    invoke-static {p1, v1}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 6035
    const-string/jumbo v1, "prefetch"

    invoke-static {p2, v1}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(ILjava/lang/String;)I

    .line 6036
    instance-of v1, p0, Lio/reactivex/internal/fuseable/ScalarCallable;

    if-eqz v1, :cond_1

    .line 6038
    check-cast p0, Lio/reactivex/internal/fuseable/ScalarCallable;

    .end local p0    # "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-interface {p0}, Lio/reactivex/internal/fuseable/ScalarCallable;->call()Ljava/lang/Object;

    move-result-object v0

    .line 6039
    .local v0, "v":Ljava/lang/Object;, "TT;"
    if-nez v0, :cond_0

    .line 6040
    invoke-static {}, Lio/reactivex/Observable;->empty()Lio/reactivex/Observable;

    move-result-object v1

    .line 6044
    .end local v0    # "v":Ljava/lang/Object;, "TT;"
    :goto_0
    return-object v1

    .line 6042
    .restart local v0    # "v":Ljava/lang/Object;, "TT;"
    :cond_0
    invoke-static {v0, p1}, Lio/reactivex/internal/operators/observable/ObservableScalarXMap;->scalarXMap(Ljava/lang/Object;Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object v1

    goto :goto_0

    .line 6044
    .end local v0    # "v":Ljava/lang/Object;, "TT;"
    .restart local p0    # "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    :cond_1
    new-instance v2, Lio/reactivex/internal/operators/observable/ObservableConcatMap;

    if-eqz p3, :cond_2

    sget-object v1, Lio/reactivex/internal/util/ErrorMode;->END:Lio/reactivex/internal/util/ErrorMode;

    :goto_1
    invoke-direct {v2, p0, p1, p2, v1}, Lio/reactivex/internal/operators/observable/ObservableConcatMap;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;ILio/reactivex/internal/util/ErrorMode;)V

    invoke-static {v2}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v1

    goto :goto_0

    :cond_2
    sget-object v1, Lio/reactivex/internal/util/ErrorMode;->BOUNDARY:Lio/reactivex/internal/util/ErrorMode;

    goto :goto_1
.end method

.method public final concatMapEager(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/ObservableSource",
            "<+TR;>;>;)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 6067
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lio/reactivex/ObservableSource<+TR;>;>;"
    const v0, 0x7fffffff

    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v1

    invoke-virtual {p0, p1, v0, v1}, Lio/reactivex/Observable;->concatMapEager(Lio/reactivex/functions/Function;II)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final concatMapEager(Lio/reactivex/functions/Function;II)Lio/reactivex/Observable;
    .locals 6
    .param p2, "maxConcurrency"    # I
    .param p3, "prefetch"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/ObservableSource",
            "<+TR;>;>;II)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 6093
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lio/reactivex/ObservableSource<+TR;>;>;"
    const-string/jumbo v0, "mapper is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 6094
    const-string/jumbo v0, "maxConcurrency"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(ILjava/lang/String;)I

    .line 6095
    const-string/jumbo v0, "prefetch"

    invoke-static {p3, v0}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(ILjava/lang/String;)I

    .line 6096
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager;

    sget-object v3, Lio/reactivex/internal/util/ErrorMode;->IMMEDIATE:Lio/reactivex/internal/util/ErrorMode;

    move-object v1, p0

    move-object v2, p1

    move v4, p2

    move v5, p3

    invoke-direct/range {v0 .. v5}, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;Lio/reactivex/internal/util/ErrorMode;II)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final concatMapEagerDelayError(Lio/reactivex/functions/Function;IIZ)Lio/reactivex/Observable;
    .locals 6
    .param p2, "maxConcurrency"    # I
    .param p3, "prefetch"    # I
    .param p4, "tillTheEnd"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/ObservableSource",
            "<+TR;>;>;IIZ)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 6154
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lio/reactivex/ObservableSource<+TR;>;>;"
    const-string/jumbo v0, "mapper is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 6155
    const-string/jumbo v0, "maxConcurrency"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(ILjava/lang/String;)I

    .line 6156
    const-string/jumbo v0, "prefetch"

    invoke-static {p3, v0}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(ILjava/lang/String;)I

    .line 6157
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager;

    if-eqz p4, :cond_0

    sget-object v3, Lio/reactivex/internal/util/ErrorMode;->END:Lio/reactivex/internal/util/ErrorMode;

    :goto_0
    move-object v1, p0

    move-object v2, p1

    move v4, p2

    move v5, p3

    invoke-direct/range {v0 .. v5}, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;Lio/reactivex/internal/util/ErrorMode;II)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0

    :cond_0
    sget-object v3, Lio/reactivex/internal/util/ErrorMode;->BOUNDARY:Lio/reactivex/internal/util/ErrorMode;

    goto :goto_0
.end method

.method public final concatMapEagerDelayError(Lio/reactivex/functions/Function;Z)Lio/reactivex/Observable;
    .locals 2
    .param p2, "tillTheEnd"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/ObservableSource",
            "<+TR;>;>;Z)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 6123
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lio/reactivex/ObservableSource<+TR;>;>;"
    const v0, 0x7fffffff

    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v1

    invoke-virtual {p0, p1, v0, v1, p2}, Lio/reactivex/Observable;->concatMapEagerDelayError(Lio/reactivex/functions/Function;IIZ)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final concatMapIterable(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Ljava/lang/Iterable",
            "<+TU;>;>;)",
            "Lio/reactivex/Observable",
            "<TU;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 6182
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Ljava/lang/Iterable<+TU;>;>;"
    const-string/jumbo v0, "mapper is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 6183
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableFlattenIterable;

    invoke-direct {v0, p0, p1}, Lio/reactivex/internal/operators/observable/ObservableFlattenIterable;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final concatMapIterable(Lio/reactivex/functions/Function;I)Lio/reactivex/Observable;
    .locals 1
    .param p2, "prefetch"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Ljava/lang/Iterable",
            "<+TU;>;>;I)",
            "Lio/reactivex/Observable",
            "<TU;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 6210
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Ljava/lang/Iterable<+TU;>;>;"
    const-string/jumbo v0, "mapper is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 6211
    const-string/jumbo v0, "prefetch"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(ILjava/lang/String;)I

    .line 6212
    invoke-static {p1}, Lio/reactivex/internal/operators/observable/ObservableInternalHelper;->flatMapIntoIterable(Lio/reactivex/functions/Function;)Lio/reactivex/functions/Function;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Lio/reactivex/Observable;->concatMap(Lio/reactivex/functions/Function;I)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final concatWith(Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 6234
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "other":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    const-string/jumbo v0, "other is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 6235
    invoke-static {p0, p1}, Lio/reactivex/Observable;->concat(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final contains(Ljava/lang/Object;)Lio/reactivex/Single;
    .locals 1
    .param p1, "element"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Lio/reactivex/Single",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 6257
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    const-string/jumbo v0, "element is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 6258
    invoke-static {p1}, Lio/reactivex/internal/functions/Functions;->equalsWith(Ljava/lang/Object;)Lio/reactivex/functions/Predicate;

    move-result-object v0

    invoke-virtual {p0, v0}, Lio/reactivex/Observable;->any(Lio/reactivex/functions/Predicate;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public final count()Lio/reactivex/Single;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/Single",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 6279
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableCountSingle;

    invoke-direct {v0, p0}, Lio/reactivex/internal/operators/observable/ObservableCountSingle;-><init>(Lio/reactivex/ObservableSource;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Single;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public final debounce(JLjava/util/concurrent/TimeUnit;)Lio/reactivex/Observable;
    .locals 1
    .param p1, "timeout"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "io.reactivex:computation"
    .end annotation

    .prologue
    .line 6342
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->computation()Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p0, p1, p2, p3, v0}, Lio/reactivex/Observable;->debounce(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final debounce(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;
    .locals 7
    .param p1, "timeout"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "scheduler"    # Lio/reactivex/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            ")",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "custom"
    .end annotation

    .prologue
    .line 6383
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    const-string/jumbo v0, "unit is null"

    invoke-static {p3, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 6384
    const-string/jumbo v0, "scheduler is null"

    invoke-static {p4, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 6385
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableDebounceTimed;

    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lio/reactivex/internal/operators/observable/ObservableDebounceTimed;-><init>(Lio/reactivex/ObservableSource;JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final debounce(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/ObservableSource",
            "<TU;>;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 6303
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "debounceSelector":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lio/reactivex/ObservableSource<TU;>;>;"
    const-string/jumbo v0, "debounceSelector is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 6304
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableDebounce;

    invoke-direct {v0, p0, p1}, Lio/reactivex/internal/operators/observable/ObservableDebounce;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final defaultIfEmpty(Ljava/lang/Object;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 6407
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "defaultItem":Ljava/lang/Object;, "TT;"
    const-string/jumbo v0, "defaultItem is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 6408
    invoke-static {p1}, Lio/reactivex/Observable;->just(Ljava/lang/Object;)Lio/reactivex/Observable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lio/reactivex/Observable;->switchIfEmpty(Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final delay(JLjava/util/concurrent/TimeUnit;)Lio/reactivex/Observable;
    .locals 7
    .param p1, "delay"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "io.reactivex:computation"
    .end annotation

    .prologue
    .line 6461
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->computation()Lio/reactivex/Scheduler;

    move-result-object v5

    const/4 v6, 0x0

    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    invoke-virtual/range {v1 .. v6}, Lio/reactivex/Observable;->delay(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;Z)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final delay(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;
    .locals 7
    .param p1, "delay"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "scheduler"    # Lio/reactivex/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            ")",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "custom"
    .end annotation

    .prologue
    .line 6512
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    const/4 v6, 0x0

    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    move-object v5, p4

    invoke-virtual/range {v1 .. v6}, Lio/reactivex/Observable;->delay(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;Z)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final delay(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;Z)Lio/reactivex/Observable;
    .locals 7
    .param p1, "delay"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "scheduler"    # Lio/reactivex/Scheduler;
    .param p5, "delayError"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            "Z)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "custom"
    .end annotation

    .prologue
    .line 6540
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    const-string/jumbo v0, "unit is null"

    invoke-static {p3, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 6541
    const-string/jumbo v0, "scheduler is null"

    invoke-static {p4, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 6543
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableDelay;

    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    move-object v5, p4

    move v6, p5

    invoke-direct/range {v0 .. v6}, Lio/reactivex/internal/operators/observable/ObservableDelay;-><init>(Lio/reactivex/ObservableSource;JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;Z)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final delay(JLjava/util/concurrent/TimeUnit;Z)Lio/reactivex/Observable;
    .locals 7
    .param p1, "delay"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "delayError"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Z)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "io.reactivex:computation"
    .end annotation

    .prologue
    .line 6487
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->computation()Lio/reactivex/Scheduler;

    move-result-object v5

    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    move v6, p4

    invoke-virtual/range {v1 .. v6}, Lio/reactivex/Observable;->delay(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;Z)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final delay(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<TU;>;",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/ObservableSource",
            "<TV;>;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 6578
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "subscriptionDelay":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TU;>;"
    .local p2, "itemDelay":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lio/reactivex/ObservableSource<TV;>;>;"
    invoke-virtual {p0, p1}, Lio/reactivex/Observable;->delaySubscription(Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;

    move-result-object v0

    invoke-virtual {v0, p2}, Lio/reactivex/Observable;->delay(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final delay(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/ObservableSource",
            "<TU;>;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 6437
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "itemDelay":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lio/reactivex/ObservableSource<TU;>;>;"
    const-string/jumbo v0, "itemDelay is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 6438
    invoke-static {p1}, Lio/reactivex/internal/operators/observable/ObservableInternalHelper;->itemDelay(Lio/reactivex/functions/Function;)Lio/reactivex/functions/Function;

    move-result-object v0

    invoke-virtual {p0, v0}, Lio/reactivex/Observable;->flatMap(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final delaySubscription(JLjava/util/concurrent/TimeUnit;)Lio/reactivex/Observable;
    .locals 1
    .param p1, "delay"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "io.reactivex:computation"
    .end annotation

    .prologue
    .line 6624
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->computation()Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p0, p1, p2, p3, v0}, Lio/reactivex/Observable;->delaySubscription(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final delaySubscription(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;
    .locals 1
    .param p1, "delay"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "scheduler"    # Lio/reactivex/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            ")",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "custom"
    .end annotation

    .prologue
    .line 6650
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-static {p1, p2, p3, p4}, Lio/reactivex/Observable;->timer(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lio/reactivex/Observable;->delaySubscription(Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final delaySubscription(Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<TU;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 6601
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "other":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TU;>;"
    const-string/jumbo v0, "other is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 6602
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableDelaySubscriptionOther;

    invoke-direct {v0, p0, p1}, Lio/reactivex/internal/operators/observable/ObservableDelaySubscriptionOther;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final dematerialize()Lio/reactivex/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T2:",
            "Ljava/lang/Object;",
            ">()",
            "Lio/reactivex/Observable",
            "<TT2;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 6673
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    move-object v0, p0

    .line 6674
    .local v0, "m":Lio/reactivex/Observable;, "Lio/reactivex/Observable<Lio/reactivex/Notification<TT2;>;>;"
    new-instance v1, Lio/reactivex/internal/operators/observable/ObservableDematerialize;

    invoke-direct {v1, v0}, Lio/reactivex/internal/operators/observable/ObservableDematerialize;-><init>(Lio/reactivex/ObservableSource;)V

    invoke-static {v1}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v1

    return-object v1
.end method

.method public final distinct()Lio/reactivex/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 6693
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-static {}, Lio/reactivex/internal/functions/Functions;->identity()Lio/reactivex/functions/Function;

    move-result-object v0

    invoke-static {}, Lio/reactivex/internal/functions/Functions;->createHashSet()Ljava/util/concurrent/Callable;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lio/reactivex/Observable;->distinct(Lio/reactivex/functions/Function;Ljava/util/concurrent/Callable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final distinct(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-TT;TK;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 6716
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "keySelector":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;TK;>;"
    invoke-static {}, Lio/reactivex/internal/functions/Functions;->createHashSet()Ljava/util/concurrent/Callable;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lio/reactivex/Observable;->distinct(Lio/reactivex/functions/Function;Ljava/util/concurrent/Callable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final distinct(Lio/reactivex/functions/Function;Ljava/util/concurrent/Callable;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-TT;TK;>;",
            "Ljava/util/concurrent/Callable",
            "<+",
            "Ljava/util/Collection",
            "<-TK;>;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 6742
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "keySelector":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;TK;>;"
    .local p2, "collectionSupplier":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<+Ljava/util/Collection<-TK;>;>;"
    const-string/jumbo v0, "keySelector is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 6743
    const-string/jumbo v0, "collectionSupplier is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 6744
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableDistinct;

    invoke-direct {v0, p0, p1, p2}, Lio/reactivex/internal/operators/observable/ObservableDistinct;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;Ljava/util/concurrent/Callable;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final distinctUntilChanged()Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 6764
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-static {}, Lio/reactivex/internal/functions/Functions;->identity()Lio/reactivex/functions/Function;

    move-result-object v0

    invoke-virtual {p0, v0}, Lio/reactivex/Observable;->distinctUntilChanged(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final distinctUntilChanged(Lio/reactivex/functions/BiPredicate;)Lio/reactivex/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/BiPredicate",
            "<-TT;-TT;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 6812
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "comparer":Lio/reactivex/functions/BiPredicate;, "Lio/reactivex/functions/BiPredicate<-TT;-TT;>;"
    const-string/jumbo v0, "comparer is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 6813
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableDistinctUntilChanged;

    invoke-static {}, Lio/reactivex/internal/functions/Functions;->identity()Lio/reactivex/functions/Function;

    move-result-object v1

    invoke-direct {v0, p0, v1, p1}, Lio/reactivex/internal/operators/observable/ObservableDistinctUntilChanged;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;Lio/reactivex/functions/BiPredicate;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final distinctUntilChanged(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-TT;TK;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 6788
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "keySelector":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;TK;>;"
    const-string/jumbo v0, "keySelector is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 6789
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableDistinctUntilChanged;

    invoke-static {}, Lio/reactivex/internal/functions/ObjectHelper;->equalsPredicate()Lio/reactivex/functions/BiPredicate;

    move-result-object v1

    invoke-direct {v0, p0, p1, v1}, Lio/reactivex/internal/operators/observable/ObservableDistinctUntilChanged;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;Lio/reactivex/functions/BiPredicate;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final doAfterNext(Lio/reactivex/functions/Consumer;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Consumer",
            "<-TT;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation build Lio/reactivex/annotations/Experimental;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 6834
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "onAfterNext":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-TT;>;"
    const-string/jumbo v0, "onAfterNext is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 6835
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableDoAfterNext;

    invoke-direct {v0, p0, p1}, Lio/reactivex/internal/operators/observable/ObservableDoAfterNext;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Consumer;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final doAfterTerminate(Lio/reactivex/functions/Action;)Lio/reactivex/Observable;
    .locals 3
    .param p1, "onFinally"    # Lio/reactivex/functions/Action;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Action;",
            ")",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 6858
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    const-string/jumbo v0, "onFinally is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 6859
    invoke-static {}, Lio/reactivex/internal/functions/Functions;->emptyConsumer()Lio/reactivex/functions/Consumer;

    move-result-object v0

    invoke-static {}, Lio/reactivex/internal/functions/Functions;->emptyConsumer()Lio/reactivex/functions/Consumer;

    move-result-object v1

    sget-object v2, Lio/reactivex/internal/functions/Functions;->EMPTY_ACTION:Lio/reactivex/functions/Action;

    invoke-direct {p0, v0, v1, v2, p1}, Lio/reactivex/Observable;->doOnEach(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Action;Lio/reactivex/functions/Action;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final doFinally(Lio/reactivex/functions/Action;)Lio/reactivex/Observable;
    .locals 1
    .param p1, "onFinally"    # Lio/reactivex/functions/Action;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Action;",
            ")",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation build Lio/reactivex/annotations/Experimental;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 6883
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    const-string/jumbo v0, "onFinally is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 6884
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableDoFinally;

    invoke-direct {v0, p0, p1}, Lio/reactivex/internal/operators/observable/ObservableDoFinally;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Action;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final doOnComplete(Lio/reactivex/functions/Action;)Lio/reactivex/Observable;
    .locals 3
    .param p1, "onComplete"    # Lio/reactivex/functions/Action;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Action;",
            ")",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 6932
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-static {}, Lio/reactivex/internal/functions/Functions;->emptyConsumer()Lio/reactivex/functions/Consumer;

    move-result-object v0

    invoke-static {}, Lio/reactivex/internal/functions/Functions;->emptyConsumer()Lio/reactivex/functions/Consumer;

    move-result-object v1

    sget-object v2, Lio/reactivex/internal/functions/Functions;->EMPTY_ACTION:Lio/reactivex/functions/Action;

    invoke-direct {p0, v0, v1, p1, v2}, Lio/reactivex/Observable;->doOnEach(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Action;Lio/reactivex/functions/Action;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final doOnDispose(Lio/reactivex/functions/Action;)Lio/reactivex/Observable;
    .locals 1
    .param p1, "onDispose"    # Lio/reactivex/functions/Action;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Action;",
            ")",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 6912
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-static {}, Lio/reactivex/internal/functions/Functions;->emptyConsumer()Lio/reactivex/functions/Consumer;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lio/reactivex/Observable;->doOnLifecycle(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Action;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final doOnEach(Lio/reactivex/Observer;)Lio/reactivex/Observable;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TT;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 7007
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "observer":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    const-string/jumbo v0, "observer is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 7008
    invoke-static {p1}, Lio/reactivex/internal/operators/observable/ObservableInternalHelper;->observerOnNext(Lio/reactivex/Observer;)Lio/reactivex/functions/Consumer;

    move-result-object v0

    invoke-static {p1}, Lio/reactivex/internal/operators/observable/ObservableInternalHelper;->observerOnError(Lio/reactivex/Observer;)Lio/reactivex/functions/Consumer;

    move-result-object v1

    invoke-static {p1}, Lio/reactivex/internal/operators/observable/ObservableInternalHelper;->observerOnComplete(Lio/reactivex/Observer;)Lio/reactivex/functions/Action;

    move-result-object v2

    sget-object v3, Lio/reactivex/internal/functions/Functions;->EMPTY_ACTION:Lio/reactivex/functions/Action;

    invoke-direct {p0, v0, v1, v2, v3}, Lio/reactivex/Observable;->doOnEach(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Action;Lio/reactivex/functions/Action;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final doOnEach(Lio/reactivex/functions/Consumer;)Lio/reactivex/Observable;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Consumer",
            "<-",
            "Lio/reactivex/Notification",
            "<TT;>;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 6975
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "onNotification":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-Lio/reactivex/Notification<TT;>;>;"
    const-string/jumbo v0, "consumer is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 6976
    invoke-static {p1}, Lio/reactivex/internal/functions/Functions;->notificationOnNext(Lio/reactivex/functions/Consumer;)Lio/reactivex/functions/Consumer;

    move-result-object v0

    invoke-static {p1}, Lio/reactivex/internal/functions/Functions;->notificationOnError(Lio/reactivex/functions/Consumer;)Lio/reactivex/functions/Consumer;

    move-result-object v1

    invoke-static {p1}, Lio/reactivex/internal/functions/Functions;->notificationOnComplete(Lio/reactivex/functions/Consumer;)Lio/reactivex/functions/Action;

    move-result-object v2

    sget-object v3, Lio/reactivex/internal/functions/Functions;->EMPTY_ACTION:Lio/reactivex/functions/Action;

    invoke-direct {p0, v0, v1, v2, v3}, Lio/reactivex/Observable;->doOnEach(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Action;Lio/reactivex/functions/Action;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final doOnError(Lio/reactivex/functions/Consumer;)Lio/reactivex/Observable;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Consumer",
            "<-",
            "Ljava/lang/Throwable;",
            ">;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 7035
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "onError":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-Ljava/lang/Throwable;>;"
    invoke-static {}, Lio/reactivex/internal/functions/Functions;->emptyConsumer()Lio/reactivex/functions/Consumer;

    move-result-object v0

    sget-object v1, Lio/reactivex/internal/functions/Functions;->EMPTY_ACTION:Lio/reactivex/functions/Action;

    sget-object v2, Lio/reactivex/internal/functions/Functions;->EMPTY_ACTION:Lio/reactivex/functions/Action;

    invoke-direct {p0, v0, p1, v1, v2}, Lio/reactivex/Observable;->doOnEach(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Action;Lio/reactivex/functions/Action;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final doOnLifecycle(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Action;)Lio/reactivex/Observable;
    .locals 1
    .param p2, "onDispose"    # Lio/reactivex/functions/Action;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Consumer",
            "<-",
            "Lio/reactivex/disposables/Disposable;",
            ">;",
            "Lio/reactivex/functions/Action;",
            ")",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 7058
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "onSubscribe":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-Lio/reactivex/disposables/Disposable;>;"
    const-string/jumbo v0, "onSubscribe is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 7059
    const-string/jumbo v0, "onDispose is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 7060
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableDoOnLifecycle;

    invoke-direct {v0, p0, p1, p2}, Lio/reactivex/internal/operators/observable/ObservableDoOnLifecycle;-><init>(Lio/reactivex/Observable;Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Action;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final doOnNext(Lio/reactivex/functions/Consumer;)Lio/reactivex/Observable;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Consumer",
            "<-TT;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 7080
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "onNext":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-TT;>;"
    invoke-static {}, Lio/reactivex/internal/functions/Functions;->emptyConsumer()Lio/reactivex/functions/Consumer;

    move-result-object v0

    sget-object v1, Lio/reactivex/internal/functions/Functions;->EMPTY_ACTION:Lio/reactivex/functions/Action;

    sget-object v2, Lio/reactivex/internal/functions/Functions;->EMPTY_ACTION:Lio/reactivex/functions/Action;

    invoke-direct {p0, p1, v0, v1, v2}, Lio/reactivex/Observable;->doOnEach(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Action;Lio/reactivex/functions/Action;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final doOnSubscribe(Lio/reactivex/functions/Consumer;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Consumer",
            "<-",
            "Lio/reactivex/disposables/Disposable;",
            ">;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 7103
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "onSubscribe":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-Lio/reactivex/disposables/Disposable;>;"
    sget-object v0, Lio/reactivex/internal/functions/Functions;->EMPTY_ACTION:Lio/reactivex/functions/Action;

    invoke-virtual {p0, p1, v0}, Lio/reactivex/Observable;->doOnLifecycle(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Action;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final doOnTerminate(Lio/reactivex/functions/Action;)Lio/reactivex/Observable;
    .locals 3
    .param p1, "onTerminate"    # Lio/reactivex/functions/Action;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Action;",
            ")",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 7128
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    const-string/jumbo v0, "onTerminate is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 7129
    invoke-static {}, Lio/reactivex/internal/functions/Functions;->emptyConsumer()Lio/reactivex/functions/Consumer;

    move-result-object v0

    invoke-static {p1}, Lio/reactivex/internal/functions/Functions;->actionConsumer(Lio/reactivex/functions/Action;)Lio/reactivex/functions/Consumer;

    move-result-object v1

    sget-object v2, Lio/reactivex/internal/functions/Functions;->EMPTY_ACTION:Lio/reactivex/functions/Action;

    invoke-direct {p0, v0, v1, p1, v2}, Lio/reactivex/Observable;->doOnEach(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Action;Lio/reactivex/functions/Action;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final elementAt(J)Lio/reactivex/Maybe;
    .locals 3
    .param p1, "index"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Lio/reactivex/Maybe",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 7155
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gez v0, :cond_0

    .line 7156
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "index >= 0 required but it was "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 7158
    :cond_0
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableElementAtMaybe;

    invoke-direct {v0, p0, p1, p2}, Lio/reactivex/internal/operators/observable/ObservableElementAtMaybe;-><init>(Lio/reactivex/ObservableSource;J)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Maybe;)Lio/reactivex/Maybe;

    move-result-object v0

    return-object v0
.end method

.method public final elementAt(JLjava/lang/Object;)Lio/reactivex/Single;
    .locals 3
    .param p1, "index"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JTT;)",
            "Lio/reactivex/Single",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 7184
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p3, "defaultItem":Ljava/lang/Object;, "TT;"
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gez v0, :cond_0

    .line 7185
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "index >= 0 required but it was "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 7187
    :cond_0
    const-string/jumbo v0, "defaultItem is null"

    invoke-static {p3, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 7188
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableElementAtSingle;

    invoke-direct {v0, p0, p1, p2, p3}, Lio/reactivex/internal/operators/observable/ObservableElementAtSingle;-><init>(Lio/reactivex/ObservableSource;JLjava/lang/Object;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Single;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public final elementAtOrError(J)Lio/reactivex/Single;
    .locals 3
    .param p1, "index"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Lio/reactivex/Single",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 7212
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gez v0, :cond_0

    .line 7213
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "index >= 0 required but it was "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 7215
    :cond_0
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableElementAtSingle;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, p2, v1}, Lio/reactivex/internal/operators/observable/ObservableElementAtSingle;-><init>(Lio/reactivex/ObservableSource;JLjava/lang/Object;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Single;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public final filter(Lio/reactivex/functions/Predicate;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Predicate",
            "<-TT;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 7237
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "predicate":Lio/reactivex/functions/Predicate;, "Lio/reactivex/functions/Predicate<-TT;>;"
    const-string/jumbo v0, "predicate is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 7238
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableFilter;

    invoke-direct {v0, p0, p1}, Lio/reactivex/internal/operators/observable/ObservableFilter;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Predicate;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final first(Ljava/lang/Object;)Lio/reactivex/Single;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Lio/reactivex/Single",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 7278
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "defaultItem":Ljava/lang/Object;, "TT;"
    const-wide/16 v0, 0x0

    invoke-virtual {p0, v0, v1, p1}, Lio/reactivex/Observable;->elementAt(JLjava/lang/Object;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public final firstElement()Lio/reactivex/Maybe;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/Maybe",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 7257
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    const-wide/16 v0, 0x0

    invoke-virtual {p0, v0, v1}, Lio/reactivex/Observable;->elementAt(J)Lio/reactivex/Maybe;

    move-result-object v0

    return-object v0
.end method

.method public final firstOrError()Lio/reactivex/Single;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/Single",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 7297
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    const-wide/16 v0, 0x0

    invoke-virtual {p0, v0, v1}, Lio/reactivex/Observable;->elementAtOrError(J)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public final flatMap(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/ObservableSource",
            "<+TR;>;>;)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 7323
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lio/reactivex/ObservableSource<+TR;>;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lio/reactivex/Observable;->flatMap(Lio/reactivex/functions/Function;Z)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final flatMap(Lio/reactivex/functions/Function;I)Lio/reactivex/Observable;
    .locals 2
    .param p2, "maxConcurrency"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/ObservableSource",
            "<+TR;>;>;I)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 7539
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lio/reactivex/ObservableSource<+TR;>;>;"
    const/4 v0, 0x0

    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v1

    invoke-virtual {p0, p1, v0, p2, v1}, Lio/reactivex/Observable;->flatMap(Lio/reactivex/functions/Function;ZII)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final flatMap(Lio/reactivex/functions/Function;Lio/reactivex/functions/BiFunction;)Lio/reactivex/Observable;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/ObservableSource",
            "<+TU;>;>;",
            "Lio/reactivex/functions/BiFunction",
            "<-TT;-TU;+TR;>;)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 7569
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lio/reactivex/ObservableSource<+TU;>;>;"
    .local p2, "resultSelector":Lio/reactivex/functions/BiFunction;, "Lio/reactivex/functions/BiFunction<-TT;-TU;+TR;>;"
    const/4 v3, 0x0

    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v4

    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v5

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-virtual/range {v0 .. v5}, Lio/reactivex/Observable;->flatMap(Lio/reactivex/functions/Function;Lio/reactivex/functions/BiFunction;ZII)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final flatMap(Lio/reactivex/functions/Function;Lio/reactivex/functions/BiFunction;I)Lio/reactivex/Observable;
    .locals 6
    .param p3, "maxConcurrency"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/ObservableSource",
            "<+TU;>;>;",
            "Lio/reactivex/functions/BiFunction",
            "<-TT;-TU;+TR;>;I)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 7714
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lio/reactivex/ObservableSource<+TU;>;>;"
    .local p2, "combiner":Lio/reactivex/functions/BiFunction;, "Lio/reactivex/functions/BiFunction<-TT;-TU;+TR;>;"
    const/4 v3, 0x0

    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v5

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v4, p3

    invoke-virtual/range {v0 .. v5}, Lio/reactivex/Observable;->flatMap(Lio/reactivex/functions/Function;Lio/reactivex/functions/BiFunction;ZII)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final flatMap(Lio/reactivex/functions/Function;Lio/reactivex/functions/BiFunction;Z)Lio/reactivex/Observable;
    .locals 6
    .param p3, "delayErrors"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/ObservableSource",
            "<+TU;>;>;",
            "Lio/reactivex/functions/BiFunction",
            "<-TT;-TU;+TR;>;Z)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 7602
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lio/reactivex/ObservableSource<+TU;>;>;"
    .local p2, "combiner":Lio/reactivex/functions/BiFunction;, "Lio/reactivex/functions/BiFunction<-TT;-TU;+TR;>;"
    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v4

    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v5

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    invoke-virtual/range {v0 .. v5}, Lio/reactivex/Observable;->flatMap(Lio/reactivex/functions/Function;Lio/reactivex/functions/BiFunction;ZII)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final flatMap(Lio/reactivex/functions/Function;Lio/reactivex/functions/BiFunction;ZI)Lio/reactivex/Observable;
    .locals 6
    .param p3, "delayErrors"    # Z
    .param p4, "maxConcurrency"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/ObservableSource",
            "<+TU;>;>;",
            "Lio/reactivex/functions/BiFunction",
            "<-TT;-TU;+TR;>;ZI)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 7639
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lio/reactivex/ObservableSource<+TU;>;>;"
    .local p2, "combiner":Lio/reactivex/functions/BiFunction;, "Lio/reactivex/functions/BiFunction<-TT;-TU;+TR;>;"
    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v5

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    invoke-virtual/range {v0 .. v5}, Lio/reactivex/Observable;->flatMap(Lio/reactivex/functions/Function;Lio/reactivex/functions/BiFunction;ZII)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final flatMap(Lio/reactivex/functions/Function;Lio/reactivex/functions/BiFunction;ZII)Lio/reactivex/Observable;
    .locals 1
    .param p3, "delayErrors"    # Z
    .param p4, "maxConcurrency"    # I
    .param p5, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/ObservableSource",
            "<+TU;>;>;",
            "Lio/reactivex/functions/BiFunction",
            "<-TT;-TU;+TR;>;ZII)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 7678
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lio/reactivex/ObservableSource<+TU;>;>;"
    .local p2, "combiner":Lio/reactivex/functions/BiFunction;, "Lio/reactivex/functions/BiFunction<-TT;-TU;+TR;>;"
    const-string/jumbo v0, "mapper is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 7679
    const-string/jumbo v0, "combiner is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 7680
    invoke-static {p1, p2}, Lio/reactivex/internal/operators/observable/ObservableInternalHelper;->flatMapWithCombiner(Lio/reactivex/functions/Function;Lio/reactivex/functions/BiFunction;)Lio/reactivex/functions/Function;

    move-result-object v0

    invoke-virtual {p0, v0, p3, p4, p5}, Lio/reactivex/Observable;->flatMap(Lio/reactivex/functions/Function;ZII)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final flatMap(Lio/reactivex/functions/Function;Lio/reactivex/functions/Function;Ljava/util/concurrent/Callable;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/ObservableSource",
            "<+TR;>;>;",
            "Lio/reactivex/functions/Function",
            "<-",
            "Ljava/lang/Throwable;",
            "+",
            "Lio/reactivex/ObservableSource",
            "<+TR;>;>;",
            "Ljava/util/concurrent/Callable",
            "<+",
            "Lio/reactivex/ObservableSource",
            "<+TR;>;>;)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 7465
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "onNextMapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lio/reactivex/ObservableSource<+TR;>;>;"
    .local p2, "onErrorMapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Ljava/lang/Throwable;+Lio/reactivex/ObservableSource<+TR;>;>;"
    .local p3, "onCompleteSupplier":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<+Lio/reactivex/ObservableSource<+TR;>;>;"
    const-string/jumbo v0, "onNextMapper is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 7466
    const-string/jumbo v0, "onErrorMapper is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 7467
    const-string/jumbo v0, "onCompleteSupplier is null"

    invoke-static {p3, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 7468
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableMapNotification;

    invoke-direct {v0, p0, p1, p2, p3}, Lio/reactivex/internal/operators/observable/ObservableMapNotification;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;Lio/reactivex/functions/Function;Ljava/util/concurrent/Callable;)V

    invoke-static {v0}, Lio/reactivex/Observable;->merge(Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final flatMap(Lio/reactivex/functions/Function;Lio/reactivex/functions/Function;Ljava/util/concurrent/Callable;I)Lio/reactivex/Observable;
    .locals 1
    .param p4, "maxConcurrency"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/ObservableSource",
            "<+TR;>;>;",
            "Lio/reactivex/functions/Function",
            "<",
            "Ljava/lang/Throwable;",
            "+",
            "Lio/reactivex/ObservableSource",
            "<+TR;>;>;",
            "Ljava/util/concurrent/Callable",
            "<+",
            "Lio/reactivex/ObservableSource",
            "<+TR;>;>;I)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 7506
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "onNextMapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lio/reactivex/ObservableSource<+TR;>;>;"
    .local p2, "onErrorMapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<Ljava/lang/Throwable;+Lio/reactivex/ObservableSource<+TR;>;>;"
    .local p3, "onCompleteSupplier":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<+Lio/reactivex/ObservableSource<+TR;>;>;"
    const-string/jumbo v0, "onNextMapper is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 7507
    const-string/jumbo v0, "onErrorMapper is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 7508
    const-string/jumbo v0, "onCompleteSupplier is null"

    invoke-static {p3, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 7509
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableMapNotification;

    invoke-direct {v0, p0, p1, p2, p3}, Lio/reactivex/internal/operators/observable/ObservableMapNotification;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;Lio/reactivex/functions/Function;Ljava/util/concurrent/Callable;)V

    invoke-static {v0, p4}, Lio/reactivex/Observable;->merge(Lio/reactivex/ObservableSource;I)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final flatMap(Lio/reactivex/functions/Function;Z)Lio/reactivex/Observable;
    .locals 1
    .param p2, "delayErrors"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/ObservableSource",
            "<+TR;>;>;Z)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 7352
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lio/reactivex/ObservableSource<+TR;>;>;"
    const v0, 0x7fffffff

    invoke-virtual {p0, p1, p2, v0}, Lio/reactivex/Observable;->flatMap(Lio/reactivex/functions/Function;ZI)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final flatMap(Lio/reactivex/functions/Function;ZI)Lio/reactivex/Observable;
    .locals 1
    .param p2, "delayErrors"    # Z
    .param p3, "maxConcurrency"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/ObservableSource",
            "<+TR;>;>;ZI)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 7385
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lio/reactivex/ObservableSource<+TR;>;>;"
    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v0

    invoke-virtual {p0, p1, p2, p3, v0}, Lio/reactivex/Observable;->flatMap(Lio/reactivex/functions/Function;ZII)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final flatMap(Lio/reactivex/functions/Function;ZII)Lio/reactivex/Observable;
    .locals 7
    .param p2, "delayErrors"    # Z
    .param p3, "maxConcurrency"    # I
    .param p4, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/ObservableSource",
            "<+TR;>;>;ZII)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 7421
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lio/reactivex/ObservableSource<+TR;>;>;"
    const-string/jumbo v0, "mapper is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 7422
    const-string/jumbo v0, "maxConcurrency"

    invoke-static {p3, v0}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(ILjava/lang/String;)I

    .line 7423
    const-string/jumbo v0, "bufferSize"

    invoke-static {p4, v0}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(ILjava/lang/String;)I

    .line 7424
    instance-of v0, p0, Lio/reactivex/internal/fuseable/ScalarCallable;

    if-eqz v0, :cond_1

    .line 7426
    check-cast p0, Lio/reactivex/internal/fuseable/ScalarCallable;

    .end local p0    # "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-interface {p0}, Lio/reactivex/internal/fuseable/ScalarCallable;->call()Ljava/lang/Object;

    move-result-object v6

    .line 7427
    .local v6, "v":Ljava/lang/Object;, "TT;"
    if-nez v6, :cond_0

    .line 7428
    invoke-static {}, Lio/reactivex/Observable;->empty()Lio/reactivex/Observable;

    move-result-object v0

    .line 7432
    .end local v6    # "v":Ljava/lang/Object;, "TT;"
    :goto_0
    return-object v0

    .line 7430
    .restart local v6    # "v":Ljava/lang/Object;, "TT;"
    :cond_0
    invoke-static {v6, p1}, Lio/reactivex/internal/operators/observable/ObservableScalarXMap;->scalarXMap(Ljava/lang/Object;Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object v0

    goto :goto_0

    .line 7432
    .end local v6    # "v":Ljava/lang/Object;, "TT;"
    .restart local p0    # "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    :cond_1
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableFlatMap;

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-direct/range {v0 .. v5}, Lio/reactivex/internal/operators/observable/ObservableFlatMap;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;ZII)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    goto :goto_0
.end method

.method public final flatMapCompletable(Lio/reactivex/functions/Function;)Lio/reactivex/Completable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/CompletableSource;",
            ">;)",
            "Lio/reactivex/Completable;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 7730
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lio/reactivex/CompletableSource;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lio/reactivex/Observable;->flatMapCompletable(Lio/reactivex/functions/Function;Z)Lio/reactivex/Completable;

    move-result-object v0

    return-object v0
.end method

.method public final flatMapCompletable(Lio/reactivex/functions/Function;Z)Lio/reactivex/Completable;
    .locals 1
    .param p2, "delayErrors"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/CompletableSource;",
            ">;Z)",
            "Lio/reactivex/Completable;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 7748
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lio/reactivex/CompletableSource;>;"
    const-string/jumbo v0, "mapper is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 7749
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableFlatMapCompletableCompletable;

    invoke-direct {v0, p0, p1, p2}, Lio/reactivex/internal/operators/observable/ObservableFlatMapCompletableCompletable;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;Z)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Completable;)Lio/reactivex/Completable;

    move-result-object v0

    return-object v0
.end method

.method public final flatMapIterable(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Ljava/lang/Iterable",
            "<+TU;>;>;)",
            "Lio/reactivex/Observable",
            "<TU;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 7774
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Ljava/lang/Iterable<+TU;>;>;"
    const-string/jumbo v0, "mapper is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 7775
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableFlattenIterable;

    invoke-direct {v0, p0, p1}, Lio/reactivex/internal/operators/observable/ObservableFlattenIterable;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final flatMapIterable(Lio/reactivex/functions/Function;Lio/reactivex/functions/BiFunction;)Lio/reactivex/Observable;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Ljava/lang/Iterable",
            "<+TU;>;>;",
            "Lio/reactivex/functions/BiFunction",
            "<-TT;-TU;+TV;>;)",
            "Lio/reactivex/Observable",
            "<TV;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 7806
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Ljava/lang/Iterable<+TU;>;>;"
    .local p2, "resultSelector":Lio/reactivex/functions/BiFunction;, "Lio/reactivex/functions/BiFunction<-TT;-TU;+TV;>;"
    const-string/jumbo v0, "mapper is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 7807
    const-string/jumbo v0, "resultSelector is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 7808
    invoke-static {p1}, Lio/reactivex/internal/operators/observable/ObservableInternalHelper;->flatMapIntoIterable(Lio/reactivex/functions/Function;)Lio/reactivex/functions/Function;

    move-result-object v1

    const/4 v3, 0x0

    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v4

    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v5

    move-object v0, p0

    move-object v2, p2

    invoke-virtual/range {v0 .. v5}, Lio/reactivex/Observable;->flatMap(Lio/reactivex/functions/Function;Lio/reactivex/functions/BiFunction;ZII)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final flatMapMaybe(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/MaybeSource",
            "<+TR;>;>;)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 7827
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lio/reactivex/MaybeSource<+TR;>;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lio/reactivex/Observable;->flatMapMaybe(Lio/reactivex/functions/Function;Z)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final flatMapMaybe(Lio/reactivex/functions/Function;Z)Lio/reactivex/Observable;
    .locals 1
    .param p2, "delayErrors"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/MaybeSource",
            "<+TR;>;>;Z)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 7848
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lio/reactivex/MaybeSource<+TR;>;>;"
    const-string/jumbo v0, "mapper is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 7849
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableFlatMapMaybe;

    invoke-direct {v0, p0, p1, p2}, Lio/reactivex/internal/operators/observable/ObservableFlatMapMaybe;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;Z)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final flatMapSingle(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/SingleSource",
            "<+TR;>;>;)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 7868
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lio/reactivex/SingleSource<+TR;>;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lio/reactivex/Observable;->flatMapSingle(Lio/reactivex/functions/Function;Z)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final flatMapSingle(Lio/reactivex/functions/Function;Z)Lio/reactivex/Observable;
    .locals 1
    .param p2, "delayErrors"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/SingleSource",
            "<+TR;>;>;Z)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 7889
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lio/reactivex/SingleSource<+TR;>;>;"
    const-string/jumbo v0, "mapper is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 7890
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle;

    invoke-direct {v0, p0, p1, p2}, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;Z)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final forEach(Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Consumer",
            "<-TT;>;)",
            "Lio/reactivex/disposables/Disposable;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 7913
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "onNext":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-TT;>;"
    invoke-virtual {p0, p1}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    move-result-object v0

    return-object v0
.end method

.method public final forEachWhile(Lio/reactivex/functions/Predicate;)Lio/reactivex/disposables/Disposable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Predicate",
            "<-TT;>;)",
            "Lio/reactivex/disposables/Disposable;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 7939
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "onNext":Lio/reactivex/functions/Predicate;, "Lio/reactivex/functions/Predicate<-TT;>;"
    sget-object v0, Lio/reactivex/internal/functions/Functions;->ON_ERROR_MISSING:Lio/reactivex/functions/Consumer;

    sget-object v1, Lio/reactivex/internal/functions/Functions;->EMPTY_ACTION:Lio/reactivex/functions/Action;

    invoke-virtual {p0, p1, v0, v1}, Lio/reactivex/Observable;->forEachWhile(Lio/reactivex/functions/Predicate;Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Action;)Lio/reactivex/disposables/Disposable;

    move-result-object v0

    return-object v0
.end method

.method public final forEachWhile(Lio/reactivex/functions/Predicate;Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Predicate",
            "<-TT;>;",
            "Lio/reactivex/functions/Consumer",
            "<-",
            "Ljava/lang/Throwable;",
            ">;)",
            "Lio/reactivex/disposables/Disposable;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 7964
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "onNext":Lio/reactivex/functions/Predicate;, "Lio/reactivex/functions/Predicate<-TT;>;"
    .local p2, "onError":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-Ljava/lang/Throwable;>;"
    sget-object v0, Lio/reactivex/internal/functions/Functions;->EMPTY_ACTION:Lio/reactivex/functions/Action;

    invoke-virtual {p0, p1, p2, v0}, Lio/reactivex/Observable;->forEachWhile(Lio/reactivex/functions/Predicate;Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Action;)Lio/reactivex/disposables/Disposable;

    move-result-object v0

    return-object v0
.end method

.method public final forEachWhile(Lio/reactivex/functions/Predicate;Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Action;)Lio/reactivex/disposables/Disposable;
    .locals 2
    .param p3, "onComplete"    # Lio/reactivex/functions/Action;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Predicate",
            "<-TT;>;",
            "Lio/reactivex/functions/Consumer",
            "<-",
            "Ljava/lang/Throwable;",
            ">;",
            "Lio/reactivex/functions/Action;",
            ")",
            "Lio/reactivex/disposables/Disposable;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 7993
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "onNext":Lio/reactivex/functions/Predicate;, "Lio/reactivex/functions/Predicate<-TT;>;"
    .local p2, "onError":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-Ljava/lang/Throwable;>;"
    const-string/jumbo v1, "onNext is null"

    invoke-static {p1, v1}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 7994
    const-string/jumbo v1, "onError is null"

    invoke-static {p2, v1}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 7995
    const-string/jumbo v1, "onComplete is null"

    invoke-static {p3, v1}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 7997
    new-instance v0, Lio/reactivex/internal/observers/ForEachWhileObserver;

    invoke-direct {v0, p1, p2, p3}, Lio/reactivex/internal/observers/ForEachWhileObserver;-><init>(Lio/reactivex/functions/Predicate;Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Action;)V

    .line 7998
    .local v0, "o":Lio/reactivex/internal/observers/ForEachWhileObserver;, "Lio/reactivex/internal/observers/ForEachWhileObserver<TT;>;"
    invoke-virtual {p0, v0}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/Observer;)V

    .line 7999
    return-object v0
.end method

.method public final groupBy(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-TT;+TK;>;)",
            "Lio/reactivex/Observable",
            "<",
            "Lio/reactivex/observables/GroupedObservable",
            "<TK;TT;>;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 8033
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "keySelector":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+TK;>;"
    invoke-static {}, Lio/reactivex/internal/functions/Functions;->identity()Lio/reactivex/functions/Function;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v2

    invoke-virtual {p0, p1, v0, v1, v2}, Lio/reactivex/Observable;->groupBy(Lio/reactivex/functions/Function;Lio/reactivex/functions/Function;ZI)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final groupBy(Lio/reactivex/functions/Function;Lio/reactivex/functions/Function;)Lio/reactivex/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-TT;+TK;>;",
            "Lio/reactivex/functions/Function",
            "<-TT;+TV;>;)",
            "Lio/reactivex/Observable",
            "<",
            "Lio/reactivex/observables/GroupedObservable",
            "<TK;TV;>;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 8108
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "keySelector":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+TK;>;"
    .local p2, "valueSelector":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+TV;>;"
    const/4 v0, 0x0

    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v1

    invoke-virtual {p0, p1, p2, v0, v1}, Lio/reactivex/Observable;->groupBy(Lio/reactivex/functions/Function;Lio/reactivex/functions/Function;ZI)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final groupBy(Lio/reactivex/functions/Function;Lio/reactivex/functions/Function;Z)Lio/reactivex/Observable;
    .locals 1
    .param p3, "delayError"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-TT;+TK;>;",
            "Lio/reactivex/functions/Function",
            "<-TT;+TV;>;Z)",
            "Lio/reactivex/Observable",
            "<",
            "Lio/reactivex/observables/GroupedObservable",
            "<TK;TV;>;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 8149
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "keySelector":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+TK;>;"
    .local p2, "valueSelector":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+TV;>;"
    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v0

    invoke-virtual {p0, p1, p2, p3, v0}, Lio/reactivex/Observable;->groupBy(Lio/reactivex/functions/Function;Lio/reactivex/functions/Function;ZI)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final groupBy(Lio/reactivex/functions/Function;Lio/reactivex/functions/Function;ZI)Lio/reactivex/Observable;
    .locals 6
    .param p3, "delayError"    # Z
    .param p4, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-TT;+TK;>;",
            "Lio/reactivex/functions/Function",
            "<-TT;+TV;>;ZI)",
            "Lio/reactivex/Observable",
            "<",
            "Lio/reactivex/observables/GroupedObservable",
            "<TK;TV;>;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 8193
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "keySelector":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+TK;>;"
    .local p2, "valueSelector":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+TV;>;"
    const-string/jumbo v0, "keySelector is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 8194
    const-string/jumbo v0, "valueSelector is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 8195
    const-string/jumbo v0, "bufferSize"

    invoke-static {p4, v0}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(ILjava/lang/String;)I

    .line 8197
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableGroupBy;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p4

    move v5, p3

    invoke-direct/range {v0 .. v5}, Lio/reactivex/internal/operators/observable/ObservableGroupBy;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;Lio/reactivex/functions/Function;IZ)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final groupBy(Lio/reactivex/functions/Function;Z)Lio/reactivex/Observable;
    .locals 2
    .param p2, "delayError"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-TT;+TK;>;Z)",
            "Lio/reactivex/Observable",
            "<",
            "Lio/reactivex/observables/GroupedObservable",
            "<TK;TT;>;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 8070
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "keySelector":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+TK;>;"
    invoke-static {}, Lio/reactivex/internal/functions/Functions;->identity()Lio/reactivex/functions/Function;

    move-result-object v0

    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v1

    invoke-virtual {p0, p1, v0, p2, v1}, Lio/reactivex/Observable;->groupBy(Lio/reactivex/functions/Function;Lio/reactivex/functions/Function;ZI)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final groupJoin(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;Lio/reactivex/functions/Function;Lio/reactivex/functions/BiFunction;)Lio/reactivex/Observable;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TRight:",
            "Ljava/lang/Object;",
            "T",
            "LeftEnd:Ljava/lang/Object;",
            "TRightEnd:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<+TTRight;>;",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/ObservableSource",
            "<TT",
            "LeftEnd;",
            ">;>;",
            "Lio/reactivex/functions/Function",
            "<-TTRight;+",
            "Lio/reactivex/ObservableSource",
            "<TTRightEnd;>;>;",
            "Lio/reactivex/functions/BiFunction",
            "<-TT;-",
            "Lio/reactivex/Observable",
            "<TTRight;>;+TR;>;)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 8239
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "other":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TTRight;>;"
    .local p2, "leftEnd":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lio/reactivex/ObservableSource<TTLeftEnd;>;>;"
    .local p3, "rightEnd":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TTRight;+Lio/reactivex/ObservableSource<TTRightEnd;>;>;"
    .local p4, "resultSelector":Lio/reactivex/functions/BiFunction;, "Lio/reactivex/functions/BiFunction<-TT;-Lio/reactivex/Observable<TTRight;>;+TR;>;"
    const-string/jumbo v0, "other is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 8240
    const-string/jumbo v0, "leftEnd is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 8241
    const-string/jumbo v0, "rightEnd is null"

    invoke-static {p3, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 8242
    const-string/jumbo v0, "resultSelector is null"

    invoke-static {p4, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 8243
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableGroupJoin;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lio/reactivex/internal/operators/observable/ObservableGroupJoin;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;Lio/reactivex/functions/Function;Lio/reactivex/functions/BiFunction;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final hide()Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 8263
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableHide;

    invoke-direct {v0, p0}, Lio/reactivex/internal/operators/observable/ObservableHide;-><init>(Lio/reactivex/ObservableSource;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final ignoreElements()Lio/reactivex/Completable;
    .locals 1
    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 8281
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableIgnoreElementsCompletable;

    invoke-direct {v0, p0}, Lio/reactivex/internal/operators/observable/ObservableIgnoreElementsCompletable;-><init>(Lio/reactivex/ObservableSource;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Completable;)Lio/reactivex/Completable;

    move-result-object v0

    return-object v0
.end method

.method public final isEmpty()Lio/reactivex/Single;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/Single",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 8302
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-static {}, Lio/reactivex/internal/functions/Functions;->alwaysFalse()Lio/reactivex/functions/Predicate;

    move-result-object v0

    invoke-virtual {p0, v0}, Lio/reactivex/Observable;->all(Lio/reactivex/functions/Predicate;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public final join(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;Lio/reactivex/functions/Function;Lio/reactivex/functions/BiFunction;)Lio/reactivex/Observable;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TRight:",
            "Ljava/lang/Object;",
            "T",
            "LeftEnd:Ljava/lang/Object;",
            "TRightEnd:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<+TTRight;>;",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/ObservableSource",
            "<TT",
            "LeftEnd;",
            ">;>;",
            "Lio/reactivex/functions/Function",
            "<-TTRight;+",
            "Lio/reactivex/ObservableSource",
            "<TTRightEnd;>;>;",
            "Lio/reactivex/functions/BiFunction",
            "<-TT;-TTRight;+TR;>;)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 8344
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "other":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TTRight;>;"
    .local p2, "leftEnd":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lio/reactivex/ObservableSource<TTLeftEnd;>;>;"
    .local p3, "rightEnd":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TTRight;+Lio/reactivex/ObservableSource<TTRightEnd;>;>;"
    .local p4, "resultSelector":Lio/reactivex/functions/BiFunction;, "Lio/reactivex/functions/BiFunction<-TT;-TTRight;+TR;>;"
    const-string/jumbo v0, "other is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 8345
    const-string/jumbo v0, "leftEnd is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 8346
    const-string/jumbo v0, "rightEnd is null"

    invoke-static {p3, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 8347
    const-string/jumbo v0, "resultSelector is null"

    invoke-static {p4, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 8348
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableJoin;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lio/reactivex/internal/operators/observable/ObservableJoin;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;Lio/reactivex/functions/Function;Lio/reactivex/functions/BiFunction;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final last(Ljava/lang/Object;)Lio/reactivex/Single;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Lio/reactivex/Single",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 8391
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "defaultItem":Ljava/lang/Object;, "TT;"
    const-string/jumbo v0, "defaultItem is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 8392
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableLastSingle;

    invoke-direct {v0, p0, p1}, Lio/reactivex/internal/operators/observable/ObservableLastSingle;-><init>(Lio/reactivex/ObservableSource;Ljava/lang/Object;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Single;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public final lastElement()Lio/reactivex/Maybe;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/Maybe",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 8369
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableLastMaybe;

    invoke-direct {v0, p0}, Lio/reactivex/internal/operators/observable/ObservableLastMaybe;-><init>(Lio/reactivex/ObservableSource;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Maybe;)Lio/reactivex/Maybe;

    move-result-object v0

    return-object v0
.end method

.method public final lastOrError()Lio/reactivex/Single;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/Single",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 8412
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableLastSingle;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lio/reactivex/internal/operators/observable/ObservableLastSingle;-><init>(Lio/reactivex/ObservableSource;Ljava/lang/Object;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Single;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public final lift(Lio/reactivex/ObservableOperator;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableOperator",
            "<+TR;-TT;>;)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 8444
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "lifter":Lio/reactivex/ObservableOperator;, "Lio/reactivex/ObservableOperator<+TR;-TT;>;"
    const-string/jumbo v0, "onLift is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 8445
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableLift;

    invoke-direct {v0, p0, p1}, Lio/reactivex/internal/operators/observable/ObservableLift;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableOperator;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final map(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-TT;+TR;>;)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 8468
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+TR;>;"
    const-string/jumbo v0, "mapper is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 8469
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableMap;

    invoke-direct {v0, p0, p1}, Lio/reactivex/internal/operators/observable/ObservableMap;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final materialize()Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/Observable",
            "<",
            "Lio/reactivex/Notification",
            "<TT;>;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 8489
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableMaterialize;

    invoke-direct {v0, p0}, Lio/reactivex/internal/operators/observable/ObservableMaterialize;-><init>(Lio/reactivex/ObservableSource;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final mergeWith(Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 8512
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "other":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    const-string/jumbo v0, "other is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 8513
    invoke-static {p0, p1}, Lio/reactivex/Observable;->merge(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;
    .locals 2
    .param p1, "scheduler"    # Lio/reactivex/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Scheduler;",
            ")",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "custom"
    .end annotation

    .prologue
    .line 8544
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    const/4 v0, 0x0

    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v1

    invoke-virtual {p0, p1, v0, v1}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;ZI)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final observeOn(Lio/reactivex/Scheduler;Z)Lio/reactivex/Observable;
    .locals 1
    .param p1, "scheduler"    # Lio/reactivex/Scheduler;
    .param p2, "delayError"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Scheduler;",
            "Z)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "custom"
    .end annotation

    .prologue
    .line 8576
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v0

    invoke-virtual {p0, p1, p2, v0}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;ZI)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final observeOn(Lio/reactivex/Scheduler;ZI)Lio/reactivex/Observable;
    .locals 1
    .param p1, "scheduler"    # Lio/reactivex/Scheduler;
    .param p2, "delayError"    # Z
    .param p3, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Scheduler;",
            "ZI)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "custom"
    .end annotation

    .prologue
    .line 8609
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    const-string/jumbo v0, "scheduler is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 8610
    const-string/jumbo v0, "bufferSize"

    invoke-static {p3, v0}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(ILjava/lang/String;)I

    .line 8611
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableObserveOn;

    invoke-direct {v0, p0, p1, p2, p3}, Lio/reactivex/internal/operators/observable/ObservableObserveOn;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/Scheduler;ZI)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final ofType(Ljava/lang/Class;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TU;>;)",
            "Lio/reactivex/Observable",
            "<TU;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 8632
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TU;>;"
    const-string/jumbo v0, "clazz is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 8633
    invoke-static {p1}, Lio/reactivex/internal/functions/Functions;->isInstanceOf(Ljava/lang/Class;)Lio/reactivex/functions/Predicate;

    move-result-object v0

    invoke-virtual {p0, v0}, Lio/reactivex/Observable;->filter(Lio/reactivex/functions/Predicate;)Lio/reactivex/Observable;

    move-result-object v0

    invoke-virtual {v0, p1}, Lio/reactivex/Observable;->cast(Ljava/lang/Class;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final onErrorResumeNext(Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 8704
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "next":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    const-string/jumbo v0, "next is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 8705
    invoke-static {p1}, Lio/reactivex/internal/functions/Functions;->justFunction(Ljava/lang/Object;)Lio/reactivex/functions/Function;

    move-result-object v0

    invoke-virtual {p0, v0}, Lio/reactivex/Observable;->onErrorResumeNext(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final onErrorResumeNext(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Function",
            "<-",
            "Ljava/lang/Throwable;",
            "+",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 8668
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "resumeFunction":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Ljava/lang/Throwable;+Lio/reactivex/ObservableSource<+TT;>;>;"
    const-string/jumbo v0, "resumeFunction is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 8669
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableOnErrorNext;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lio/reactivex/internal/operators/observable/ObservableOnErrorNext;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;Z)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final onErrorReturn(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Function",
            "<-",
            "Ljava/lang/Throwable;",
            "+TT;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 8737
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "valueSupplier":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Ljava/lang/Throwable;+TT;>;"
    const-string/jumbo v0, "valueSupplier is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 8738
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableOnErrorReturn;

    invoke-direct {v0, p0, p1}, Lio/reactivex/internal/operators/observable/ObservableOnErrorReturn;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final onErrorReturnItem(Ljava/lang/Object;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 8770
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "item":Ljava/lang/Object;, "TT;"
    const-string/jumbo v0, "item is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 8771
    invoke-static {p1}, Lio/reactivex/internal/functions/Functions;->justFunction(Ljava/lang/Object;)Lio/reactivex/functions/Function;

    move-result-object v0

    invoke-virtual {p0, v0}, Lio/reactivex/Observable;->onErrorReturn(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final onExceptionResumeNext(Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 8809
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "next":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    const-string/jumbo v0, "next is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 8810
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableOnErrorNext;

    invoke-static {p1}, Lio/reactivex/internal/functions/Functions;->justFunction(Ljava/lang/Object;)Lio/reactivex/functions/Function;

    move-result-object v1

    const/4 v2, 0x1

    invoke-direct {v0, p0, v1, v2}, Lio/reactivex/internal/operators/observable/ObservableOnErrorNext;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;Z)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final onTerminateDetach()Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 8827
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableDetach;

    invoke-direct {v0, p0}, Lio/reactivex/internal/operators/observable/ObservableDetach;-><init>(Lio/reactivex/ObservableSource;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final publish(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/Observable",
            "<TT;>;+",
            "Lio/reactivex/ObservableSource",
            "<TR;>;>;)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 8873
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "selector":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Lio/reactivex/Observable<TT;>;+Lio/reactivex/ObservableSource<TR;>;>;"
    const-string/jumbo v0, "selector is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 8874
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservablePublishSelector;

    invoke-direct {v0, p0, p1}, Lio/reactivex/internal/operators/observable/ObservablePublishSelector;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final publish()Lio/reactivex/observables/ConnectableObservable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/observables/ConnectableObservable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 8848
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-static {p0}, Lio/reactivex/internal/operators/observable/ObservablePublish;->create(Lio/reactivex/ObservableSource;)Lio/reactivex/observables/ConnectableObservable;

    move-result-object v0

    return-object v0
.end method

.method public final reduce(Lio/reactivex/functions/BiFunction;)Lio/reactivex/Maybe;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/BiFunction",
            "<TT;TT;TT;>;)",
            "Lio/reactivex/Maybe",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 8904
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "reducer":Lio/reactivex/functions/BiFunction;, "Lio/reactivex/functions/BiFunction<TT;TT;TT;>;"
    const-string/jumbo v0, "reducer is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 8905
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableReduceMaybe;

    invoke-direct {v0, p0, p1}, Lio/reactivex/internal/operators/observable/ObservableReduceMaybe;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/functions/BiFunction;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Maybe;)Lio/reactivex/Maybe;

    move-result-object v0

    return-object v0
.end method

.method public final reduce(Ljava/lang/Object;Lio/reactivex/functions/BiFunction;)Lio/reactivex/Single;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(TR;",
            "Lio/reactivex/functions/BiFunction",
            "<TR;-TT;TR;>;)",
            "Lio/reactivex/Single",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 8952
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "seed":Ljava/lang/Object;, "TR;"
    .local p2, "reducer":Lio/reactivex/functions/BiFunction;, "Lio/reactivex/functions/BiFunction<TR;-TT;TR;>;"
    const-string/jumbo v0, "seed is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 8953
    const-string/jumbo v0, "reducer is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 8954
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableReduceSeedSingle;

    invoke-direct {v0, p0, p1, p2}, Lio/reactivex/internal/operators/observable/ObservableReduceSeedSingle;-><init>(Lio/reactivex/ObservableSource;Ljava/lang/Object;Lio/reactivex/functions/BiFunction;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Single;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public final reduceWith(Ljava/util/concurrent/Callable;Lio/reactivex/functions/BiFunction;)Lio/reactivex/Single;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable",
            "<TR;>;",
            "Lio/reactivex/functions/BiFunction",
            "<TR;-TT;TR;>;)",
            "Lio/reactivex/Single",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 9001
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "seedSupplier":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<TR;>;"
    .local p2, "reducer":Lio/reactivex/functions/BiFunction;, "Lio/reactivex/functions/BiFunction<TR;-TT;TR;>;"
    const-string/jumbo v0, "seedSupplier is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 9002
    const-string/jumbo v0, "reducer is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 9003
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableReduceWithSingle;

    invoke-direct {v0, p0, p1, p2}, Lio/reactivex/internal/operators/observable/ObservableReduceWithSingle;-><init>(Lio/reactivex/ObservableSource;Ljava/util/concurrent/Callable;Lio/reactivex/functions/BiFunction;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Single;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public final repeat()Lio/reactivex/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 9021
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    const-wide v0, 0x7fffffffffffffffL

    invoke-virtual {p0, v0, v1}, Lio/reactivex/Observable;->repeat(J)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final repeat(J)Lio/reactivex/Observable;
    .locals 5
    .param p1, "times"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    const-wide/16 v2, 0x0

    .line 9046
    cmp-long v0, p1, v2

    if-gez v0, :cond_0

    .line 9047
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "times >= 0 required but it was "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 9049
    :cond_0
    cmp-long v0, p1, v2

    if-nez v0, :cond_1

    .line 9050
    invoke-static {}, Lio/reactivex/Observable;->empty()Lio/reactivex/Observable;

    move-result-object v0

    .line 9052
    :goto_0
    return-object v0

    :cond_1
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableRepeat;

    invoke-direct {v0, p0, p1, p2}, Lio/reactivex/internal/operators/observable/ObservableRepeat;-><init>(Lio/reactivex/Observable;J)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    goto :goto_0
.end method

.method public final repeatUntil(Lio/reactivex/functions/BooleanSupplier;)Lio/reactivex/Observable;
    .locals 1
    .param p1, "stop"    # Lio/reactivex/functions/BooleanSupplier;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/BooleanSupplier;",
            ")",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 9076
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    const-string/jumbo v0, "stop is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 9077
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableRepeatUntil;

    invoke-direct {v0, p0, p1}, Lio/reactivex/internal/operators/observable/ObservableRepeatUntil;-><init>(Lio/reactivex/Observable;Lio/reactivex/functions/BooleanSupplier;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final repeatWhen(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/Observable",
            "<",
            "Ljava/lang/Object;",
            ">;+",
            "Lio/reactivex/ObservableSource",
            "<*>;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 9102
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "handler":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Lio/reactivex/Observable<Ljava/lang/Object;>;+Lio/reactivex/ObservableSource<*>;>;"
    const-string/jumbo v0, "handler is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 9103
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableRepeatWhen;

    invoke-direct {v0, p0, p1}, Lio/reactivex/internal/operators/observable/ObservableRepeatWhen;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final replay(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/Observable",
            "<TT;>;+",
            "Lio/reactivex/ObservableSource",
            "<TR;>;>;)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 9150
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "selector":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Lio/reactivex/Observable<TT;>;+Lio/reactivex/ObservableSource<TR;>;>;"
    const-string/jumbo v0, "selector is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 9151
    invoke-static {p0}, Lio/reactivex/internal/operators/observable/ObservableInternalHelper;->replayCallable(Lio/reactivex/Observable;)Ljava/util/concurrent/Callable;

    move-result-object v0

    invoke-static {v0, p1}, Lio/reactivex/internal/operators/observable/ObservableReplay;->multicastSelector(Ljava/util/concurrent/Callable;Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final replay(Lio/reactivex/functions/Function;I)Lio/reactivex/Observable;
    .locals 1
    .param p2, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/Observable",
            "<TT;>;+",
            "Lio/reactivex/ObservableSource",
            "<TR;>;>;I)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 9180
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "selector":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Lio/reactivex/Observable<TT;>;+Lio/reactivex/ObservableSource<TR;>;>;"
    const-string/jumbo v0, "selector is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 9181
    const-string/jumbo v0, "bufferSize"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(ILjava/lang/String;)I

    .line 9182
    invoke-static {p0, p2}, Lio/reactivex/internal/operators/observable/ObservableInternalHelper;->replayCallable(Lio/reactivex/Observable;I)Ljava/util/concurrent/Callable;

    move-result-object v0

    invoke-static {v0, p1}, Lio/reactivex/internal/operators/observable/ObservableReplay;->multicastSelector(Ljava/util/concurrent/Callable;Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final replay(Lio/reactivex/functions/Function;IJLjava/util/concurrent/TimeUnit;)Lio/reactivex/Observable;
    .locals 9
    .param p2, "bufferSize"    # I
    .param p3, "time"    # J
    .param p5, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/Observable",
            "<TT;>;+",
            "Lio/reactivex/ObservableSource",
            "<TR;>;>;IJ",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "io.reactivex:computation"
    .end annotation

    .prologue
    .line 9216
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "selector":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Lio/reactivex/Observable<TT;>;+Lio/reactivex/ObservableSource<TR;>;>;"
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->computation()Lio/reactivex/Scheduler;

    move-result-object v7

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move-wide v4, p3

    move-object v6, p5

    invoke-virtual/range {v1 .. v7}, Lio/reactivex/Observable;->replay(Lio/reactivex/functions/Function;IJLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final replay(Lio/reactivex/functions/Function;IJLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;
    .locals 7
    .param p2, "bufferSize"    # I
    .param p3, "time"    # J
    .param p5, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p6, "scheduler"    # Lio/reactivex/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/Observable",
            "<TT;>;+",
            "Lio/reactivex/ObservableSource",
            "<TR;>;>;IJ",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            ")",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "custom"
    .end annotation

    .prologue
    .line 9254
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "selector":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Lio/reactivex/Observable<TT;>;+Lio/reactivex/ObservableSource<TR;>;>;"
    const-string/jumbo v0, "selector is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 9255
    const-string/jumbo v0, "bufferSize"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(ILjava/lang/String;)I

    .line 9256
    const-string/jumbo v0, "unit is null"

    invoke-static {p5, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 9257
    const-string/jumbo v0, "scheduler is null"

    invoke-static {p6, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-object v0, p0

    move v1, p2

    move-wide v2, p3

    move-object v4, p5

    move-object v5, p6

    .line 9258
    invoke-static/range {v0 .. v5}, Lio/reactivex/internal/operators/observable/ObservableInternalHelper;->replayCallable(Lio/reactivex/Observable;IJLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Ljava/util/concurrent/Callable;

    move-result-object v0

    invoke-static {v0, p1}, Lio/reactivex/internal/operators/observable/ObservableReplay;->multicastSelector(Ljava/util/concurrent/Callable;Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final replay(Lio/reactivex/functions/Function;ILio/reactivex/Scheduler;)Lio/reactivex/Observable;
    .locals 2
    .param p2, "bufferSize"    # I
    .param p3, "scheduler"    # Lio/reactivex/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/Observable",
            "<TT;>;+",
            "Lio/reactivex/ObservableSource",
            "<TR;>;>;I",
            "Lio/reactivex/Scheduler;",
            ")",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "custom"
    .end annotation

    .prologue
    .line 9290
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "selector":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Lio/reactivex/Observable<TT;>;+Lio/reactivex/ObservableSource<TR;>;>;"
    const-string/jumbo v0, "selector is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 9291
    const-string/jumbo v0, "scheduler is null"

    invoke-static {p3, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 9292
    const-string/jumbo v0, "bufferSize"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(ILjava/lang/String;)I

    .line 9293
    invoke-static {p0, p2}, Lio/reactivex/internal/operators/observable/ObservableInternalHelper;->replayCallable(Lio/reactivex/Observable;I)Ljava/util/concurrent/Callable;

    move-result-object v0

    invoke-static {p1, p3}, Lio/reactivex/internal/operators/observable/ObservableInternalHelper;->replayFunction(Lio/reactivex/functions/Function;Lio/reactivex/Scheduler;)Lio/reactivex/functions/Function;

    move-result-object v1

    invoke-static {v0, v1}, Lio/reactivex/internal/operators/observable/ObservableReplay;->multicastSelector(Ljava/util/concurrent/Callable;Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final replay(Lio/reactivex/functions/Function;JLjava/util/concurrent/TimeUnit;)Lio/reactivex/Observable;
    .locals 6
    .param p2, "time"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/Observable",
            "<TT;>;+",
            "Lio/reactivex/ObservableSource",
            "<TR;>;>;J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "io.reactivex:computation"
    .end annotation

    .prologue
    .line 9325
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "selector":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Lio/reactivex/Observable<TT;>;+Lio/reactivex/ObservableSource<TR;>;>;"
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->computation()Lio/reactivex/Scheduler;

    move-result-object v5

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    move-object v4, p4

    invoke-virtual/range {v0 .. v5}, Lio/reactivex/Observable;->replay(Lio/reactivex/functions/Function;JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final replay(Lio/reactivex/functions/Function;JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;
    .locals 2
    .param p2, "time"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p5, "scheduler"    # Lio/reactivex/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/Observable",
            "<TT;>;+",
            "Lio/reactivex/ObservableSource",
            "<TR;>;>;J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            ")",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "custom"
    .end annotation

    .prologue
    .line 9358
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "selector":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Lio/reactivex/Observable<TT;>;+Lio/reactivex/ObservableSource<TR;>;>;"
    const-string/jumbo v0, "selector is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 9359
    const-string/jumbo v0, "unit is null"

    invoke-static {p4, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 9360
    const-string/jumbo v0, "scheduler is null"

    invoke-static {p5, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 9361
    invoke-static {p0, p2, p3, p4, p5}, Lio/reactivex/internal/operators/observable/ObservableInternalHelper;->replayCallable(Lio/reactivex/Observable;JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Ljava/util/concurrent/Callable;

    move-result-object v0

    invoke-static {v0, p1}, Lio/reactivex/internal/operators/observable/ObservableReplay;->multicastSelector(Ljava/util/concurrent/Callable;Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final replay(Lio/reactivex/functions/Function;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;
    .locals 2
    .param p2, "scheduler"    # Lio/reactivex/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/Observable",
            "<TT;>;+",
            "Lio/reactivex/ObservableSource",
            "<TR;>;>;",
            "Lio/reactivex/Scheduler;",
            ")",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "custom"
    .end annotation

    .prologue
    .line 9389
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "selector":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Lio/reactivex/Observable<TT;>;+Lio/reactivex/ObservableSource<TR;>;>;"
    const-string/jumbo v0, "selector is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 9390
    const-string/jumbo v0, "scheduler is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 9391
    invoke-static {p0}, Lio/reactivex/internal/operators/observable/ObservableInternalHelper;->replayCallable(Lio/reactivex/Observable;)Ljava/util/concurrent/Callable;

    move-result-object v0

    invoke-static {p1, p2}, Lio/reactivex/internal/operators/observable/ObservableInternalHelper;->replayFunction(Lio/reactivex/functions/Function;Lio/reactivex/Scheduler;)Lio/reactivex/functions/Function;

    move-result-object v1

    invoke-static {v0, v1}, Lio/reactivex/internal/operators/observable/ObservableReplay;->multicastSelector(Ljava/util/concurrent/Callable;Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final replay()Lio/reactivex/observables/ConnectableObservable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/observables/ConnectableObservable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 9125
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-static {p0}, Lio/reactivex/internal/operators/observable/ObservableReplay;->createFrom(Lio/reactivex/ObservableSource;)Lio/reactivex/observables/ConnectableObservable;

    move-result-object v0

    return-object v0
.end method

.method public final replay(I)Lio/reactivex/observables/ConnectableObservable;
    .locals 1
    .param p1, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lio/reactivex/observables/ConnectableObservable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 9416
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    const-string/jumbo v0, "bufferSize"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(ILjava/lang/String;)I

    .line 9417
    invoke-static {p0, p1}, Lio/reactivex/internal/operators/observable/ObservableReplay;->create(Lio/reactivex/ObservableSource;I)Lio/reactivex/observables/ConnectableObservable;

    move-result-object v0

    return-object v0
.end method

.method public final replay(IJLjava/util/concurrent/TimeUnit;)Lio/reactivex/observables/ConnectableObservable;
    .locals 6
    .param p1, "bufferSize"    # I
    .param p2, "time"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IJ",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lio/reactivex/observables/ConnectableObservable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "io.reactivex:computation"
    .end annotation

    .prologue
    .line 9446
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->computation()Lio/reactivex/Scheduler;

    move-result-object v5

    move-object v0, p0

    move v1, p1

    move-wide v2, p2

    move-object v4, p4

    invoke-virtual/range {v0 .. v5}, Lio/reactivex/Observable;->replay(IJLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/observables/ConnectableObservable;

    move-result-object v0

    return-object v0
.end method

.method public final replay(IJLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/observables/ConnectableObservable;
    .locals 8
    .param p1, "bufferSize"    # I
    .param p2, "time"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p5, "scheduler"    # Lio/reactivex/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IJ",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            ")",
            "Lio/reactivex/observables/ConnectableObservable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "custom"
    .end annotation

    .prologue
    .line 9479
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    const-string/jumbo v0, "bufferSize"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(ILjava/lang/String;)I

    .line 9480
    const-string/jumbo v0, "unit is null"

    invoke-static {p4, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 9481
    const-string/jumbo v0, "scheduler is null"

    invoke-static {p5, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-object v1, p0

    move-wide v2, p2

    move-object v4, p4

    move-object v5, p5

    move v6, p1

    .line 9482
    invoke-static/range {v1 .. v6}, Lio/reactivex/internal/operators/observable/ObservableReplay;->create(Lio/reactivex/ObservableSource;JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;I)Lio/reactivex/observables/ConnectableObservable;

    move-result-object v0

    return-object v0
.end method

.method public final replay(ILio/reactivex/Scheduler;)Lio/reactivex/observables/ConnectableObservable;
    .locals 1
    .param p1, "bufferSize"    # I
    .param p2, "scheduler"    # Lio/reactivex/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lio/reactivex/Scheduler;",
            ")",
            "Lio/reactivex/observables/ConnectableObservable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "custom"
    .end annotation

    .prologue
    .line 9508
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    const-string/jumbo v0, "bufferSize"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(ILjava/lang/String;)I

    .line 9509
    invoke-virtual {p0, p1}, Lio/reactivex/Observable;->replay(I)Lio/reactivex/observables/ConnectableObservable;

    move-result-object v0

    invoke-static {v0, p2}, Lio/reactivex/internal/operators/observable/ObservableReplay;->observeOn(Lio/reactivex/observables/ConnectableObservable;Lio/reactivex/Scheduler;)Lio/reactivex/observables/ConnectableObservable;

    move-result-object v0

    return-object v0
.end method

.method public final replay(JLjava/util/concurrent/TimeUnit;)Lio/reactivex/observables/ConnectableObservable;
    .locals 1
    .param p1, "time"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lio/reactivex/observables/ConnectableObservable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "io.reactivex:computation"
    .end annotation

    .prologue
    .line 9535
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->computation()Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p0, p1, p2, p3, v0}, Lio/reactivex/Observable;->replay(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/observables/ConnectableObservable;

    move-result-object v0

    return-object v0
.end method

.method public final replay(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/observables/ConnectableObservable;
    .locals 1
    .param p1, "time"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "scheduler"    # Lio/reactivex/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            ")",
            "Lio/reactivex/observables/ConnectableObservable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "custom"
    .end annotation

    .prologue
    .line 9563
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    const-string/jumbo v0, "unit is null"

    invoke-static {p3, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 9564
    const-string/jumbo v0, "scheduler is null"

    invoke-static {p4, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 9565
    invoke-static {p0, p1, p2, p3, p4}, Lio/reactivex/internal/operators/observable/ObservableReplay;->create(Lio/reactivex/ObservableSource;JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/observables/ConnectableObservable;

    move-result-object v0

    return-object v0
.end method

.method public final replay(Lio/reactivex/Scheduler;)Lio/reactivex/observables/ConnectableObservable;
    .locals 1
    .param p1, "scheduler"    # Lio/reactivex/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Scheduler;",
            ")",
            "Lio/reactivex/observables/ConnectableObservable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "custom"
    .end annotation

    .prologue
    .line 9590
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    const-string/jumbo v0, "scheduler is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 9591
    invoke-virtual {p0}, Lio/reactivex/Observable;->replay()Lio/reactivex/observables/ConnectableObservable;

    move-result-object v0

    invoke-static {v0, p1}, Lio/reactivex/internal/operators/observable/ObservableReplay;->observeOn(Lio/reactivex/observables/ConnectableObservable;Lio/reactivex/Scheduler;)Lio/reactivex/observables/ConnectableObservable;

    move-result-object v0

    return-object v0
.end method

.method public final retry()Lio/reactivex/Observable;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 9618
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    const-wide v0, 0x7fffffffffffffffL

    invoke-static {}, Lio/reactivex/internal/functions/Functions;->alwaysTrue()Lio/reactivex/functions/Predicate;

    move-result-object v2

    invoke-virtual {p0, v0, v1, v2}, Lio/reactivex/Observable;->retry(JLio/reactivex/functions/Predicate;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final retry(J)Lio/reactivex/Observable;
    .locals 1
    .param p1, "times"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 9673
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-static {}, Lio/reactivex/internal/functions/Functions;->alwaysTrue()Lio/reactivex/functions/Predicate;

    move-result-object v0

    invoke-virtual {p0, p1, p2, v0}, Lio/reactivex/Observable;->retry(JLio/reactivex/functions/Predicate;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final retry(JLio/reactivex/functions/Predicate;)Lio/reactivex/Observable;
    .locals 3
    .param p1, "times"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Lio/reactivex/functions/Predicate",
            "<-",
            "Ljava/lang/Throwable;",
            ">;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 9691
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p3, "predicate":Lio/reactivex/functions/Predicate;, "Lio/reactivex/functions/Predicate<-Ljava/lang/Throwable;>;"
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gez v0, :cond_0

    .line 9692
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "times >= 0 required but it was "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 9694
    :cond_0
    const-string/jumbo v0, "predicate is null"

    invoke-static {p3, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 9696
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableRetryPredicate;

    invoke-direct {v0, p0, p1, p2, p3}, Lio/reactivex/internal/operators/observable/ObservableRetryPredicate;-><init>(Lio/reactivex/Observable;JLio/reactivex/functions/Predicate;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final retry(Lio/reactivex/functions/BiPredicate;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/BiPredicate",
            "<-",
            "Ljava/lang/Integer;",
            "-",
            "Ljava/lang/Throwable;",
            ">;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 9641
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "predicate":Lio/reactivex/functions/BiPredicate;, "Lio/reactivex/functions/BiPredicate<-Ljava/lang/Integer;-Ljava/lang/Throwable;>;"
    const-string/jumbo v0, "predicate is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 9643
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableRetryBiPredicate;

    invoke-direct {v0, p0, p1}, Lio/reactivex/internal/operators/observable/ObservableRetryBiPredicate;-><init>(Lio/reactivex/Observable;Lio/reactivex/functions/BiPredicate;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final retry(Lio/reactivex/functions/Predicate;)Lio/reactivex/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Predicate",
            "<-",
            "Ljava/lang/Throwable;",
            ">;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 9714
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "predicate":Lio/reactivex/functions/Predicate;, "Lio/reactivex/functions/Predicate<-Ljava/lang/Throwable;>;"
    const-wide v0, 0x7fffffffffffffffL

    invoke-virtual {p0, v0, v1, p1}, Lio/reactivex/Observable;->retry(JLio/reactivex/functions/Predicate;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final retryUntil(Lio/reactivex/functions/BooleanSupplier;)Lio/reactivex/Observable;
    .locals 3
    .param p1, "stop"    # Lio/reactivex/functions/BooleanSupplier;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/BooleanSupplier;",
            ")",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 9730
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    const-string/jumbo v0, "stop is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 9731
    const-wide v0, 0x7fffffffffffffffL

    invoke-static {p1}, Lio/reactivex/internal/functions/Functions;->predicateReverseFor(Lio/reactivex/functions/BooleanSupplier;)Lio/reactivex/functions/Predicate;

    move-result-object v2

    invoke-virtual {p0, v0, v1, v2}, Lio/reactivex/Observable;->retry(JLio/reactivex/functions/Predicate;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final retryWhen(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/Observable",
            "<",
            "Ljava/lang/Throwable;",
            ">;+",
            "Lio/reactivex/ObservableSource",
            "<*>;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 9786
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "handler":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Lio/reactivex/Observable<Ljava/lang/Throwable;>;+Lio/reactivex/ObservableSource<*>;>;"
    const-string/jumbo v0, "handler is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 9787
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableRetryWhen;

    invoke-direct {v0, p0, p1}, Lio/reactivex/internal/operators/observable/ObservableRetryWhen;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final safeSubscribe(Lio/reactivex/Observer;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TT;>;)V"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 9804
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "s":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    const-string/jumbo v0, "s is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 9805
    instance-of v0, p1, Lio/reactivex/observers/SafeObserver;

    if-eqz v0, :cond_0

    .line 9806
    invoke-virtual {p0, p1}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/Observer;)V

    .line 9810
    :goto_0
    return-void

    .line 9808
    :cond_0
    new-instance v0, Lio/reactivex/observers/SafeObserver;

    invoke-direct {v0, p1}, Lio/reactivex/observers/SafeObserver;-><init>(Lio/reactivex/Observer;)V

    invoke-virtual {p0, v0}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/Observer;)V

    goto :goto_0
.end method

.method public final sample(JLjava/util/concurrent/TimeUnit;)Lio/reactivex/Observable;
    .locals 1
    .param p1, "period"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "io.reactivex:computation"
    .end annotation

    .prologue
    .line 9834
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->computation()Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p0, p1, p2, p3, v0}, Lio/reactivex/Observable;->sample(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final sample(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;
    .locals 7
    .param p1, "period"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "scheduler"    # Lio/reactivex/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            ")",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "custom"
    .end annotation

    .prologue
    .line 9892
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    const-string/jumbo v0, "unit is null"

    invoke-static {p3, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 9893
    const-string/jumbo v0, "scheduler is null"

    invoke-static {p4, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 9894
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableSampleTimed;

    const/4 v6, 0x0

    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v6}, Lio/reactivex/internal/operators/observable/ObservableSampleTimed;-><init>(Lio/reactivex/ObservableSource;JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;Z)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final sample(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;Z)Lio/reactivex/Observable;
    .locals 7
    .param p1, "period"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "scheduler"    # Lio/reactivex/Scheduler;
    .param p5, "emitLast"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            "Z)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation build Lio/reactivex/annotations/Experimental;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "custom"
    .end annotation

    .prologue
    .line 9928
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    const-string/jumbo v0, "unit is null"

    invoke-static {p3, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 9929
    const-string/jumbo v0, "scheduler is null"

    invoke-static {p4, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 9930
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableSampleTimed;

    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    move-object v5, p4

    move v6, p5

    invoke-direct/range {v0 .. v6}, Lio/reactivex/internal/operators/observable/ObservableSampleTimed;-><init>(Lio/reactivex/ObservableSource;JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;Z)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final sample(JLjava/util/concurrent/TimeUnit;Z)Lio/reactivex/Observable;
    .locals 7
    .param p1, "period"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "emitLast"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Z)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation build Lio/reactivex/annotations/Experimental;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "io.reactivex:computation"
    .end annotation

    .prologue
    .line 9865
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->computation()Lio/reactivex/Scheduler;

    move-result-object v5

    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    move v6, p4

    invoke-virtual/range {v1 .. v6}, Lio/reactivex/Observable;->sample(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;Z)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final sample(Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<TU;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 9954
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "sampler":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TU;>;"
    const-string/jumbo v0, "sampler is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 9955
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableSampleWithObservable;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lio/reactivex/internal/operators/observable/ObservableSampleWithObservable;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Z)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final sample(Lio/reactivex/ObservableSource;Z)Lio/reactivex/Observable;
    .locals 1
    .param p2, "emitLast"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<TU;>;Z)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation build Lio/reactivex/annotations/Experimental;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 9986
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "sampler":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TU;>;"
    const-string/jumbo v0, "sampler is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 9987
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableSampleWithObservable;

    invoke-direct {v0, p0, p1, p2}, Lio/reactivex/internal/operators/observable/ObservableSampleWithObservable;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Z)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final scan(Lio/reactivex/functions/BiFunction;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/BiFunction",
            "<TT;TT;TT;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 10014
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "accumulator":Lio/reactivex/functions/BiFunction;, "Lio/reactivex/functions/BiFunction<TT;TT;TT;>;"
    const-string/jumbo v0, "accumulator is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 10015
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableScan;

    invoke-direct {v0, p0, p1}, Lio/reactivex/internal/operators/observable/ObservableScan;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/functions/BiFunction;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final scan(Ljava/lang/Object;Lio/reactivex/functions/BiFunction;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(TR;",
            "Lio/reactivex/functions/BiFunction",
            "<TR;-TT;TR;>;)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 10063
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "initialValue":Ljava/lang/Object;, "TR;"
    .local p2, "accumulator":Lio/reactivex/functions/BiFunction;, "Lio/reactivex/functions/BiFunction<TR;-TT;TR;>;"
    const-string/jumbo v0, "seed is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 10064
    invoke-static {p1}, Lio/reactivex/internal/functions/Functions;->justCallable(Ljava/lang/Object;)Ljava/util/concurrent/Callable;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Lio/reactivex/Observable;->scanWith(Ljava/util/concurrent/Callable;Lio/reactivex/functions/BiFunction;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final scanWith(Ljava/util/concurrent/Callable;Lio/reactivex/functions/BiFunction;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable",
            "<TR;>;",
            "Lio/reactivex/functions/BiFunction",
            "<TR;-TT;TR;>;)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 10112
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "seedSupplier":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<TR;>;"
    .local p2, "accumulator":Lio/reactivex/functions/BiFunction;, "Lio/reactivex/functions/BiFunction<TR;-TT;TR;>;"
    const-string/jumbo v0, "seedSupplier is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 10113
    const-string/jumbo v0, "accumulator is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 10114
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableScanSeed;

    invoke-direct {v0, p0, p1, p2}, Lio/reactivex/internal/operators/observable/ObservableScanSeed;-><init>(Lio/reactivex/ObservableSource;Ljava/util/concurrent/Callable;Lio/reactivex/functions/BiFunction;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final serialize()Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 10140
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableSerialized;

    invoke-direct {v0, p0}, Lio/reactivex/internal/operators/observable/ObservableSerialized;-><init>(Lio/reactivex/Observable;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final share()Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 10163
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/Observable;->publish()Lio/reactivex/observables/ConnectableObservable;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/observables/ConnectableObservable;->refCount()Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final single(Ljava/lang/Object;)Lio/reactivex/Single;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Lio/reactivex/Single",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 10205
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "defaultItem":Ljava/lang/Object;, "TT;"
    const-string/jumbo v0, "defaultItem is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 10206
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableSingleSingle;

    invoke-direct {v0, p0, p1}, Lio/reactivex/internal/operators/observable/ObservableSingleSingle;-><init>(Lio/reactivex/ObservableSource;Ljava/lang/Object;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Single;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public final singleElement()Lio/reactivex/Maybe;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/Maybe",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 10183
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableSingleMaybe;

    invoke-direct {v0, p0}, Lio/reactivex/internal/operators/observable/ObservableSingleMaybe;-><init>(Lio/reactivex/ObservableSource;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Maybe;)Lio/reactivex/Maybe;

    move-result-object v0

    return-object v0
.end method

.method public final singleOrError()Lio/reactivex/Single;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/Single",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 10227
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableSingleSingle;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lio/reactivex/internal/operators/observable/ObservableSingleSingle;-><init>(Lio/reactivex/ObservableSource;Ljava/lang/Object;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Single;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public final skip(J)Lio/reactivex/Observable;
    .locals 3
    .param p1, "count"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 10249
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gtz v0, :cond_0

    .line 10250
    invoke-static {p0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    .line 10252
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableSkip;

    invoke-direct {v0, p0, p1, p2}, Lio/reactivex/internal/operators/observable/ObservableSkip;-><init>(Lio/reactivex/ObservableSource;J)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    goto :goto_0
.end method

.method public final skip(JLjava/util/concurrent/TimeUnit;)Lio/reactivex/Observable;
    .locals 1
    .param p1, "time"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "io.reactivex:computation"
    .end annotation

    .prologue
    .line 10277
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-static {p1, p2, p3}, Lio/reactivex/Observable;->timer(JLjava/util/concurrent/TimeUnit;)Lio/reactivex/Observable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lio/reactivex/Observable;->skipUntil(Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final skip(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;
    .locals 1
    .param p1, "time"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "scheduler"    # Lio/reactivex/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            ")",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "custom"
    .end annotation

    .prologue
    .line 10303
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-static {p1, p2, p3, p4}, Lio/reactivex/Observable;->timer(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lio/reactivex/Observable;->skipUntil(Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final skipLast(I)Lio/reactivex/Observable;
    .locals 3
    .param p1, "count"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 10331
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    if-gez p1, :cond_0

    .line 10332
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "count >= 0 required but it was "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 10334
    :cond_0
    if-nez p1, :cond_1

    .line 10335
    invoke-static {p0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    .line 10337
    :goto_0
    return-object v0

    :cond_1
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableSkipLast;

    invoke-direct {v0, p0, p1}, Lio/reactivex/internal/operators/observable/ObservableSkipLast;-><init>(Lio/reactivex/ObservableSource;I)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    goto :goto_0
.end method

.method public final skipLast(JLjava/util/concurrent/TimeUnit;)Lio/reactivex/Observable;
    .locals 9
    .param p1, "time"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "io.reactivex:trampoline"
    .end annotation

    .prologue
    .line 10364
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->trampoline()Lio/reactivex/Scheduler;

    move-result-object v5

    const/4 v6, 0x0

    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v7

    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    invoke-virtual/range {v1 .. v7}, Lio/reactivex/Observable;->skipLast(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;ZI)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final skipLast(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;
    .locals 9
    .param p1, "time"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "scheduler"    # Lio/reactivex/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            ")",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "custom"
    .end annotation

    .prologue
    .line 10422
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    const/4 v6, 0x0

    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v7

    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    move-object v5, p4

    invoke-virtual/range {v1 .. v7}, Lio/reactivex/Observable;->skipLast(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;ZI)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final skipLast(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;Z)Lio/reactivex/Observable;
    .locals 9
    .param p1, "time"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "scheduler"    # Lio/reactivex/Scheduler;
    .param p5, "delayError"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            "Z)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "custom"
    .end annotation

    .prologue
    .line 10453
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v7

    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    move-object v5, p4

    move v6, p5

    invoke-virtual/range {v1 .. v7}, Lio/reactivex/Observable;->skipLast(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;ZI)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final skipLast(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;ZI)Lio/reactivex/Observable;
    .locals 9
    .param p1, "time"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "scheduler"    # Lio/reactivex/Scheduler;
    .param p5, "delayError"    # Z
    .param p6, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            "ZI)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "custom"
    .end annotation

    .prologue
    .line 10486
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    const-string/jumbo v0, "unit is null"

    invoke-static {p3, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 10487
    const-string/jumbo v0, "scheduler is null"

    invoke-static {p4, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 10488
    const-string/jumbo v0, "bufferSize"

    invoke-static {p6, v0}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(ILjava/lang/String;)I

    .line 10490
    shl-int/lit8 v6, p6, 0x1

    .line 10491
    .local v6, "s":I
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableSkipLastTimed;

    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    move-object v5, p4

    move v7, p5

    invoke-direct/range {v0 .. v7}, Lio/reactivex/internal/operators/observable/ObservableSkipLastTimed;-><init>(Lio/reactivex/ObservableSource;JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;IZ)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final skipLast(JLjava/util/concurrent/TimeUnit;Z)Lio/reactivex/Observable;
    .locals 9
    .param p1, "time"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "delayError"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Z)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "io.reactivex:trampoline"
    .end annotation

    .prologue
    .line 10394
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->trampoline()Lio/reactivex/Scheduler;

    move-result-object v5

    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v7

    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    move v6, p4

    invoke-virtual/range {v1 .. v7}, Lio/reactivex/Observable;->skipLast(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;ZI)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final skipUntil(Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<TU;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 10515
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "other":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TU;>;"
    const-string/jumbo v0, "other is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 10516
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableSkipUntil;

    invoke-direct {v0, p0, p1}, Lio/reactivex/internal/operators/observable/ObservableSkipUntil;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final skipWhile(Lio/reactivex/functions/Predicate;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Predicate",
            "<-TT;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 10538
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "predicate":Lio/reactivex/functions/Predicate;, "Lio/reactivex/functions/Predicate<-TT;>;"
    const-string/jumbo v0, "predicate is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 10539
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableSkipWhile;

    invoke-direct {v0, p0, p1}, Lio/reactivex/internal/operators/observable/ObservableSkipWhile;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Predicate;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final sorted()Lio/reactivex/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 10563
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/Observable;->toList()Lio/reactivex/Single;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Single;->toObservable()Lio/reactivex/Observable;

    move-result-object v0

    invoke-static {}, Lio/reactivex/internal/functions/Functions;->naturalComparator()Ljava/util/Comparator;

    move-result-object v1

    invoke-static {v1}, Lio/reactivex/internal/functions/Functions;->listSorter(Ljava/util/Comparator;)Lio/reactivex/functions/Function;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object v0

    invoke-static {}, Lio/reactivex/internal/functions/Functions;->identity()Lio/reactivex/functions/Function;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->flatMapIterable(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final sorted(Ljava/util/Comparator;)Lio/reactivex/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Comparator",
            "<-TT;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 10586
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "sortFunction":Ljava/util/Comparator;, "Ljava/util/Comparator<-TT;>;"
    const-string/jumbo v0, "sortFunction is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 10587
    invoke-virtual {p0}, Lio/reactivex/Observable;->toList()Lio/reactivex/Single;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Single;->toObservable()Lio/reactivex/Observable;

    move-result-object v0

    invoke-static {p1}, Lio/reactivex/internal/functions/Functions;->listSorter(Ljava/util/Comparator;)Lio/reactivex/functions/Function;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object v0

    invoke-static {}, Lio/reactivex/internal/functions/Functions;->identity()Lio/reactivex/functions/Function;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->flatMapIterable(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final startWith(Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 10633
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "other":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    const-string/jumbo v0, "other is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 10634
    const/4 v0, 0x2

    new-array v0, v0, [Lio/reactivex/ObservableSource;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const/4 v1, 0x1

    aput-object p0, v0, v1

    invoke-static {v0}, Lio/reactivex/Observable;->concatArray([Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final startWith(Ljava/lang/Iterable;)Lio/reactivex/Observable;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<+TT;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 10610
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "items":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+TT;>;"
    const/4 v0, 0x2

    new-array v0, v0, [Lio/reactivex/ObservableSource;

    const/4 v1, 0x0

    invoke-static {p1}, Lio/reactivex/Observable;->fromIterable(Ljava/lang/Iterable;)Lio/reactivex/Observable;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x1

    aput-object p0, v0, v1

    invoke-static {v0}, Lio/reactivex/Observable;->concatArray([Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final startWith(Ljava/lang/Object;)Lio/reactivex/Observable;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 10657
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "item":Ljava/lang/Object;, "TT;"
    const-string/jumbo v0, "item is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 10658
    const/4 v0, 0x2

    new-array v0, v0, [Lio/reactivex/ObservableSource;

    const/4 v1, 0x0

    invoke-static {p1}, Lio/reactivex/Observable;->just(Ljava/lang/Object;)Lio/reactivex/Observable;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x1

    aput-object p0, v0, v1

    invoke-static {v0}, Lio/reactivex/Observable;->concatArray([Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final varargs startWithArray([Ljava/lang/Object;)Lio/reactivex/Observable;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TT;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 10681
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "items":[Ljava/lang/Object;, "[TT;"
    invoke-static {p1}, Lio/reactivex/Observable;->fromArray([Ljava/lang/Object;)Lio/reactivex/Observable;

    move-result-object v0

    .line 10682
    .local v0, "fromArray":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-static {}, Lio/reactivex/Observable;->empty()Lio/reactivex/Observable;

    move-result-object v1

    if-ne v0, v1, :cond_0

    .line 10683
    invoke-static {p0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v1

    .line 10685
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x2

    new-array v1, v1, [Lio/reactivex/ObservableSource;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    const/4 v2, 0x1

    aput-object p0, v1, v2

    invoke-static {v1}, Lio/reactivex/Observable;->concatArray([Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;

    move-result-object v1

    goto :goto_0
.end method

.method public final subscribe()Lio/reactivex/disposables/Disposable;
    .locals 4
    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 10705
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-static {}, Lio/reactivex/internal/functions/Functions;->emptyConsumer()Lio/reactivex/functions/Consumer;

    move-result-object v0

    sget-object v1, Lio/reactivex/internal/functions/Functions;->ON_ERROR_MISSING:Lio/reactivex/functions/Consumer;

    sget-object v2, Lio/reactivex/internal/functions/Functions;->EMPTY_ACTION:Lio/reactivex/functions/Action;

    invoke-static {}, Lio/reactivex/internal/functions/Functions;->emptyConsumer()Lio/reactivex/functions/Consumer;

    move-result-object v3

    invoke-virtual {p0, v0, v1, v2, v3}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Action;Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    move-result-object v0

    return-object v0
.end method

.method public final subscribe(Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Consumer",
            "<-TT;>;)",
            "Lio/reactivex/disposables/Disposable;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 10730
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "onNext":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-TT;>;"
    sget-object v0, Lio/reactivex/internal/functions/Functions;->ON_ERROR_MISSING:Lio/reactivex/functions/Consumer;

    sget-object v1, Lio/reactivex/internal/functions/Functions;->EMPTY_ACTION:Lio/reactivex/functions/Action;

    invoke-static {}, Lio/reactivex/internal/functions/Functions;->emptyConsumer()Lio/reactivex/functions/Consumer;

    move-result-object v2

    invoke-virtual {p0, p1, v0, v1, v2}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Action;Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    move-result-object v0

    return-object v0
.end method

.method public final subscribe(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Consumer",
            "<-TT;>;",
            "Lio/reactivex/functions/Consumer",
            "<-",
            "Ljava/lang/Throwable;",
            ">;)",
            "Lio/reactivex/disposables/Disposable;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 10756
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "onNext":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-TT;>;"
    .local p2, "onError":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-Ljava/lang/Throwable;>;"
    sget-object v0, Lio/reactivex/internal/functions/Functions;->EMPTY_ACTION:Lio/reactivex/functions/Action;

    invoke-static {}, Lio/reactivex/internal/functions/Functions;->emptyConsumer()Lio/reactivex/functions/Consumer;

    move-result-object v1

    invoke-virtual {p0, p1, p2, v0, v1}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Action;Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    move-result-object v0

    return-object v0
.end method

.method public final subscribe(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Action;)Lio/reactivex/disposables/Disposable;
    .locals 1
    .param p3, "onComplete"    # Lio/reactivex/functions/Action;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Consumer",
            "<-TT;>;",
            "Lio/reactivex/functions/Consumer",
            "<-",
            "Ljava/lang/Throwable;",
            ">;",
            "Lio/reactivex/functions/Action;",
            ")",
            "Lio/reactivex/disposables/Disposable;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 10787
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "onNext":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-TT;>;"
    .local p2, "onError":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-Ljava/lang/Throwable;>;"
    invoke-static {}, Lio/reactivex/internal/functions/Functions;->emptyConsumer()Lio/reactivex/functions/Consumer;

    move-result-object v0

    invoke-virtual {p0, p1, p2, p3, v0}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Action;Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    move-result-object v0

    return-object v0
.end method

.method public final subscribe(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Action;Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;
    .locals 2
    .param p3, "onComplete"    # Lio/reactivex/functions/Action;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Consumer",
            "<-TT;>;",
            "Lio/reactivex/functions/Consumer",
            "<-",
            "Ljava/lang/Throwable;",
            ">;",
            "Lio/reactivex/functions/Action;",
            "Lio/reactivex/functions/Consumer",
            "<-",
            "Lio/reactivex/disposables/Disposable;",
            ">;)",
            "Lio/reactivex/disposables/Disposable;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 10820
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "onNext":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-TT;>;"
    .local p2, "onError":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-Ljava/lang/Throwable;>;"
    .local p4, "onSubscribe":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-Lio/reactivex/disposables/Disposable;>;"
    const-string/jumbo v1, "onNext is null"

    invoke-static {p1, v1}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 10821
    const-string/jumbo v1, "onError is null"

    invoke-static {p2, v1}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 10822
    const-string/jumbo v1, "onComplete is null"

    invoke-static {p3, v1}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 10823
    const-string/jumbo v1, "onSubscribe is null"

    invoke-static {p4, v1}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 10825
    new-instance v0, Lio/reactivex/internal/observers/LambdaObserver;

    invoke-direct {v0, p1, p2, p3, p4}, Lio/reactivex/internal/observers/LambdaObserver;-><init>(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Action;Lio/reactivex/functions/Consumer;)V

    .line 10827
    .local v0, "ls":Lio/reactivex/internal/observers/LambdaObserver;, "Lio/reactivex/internal/observers/LambdaObserver<TT;>;"
    invoke-virtual {p0, v0}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/Observer;)V

    .line 10829
    return-object v0
.end method

.method public final subscribe(Lio/reactivex/Observer;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TT;>;)V"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 10835
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "observer":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    const-string/jumbo v2, "observer is null"

    invoke-static {p1, v2}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 10837
    :try_start_0
    invoke-static {p0, p1}, Lio/reactivex/plugins/RxJavaPlugins;->onSubscribe(Lio/reactivex/Observable;Lio/reactivex/Observer;)Lio/reactivex/Observer;

    move-result-object p1

    .line 10839
    const-string/jumbo v2, "Plugin returned null Observer"

    invoke-static {p1, v2}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 10841
    invoke-virtual {p0, p1}, Lio/reactivex/Observable;->subscribeActual(Lio/reactivex/Observer;)V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1

    .line 10854
    return-void

    .line 10842
    :catch_0
    move-exception v0

    .line 10843
    .local v0, "e":Ljava/lang/NullPointerException;
    throw v0

    .line 10844
    .end local v0    # "e":Ljava/lang/NullPointerException;
    :catch_1
    move-exception v0

    .line 10845
    .local v0, "e":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 10848
    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 10850
    new-instance v1, Ljava/lang/NullPointerException;

    const-string/jumbo v2, "Actually not, but can\'t throw other exceptions due to RS"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 10851
    .local v1, "npe":Ljava/lang/NullPointerException;
    invoke-virtual {v1, v0}, Ljava/lang/NullPointerException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 10852
    throw v1
.end method

.method protected abstract subscribeActual(Lio/reactivex/Observer;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TT;>;)V"
        }
    .end annotation
.end method

.method public final subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;
    .locals 1
    .param p1, "scheduler"    # Lio/reactivex/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Scheduler;",
            ")",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "custom"
    .end annotation

    .prologue
    .line 10916
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    const-string/jumbo v0, "scheduler is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 10917
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableSubscribeOn;

    invoke-direct {v0, p0, p1}, Lio/reactivex/internal/operators/observable/ObservableSubscribeOn;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/Scheduler;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final subscribeWith(Lio/reactivex/Observer;)Lio/reactivex/Observer;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E::",
            "Lio/reactivex/Observer",
            "<-TT;>;>(TE;)TE;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 10892
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "observer":Lio/reactivex/Observer;, "TE;"
    invoke-virtual {p0, p1}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/Observer;)V

    .line 10893
    return-object p1
.end method

.method public final switchIfEmpty(Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 10939
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "other":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    const-string/jumbo v0, "other is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 10940
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableSwitchIfEmpty;

    invoke-direct {v0, p0, p1}, Lio/reactivex/internal/operators/observable/ObservableSwitchIfEmpty;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final switchMap(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/ObservableSource",
            "<+TR;>;>;)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 10967
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lio/reactivex/ObservableSource<+TR;>;>;"
    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lio/reactivex/Observable;->switchMap(Lio/reactivex/functions/Function;I)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final switchMap(Lio/reactivex/functions/Function;I)Lio/reactivex/Observable;
    .locals 3
    .param p2, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/ObservableSource",
            "<+TR;>;>;I)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 10996
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lio/reactivex/ObservableSource<+TR;>;>;"
    const-string/jumbo v1, "mapper is null"

    invoke-static {p1, v1}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 10997
    const-string/jumbo v1, "bufferSize"

    invoke-static {p2, v1}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(ILjava/lang/String;)I

    .line 10998
    instance-of v1, p0, Lio/reactivex/internal/fuseable/ScalarCallable;

    if-eqz v1, :cond_1

    .line 11000
    check-cast p0, Lio/reactivex/internal/fuseable/ScalarCallable;

    .end local p0    # "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-interface {p0}, Lio/reactivex/internal/fuseable/ScalarCallable;->call()Ljava/lang/Object;

    move-result-object v0

    .line 11001
    .local v0, "v":Ljava/lang/Object;, "TT;"
    if-nez v0, :cond_0

    .line 11002
    invoke-static {}, Lio/reactivex/Observable;->empty()Lio/reactivex/Observable;

    move-result-object v1

    .line 11006
    .end local v0    # "v":Ljava/lang/Object;, "TT;"
    :goto_0
    return-object v1

    .line 11004
    .restart local v0    # "v":Ljava/lang/Object;, "TT;"
    :cond_0
    invoke-static {v0, p1}, Lio/reactivex/internal/operators/observable/ObservableScalarXMap;->scalarXMap(Ljava/lang/Object;Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object v1

    goto :goto_0

    .line 11006
    .end local v0    # "v":Ljava/lang/Object;, "TT;"
    .restart local p0    # "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    :cond_1
    new-instance v1, Lio/reactivex/internal/operators/observable/ObservableSwitchMap;

    const/4 v2, 0x0

    invoke-direct {v1, p0, p1, p2, v2}, Lio/reactivex/internal/operators/observable/ObservableSwitchMap;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;IZ)V

    invoke-static {v1}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v1

    goto :goto_0
.end method

.method public final switchMapDelayError(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/ObservableSource",
            "<+TR;>;>;)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 11096
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lio/reactivex/ObservableSource<+TR;>;>;"
    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lio/reactivex/Observable;->switchMapDelayError(Lio/reactivex/functions/Function;I)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final switchMapDelayError(Lio/reactivex/functions/Function;I)Lio/reactivex/Observable;
    .locals 3
    .param p2, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/ObservableSource",
            "<+TR;>;>;I)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 11127
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lio/reactivex/ObservableSource<+TR;>;>;"
    const-string/jumbo v1, "mapper is null"

    invoke-static {p1, v1}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 11128
    const-string/jumbo v1, "bufferSize"

    invoke-static {p2, v1}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(ILjava/lang/String;)I

    .line 11129
    instance-of v1, p0, Lio/reactivex/internal/fuseable/ScalarCallable;

    if-eqz v1, :cond_1

    .line 11131
    check-cast p0, Lio/reactivex/internal/fuseable/ScalarCallable;

    .end local p0    # "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-interface {p0}, Lio/reactivex/internal/fuseable/ScalarCallable;->call()Ljava/lang/Object;

    move-result-object v0

    .line 11132
    .local v0, "v":Ljava/lang/Object;, "TT;"
    if-nez v0, :cond_0

    .line 11133
    invoke-static {}, Lio/reactivex/Observable;->empty()Lio/reactivex/Observable;

    move-result-object v1

    .line 11137
    .end local v0    # "v":Ljava/lang/Object;, "TT;"
    :goto_0
    return-object v1

    .line 11135
    .restart local v0    # "v":Ljava/lang/Object;, "TT;"
    :cond_0
    invoke-static {v0, p1}, Lio/reactivex/internal/operators/observable/ObservableScalarXMap;->scalarXMap(Ljava/lang/Object;Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object v1

    goto :goto_0

    .line 11137
    .end local v0    # "v":Ljava/lang/Object;, "TT;"
    .restart local p0    # "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    :cond_1
    new-instance v1, Lio/reactivex/internal/operators/observable/ObservableSwitchMap;

    const/4 v2, 0x1

    invoke-direct {v1, p0, p1, p2, v2}, Lio/reactivex/internal/operators/observable/ObservableSwitchMap;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;IZ)V

    invoke-static {v1}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v1

    goto :goto_0
.end method

.method public final switchMapSingle(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;
    .locals 1
    .param p1    # Lio/reactivex/functions/Function;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/SingleSource",
            "<+TR;>;>;)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation build Lio/reactivex/annotations/Experimental;
    .end annotation

    .annotation build Lio/reactivex/annotations/NonNull;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 11036
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lio/reactivex/SingleSource<+TR;>;>;"
    invoke-static {p0, p1}, Lio/reactivex/internal/operators/observable/ObservableInternalHelper;->switchMapSingle(Lio/reactivex/Observable;Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final switchMapSingleDelayError(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;
    .locals 1
    .param p1    # Lio/reactivex/functions/Function;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/SingleSource",
            "<+TR;>;>;)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation build Lio/reactivex/annotations/Experimental;
    .end annotation

    .annotation build Lio/reactivex/annotations/NonNull;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 11067
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lio/reactivex/SingleSource<+TR;>;>;"
    invoke-static {p0, p1}, Lio/reactivex/internal/operators/observable/ObservableInternalHelper;->switchMapSingleDelayError(Lio/reactivex/Observable;Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final take(J)Lio/reactivex/Observable;
    .locals 3
    .param p1, "count"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 11163
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gez v0, :cond_0

    .line 11164
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "count >= 0 required but it was "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 11166
    :cond_0
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableTake;

    invoke-direct {v0, p0, p1, p2}, Lio/reactivex/internal/operators/observable/ObservableTake;-><init>(Lio/reactivex/ObservableSource;J)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final take(JLjava/util/concurrent/TimeUnit;)Lio/reactivex/Observable;
    .locals 1
    .param p1, "time"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 11189
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-static {p1, p2, p3}, Lio/reactivex/Observable;->timer(JLjava/util/concurrent/TimeUnit;)Lio/reactivex/Observable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lio/reactivex/Observable;->takeUntil(Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final take(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;
    .locals 1
    .param p1, "time"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "scheduler"    # Lio/reactivex/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            ")",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "custom"
    .end annotation

    .prologue
    .line 11215
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-static {p1, p2, p3, p4}, Lio/reactivex/Observable;->timer(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lio/reactivex/Observable;->takeUntil(Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final takeLast(I)Lio/reactivex/Observable;
    .locals 3
    .param p1, "count"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 11239
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    if-gez p1, :cond_0

    .line 11240
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "count >= 0 required but it was "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 11242
    :cond_0
    if-nez p1, :cond_1

    .line 11243
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableIgnoreElements;

    invoke-direct {v0, p0}, Lio/reactivex/internal/operators/observable/ObservableIgnoreElements;-><init>(Lio/reactivex/ObservableSource;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    .line 11248
    :goto_0
    return-object v0

    .line 11245
    :cond_1
    const/4 v0, 0x1

    if-ne p1, v0, :cond_2

    .line 11246
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableTakeLastOne;

    invoke-direct {v0, p0}, Lio/reactivex/internal/operators/observable/ObservableTakeLastOne;-><init>(Lio/reactivex/ObservableSource;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    goto :goto_0

    .line 11248
    :cond_2
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableTakeLast;

    invoke-direct {v0, p0, p1}, Lio/reactivex/internal/operators/observable/ObservableTakeLast;-><init>(Lio/reactivex/ObservableSource;I)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    goto :goto_0
.end method

.method public final takeLast(JJLjava/util/concurrent/TimeUnit;)Lio/reactivex/Observable;
    .locals 11
    .param p1, "count"    # J
    .param p3, "time"    # J
    .param p5, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJ",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "io.reactivex:trampoline"
    .end annotation

    .prologue
    .line 11275
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->trampoline()Lio/reactivex/Scheduler;

    move-result-object v7

    const/4 v8, 0x0

    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v9

    move-object v1, p0

    move-wide v2, p1

    move-wide v4, p3

    move-object/from16 v6, p5

    invoke-virtual/range {v1 .. v9}, Lio/reactivex/Observable;->takeLast(JJLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;ZI)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final takeLast(JJLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;
    .locals 11
    .param p1, "count"    # J
    .param p3, "time"    # J
    .param p5, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p6, "scheduler"    # Lio/reactivex/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJ",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            ")",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "custom"
    .end annotation

    .prologue
    .line 11307
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    const/4 v8, 0x0

    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v9

    move-object v1, p0

    move-wide v2, p1

    move-wide v4, p3

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    invoke-virtual/range {v1 .. v9}, Lio/reactivex/Observable;->takeLast(JJLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;ZI)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final takeLast(JJLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;ZI)Lio/reactivex/Observable;
    .locals 13
    .param p1, "count"    # J
    .param p3, "time"    # J
    .param p5, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p6, "scheduler"    # Lio/reactivex/Scheduler;
    .param p7, "delayError"    # Z
    .param p8, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJ",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            "ZI)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "custom"
    .end annotation

    .prologue
    .line 11344
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    const-string/jumbo v2, "unit is null"

    move-object/from16 v0, p5

    invoke-static {v0, v2}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 11345
    const-string/jumbo v2, "scheduler is null"

    move-object/from16 v0, p6

    invoke-static {v0, v2}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 11346
    const-string/jumbo v2, "bufferSize"

    move/from16 v0, p8

    invoke-static {v0, v2}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(ILjava/lang/String;)I

    .line 11347
    const-wide/16 v2, 0x0

    cmp-long v2, p1, v2

    if-gez v2, :cond_0

    .line 11348
    new-instance v2, Ljava/lang/IndexOutOfBoundsException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "count >= 0 required but it was "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 11350
    :cond_0
    new-instance v2, Lio/reactivex/internal/operators/observable/ObservableTakeLastTimed;

    move-object v3, p0

    move-wide v4, p1

    move-wide/from16 v6, p3

    move-object/from16 v8, p5

    move-object/from16 v9, p6

    move/from16 v10, p8

    move/from16 v11, p7

    invoke-direct/range {v2 .. v11}, Lio/reactivex/internal/operators/observable/ObservableTakeLastTimed;-><init>(Lio/reactivex/ObservableSource;JJLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;IZ)V

    invoke-static {v2}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v2

    return-object v2
.end method

.method public final takeLast(JLjava/util/concurrent/TimeUnit;)Lio/reactivex/Observable;
    .locals 9
    .param p1, "time"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "io.reactivex:trampoline"
    .end annotation

    .prologue
    .line 11374
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->trampoline()Lio/reactivex/Scheduler;

    move-result-object v5

    const/4 v6, 0x0

    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v7

    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    invoke-virtual/range {v1 .. v7}, Lio/reactivex/Observable;->takeLast(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;ZI)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final takeLast(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;
    .locals 9
    .param p1, "time"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "scheduler"    # Lio/reactivex/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            ")",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "custom"
    .end annotation

    .prologue
    .line 11429
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    const/4 v6, 0x0

    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v7

    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    move-object v5, p4

    invoke-virtual/range {v1 .. v7}, Lio/reactivex/Observable;->takeLast(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;ZI)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final takeLast(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;Z)Lio/reactivex/Observable;
    .locals 9
    .param p1, "time"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "scheduler"    # Lio/reactivex/Scheduler;
    .param p5, "delayError"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            "Z)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "custom"
    .end annotation

    .prologue
    .line 11460
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v7

    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    move-object v5, p4

    move v6, p5

    invoke-virtual/range {v1 .. v7}, Lio/reactivex/Observable;->takeLast(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;ZI)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final takeLast(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;ZI)Lio/reactivex/Observable;
    .locals 11
    .param p1, "time"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "scheduler"    # Lio/reactivex/Scheduler;
    .param p5, "delayError"    # Z
    .param p6, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            "ZI)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "custom"
    .end annotation

    .prologue
    .line 11493
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    const-wide v2, 0x7fffffffffffffffL

    move-object v1, p0

    move-wide v4, p1

    move-object v6, p3

    move-object v7, p4

    move/from16 v8, p5

    move/from16 v9, p6

    invoke-virtual/range {v1 .. v9}, Lio/reactivex/Observable;->takeLast(JJLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;ZI)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final takeLast(JLjava/util/concurrent/TimeUnit;Z)Lio/reactivex/Observable;
    .locals 9
    .param p1, "time"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "delayError"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Z)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "io.reactivex:trampoline"
    .end annotation

    .prologue
    .line 11401
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->trampoline()Lio/reactivex/Scheduler;

    move-result-object v5

    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v7

    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    move v6, p4

    invoke-virtual/range {v1 .. v7}, Lio/reactivex/Observable;->takeLast(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;ZI)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final takeUntil(Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<TU;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 11517
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "other":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TU;>;"
    const-string/jumbo v0, "other is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 11518
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableTakeUntil;

    invoke-direct {v0, p0, p1}, Lio/reactivex/internal/operators/observable/ObservableTakeUntil;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final takeUntil(Lio/reactivex/functions/Predicate;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Predicate",
            "<-TT;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 11546
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "stopPredicate":Lio/reactivex/functions/Predicate;, "Lio/reactivex/functions/Predicate<-TT;>;"
    const-string/jumbo v0, "predicate is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 11547
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableTakeUntilPredicate;

    invoke-direct {v0, p0, p1}, Lio/reactivex/internal/operators/observable/ObservableTakeUntilPredicate;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Predicate;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final takeWhile(Lio/reactivex/functions/Predicate;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Predicate",
            "<-TT;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 11570
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "predicate":Lio/reactivex/functions/Predicate;, "Lio/reactivex/functions/Predicate<-TT;>;"
    const-string/jumbo v0, "predicate is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 11571
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableTakeWhile;

    invoke-direct {v0, p0, p1}, Lio/reactivex/internal/operators/observable/ObservableTakeWhile;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Predicate;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final test()Lio/reactivex/observers/TestObserver;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/observers/TestObserver",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 13700
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    new-instance v0, Lio/reactivex/observers/TestObserver;

    invoke-direct {v0}, Lio/reactivex/observers/TestObserver;-><init>()V

    .line 13701
    .local v0, "ts":Lio/reactivex/observers/TestObserver;, "Lio/reactivex/observers/TestObserver<TT;>;"
    invoke-virtual {p0, v0}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/Observer;)V

    .line 13702
    return-object v0
.end method

.method public final test(Z)Lio/reactivex/observers/TestObserver;
    .locals 1
    .param p1, "dispose"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Lio/reactivex/observers/TestObserver",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 13720
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    new-instance v0, Lio/reactivex/observers/TestObserver;

    invoke-direct {v0}, Lio/reactivex/observers/TestObserver;-><init>()V

    .line 13721
    .local v0, "ts":Lio/reactivex/observers/TestObserver;, "Lio/reactivex/observers/TestObserver<TT;>;"
    if-eqz p1, :cond_0

    .line 13722
    invoke-virtual {v0}, Lio/reactivex/observers/TestObserver;->dispose()V

    .line 13724
    :cond_0
    invoke-virtual {p0, v0}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/Observer;)V

    .line 13725
    return-object v0
.end method

.method public final throttleFirst(JLjava/util/concurrent/TimeUnit;)Lio/reactivex/Observable;
    .locals 1
    .param p1, "windowDuration"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "io.reactivex:computation"
    .end annotation

    .prologue
    .line 11597
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->computation()Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p0, p1, p2, p3, v0}, Lio/reactivex/Observable;->throttleFirst(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final throttleFirst(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;
    .locals 7
    .param p1, "skipDuration"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "scheduler"    # Lio/reactivex/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            ")",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "custom"
    .end annotation

    .prologue
    .line 11626
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    const-string/jumbo v0, "unit is null"

    invoke-static {p3, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 11627
    const-string/jumbo v0, "scheduler is null"

    invoke-static {p4, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 11628
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableThrottleFirstTimed;

    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lio/reactivex/internal/operators/observable/ObservableThrottleFirstTimed;-><init>(Lio/reactivex/ObservableSource;JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final throttleLast(JLjava/util/concurrent/TimeUnit;)Lio/reactivex/Observable;
    .locals 1
    .param p1, "intervalDuration"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "io.reactivex:computation"
    .end annotation

    .prologue
    .line 11656
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-virtual {p0, p1, p2, p3}, Lio/reactivex/Observable;->sample(JLjava/util/concurrent/TimeUnit;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final throttleLast(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;
    .locals 1
    .param p1, "intervalDuration"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "scheduler"    # Lio/reactivex/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            ")",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "custom"
    .end annotation

    .prologue
    .line 11687
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-virtual {p0, p1, p2, p3, p4}, Lio/reactivex/Observable;->sample(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final throttleWithTimeout(JLjava/util/concurrent/TimeUnit;)Lio/reactivex/Observable;
    .locals 1
    .param p1, "timeout"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "io.reactivex:computation"
    .end annotation

    .prologue
    .line 11724
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-virtual {p0, p1, p2, p3}, Lio/reactivex/Observable;->debounce(JLjava/util/concurrent/TimeUnit;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final throttleWithTimeout(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;
    .locals 1
    .param p1, "timeout"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "scheduler"    # Lio/reactivex/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            ")",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "custom"
    .end annotation

    .prologue
    .line 11765
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-virtual {p0, p1, p2, p3, p4}, Lio/reactivex/Observable;->debounce(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final timeInterval()Lio/reactivex/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/Observable",
            "<",
            "Lio/reactivex/schedulers/Timed",
            "<TT;>;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 11785
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->computation()Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lio/reactivex/Observable;->timeInterval(Ljava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final timeInterval(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;
    .locals 1
    .param p1, "scheduler"    # Lio/reactivex/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Scheduler;",
            ")",
            "Lio/reactivex/Observable",
            "<",
            "Lio/reactivex/schedulers/Timed",
            "<TT;>;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 11807
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p0, v0, p1}, Lio/reactivex/Observable;->timeInterval(Ljava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final timeInterval(Ljava/util/concurrent/TimeUnit;)Lio/reactivex/Observable;
    .locals 1
    .param p1, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lio/reactivex/Observable",
            "<",
            "Lio/reactivex/schedulers/Timed",
            "<TT;>;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 11828
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->computation()Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lio/reactivex/Observable;->timeInterval(Ljava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final timeInterval(Ljava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;
    .locals 1
    .param p1, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p2, "scheduler"    # Lio/reactivex/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            ")",
            "Lio/reactivex/Observable",
            "<",
            "Lio/reactivex/schedulers/Timed",
            "<TT;>;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 11851
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    const-string/jumbo v0, "unit is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 11852
    const-string/jumbo v0, "scheduler is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 11853
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableTimeInterval;

    invoke-direct {v0, p0, p1, p2}, Lio/reactivex/internal/operators/observable/ObservableTimeInterval;-><init>(Lio/reactivex/ObservableSource;Ljava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final timeout(JLjava/util/concurrent/TimeUnit;)Lio/reactivex/Observable;
    .locals 7
    .param p1, "timeout"    # J
    .param p3, "timeUnit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "io.reactivex:computation"
    .end annotation

    .prologue
    .line 11942
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    const/4 v5, 0x0

    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->computation()Lio/reactivex/Scheduler;

    move-result-object v6

    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    invoke-direct/range {v1 .. v6}, Lio/reactivex/Observable;->timeout0(JLjava/util/concurrent/TimeUnit;Lio/reactivex/ObservableSource;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final timeout(JLjava/util/concurrent/TimeUnit;Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;
    .locals 7
    .param p1, "timeout"    # J
    .param p3, "timeUnit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "io.reactivex:computation"
    .end annotation

    .prologue
    .line 11968
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p4, "other":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    const-string/jumbo v0, "other is null"

    invoke-static {p4, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 11969
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->computation()Lio/reactivex/Scheduler;

    move-result-object v6

    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v1 .. v6}, Lio/reactivex/Observable;->timeout0(JLjava/util/concurrent/TimeUnit;Lio/reactivex/ObservableSource;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final timeout(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;
    .locals 7
    .param p1, "timeout"    # J
    .param p3, "timeUnit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "scheduler"    # Lio/reactivex/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            ")",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "custom"
    .end annotation

    .prologue
    .line 12027
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    const/4 v5, 0x0

    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    move-object v6, p4

    invoke-direct/range {v1 .. v6}, Lio/reactivex/Observable;->timeout0(JLjava/util/concurrent/TimeUnit;Lio/reactivex/ObservableSource;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final timeout(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;
    .locals 7
    .param p1, "timeout"    # J
    .param p3, "timeUnit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "scheduler"    # Lio/reactivex/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "custom"
    .end annotation

    .prologue
    .line 11998
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p5, "other":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    const-string/jumbo v0, "other is null"

    invoke-static {p5, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    move-object v5, p5

    move-object v6, p4

    .line 11999
    invoke-direct/range {v1 .. v6}, Lio/reactivex/Observable;->timeout0(JLjava/util/concurrent/TimeUnit;Lio/reactivex/ObservableSource;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final timeout(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<TU;>;",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/ObservableSource",
            "<TV;>;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 12061
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "firstTimeoutIndicator":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TU;>;"
    .local p2, "itemTimeoutIndicator":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lio/reactivex/ObservableSource<TV;>;>;"
    const-string/jumbo v0, "firstTimeoutIndicator is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 12062
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lio/reactivex/Observable;->timeout0(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final timeout(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<TU;>;",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/ObservableSource",
            "<TV;>;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 12103
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "firstTimeoutIndicator":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TU;>;"
    .local p2, "itemTimeoutIndicator":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lio/reactivex/ObservableSource<TV;>;>;"
    .local p3, "other":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    const-string/jumbo v0, "firstTimeoutIndicator is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 12104
    const-string/jumbo v0, "other is null"

    invoke-static {p3, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 12105
    invoke-direct {p0, p1, p2, p3}, Lio/reactivex/Observable;->timeout0(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final timeout(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/ObservableSource",
            "<TV;>;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "itemTimeoutIndicator":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lio/reactivex/ObservableSource<TV;>;>;"
    const/4 v0, 0x0

    .line 11883
    invoke-direct {p0, v0, p1, v0}, Lio/reactivex/Observable;->timeout0(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final timeout(Lio/reactivex/functions/Function;Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/ObservableSource",
            "<TV;>;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 11916
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "itemTimeoutIndicator":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lio/reactivex/ObservableSource<TV;>;>;"
    .local p2, "other":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    const-string/jumbo v0, "other is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 11917
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1, p2}, Lio/reactivex/Observable;->timeout0(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final timestamp()Lio/reactivex/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/Observable",
            "<",
            "Lio/reactivex/schedulers/Timed",
            "<TT;>;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 12140
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->computation()Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lio/reactivex/Observable;->timestamp(Ljava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final timestamp(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;
    .locals 1
    .param p1, "scheduler"    # Lio/reactivex/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Scheduler;",
            ")",
            "Lio/reactivex/Observable",
            "<",
            "Lio/reactivex/schedulers/Timed",
            "<TT;>;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 12163
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p0, v0, p1}, Lio/reactivex/Observable;->timestamp(Ljava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final timestamp(Ljava/util/concurrent/TimeUnit;)Lio/reactivex/Observable;
    .locals 1
    .param p1, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lio/reactivex/Observable",
            "<",
            "Lio/reactivex/schedulers/Timed",
            "<TT;>;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 12184
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->computation()Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lio/reactivex/Observable;->timestamp(Ljava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final timestamp(Ljava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;
    .locals 1
    .param p1, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p2, "scheduler"    # Lio/reactivex/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            ")",
            "Lio/reactivex/Observable",
            "<",
            "Lio/reactivex/schedulers/Timed",
            "<TT;>;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 12208
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    const-string/jumbo v0, "unit is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 12209
    const-string/jumbo v0, "scheduler is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 12210
    invoke-static {p1, p2}, Lio/reactivex/internal/functions/Functions;->timestampWith(Ljava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/functions/Function;

    move-result-object v0

    invoke-virtual {p0, v0}, Lio/reactivex/Observable;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final to(Lio/reactivex/functions/Function;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/Observable",
            "<TT;>;TR;>;)TR;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 12229
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "converter":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Lio/reactivex/Observable<TT;>;TR;>;"
    :try_start_0
    const-string/jumbo v1, "converter is null"

    invoke-static {p1, v1}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/reactivex/functions/Function;

    invoke-interface {v1, p0}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 12230
    :catch_0
    move-exception v0

    .line 12231
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 12232
    invoke-static {v0}, Lio/reactivex/internal/util/ExceptionHelper;->wrapOrThrow(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1
.end method

.method public final toFlowable(Lio/reactivex/BackpressureStrategy;)Lio/reactivex/Flowable;
    .locals 3
    .param p1, "strategy"    # Lio/reactivex/BackpressureStrategy;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/BackpressureStrategy;",
            ")",
            "Lio/reactivex/Flowable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/BackpressureSupport;
        value = .enum Lio/reactivex/annotations/BackpressureKind;->SPECIAL:Lio/reactivex/annotations/BackpressureKind;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 12568
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    new-instance v0, Lio/reactivex/internal/operators/flowable/FlowableFromObservable;

    invoke-direct {v0, p0}, Lio/reactivex/internal/operators/flowable/FlowableFromObservable;-><init>(Lio/reactivex/Observable;)V

    .line 12570
    .local v0, "o":Lio/reactivex/Flowable;, "Lio/reactivex/Flowable<TT;>;"
    sget-object v1, Lio/reactivex/Observable$1;->$SwitchMap$io$reactivex$BackpressureStrategy:[I

    invoke-virtual {p1}, Lio/reactivex/BackpressureStrategy;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 12580
    invoke-virtual {v0}, Lio/reactivex/Flowable;->onBackpressureBuffer()Lio/reactivex/Flowable;

    move-result-object v0

    .end local v0    # "o":Lio/reactivex/Flowable;, "Lio/reactivex/Flowable<TT;>;"
    :goto_0
    :pswitch_0
    return-object v0

    .line 12572
    .restart local v0    # "o":Lio/reactivex/Flowable;, "Lio/reactivex/Flowable<TT;>;"
    :pswitch_1
    invoke-virtual {v0}, Lio/reactivex/Flowable;->onBackpressureDrop()Lio/reactivex/Flowable;

    move-result-object v0

    goto :goto_0

    .line 12574
    :pswitch_2
    invoke-virtual {v0}, Lio/reactivex/Flowable;->onBackpressureLatest()Lio/reactivex/Flowable;

    move-result-object v0

    goto :goto_0

    .line 12578
    :pswitch_3
    new-instance v1, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureError;

    invoke-direct {v1, v0}, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureError;-><init>(Lio/reactivex/Flowable;)V

    invoke-static {v1}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Flowable;)Lio/reactivex/Flowable;

    move-result-object v0

    goto :goto_0

    .line 12570
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method

.method public final toFuture()Ljava/util/concurrent/Future;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/concurrent/Future",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 5020
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    new-instance v0, Lio/reactivex/internal/observers/FutureObserver;

    invoke-direct {v0}, Lio/reactivex/internal/observers/FutureObserver;-><init>()V

    invoke-virtual {p0, v0}, Lio/reactivex/Observable;->subscribeWith(Lio/reactivex/Observer;)Lio/reactivex/Observer;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/Future;

    return-object v0
.end method

.method public final toList()Lio/reactivex/Single;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/Single",
            "<",
            "Ljava/util/List",
            "<TT;>;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 12262
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    const/16 v0, 0x10

    invoke-virtual {p0, v0}, Lio/reactivex/Observable;->toList(I)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public final toList(I)Lio/reactivex/Single;
    .locals 1
    .param p1, "capacityHint"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lio/reactivex/Single",
            "<",
            "Ljava/util/List",
            "<TT;>;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 12293
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    const-string/jumbo v0, "capacityHint"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(ILjava/lang/String;)I

    .line 12294
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableToListSingle;

    invoke-direct {v0, p0, p1}, Lio/reactivex/internal/operators/observable/ObservableToListSingle;-><init>(Lio/reactivex/ObservableSource;I)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Single;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public final toList(Ljava/util/concurrent/Callable;)Lio/reactivex/Single;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U::",
            "Ljava/util/Collection",
            "<-TT;>;>(",
            "Ljava/util/concurrent/Callable",
            "<TU;>;)",
            "Lio/reactivex/Single",
            "<TU;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 12326
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "collectionSupplier":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<TU;>;"
    const-string/jumbo v0, "collectionSupplier is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 12327
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableToListSingle;

    invoke-direct {v0, p0, p1}, Lio/reactivex/internal/operators/observable/ObservableToListSingle;-><init>(Lio/reactivex/ObservableSource;Ljava/util/concurrent/Callable;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Single;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public final toMap(Lio/reactivex/functions/Function;)Lio/reactivex/Single;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-TT;+TK;>;)",
            "Lio/reactivex/Single",
            "<",
            "Ljava/util/Map",
            "<TK;TT;>;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 12352
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "keySelector":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+TK;>;"
    const-string/jumbo v0, "keySelector is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 12353
    invoke-static {}, Lio/reactivex/internal/util/HashMapSupplier;->asCallable()Ljava/util/concurrent/Callable;

    move-result-object v0

    invoke-static {p1}, Lio/reactivex/internal/functions/Functions;->toMapKeySelector(Lio/reactivex/functions/Function;)Lio/reactivex/functions/BiConsumer;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lio/reactivex/Observable;->collect(Ljava/util/concurrent/Callable;Lio/reactivex/functions/BiConsumer;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public final toMap(Lio/reactivex/functions/Function;Lio/reactivex/functions/Function;)Lio/reactivex/Single;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-TT;+TK;>;",
            "Lio/reactivex/functions/Function",
            "<-TT;+TV;>;)",
            "Lio/reactivex/Single",
            "<",
            "Ljava/util/Map",
            "<TK;TV;>;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 12384
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "keySelector":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+TK;>;"
    .local p2, "valueSelector":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+TV;>;"
    const-string/jumbo v0, "keySelector is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 12385
    const-string/jumbo v0, "valueSelector is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 12386
    invoke-static {}, Lio/reactivex/internal/util/HashMapSupplier;->asCallable()Ljava/util/concurrent/Callable;

    move-result-object v0

    invoke-static {p1, p2}, Lio/reactivex/internal/functions/Functions;->toMapKeyValueSelector(Lio/reactivex/functions/Function;Lio/reactivex/functions/Function;)Lio/reactivex/functions/BiConsumer;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lio/reactivex/Observable;->collect(Ljava/util/concurrent/Callable;Lio/reactivex/functions/BiConsumer;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public final toMap(Lio/reactivex/functions/Function;Lio/reactivex/functions/Function;Ljava/util/concurrent/Callable;)Lio/reactivex/Single;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-TT;+TK;>;",
            "Lio/reactivex/functions/Function",
            "<-TT;+TV;>;",
            "Ljava/util/concurrent/Callable",
            "<+",
            "Ljava/util/Map",
            "<TK;TV;>;>;)",
            "Lio/reactivex/Single",
            "<",
            "Ljava/util/Map",
            "<TK;TV;>;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 12417
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "keySelector":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+TK;>;"
    .local p2, "valueSelector":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+TV;>;"
    .local p3, "mapSupplier":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<+Ljava/util/Map<TK;TV;>;>;"
    const-string/jumbo v0, "keySelector is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 12418
    const-string/jumbo v0, "keySelector is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 12419
    const-string/jumbo v0, "valueSelector is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 12420
    const-string/jumbo v0, "mapSupplier is null"

    invoke-static {p3, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 12421
    invoke-static {p1, p2}, Lio/reactivex/internal/functions/Functions;->toMapKeyValueSelector(Lio/reactivex/functions/Function;Lio/reactivex/functions/Function;)Lio/reactivex/functions/BiConsumer;

    move-result-object v0

    invoke-virtual {p0, p3, v0}, Lio/reactivex/Observable;->collect(Ljava/util/concurrent/Callable;Lio/reactivex/functions/BiConsumer;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public final toMultimap(Lio/reactivex/functions/Function;)Lio/reactivex/Single;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-TT;+TK;>;)",
            "Lio/reactivex/Single",
            "<",
            "Ljava/util/Map",
            "<TK;",
            "Ljava/util/Collection",
            "<TT;>;>;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 12445
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "keySelector":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+TK;>;"
    invoke-static {}, Lio/reactivex/internal/functions/Functions;->identity()Lio/reactivex/functions/Function;

    move-result-object v2

    .line 12446
    .local v2, "valueSelector":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+TT;>;"
    invoke-static {}, Lio/reactivex/internal/util/HashMapSupplier;->asCallable()Ljava/util/concurrent/Callable;

    move-result-object v1

    .line 12447
    .local v1, "mapSupplier":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<Ljava/util/Map<TK;Ljava/util/Collection<TT;>;>;>;"
    invoke-static {}, Lio/reactivex/internal/util/ArrayListSupplier;->asFunction()Lio/reactivex/functions/Function;

    move-result-object v0

    .line 12448
    .local v0, "collectionFactory":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<TK;Ljava/util/List<TT;>;>;"
    invoke-virtual {p0, p1, v2, v1, v0}, Lio/reactivex/Observable;->toMultimap(Lio/reactivex/functions/Function;Lio/reactivex/functions/Function;Ljava/util/concurrent/Callable;Lio/reactivex/functions/Function;)Lio/reactivex/Single;

    move-result-object v3

    return-object v3
.end method

.method public final toMultimap(Lio/reactivex/functions/Function;Lio/reactivex/functions/Function;)Lio/reactivex/Single;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-TT;+TK;>;",
            "Lio/reactivex/functions/Function",
            "<-TT;+TV;>;)",
            "Lio/reactivex/Single",
            "<",
            "Ljava/util/Map",
            "<TK;",
            "Ljava/util/Collection",
            "<TV;>;>;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 12475
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "keySelector":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+TK;>;"
    .local p2, "valueSelector":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+TV;>;"
    invoke-static {}, Lio/reactivex/internal/util/HashMapSupplier;->asCallable()Ljava/util/concurrent/Callable;

    move-result-object v1

    .line 12476
    .local v1, "mapSupplier":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<Ljava/util/Map<TK;Ljava/util/Collection<TV;>;>;>;"
    invoke-static {}, Lio/reactivex/internal/util/ArrayListSupplier;->asFunction()Lio/reactivex/functions/Function;

    move-result-object v0

    .line 12477
    .local v0, "collectionFactory":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<TK;Ljava/util/List<TV;>;>;"
    invoke-virtual {p0, p1, p2, v1, v0}, Lio/reactivex/Observable;->toMultimap(Lio/reactivex/functions/Function;Lio/reactivex/functions/Function;Ljava/util/concurrent/Callable;Lio/reactivex/functions/Function;)Lio/reactivex/Single;

    move-result-object v2

    return-object v2
.end method

.method public final toMultimap(Lio/reactivex/functions/Function;Lio/reactivex/functions/Function;Ljava/util/concurrent/Callable;)Lio/reactivex/Single;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-TT;+TK;>;",
            "Lio/reactivex/functions/Function",
            "<-TT;+TV;>;",
            "Ljava/util/concurrent/Callable",
            "<",
            "Ljava/util/Map",
            "<TK;",
            "Ljava/util/Collection",
            "<TV;>;>;>;)",
            "Lio/reactivex/Single",
            "<",
            "Ljava/util/Map",
            "<TK;",
            "Ljava/util/Collection",
            "<TV;>;>;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 12549
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "keySelector":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+TK;>;"
    .local p2, "valueSelector":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+TV;>;"
    .local p3, "mapSupplier":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<Ljava/util/Map<TK;Ljava/util/Collection<TV;>;>;>;"
    invoke-static {}, Lio/reactivex/internal/util/ArrayListSupplier;->asFunction()Lio/reactivex/functions/Function;

    move-result-object v0

    invoke-virtual {p0, p1, p2, p3, v0}, Lio/reactivex/Observable;->toMultimap(Lio/reactivex/functions/Function;Lio/reactivex/functions/Function;Ljava/util/concurrent/Callable;Lio/reactivex/functions/Function;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public final toMultimap(Lio/reactivex/functions/Function;Lio/reactivex/functions/Function;Ljava/util/concurrent/Callable;Lio/reactivex/functions/Function;)Lio/reactivex/Single;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-TT;+TK;>;",
            "Lio/reactivex/functions/Function",
            "<-TT;+TV;>;",
            "Ljava/util/concurrent/Callable",
            "<+",
            "Ljava/util/Map",
            "<TK;",
            "Ljava/util/Collection",
            "<TV;>;>;>;",
            "Lio/reactivex/functions/Function",
            "<-TK;+",
            "Ljava/util/Collection",
            "<-TV;>;>;)",
            "Lio/reactivex/Single",
            "<",
            "Ljava/util/Map",
            "<TK;",
            "Ljava/util/Collection",
            "<TV;>;>;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 12512
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "keySelector":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+TK;>;"
    .local p2, "valueSelector":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+TV;>;"
    .local p3, "mapSupplier":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<+Ljava/util/Map<TK;Ljava/util/Collection<TV;>;>;>;"
    .local p4, "collectionFactory":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TK;+Ljava/util/Collection<-TV;>;>;"
    const-string/jumbo v0, "keySelector is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 12513
    const-string/jumbo v0, "valueSelector is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 12514
    const-string/jumbo v0, "mapSupplier is null"

    invoke-static {p3, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 12515
    const-string/jumbo v0, "collectionFactory is null"

    invoke-static {p4, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 12516
    invoke-static {p1, p2, p4}, Lio/reactivex/internal/functions/Functions;->toMultimapKeyValueSelector(Lio/reactivex/functions/Function;Lio/reactivex/functions/Function;Lio/reactivex/functions/Function;)Lio/reactivex/functions/BiConsumer;

    move-result-object v0

    invoke-virtual {p0, p3, v0}, Lio/reactivex/Observable;->collect(Ljava/util/concurrent/Callable;Lio/reactivex/functions/BiConsumer;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public final toSortedList()Lio/reactivex/Single;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/Single",
            "<",
            "Ljava/util/List",
            "<TT;>;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 12605
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-static {}, Lio/reactivex/internal/functions/Functions;->naturalOrder()Ljava/util/Comparator;

    move-result-object v0

    invoke-virtual {p0, v0}, Lio/reactivex/Observable;->toSortedList(Ljava/util/Comparator;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public final toSortedList(I)Lio/reactivex/Single;
    .locals 1
    .param p1, "capacityHint"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lio/reactivex/Single",
            "<",
            "Ljava/util/List",
            "<TT;>;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 12684
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-static {}, Lio/reactivex/internal/functions/Functions;->naturalOrder()Ljava/util/Comparator;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lio/reactivex/Observable;->toSortedList(Ljava/util/Comparator;I)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public final toSortedList(Ljava/util/Comparator;)Lio/reactivex/Single;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Comparator",
            "<-TT;>;)",
            "Lio/reactivex/Single",
            "<",
            "Ljava/util/List",
            "<TT;>;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 12628
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "comparator":Ljava/util/Comparator;, "Ljava/util/Comparator<-TT;>;"
    const-string/jumbo v0, "comparator is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 12629
    invoke-virtual {p0}, Lio/reactivex/Observable;->toList()Lio/reactivex/Single;

    move-result-object v0

    invoke-static {p1}, Lio/reactivex/internal/functions/Functions;->listSorter(Ljava/util/Comparator;)Lio/reactivex/functions/Function;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Single;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public final toSortedList(Ljava/util/Comparator;I)Lio/reactivex/Single;
    .locals 2
    .param p2, "capacityHint"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Comparator",
            "<-TT;>;I)",
            "Lio/reactivex/Single",
            "<",
            "Ljava/util/List",
            "<TT;>;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 12655
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "comparator":Ljava/util/Comparator;, "Ljava/util/Comparator<-TT;>;"
    const-string/jumbo v0, "comparator is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 12656
    invoke-virtual {p0, p2}, Lio/reactivex/Observable;->toList(I)Lio/reactivex/Single;

    move-result-object v0

    invoke-static {p1}, Lio/reactivex/internal/functions/Functions;->listSorter(Ljava/util/Comparator;)Lio/reactivex/functions/Function;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Single;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public final unsubscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;
    .locals 1
    .param p1, "scheduler"    # Lio/reactivex/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Scheduler;",
            ")",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "custom"
    .end annotation

    .prologue
    .line 12704
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    const-string/jumbo v0, "scheduler is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 12705
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableUnsubscribeOn;

    invoke-direct {v0, p0, p1}, Lio/reactivex/internal/operators/observable/ObservableUnsubscribeOn;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/Scheduler;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final window(J)Lio/reactivex/Observable;
    .locals 7
    .param p1, "count"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Lio/reactivex/Observable",
            "<",
            "Lio/reactivex/Observable",
            "<TT;>;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 12730
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v6

    move-object v1, p0

    move-wide v2, p1

    move-wide v4, p1

    invoke-virtual/range {v1 .. v6}, Lio/reactivex/Observable;->window(JJI)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final window(JJ)Lio/reactivex/Observable;
    .locals 7
    .param p1, "count"    # J
    .param p3, "skip"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJ)",
            "Lio/reactivex/Observable",
            "<",
            "Lio/reactivex/Observable",
            "<TT;>;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 12758
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v6

    move-object v1, p0

    move-wide v2, p1

    move-wide v4, p3

    invoke-virtual/range {v1 .. v6}, Lio/reactivex/Observable;->window(JJI)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final window(JJI)Lio/reactivex/Observable;
    .locals 7
    .param p1, "count"    # J
    .param p3, "skip"    # J
    .param p5, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJI)",
            "Lio/reactivex/Observable",
            "<",
            "Lio/reactivex/Observable",
            "<TT;>;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 12788
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    const-string/jumbo v0, "count"

    invoke-static {p1, p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(JLjava/lang/String;)J

    .line 12789
    const-string/jumbo v0, "skip"

    invoke-static {p3, p4, v0}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(JLjava/lang/String;)J

    .line 12790
    const-string/jumbo v0, "bufferSize"

    invoke-static {p5, v0}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(ILjava/lang/String;)I

    .line 12791
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableWindow;

    move-object v1, p0

    move-wide v2, p1

    move-wide v4, p3

    move v6, p5

    invoke-direct/range {v0 .. v6}, Lio/reactivex/internal/operators/observable/ObservableWindow;-><init>(Lio/reactivex/ObservableSource;JJI)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final window(JJLjava/util/concurrent/TimeUnit;)Lio/reactivex/Observable;
    .locals 9
    .param p1, "timespan"    # J
    .param p3, "timeskip"    # J
    .param p5, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJ",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lio/reactivex/Observable",
            "<",
            "Lio/reactivex/Observable",
            "<TT;>;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "io.reactivex:computation"
    .end annotation

    .prologue
    .line 12819
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->computation()Lio/reactivex/Scheduler;

    move-result-object v7

    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v8

    move-object v1, p0

    move-wide v2, p1

    move-wide v4, p3

    move-object v6, p5

    invoke-virtual/range {v1 .. v8}, Lio/reactivex/Observable;->window(JJLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;I)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final window(JJLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;
    .locals 9
    .param p1, "timespan"    # J
    .param p3, "timeskip"    # J
    .param p5, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p6, "scheduler"    # Lio/reactivex/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJ",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            ")",
            "Lio/reactivex/Observable",
            "<",
            "Lio/reactivex/Observable",
            "<TT;>;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "custom"
    .end annotation

    .prologue
    .line 12849
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v8

    move-object v1, p0

    move-wide v2, p1

    move-wide v4, p3

    move-object v6, p5

    move-object v7, p6

    invoke-virtual/range {v1 .. v8}, Lio/reactivex/Observable;->window(JJLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;I)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final window(JJLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;I)Lio/reactivex/Observable;
    .locals 15
    .param p1, "timespan"    # J
    .param p3, "timeskip"    # J
    .param p5, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p6, "scheduler"    # Lio/reactivex/Scheduler;
    .param p7, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJ",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            "I)",
            "Lio/reactivex/Observable",
            "<",
            "Lio/reactivex/Observable",
            "<TT;>;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "custom"
    .end annotation

    .prologue
    .line 12881
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    const-string/jumbo v2, "timespan"

    move-wide/from16 v0, p1

    invoke-static {v0, v1, v2}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(JLjava/lang/String;)J

    .line 12882
    const-string/jumbo v2, "timeskip"

    move-wide/from16 v0, p3

    invoke-static {v0, v1, v2}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(JLjava/lang/String;)J

    .line 12883
    const-string/jumbo v2, "bufferSize"

    move/from16 v0, p7

    invoke-static {v0, v2}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(ILjava/lang/String;)I

    .line 12884
    const-string/jumbo v2, "scheduler is null"

    move-object/from16 v0, p6

    invoke-static {v0, v2}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 12885
    const-string/jumbo v2, "unit is null"

    move-object/from16 v0, p5

    invoke-static {v0, v2}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 12886
    new-instance v2, Lio/reactivex/internal/operators/observable/ObservableWindowTimed;

    const-wide v10, 0x7fffffffffffffffL

    const/4 v13, 0x0

    move-object v3, p0

    move-wide/from16 v4, p1

    move-wide/from16 v6, p3

    move-object/from16 v8, p5

    move-object/from16 v9, p6

    move/from16 v12, p7

    invoke-direct/range {v2 .. v13}, Lio/reactivex/internal/operators/observable/ObservableWindowTimed;-><init>(Lio/reactivex/ObservableSource;JJLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;JIZ)V

    invoke-static {v2}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v2

    return-object v2
.end method

.method public final window(JLjava/util/concurrent/TimeUnit;)Lio/reactivex/Observable;
    .locals 9
    .param p1, "timespan"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lio/reactivex/Observable",
            "<",
            "Lio/reactivex/Observable",
            "<TT;>;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "io.reactivex:computation"
    .end annotation

    .prologue
    .line 12913
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->computation()Lio/reactivex/Scheduler;

    move-result-object v5

    const-wide v6, 0x7fffffffffffffffL

    const/4 v8, 0x0

    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    invoke-virtual/range {v1 .. v8}, Lio/reactivex/Observable;->window(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;JZ)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final window(JLjava/util/concurrent/TimeUnit;J)Lio/reactivex/Observable;
    .locals 9
    .param p1, "timespan"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "count"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "J)",
            "Lio/reactivex/Observable",
            "<",
            "Lio/reactivex/Observable",
            "<TT;>;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "io.reactivex:computation"
    .end annotation

    .prologue
    .line 12945
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->computation()Lio/reactivex/Scheduler;

    move-result-object v5

    const/4 v8, 0x0

    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    move-wide v6, p4

    invoke-virtual/range {v1 .. v8}, Lio/reactivex/Observable;->window(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;JZ)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final window(JLjava/util/concurrent/TimeUnit;JZ)Lio/reactivex/Observable;
    .locals 9
    .param p1, "timespan"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "count"    # J
    .param p6, "restart"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "JZ)",
            "Lio/reactivex/Observable",
            "<",
            "Lio/reactivex/Observable",
            "<TT;>;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "io.reactivex:computation"
    .end annotation

    .prologue
    .line 12979
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->computation()Lio/reactivex/Scheduler;

    move-result-object v5

    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    move-wide v6, p4

    move v8, p6

    invoke-virtual/range {v1 .. v8}, Lio/reactivex/Observable;->window(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;JZ)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final window(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;
    .locals 9
    .param p1, "timespan"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "scheduler"    # Lio/reactivex/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            ")",
            "Lio/reactivex/Observable",
            "<",
            "Lio/reactivex/Observable",
            "<TT;>;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "custom"
    .end annotation

    .prologue
    .line 13009
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    const-wide v6, 0x7fffffffffffffffL

    const/4 v8, 0x0

    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    move-object v5, p4

    invoke-virtual/range {v1 .. v8}, Lio/reactivex/Observable;->window(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;JZ)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final window(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;J)Lio/reactivex/Observable;
    .locals 9
    .param p1, "timespan"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "scheduler"    # Lio/reactivex/Scheduler;
    .param p5, "count"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            "J)",
            "Lio/reactivex/Observable",
            "<",
            "Lio/reactivex/Observable",
            "<TT;>;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "custom"
    .end annotation

    .prologue
    .line 13043
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    const/4 v8, 0x0

    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    move-object v5, p4

    move-wide v6, p5

    invoke-virtual/range {v1 .. v8}, Lio/reactivex/Observable;->window(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;JZ)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final window(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;JZ)Lio/reactivex/Observable;
    .locals 11
    .param p1, "timespan"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "scheduler"    # Lio/reactivex/Scheduler;
    .param p5, "count"    # J
    .param p7, "restart"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            "JZ)",
            "Lio/reactivex/Observable",
            "<",
            "Lio/reactivex/Observable",
            "<TT;>;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "custom"
    .end annotation

    .prologue
    .line 13079
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v9

    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    move-object v5, p4

    move-wide/from16 v6, p5

    move/from16 v8, p7

    invoke-virtual/range {v1 .. v9}, Lio/reactivex/Observable;->window(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;JZI)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final window(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;JZI)Lio/reactivex/Observable;
    .locals 15
    .param p1, "timespan"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "scheduler"    # Lio/reactivex/Scheduler;
    .param p5, "count"    # J
    .param p7, "restart"    # Z
    .param p8, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            "JZI)",
            "Lio/reactivex/Observable",
            "<",
            "Lio/reactivex/Observable",
            "<TT;>;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "custom"
    .end annotation

    .prologue
    .line 13118
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    const-string/jumbo v2, "bufferSize"

    move/from16 v0, p8

    invoke-static {v0, v2}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(ILjava/lang/String;)I

    .line 13119
    const-string/jumbo v2, "scheduler is null"

    move-object/from16 v0, p4

    invoke-static {v0, v2}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 13120
    const-string/jumbo v2, "unit is null"

    move-object/from16 v0, p3

    invoke-static {v0, v2}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 13121
    const-string/jumbo v2, "count"

    move-wide/from16 v0, p5

    invoke-static {v0, v1, v2}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(JLjava/lang/String;)J

    .line 13122
    new-instance v2, Lio/reactivex/internal/operators/observable/ObservableWindowTimed;

    move-object v3, p0

    move-wide/from16 v4, p1

    move-wide/from16 v6, p1

    move-object/from16 v8, p3

    move-object/from16 v9, p4

    move-wide/from16 v10, p5

    move/from16 v12, p8

    move/from16 v13, p7

    invoke-direct/range {v2 .. v13}, Lio/reactivex/internal/operators/observable/ObservableWindowTimed;-><init>(Lio/reactivex/ObservableSource;JJLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;JIZ)V

    invoke-static {v2}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v2

    return-object v2
.end method

.method public final window(Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<B:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<TB;>;)",
            "Lio/reactivex/Observable",
            "<",
            "Lio/reactivex/Observable",
            "<TT;>;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 13148
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "boundary":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TB;>;"
    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lio/reactivex/Observable;->window(Lio/reactivex/ObservableSource;I)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final window(Lio/reactivex/ObservableSource;I)Lio/reactivex/Observable;
    .locals 1
    .param p2, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<B:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<TB;>;I)",
            "Lio/reactivex/Observable",
            "<",
            "Lio/reactivex/Observable",
            "<TT;>;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 13176
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "boundary":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TB;>;"
    const-string/jumbo v0, "boundary is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 13177
    const-string/jumbo v0, "bufferSize"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(ILjava/lang/String;)I

    .line 13178
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundary;

    invoke-direct {v0, p0, p1, p2}, Lio/reactivex/internal/operators/observable/ObservableWindowBoundary;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;I)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final window(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<TU;>;",
            "Lio/reactivex/functions/Function",
            "<-TU;+",
            "Lio/reactivex/ObservableSource",
            "<TV;>;>;)",
            "Lio/reactivex/Observable",
            "<",
            "Lio/reactivex/Observable",
            "<TT;>;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 13209
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "openingIndicator":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TU;>;"
    .local p2, "closingIndicator":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TU;+Lio/reactivex/ObservableSource<TV;>;>;"
    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v0

    invoke-virtual {p0, p1, p2, v0}, Lio/reactivex/Observable;->window(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;I)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final window(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;I)Lio/reactivex/Observable;
    .locals 1
    .param p3, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<TU;>;",
            "Lio/reactivex/functions/Function",
            "<-TU;+",
            "Lio/reactivex/ObservableSource",
            "<TV;>;>;I)",
            "Lio/reactivex/Observable",
            "<",
            "Lio/reactivex/Observable",
            "<TT;>;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 13242
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "openingIndicator":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TU;>;"
    .local p2, "closingIndicator":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TU;+Lio/reactivex/ObservableSource<TV;>;>;"
    const-string/jumbo v0, "openingIndicator is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 13243
    const-string/jumbo v0, "closingIndicator is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 13244
    const-string/jumbo v0, "bufferSize"

    invoke-static {p3, v0}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(ILjava/lang/String;)I

    .line 13245
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector;

    invoke-direct {v0, p0, p1, p2, p3}, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;I)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final window(Ljava/util/concurrent/Callable;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<B:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable",
            "<+",
            "Lio/reactivex/ObservableSource",
            "<TB;>;>;)",
            "Lio/reactivex/Observable",
            "<",
            "Lio/reactivex/Observable",
            "<TT;>;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 13272
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "boundary":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<+Lio/reactivex/ObservableSource<TB;>;>;"
    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lio/reactivex/Observable;->window(Ljava/util/concurrent/Callable;I)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final window(Ljava/util/concurrent/Callable;I)Lio/reactivex/Observable;
    .locals 1
    .param p2, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<B:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable",
            "<+",
            "Lio/reactivex/ObservableSource",
            "<TB;>;>;I)",
            "Lio/reactivex/Observable",
            "<",
            "Lio/reactivex/Observable",
            "<TT;>;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 13300
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "boundary":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<+Lio/reactivex/ObservableSource<TB;>;>;"
    const-string/jumbo v0, "boundary is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 13301
    const-string/jumbo v0, "bufferSize"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(ILjava/lang/String;)I

    .line 13302
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySupplier;

    invoke-direct {v0, p0, p1, p2}, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySupplier;-><init>(Lio/reactivex/ObservableSource;Ljava/util/concurrent/Callable;I)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final withLatestFrom(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function5;)Lio/reactivex/Observable;
    .locals 3
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
            ">(",
            "Lio/reactivex/ObservableSource",
            "<TT1;>;",
            "Lio/reactivex/ObservableSource",
            "<TT2;>;",
            "Lio/reactivex/ObservableSource",
            "<TT3;>;",
            "Lio/reactivex/ObservableSource",
            "<TT4;>;",
            "Lio/reactivex/functions/Function5",
            "<-TT;-TT1;-TT2;-TT3;-TT4;TR;>;)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 13448
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "o1":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TT1;>;"
    .local p2, "o2":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TT2;>;"
    .local p3, "o3":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TT3;>;"
    .local p4, "o4":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TT4;>;"
    .local p5, "combiner":Lio/reactivex/functions/Function5;, "Lio/reactivex/functions/Function5<-TT;-TT1;-TT2;-TT3;-TT4;TR;>;"
    const-string/jumbo v1, "o1 is null"

    invoke-static {p1, v1}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 13449
    const-string/jumbo v1, "o2 is null"

    invoke-static {p2, v1}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 13450
    const-string/jumbo v1, "o3 is null"

    invoke-static {p3, v1}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 13451
    const-string/jumbo v1, "o4 is null"

    invoke-static {p4, v1}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 13452
    const-string/jumbo v1, "combiner is null"

    invoke-static {p5, v1}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 13453
    invoke-static {p5}, Lio/reactivex/internal/functions/Functions;->toFunction(Lio/reactivex/functions/Function5;)Lio/reactivex/functions/Function;

    move-result-object v0

    .line 13454
    .local v0, "f":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<[Ljava/lang/Object;TR;>;"
    const/4 v1, 0x4

    new-array v1, v1, [Lio/reactivex/ObservableSource;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const/4 v2, 0x1

    aput-object p2, v1, v2

    const/4 v2, 0x2

    aput-object p3, v1, v2

    const/4 v2, 0x3

    aput-object p4, v1, v2

    invoke-virtual {p0, v1, v0}, Lio/reactivex/Observable;->withLatestFrom([Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object v1

    return-object v1
.end method

.method public final withLatestFrom(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function4;)Lio/reactivex/Observable;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            "T2:",
            "Ljava/lang/Object;",
            "T3:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<TT1;>;",
            "Lio/reactivex/ObservableSource",
            "<TT2;>;",
            "Lio/reactivex/ObservableSource",
            "<TT3;>;",
            "Lio/reactivex/functions/Function4",
            "<-TT;-TT1;-TT2;-TT3;TR;>;)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 13406
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "o1":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TT1;>;"
    .local p2, "o2":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TT2;>;"
    .local p3, "o3":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TT3;>;"
    .local p4, "combiner":Lio/reactivex/functions/Function4;, "Lio/reactivex/functions/Function4<-TT;-TT1;-TT2;-TT3;TR;>;"
    const-string/jumbo v1, "o1 is null"

    invoke-static {p1, v1}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 13407
    const-string/jumbo v1, "o2 is null"

    invoke-static {p2, v1}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 13408
    const-string/jumbo v1, "o3 is null"

    invoke-static {p3, v1}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 13409
    const-string/jumbo v1, "combiner is null"

    invoke-static {p4, v1}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 13410
    invoke-static {p4}, Lio/reactivex/internal/functions/Functions;->toFunction(Lio/reactivex/functions/Function4;)Lio/reactivex/functions/Function;

    move-result-object v0

    .line 13411
    .local v0, "f":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<[Ljava/lang/Object;TR;>;"
    const/4 v1, 0x3

    new-array v1, v1, [Lio/reactivex/ObservableSource;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const/4 v2, 0x1

    aput-object p2, v1, v2

    const/4 v2, 0x2

    aput-object p3, v1, v2

    invoke-virtual {p0, v1, v0}, Lio/reactivex/Observable;->withLatestFrom([Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object v1

    return-object v1
.end method

.method public final withLatestFrom(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function3;)Lio/reactivex/Observable;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            "T2:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<TT1;>;",
            "Lio/reactivex/ObservableSource",
            "<TT2;>;",
            "Lio/reactivex/functions/Function3",
            "<-TT;-TT1;-TT2;TR;>;)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 13367
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "o1":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TT1;>;"
    .local p2, "o2":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TT2;>;"
    .local p3, "combiner":Lio/reactivex/functions/Function3;, "Lio/reactivex/functions/Function3<-TT;-TT1;-TT2;TR;>;"
    const-string/jumbo v1, "o1 is null"

    invoke-static {p1, v1}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 13368
    const-string/jumbo v1, "o2 is null"

    invoke-static {p2, v1}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 13369
    const-string/jumbo v1, "combiner is null"

    invoke-static {p3, v1}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 13370
    invoke-static {p3}, Lio/reactivex/internal/functions/Functions;->toFunction(Lio/reactivex/functions/Function3;)Lio/reactivex/functions/Function;

    move-result-object v0

    .line 13371
    .local v0, "f":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<[Ljava/lang/Object;TR;>;"
    const/4 v1, 0x2

    new-array v1, v1, [Lio/reactivex/ObservableSource;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const/4 v2, 0x1

    aput-object p2, v1, v2

    invoke-virtual {p0, v1, v0}, Lio/reactivex/Observable;->withLatestFrom([Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object v1

    return-object v1
.end method

.method public final withLatestFrom(Lio/reactivex/ObservableSource;Lio/reactivex/functions/BiFunction;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<+TU;>;",
            "Lio/reactivex/functions/BiFunction",
            "<-TT;-TU;+TR;>;)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 13332
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "other":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TU;>;"
    .local p2, "combiner":Lio/reactivex/functions/BiFunction;, "Lio/reactivex/functions/BiFunction<-TT;-TU;+TR;>;"
    const-string/jumbo v0, "other is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 13333
    const-string/jumbo v0, "combiner is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 13335
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableWithLatestFrom;

    invoke-direct {v0, p0, p2, p1}, Lio/reactivex/internal/operators/observable/ObservableWithLatestFrom;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/functions/BiFunction;Lio/reactivex/ObservableSource;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final withLatestFrom(Ljava/lang/Iterable;Lio/reactivex/functions/Function;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Iterable",
            "<+",
            "Lio/reactivex/ObservableSource",
            "<*>;>;",
            "Lio/reactivex/functions/Function",
            "<-[",
            "Ljava/lang/Object;",
            "TR;>;)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 13510
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "others":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Lio/reactivex/ObservableSource<*>;>;"
    .local p2, "combiner":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-[Ljava/lang/Object;TR;>;"
    const-string/jumbo v0, "others is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 13511
    const-string/jumbo v0, "combiner is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 13512
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableWithLatestFromMany;

    invoke-direct {v0, p0, p1, p2}, Lio/reactivex/internal/operators/observable/ObservableWithLatestFromMany;-><init>(Lio/reactivex/ObservableSource;Ljava/lang/Iterable;Lio/reactivex/functions/Function;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final withLatestFrom([Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">([",
            "Lio/reactivex/ObservableSource",
            "<*>;",
            "Lio/reactivex/functions/Function",
            "<-[",
            "Ljava/lang/Object;",
            "TR;>;)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 13481
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "others":[Lio/reactivex/ObservableSource;, "[Lio/reactivex/ObservableSource<*>;"
    .local p2, "combiner":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-[Ljava/lang/Object;TR;>;"
    const-string/jumbo v0, "others is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 13482
    const-string/jumbo v0, "combiner is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 13483
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableWithLatestFromMany;

    invoke-direct {v0, p0, p1, p2}, Lio/reactivex/internal/operators/observable/ObservableWithLatestFromMany;-><init>(Lio/reactivex/ObservableSource;[Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final zipWith(Lio/reactivex/ObservableSource;Lio/reactivex/functions/BiFunction;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<+TU;>;",
            "Lio/reactivex/functions/BiFunction",
            "<-TT;-TU;+TR;>;)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 13588
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "other":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TU;>;"
    .local p2, "zipper":Lio/reactivex/functions/BiFunction;, "Lio/reactivex/functions/BiFunction<-TT;-TU;+TR;>;"
    const-string/jumbo v0, "other is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 13589
    invoke-static {p0, p1, p2}, Lio/reactivex/Observable;->zip(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/functions/BiFunction;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final zipWith(Lio/reactivex/ObservableSource;Lio/reactivex/functions/BiFunction;Z)Lio/reactivex/Observable;
    .locals 1
    .param p3, "delayError"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<+TU;>;",
            "Lio/reactivex/functions/BiFunction",
            "<-TT;-TU;+TR;>;Z)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 13634
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "other":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TU;>;"
    .local p2, "zipper":Lio/reactivex/functions/BiFunction;, "Lio/reactivex/functions/BiFunction<-TT;-TU;+TR;>;"
    invoke-static {p0, p1, p2, p3}, Lio/reactivex/Observable;->zip(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/functions/BiFunction;Z)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final zipWith(Lio/reactivex/ObservableSource;Lio/reactivex/functions/BiFunction;ZI)Lio/reactivex/Observable;
    .locals 1
    .param p3, "delayError"    # Z
    .param p4, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<+TU;>;",
            "Lio/reactivex/functions/BiFunction",
            "<-TT;-TU;+TR;>;ZI)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 13681
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "other":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TU;>;"
    .local p2, "zipper":Lio/reactivex/functions/BiFunction;, "Lio/reactivex/functions/BiFunction<-TT;-TU;+TR;>;"
    invoke-static {p0, p1, p2, p3, p4}, Lio/reactivex/Observable;->zip(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/functions/BiFunction;ZI)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final zipWith(Ljava/lang/Iterable;Lio/reactivex/functions/BiFunction;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Iterable",
            "<TU;>;",
            "Lio/reactivex/functions/BiFunction",
            "<-TT;-TU;+TR;>;)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 13544
    .local p0, "this":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "other":Ljava/lang/Iterable;, "Ljava/lang/Iterable<TU;>;"
    .local p2, "zipper":Lio/reactivex/functions/BiFunction;, "Lio/reactivex/functions/BiFunction<-TT;-TU;+TR;>;"
    const-string/jumbo v0, "other is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 13545
    const-string/jumbo v0, "zipper is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 13546
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableZipIterable;

    invoke-direct {v0, p0, p1, p2}, Lio/reactivex/internal/operators/observable/ObservableZipIterable;-><init>(Lio/reactivex/Observable;Ljava/lang/Iterable;Lio/reactivex/functions/BiFunction;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method
