.class final enum Lru/mail/libverify/controls/formatters/PhoneFormatter$TextAction;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lru/mail/libverify/controls/formatters/PhoneFormatter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "TextAction"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lru/mail/libverify/controls/formatters/PhoneFormatter$TextAction;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lru/mail/libverify/controls/formatters/PhoneFormatter$TextAction;

.field public static final enum ADD:Lru/mail/libverify/controls/formatters/PhoneFormatter$TextAction;

.field public static final enum REMOVE:Lru/mail/libverify/controls/formatters/PhoneFormatter$TextAction;

.field public static final enum UNKNOWN:Lru/mail/libverify/controls/formatters/PhoneFormatter$TextAction;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    new-instance v0, Lru/mail/libverify/controls/formatters/PhoneFormatter$TextAction;

    const-string/jumbo v1, "UNKNOWN"

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/controls/formatters/PhoneFormatter$TextAction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/controls/formatters/PhoneFormatter$TextAction;->UNKNOWN:Lru/mail/libverify/controls/formatters/PhoneFormatter$TextAction;

    new-instance v0, Lru/mail/libverify/controls/formatters/PhoneFormatter$TextAction;

    const-string/jumbo v1, "ADD"

    invoke-direct {v0, v1, v3}, Lru/mail/libverify/controls/formatters/PhoneFormatter$TextAction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/controls/formatters/PhoneFormatter$TextAction;->ADD:Lru/mail/libverify/controls/formatters/PhoneFormatter$TextAction;

    new-instance v0, Lru/mail/libverify/controls/formatters/PhoneFormatter$TextAction;

    const-string/jumbo v1, "REMOVE"

    invoke-direct {v0, v1, v4}, Lru/mail/libverify/controls/formatters/PhoneFormatter$TextAction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/controls/formatters/PhoneFormatter$TextAction;->REMOVE:Lru/mail/libverify/controls/formatters/PhoneFormatter$TextAction;

    const/4 v0, 0x3

    new-array v0, v0, [Lru/mail/libverify/controls/formatters/PhoneFormatter$TextAction;

    sget-object v1, Lru/mail/libverify/controls/formatters/PhoneFormatter$TextAction;->UNKNOWN:Lru/mail/libverify/controls/formatters/PhoneFormatter$TextAction;

    aput-object v1, v0, v2

    sget-object v1, Lru/mail/libverify/controls/formatters/PhoneFormatter$TextAction;->ADD:Lru/mail/libverify/controls/formatters/PhoneFormatter$TextAction;

    aput-object v1, v0, v3

    sget-object v1, Lru/mail/libverify/controls/formatters/PhoneFormatter$TextAction;->REMOVE:Lru/mail/libverify/controls/formatters/PhoneFormatter$TextAction;

    aput-object v1, v0, v4

    sput-object v0, Lru/mail/libverify/controls/formatters/PhoneFormatter$TextAction;->$VALUES:[Lru/mail/libverify/controls/formatters/PhoneFormatter$TextAction;

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

.method public static valueOf(Ljava/lang/String;)Lru/mail/libverify/controls/formatters/PhoneFormatter$TextAction;
    .locals 1

    const-class v0, Lru/mail/libverify/controls/formatters/PhoneFormatter$TextAction;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/controls/formatters/PhoneFormatter$TextAction;

    return-object v0
.end method

.method public static values()[Lru/mail/libverify/controls/formatters/PhoneFormatter$TextAction;
    .locals 1

    sget-object v0, Lru/mail/libverify/controls/formatters/PhoneFormatter$TextAction;->$VALUES:[Lru/mail/libverify/controls/formatters/PhoneFormatter$TextAction;

    invoke-virtual {v0}, [Lru/mail/libverify/controls/formatters/PhoneFormatter$TextAction;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lru/mail/libverify/controls/formatters/PhoneFormatter$TextAction;

    return-object v0
.end method
