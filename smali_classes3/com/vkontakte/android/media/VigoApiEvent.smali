.class public Lcom/vkontakte/android/media/VigoApiEvent;
.super Ljava/lang/Object;
.source "VigoApiEvent.java"


# static fields
.field private static final POOL_SIZE:S = 0x100s

.field private static final pool:Lcom/vkontakte/android/media/VigoPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/media/VigoPool",
            "<",
            "Lcom/vkontakte/android/media/VigoApiEvent;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final apiMeasurements:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Byte;",
            "Lcom/vkontakte/android/media/VigoApiMeasurement;",
            ">;"
        }
    .end annotation
.end field

.field private final inPool:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public info:Lcom/vkontakte/android/media/VigoBinaryBuffer;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 14
    new-instance v0, Lcom/vkontakte/android/media/VigoPool;

    new-instance v1, Lcom/vkontakte/android/media/VigoApiEvent$1;

    invoke-direct {v1}, Lcom/vkontakte/android/media/VigoApiEvent$1;-><init>()V

    const/16 v2, 0x100

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/media/VigoPool;-><init>(Lcom/vkontakte/android/media/VigoPool$ObjectFactory;I)V

    sput-object v0, Lcom/vkontakte/android/media/VigoApiEvent;->pool:Lcom/vkontakte/android/media/VigoPool;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/media/VigoApiEvent;->inPool:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 48
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/media/VigoApiEvent;->apiMeasurements:Ljava/util/Map;

    .line 36
    iget-object v0, p0, Lcom/vkontakte/android/media/VigoApiEvent;->inPool:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 37
    return-void
.end method

.method public static getObject()Lcom/vkontakte/android/media/VigoApiEvent;
    .locals 3

    .prologue
    .line 23
    sget-object v1, Lcom/vkontakte/android/media/VigoApiEvent;->pool:Lcom/vkontakte/android/media/VigoPool;

    invoke-virtual {v1}, Lcom/vkontakte/android/media/VigoPool;->getObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/media/VigoApiEvent;

    .line 24
    .local v0, "obj":Lcom/vkontakte/android/media/VigoApiEvent;
    iget-object v1, v0, Lcom/vkontakte/android/media/VigoApiEvent;->inPool:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 25
    return-object v0
.end method


# virtual methods
.method public reset()V
    .locals 3

    .prologue
    .line 40
    iget-object v1, p0, Lcom/vkontakte/android/media/VigoApiEvent;->apiMeasurements:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/media/VigoApiMeasurement;

    .line 41
    .local v0, "measurement":Lcom/vkontakte/android/media/VigoApiMeasurement;
    invoke-virtual {v0}, Lcom/vkontakte/android/media/VigoApiMeasurement;->returnObject()V

    goto :goto_0

    .line 43
    .end local v0    # "measurement":Lcom/vkontakte/android/media/VigoApiMeasurement;
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/media/VigoApiEvent;->apiMeasurements:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 44
    return-void
.end method

.method public returnObject()V
    .locals 3

    .prologue
    .line 29
    iget-object v0, p0, Lcom/vkontakte/android/media/VigoApiEvent;->inPool:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 30
    invoke-virtual {p0}, Lcom/vkontakte/android/media/VigoApiEvent;->reset()V

    .line 31
    sget-object v0, Lcom/vkontakte/android/media/VigoApiEvent;->pool:Lcom/vkontakte/android/media/VigoPool;

    invoke-virtual {v0, p0}, Lcom/vkontakte/android/media/VigoPool;->setFree(Ljava/lang/Object;)V

    .line 33
    :cond_0
    return-void
.end method
