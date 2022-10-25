.class public final Lru/mail/libverify/requests/response/FetcherInfo;
.super Ljava/lang/Object;

# interfaces
.implements Lru/mail/libverify/utils/Gsonable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lru/mail/libverify/requests/response/FetcherInfo$DetailStatus;,
        Lru/mail/libverify/requests/response/FetcherInfo$Status;
    }
.end annotation


# instance fields
.field private detail_status:Lru/mail/libverify/requests/response/FetcherInfo$DetailStatus;

.field private lastModified:J

.field private status:Lru/mail/libverify/requests/response/FetcherInfo$Status;

.field private timeout:I

.field private timestamp:J

.field private url:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final getLastModified()J
    .locals 2

    iget-wide v0, p0, Lru/mail/libverify/requests/response/FetcherInfo;->lastModified:J

    return-wide v0
.end method

.method public final getStatus()Lru/mail/libverify/requests/response/FetcherInfo$Status;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/requests/response/FetcherInfo;->status:Lru/mail/libverify/requests/response/FetcherInfo$Status;

    if-nez v0, :cond_0

    sget-object v0, Lru/mail/libverify/requests/response/FetcherInfo$Status;->UNKNOWN:Lru/mail/libverify/requests/response/FetcherInfo$Status;

    iput-object v0, p0, Lru/mail/libverify/requests/response/FetcherInfo;->status:Lru/mail/libverify/requests/response/FetcherInfo$Status;

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/requests/response/FetcherInfo;->status:Lru/mail/libverify/requests/response/FetcherInfo$Status;

    return-object v0
.end method

.method public final getTimeout()I
    .locals 1

    iget v0, p0, Lru/mail/libverify/requests/response/FetcherInfo;->timeout:I

    return v0
.end method

.method public final getTimestamp()J
    .locals 2

    iget-wide v0, p0, Lru/mail/libverify/requests/response/FetcherInfo;->timestamp:J

    return-wide v0
.end method

.method public final getUrl()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/requests/response/FetcherInfo;->url:Ljava/lang/String;

    return-object v0
.end method

.method public final setLastModified(Ljava/lang/Long;)V
    .locals 2
    .param p1    # Ljava/lang/Long;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    if-nez p1, :cond_0

    :goto_0
    return-void

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    iput-wide v0, p0, Lru/mail/libverify/requests/response/FetcherInfo;->lastModified:J

    goto :goto_0
.end method

.method public final setTimestamp(J)V
    .locals 1

    iput-wide p1, p0, Lru/mail/libverify/requests/response/FetcherInfo;->timestamp:J

    return-void
.end method

.method public final toString()Ljava/lang/String;
    .locals 4

    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "FetcherInfo{timeout="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lru/mail/libverify/requests/response/FetcherInfo;->timeout:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", url=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/requests/response/FetcherInfo;->url:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", timestamp="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lru/mail/libverify/requests/response/FetcherInfo;->timestamp:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", lastModified="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lru/mail/libverify/requests/response/FetcherInfo;->lastModified:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", status="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/requests/response/FetcherInfo;->status:Lru/mail/libverify/requests/response/FetcherInfo$Status;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", detail_status="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/requests/response/FetcherInfo;->detail_status:Lru/mail/libverify/requests/response/FetcherInfo$DetailStatus;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
