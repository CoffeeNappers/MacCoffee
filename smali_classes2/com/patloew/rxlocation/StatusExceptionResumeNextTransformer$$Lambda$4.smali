.class final synthetic Lcom/patloew/rxlocation/StatusExceptionResumeNextTransformer$$Lambda$4;
.super Ljava/lang/Object;

# interfaces
.implements Lio/reactivex/functions/Function;


# static fields
.field private static final instance:Lcom/patloew/rxlocation/StatusExceptionResumeNextTransformer$$Lambda$4;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/patloew/rxlocation/StatusExceptionResumeNextTransformer$$Lambda$4;

    invoke-direct {v0}, Lcom/patloew/rxlocation/StatusExceptionResumeNextTransformer$$Lambda$4;-><init>()V

    sput-object v0, Lcom/patloew/rxlocation/StatusExceptionResumeNextTransformer$$Lambda$4;->instance:Lcom/patloew/rxlocation/StatusExceptionResumeNextTransformer$$Lambda$4;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static lambdaFactory$()Lio/reactivex/functions/Function;
    .locals 1

    sget-object v0, Lcom/patloew/rxlocation/StatusExceptionResumeNextTransformer$$Lambda$4;->instance:Lcom/patloew/rxlocation/StatusExceptionResumeNextTransformer$$Lambda$4;

    return-object v0
.end method


# virtual methods
.method public apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p1}, Lcom/patloew/rxlocation/StatusExceptionResumeNextTransformer;->lambda$null$4(Ljava/lang/Throwable;)Lio/reactivex/SingleSource;

    move-result-object v0

    return-object v0
.end method
