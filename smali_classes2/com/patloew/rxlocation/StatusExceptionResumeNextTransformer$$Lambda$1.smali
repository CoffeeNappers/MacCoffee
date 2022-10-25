.class final synthetic Lcom/patloew/rxlocation/StatusExceptionResumeNextTransformer$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Lio/reactivex/FlowableTransformer;


# static fields
.field private static final instance:Lcom/patloew/rxlocation/StatusExceptionResumeNextTransformer$$Lambda$1;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/patloew/rxlocation/StatusExceptionResumeNextTransformer$$Lambda$1;

    invoke-direct {v0}, Lcom/patloew/rxlocation/StatusExceptionResumeNextTransformer$$Lambda$1;-><init>()V

    sput-object v0, Lcom/patloew/rxlocation/StatusExceptionResumeNextTransformer$$Lambda$1;->instance:Lcom/patloew/rxlocation/StatusExceptionResumeNextTransformer$$Lambda$1;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static lambdaFactory$()Lio/reactivex/FlowableTransformer;
    .locals 1

    sget-object v0, Lcom/patloew/rxlocation/StatusExceptionResumeNextTransformer$$Lambda$1;->instance:Lcom/patloew/rxlocation/StatusExceptionResumeNextTransformer$$Lambda$1;

    return-object v0
.end method


# virtual methods
.method public apply(Lio/reactivex/Flowable;)Lorg/reactivestreams/Publisher;
    .locals 1

    invoke-static {p1}, Lcom/patloew/rxlocation/StatusExceptionResumeNextTransformer;->lambda$forFlowable$1(Lio/reactivex/Flowable;)Lorg/reactivestreams/Publisher;

    move-result-object v0

    return-object v0
.end method
