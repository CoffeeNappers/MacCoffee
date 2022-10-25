.class public Lru/mail/libverify/utils/d;
.super Ljava/lang/Object;


# static fields
.field private static volatile a:Lru/mail/libverify/utils/LogReceiver;

.field private static volatile b:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field private static volatile c:Lru/mail/libverify/utils/LogReceiver;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    sput-object v0, Lru/mail/libverify/utils/d;->a:Lru/mail/libverify/utils/LogReceiver;

    sput-object v0, Lru/mail/libverify/utils/d;->b:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static a(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    invoke-static {}, Lru/mail/libverify/utils/d;->a()Z

    move-result v0

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    invoke-static {}, Lru/mail/libverify/utils/d;->b()Lru/mail/libverify/utils/LogReceiver;

    move-result-object v0

    invoke-interface {v0, p0, p1}, Lru/mail/libverify/utils/LogReceiver;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1

    invoke-static {}, Lru/mail/libverify/utils/d;->a()Z

    move-result v0

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    invoke-static {}, Lru/mail/libverify/utils/d;->b()Lru/mail/libverify/utils/LogReceiver;

    move-result-object v0

    invoke-interface {v0, p0, p1, p2}, Lru/mail/libverify/utils/LogReceiver;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static varargs a(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 2

    invoke-static {}, Lru/mail/libverify/utils/d;->a()Z

    move-result v0

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {v0, p1, p2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lru/mail/libverify/utils/d;->b()Lru/mail/libverify/utils/LogReceiver;

    move-result-object v1

    invoke-interface {v1, p0, v0}, Lru/mail/libverify/utils/LogReceiver;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static varargs a(Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 2

    invoke-static {}, Lru/mail/libverify/utils/d;->a()Z

    move-result v0

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {v0, p2, p3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lru/mail/libverify/utils/d;->b()Lru/mail/libverify/utils/LogReceiver;

    move-result-object v1

    invoke-interface {v1, p0, v0, p1}, Lru/mail/libverify/utils/LogReceiver;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static a(Lru/mail/libverify/utils/LogReceiver;)V
    .locals 0

    sput-object p0, Lru/mail/libverify/utils/d;->c:Lru/mail/libverify/utils/LogReceiver;

    return-void
.end method

.method private static a()Z
    .locals 1

    sget-object v0, Lru/mail/libverify/utils/d;->c:Lru/mail/libverify/utils/LogReceiver;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static b()Lru/mail/libverify/utils/LogReceiver;
    .locals 3

    sget-object v0, Lru/mail/libverify/utils/d;->a:Lru/mail/libverify/utils/LogReceiver;

    if-nez v0, :cond_1

    const-class v1, Lru/mail/libverify/utils/d;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lru/mail/libverify/utils/d;->a:Lru/mail/libverify/utils/LogReceiver;

    if-nez v0, :cond_0

    sget-object v2, Lru/mail/libverify/utils/d;->c:Lru/mail/libverify/utils/LogReceiver;

    if-eqz v2, :cond_0

    sget-object v0, Lru/mail/libverify/utils/d;->c:Lru/mail/libverify/utils/LogReceiver;

    sput-object v0, Lru/mail/libverify/utils/d;->a:Lru/mail/libverify/utils/LogReceiver;

    :cond_0
    monitor-exit v1

    :cond_1
    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public static b(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    invoke-static {}, Lru/mail/libverify/utils/d;->a()Z

    move-result v0

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    invoke-static {}, Lru/mail/libverify/utils/d;->b()Lru/mail/libverify/utils/LogReceiver;

    move-result-object v0

    invoke-interface {v0, p0, p1}, Lru/mail/libverify/utils/LogReceiver;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1

    invoke-static {}, Lru/mail/libverify/utils/d;->a()Z

    move-result v0

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    invoke-static {}, Lru/mail/libverify/utils/d;->b()Lru/mail/libverify/utils/LogReceiver;

    move-result-object v0

    invoke-interface {v0, p0, p1, p2}, Lru/mail/libverify/utils/LogReceiver;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static varargs b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 2

    invoke-static {}, Lru/mail/libverify/utils/d;->a()Z

    move-result v0

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {v0, p1, p2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lru/mail/libverify/utils/d;->b()Lru/mail/libverify/utils/LogReceiver;

    move-result-object v1

    invoke-interface {v1, p0, v0}, Lru/mail/libverify/utils/LogReceiver;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static varargs b(Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 2

    invoke-static {}, Lru/mail/libverify/utils/d;->a()Z

    move-result v0

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {v0, p2, p3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lru/mail/libverify/utils/d;->b()Lru/mail/libverify/utils/LogReceiver;

    move-result-object v1

    invoke-interface {v1, p0, v0, p1}, Lru/mail/libverify/utils/LogReceiver;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static c(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    invoke-static {}, Lru/mail/libverify/utils/d;->a()Z

    move-result v0

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    invoke-static {}, Lru/mail/libverify/utils/d;->b()Lru/mail/libverify/utils/LogReceiver;

    move-result-object v0

    invoke-interface {v0, p0, p1}, Lru/mail/libverify/utils/LogReceiver;->v(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1

    invoke-static {}, Lru/mail/libverify/utils/d;->a()Z

    move-result v0

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    invoke-static {}, Lru/mail/libverify/utils/d;->b()Lru/mail/libverify/utils/LogReceiver;

    move-result-object v0

    invoke-interface {v0, p0, p1, p2}, Lru/mail/libverify/utils/LogReceiver;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static varargs c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 2

    invoke-static {}, Lru/mail/libverify/utils/d;->a()Z

    move-result v0

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {v0, p1, p2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lru/mail/libverify/utils/d;->b()Lru/mail/libverify/utils/LogReceiver;

    move-result-object v1

    invoke-interface {v1, p0, v0}, Lru/mail/libverify/utils/LogReceiver;->v(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
