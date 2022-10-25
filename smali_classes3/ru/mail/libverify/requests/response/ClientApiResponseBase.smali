.class public Lru/mail/libverify/requests/response/ClientApiResponseBase;
.super Ljava/lang/Object;

# interfaces
.implements Lru/mail/libverify/utils/Gsonable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lru/mail/libverify/requests/response/ClientApiResponseBase$DetailStatus;,
        Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;
    }
.end annotation


# instance fields
.field private transient a:Lru/mail/libverify/requests/e;

.field private description:Ljava/lang/String;

.field private detail_status:Lru/mail/libverify/requests/response/ClientApiResponseBase$DetailStatus;

.field private status:Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;


# direct methods
.method protected constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getDescription()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/requests/response/ClientApiResponseBase;->description:Ljava/lang/String;

    return-object v0
.end method

.method public getDetailStatus()Lru/mail/libverify/requests/response/ClientApiResponseBase$DetailStatus;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/requests/response/ClientApiResponseBase;->detail_status:Lru/mail/libverify/requests/response/ClientApiResponseBase$DetailStatus;

    if-nez v0, :cond_0

    sget-object v0, Lru/mail/libverify/requests/response/ClientApiResponseBase$DetailStatus;->UNKNOWN:Lru/mail/libverify/requests/response/ClientApiResponseBase$DetailStatus;

    iput-object v0, p0, Lru/mail/libverify/requests/response/ClientApiResponseBase;->detail_status:Lru/mail/libverify/requests/response/ClientApiResponseBase$DetailStatus;

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/requests/response/ClientApiResponseBase;->detail_status:Lru/mail/libverify/requests/response/ClientApiResponseBase$DetailStatus;

    return-object v0
.end method

.method public getOwner()Lru/mail/libverify/requests/e;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/requests/response/ClientApiResponseBase;->a:Lru/mail/libverify/requests/e;

    return-object v0
.end method

.method public getStatus()Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/requests/response/ClientApiResponseBase;->status:Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    if-nez v0, :cond_0

    sget-object v0, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->UNKNOWN:Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    iput-object v0, p0, Lru/mail/libverify/requests/response/ClientApiResponseBase;->status:Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/requests/response/ClientApiResponseBase;->status:Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    return-object v0
.end method

.method public setOwner(Lru/mail/libverify/requests/e;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/requests/response/ClientApiResponseBase;->a:Lru/mail/libverify/requests/e;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    const/16 v2, 0x27

    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "ClientApiResponseBase{status="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lru/mail/libverify/requests/response/ClientApiResponseBase;->status:Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", description=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/requests/response/ClientApiResponseBase;->description:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", detail_status=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/requests/response/ClientApiResponseBase;->detail_status:Lru/mail/libverify/requests/response/ClientApiResponseBase$DetailStatus;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
