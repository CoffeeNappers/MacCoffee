.class public Lru/mail/libverify/storage/e;
.super Ljava/lang/Object;


# static fields
.field private static final a:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private static final b:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private static final c:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private static final d:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private static final e:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lru/mail/libverify/storage/e;->a:Ljava/util/HashSet;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lru/mail/libverify/storage/e;->b:Ljava/util/HashSet;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lru/mail/libverify/storage/e;->c:Ljava/util/HashSet;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lru/mail/libverify/storage/e;->d:Ljava/util/HashSet;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lru/mail/libverify/storage/e;->e:Ljava/util/HashSet;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static a(Landroid/content/Context;Ljava/lang/Object;)V
    .locals 2
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const-class v1, Lru/mail/libverify/storage/e;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lru/mail/libverify/storage/e;->b:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lru/mail/libverify/storage/e;->b:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p0}, Lru/mail/libverify/sms/IncomingCallReceiver;->b(Landroid/content/Context;)V

    :cond_0
    sget-object v0, Lru/mail/libverify/storage/e;->c:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Lru/mail/libverify/storage/e;->c:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {p0}, Lru/mail/libverify/sms/IncomingSmsReceiver;->b(Landroid/content/Context;)V

    :cond_1
    sget-object v0, Lru/mail/libverify/storage/e;->d:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    sget-object v0, Lru/mail/libverify/storage/e;->d:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {p0}, Lru/mail/libverify/utils/BatteryLevelReceiver;->b(Landroid/content/Context;)V

    :cond_2
    sget-object v0, Lru/mail/libverify/storage/e;->a:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    sget-object v0, Lru/mail/libverify/storage/e;->a:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-static {p0}, Lru/mail/libverify/utils/network/NetworkStateReceiver;->d(Landroid/content/Context;)V

    :cond_3
    sget-object v0, Lru/mail/libverify/storage/e;->e:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    sget-object v0, Lru/mail/libverify/storage/e;->e:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-static {p0}, Lru/mail/libverify/utils/SystemRestartReceiver;->b(Landroid/content/Context;)V

    :cond_4
    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method static a(Landroid/content/Context;Ljava/lang/Object;I)V
    .locals 4
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v3, 0x1

    if-nez p2, :cond_0

    :goto_0
    return-void

    :cond_0
    const-class v1, Lru/mail/libverify/storage/e;

    monitor-enter v1

    and-int/lit8 v0, p2, 0x1

    if-ne v0, v3, :cond_1

    :try_start_0
    sget-object v0, Lru/mail/libverify/storage/e;->b:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Lru/mail/libverify/storage/e;->b:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->size()I

    move-result v0

    if-ne v0, v3, :cond_1

    invoke-static {p0}, Lru/mail/libverify/sms/IncomingCallReceiver;->a(Landroid/content/Context;)V

    :cond_1
    and-int/lit8 v0, p2, 0x4

    const/4 v2, 0x4

    if-ne v0, v2, :cond_2

    sget-object v0, Lru/mail/libverify/storage/e;->c:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    sget-object v0, Lru/mail/libverify/storage/e;->c:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->size()I

    move-result v0

    if-ne v0, v3, :cond_2

    invoke-static {p0}, Lru/mail/libverify/sms/IncomingSmsReceiver;->a(Landroid/content/Context;)V

    :cond_2
    and-int/lit8 v0, p2, 0x8

    const/16 v2, 0x8

    if-ne v0, v2, :cond_3

    sget-object v0, Lru/mail/libverify/storage/e;->a:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    sget-object v0, Lru/mail/libverify/storage/e;->a:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->size()I

    move-result v0

    if-ne v0, v3, :cond_3

    invoke-static {p0}, Lru/mail/libverify/utils/network/NetworkStateReceiver;->c(Landroid/content/Context;)V

    :cond_3
    and-int/lit8 v0, p2, 0x10

    const/16 v2, 0x10

    if-ne v0, v2, :cond_4

    sget-object v0, Lru/mail/libverify/storage/e;->d:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    sget-object v0, Lru/mail/libverify/storage/e;->d:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->size()I

    move-result v0

    if-ne v0, v3, :cond_4

    invoke-static {p0}, Lru/mail/libverify/utils/BatteryLevelReceiver;->a(Landroid/content/Context;)V

    :cond_4
    and-int/lit8 v0, p2, 0x20

    const/16 v2, 0x20

    if-ne v0, v2, :cond_5

    sget-object v0, Lru/mail/libverify/storage/e;->e:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    sget-object v0, Lru/mail/libverify/storage/e;->e:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->size()I

    move-result v0

    if-ne v0, v3, :cond_5

    invoke-static {p0}, Lru/mail/libverify/utils/SystemRestartReceiver;->a(Landroid/content/Context;)V

    :cond_5
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
