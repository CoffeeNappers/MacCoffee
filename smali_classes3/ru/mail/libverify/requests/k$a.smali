.class public final enum Lru/mail/libverify/requests/k$a;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lru/mail/libverify/requests/k;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lru/mail/libverify/requests/k$a;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lru/mail/libverify/requests/k$a;

.field public static final enum SERVER_INFO:Lru/mail/libverify/requests/k$a;

.field public static final enum SMS_CODE:Lru/mail/libverify/requests/k$a;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const/4 v3, 0x1

    const/4 v2, 0x0

    new-instance v0, Lru/mail/libverify/requests/k$a;

    const-string/jumbo v1, "SMS_CODE"

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/requests/k$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/requests/k$a;->SMS_CODE:Lru/mail/libverify/requests/k$a;

    new-instance v0, Lru/mail/libverify/requests/k$a;

    const-string/jumbo v1, "SERVER_INFO"

    invoke-direct {v0, v1, v3}, Lru/mail/libverify/requests/k$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/requests/k$a;->SERVER_INFO:Lru/mail/libverify/requests/k$a;

    const/4 v0, 0x2

    new-array v0, v0, [Lru/mail/libverify/requests/k$a;

    sget-object v1, Lru/mail/libverify/requests/k$a;->SMS_CODE:Lru/mail/libverify/requests/k$a;

    aput-object v1, v0, v2

    sget-object v1, Lru/mail/libverify/requests/k$a;->SERVER_INFO:Lru/mail/libverify/requests/k$a;

    aput-object v1, v0, v3

    sput-object v0, Lru/mail/libverify/requests/k$a;->$VALUES:[Lru/mail/libverify/requests/k$a;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lru/mail/libverify/requests/k$a;
    .locals 1

    const-class v0, Lru/mail/libverify/requests/k$a;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/requests/k$a;

    return-object v0
.end method

.method public static values()[Lru/mail/libverify/requests/k$a;
    .locals 1

    sget-object v0, Lru/mail/libverify/requests/k$a;->$VALUES:[Lru/mail/libverify/requests/k$a;

    invoke-virtual {v0}, [Lru/mail/libverify/requests/k$a;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lru/mail/libverify/requests/k$a;

    return-object v0
.end method
