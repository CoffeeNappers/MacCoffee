.class public final enum Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lru/mail/libverify/requests/response/ClientApiResponseBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Status"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

.field public static final enum ATTEMPTLIMIT:Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;
    .annotation runtime Lru/mail/libverify/utils/json/b;
        a = "ATTEMPTLIMIT"
    .end annotation
.end field

.field public static final enum ERROR:Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;
    .annotation runtime Lru/mail/libverify/utils/json/b;
        a = "ERROR"
    .end annotation
.end field

.field public static final enum INCORRECT_PHONE_NUMBER:Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;
    .annotation runtime Lru/mail/libverify/utils/json/b;
        a = "INCORRECT_PHONE_NUMBER"
    .end annotation
.end field

.field public static final enum INCORRECT_SIGNATURE:Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;
    .annotation runtime Lru/mail/libverify/utils/json/b;
        a = "INCORRECT_SIGNATURE"
    .end annotation
.end field

.field public static final enum NOT_ENOUGH_DATA:Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;
    .annotation runtime Lru/mail/libverify/utils/json/b;
        a = "NOT_ENOUGH_DATA"
    .end annotation
.end field

.field public static final enum OK:Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;
    .annotation runtime Lru/mail/libverify/utils/json/b;
        a = "OK"
    .end annotation
.end field

.field public static final enum PHONE_NUMBER_IN_BLACK_LIST:Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;
    .annotation runtime Lru/mail/libverify/utils/json/b;
        a = "PHONE_NUMBER_IN_BLACK_LIST"
    .end annotation
.end field

.field public static final enum PHONE_NUMBER_TYPE_NOT_ALLOWED:Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;
    .annotation runtime Lru/mail/libverify/utils/json/b;
        a = "PHONE_NUMBER_TYPE_NOT_ALLOWED"
    .end annotation
.end field

.field public static final enum RATELIMIT:Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;
    .annotation runtime Lru/mail/libverify/utils/json/b;
        a = "RATELIMIT"
    .end annotation
.end field

.field public static final enum UNKNOWN:Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

.field public static final enum UNSUPPORTED_NUMBER:Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;
    .annotation runtime Lru/mail/libverify/utils/json/b;
        a = "UNSUPPORTED_NUMBER"
    .end annotation
.end field

.field public static final enum VERIFIED:Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;
    .annotation runtime Lru/mail/libverify/utils/json/b;
        a = "VERIFIED"
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 8

    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    new-instance v0, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    const-string/jumbo v1, "OK"

    invoke-direct {v0, v1, v3}, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->OK:Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    new-instance v0, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    const-string/jumbo v1, "ERROR"

    invoke-direct {v0, v1, v4}, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->ERROR:Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    new-instance v0, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    const-string/jumbo v1, "VERIFIED"

    invoke-direct {v0, v1, v5}, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->VERIFIED:Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    new-instance v0, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    const-string/jumbo v1, "UNSUPPORTED_NUMBER"

    invoke-direct {v0, v1, v6}, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->UNSUPPORTED_NUMBER:Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    new-instance v0, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    const-string/jumbo v1, "INCORRECT_PHONE_NUMBER"

    invoke-direct {v0, v1, v7}, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->INCORRECT_PHONE_NUMBER:Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    new-instance v0, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    const-string/jumbo v1, "PHONE_NUMBER_IN_BLACK_LIST"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->PHONE_NUMBER_IN_BLACK_LIST:Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    new-instance v0, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    const-string/jumbo v1, "PHONE_NUMBER_TYPE_NOT_ALLOWED"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->PHONE_NUMBER_TYPE_NOT_ALLOWED:Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    new-instance v0, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    const-string/jumbo v1, "RATELIMIT"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->RATELIMIT:Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    new-instance v0, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    const-string/jumbo v1, "ATTEMPTLIMIT"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->ATTEMPTLIMIT:Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    new-instance v0, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    const-string/jumbo v1, "INCORRECT_SIGNATURE"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->INCORRECT_SIGNATURE:Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    new-instance v0, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    const-string/jumbo v1, "NOT_ENOUGH_DATA"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->NOT_ENOUGH_DATA:Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    new-instance v0, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    const-string/jumbo v1, "UNKNOWN"

    const/16 v2, 0xb

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->UNKNOWN:Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    const/16 v0, 0xc

    new-array v0, v0, [Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    sget-object v1, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->OK:Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    aput-object v1, v0, v3

    sget-object v1, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->ERROR:Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    aput-object v1, v0, v4

    sget-object v1, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->VERIFIED:Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    aput-object v1, v0, v5

    sget-object v1, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->UNSUPPORTED_NUMBER:Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    aput-object v1, v0, v6

    sget-object v1, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->INCORRECT_PHONE_NUMBER:Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->PHONE_NUMBER_IN_BLACK_LIST:Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->PHONE_NUMBER_TYPE_NOT_ALLOWED:Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->RATELIMIT:Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->ATTEMPTLIMIT:Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->INCORRECT_SIGNATURE:Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->NOT_ENOUGH_DATA:Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->UNKNOWN:Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    aput-object v2, v0, v1

    sput-object v0, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->$VALUES:[Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

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

.method public static valueOf(Ljava/lang/String;)Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;
    .locals 1

    const-class v0, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    return-object v0
.end method

.method public static values()[Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;
    .locals 1

    sget-object v0, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->$VALUES:[Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    invoke-virtual {v0}, [Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    return-object v0
.end method
