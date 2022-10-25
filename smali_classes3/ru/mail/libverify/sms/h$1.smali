.class final Lru/mail/libverify/sms/h$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lru/mail/libverify/sms/h;->a(Lru/mail/libverify/sms/g$a;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lru/mail/libverify/sms/g$a;

.field final synthetic b:Lru/mail/libverify/sms/h;


# direct methods
.method constructor <init>(Lru/mail/libverify/sms/h;Lru/mail/libverify/sms/g$a;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/sms/h$1;->b:Lru/mail/libverify/sms/h;

    iput-object p2, p0, Lru/mail/libverify/sms/h$1;->a:Lru/mail/libverify/sms/g$a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 14
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InlinedApi"
        }
    .end annotation

    const/4 v6, 0x0

    const/4 v13, 0x1

    const/4 v12, 0x0

    const-string/jumbo v0, "PhoneCallInterceptor"

    const-string/jumbo v1, "last calls search started"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    :try_start_0
    iget-object v0, p0, Lru/mail/libverify/sms/h$1;->b:Lru/mail/libverify/sms/h;

    iget-object v0, v0, Lru/mail/libverify/sms/h;->a:Landroid/content/Context;

    const-string/jumbo v1, "android.permission.READ_CALL_LOG"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/m;->b(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "PhoneCallInterceptor"

    const-string/jumbo v1, "can\'t read calls without %s permission"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const-string/jumbo v4, "android.permission.READ_CALL_LOG"

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string/jumbo v0, "PhoneCallInterceptor"

    const-string/jumbo v1, "found %s calls"

    new-array v2, v13, [Ljava/lang/Object;

    invoke-interface {v7}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v12

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lru/mail/libverify/sms/h$1;->b:Lru/mail/libverify/sms/h;

    iget-object v0, v0, Lru/mail/libverify/sms/h;->b:Landroid/os/Handler;

    new-instance v1, Lru/mail/libverify/sms/h$1$1;

    invoke-direct {v1, p0, v7}, Lru/mail/libverify/sms/h$1$1;-><init>(Lru/mail/libverify/sms/h$1;Ljava/util/List;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :goto_0
    return-void

    :cond_0
    :try_start_1
    iget-object v0, p0, Lru/mail/libverify/sms/h$1;->b:Lru/mail/libverify/sms/h;

    iget-object v0, v0, Lru/mail/libverify/sms/h;->a:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lru/mail/libverify/sms/a;->d:Landroid/net/Uri;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const-string/jumbo v5, "date DESC LIMIT 5"

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v1

    if-nez v1, :cond_2

    if-eqz v1, :cond_1

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    :cond_1
    const-string/jumbo v0, "PhoneCallInterceptor"

    const-string/jumbo v1, "found %s calls"

    new-array v2, v13, [Ljava/lang/Object;

    invoke-interface {v7}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v12

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lru/mail/libverify/sms/h$1;->b:Lru/mail/libverify/sms/h;

    iget-object v0, v0, Lru/mail/libverify/sms/h;->b:Landroid/os/Handler;

    new-instance v1, Lru/mail/libverify/sms/h$1$1;

    invoke-direct {v1, p0, v7}, Lru/mail/libverify/sms/h$1$1;-><init>(Lru/mail/libverify/sms/h$1;Ljava/util/List;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    :cond_2
    :try_start_2
    iget-object v0, p0, Lru/mail/libverify/sms/h$1;->a:Lru/mail/libverify/sms/g$a;

    invoke-interface {v0}, Lru/mail/libverify/sms/g$a;->a()J

    move-result-wide v2

    const-string/jumbo v0, "number"

    invoke-interface {v1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    const-string/jumbo v4, "date"

    invoke-interface {v1, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v5

    if-eqz v5, :cond_8

    :cond_3
    invoke-interface {v1, v4}, Landroid/database/Cursor;->getLong(I)J
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    move-result-wide v8

    sub-long/2addr v8, v2

    const-wide/16 v10, 0x0

    cmp-long v5, v8, v10

    if-ltz v5, :cond_7

    const-wide/16 v10, 0x7530

    cmp-long v5, v8, v10

    if-lez v5, :cond_5

    if-eqz v1, :cond_4

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    :cond_4
    const-string/jumbo v0, "PhoneCallInterceptor"

    const-string/jumbo v1, "found %s calls"

    new-array v2, v13, [Ljava/lang/Object;

    invoke-interface {v7}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v12

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lru/mail/libverify/sms/h$1;->b:Lru/mail/libverify/sms/h;

    iget-object v0, v0, Lru/mail/libverify/sms/h;->b:Landroid/os/Handler;

    new-instance v1, Lru/mail/libverify/sms/h$1$1;

    invoke-direct {v1, p0, v7}, Lru/mail/libverify/sms/h$1$1;-><init>(Lru/mail/libverify/sms/h$1;Ljava/util/List;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto/16 :goto_0

    :cond_5
    :try_start_3
    invoke-interface {v1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v7, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-interface {v7}, Ljava/util/List;->size()I
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    move-result v5

    const/4 v6, 0x5

    if-le v5, v6, :cond_7

    if-eqz v1, :cond_6

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    :cond_6
    const-string/jumbo v0, "PhoneCallInterceptor"

    const-string/jumbo v1, "found %s calls"

    new-array v2, v13, [Ljava/lang/Object;

    invoke-interface {v7}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v12

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lru/mail/libverify/sms/h$1;->b:Lru/mail/libverify/sms/h;

    iget-object v0, v0, Lru/mail/libverify/sms/h;->b:Landroid/os/Handler;

    new-instance v1, Lru/mail/libverify/sms/h$1$1;

    invoke-direct {v1, p0, v7}, Lru/mail/libverify/sms/h$1$1;-><init>(Lru/mail/libverify/sms/h$1;Ljava/util/List;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto/16 :goto_0

    :cond_7
    :try_start_4
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    move-result v5

    if-nez v5, :cond_3

    :cond_8
    if-eqz v1, :cond_9

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    :cond_9
    const-string/jumbo v0, "PhoneCallInterceptor"

    const-string/jumbo v1, "found %s calls"

    new-array v2, v13, [Ljava/lang/Object;

    invoke-interface {v7}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v12

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lru/mail/libverify/sms/h$1;->b:Lru/mail/libverify/sms/h;

    iget-object v0, v0, Lru/mail/libverify/sms/h;->b:Landroid/os/Handler;

    new-instance v1, Lru/mail/libverify/sms/h$1$1;

    invoke-direct {v1, p0, v7}, Lru/mail/libverify/sms/h$1$1;-><init>(Lru/mail/libverify/sms/h$1;Ljava/util/List;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto/16 :goto_0

    :catch_0
    move-exception v0

    move-object v1, v6

    :goto_1
    :try_start_5
    const-string/jumbo v2, "PhoneCallInterceptor"

    const-string/jumbo v3, "can\'t read calls"

    invoke-static {v2, v3, v0}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    if-eqz v1, :cond_a

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    :cond_a
    const-string/jumbo v0, "PhoneCallInterceptor"

    const-string/jumbo v1, "found %s calls"

    new-array v2, v13, [Ljava/lang/Object;

    invoke-interface {v7}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v12

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lru/mail/libverify/sms/h$1;->b:Lru/mail/libverify/sms/h;

    iget-object v0, v0, Lru/mail/libverify/sms/h;->b:Landroid/os/Handler;

    new-instance v1, Lru/mail/libverify/sms/h$1$1;

    invoke-direct {v1, p0, v7}, Lru/mail/libverify/sms/h$1$1;-><init>(Lru/mail/libverify/sms/h$1;Ljava/util/List;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto/16 :goto_0

    :catchall_0
    move-exception v0

    :goto_2
    if-eqz v6, :cond_b

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_b
    const-string/jumbo v1, "PhoneCallInterceptor"

    const-string/jumbo v2, "found %s calls"

    new-array v3, v13, [Ljava/lang/Object;

    invoke-interface {v7}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object v4

    invoke-static {v4}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v12

    invoke-static {v1, v2, v3}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v1, p0, Lru/mail/libverify/sms/h$1;->b:Lru/mail/libverify/sms/h;

    iget-object v1, v1, Lru/mail/libverify/sms/h;->b:Landroid/os/Handler;

    new-instance v2, Lru/mail/libverify/sms/h$1$1;

    invoke-direct {v2, p0, v7}, Lru/mail/libverify/sms/h$1$1;-><init>(Lru/mail/libverify/sms/h$1;Ljava/util/List;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    throw v0

    :catchall_1
    move-exception v0

    move-object v6, v1

    goto :goto_2

    :catch_1
    move-exception v0

    goto :goto_1
.end method
