.class public final Lru/mail/libverify/ipc/f;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lru/mail/libverify/ipc/f$d;,
        Lru/mail/libverify/ipc/f$b;,
        Lru/mail/libverify/ipc/f$a;,
        Lru/mail/libverify/ipc/f$c;
    }
.end annotation


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lru/mail/libverify/api/l;

.field final c:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Lru/mail/libverify/ipc/f$d;",
            "Lru/mail/libverify/ipc/f$a;",
            ">;"
        }
    .end annotation
.end field

.field private final d:Lru/mail/libverify/ipc/f$b;

.field private e:Ljava/util/Timer;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lru/mail/libverify/api/l;Lru/mail/libverify/ipc/f$b;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lru/mail/libverify/api/l;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Lru/mail/libverify/ipc/f$b;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lru/mail/libverify/ipc/f;->c:Ljava/util/HashMap;

    const/4 v0, 0x0

    iput-object v0, p0, Lru/mail/libverify/ipc/f;->e:Ljava/util/Timer;

    iput-object p1, p0, Lru/mail/libverify/ipc/f;->a:Landroid/content/Context;

    iput-object p2, p0, Lru/mail/libverify/ipc/f;->b:Lru/mail/libverify/api/l;

    iput-object p3, p0, Lru/mail/libverify/ipc/f;->d:Lru/mail/libverify/ipc/f$b;

    return-void
.end method

.method static synthetic a(Lru/mail/libverify/ipc/f;Z)V
    .locals 7

    const/4 v2, 0x1

    const/4 v4, 0x0

    iget-object v0, p0, Lru/mail/libverify/ipc/f;->c:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lru/mail/libverify/ipc/f;->c:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v6

    move v1, v2

    move v3, v4

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/ipc/f$a;

    sget-object v5, Lru/mail/libverify/ipc/f$a;->Initial:Lru/mail/libverify/ipc/f$a;

    if-eq v0, v5, :cond_0

    move v5, v2

    :goto_1
    and-int/2addr v1, v5

    sget-object v5, Lru/mail/libverify/ipc/f$a;->Completed:Lru/mail/libverify/ipc/f$a;

    if-ne v0, v5, :cond_1

    move v0, v2

    :goto_2
    or-int/2addr v0, v3

    move v3, v0

    goto :goto_0

    :cond_0
    move v5, v4

    goto :goto_1

    :cond_1
    move v0, v4

    goto :goto_2

    :cond_2
    if-eqz p1, :cond_5

    iget-object v1, p0, Lru/mail/libverify/ipc/f;->d:Lru/mail/libverify/ipc/f$b;

    if-eqz v3, :cond_4

    sget-object v0, Lru/mail/libverify/ipc/f$c;->OK:Lru/mail/libverify/ipc/f$c;

    :goto_3
    invoke-interface {v1, v0}, Lru/mail/libverify/ipc/f$b;->a(Lru/mail/libverify/ipc/f$c;)V

    :goto_4
    iget-object v0, p0, Lru/mail/libverify/ipc/f;->c:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    :cond_3
    return-void

    :cond_4
    sget-object v0, Lru/mail/libverify/ipc/f$c;->CONNECTION_TIMEOUT_EXPIRED:Lru/mail/libverify/ipc/f$c;

    goto :goto_3

    :cond_5
    if-eqz v1, :cond_3

    if-eqz v3, :cond_6

    iget-object v0, p0, Lru/mail/libverify/ipc/f;->d:Lru/mail/libverify/ipc/f$b;

    sget-object v1, Lru/mail/libverify/ipc/f$c;->OK:Lru/mail/libverify/ipc/f$c;

    invoke-interface {v0, v1}, Lru/mail/libverify/ipc/f$b;->a(Lru/mail/libverify/ipc/f$c;)V

    goto :goto_4

    :cond_6
    iget-object v0, p0, Lru/mail/libverify/ipc/f;->d:Lru/mail/libverify/ipc/f$b;

    sget-object v1, Lru/mail/libverify/ipc/f$c;->FAILED_TO_FIND_TARGET_SESSION:Lru/mail/libverify/ipc/f$c;

    invoke-interface {v0, v1}, Lru/mail/libverify/ipc/f$b;->a(Lru/mail/libverify/ipc/f$c;)V

    goto :goto_4
.end method


# virtual methods
.method final a()V
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/ipc/f;->e:Ljava/util/Timer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/ipc/f;->e:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    const/4 v0, 0x0

    iput-object v0, p0, Lru/mail/libverify/ipc/f;->e:Ljava/util/Timer;

    :cond_0
    return-void
.end method

.method public final declared-synchronized a(Lru/mail/libverify/ipc/d;Ljava/lang/String;)V
    .locals 11
    .param p1    # Lru/mail/libverify/ipc/d;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v2, 0x1

    const/4 v3, 0x0

    monitor-enter p0

    :try_start_0
    const-string/jumbo v0, "IpcMessageClient"

    const-string/jumbo v1, "connectAndPostData target package = %s"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p2, v4, v5

    invoke-static {v0, v1, v4}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lru/mail/libverify/ipc/f;->c:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    new-instance v0, Landroid/content/Intent;

    invoke-interface {p1}, Lru/mail/libverify/ipc/d;->b()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lru/mail/libverify/ipc/f;->a:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    move v5, v2

    :goto_0
    iget-object v1, p0, Lru/mail/libverify/ipc/f;->a:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    const/4 v4, 0x0

    invoke-virtual {v1, v0, v4}, Landroid/content/pm/PackageManager;->queryIntentServices(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v0

    new-instance v1, Lru/mail/libverify/ipc/f$1;

    invoke-direct {v1, p0}, Lru/mail/libverify/ipc/f$1;-><init>(Lru/mail/libverify/ipc/f;)V

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    const-string/jumbo v1, "IpcMessageClient"

    const-string/jumbo v4, "connectAndPostData found services count %d"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v1, v4, v7}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_2

    iget-object v0, p0, Lru/mail/libverify/ipc/f;->d:Lru/mail/libverify/ipc/f$b;

    sget-object v1, Lru/mail/libverify/ipc/f$c;->FAILED_TO_FIND_READY_SERVICE:Lru/mail/libverify/ipc/f$c;

    invoke-interface {v0, v1}, Lru/mail/libverify/ipc/f$b;->a(Lru/mail/libverify/ipc/f$c;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_0
    :goto_1
    monitor-exit p0

    return-void

    :cond_1
    move v5, v3

    goto :goto_0

    :cond_2
    :try_start_2
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {p0}, Lru/mail/libverify/ipc/f;->a()V

    iget-object v4, p0, Lru/mail/libverify/ipc/f;->e:Ljava/util/Timer;

    if-nez v4, :cond_3

    new-instance v4, Ljava/util/Timer;

    const-string/jumbo v7, "IpcMessageClient.connectionTimer"

    invoke-direct {v4, v7}, Ljava/util/Timer;-><init>(Ljava/lang/String;)V

    iput-object v4, p0, Lru/mail/libverify/ipc/f;->e:Ljava/util/Timer;

    :cond_3
    iget-object v4, p0, Lru/mail/libverify/ipc/f;->e:Ljava/util/Timer;

    new-instance v7, Lru/mail/libverify/ipc/f$2;

    invoke-direct {v7, p0}, Lru/mail/libverify/ipc/f$2;-><init>(Lru/mail/libverify/ipc/f;)V

    mul-int/lit16 v1, v1, 0x3e8

    int-to-long v8, v1

    invoke-virtual {v4, v7, v8, v9}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_4
    :goto_2
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/ResolveInfo;

    iget-object v1, v0, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    iget-object v1, v1, Landroid/content/pm/ServiceInfo;->packageName:Ljava/lang/String;

    invoke-static {v6, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_7

    move v1, v2

    :goto_3
    if-eqz v5, :cond_5

    iget-object v4, v0, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    iget-object v4, v4, Landroid/content/pm/ServiceInfo;->packageName:Ljava/lang/String;

    invoke-static {p2, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_8

    :cond_5
    move v4, v2

    :goto_4
    if-eqz v1, :cond_4

    if-eqz v4, :cond_4

    iget-object v1, p0, Lru/mail/libverify/ipc/f;->a:Landroid/content/Context;

    iget-object v4, v0, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    iget-object v4, v4, Landroid/content/pm/ServiceInfo;->packageName:Ljava/lang/String;

    invoke-interface {p1, v1, v4}, Lru/mail/libverify/ipc/d;->a(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_a

    const-string/jumbo v1, "IpcMessageClient"

    const-string/jumbo v4, "connectToService try binding to %s"

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-virtual {v0}, Landroid/content/pm/ResolveInfo;->toString()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v1, v4, v8}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    iget-object v4, v0, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    iget-object v4, v4, Landroid/content/pm/ServiceInfo;->packageName:Ljava/lang/String;

    iget-object v8, v0, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    iget-object v8, v8, Landroid/content/pm/ServiceInfo;->name:Ljava/lang/String;

    invoke-virtual {v1, v4, v8}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    new-instance v4, Lru/mail/libverify/ipc/f$d;

    invoke-interface {p1}, Lru/mail/libverify/ipc/d;->a()Lru/mail/libverify/ipc/a;

    move-result-object v8

    const/4 v9, 0x0

    invoke-direct {v4, p0, v0, v8, v9}, Lru/mail/libverify/ipc/f$d;-><init>(Lru/mail/libverify/ipc/f;Landroid/content/pm/ResolveInfo;Lru/mail/libverify/ipc/a;B)V

    iget-object v8, p0, Lru/mail/libverify/ipc/f;->a:Landroid/content/Context;

    const/4 v9, 0x1

    invoke-virtual {v8, v1, v4, v9}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result v1

    if-eqz v1, :cond_9

    iget-object v1, p0, Lru/mail/libverify/ipc/f;->c:Ljava/util/HashMap;

    sget-object v8, Lru/mail/libverify/ipc/f$a;->Initial:Lru/mail/libverify/ipc/f$a;

    invoke-virtual {v1, v4, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string/jumbo v1, "IpcMessageClient"

    const-string/jumbo v4, "connectToService bound to %s"

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-virtual {v0}, Landroid/content/pm/ResolveInfo;->toString()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v1, v4, v8}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_3
    .catch Ljava/lang/SecurityException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto/16 :goto_2

    :catch_0
    move-exception v1

    :try_start_4
    const-string/jumbo v4, "IpcMessageClient"

    const-string/jumbo v8, "connectToService failed to bind to %s"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    invoke-virtual {v0}, Landroid/content/pm/ResolveInfo;->toString()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v9, v10

    invoke-static {v4, v1, v8, v9}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto/16 :goto_2

    :catch_1
    move-exception v0

    :try_start_5
    const-string/jumbo v1, "IpcMessageClient"

    const-string/jumbo v2, "connectAndPostData"

    invoke-static {v1, v2, v0}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-virtual {p0}, Lru/mail/libverify/ipc/f;->a()V

    invoke-virtual {p0}, Lru/mail/libverify/ipc/f;->b()V

    iget-object v0, p0, Lru/mail/libverify/ipc/f;->d:Lru/mail/libverify/ipc/f$b;

    sget-object v1, Lru/mail/libverify/ipc/f$c;->GENERAL_FAILURE:Lru/mail/libverify/ipc/f$c;

    invoke-interface {v0, v1}, Lru/mail/libverify/ipc/f$b;->a(Lru/mail/libverify/ipc/f$c;)V

    :cond_6
    iget-object v0, p0, Lru/mail/libverify/ipc/f;->c:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/ipc/f;->d:Lru/mail/libverify/ipc/f$b;

    sget-object v1, Lru/mail/libverify/ipc/f$c;->FAILED_TO_FIND_READY_SERVICE:Lru/mail/libverify/ipc/f$c;

    invoke-interface {v0, v1}, Lru/mail/libverify/ipc/f$b;->a(Lru/mail/libverify/ipc/f$c;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto/16 :goto_1

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_7
    move v1, v3

    goto/16 :goto_3

    :cond_8
    move v4, v3

    goto/16 :goto_4

    :cond_9
    :try_start_6
    const-string/jumbo v1, "IpcMessageClient"

    const-string/jumbo v4, "connectToService failed to bind to %s"

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-virtual {v0}, Landroid/content/pm/ResolveInfo;->toString()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v1, v4, v8}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_6
    .catch Ljava/lang/SecurityException; {:try_start_6 .. :try_end_6} :catch_0
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto/16 :goto_2

    :cond_a
    :try_start_7
    const-string/jumbo v1, "IpcMessageClient"

    const-string/jumbo v4, "connectAndPostData service from %s is not trusted"

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    iget-object v0, v0, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    iget-object v0, v0, Landroid/content/pm/ServiceInfo;->packageName:Ljava/lang/String;

    aput-object v0, v8, v9

    invoke-static {v1, v4, v8}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_1
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto/16 :goto_2
.end method

.method final b()V
    .locals 5

    const-string/jumbo v0, "IpcMessageClient"

    const-string/jumbo v1, "unbind %d connections"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lru/mail/libverify/ipc/f;->c:Ljava/util/HashMap;

    invoke-virtual {v4}, Ljava/util/HashMap;->size()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lru/mail/libverify/ipc/f;->c:Ljava/util/HashMap;

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

    check-cast v0, Lru/mail/libverify/ipc/f$d;

    invoke-virtual {v0}, Lru/mail/libverify/ipc/f$d;->a()V

    goto :goto_0

    :cond_0
    return-void
.end method
