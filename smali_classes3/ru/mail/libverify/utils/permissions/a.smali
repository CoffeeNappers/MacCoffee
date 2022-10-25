.class public Lru/mail/libverify/utils/permissions/a;
.super Ljava/lang/Object;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x10
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lru/mail/libverify/utils/permissions/a$a;
    }
.end annotation


# static fields
.field private static a:Ljava/util/concurrent/atomic/AtomicInteger;

.field private static b:Landroid/util/LongSparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/LongSparseArray",
            "<",
            "Lru/mail/libverify/utils/permissions/a$a;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    sput-object v0, Lru/mail/libverify/utils/permissions/a;->a:Ljava/util/concurrent/atomic/AtomicInteger;

    new-instance v0, Landroid/util/LongSparseArray;

    invoke-direct {v0}, Landroid/util/LongSparseArray;-><init>()V

    sput-object v0, Lru/mail/libverify/utils/permissions/a;->b:Landroid/util/LongSparseArray;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static a(I[Ljava/lang/String;[I)V
    .locals 6

    const/4 v2, 0x0

    const-class v1, Lru/mail/libverify/utils/permissions/a;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lru/mail/libverify/utils/permissions/a;->b:Landroid/util/LongSparseArray;

    int-to-long v4, p0

    invoke-virtual {v0, v4, v5}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/utils/permissions/a$a;

    if-eqz v0, :cond_0

    sget-object v3, Lru/mail/libverify/utils/permissions/a;->b:Landroid/util/LongSparseArray;

    int-to-long v4, p0

    invoke-virtual {v3, v4, v5}, Landroid/util/LongSparseArray;->remove(J)V

    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_4

    move v1, v2

    move v3, v2

    :goto_0
    array-length v4, p1

    if-ge v3, v4, :cond_2

    aget v4, p2, v3

    if-nez v4, :cond_1

    aget-object v4, p1, v3

    invoke-interface {v0, v4}, Lru/mail/libverify/utils/permissions/a$a;->a(Ljava/lang/String;)V

    add-int/lit8 v1, v1, 0x1

    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :cond_1
    aget-object v4, p1, v3

    invoke-interface {v0, v4}, Lru/mail/libverify/utils/permissions/a$a;->b(Ljava/lang/String;)V

    goto :goto_1

    :cond_2
    array-length v3, p1

    if-ne v1, v3, :cond_3

    const/4 v2, 0x1

    :cond_3
    invoke-interface {v0, v2}, Lru/mail/libverify/utils/permissions/a$a;->a(Z)V

    :cond_4
    return-void
.end method

.method public static a(Landroid/content/Context;[Ljava/lang/String;Lru/mail/libverify/utils/permissions/a$a;)V
    .locals 8
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # [Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lru/mail/libverify/utils/permissions/a$a;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/annotation/TargetApi;
        value = 0x17
    .end annotation

    const/4 v5, 0x1

    const/4 v0, 0x0

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x17

    if-ge v1, v2, :cond_1

    array-length v1, p1

    :goto_0
    if-ge v0, v1, :cond_0

    aget-object v2, p1, v0

    invoke-interface {p2, v2}, Lru/mail/libverify/utils/permissions/a$a;->a(Ljava/lang/String;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    invoke-interface {p2, v5}, Lru/mail/libverify/utils/permissions/a$a;->a(Z)V

    :goto_1
    return-void

    :cond_1
    new-instance v1, Ljava/util/ArrayList;

    array-length v2, p1

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    array-length v2, p1

    :goto_2
    if-ge v0, v2, :cond_3

    aget-object v3, p1, v0

    invoke-static {p0, v3}, Landroid/support/v4/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v4

    if-nez v4, :cond_2

    invoke-interface {p2, v3}, Lru/mail/libverify/utils/permissions/a$a;->a(Ljava/lang/String;)V

    :goto_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_2
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    :cond_3
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_4

    invoke-interface {p2, v5}, Lru/mail/libverify/utils/permissions/a$a;->a(Z)V

    goto :goto_1

    :cond_4
    new-instance v2, Landroid/content/Intent;

    const-class v0, Lru/mail/libverify/utils/permissions/ShadowActivity;

    invoke-direct {v2, p0, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    sget-object v0, Lru/mail/libverify/utils/permissions/a;->a:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v0

    const-class v3, Lru/mail/libverify/utils/permissions/a;

    monitor-enter v3

    :try_start_0
    sget-object v4, Lru/mail/libverify/utils/permissions/a;->b:Landroid/util/LongSparseArray;

    int-to-long v6, v0

    invoke-virtual {v4, v6, v7, p2}, Landroid/util/LongSparseArray;->put(JLjava/lang/Object;)V

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/high16 v3, 0x10000000

    invoke-virtual {v2, v3}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    const-string/jumbo v3, "request_id"

    invoke-virtual {v2, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string/jumbo v3, "permissions"

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    invoke-virtual {v2, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_1

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method
