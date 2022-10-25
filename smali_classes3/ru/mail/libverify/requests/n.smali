.class abstract enum Lru/mail/libverify/requests/n;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lru/mail/libverify/requests/n;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lru/mail/libverify/requests/n;

.field public static final enum BLOCK:Lru/mail/libverify/requests/n;

.field public static final enum CHECK:Lru/mail/libverify/requests/n;

.field public static final enum CHECK_INTERCEPTED:Lru/mail/libverify/requests/n;

.field public static final enum CHECK_SETTINGS_PACKAGES_CHANGED:Lru/mail/libverify/requests/n;

.field public static final enum CHECK_SETTINGS_RESTART:Lru/mail/libverify/requests/n;

.field public static final enum CHECK_SETTINGS_TIMER:Lru/mail/libverify/requests/n;

.field public static final enum CONFIRM_APP_CHECK:Lru/mail/libverify/requests/n;

.field public static final enum NO_ACTION:Lru/mail/libverify/requests/n;

.field public static final enum PING_RESPONSE_FETCHER:Lru/mail/libverify/requests/n;

.field public static final enum PING_RESPONSE_GCM:Lru/mail/libverify/requests/n;

.field public static final enum REPORT_NO_GCM_SERVICE:Lru/mail/libverify/requests/n;

.field public static final enum REPORT_PHONE_NUMBER_REUSE:Lru/mail/libverify/requests/n;

.field public static final enum REPORT_SIGNOUT:Lru/mail/libverify/requests/n;

.field public static final enum REPORT_SOFT_SIGNOUT:Lru/mail/libverify/requests/n;

.field public static final enum REPORT_SPAM:Lru/mail/libverify/requests/n;

.field public static final enum REQUEST_APP_CHECK_ID:Lru/mail/libverify/requests/n;

.field public static final enum REQUEST_SMS_INFO:Lru/mail/libverify/requests/n;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Lru/mail/libverify/requests/n$1;

    const-string/jumbo v1, "REPORT_PHONE_NUMBER_REUSE"

    invoke-direct {v0, v1}, Lru/mail/libverify/requests/n$1;-><init>(Ljava/lang/String;)V

    sput-object v0, Lru/mail/libverify/requests/n;->REPORT_PHONE_NUMBER_REUSE:Lru/mail/libverify/requests/n;

    new-instance v0, Lru/mail/libverify/requests/n$10;

    const-string/jumbo v1, "REPORT_SPAM"

    invoke-direct {v0, v1}, Lru/mail/libverify/requests/n$10;-><init>(Ljava/lang/String;)V

    sput-object v0, Lru/mail/libverify/requests/n;->REPORT_SPAM:Lru/mail/libverify/requests/n;

    new-instance v0, Lru/mail/libverify/requests/n$11;

    const-string/jumbo v1, "BLOCK"

    invoke-direct {v0, v1}, Lru/mail/libverify/requests/n$11;-><init>(Ljava/lang/String;)V

    sput-object v0, Lru/mail/libverify/requests/n;->BLOCK:Lru/mail/libverify/requests/n;

    new-instance v0, Lru/mail/libverify/requests/n$12;

    const-string/jumbo v1, "CHECK"

    invoke-direct {v0, v1}, Lru/mail/libverify/requests/n$12;-><init>(Ljava/lang/String;)V

    sput-object v0, Lru/mail/libverify/requests/n;->CHECK:Lru/mail/libverify/requests/n;

    new-instance v0, Lru/mail/libverify/requests/n$13;

    const-string/jumbo v1, "REPORT_SIGNOUT"

    invoke-direct {v0, v1}, Lru/mail/libverify/requests/n$13;-><init>(Ljava/lang/String;)V

    sput-object v0, Lru/mail/libverify/requests/n;->REPORT_SIGNOUT:Lru/mail/libverify/requests/n;

    new-instance v0, Lru/mail/libverify/requests/n$14;

    const-string/jumbo v1, "REPORT_SOFT_SIGNOUT"

    invoke-direct {v0, v1}, Lru/mail/libverify/requests/n$14;-><init>(Ljava/lang/String;)V

    sput-object v0, Lru/mail/libverify/requests/n;->REPORT_SOFT_SIGNOUT:Lru/mail/libverify/requests/n;

    new-instance v0, Lru/mail/libverify/requests/n$15;

    const-string/jumbo v1, "REPORT_NO_GCM_SERVICE"

    invoke-direct {v0, v1}, Lru/mail/libverify/requests/n$15;-><init>(Ljava/lang/String;)V

    sput-object v0, Lru/mail/libverify/requests/n;->REPORT_NO_GCM_SERVICE:Lru/mail/libverify/requests/n;

    new-instance v0, Lru/mail/libverify/requests/n$16;

    const-string/jumbo v1, "REQUEST_SMS_INFO"

    invoke-direct {v0, v1}, Lru/mail/libverify/requests/n$16;-><init>(Ljava/lang/String;)V

    sput-object v0, Lru/mail/libverify/requests/n;->REQUEST_SMS_INFO:Lru/mail/libverify/requests/n;

    new-instance v0, Lru/mail/libverify/requests/n$17;

    const-string/jumbo v1, "PING_RESPONSE_GCM"

    invoke-direct {v0, v1}, Lru/mail/libverify/requests/n$17;-><init>(Ljava/lang/String;)V

    sput-object v0, Lru/mail/libverify/requests/n;->PING_RESPONSE_GCM:Lru/mail/libverify/requests/n;

    new-instance v0, Lru/mail/libverify/requests/n$2;

    const-string/jumbo v1, "PING_RESPONSE_FETCHER"

    invoke-direct {v0, v1}, Lru/mail/libverify/requests/n$2;-><init>(Ljava/lang/String;)V

    sput-object v0, Lru/mail/libverify/requests/n;->PING_RESPONSE_FETCHER:Lru/mail/libverify/requests/n;

    new-instance v0, Lru/mail/libverify/requests/n$3;

    const-string/jumbo v1, "CHECK_SETTINGS_PACKAGES_CHANGED"

    invoke-direct {v0, v1}, Lru/mail/libverify/requests/n$3;-><init>(Ljava/lang/String;)V

    sput-object v0, Lru/mail/libverify/requests/n;->CHECK_SETTINGS_PACKAGES_CHANGED:Lru/mail/libverify/requests/n;

    new-instance v0, Lru/mail/libverify/requests/n$4;

    const-string/jumbo v1, "CHECK_SETTINGS_TIMER"

    invoke-direct {v0, v1}, Lru/mail/libverify/requests/n$4;-><init>(Ljava/lang/String;)V

    sput-object v0, Lru/mail/libverify/requests/n;->CHECK_SETTINGS_TIMER:Lru/mail/libverify/requests/n;

    new-instance v0, Lru/mail/libverify/requests/n$5;

    const-string/jumbo v1, "CHECK_SETTINGS_RESTART"

    invoke-direct {v0, v1}, Lru/mail/libverify/requests/n$5;-><init>(Ljava/lang/String;)V

    sput-object v0, Lru/mail/libverify/requests/n;->CHECK_SETTINGS_RESTART:Lru/mail/libverify/requests/n;

    new-instance v0, Lru/mail/libverify/requests/n$6;

    const-string/jumbo v1, "REQUEST_APP_CHECK_ID"

    invoke-direct {v0, v1}, Lru/mail/libverify/requests/n$6;-><init>(Ljava/lang/String;)V

    sput-object v0, Lru/mail/libverify/requests/n;->REQUEST_APP_CHECK_ID:Lru/mail/libverify/requests/n;

    new-instance v0, Lru/mail/libverify/requests/n$7;

    const-string/jumbo v1, "CONFIRM_APP_CHECK"

    invoke-direct {v0, v1}, Lru/mail/libverify/requests/n$7;-><init>(Ljava/lang/String;)V

    sput-object v0, Lru/mail/libverify/requests/n;->CONFIRM_APP_CHECK:Lru/mail/libverify/requests/n;

    new-instance v0, Lru/mail/libverify/requests/n$8;

    const-string/jumbo v1, "CHECK_INTERCEPTED"

    invoke-direct {v0, v1}, Lru/mail/libverify/requests/n$8;-><init>(Ljava/lang/String;)V

    sput-object v0, Lru/mail/libverify/requests/n;->CHECK_INTERCEPTED:Lru/mail/libverify/requests/n;

    new-instance v0, Lru/mail/libverify/requests/n$9;

    const-string/jumbo v1, "NO_ACTION"

    invoke-direct {v0, v1}, Lru/mail/libverify/requests/n$9;-><init>(Ljava/lang/String;)V

    sput-object v0, Lru/mail/libverify/requests/n;->NO_ACTION:Lru/mail/libverify/requests/n;

    const/16 v0, 0x11

    new-array v0, v0, [Lru/mail/libverify/requests/n;

    const/4 v1, 0x0

    sget-object v2, Lru/mail/libverify/requests/n;->REPORT_PHONE_NUMBER_REUSE:Lru/mail/libverify/requests/n;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lru/mail/libverify/requests/n;->REPORT_SPAM:Lru/mail/libverify/requests/n;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    sget-object v2, Lru/mail/libverify/requests/n;->BLOCK:Lru/mail/libverify/requests/n;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    sget-object v2, Lru/mail/libverify/requests/n;->CHECK:Lru/mail/libverify/requests/n;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    sget-object v2, Lru/mail/libverify/requests/n;->REPORT_SIGNOUT:Lru/mail/libverify/requests/n;

    aput-object v2, v0, v1

    const/4 v1, 0x5

    sget-object v2, Lru/mail/libverify/requests/n;->REPORT_SOFT_SIGNOUT:Lru/mail/libverify/requests/n;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lru/mail/libverify/requests/n;->REPORT_NO_GCM_SERVICE:Lru/mail/libverify/requests/n;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lru/mail/libverify/requests/n;->REQUEST_SMS_INFO:Lru/mail/libverify/requests/n;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lru/mail/libverify/requests/n;->PING_RESPONSE_GCM:Lru/mail/libverify/requests/n;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lru/mail/libverify/requests/n;->PING_RESPONSE_FETCHER:Lru/mail/libverify/requests/n;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lru/mail/libverify/requests/n;->CHECK_SETTINGS_PACKAGES_CHANGED:Lru/mail/libverify/requests/n;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lru/mail/libverify/requests/n;->CHECK_SETTINGS_TIMER:Lru/mail/libverify/requests/n;

    aput-object v2, v0, v1

    const/16 v1, 0xc

    sget-object v2, Lru/mail/libverify/requests/n;->CHECK_SETTINGS_RESTART:Lru/mail/libverify/requests/n;

    aput-object v2, v0, v1

    const/16 v1, 0xd

    sget-object v2, Lru/mail/libverify/requests/n;->REQUEST_APP_CHECK_ID:Lru/mail/libverify/requests/n;

    aput-object v2, v0, v1

    const/16 v1, 0xe

    sget-object v2, Lru/mail/libverify/requests/n;->CONFIRM_APP_CHECK:Lru/mail/libverify/requests/n;

    aput-object v2, v0, v1

    const/16 v1, 0xf

    sget-object v2, Lru/mail/libverify/requests/n;->CHECK_INTERCEPTED:Lru/mail/libverify/requests/n;

    aput-object v2, v0, v1

    const/16 v1, 0x10

    sget-object v2, Lru/mail/libverify/requests/n;->NO_ACTION:Lru/mail/libverify/requests/n;

    aput-object v2, v0, v1

    sput-object v0, Lru/mail/libverify/requests/n;->$VALUES:[Lru/mail/libverify/requests/n;

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

    invoke-direct {p0, p1, p2}, Lru/mail/libverify/requests/n;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lru/mail/libverify/requests/n;
    .locals 1

    const-class v0, Lru/mail/libverify/requests/n;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/requests/n;

    return-object v0
.end method

.method public static values()[Lru/mail/libverify/requests/n;
    .locals 1

    sget-object v0, Lru/mail/libverify/requests/n;->$VALUES:[Lru/mail/libverify/requests/n;

    invoke-virtual {v0}, [Lru/mail/libverify/requests/n;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lru/mail/libverify/requests/n;

    return-object v0
.end method


# virtual methods
.method public abstract a()Ljava/lang/String;
.end method
