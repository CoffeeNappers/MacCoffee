.class public final Lru/mail/libverify/requests/response/PhoneInfoResponse;
.super Lru/mail/libverify/requests/response/ClientApiResponseBase;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lru/mail/libverify/requests/response/PhoneInfoResponse$TypingCheck;,
        Lru/mail/libverify/requests/response/PhoneInfoResponse$Info;
    }
.end annotation


# instance fields
.field private info:Lru/mail/libverify/requests/response/PhoneInfoResponse$Info;

.field private printable:[Ljava/lang/String;

.field private typing_check:Lru/mail/libverify/requests/response/PhoneInfoResponse$TypingCheck;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lru/mail/libverify/requests/response/ClientApiResponseBase;-><init>()V

    return-void
.end method


# virtual methods
.method public final getPrintable()[Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lru/mail/libverify/requests/response/PhoneInfoResponse;->printable:[Ljava/lang/String;

    return-object v0
.end method

.method public final getTypingCheck()Lru/mail/libverify/requests/response/PhoneInfoResponse$TypingCheck;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lru/mail/libverify/requests/response/PhoneInfoResponse;->typing_check:Lru/mail/libverify/requests/response/PhoneInfoResponse$TypingCheck;

    return-object v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "PhoneInfoResponse{info="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lru/mail/libverify/requests/response/PhoneInfoResponse;->info:Lru/mail/libverify/requests/response/PhoneInfoResponse$Info;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", printable="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/requests/response/PhoneInfoResponse;->printable:[Ljava/lang/String;

    invoke-static {v1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", typing_check="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/requests/response/PhoneInfoResponse;->typing_check:Lru/mail/libverify/requests/response/PhoneInfoResponse$TypingCheck;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
