.class public final Lru/mail/libverify/storage/m;
.super Ljava/lang/Object;

# interfaces
.implements Lru/mail/libverify/storage/l;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lru/mail/libverify/storage/m$a;
    }
.end annotation


# static fields
.field private static final a:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final b:Lru/mail/libverify/storage/m$a;

.field private c:Ljava/lang/String;

.field private volatile d:Ljava/lang/String;

.field private volatile e:Lru/mail/libverify/storage/c;

.field private volatile f:Landroid/content/Context;

.field private volatile g:Lru/mail/libverify/storage/u;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private volatile h:Lru/mail/libverify/storage/o;

.field private volatile i:Ljava/lang/String;

.field private volatile j:Ljava/lang/String;

.field private volatile k:Lru/mail/libverify/storage/p;

.field private volatile l:Lru/mail/libverify/accounts/d;

.field private volatile m:Lru/mail/libverify/storage/r;

.field private volatile n:Lru/mail/libverify/accounts/b;

.field private volatile o:Lru/mail/libverify/sms/c;

.field private volatile p:Ljava/util/Locale;

.field private volatile q:Ljava/lang/String;

.field private volatile r:Lru/mail/libverify/storage/n;

.field private volatile s:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private volatile t:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lru/mail/libverify/storage/m;->a:Ljava/util/HashMap;

    const-string/jumbo v1, "instance_broadcast_on_demand"

    const-string/jumbo v2, "1"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lru/mail/libverify/storage/m;->a:Ljava/util/HashMap;

    const-string/jumbo v1, "instance_intercept_sms"

    const-string/jumbo v2, "0"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lru/mail/libverify/storage/m;->a:Ljava/util/HashMap;

    const-string/jumbo v1, "instance_single_fetcher"

    const-string/jumbo v2, "1"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lru/mail/libverify/storage/m;->a:Ljava/util/HashMap;

    const-string/jumbo v1, "instance_safety_net"

    const-string/jumbo v2, "1"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lru/mail/libverify/storage/m;->a:Ljava/util/HashMap;

    const-string/jumbo v1, "instance_account_check_sms"

    const-string/jumbo v2, "0"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lru/mail/libverify/storage/m;->a:Ljava/util/HashMap;

    const-string/jumbo v1, "instance_track_package"

    const-string/jumbo v2, "0"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lru/mail/libverify/storage/m;->a:Ljava/util/HashMap;

    const-string/jumbo v1, "instance_send_call_stats"

    const-string/jumbo v2, "1"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lru/mail/libverify/storage/m;->a:Ljava/util/HashMap;

    const-string/jumbo v1, "instance_update_alarms"

    const-string/jumbo v2, "1"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lru/mail/libverify/storage/m;->a:Ljava/util/HashMap;

    const-string/jumbo v1, "instance_background_verify"

    const-string/jumbo v2, "1"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lru/mail/libverify/storage/m$a;

    invoke-direct {v0, p0, v1}, Lru/mail/libverify/storage/m$a;-><init>(Lru/mail/libverify/storage/m;B)V

    iput-object v0, p0, Lru/mail/libverify/storage/m;->b:Lru/mail/libverify/storage/m$a;

    iput-boolean v1, p0, Lru/mail/libverify/storage/m;->t:Z

    iput-object p1, p0, Lru/mail/libverify/storage/m;->f:Landroid/content/Context;

    new-instance v0, Lru/mail/libverify/storage/t;

    iget-object v1, p0, Lru/mail/libverify/storage/m;->b:Lru/mail/libverify/storage/m$a;

    invoke-direct {v0, v1}, Lru/mail/libverify/storage/t;-><init>(Lru/mail/libverify/storage/c$a;)V

    iput-object v0, p0, Lru/mail/libverify/storage/m;->e:Lru/mail/libverify/storage/c;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lru/mail/libverify/storage/m$a;

    invoke-direct {v0, p0, v1}, Lru/mail/libverify/storage/m$a;-><init>(Lru/mail/libverify/storage/m;B)V

    iput-object v0, p0, Lru/mail/libverify/storage/m;->b:Lru/mail/libverify/storage/m$a;

    iput-boolean v1, p0, Lru/mail/libverify/storage/m;->t:Z

    iput-object p1, p0, Lru/mail/libverify/storage/m;->f:Landroid/content/Context;

    new-instance v0, Lru/mail/libverify/storage/f;

    iget-object v1, p0, Lru/mail/libverify/storage/m;->b:Lru/mail/libverify/storage/m$a;

    invoke-direct {v0, v1, p2, p3}, Lru/mail/libverify/storage/f;-><init>(Lru/mail/libverify/storage/c$a;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lru/mail/libverify/storage/m;->e:Lru/mail/libverify/storage/c;

    return-void
.end method

.method public static N()Ljava/lang/String;
    .locals 1

    const-string/jumbo v0, "297109036349"

    return-object v0
.end method

.method private O()Lru/mail/libverify/storage/r;
    .locals 2

    iget-object v0, p0, Lru/mail/libverify/storage/m;->m:Lru/mail/libverify/storage/r;

    if-nez v0, :cond_1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lru/mail/libverify/storage/m;->m:Lru/mail/libverify/storage/r;

    if-nez v0, :cond_0

    new-instance v0, Lru/mail/libverify/storage/r;

    invoke-virtual {p0}, Lru/mail/libverify/storage/m;->z()Lru/mail/libverify/storage/o;

    move-result-object v1

    invoke-direct {v0, v1}, Lru/mail/libverify/storage/r;-><init>(Lru/mail/libverify/storage/o;)V

    iput-object v0, p0, Lru/mail/libverify/storage/m;->m:Lru/mail/libverify/storage/r;

    :cond_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    iget-object v0, p0, Lru/mail/libverify/storage/m;->m:Lru/mail/libverify/storage/r;

    return-object v0

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method private P()V
    .locals 2

    iget-object v0, p0, Lru/mail/libverify/storage/m;->e:Lru/mail/libverify/storage/c;

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "param field must be initialized"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    return-void
.end method

.method private Q()Ljava/util/Map;
    .locals 3
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lru/mail/libverify/storage/m;->s:Ljava/util/Map;

    if-eqz v0, :cond_0

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lru/mail/libverify/storage/m;->z()Lru/mail/libverify/storage/o;

    move-result-object v0

    const-string/jumbo v1, "instance_api_endpoints"

    invoke-interface {v0, v1}, Lru/mail/libverify/storage/o;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/storage/m;->s:Ljava/util/Map;

    if-nez v1, :cond_2

    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lru/mail/libverify/storage/m;->s:Ljava/util/Map;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_1

    :try_start_1
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_3

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lru/mail/libverify/storage/m;->s:Ljava/util/Map;
    :try_end_1
    .catch Lru/mail/libverify/utils/json/JsonParseException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_1
    :goto_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :cond_2
    iget-object v0, p0, Lru/mail/libverify/storage/m;->s:Ljava/util/Map;

    goto :goto_0

    :cond_3
    :try_start_3
    const-class v1, Ljava/lang/String;

    invoke-static {v0, v1}, Lru/mail/libverify/utils/json/a;->c(Ljava/lang/String;Ljava/lang/Class;)Ljava/util/HashMap;

    move-result-object v0

    iput-object v0, p0, Lru/mail/libverify/storage/m;->s:Ljava/util/Map;
    :try_end_3
    .catch Lru/mail/libverify/utils/json/JsonParseException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1

    :catch_0
    move-exception v0

    :try_start_4
    const-string/jumbo v1, "InstanceData"

    const-string/jumbo v2, "failed to restore api endpoints"

    invoke-static {v1, v2, v0}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-virtual {p0}, Lru/mail/libverify/storage/m;->z()Lru/mail/libverify/storage/o;

    move-result-object v0

    const-string/jumbo v1, "instance_api_endpoints"

    invoke-interface {v0, v1}, Lru/mail/libverify/storage/o;->d(Ljava/lang/String;)Lru/mail/libverify/storage/o;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/o;->a()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lru/mail/libverify/storage/m;->s:Ljava/util/Map;

    goto :goto_1

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw v0
.end method

.method private R()Ljava/lang/String;
    .locals 4
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    const-string/jumbo v0, "InstanceData"

    const-string/jumbo v1, "getAdvertisingId - query android id"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_0
    iget-object v0, p0, Lru/mail/libverify/storage/m;->f:Landroid/content/Context;

    invoke-static {v0}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;->getAdvertisingIdInfo(Landroid/content/Context;)Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;->isLimitAdTrackingEnabled()Z

    move-result v1

    if-nez v1, :cond_1

    invoke-virtual {v0}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lru/mail/libverify/storage/m;->z()Lru/mail/libverify/storage/o;

    move-result-object v0

    const-string/jumbo v1, "instance_advertising_id"

    invoke-interface {v0, v1}, Lru/mail/libverify/storage/o;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lru/mail/libverify/storage/m;->z()Lru/mail/libverify/storage/o;

    move-result-object v1

    const-string/jumbo v2, "instance_advertising_id"

    invoke-virtual {v0}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;->getId()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lru/mail/libverify/storage/o;->a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/storage/o;

    move-result-object v1

    invoke-interface {v1}, Lru/mail/libverify/storage/o;->a()V

    invoke-virtual {v0}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;->getId()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_1
    const-string/jumbo v0, "InstanceData"

    const-string/jumbo v1, "getAdvertisingId - Google Play AdvertisingId usage blocked by a user"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/google/android/gms/common/GooglePlayServicesNotAvailableException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lcom/google/android/gms/common/GooglePlayServicesRepairableException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3

    :goto_1
    const/4 v0, 0x0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string/jumbo v1, "InstanceData"

    const-string/jumbo v2, "getAdvertisingId - Google Play services is not available entirely"

    invoke-static {v1, v2, v0}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    :catch_1
    move-exception v0

    const-string/jumbo v1, "InstanceData"

    const-string/jumbo v2, "getAdvertisingId - error"

    invoke-static {v1, v2, v0}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    :catch_2
    move-exception v0

    const-string/jumbo v1, "InstanceData"

    const-string/jumbo v2, "getAdvertisingId - Unrecoverable error connecting to Google Play services (e.g.,\nthe old version of the service doesn\'t support getting AdvertisingId)"

    invoke-static {v1, v2, v0}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    :catch_3
    move-exception v0

    const-string/jumbo v1, "InstanceData"

    const-string/jumbo v2, "getAdvertisingId - unknown error"

    invoke-static {v1, v2, v0}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method private a(Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Boolean;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    if-nez p2, :cond_0

    :goto_0
    return-void

    :cond_0
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lru/mail/libverify/storage/m;->z()Lru/mail/libverify/storage/o;

    move-result-object v0

    const-string/jumbo v1, "1"

    invoke-interface {v0, p1, v1}, Lru/mail/libverify/storage/o;->a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/storage/o;

    :goto_1
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    invoke-direct {p0, p1, v0}, Lru/mail/libverify/storage/m;->a(Ljava/lang/String;Z)V

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lru/mail/libverify/storage/m;->z()Lru/mail/libverify/storage/o;

    move-result-object v0

    const-string/jumbo v1, "0"

    invoke-interface {v0, p1, v1}, Lru/mail/libverify/storage/o;->a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/storage/o;

    goto :goto_1
.end method

.method private a(Ljava/lang/String;Z)V
    .locals 3
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v2, 0x4

    const/4 v1, -0x1

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    :cond_0
    move v0, v1

    :goto_0
    packed-switch v0, :pswitch_data_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    :sswitch_0
    const-string/jumbo v0, "instance_broadcast_on_demand"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :sswitch_1
    const-string/jumbo v0, "instance_intercept_sms"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :sswitch_2
    const-string/jumbo v0, "instance_update_alarms"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x2

    goto :goto_0

    :sswitch_3
    const-string/jumbo v0, "instance_background_verify"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x3

    goto :goto_0

    :sswitch_4
    const-string/jumbo v0, "instance_single_fetcher"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    move v0, v2

    goto :goto_0

    :sswitch_5
    const-string/jumbo v0, "instance_safety_net"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x5

    goto :goto_0

    :sswitch_6
    const-string/jumbo v0, "instance_account_check_sms"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x6

    goto :goto_0

    :sswitch_7
    const-string/jumbo v0, "instance_track_package"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x7

    goto :goto_0

    :sswitch_8
    const-string/jumbo v0, "instance_send_call_stats"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0x8

    goto :goto_0

    :pswitch_0
    if-eqz p2, :cond_2

    iget-object v0, p0, Lru/mail/libverify/storage/m;->f:Landroid/content/Context;

    invoke-static {v0, p0}, Lru/mail/libverify/storage/e;->a(Landroid/content/Context;Ljava/lang/Object;)V

    :cond_1
    :goto_1
    :pswitch_1
    return-void

    :cond_2
    iget-object v0, p0, Lru/mail/libverify/storage/m;->f:Landroid/content/Context;

    invoke-static {v0, p0, v1}, Lru/mail/libverify/storage/e;->a(Landroid/content/Context;Ljava/lang/Object;I)V

    goto :goto_1

    :pswitch_2
    if-eqz p2, :cond_3

    const-string/jumbo v0, "instance_broadcast_on_demand"

    invoke-direct {p0, v0}, Lru/mail/libverify/storage/m;->c(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lru/mail/libverify/storage/m;->f:Landroid/content/Context;

    const-class v1, Lru/mail/libverify/sms/IncomingSmsReceiver;

    invoke-static {v0, v1, v2}, Lru/mail/libverify/storage/e;->a(Landroid/content/Context;Ljava/lang/Object;I)V

    goto :goto_1

    :cond_3
    const-string/jumbo v0, "instance_broadcast_on_demand"

    invoke-direct {p0, v0}, Lru/mail/libverify/storage/m;->c(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lru/mail/libverify/storage/m;->f:Landroid/content/Context;

    const-class v1, Lru/mail/libverify/sms/IncomingSmsReceiver;

    invoke-static {v0, v1}, Lru/mail/libverify/storage/e;->a(Landroid/content/Context;Ljava/lang/Object;)V

    goto :goto_1

    :pswitch_3
    if-eqz p2, :cond_4

    const-string/jumbo v0, "instance_broadcast_on_demand"

    invoke-direct {p0, v0}, Lru/mail/libverify/storage/m;->c(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lru/mail/libverify/storage/m;->f:Landroid/content/Context;

    const-class v1, Lru/mail/libverify/utils/SystemRestartReceiver;

    const/16 v2, 0x20

    invoke-static {v0, v1, v2}, Lru/mail/libverify/storage/e;->a(Landroid/content/Context;Ljava/lang/Object;I)V

    goto :goto_1

    :cond_4
    const-string/jumbo v0, "instance_broadcast_on_demand"

    invoke-direct {p0, v0}, Lru/mail/libverify/storage/m;->c(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lru/mail/libverify/storage/m;->f:Landroid/content/Context;

    const-class v1, Lru/mail/libverify/utils/SystemRestartReceiver;

    invoke-static {v0, v1}, Lru/mail/libverify/storage/e;->a(Landroid/content/Context;Ljava/lang/Object;)V

    goto :goto_1

    nop

    :sswitch_data_0
    .sparse-switch
        -0x42d4fb15 -> :sswitch_8
        -0x33b603fd -> :sswitch_0
        -0x21b63f66 -> :sswitch_5
        0xab90e4e -> :sswitch_2
        0x28ab2cda -> :sswitch_4
        0x329e8f28 -> :sswitch_7
        0x41bc0380 -> :sswitch_3
        0x4bc51a32 -> :sswitch_1
        0x7011e0e6 -> :sswitch_6
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_2
        :pswitch_3
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method public static a(Landroid/content/Context;)Z
    .locals 1
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-static {p0}, Lru/mail/libverify/storage/i;->b(Landroid/content/Context;)Z

    move-result v0

    return v0
.end method

.method public static a(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 3
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    invoke-static {p0}, Lru/mail/libverify/storage/s;->b(Landroid/content/Context;)Lru/mail/libverify/requests/response/SmsInfo;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lru/mail/libverify/requests/response/SmsInfo;->getSourceNumbers()Ljava/util/Set;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Lru/mail/libverify/requests/response/SmsInfo;->getSourceNumbers()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method

.method static synthetic a(Lru/mail/libverify/storage/m;)Z
    .locals 1

    const-string/jumbo v0, "instance_broadcast_on_demand"

    invoke-direct {p0, v0}, Lru/mail/libverify/storage/m;->c(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static synthetic b(Lru/mail/libverify/storage/m;)Z
    .locals 1

    const-string/jumbo v0, "instance_intercept_sms"

    invoke-direct {p0, v0}, Lru/mail/libverify/storage/m;->c(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private c(Ljava/lang/String;)Z
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-virtual {p0}, Lru/mail/libverify/storage/m;->z()Lru/mail/libverify/storage/o;

    move-result-object v0

    invoke-interface {v0, p1}, Lru/mail/libverify/storage/o;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    sget-object v0, Lru/mail/libverify/storage/m;->a:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    const-string/jumbo v1, "1"

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const-string/jumbo v1, "1"

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    goto :goto_0
.end method

.method static synthetic c(Lru/mail/libverify/storage/m;)Z
    .locals 1

    const-string/jumbo v0, "instance_single_fetcher"

    invoke-direct {p0, v0}, Lru/mail/libverify/storage/m;->c(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static synthetic d(Lru/mail/libverify/storage/m;)Z
    .locals 1

    const-string/jumbo v0, "instance_safety_net"

    invoke-direct {p0, v0}, Lru/mail/libverify/storage/m;->c(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static synthetic e(Lru/mail/libverify/storage/m;)Z
    .locals 1

    const-string/jumbo v0, "instance_account_check_sms"

    invoke-direct {p0, v0}, Lru/mail/libverify/storage/m;->c(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static synthetic f(Lru/mail/libverify/storage/m;)Z
    .locals 1

    const-string/jumbo v0, "instance_track_package"

    invoke-direct {p0, v0}, Lru/mail/libverify/storage/m;->c(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static synthetic g(Lru/mail/libverify/storage/m;)Z
    .locals 1

    const-string/jumbo v0, "instance_send_call_stats"

    invoke-direct {p0, v0}, Lru/mail/libverify/storage/m;->c(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static synthetic h(Lru/mail/libverify/storage/m;)Z
    .locals 1

    const-string/jumbo v0, "instance_update_alarms"

    invoke-direct {p0, v0}, Lru/mail/libverify/storage/m;->c(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static synthetic i(Lru/mail/libverify/storage/m;)Z
    .locals 1

    const-string/jumbo v0, "instance_background_verify"

    invoke-direct {p0, v0}, Lru/mail/libverify/storage/m;->c(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method


# virtual methods
.method public final A()V
    .locals 5

    const-string/jumbo v0, "InstanceData"

    const-string/jumbo v1, "prepare internal members"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lru/mail/libverify/storage/m;->f:Landroid/content/Context;

    invoke-static {v0}, Lru/mail/libverify/utils/ScreenStateReceiver;->a(Landroid/content/Context;)V

    iget-object v0, p0, Lru/mail/libverify/storage/m;->f:Landroid/content/Context;

    invoke-static {v0}, Lru/mail/libverify/storage/i;->a(Landroid/content/Context;)Ljava/lang/String;

    invoke-virtual {p0}, Lru/mail/libverify/storage/m;->g()Ljava/lang/String;

    invoke-virtual {p0}, Lru/mail/libverify/storage/m;->h()Ljava/lang/String;

    invoke-virtual {p0}, Lru/mail/libverify/storage/m;->n()Landroid/location/Location;

    invoke-virtual {p0}, Lru/mail/libverify/storage/m;->b()Ljava/lang/String;

    invoke-direct {p0}, Lru/mail/libverify/storage/m;->O()Lru/mail/libverify/storage/r;

    move-result-object v0

    invoke-virtual {v0}, Lru/mail/libverify/storage/r;->a()Ljava/lang/String;

    sget-object v0, Lru/mail/libverify/storage/m;->a:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-direct {p0, v0}, Lru/mail/libverify/storage/m;->c(Ljava/lang/String;)Z

    move-result v2

    invoke-direct {p0, v0, v2}, Lru/mail/libverify/storage/m;->a(Ljava/lang/String;Z)V

    goto :goto_0

    :cond_0
    const-string/jumbo v0, "InstanceData"

    const-string/jumbo v1, "current features:\n %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const/4 v4, 0x0

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method public final B()V
    .locals 1

    invoke-virtual {p0}, Lru/mail/libverify/storage/m;->z()Lru/mail/libverify/storage/o;

    move-result-object v0

    invoke-static {v0}, Lru/mail/libverify/gcm/GcmRegisterService;->a(Lru/mail/libverify/storage/o;)V

    return-void
.end method

.method public final C()Z
    .locals 2

    iget-object v0, p0, Lru/mail/libverify/storage/m;->f:Landroid/content/Context;

    invoke-virtual {p0}, Lru/mail/libverify/storage/m;->z()Lru/mail/libverify/storage/o;

    move-result-object v1

    invoke-static {v0, v1}, Lru/mail/libverify/gcm/GcmRegisterService;->a(Landroid/content/Context;Lru/mail/libverify/storage/o;)Z

    move-result v0

    return v0
.end method

.method public final D()V
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/storage/m;->f:Landroid/content/Context;

    invoke-static {v0}, Lru/mail/libverify/utils/AlarmReceiver;->b(Landroid/content/Context;)V

    return-void
.end method

.method public final E()V
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/storage/m;->f:Landroid/content/Context;

    invoke-static {v0}, Lru/mail/libverify/utils/AlarmReceiver;->e(Landroid/content/Context;)V

    return-void
.end method

.method public final F()V
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/storage/m;->f:Landroid/content/Context;

    invoke-static {v0}, Lru/mail/libverify/utils/AlarmReceiver;->a(Landroid/content/Context;)V

    return-void
.end method

.method public final G()Lru/mail/libverify/storage/k;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    new-instance v0, Lru/mail/libverify/storage/h;

    invoke-direct {v0, p0}, Lru/mail/libverify/storage/h;-><init>(Lru/mail/libverify/storage/k;)V

    return-object v0
.end method

.method public final H()V
    .locals 0

    invoke-static {}, Lru/mail/libverify/utils/VerificationService;->a()V

    return-void
.end method

.method public final I()V
    .locals 3

    const-string/jumbo v0, "instance_broadcast_on_demand"

    invoke-direct {p0, v0}, Lru/mail/libverify/storage/m;->c(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/storage/m;->f:Landroid/content/Context;

    const-class v1, Lru/mail/libverify/fetcher/FetcherService;

    const/16 v2, 0x38

    invoke-static {v0, v1, v2}, Lru/mail/libverify/storage/e;->a(Landroid/content/Context;Ljava/lang/Object;I)V

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/storage/m;->f:Landroid/content/Context;

    invoke-static {v0}, Lru/mail/libverify/fetcher/FetcherService;->a(Landroid/content/Context;)V

    return-void
.end method

.method public final J()V
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/storage/m;->f:Landroid/content/Context;

    invoke-static {v0}, Lru/mail/libverify/utils/network/NetworkCheckService;->a(Landroid/content/Context;)V

    return-void
.end method

.method public final K()Lru/mail/libverify/storage/n;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-object v0, p0, Lru/mail/libverify/storage/m;->r:Lru/mail/libverify/storage/n;

    if-nez v0, :cond_1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lru/mail/libverify/storage/m;->r:Lru/mail/libverify/storage/n;

    if-nez v0, :cond_0

    new-instance v0, Lru/mail/libverify/storage/m$1;

    invoke-direct {v0, p0}, Lru/mail/libverify/storage/m$1;-><init>(Lru/mail/libverify/storage/m;)V

    iput-object v0, p0, Lru/mail/libverify/storage/m;->r:Lru/mail/libverify/storage/n;

    :cond_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    iget-object v0, p0, Lru/mail/libverify/storage/m;->r:Lru/mail/libverify/storage/n;

    return-object v0

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public final L()Lru/mail/libverify/requests/response/SmsInfo;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lru/mail/libverify/storage/m;->f:Landroid/content/Context;

    invoke-static {v0}, Lru/mail/libverify/storage/s;->b(Landroid/content/Context;)Lru/mail/libverify/requests/response/SmsInfo;

    move-result-object v0

    return-object v0
.end method

.method public final M()Z
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/storage/m;->f:Landroid/content/Context;

    invoke-static {v0}, Lru/mail/libverify/storage/s;->a(Landroid/content/Context;)Z

    move-result v0

    return v0
.end method

.method public final a()Ljava/lang/String;
    .locals 1

    invoke-direct {p0}, Lru/mail/libverify/storage/m;->P()V

    iget-object v0, p0, Lru/mail/libverify/storage/m;->e:Lru/mail/libverify/storage/c;

    invoke-virtual {v0}, Lru/mail/libverify/storage/c;->a()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0}, Lru/mail/libverify/storage/m;->O()Lru/mail/libverify/storage/r;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lru/mail/libverify/storage/r;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final a(Ljava/lang/String;)Lru/mail/libverify/utils/a;
    .locals 6
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v5, 0x0

    :try_start_0
    invoke-direct {p0}, Lru/mail/libverify/storage/m;->Q()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    move-object v2, p1

    :goto_0
    :try_start_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/CharSequence;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/CharSequence;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/CharSequence;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    invoke-virtual {v2, v1, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v0

    :goto_1
    move-object v2, v0

    goto :goto_0

    :catch_0
    move-exception v0

    move-object v2, p1

    :goto_2
    const-string/jumbo v1, "InstanceData"

    const-string/jumbo v3, "failed to replace token in url %s"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    aput-object v2, v4, v5

    invoke-static {v1, v0, v3, v4}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    :goto_3
    new-instance v0, Lru/mail/libverify/utils/f$a;

    invoke-direct {v0, v2, v5}, Lru/mail/libverify/utils/f$a;-><init>(Ljava/lang/String;B)V

    return-object v0

    :catch_1
    move-exception v0

    goto :goto_2

    :cond_1
    move-object v0, v2

    goto :goto_1

    :cond_2
    move-object v2, p1

    goto :goto_3
.end method

.method public final a(I)V
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/storage/m;->f:Landroid/content/Context;

    invoke-static {v0, p1}, Lru/mail/libverify/utils/AlarmReceiver;->a(Landroid/content/Context;I)V

    return-void
.end method

.method public final a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iput-object p1, p0, Lru/mail/libverify/storage/m;->f:Landroid/content/Context;

    new-instance v0, Lru/mail/libverify/storage/f;

    iget-object v1, p0, Lru/mail/libverify/storage/m;->b:Lru/mail/libverify/storage/m$a;

    invoke-direct {v0, v1, p2, p3}, Lru/mail/libverify/storage/f;-><init>(Lru/mail/libverify/storage/c$a;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lru/mail/libverify/storage/m;->e:Lru/mail/libverify/storage/c;

    iget-object v0, p0, Lru/mail/libverify/storage/m;->g:Lru/mail/libverify/storage/u;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lru/mail/libverify/storage/u;->a()V

    :cond_0
    return-void
.end method

.method public final a(Ljava/lang/Object;)V
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-static {p1}, Lru/mail/libverify/utils/VerificationService;->a(Ljava/lang/Object;)V

    const-string/jumbo v0, "instance_broadcast_on_demand"

    invoke-direct {p0, v0}, Lru/mail/libverify/storage/m;->c(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/storage/m;->f:Landroid/content/Context;

    invoke-static {v0, p1}, Lru/mail/libverify/storage/e;->a(Landroid/content/Context;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public final a(Ljava/lang/Object;ZI)V
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lru/mail/libverify/storage/m;->f:Landroid/content/Context;

    invoke-static {v0, p1, p2}, Lru/mail/libverify/utils/VerificationService;->a(Landroid/content/Context;Ljava/lang/Object;Z)V

    const-string/jumbo v0, "instance_broadcast_on_demand"

    invoke-direct {p0, v0}, Lru/mail/libverify/storage/m;->c(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/storage/m;->f:Landroid/content/Context;

    invoke-static {v0, p1, p3}, Lru/mail/libverify/storage/e;->a(Landroid/content/Context;Ljava/lang/Object;I)V

    :cond_0
    return-void
.end method

.method public final a(Ljava/lang/String;I)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lru/mail/libverify/storage/m;->f:Landroid/content/Context;

    invoke-static {v0, p1, p2}, Lru/mail/libverify/utils/AlarmReceiver;->a(Landroid/content/Context;Ljava/lang/String;I)V

    return-void
.end method

.method public final a(Ljava/util/Locale;)V
    .locals 3
    .param p1    # Ljava/util/Locale;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iput-object p1, p0, Lru/mail/libverify/storage/m;->p:Ljava/util/Locale;

    invoke-virtual {p0}, Lru/mail/libverify/storage/m;->z()Lru/mail/libverify/storage/o;

    move-result-object v0

    const-string/jumbo v1, "instance_custom_locale"

    invoke-static {p1}, Lru/mail/libverify/utils/m;->a(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lru/mail/libverify/storage/o;->a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/storage/o;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/o;->a()V

    return-void
.end method

.method public final a(Lru/mail/libverify/requests/response/SmsInfo;)V
    .locals 1
    .param p1    # Lru/mail/libverify/requests/response/SmsInfo;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lru/mail/libverify/storage/m;->f:Landroid/content/Context;

    invoke-static {v0, p1}, Lru/mail/libverify/storage/s;->a(Landroid/content/Context;Lru/mail/libverify/requests/response/SmsInfo;)V

    return-void
.end method

.method public final a(Lru/mail/libverify/storage/n;)V
    .locals 5
    .param p1    # Lru/mail/libverify/storage/n;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const-string/jumbo v0, "instance_broadcast_on_demand"

    invoke-interface {p1}, Lru/mail/libverify/storage/n;->broadcastOnDemand()Ljava/lang/Boolean;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lru/mail/libverify/storage/m;->a(Ljava/lang/String;Ljava/lang/Boolean;)V

    const-string/jumbo v0, "instance_intercept_sms"

    invoke-interface {p1}, Lru/mail/libverify/storage/n;->interceptAlienSms()Ljava/lang/Boolean;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lru/mail/libverify/storage/m;->a(Ljava/lang/String;Ljava/lang/Boolean;)V

    const-string/jumbo v0, "instance_single_fetcher"

    invoke-interface {p1}, Lru/mail/libverify/storage/n;->singleFetcher()Ljava/lang/Boolean;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lru/mail/libverify/storage/m;->a(Ljava/lang/String;Ljava/lang/Boolean;)V

    const-string/jumbo v0, "instance_safety_net"

    invoke-interface {p1}, Lru/mail/libverify/storage/n;->useSafetyNet()Ljava/lang/Boolean;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lru/mail/libverify/storage/m;->a(Ljava/lang/String;Ljava/lang/Boolean;)V

    const-string/jumbo v0, "instance_account_check_sms"

    invoke-interface {p1}, Lru/mail/libverify/storage/n;->accountCheckWithSms()Ljava/lang/Boolean;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lru/mail/libverify/storage/m;->a(Ljava/lang/String;Ljava/lang/Boolean;)V

    const-string/jumbo v0, "instance_track_package"

    invoke-interface {p1}, Lru/mail/libverify/storage/n;->trackPackageUpdate()Ljava/lang/Boolean;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lru/mail/libverify/storage/m;->a(Ljava/lang/String;Ljava/lang/Boolean;)V

    const-string/jumbo v0, "instance_send_call_stats"

    invoke-interface {p1}, Lru/mail/libverify/storage/n;->sendCallStats()Ljava/lang/Boolean;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lru/mail/libverify/storage/m;->a(Ljava/lang/String;Ljava/lang/Boolean;)V

    const-string/jumbo v0, "instance_update_alarms"

    invoke-interface {p1}, Lru/mail/libverify/storage/n;->updateAlarms()Ljava/lang/Boolean;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lru/mail/libverify/storage/m;->a(Ljava/lang/String;Ljava/lang/Boolean;)V

    const-string/jumbo v0, "instance_background_verify"

    invoke-interface {p1}, Lru/mail/libverify/storage/n;->backgroundVerify()Ljava/lang/Boolean;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lru/mail/libverify/storage/m;->a(Ljava/lang/String;Ljava/lang/Boolean;)V

    const-string/jumbo v0, "InstanceData"

    const-string/jumbo v1, "instance features changed:\n %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const/4 v4, 0x0

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {p0}, Lru/mail/libverify/storage/m;->z()Lru/mail/libverify/storage/o;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/o;->a()V

    return-void
.end method

.method public final a(Lru/mail/libverify/storage/u;)V
    .locals 0
    .param p1    # Lru/mail/libverify/storage/u;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lru/mail/libverify/storage/m;->g:Lru/mail/libverify/storage/u;

    return-void
.end method

.method public final a(Z)V
    .locals 3

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lru/mail/libverify/storage/m;->z()Lru/mail/libverify/storage/o;

    move-result-object v0

    const-string/jumbo v1, "instance_block_location"

    invoke-interface {v0, v1}, Lru/mail/libverify/storage/o;->d(Ljava/lang/String;)Lru/mail/libverify/storage/o;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/o;->a()V

    :goto_0
    return-void

    :cond_0
    invoke-virtual {p0}, Lru/mail/libverify/storage/m;->z()Lru/mail/libverify/storage/o;

    move-result-object v0

    const-string/jumbo v1, "instance_block_location"

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lru/mail/libverify/storage/o;->a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/storage/o;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/o;->a()V

    goto :goto_0
.end method

.method public final a(Ljava/util/Map;)Z
    .locals 9
    .param p1    # Ljava/util/Map;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    const/4 v1, 0x1

    const/4 v2, 0x0

    :try_start_0
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    const-string/jumbo v0, "https://clientapi.mail.ru/"

    const-string/jumbo v3, ";"

    invoke-virtual {v0, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    array-length v0, v5

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "At least one api host must be provided"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception v0

    const-string/jumbo v1, "InstanceData"

    const-string/jumbo v3, "failed to set api endpoints"

    invoke-static {v1, v3, v0}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    move v0, v2

    :goto_0
    return v0

    :cond_0
    :try_start_1
    array-length v6, v5

    move v3, v2

    :goto_1
    if-ge v3, v6, :cond_3

    aget-object v0, v5, v3

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Host name must be non empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    invoke-interface {p1, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_2

    invoke-static {v7, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_2

    invoke-virtual {v4, v7, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2
    add-int/lit8 v0, v3, 0x1

    move v3, v0

    goto :goto_1

    :cond_3
    invoke-virtual {v4}, Ljava/util/HashMap;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_4

    const-string/jumbo v0, "InstanceData"

    const-string/jumbo v3, "set api endpoints %s"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v4, v5, v6

    invoke-static {v0, v3, v5}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iput-object v4, p0, Lru/mail/libverify/storage/m;->s:Ljava/util/Map;

    invoke-virtual {p0}, Lru/mail/libverify/storage/m;->z()Lru/mail/libverify/storage/o;

    move-result-object v0

    const-string/jumbo v3, "instance_api_endpoints"

    invoke-static {v4}, Lru/mail/libverify/utils/json/a;->a(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v3, v4}, Lru/mail/libverify/storage/o;->a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/storage/o;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/o;->a()V

    move v0, v1

    goto :goto_0

    :cond_4
    const-string/jumbo v0, "InstanceData"

    const-string/jumbo v1, "reset api endpoints"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lru/mail/libverify/storage/m;->s:Ljava/util/Map;

    invoke-virtual {p0}, Lru/mail/libverify/storage/m;->z()Lru/mail/libverify/storage/o;

    move-result-object v0

    const-string/jumbo v1, "instance_api_endpoints"

    invoke-interface {v0, v1}, Lru/mail/libverify/storage/o;->d(Ljava/lang/String;)Lru/mail/libverify/storage/o;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/o;->a()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move v0, v2

    goto/16 :goto_0
.end method

.method public final b()Ljava/lang/String;
    .locals 1

    invoke-direct {p0}, Lru/mail/libverify/storage/m;->P()V

    iget-object v0, p0, Lru/mail/libverify/storage/m;->e:Lru/mail/libverify/storage/c;

    invoke-virtual {v0}, Lru/mail/libverify/storage/c;->b()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final b(Z)V
    .locals 2

    const-string/jumbo v0, "instance_broadcast_on_demand"

    invoke-direct {p0, v0}, Lru/mail/libverify/storage/m;->c(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    iget-object v0, p0, Lru/mail/libverify/storage/m;->f:Landroid/content/Context;

    const-class v1, Lru/mail/libverify/fetcher/FetcherService;

    invoke-static {v0, v1}, Lru/mail/libverify/storage/e;->a(Landroid/content/Context;Ljava/lang/Object;)V

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/storage/m;->f:Landroid/content/Context;

    invoke-static {v0}, Lru/mail/libverify/fetcher/FetcherService;->b(Landroid/content/Context;)V

    return-void
.end method

.method public final b(Ljava/lang/String;)Z
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lru/mail/libverify/storage/m;->f:Landroid/content/Context;

    invoke-static {v0, p1}, Lru/mail/libverify/utils/j;->a(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public final c()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/storage/m;->c:Ljava/lang/String;

    if-nez v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/storage/m;->f:Landroid/content/Context;

    invoke-static {v0}, Lru/mail/libverify/utils/m;->a(Landroid/content/Context;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lru/mail/libverify/storage/m;->c:Ljava/lang/String;

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/storage/m;->c:Ljava/lang/String;

    return-object v0
.end method

.method public final d()Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/storage/m;->f:Landroid/content/Context;

    return-object v0
.end method

.method public final e()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/storage/m;->f:Landroid/content/Context;

    invoke-static {v0}, Lru/mail/libverify/storage/i;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 3

    const/4 v0, 0x0

    if-ne p0, p1, :cond_1

    const/4 v0, 0x1

    :cond_0
    :goto_0
    return v0

    :cond_1
    if-eqz p1, :cond_0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    if-ne v1, v2, :cond_0

    check-cast p1, Lru/mail/libverify/storage/m;

    iget-object v1, p0, Lru/mail/libverify/storage/m;->e:Lru/mail/libverify/storage/c;

    iget-object v2, p1, Lru/mail/libverify/storage/m;->e:Lru/mail/libverify/storage/c;

    invoke-virtual {v1, v2}, Lru/mail/libverify/storage/c;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v0, p0, Lru/mail/libverify/storage/m;->f:Landroid/content/Context;

    iget-object v1, p1, Lru/mail/libverify/storage/m;->f:Landroid/content/Context;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method

.method public final f()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/storage/m;->d:Ljava/lang/String;

    if-nez v0, :cond_1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lru/mail/libverify/storage/m;->d:Ljava/lang/String;

    if-nez v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/storage/m;->f:Landroid/content/Context;

    invoke-static {v0}, Lru/mail/libverify/storage/i;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lru/mail/libverify/utils/m;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lru/mail/libverify/storage/m;->d:Ljava/lang/String;

    :cond_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    iget-object v0, p0, Lru/mail/libverify/storage/m;->d:Ljava/lang/String;

    return-object v0

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public final g()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/storage/m;->i:Ljava/lang/String;

    if-nez v0, :cond_1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lru/mail/libverify/storage/m;->i:Ljava/lang/String;

    if-nez v0, :cond_0

    invoke-direct {p0}, Lru/mail/libverify/storage/m;->R()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lru/mail/libverify/storage/m;->i:Ljava/lang/String;

    :cond_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    iget-object v0, p0, Lru/mail/libverify/storage/m;->i:Ljava/lang/String;

    return-object v0

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public final h()Ljava/lang/String;
    .locals 2

    iget-object v0, p0, Lru/mail/libverify/storage/m;->j:Ljava/lang/String;

    if-nez v0, :cond_2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lru/mail/libverify/storage/m;->j:Ljava/lang/String;

    if-nez v0, :cond_1

    iget-object v0, p0, Lru/mail/libverify/storage/m;->f:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string/jumbo v1, "android_id"

    invoke-static {v0, v1}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string/jumbo v0, "ro.serialno"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_0
    iput-object v0, p0, Lru/mail/libverify/storage/m;->j:Ljava/lang/String;

    :cond_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_2
    iget-object v0, p0, Lru/mail/libverify/storage/m;->j:Ljava/lang/String;

    return-object v0

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public final hashCode()I
    .locals 2

    iget-object v0, p0, Lru/mail/libverify/storage/m;->e:Lru/mail/libverify/storage/c;

    invoke-virtual {v0}, Lru/mail/libverify/storage/c;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lru/mail/libverify/storage/m;->f:Landroid/content/Context;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public final i()Lru/mail/libverify/utils/k;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/storage/m;->f:Landroid/content/Context;

    invoke-static {v0}, Lru/mail/libverify/utils/ScreenStateReceiver;->b(Landroid/content/Context;)Lru/mail/libverify/utils/k;

    move-result-object v0

    return-object v0
.end method

.method public final j()Z
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/storage/m;->f:Landroid/content/Context;

    invoke-static {v0}, Lru/mail/libverify/utils/network/NetworkStateReceiver;->a(Landroid/content/Context;)Z

    move-result v0

    return v0
.end method

.method public final k()Z
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/storage/m;->f:Landroid/content/Context;

    invoke-static {v0}, Lru/mail/libverify/utils/m;->c(Landroid/content/Context;)Z

    move-result v0

    return v0
.end method

.method public final l()Z
    .locals 1

    invoke-static {}, Lru/mail/libverify/utils/BatteryLevelReceiver;->a()Z

    move-result v0

    return v0
.end method

.method public final m()V
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/storage/m;->f:Landroid/content/Context;

    invoke-static {v0}, Lru/mail/libverify/utils/network/NetworkStateReceiver;->b(Landroid/content/Context;)V

    return-void
.end method

.method public final n()Landroid/location/Location;
    .locals 2

    invoke-virtual {p0}, Lru/mail/libverify/storage/m;->z()Lru/mail/libverify/storage/o;

    move-result-object v0

    const-string/jumbo v1, "instance_block_location"

    invoke-interface {v0, v1}, Lru/mail/libverify/storage/o;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/storage/m;->k:Lru/mail/libverify/storage/p;

    if-nez v0, :cond_2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lru/mail/libverify/storage/m;->k:Lru/mail/libverify/storage/p;

    if-nez v0, :cond_1

    new-instance v0, Lru/mail/libverify/storage/p;

    iget-object v1, p0, Lru/mail/libverify/storage/m;->f:Landroid/content/Context;

    invoke-direct {v0, v1}, Lru/mail/libverify/storage/p;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lru/mail/libverify/storage/m;->k:Lru/mail/libverify/storage/p;

    :cond_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_2
    iget-object v0, p0, Lru/mail/libverify/storage/m;->k:Lru/mail/libverify/storage/p;

    invoke-virtual {v0}, Lru/mail/libverify/storage/p;->a()Landroid/location/Location;

    move-result-object v0

    goto :goto_0

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public final o()Ljava/lang/String;
    .locals 2

    iget-object v0, p0, Lru/mail/libverify/storage/m;->f:Landroid/content/Context;

    invoke-virtual {p0}, Lru/mail/libverify/storage/m;->z()Lru/mail/libverify/storage/o;

    move-result-object v1

    invoke-static {v0, v1}, Lru/mail/libverify/gcm/GcmRegisterService;->b(Landroid/content/Context;Lru/mail/libverify/storage/o;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final p()Lru/mail/libverify/accounts/d;
    .locals 6

    iget-object v0, p0, Lru/mail/libverify/storage/m;->l:Lru/mail/libverify/accounts/d;

    if-nez v0, :cond_1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lru/mail/libverify/storage/m;->l:Lru/mail/libverify/accounts/d;

    if-nez v0, :cond_0

    const-string/jumbo v0, "InstanceData"

    const-string/jumbo v1, "sim card read start"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lru/mail/libverify/storage/m;->f:Landroid/content/Context;

    invoke-static {v0}, Lru/mail/libverify/accounts/f;->a(Landroid/content/Context;)Lru/mail/libverify/accounts/d;

    move-result-object v0

    const-string/jumbo v1, "InstanceData"

    const-string/jumbo v2, "sim card read result %s"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {v0}, Lru/mail/libverify/accounts/d;->l()Z

    move-result v5

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v1, v2, v3}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {v0}, Lru/mail/libverify/accounts/d;->l()Z

    move-result v1

    if-eqz v1, :cond_2

    iput-object v0, p0, Lru/mail/libverify/storage/m;->l:Lru/mail/libverify/accounts/d;

    :cond_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    iget-object v0, p0, Lru/mail/libverify/storage/m;->l:Lru/mail/libverify/accounts/d;

    :goto_0
    return-object v0

    :cond_2
    :try_start_1
    monitor-exit p0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public final q()Lru/mail/libverify/accounts/b;
    .locals 2

    iget-object v0, p0, Lru/mail/libverify/storage/m;->n:Lru/mail/libverify/accounts/b;

    if-nez v0, :cond_1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lru/mail/libverify/storage/m;->n:Lru/mail/libverify/accounts/b;

    if-nez v0, :cond_0

    new-instance v0, Lru/mail/libverify/accounts/c;

    iget-object v1, p0, Lru/mail/libverify/storage/m;->f:Landroid/content/Context;

    invoke-direct {v0, v1}, Lru/mail/libverify/accounts/c;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lru/mail/libverify/storage/m;->n:Lru/mail/libverify/accounts/b;

    :cond_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    iget-object v0, p0, Lru/mail/libverify/storage/m;->n:Lru/mail/libverify/accounts/b;

    return-object v0

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public final r()Lru/mail/libverify/sms/c;
    .locals 2

    iget-object v0, p0, Lru/mail/libverify/storage/m;->o:Lru/mail/libverify/sms/c;

    if-nez v0, :cond_1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lru/mail/libverify/storage/m;->o:Lru/mail/libverify/sms/c;

    if-nez v0, :cond_0

    new-instance v0, Lru/mail/libverify/sms/d;

    iget-object v1, p0, Lru/mail/libverify/storage/m;->f:Landroid/content/Context;

    invoke-direct {v0, v1}, Lru/mail/libverify/sms/d;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lru/mail/libverify/storage/m;->o:Lru/mail/libverify/sms/c;

    :cond_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    iget-object v0, p0, Lru/mail/libverify/storage/m;->o:Lru/mail/libverify/sms/c;

    return-object v0

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public final s()Ljava/lang/String;
    .locals 1

    invoke-virtual {p0}, Lru/mail/libverify/storage/m;->u()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final t()Ljava/lang/String;
    .locals 1

    invoke-virtual {p0}, Lru/mail/libverify/storage/m;->u()Ljava/util/Locale;

    move-result-object v0

    invoke-static {v0}, Lru/mail/libverify/utils/m;->a(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "InstanceData{application="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lru/mail/libverify/storage/m;->a()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", version=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lru/mail/libverify/storage/m;->c()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final u()Ljava/util/Locale;
    .locals 6

    const/4 v4, 0x2

    iget-object v0, p0, Lru/mail/libverify/storage/m;->p:Ljava/util/Locale;

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lru/mail/libverify/storage/m;->t:Z

    if-nez v0, :cond_1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lru/mail/libverify/storage/m;->p:Ljava/util/Locale;

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lru/mail/libverify/storage/m;->z()Lru/mail/libverify/storage/o;

    move-result-object v0

    const-string/jumbo v1, "instance_custom_locale"

    invoke-interface {v0, v1}, Lru/mail/libverify/storage/o;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    :goto_0
    iput-object v0, p0, Lru/mail/libverify/storage/m;->p:Ljava/util/Locale;

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lru/mail/libverify/storage/m;->t:Z

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    iget-object v0, p0, Lru/mail/libverify/storage/m;->p:Ljava/util/Locale;

    if-nez v0, :cond_6

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    :goto_1
    return-object v0

    :cond_2
    :try_start_1
    const-string/jumbo v0, ""

    const/16 v2, 0x5f

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    if-gez v3, :cond_3

    move-object v5, v0

    move-object v0, v1

    move-object v1, v5

    :goto_2
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-ne v2, v4, :cond_4

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v0, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    move-object v2, v0

    :goto_3
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v0

    if-ne v0, v4, :cond_5

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v1, v0}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    move-object v1, v0

    :goto_4
    new-instance v0, Ljava/util/Locale;

    invoke-direct {v0, v2, v1}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :cond_3
    const/4 v0, 0x0

    :try_start_2
    invoke-virtual {v1, v0, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    add-int/lit8 v0, v3, 0x1

    invoke-virtual {v1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    move-object v1, v0

    move-object v0, v2

    goto :goto_2

    :cond_4
    const-string/jumbo v0, ""

    move-object v2, v0

    goto :goto_3

    :cond_5
    const-string/jumbo v0, ""
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-object v1, v0

    goto :goto_4

    :cond_6
    iget-object v0, p0, Lru/mail/libverify/storage/m;->p:Ljava/util/Locale;

    goto :goto_1
.end method

.method public final v()Ljava/lang/String;
    .locals 1

    invoke-direct {p0}, Lru/mail/libverify/storage/m;->O()Lru/mail/libverify/storage/r;

    move-result-object v0

    invoke-virtual {v0}, Lru/mail/libverify/storage/r;->a()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final w()Ljava/lang/String;
    .locals 3

    sget-object v0, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-static {v1}, Lru/mail/libverify/utils/m;->f(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const-string/jumbo v2, "HTC"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "HTC "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v0}, Lru/mail/libverify/utils/m;->f(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v2, " "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public final x()Ljava/lang/String;
    .locals 1

    const-string/jumbo v0, "instance_send_call_stats"

    invoke-direct {p0, v0}, Lru/mail/libverify/storage/m;->c(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/storage/m;->q:Ljava/lang/String;

    if-nez v0, :cond_2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lru/mail/libverify/storage/m;->q:Ljava/lang/String;

    if-nez v0, :cond_1

    invoke-static {p0}, Lru/mail/libverify/storage/g;->a(Lru/mail/libverify/storage/k;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lru/mail/libverify/storage/m;->q:Ljava/lang/String;

    :cond_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_2
    iget-object v0, p0, Lru/mail/libverify/storage/m;->q:Ljava/lang/String;

    goto :goto_0

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public final y()V
    .locals 1

    monitor-enter p0

    const/4 v0, 0x0

    :try_start_0
    iput-object v0, p0, Lru/mail/libverify/storage/m;->d:Ljava/lang/String;

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lru/mail/libverify/storage/m;->f:Landroid/content/Context;

    invoke-static {v0}, Lru/mail/libverify/storage/i;->c(Landroid/content/Context;)V

    invoke-direct {p0}, Lru/mail/libverify/storage/m;->O()Lru/mail/libverify/storage/r;

    move-result-object v0

    invoke-virtual {v0}, Lru/mail/libverify/storage/r;->b()V

    return-void

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public final z()Lru/mail/libverify/storage/o;
    .locals 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-object v0, p0, Lru/mail/libverify/storage/m;->h:Lru/mail/libverify/storage/o;

    if-nez v0, :cond_1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lru/mail/libverify/storage/m;->h:Lru/mail/libverify/storage/o;

    if-nez v0, :cond_0

    new-instance v0, Lru/mail/libverify/storage/q;

    iget-object v1, p0, Lru/mail/libverify/storage/m;->f:Landroid/content/Context;

    invoke-direct {v0, v1}, Lru/mail/libverify/storage/q;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lru/mail/libverify/storage/m;->h:Lru/mail/libverify/storage/o;

    :cond_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    iget-object v0, p0, Lru/mail/libverify/storage/m;->h:Lru/mail/libverify/storage/o;

    return-object v0

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method
