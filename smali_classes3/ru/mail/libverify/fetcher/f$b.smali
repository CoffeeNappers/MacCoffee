.class final enum Lru/mail/libverify/fetcher/f$b;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lru/mail/libverify/fetcher/f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lru/mail/libverify/fetcher/f$b;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lru/mail/libverify/fetcher/f$b;

.field public static final enum ACTIVE:Lru/mail/libverify/fetcher/f$b;

.field public static final enum NOT_ACTIVE:Lru/mail/libverify/fetcher/f$b;

.field public static final enum SUSPENDED_OTHER_SERVICE:Lru/mail/libverify/fetcher/f$b;

.field public static final enum SUSPENDED_TEMPORARY:Lru/mail/libverify/fetcher/f$b;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    new-instance v0, Lru/mail/libverify/fetcher/f$b;

    const-string/jumbo v1, "NOT_ACTIVE"

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/fetcher/f$b;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/fetcher/f$b;->NOT_ACTIVE:Lru/mail/libverify/fetcher/f$b;

    new-instance v0, Lru/mail/libverify/fetcher/f$b;

    const-string/jumbo v1, "SUSPENDED_TEMPORARY"

    invoke-direct {v0, v1, v3}, Lru/mail/libverify/fetcher/f$b;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/fetcher/f$b;->SUSPENDED_TEMPORARY:Lru/mail/libverify/fetcher/f$b;

    new-instance v0, Lru/mail/libverify/fetcher/f$b;

    const-string/jumbo v1, "SUSPENDED_OTHER_SERVICE"

    invoke-direct {v0, v1, v4}, Lru/mail/libverify/fetcher/f$b;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/fetcher/f$b;->SUSPENDED_OTHER_SERVICE:Lru/mail/libverify/fetcher/f$b;

    new-instance v0, Lru/mail/libverify/fetcher/f$b;

    const-string/jumbo v1, "ACTIVE"

    invoke-direct {v0, v1, v5}, Lru/mail/libverify/fetcher/f$b;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/fetcher/f$b;->ACTIVE:Lru/mail/libverify/fetcher/f$b;

    const/4 v0, 0x4

    new-array v0, v0, [Lru/mail/libverify/fetcher/f$b;

    sget-object v1, Lru/mail/libverify/fetcher/f$b;->NOT_ACTIVE:Lru/mail/libverify/fetcher/f$b;

    aput-object v1, v0, v2

    sget-object v1, Lru/mail/libverify/fetcher/f$b;->SUSPENDED_TEMPORARY:Lru/mail/libverify/fetcher/f$b;

    aput-object v1, v0, v3

    sget-object v1, Lru/mail/libverify/fetcher/f$b;->SUSPENDED_OTHER_SERVICE:Lru/mail/libverify/fetcher/f$b;

    aput-object v1, v0, v4

    sget-object v1, Lru/mail/libverify/fetcher/f$b;->ACTIVE:Lru/mail/libverify/fetcher/f$b;

    aput-object v1, v0, v5

    sput-object v0, Lru/mail/libverify/fetcher/f$b;->$VALUES:[Lru/mail/libverify/fetcher/f$b;

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

.method public static valueOf(Ljava/lang/String;)Lru/mail/libverify/fetcher/f$b;
    .locals 1

    const-class v0, Lru/mail/libverify/fetcher/f$b;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/fetcher/f$b;

    return-object v0
.end method

.method public static values()[Lru/mail/libverify/fetcher/f$b;
    .locals 1

    sget-object v0, Lru/mail/libverify/fetcher/f$b;->$VALUES:[Lru/mail/libverify/fetcher/f$b;

    invoke-virtual {v0}, [Lru/mail/libverify/fetcher/f$b;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lru/mail/libverify/fetcher/f$b;

    return-object v0
.end method
