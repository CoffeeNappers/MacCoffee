.class public final enum Lru/mail/libverify/gcm/ServerNotificationMessage$Message$a;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lru/mail/libverify/gcm/ServerNotificationMessage$Message;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lru/mail/libverify/gcm/ServerNotificationMessage$Message$a;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lru/mail/libverify/gcm/ServerNotificationMessage$Message$a;

.field public static final enum IPC:Lru/mail/libverify/gcm/ServerNotificationMessage$Message$a;
    .annotation runtime Lru/mail/libverify/utils/json/b;
        a = "ipc"
    .end annotation
.end field

.field public static final enum POPUP:Lru/mail/libverify/gcm/ServerNotificationMessage$Message$a;
    .annotation runtime Lru/mail/libverify/utils/json/b;
        a = "popup"
    .end annotation
.end field

.field public static final enum SMS:Lru/mail/libverify/gcm/ServerNotificationMessage$Message$a;
    .annotation runtime Lru/mail/libverify/utils/json/b;
        a = "sms"
    .end annotation
.end field

.field public static final enum UNKNOWN:Lru/mail/libverify/gcm/ServerNotificationMessage$Message$a;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    new-instance v0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$a;

    const-string/jumbo v1, "POPUP"

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$a;->POPUP:Lru/mail/libverify/gcm/ServerNotificationMessage$Message$a;

    new-instance v0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$a;

    const-string/jumbo v1, "IPC"

    invoke-direct {v0, v1, v3}, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$a;->IPC:Lru/mail/libverify/gcm/ServerNotificationMessage$Message$a;

    new-instance v0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$a;

    const-string/jumbo v1, "SMS"

    invoke-direct {v0, v1, v4}, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$a;->SMS:Lru/mail/libverify/gcm/ServerNotificationMessage$Message$a;

    new-instance v0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$a;

    const-string/jumbo v1, "UNKNOWN"

    invoke-direct {v0, v1, v5}, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$a;->UNKNOWN:Lru/mail/libverify/gcm/ServerNotificationMessage$Message$a;

    const/4 v0, 0x4

    new-array v0, v0, [Lru/mail/libverify/gcm/ServerNotificationMessage$Message$a;

    sget-object v1, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$a;->POPUP:Lru/mail/libverify/gcm/ServerNotificationMessage$Message$a;

    aput-object v1, v0, v2

    sget-object v1, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$a;->IPC:Lru/mail/libverify/gcm/ServerNotificationMessage$Message$a;

    aput-object v1, v0, v3

    sget-object v1, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$a;->SMS:Lru/mail/libverify/gcm/ServerNotificationMessage$Message$a;

    aput-object v1, v0, v4

    sget-object v1, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$a;->UNKNOWN:Lru/mail/libverify/gcm/ServerNotificationMessage$Message$a;

    aput-object v1, v0, v5

    sput-object v0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$a;->$VALUES:[Lru/mail/libverify/gcm/ServerNotificationMessage$Message$a;

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

.method public static valueOf(Ljava/lang/String;)Lru/mail/libverify/gcm/ServerNotificationMessage$Message$a;
    .locals 1

    const-class v0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$a;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$a;

    return-object v0
.end method

.method public static values()[Lru/mail/libverify/gcm/ServerNotificationMessage$Message$a;
    .locals 1

    sget-object v0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$a;->$VALUES:[Lru/mail/libverify/gcm/ServerNotificationMessage$Message$a;

    invoke-virtual {v0}, [Lru/mail/libverify/gcm/ServerNotificationMessage$Message$a;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lru/mail/libverify/gcm/ServerNotificationMessage$Message$a;

    return-object v0
.end method
