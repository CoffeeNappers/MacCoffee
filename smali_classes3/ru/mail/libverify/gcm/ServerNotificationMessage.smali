.class public Lru/mail/libverify/gcm/ServerNotificationMessage;
.super Ljava/lang/Object;

# interfaces
.implements Lru/mail/libverify/utils/Gsonable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lru/mail/libverify/gcm/ServerNotificationMessage$Message;
    }
.end annotation


# instance fields
.field public deliveryMethod:Lru/mail/libverify/requests/k$b;

.field public hold_timeout:Ljava/lang/Integer;

.field public message:Lru/mail/libverify/gcm/ServerNotificationMessage$Message;

.field public sender:Ljava/lang/String;

.field public server_timestamp:J

.field public timestamp:J


# direct methods
.method public constructor <init>()V
    .locals 2

    const-wide/16 v0, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide v0, p0, Lru/mail/libverify/gcm/ServerNotificationMessage;->server_timestamp:J

    iput-wide v0, p0, Lru/mail/libverify/gcm/ServerNotificationMessage;->timestamp:J

    sget-object v0, Lru/mail/libverify/requests/k$b;->UNKNOWN:Lru/mail/libverify/requests/k$b;

    iput-object v0, p0, Lru/mail/libverify/gcm/ServerNotificationMessage;->deliveryMethod:Lru/mail/libverify/requests/k$b;

    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/String;
    .locals 4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lru/mail/libverify/gcm/ServerNotificationMessage;->message:Lru/mail/libverify/gcm/ServerNotificationMessage$Message;

    invoke-static {v1}, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->a(Lru/mail/libverify/gcm/ServerNotificationMessage$Message;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/gcm/ServerNotificationMessage;->message:Lru/mail/libverify/gcm/ServerNotificationMessage$Message;

    invoke-static {v1}, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->b(Lru/mail/libverify/gcm/ServerNotificationMessage$Message;)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-ne p0, p1, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_3

    :cond_2
    move v0, v1

    goto :goto_0

    :cond_3
    check-cast p1, Lru/mail/libverify/gcm/ServerNotificationMessage;

    iget-object v2, p0, Lru/mail/libverify/gcm/ServerNotificationMessage;->message:Lru/mail/libverify/gcm/ServerNotificationMessage$Message;

    if-eqz v2, :cond_4

    iget-object v0, p0, Lru/mail/libverify/gcm/ServerNotificationMessage;->message:Lru/mail/libverify/gcm/ServerNotificationMessage$Message;

    iget-object v1, p1, Lru/mail/libverify/gcm/ServerNotificationMessage;->message:Lru/mail/libverify/gcm/ServerNotificationMessage$Message;

    invoke-virtual {v0, v1}, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0

    :cond_4
    iget-object v2, p1, Lru/mail/libverify/gcm/ServerNotificationMessage;->message:Lru/mail/libverify/gcm/ServerNotificationMessage$Message;

    if-eqz v2, :cond_0

    move v0, v1

    goto :goto_0
.end method

.method public hashCode()I
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/gcm/ServerNotificationMessage;->message:Lru/mail/libverify/gcm/ServerNotificationMessage$Message;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/gcm/ServerNotificationMessage;->message:Lru/mail/libverify/gcm/ServerNotificationMessage$Message;

    invoke-virtual {v0}, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->hashCode()I

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "ServerNotificationMessage{message="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lru/mail/libverify/gcm/ServerNotificationMessage;->message:Lru/mail/libverify/gcm/ServerNotificationMessage$Message;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", sender=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/gcm/ServerNotificationMessage;->sender:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", timestamp="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lru/mail/libverify/gcm/ServerNotificationMessage;->timestamp:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", hold_timeout="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/gcm/ServerNotificationMessage;->hold_timeout:Ljava/lang/Integer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", deliveryMethod="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/gcm/ServerNotificationMessage;->deliveryMethod:Lru/mail/libverify/requests/k$b;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
