.class final enum Lru/mail/libverify/api/d;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lru/mail/libverify/api/d;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lru/mail/libverify/api/d;

.field public static final enum ATTESTATION_FAILED:Lru/mail/libverify/api/d;

.field public static final enum GENERAL_ERROR:Lru/mail/libverify/api/d;

.field public static final enum GP_SERVICE_NOT_AVAILABLE:Lru/mail/libverify/api/d;

.field public static final enum SUCCESS:Lru/mail/libverify/api/d;

.field public static final enum UNKNOWN:Lru/mail/libverify/api/d;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    new-instance v0, Lru/mail/libverify/api/d;

    const-string/jumbo v1, "SUCCESS"

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/api/d;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/api/d;->SUCCESS:Lru/mail/libverify/api/d;

    new-instance v0, Lru/mail/libverify/api/d;

    const-string/jumbo v1, "ATTESTATION_FAILED"

    invoke-direct {v0, v1, v3}, Lru/mail/libverify/api/d;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/api/d;->ATTESTATION_FAILED:Lru/mail/libverify/api/d;

    new-instance v0, Lru/mail/libverify/api/d;

    const-string/jumbo v1, "GP_SERVICE_NOT_AVAILABLE"

    invoke-direct {v0, v1, v4}, Lru/mail/libverify/api/d;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/api/d;->GP_SERVICE_NOT_AVAILABLE:Lru/mail/libverify/api/d;

    new-instance v0, Lru/mail/libverify/api/d;

    const-string/jumbo v1, "GENERAL_ERROR"

    invoke-direct {v0, v1, v5}, Lru/mail/libverify/api/d;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/api/d;->GENERAL_ERROR:Lru/mail/libverify/api/d;

    new-instance v0, Lru/mail/libverify/api/d;

    const-string/jumbo v1, "UNKNOWN"

    invoke-direct {v0, v1, v6}, Lru/mail/libverify/api/d;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/api/d;->UNKNOWN:Lru/mail/libverify/api/d;

    const/4 v0, 0x5

    new-array v0, v0, [Lru/mail/libverify/api/d;

    sget-object v1, Lru/mail/libverify/api/d;->SUCCESS:Lru/mail/libverify/api/d;

    aput-object v1, v0, v2

    sget-object v1, Lru/mail/libverify/api/d;->ATTESTATION_FAILED:Lru/mail/libverify/api/d;

    aput-object v1, v0, v3

    sget-object v1, Lru/mail/libverify/api/d;->GP_SERVICE_NOT_AVAILABLE:Lru/mail/libverify/api/d;

    aput-object v1, v0, v4

    sget-object v1, Lru/mail/libverify/api/d;->GENERAL_ERROR:Lru/mail/libverify/api/d;

    aput-object v1, v0, v5

    sget-object v1, Lru/mail/libverify/api/d;->UNKNOWN:Lru/mail/libverify/api/d;

    aput-object v1, v0, v6

    sput-object v0, Lru/mail/libverify/api/d;->$VALUES:[Lru/mail/libverify/api/d;

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

.method public static valueOf(Ljava/lang/String;)Lru/mail/libverify/api/d;
    .locals 1

    const-class v0, Lru/mail/libverify/api/d;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/api/d;

    return-object v0
.end method

.method public static values()[Lru/mail/libverify/api/d;
    .locals 1

    sget-object v0, Lru/mail/libverify/api/d;->$VALUES:[Lru/mail/libverify/api/d;

    invoke-virtual {v0}, [Lru/mail/libverify/api/d;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lru/mail/libverify/api/d;

    return-object v0
.end method
