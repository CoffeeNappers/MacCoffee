.class public final Lru/mail/libverify/sms/h;
.super Ljava/lang/Object;

# interfaces
.implements Lru/mail/libverify/sms/g;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lru/mail/libverify/sms/h$a;
    }
.end annotation


# instance fields
.field final a:Landroid/content/Context;

.field final b:Landroid/os/Handler;

.field private final c:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lru/mail/libverify/sms/g$b;",
            "Lru/mail/libverify/sms/h$a;",
            ">;"
        }
    .end annotation
.end field

.field private final d:Ljava/util/concurrent/ExecutorService;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/os/Handler;Ljava/util/concurrent/ExecutorService;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/os/Handler;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/util/concurrent/ExecutorService;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lru/mail/libverify/sms/h;->c:Ljava/util/Map;

    iput-object p1, p0, Lru/mail/libverify/sms/h;->a:Landroid/content/Context;

    iput-object p2, p0, Lru/mail/libverify/sms/h;->b:Landroid/os/Handler;

    iput-object p3, p0, Lru/mail/libverify/sms/h;->d:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method static a(Ljava/lang/Class;Ljava/lang/Object;Ljava/lang/String;)V
    .locals 2

    const/4 v1, 0x0

    new-array v0, v1, [Ljava/lang/Class;

    invoke-virtual {p0, p2, v0}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {v0, p1, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method final a()Landroid/telephony/TelephonyManager;
    .locals 2

    iget-object v0, p0, Lru/mail/libverify/sms/h;->a:Landroid/content/Context;

    const-string/jumbo v1, "phone"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    return-object v0
.end method

.method public final a(Lru/mail/libverify/sms/g$a;)V
    .locals 2
    .param p1    # Lru/mail/libverify/sms/g$a;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-ge v0, v1, :cond_0

    const-string/jumbo v0, "PhoneCallInterceptor"

    const-string/jumbo v1, "can\'t read calls on api < 16"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/sms/h;->d:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lru/mail/libverify/sms/h$1;

    invoke-direct {v1, p0, p1}, Lru/mail/libverify/sms/h$1;-><init>(Lru/mail/libverify/sms/h;Lru/mail/libverify/sms/g$a;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    goto :goto_0
.end method

.method public final a(Lru/mail/libverify/sms/g$b;)V
    .locals 5

    const/4 v4, 0x0

    iget-object v0, p0, Lru/mail/libverify/sms/h;->a:Landroid/content/Context;

    const-string/jumbo v1, "android.permission.READ_PHONE_STATE"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/m;->b(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "PhoneCallInterceptor"

    const-string/jumbo v1, "can\'t register call listener without %s permission"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const-string/jumbo v3, "android.permission.READ_PHONE_STATE"

    aput-object v3, v2, v4

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/sms/h;->c:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string/jumbo v0, "PhoneCallInterceptor"

    const-string/jumbo v1, "callback has been already registered"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    const-string/jumbo v0, "PhoneCallInterceptor"

    const-string/jumbo v1, "callback registered"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lru/mail/libverify/sms/h$a;

    invoke-direct {v0, p0, v4}, Lru/mail/libverify/sms/h$a;-><init>(Lru/mail/libverify/sms/h;B)V

    invoke-static {v0, p1}, Lru/mail/libverify/sms/h$a;->a(Lru/mail/libverify/sms/h$a;Lru/mail/libverify/sms/g$b;)V

    iget-object v1, p0, Lru/mail/libverify/sms/h;->c:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :try_start_0
    invoke-virtual {p0}, Lru/mail/libverify/sms/h;->a()Landroid/telephony/TelephonyManager;

    move-result-object v1

    const/16 v2, 0x20

    invoke-virtual {v1, v0, v2}, Landroid/telephony/TelephonyManager;->listen(Landroid/telephony/PhoneStateListener;I)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string/jumbo v1, "PhoneCallInterceptor"

    const-string/jumbo v2, "failed to subscribe for a call state"

    invoke-static {v1, v2, v0}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public final b(Lru/mail/libverify/sms/g$b;)V
    .locals 5

    const/4 v4, 0x0

    iget-object v0, p0, Lru/mail/libverify/sms/h;->a:Landroid/content/Context;

    const-string/jumbo v1, "android.permission.READ_PHONE_STATE"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/m;->b(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string/jumbo v0, "PhoneCallInterceptor"

    const-string/jumbo v1, "can\'t unregister call listener without %s permission"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const-string/jumbo v3, "android.permission.READ_PHONE_STATE"

    aput-object v3, v2, v4

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    const-string/jumbo v0, "PhoneCallInterceptor"

    const-string/jumbo v1, "callback unregistered"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lru/mail/libverify/sms/h;->c:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/sms/h$a;

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lru/mail/libverify/sms/h$a;->a(Lru/mail/libverify/sms/h$a;Lru/mail/libverify/sms/g$b;)V

    :try_start_0
    invoke-virtual {p0}, Lru/mail/libverify/sms/h;->a()Landroid/telephony/TelephonyManager;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Landroid/telephony/TelephonyManager;->listen(Landroid/telephony/PhoneStateListener;I)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string/jumbo v1, "PhoneCallInterceptor"

    const-string/jumbo v2, "failed to subscribe for a call state"

    invoke-static {v1, v2, v0}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
