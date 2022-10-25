.class public Lcom/vkontakte/android/media/VigoApiMeasurement;
.super Ljava/lang/Object;
.source "VigoApiMeasurement.java"


# static fields
.field private static final POOL_SIZE:S = 0x10s

.field private static final pool:Lcom/vkontakte/android/media/VigoPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/media/VigoPool",
            "<",
            "Lcom/vkontakte/android/media/VigoApiMeasurement;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public avgErrorApiRequestPt:I

.field public avgErrorApiRequestRtt:I

.field public avgErrorMeasurementCount:I

.field public avgSuccessApiContentLength:J

.field public avgSuccessApiRequestPt:I

.field public avgSuccessApiRequestRtt:I

.field public avgSuccessMeasurementCount:I

.field public failedApiMeasurementCounter:I

.field private final inPool:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 15
    new-instance v0, Lcom/vkontakte/android/media/VigoPool;

    new-instance v1, Lcom/vkontakte/android/media/VigoApiMeasurement$1;

    invoke-direct {v1}, Lcom/vkontakte/android/media/VigoApiMeasurement$1;-><init>()V

    const/16 v2, 0x10

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/media/VigoPool;-><init>(Lcom/vkontakte/android/media/VigoPool$ObjectFactory;I)V

    sput-object v0, Lcom/vkontakte/android/media/VigoApiMeasurement;->pool:Lcom/vkontakte/android/media/VigoPool;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/media/VigoApiMeasurement;->inPool:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-void
.end method

.method public static getObject()Lcom/vkontakte/android/media/VigoApiMeasurement;
    .locals 3

    .prologue
    .line 24
    sget-object v1, Lcom/vkontakte/android/media/VigoApiMeasurement;->pool:Lcom/vkontakte/android/media/VigoPool;

    invoke-virtual {v1}, Lcom/vkontakte/android/media/VigoPool;->getObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/media/VigoApiMeasurement;

    .line 25
    .local v0, "obj":Lcom/vkontakte/android/media/VigoApiMeasurement;
    iget-object v1, v0, Lcom/vkontakte/android/media/VigoApiMeasurement;->inPool:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 26
    return-object v0
.end method


# virtual methods
.method public reset()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 38
    iput v2, p0, Lcom/vkontakte/android/media/VigoApiMeasurement;->avgSuccessApiRequestRtt:I

    .line 39
    iput v2, p0, Lcom/vkontakte/android/media/VigoApiMeasurement;->avgSuccessApiRequestPt:I

    .line 40
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/vkontakte/android/media/VigoApiMeasurement;->avgSuccessApiContentLength:J

    .line 41
    iput v2, p0, Lcom/vkontakte/android/media/VigoApiMeasurement;->avgSuccessMeasurementCount:I

    .line 43
    iput v2, p0, Lcom/vkontakte/android/media/VigoApiMeasurement;->avgErrorApiRequestRtt:I

    .line 44
    iput v2, p0, Lcom/vkontakte/android/media/VigoApiMeasurement;->avgErrorApiRequestPt:I

    .line 45
    iput v2, p0, Lcom/vkontakte/android/media/VigoApiMeasurement;->avgErrorMeasurementCount:I

    .line 47
    iput v2, p0, Lcom/vkontakte/android/media/VigoApiMeasurement;->failedApiMeasurementCounter:I

    .line 48
    return-void
.end method

.method public returnObject()V
    .locals 3

    .prologue
    .line 30
    iget-object v0, p0, Lcom/vkontakte/android/media/VigoApiMeasurement;->inPool:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 31
    invoke-virtual {p0}, Lcom/vkontakte/android/media/VigoApiMeasurement;->reset()V

    .line 32
    sget-object v0, Lcom/vkontakte/android/media/VigoApiMeasurement;->pool:Lcom/vkontakte/android/media/VigoPool;

    invoke-virtual {v0, p0}, Lcom/vkontakte/android/media/VigoPool;->setFree(Ljava/lang/Object;)V

    .line 34
    :cond_0
    return-void
.end method
