.class final Lru/mail/libverify/api/c$3;
.super Ljava/lang/Object;

# interfaces
.implements Lru/mail/libverify/sms/c$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lru/mail/libverify/api/c;->b(Lru/mail/libverify/requests/response/SmsInfo;Lru/mail/libverify/api/h$a;Lru/mail/libverify/api/c$a;)Lru/mail/libverify/sms/c$a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic a:Lru/mail/libverify/api/h$a;

.field final synthetic b:Lru/mail/libverify/api/c$a;

.field final synthetic c:Lru/mail/libverify/requests/response/SmsInfo;


# direct methods
.method constructor <init>(Lru/mail/libverify/api/h$a;Lru/mail/libverify/api/c$a;Lru/mail/libverify/requests/response/SmsInfo;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/api/c$3;->a:Lru/mail/libverify/api/h$a;

    iput-object p2, p0, Lru/mail/libverify/api/c$3;->b:Lru/mail/libverify/api/c$a;

    iput-object p3, p0, Lru/mail/libverify/api/c$3;->c:Lru/mail/libverify/requests/response/SmsInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()J
    .locals 2

    iget-object v0, p0, Lru/mail/libverify/api/c$3;->c:Lru/mail/libverify/requests/response/SmsInfo;

    invoke-virtual {v0}, Lru/mail/libverify/requests/response/SmsInfo;->getTimeShiftMax()J

    move-result-wide v0

    return-wide v0
.end method

.method public final a(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/InterruptedException;

    invoke-direct {v0}, Ljava/lang/InterruptedException;-><init>()V

    throw v0

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/api/c$3;->a:Lru/mail/libverify/api/h$a;

    invoke-static {p1, v0}, Lru/mail/libverify/api/h;->b(Ljava/lang/String;Lru/mail/libverify/api/h$a;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/api/c$3;->b:Lru/mail/libverify/api/c$a;

    iget-boolean v1, v1, Lru/mail/libverify/api/c$a;->b:Z

    if-nez v1, :cond_1

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lru/mail/libverify/api/c$3;->b:Lru/mail/libverify/api/c$a;

    invoke-static {}, Lru/mail/libverify/api/c;->c()Ljava/util/regex/Pattern;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/regex/Matcher;->matches()Z

    move-result v2

    iput-boolean v2, v1, Lru/mail/libverify/api/c$a;->b:Z

    :cond_1
    return-object v0
.end method

.method public final b()J
    .locals 2

    iget-object v0, p0, Lru/mail/libverify/api/c$3;->c:Lru/mail/libverify/requests/response/SmsInfo;

    invoke-virtual {v0}, Lru/mail/libverify/requests/response/SmsInfo;->getTimeShiftMin()J

    move-result-wide v0

    return-wide v0
.end method

.method public final b(Ljava/lang/String;)Z
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/InterruptedException;

    invoke-direct {v0}, Ljava/lang/InterruptedException;-><init>()V

    throw v0

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/api/c$3;->c:Lru/mail/libverify/requests/response/SmsInfo;

    invoke-virtual {v0}, Lru/mail/libverify/requests/response/SmsInfo;->getSourceNumbers()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    iget-object v1, p0, Lru/mail/libverify/api/c$3;->b:Lru/mail/libverify/api/c$a;

    iget-boolean v1, v1, Lru/mail/libverify/api/c$a;->a:Z

    if-nez v1, :cond_1

    iget-object v1, p0, Lru/mail/libverify/api/c$3;->b:Lru/mail/libverify/api/c$a;

    iput-boolean v0, v1, Lru/mail/libverify/api/c$a;->a:Z

    :cond_1
    return v0
.end method

.method public final c()I
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/c$3;->c:Lru/mail/libverify/requests/response/SmsInfo;

    invoke-virtual {v0}, Lru/mail/libverify/requests/response/SmsInfo;->getDepth()I

    move-result v0

    return v0
.end method

.method public final d()I
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/c$3;->c:Lru/mail/libverify/requests/response/SmsInfo;

    invoke-virtual {v0}, Lru/mail/libverify/requests/response/SmsInfo;->getMaxSmsCount()I

    move-result v0

    return v0
.end method
