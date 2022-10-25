.class abstract enum Lru/mail/libverify/requests/g;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lru/mail/libverify/requests/g;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lru/mail/libverify/requests/g;

.field public static final enum DEVICE:Lru/mail/libverify/requests/g;

.field public static final enum NOTHING:Lru/mail/libverify/requests/g;

.field public static final enum PHONE:Lru/mail/libverify/requests/g;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Lru/mail/libverify/requests/g$1;

    const-string/jumbo v1, "DEVICE"

    invoke-direct {v0, v1}, Lru/mail/libverify/requests/g$1;-><init>(Ljava/lang/String;)V

    sput-object v0, Lru/mail/libverify/requests/g;->DEVICE:Lru/mail/libverify/requests/g;

    new-instance v0, Lru/mail/libverify/requests/g$2;

    const-string/jumbo v1, "PHONE"

    invoke-direct {v0, v1}, Lru/mail/libverify/requests/g$2;-><init>(Ljava/lang/String;)V

    sput-object v0, Lru/mail/libverify/requests/g;->PHONE:Lru/mail/libverify/requests/g;

    new-instance v0, Lru/mail/libverify/requests/g$3;

    const-string/jumbo v1, "NOTHING"

    invoke-direct {v0, v1}, Lru/mail/libverify/requests/g$3;-><init>(Ljava/lang/String;)V

    sput-object v0, Lru/mail/libverify/requests/g;->NOTHING:Lru/mail/libverify/requests/g;

    const/4 v0, 0x3

    new-array v0, v0, [Lru/mail/libverify/requests/g;

    const/4 v1, 0x0

    sget-object v2, Lru/mail/libverify/requests/g;->DEVICE:Lru/mail/libverify/requests/g;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lru/mail/libverify/requests/g;->PHONE:Lru/mail/libverify/requests/g;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    sget-object v2, Lru/mail/libverify/requests/g;->NOTHING:Lru/mail/libverify/requests/g;

    aput-object v2, v0, v1

    sput-object v0, Lru/mail/libverify/requests/g;->$VALUES:[Lru/mail/libverify/requests/g;

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

.method synthetic constructor <init>(Ljava/lang/String;IB)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lru/mail/libverify/requests/g;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lru/mail/libverify/requests/g;
    .locals 1

    const-class v0, Lru/mail/libverify/requests/g;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/requests/g;

    return-object v0
.end method

.method public static values()[Lru/mail/libverify/requests/g;
    .locals 1

    sget-object v0, Lru/mail/libverify/requests/g;->$VALUES:[Lru/mail/libverify/requests/g;

    invoke-virtual {v0}, [Lru/mail/libverify/requests/g;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lru/mail/libverify/requests/g;

    return-object v0
.end method


# virtual methods
.method public abstract a()Ljava/lang/String;
.end method
