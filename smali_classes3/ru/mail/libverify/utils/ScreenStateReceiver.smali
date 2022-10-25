.class public Lru/mail/libverify/utils/ScreenStateReceiver;
.super Landroid/content/BroadcastReceiver;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lru/mail/libverify/utils/ScreenStateReceiver$a;
    }
.end annotation


# static fields
.field private static final a:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lru/mail/libverify/utils/ScreenStateReceiver$a;",
            ">;"
        }
    .end annotation
.end field

.field private static volatile b:Landroid/os/PowerManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    sput-object v0, Lru/mail/libverify/utils/ScreenStateReceiver;->a:Ljava/util/concurrent/atomic/AtomicReference;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method public static a(Landroid/content/Context;)V
    .locals 3
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Landroid/content/IntentFilter;

    const-string/jumbo v1, "android.intent.action.SCREEN_ON"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const-string/jumbo v1, "android.intent.action.SCREEN_OFF"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    new-instance v1, Lru/mail/libverify/utils/ScreenStateReceiver;

    invoke-direct {v1}, Lru/mail/libverify/utils/ScreenStateReceiver;-><init>()V

    :try_start_0
    invoke-virtual {p0, v1, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string/jumbo v1, "ScreenStateReceiver"

    const-string/jumbo v2, "failed to register receiver"

    invoke-static {v1, v2, v0}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static b(Landroid/content/Context;)Lru/mail/libverify/utils/k;
    .locals 9
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const-wide/16 v2, 0x0

    const/4 v6, 0x0

    const/4 v5, 0x1

    const/4 v8, 0x0

    invoke-static {p0}, Lru/mail/libverify/utils/ScreenStateReceiver;->c(Landroid/content/Context;)Landroid/os/PowerManager;

    move-result-object v0

    if-nez v0, :cond_0

    move v0, v5

    :goto_0
    if-eqz v0, :cond_2

    new-instance v0, Lru/mail/libverify/utils/k;

    invoke-direct {v0, v5, v6}, Lru/mail/libverify/utils/k;-><init>(ZLjava/lang/Long;)V

    :goto_1
    const-string/jumbo v1, "ScreenStateReceiver"

    const-string/jumbo v2, "current state %s"

    new-array v3, v5, [Ljava/lang/Object;

    aput-object v0, v3, v8

    invoke-static {v1, v2, v3}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    return-object v0

    :cond_0
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x14

    if-lt v1, v4, :cond_1

    invoke-virtual {v0}, Landroid/os/PowerManager;->isInteractive()Z

    move-result v0

    goto :goto_0

    :cond_1
    invoke-virtual {v0}, Landroid/os/PowerManager;->isScreenOn()Z

    move-result v0

    goto :goto_0

    :cond_2
    sget-object v0, Lru/mail/libverify/utils/ScreenStateReceiver;->a:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/utils/ScreenStateReceiver$a;

    if-eqz v0, :cond_3

    iget-boolean v1, v0, Lru/mail/libverify/utils/ScreenStateReceiver$a;->a:Z

    if-eqz v1, :cond_4

    :cond_3
    new-instance v0, Lru/mail/libverify/utils/k;

    invoke-direct {v0, v8, v6}, Lru/mail/libverify/utils/k;-><init>(ZLjava/lang/Long;)V

    goto :goto_1

    :cond_4
    new-instance v4, Lru/mail/libverify/utils/k;

    iget-wide v0, v0, Lru/mail/libverify/utils/ScreenStateReceiver$a;->b:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    sub-long v0, v6, v0

    cmp-long v6, v0, v2

    if-gez v6, :cond_5

    move-wide v0, v2

    :cond_5
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-direct {v4, v8, v0}, Lru/mail/libverify/utils/k;-><init>(ZLjava/lang/Long;)V

    move-object v0, v4

    goto :goto_1
.end method

.method private static c(Landroid/content/Context;)Landroid/os/PowerManager;
    .locals 2
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    sget-object v0, Lru/mail/libverify/utils/ScreenStateReceiver;->b:Landroid/os/PowerManager;

    if-nez v0, :cond_1

    const-class v1, Lru/mail/libverify/utils/ScreenStateReceiver;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lru/mail/libverify/utils/ScreenStateReceiver;->b:Landroid/os/PowerManager;

    if-nez v0, :cond_0

    const-string/jumbo v0, "power"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    sput-object v0, Lru/mail/libverify/utils/ScreenStateReceiver;->b:Landroid/os/PowerManager;

    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    sget-object v0, Lru/mail/libverify/utils/ScreenStateReceiver;->b:Landroid/os/PowerManager;

    return-object v0

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 5

    if-eqz p2, :cond_0

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x0

    :goto_0
    sget-object v1, Lru/mail/libverify/utils/ScreenStateReceiver;->a:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    const-string/jumbo v1, "ScreenStateReceiver"

    const-string/jumbo v2, "received state %s"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    invoke-static {v1, v2, v3}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_1
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "android.intent.action.SCREEN_ON"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    new-instance v0, Lru/mail/libverify/utils/ScreenStateReceiver$a;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-direct {v0, v1, v2, v3}, Lru/mail/libverify/utils/ScreenStateReceiver$a;-><init>(ZJ)V

    goto :goto_0
.end method
