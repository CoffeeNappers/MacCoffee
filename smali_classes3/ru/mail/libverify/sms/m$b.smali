.class enum Lru/mail/libverify/sms/m$b;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lru/mail/libverify/sms/m;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4008
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lru/mail/libverify/sms/m$b;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lru/mail/libverify/sms/m$b;

.field public static final enum DRAFT:Lru/mail/libverify/sms/m$b;

.field public static final enum FAILED:Lru/mail/libverify/sms/m$b;

.field public static final enum INBOX:Lru/mail/libverify/sms/m$b;

.field public static final enum OUTBOX:Lru/mail/libverify/sms/m$b;

.field public static final enum QUEUED:Lru/mail/libverify/sms/m$b;

.field public static final enum SENT:Lru/mail/libverify/sms/m$b;

.field public static final enum UNKNOWN:Lru/mail/libverify/sms/m$b;

.field private static final values:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lru/mail/libverify/sms/m$b;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final mCode:I


# direct methods
.method static constructor <clinit>()V
    .locals 7

    const/4 v6, 0x5

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x6

    new-instance v0, Lru/mail/libverify/sms/m$b$1;

    const-string/jumbo v1, "INBOX"

    invoke-direct {v0, v1}, Lru/mail/libverify/sms/m$b$1;-><init>(Ljava/lang/String;)V

    sput-object v0, Lru/mail/libverify/sms/m$b;->INBOX:Lru/mail/libverify/sms/m$b;

    new-instance v0, Lru/mail/libverify/sms/m$b$2;

    const-string/jumbo v1, "SENT"

    invoke-direct {v0, v1}, Lru/mail/libverify/sms/m$b$2;-><init>(Ljava/lang/String;)V

    sput-object v0, Lru/mail/libverify/sms/m$b;->SENT:Lru/mail/libverify/sms/m$b;

    new-instance v0, Lru/mail/libverify/sms/m$b;

    const-string/jumbo v1, "DRAFT"

    invoke-direct {v0, v1, v4, v5}, Lru/mail/libverify/sms/m$b;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lru/mail/libverify/sms/m$b;->DRAFT:Lru/mail/libverify/sms/m$b;

    new-instance v0, Lru/mail/libverify/sms/m$b$3;

    const-string/jumbo v1, "OUTBOX"

    invoke-direct {v0, v1}, Lru/mail/libverify/sms/m$b$3;-><init>(Ljava/lang/String;)V

    sput-object v0, Lru/mail/libverify/sms/m$b;->OUTBOX:Lru/mail/libverify/sms/m$b;

    new-instance v0, Lru/mail/libverify/sms/m$b$4;

    const-string/jumbo v1, "FAILED"

    invoke-direct {v0, v1}, Lru/mail/libverify/sms/m$b$4;-><init>(Ljava/lang/String;)V

    sput-object v0, Lru/mail/libverify/sms/m$b;->FAILED:Lru/mail/libverify/sms/m$b;

    new-instance v0, Lru/mail/libverify/sms/m$b;

    const-string/jumbo v1, "QUEUED"

    invoke-direct {v0, v1, v6, v3}, Lru/mail/libverify/sms/m$b;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lru/mail/libverify/sms/m$b;->QUEUED:Lru/mail/libverify/sms/m$b;

    new-instance v0, Lru/mail/libverify/sms/m$b;

    const-string/jumbo v1, "UNKNOWN"

    const/4 v2, -0x1

    invoke-direct {v0, v1, v3, v2}, Lru/mail/libverify/sms/m$b;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lru/mail/libverify/sms/m$b;->UNKNOWN:Lru/mail/libverify/sms/m$b;

    const/4 v0, 0x7

    new-array v0, v0, [Lru/mail/libverify/sms/m$b;

    const/4 v1, 0x0

    sget-object v2, Lru/mail/libverify/sms/m$b;->INBOX:Lru/mail/libverify/sms/m$b;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lru/mail/libverify/sms/m$b;->SENT:Lru/mail/libverify/sms/m$b;

    aput-object v2, v0, v1

    sget-object v1, Lru/mail/libverify/sms/m$b;->DRAFT:Lru/mail/libverify/sms/m$b;

    aput-object v1, v0, v4

    sget-object v1, Lru/mail/libverify/sms/m$b;->OUTBOX:Lru/mail/libverify/sms/m$b;

    aput-object v1, v0, v5

    const/4 v1, 0x4

    sget-object v2, Lru/mail/libverify/sms/m$b;->FAILED:Lru/mail/libverify/sms/m$b;

    aput-object v2, v0, v1

    sget-object v1, Lru/mail/libverify/sms/m$b;->QUEUED:Lru/mail/libverify/sms/m$b;

    aput-object v1, v0, v6

    sget-object v1, Lru/mail/libverify/sms/m$b;->UNKNOWN:Lru/mail/libverify/sms/m$b;

    aput-object v1, v0, v3

    sput-object v0, Lru/mail/libverify/sms/m$b;->$VALUES:[Lru/mail/libverify/sms/m$b;

    new-instance v0, Lru/mail/libverify/sms/m$b$5;

    invoke-direct {v0}, Lru/mail/libverify/sms/m$b$5;-><init>()V

    sput-object v0, Lru/mail/libverify/sms/m$b;->values:Landroid/util/SparseArray;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lru/mail/libverify/sms/m$b;->mCode:I

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;IIB)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lru/mail/libverify/sms/m$b;-><init>(Ljava/lang/String;II)V

    return-void
.end method

.method static synthetic a(Lru/mail/libverify/sms/m$b;)I
    .locals 1

    iget v0, p0, Lru/mail/libverify/sms/m$b;->mCode:I

    return v0
.end method

.method public static a(I)Lru/mail/libverify/sms/m$b;
    .locals 1

    sget-object v0, Lru/mail/libverify/sms/m$b;->values:Landroid/util/SparseArray;

    invoke-virtual {v0, p0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/sms/m$b;

    if-nez v0, :cond_0

    sget-object v0, Lru/mail/libverify/sms/m$b;->UNKNOWN:Lru/mail/libverify/sms/m$b;

    :cond_0
    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lru/mail/libverify/sms/m$b;
    .locals 1

    const-class v0, Lru/mail/libverify/sms/m$b;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/sms/m$b;

    return-object v0
.end method

.method public static values()[Lru/mail/libverify/sms/m$b;
    .locals 1

    sget-object v0, Lru/mail/libverify/sms/m$b;->$VALUES:[Lru/mail/libverify/sms/m$b;

    invoke-virtual {v0}, [Lru/mail/libverify/sms/m$b;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lru/mail/libverify/sms/m$b;

    return-object v0
.end method


# virtual methods
.method public a(Lru/mail/libverify/sms/m;Lru/mail/libverify/sms/b;)V
    .locals 5

    const-string/jumbo v0, "SmsManager"

    const-string/jumbo v1, ">>> Unprocessable message type: %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p2, Lru/mail/libverify/sms/b;->b:Lru/mail/libverify/sms/m$b;

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method
