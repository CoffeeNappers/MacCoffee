.class final synthetic Lcom/patloew/rxlocation/StatusExceptionResumeNextTransformer$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Lio/reactivex/ObservableTransformer;


# static fields
.field private static final instance:Lcom/patloew/rxlocation/StatusExceptionResumeNextTransformer$$Lambda$2;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/patloew/rxlocation/StatusExceptionResumeNextTransformer$$Lambda$2;

    invoke-direct {v0}, Lcom/patloew/rxlocation/StatusExceptionResumeNextTransformer$$Lambda$2;-><init>()V

    sput-object v0, Lcom/patloew/rxlocation/StatusExceptionResumeNextTransformer$$Lambda$2;->instance:Lcom/patloew/rxlocation/StatusExceptionResumeNextTransformer$$Lambda$2;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static lambdaFactory$()Lio/reactivex/ObservableTransformer;
    .locals 1

    sget-object v0, Lcom/patloew/rxlocation/StatusExceptionResumeNextTransformer$$Lambda$2;->instance:Lcom/patloew/rxlocation/StatusExceptionResumeNextTransformer$$Lambda$2;

    return-object v0
.end method


# virtual methods
.method public apply(Lio/reactivex/Observable;)Lio/reactivex/ObservableSource;
    .locals 1

    invoke-static {p1}, Lcom/patloew/rxlocation/StatusExceptionResumeNextTransformer;->lambda$forObservable$3(Lio/reactivex/Observable;)Lio/reactivex/ObservableSource;

    move-result-object v0

    return-object v0
.end method
