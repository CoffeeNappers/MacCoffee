.class public final Lio/sentry/jvmti/FrameCache;
.super Ljava/lang/Object;
.source "FrameCache.java"


# static fields
.field private static result:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Ljava/util/WeakHashMap",
            "<",
            "Ljava/lang/Throwable;",
            "[",
            "Lio/sentry/jvmti/Frame;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 11
    new-instance v0, Lio/sentry/jvmti/FrameCache$1;

    invoke-direct {v0}, Lio/sentry/jvmti/FrameCache$1;-><init>()V

    sput-object v0, Lio/sentry/jvmti/FrameCache;->result:Ljava/lang/ThreadLocal;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    return-void
.end method

.method public static add(Ljava/lang/Throwable;[Lio/sentry/jvmti/Frame;)V
    .locals 2
    .param p0, "throwable"    # Ljava/lang/Throwable;
    .param p1, "frames"    # [Lio/sentry/jvmti/Frame;

    .prologue
    .line 33
    sget-object v1, Lio/sentry/jvmti/FrameCache;->result:Ljava/lang/ThreadLocal;

    invoke-virtual {v1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    .line 34
    .local v0, "weakMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Throwable;[Lio/sentry/jvmti/Frame;>;"
    invoke-interface {v0, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    return-void
.end method

.method public static get(Ljava/lang/Throwable;)[Lio/sentry/jvmti/Frame;
    .locals 2
    .param p0, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 44
    sget-object v1, Lio/sentry/jvmti/FrameCache;->result:Ljava/lang/ThreadLocal;

    invoke-virtual {v1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    .line 45
    .local v0, "weakMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Throwable;[Lio/sentry/jvmti/Frame;>;"
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lio/sentry/jvmti/Frame;

    return-object v1
.end method
