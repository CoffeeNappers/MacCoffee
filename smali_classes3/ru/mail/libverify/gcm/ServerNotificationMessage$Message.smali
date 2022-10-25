.class public Lru/mail/libverify/gcm/ServerNotificationMessage$Message;
.super Ljava/lang/Object;

# interfaces
.implements Lru/mail/libverify/utils/Gsonable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lru/mail/libverify/gcm/ServerNotificationMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Message"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls;,
        Lru/mail/libverify/gcm/ServerNotificationMessage$Message$b;,
        Lru/mail/libverify/gcm/ServerNotificationMessage$Message$a;
    }
.end annotation


# instance fields
.field public application_id:Ljava/lang/String;

.field public controls:Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls;

.field public delivery_flags:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lru/mail/libverify/gcm/ServerNotificationMessage$Message$a;",
            ">;"
        }
    .end annotation
.end field

.field public from:Ljava/lang/String;

.field public imei:Ljava/lang/String;

.field public imsi:Ljava/lang/String;

.field public phone:Ljava/lang/String;

.field public public_text:Ljava/lang/String;

.field private requester_id:J

.field public requester_package_name:Ljava/lang/String;

.field public session_id:Ljava/lang/String;

.field public text:Ljava/lang/String;

.field public type:Lru/mail/libverify/gcm/ServerNotificationMessage$Message$b;

.field public verification_url:Ljava/lang/String;

.field public verify_code:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic a(Lru/mail/libverify/gcm/ServerNotificationMessage$Message;)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->from:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic b(Lru/mail/libverify/gcm/ServerNotificationMessage$Message;)J
    .locals 2

    iget-wide v0, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->requester_id:J

    return-wide v0
.end method


# virtual methods
.method public final a()Z
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->controls:Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->controls:Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls;

    invoke-static {v0}, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls;->b(Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls;)Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls$Confirm;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->controls:Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls;

    invoke-static {v0}, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls;->b(Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls;)Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls$Confirm;

    move-result-object v0

    iget-object v0, v0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls$Confirm;->text:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 6

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
    check-cast p1, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;

    iget-wide v2, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->requester_id:J

    iget-wide v4, p1, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->requester_id:J

    cmp-long v2, v2, v4

    if-eqz v2, :cond_4

    move v0, v1

    goto :goto_0

    :cond_4
    iget-object v2, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->text:Ljava/lang/String;

    if-eqz v2, :cond_6

    iget-object v2, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->text:Ljava/lang/String;

    iget-object v3, p1, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->text:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_7

    :cond_5
    move v0, v1

    goto :goto_0

    :cond_6
    iget-object v2, p1, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->text:Ljava/lang/String;

    if-nez v2, :cond_5

    :cond_7
    iget-object v2, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->verify_code:Ljava/lang/String;

    if-eqz v2, :cond_9

    iget-object v2, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->verify_code:Ljava/lang/String;

    iget-object v3, p1, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->verify_code:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_a

    :cond_8
    move v0, v1

    goto :goto_0

    :cond_9
    iget-object v2, p1, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->verify_code:Ljava/lang/String;

    if-nez v2, :cond_8

    :cond_a
    iget-object v2, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->from:Ljava/lang/String;

    if-eqz v2, :cond_c

    iget-object v2, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->from:Ljava/lang/String;

    iget-object v3, p1, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->from:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_d

    :cond_b
    move v0, v1

    goto :goto_0

    :cond_c
    iget-object v2, p1, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->from:Ljava/lang/String;

    if-nez v2, :cond_b

    :cond_d
    iget-object v2, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->delivery_flags:Ljava/util/Set;

    if-eqz v2, :cond_f

    iget-object v2, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->delivery_flags:Ljava/util/Set;

    iget-object v3, p1, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->delivery_flags:Ljava/util/Set;

    invoke-interface {v2, v3}, Ljava/util/Set;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_10

    :cond_e
    move v0, v1

    goto :goto_0

    :cond_f
    iget-object v2, p1, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->delivery_flags:Ljava/util/Set;

    if-nez v2, :cond_e

    :cond_10
    iget-object v2, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->type:Lru/mail/libverify/gcm/ServerNotificationMessage$Message$b;

    iget-object v3, p1, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->type:Lru/mail/libverify/gcm/ServerNotificationMessage$Message$b;

    if-eq v2, v3, :cond_11

    move v0, v1

    goto :goto_0

    :cond_11
    iget-object v2, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->imsi:Ljava/lang/String;

    if-eqz v2, :cond_13

    iget-object v2, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->imsi:Ljava/lang/String;

    iget-object v3, p1, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->imsi:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_14

    :cond_12
    move v0, v1

    goto/16 :goto_0

    :cond_13
    iget-object v2, p1, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->imsi:Ljava/lang/String;

    if-nez v2, :cond_12

    :cond_14
    iget-object v2, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->imei:Ljava/lang/String;

    if-eqz v2, :cond_16

    iget-object v2, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->imei:Ljava/lang/String;

    iget-object v3, p1, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->imei:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_17

    :cond_15
    move v0, v1

    goto/16 :goto_0

    :cond_16
    iget-object v2, p1, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->imei:Ljava/lang/String;

    if-nez v2, :cond_15

    :cond_17
    iget-object v2, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->session_id:Ljava/lang/String;

    if-eqz v2, :cond_19

    iget-object v2, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->session_id:Ljava/lang/String;

    iget-object v3, p1, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->session_id:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1a

    :cond_18
    move v0, v1

    goto/16 :goto_0

    :cond_19
    iget-object v2, p1, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->session_id:Ljava/lang/String;

    if-nez v2, :cond_18

    :cond_1a
    iget-object v2, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->application_id:Ljava/lang/String;

    if-eqz v2, :cond_1c

    iget-object v2, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->application_id:Ljava/lang/String;

    iget-object v3, p1, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->application_id:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1d

    :cond_1b
    move v0, v1

    goto/16 :goto_0

    :cond_1c
    iget-object v2, p1, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->application_id:Ljava/lang/String;

    if-nez v2, :cond_1b

    :cond_1d
    iget-object v2, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->phone:Ljava/lang/String;

    if-eqz v2, :cond_1f

    iget-object v2, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->phone:Ljava/lang/String;

    iget-object v3, p1, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->phone:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_20

    :cond_1e
    move v0, v1

    goto/16 :goto_0

    :cond_1f
    iget-object v2, p1, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->phone:Ljava/lang/String;

    if-nez v2, :cond_1e

    :cond_20
    iget-object v2, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->controls:Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls;

    if-eqz v2, :cond_22

    iget-object v2, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->controls:Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls;

    iget-object v3, p1, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->controls:Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls;

    invoke-virtual {v2, v3}, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_23

    :cond_21
    move v0, v1

    goto/16 :goto_0

    :cond_22
    iget-object v2, p1, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->controls:Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls;

    if-nez v2, :cond_21

    :cond_23
    iget-object v2, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->verification_url:Ljava/lang/String;

    if-eqz v2, :cond_25

    iget-object v2, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->verification_url:Ljava/lang/String;

    iget-object v3, p1, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->verification_url:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_26

    :cond_24
    move v0, v1

    goto/16 :goto_0

    :cond_25
    iget-object v2, p1, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->verification_url:Ljava/lang/String;

    if-nez v2, :cond_24

    :cond_26
    iget-object v2, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->requester_package_name:Ljava/lang/String;

    if-eqz v2, :cond_27

    iget-object v0, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->requester_package_name:Ljava/lang/String;

    iget-object v1, p1, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->requester_package_name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto/16 :goto_0

    :cond_27
    iget-object v2, p1, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->requester_package_name:Ljava/lang/String;

    if-eqz v2, :cond_0

    move v0, v1

    goto/16 :goto_0
.end method

.method public hashCode()I
    .locals 6

    const/4 v1, 0x0

    iget-object v0, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->text:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->text:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    :goto_0
    mul-int/lit8 v2, v0, 0x1f

    iget-object v0, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->verify_code:Ljava/lang/String;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->verify_code:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    :goto_1
    add-int/2addr v0, v2

    mul-int/lit8 v2, v0, 0x1f

    iget-object v0, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->from:Ljava/lang/String;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->from:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    :goto_2
    add-int/2addr v0, v2

    mul-int/lit8 v2, v0, 0x1f

    iget-object v0, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->delivery_flags:Ljava/util/Set;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->delivery_flags:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->hashCode()I

    move-result v0

    :goto_3
    add-int/2addr v0, v2

    mul-int/lit8 v2, v0, 0x1f

    iget-object v0, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->type:Lru/mail/libverify/gcm/ServerNotificationMessage$Message$b;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->type:Lru/mail/libverify/gcm/ServerNotificationMessage$Message$b;

    invoke-virtual {v0}, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$b;->hashCode()I

    move-result v0

    :goto_4
    add-int/2addr v0, v2

    mul-int/lit8 v2, v0, 0x1f

    iget-object v0, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->imsi:Ljava/lang/String;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->imsi:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    :goto_5
    add-int/2addr v0, v2

    mul-int/lit8 v2, v0, 0x1f

    iget-object v0, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->imei:Ljava/lang/String;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->imei:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    :goto_6
    add-int/2addr v0, v2

    mul-int/lit8 v2, v0, 0x1f

    iget-object v0, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->session_id:Ljava/lang/String;

    if-eqz v0, :cond_8

    iget-object v0, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->session_id:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    :goto_7
    add-int/2addr v0, v2

    mul-int/lit8 v2, v0, 0x1f

    iget-object v0, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->application_id:Ljava/lang/String;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->application_id:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    :goto_8
    add-int/2addr v0, v2

    mul-int/lit8 v2, v0, 0x1f

    iget-object v0, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->phone:Ljava/lang/String;

    if-eqz v0, :cond_a

    iget-object v0, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->phone:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    :goto_9
    add-int/2addr v0, v2

    mul-int/lit8 v2, v0, 0x1f

    iget-object v0, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->controls:Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->controls:Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls;

    invoke-virtual {v0}, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls;->hashCode()I

    move-result v0

    :goto_a
    add-int/2addr v0, v2

    mul-int/lit8 v2, v0, 0x1f

    iget-object v0, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->verification_url:Ljava/lang/String;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->verification_url:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    :goto_b
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->requester_package_name:Ljava/lang/String;

    if-eqz v2, :cond_0

    iget-object v1, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->requester_package_name:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :cond_0
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-wide v2, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->requester_id:J

    iget-wide v4, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->requester_id:J

    const/16 v1, 0x20

    ushr-long/2addr v4, v1

    xor-long/2addr v2, v4

    long-to-int v1, v2

    add-int/2addr v0, v1

    return v0

    :cond_1
    move v0, v1

    goto/16 :goto_0

    :cond_2
    move v0, v1

    goto/16 :goto_1

    :cond_3
    move v0, v1

    goto/16 :goto_2

    :cond_4
    move v0, v1

    goto/16 :goto_3

    :cond_5
    move v0, v1

    goto/16 :goto_4

    :cond_6
    move v0, v1

    goto :goto_5

    :cond_7
    move v0, v1

    goto :goto_6

    :cond_8
    move v0, v1

    goto :goto_7

    :cond_9
    move v0, v1

    goto :goto_8

    :cond_a
    move v0, v1

    goto :goto_9

    :cond_b
    move v0, v1

    goto :goto_a

    :cond_c
    move v0, v1

    goto :goto_b
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    const/16 v4, 0x27

    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "Message{text=\'"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->text:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", from=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->from:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", session_id=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->session_id:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", requester_package_name="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->requester_package_name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", requester_id=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->requester_id:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
