.class final Lru/mail/libverify/sms/m$3;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lru/mail/libverify/sms/m;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Landroid/net/Uri;

.field final synthetic b:Lru/mail/libverify/sms/m;


# direct methods
.method constructor <init>(Lru/mail/libverify/sms/m;Landroid/net/Uri;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/sms/m$3;->b:Lru/mail/libverify/sms/m;

    iput-object p2, p0, Lru/mail/libverify/sms/m$3;->a:Landroid/net/Uri;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 10

    const/4 v9, 0x1

    const/4 v8, 0x0

    iget-object v0, p0, Lru/mail/libverify/sms/m$3;->b:Lru/mail/libverify/sms/m;

    invoke-static {v0}, Lru/mail/libverify/sms/m;->b(Lru/mail/libverify/sms/m;)J

    move-result-wide v0

    iget-object v2, p0, Lru/mail/libverify/sms/m$3;->b:Lru/mail/libverify/sms/m;

    invoke-static {v2}, Lru/mail/libverify/sms/m;->c(Lru/mail/libverify/sms/m;)V

    const-string/jumbo v2, "SmsManager"

    const-string/jumbo v3, "last id: %s -> %s"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v4, v8

    iget-object v5, p0, Lru/mail/libverify/sms/m$3;->b:Lru/mail/libverify/sms/m;

    invoke-static {v5}, Lru/mail/libverify/sms/m;->b(Lru/mail/libverify/sms/m;)J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v4, v9

    invoke-static {v2, v3, v4}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v2, p0, Lru/mail/libverify/sms/m$3;->b:Lru/mail/libverify/sms/m;

    invoke-static {v2}, Lru/mail/libverify/sms/m;->b(Lru/mail/libverify/sms/m;)J

    move-result-wide v2

    cmp-long v2, v2, v0

    if-gez v2, :cond_1

    const-string/jumbo v0, "SmsManager"

    const-string/jumbo v1, "last message ID was decreased (SMS deleted)"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lru/mail/libverify/sms/m$3;->b:Lru/mail/libverify/sms/m;

    iget-object v1, p0, Lru/mail/libverify/sms/m$3;->b:Lru/mail/libverify/sms/m;

    invoke-static {v1}, Lru/mail/libverify/sms/m;->b(Lru/mail/libverify/sms/m;)J

    move-result-wide v2

    invoke-static {v0, v2, v3}, Lru/mail/libverify/sms/m;->a(Lru/mail/libverify/sms/m;J)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v2, p0, Lru/mail/libverify/sms/m$3;->b:Lru/mail/libverify/sms/m;

    invoke-static {v2}, Lru/mail/libverify/sms/m;->a(Lru/mail/libverify/sms/m;)Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    iget-object v2, p0, Lru/mail/libverify/sms/m$3;->a:Landroid/net/Uri;

    if-eqz v2, :cond_4

    sget-object v0, Lru/mail/libverify/sms/m;->b:Ljava/util/regex/Pattern;

    iget-object v1, p0, Lru/mail/libverify/sms/m$3;->a:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lru/mail/libverify/sms/m$3;->b:Lru/mail/libverify/sms/m;

    iget-object v1, p0, Lru/mail/libverify/sms/m$3;->a:Landroid/net/Uri;

    invoke-static {v0, v1}, Lru/mail/libverify/sms/m;->b(Lru/mail/libverify/sms/m;Landroid/net/Uri;)Lru/mail/libverify/sms/b;

    move-result-object v0

    if-eqz v0, :cond_2

    const-string/jumbo v1, "SmsManager"

    const-string/jumbo v2, "Got message, have some listeners."

    invoke-static {v1, v2}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, v0, Lru/mail/libverify/sms/b;->b:Lru/mail/libverify/sms/m$b;

    iget-object v2, p0, Lru/mail/libverify/sms/m$3;->b:Lru/mail/libverify/sms/m;

    invoke-virtual {v1, v2, v0}, Lru/mail/libverify/sms/m$b;->a(Lru/mail/libverify/sms/m;Lru/mail/libverify/sms/b;)V

    goto :goto_0

    :cond_2
    const-string/jumbo v0, "SmsManager"

    const-string/jumbo v1, "There is no message for %s (deleted?)"

    new-array v2, v9, [Ljava/lang/Object;

    iget-object v3, p0, Lru/mail/libverify/sms/m$3;->a:Landroid/net/Uri;

    aput-object v3, v2, v8

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0

    :cond_3
    const-string/jumbo v0, "SmsManager"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "Skip unwanted URI: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lru/mail/libverify/sms/m$3;->a:Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_4
    iget-object v2, p0, Lru/mail/libverify/sms/m$3;->b:Lru/mail/libverify/sms/m;

    invoke-static {v2, v0, v1}, Lru/mail/libverify/sms/m;->b(Lru/mail/libverify/sms/m;J)Ljava/util/List;

    move-result-object v0

    const-string/jumbo v1, "SmsManager"

    const-string/jumbo v2, "Got %s message(s), have some listeners."

    new-array v3, v9, [Ljava/lang/Object;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v8

    invoke-static {v1, v2, v3}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/sms/b;

    iget-object v2, v0, Lru/mail/libverify/sms/b;->b:Lru/mail/libverify/sms/m$b;

    iget-object v3, p0, Lru/mail/libverify/sms/m$3;->b:Lru/mail/libverify/sms/m;

    invoke-virtual {v2, v3, v0}, Lru/mail/libverify/sms/m$b;->a(Lru/mail/libverify/sms/m;Lru/mail/libverify/sms/b;)V

    goto :goto_1
.end method
