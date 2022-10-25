.class public Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls;
.super Ljava/lang/Object;

# interfaces
.implements Lru/mail/libverify/utils/Gsonable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lru/mail/libverify/gcm/ServerNotificationMessage$Message;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Controls"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls$Description;,
        Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls$Confirm;
    }
.end annotation


# instance fields
.field private confirm:Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls$Confirm;

.field private description:Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls$Description;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static synthetic a(Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls;)Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls$Description;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls;->description:Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls$Description;

    return-object v0
.end method

.method public static synthetic b(Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls;)Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls$Confirm;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls;->confirm:Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls$Confirm;

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
    check-cast p1, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls;

    iget-object v2, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls;->confirm:Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls$Confirm;

    if-eqz v2, :cond_5

    iget-object v2, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls;->confirm:Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls$Confirm;

    iget-object v3, p1, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls;->confirm:Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls$Confirm;

    invoke-virtual {v2, v3}, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls$Confirm;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_6

    :cond_4
    move v0, v1

    goto :goto_0

    :cond_5
    iget-object v2, p1, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls;->confirm:Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls$Confirm;

    if-nez v2, :cond_4

    :cond_6
    iget-object v2, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls;->description:Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls$Description;

    if-eqz v2, :cond_7

    iget-object v0, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls;->description:Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls$Description;

    iget-object v1, p1, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls;->description:Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls$Description;

    invoke-virtual {v0, v1}, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls$Description;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0

    :cond_7
    iget-object v2, p1, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls;->description:Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls$Description;

    if-eqz v2, :cond_0

    move v0, v1

    goto :goto_0
.end method

.method public hashCode()I
    .locals 3

    const/4 v1, 0x0

    iget-object v0, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls;->confirm:Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls$Confirm;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls;->confirm:Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls$Confirm;

    invoke-virtual {v0}, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls$Confirm;->hashCode()I

    move-result v0

    :goto_0
    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls;->description:Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls$Description;

    if-eqz v2, :cond_0

    iget-object v1, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls;->description:Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls$Description;

    invoke-virtual {v1}, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls$Description;->hashCode()I

    move-result v1

    :cond_0
    add-int/2addr v0, v1

    return v0

    :cond_1
    move v0, v1

    goto :goto_0
.end method
