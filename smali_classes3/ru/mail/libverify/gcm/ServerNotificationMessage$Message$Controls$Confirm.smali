.class public Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls$Confirm;
.super Ljava/lang/Object;

# interfaces
.implements Lru/mail/libverify/utils/Gsonable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Confirm"
.end annotation


# instance fields
.field private enableTimeoutSec:I

.field text:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static synthetic a(Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls$Confirm;)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls$Confirm;->text:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
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
    check-cast p1, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls$Confirm;

    iget v2, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls$Confirm;->enableTimeoutSec:I

    iget v3, p1, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls$Confirm;->enableTimeoutSec:I

    if-eq v2, v3, :cond_4

    move v0, v1

    goto :goto_0

    :cond_4
    iget-object v2, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls$Confirm;->text:Ljava/lang/String;

    if-eqz v2, :cond_5

    iget-object v0, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls$Confirm;->text:Ljava/lang/String;

    iget-object v1, p1, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls$Confirm;->text:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0

    :cond_5
    iget-object v2, p1, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls$Confirm;->text:Ljava/lang/String;

    if-eqz v2, :cond_0

    move v0, v1

    goto :goto_0
.end method

.method public hashCode()I
    .locals 2

    iget-object v0, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls$Confirm;->text:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls$Confirm;->text:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    :goto_0
    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls$Confirm;->enableTimeoutSec:I

    add-int/2addr v0, v1

    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
