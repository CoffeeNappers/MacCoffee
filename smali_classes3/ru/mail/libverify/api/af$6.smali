.class final Lru/mail/libverify/api/af$6;
.super Ljava/lang/Object;

# interfaces
.implements Lru/mail/libverify/sms/g$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lru/mail/libverify/api/af;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lru/mail/libverify/api/af;


# direct methods
.method constructor <init>(Lru/mail/libverify/api/af;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/api/af$6;->a:Lru/mail/libverify/api/af;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()J
    .locals 2

    iget-object v0, p0, Lru/mail/libverify/api/af$6;->a:Lru/mail/libverify/api/af;

    invoke-static {v0}, Lru/mail/libverify/api/af;->b(Lru/mail/libverify/api/af;)Lru/mail/libverify/api/SessionData;

    move-result-object v0

    iget-wide v0, v0, Lru/mail/libverify/api/SessionData;->startTimeStamp:J

    return-wide v0
.end method

.method public final a(Ljava/util/List;)V
    .locals 4
    .param p1    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    return-void

    :cond_1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget-object v2, p0, Lru/mail/libverify/api/af$6;->a:Lru/mail/libverify/api/af;

    const/4 v3, 0x0

    invoke-static {v2, v0, v3}, Lru/mail/libverify/api/af;->a(Lru/mail/libverify/api/af;Ljava/lang/String;Z)Z

    goto :goto_0
.end method
