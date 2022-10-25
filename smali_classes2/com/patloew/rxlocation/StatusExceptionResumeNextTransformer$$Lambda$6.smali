.class final synthetic Lcom/patloew/rxlocation/StatusExceptionResumeNextTransformer$$Lambda$6;
.super Ljava/lang/Object;

# interfaces
.implements Lio/reactivex/functions/Function;


# static fields
.field private static final instance:Lcom/patloew/rxlocation/StatusExceptionResumeNextTransformer$$Lambda$6;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/patloew/rxlocation/StatusExceptionResumeNextTransformer$$Lambda$6;

    invoke-direct {v0}, Lcom/patloew/rxlocation/StatusExceptionResumeNextTransformer$$Lambda$6;-><init>()V

    sput-object v0, Lcom/patloew/rxlocation/StatusExceptionResumeNextTransformer$$Lambda$6;->instance:Lcom/patloew/rxlocation/StatusExceptionResumeNextTransformer$$Lambda$6;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static lambdaFactory$()Lio/reactivex/functions/Function;
    .locals 1

    sget-object v0, Lcom/patloew/rxlocation/StatusExceptionResumeNextTransformer$$Lambda$6;->instance:Lcom/patloew/rxlocation/StatusExceptionResumeNextTransformer$$Lambda$6;

    return-object v0
.end method


# virtual methods
.method public apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p1}, Lcom/patloew/rxlocation/StatusExceptionResumeNextTransformer;->lambda$null$0(Ljava/lang/Throwable;)Lorg/reactivestreams/Publisher;

    move-result-object v0

    return-object v0
.end method
