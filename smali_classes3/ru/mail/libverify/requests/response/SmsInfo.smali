.class public Lru/mail/libverify/requests/response/SmsInfo;
.super Ljava/lang/Object;

# interfaces
.implements Lru/mail/libverify/utils/Gsonable;


# instance fields
.field private depth:I

.field private max_sms:I

.field private sms_templates:[Ljava/lang/String;

.field private source_numbers:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private timeshift_max:J

.field private timeshift_min:J

.field private timestamp:J


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getDepth()I
    .locals 1

    iget v0, p0, Lru/mail/libverify/requests/response/SmsInfo;->depth:I

    return v0
.end method

.method public getMaxSmsCount()I
    .locals 1

    iget v0, p0, Lru/mail/libverify/requests/response/SmsInfo;->max_sms:I

    return v0
.end method

.method public getSmsTemplates()[Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lru/mail/libverify/requests/response/SmsInfo;->sms_templates:[Ljava/lang/String;

    return-object v0
.end method

.method public getSourceNumbers()Ljava/util/Set;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lru/mail/libverify/requests/response/SmsInfo;->source_numbers:Ljava/util/Set;

    return-object v0
.end method

.method public getTimeShiftMax()J
    .locals 4

    iget-wide v0, p0, Lru/mail/libverify/requests/response/SmsInfo;->timeshift_max:J

    const-wide/16 v2, 0x3e8

    mul-long/2addr v0, v2

    return-wide v0
.end method

.method public getTimeShiftMin()J
    .locals 4

    iget-wide v0, p0, Lru/mail/libverify/requests/response/SmsInfo;->timeshift_min:J

    const-wide/16 v2, 0x3e8

    mul-long/2addr v0, v2

    return-wide v0
.end method

.method public setTimestamp(J)V
    .locals 1

    iput-wide p1, p0, Lru/mail/libverify/requests/response/SmsInfo;->timestamp:J

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "SmsInfo{timeshift_max="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v2, p0, Lru/mail/libverify/requests/response/SmsInfo;->timeshift_max:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", timeshift_min="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lru/mail/libverify/requests/response/SmsInfo;->timeshift_min:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", depth="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lru/mail/libverify/requests/response/SmsInfo;->depth:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", max_sms="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lru/mail/libverify/requests/response/SmsInfo;->max_sms:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
