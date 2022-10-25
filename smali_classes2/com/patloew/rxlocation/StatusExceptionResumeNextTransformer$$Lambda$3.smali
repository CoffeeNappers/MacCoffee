.class final synthetic Lcom/patloew/rxlocation/StatusExceptionResumeNextTransformer$$Lambda$3;
.super Ljava/lang/Object;

# interfaces
.implements Lio/reactivex/SingleTransformer;


# static fields
.field private static final instance:Lcom/patloew/rxlocation/StatusExceptionResumeNextTransformer$$Lambda$3;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/patloew/rxlocation/StatusExceptionResumeNextTransformer$$Lambda$3;

    invoke-direct {v0}, Lcom/patloew/rxlocation/StatusExceptionResumeNextTransformer$$Lambda$3;-><init>()V

    sput-object v0, Lcom/patloew/rxlocation/StatusExceptionResumeNextTransformer$$Lambda$3;->instance:Lcom/patloew/rxlocation/StatusExceptionResumeNextTransformer$$Lambda$3;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static lambdaFactory$()Lio/reactivex/SingleTransformer;
    .locals 1

    sget-object v0, Lcom/patloew/rxlocation/StatusExceptionResumeNextTransformer$$Lambda$3;->instance:Lcom/patloew/rxlocation/StatusExceptionResumeNextTransformer$$Lambda$3;

    return-object v0
.end method


# virtual methods
.method public apply(Lio/reactivex/Single;)Lio/reactivex/SingleSource;
    .locals 1

    invoke-static {p1}, Lcom/patloew/rxlocation/StatusExceptionResumeNextTransformer;->lambda$forSingle$5(Lio/reactivex/Single;)Lio/reactivex/SingleSource;

    move-result-object v0

    return-object v0
.end method
