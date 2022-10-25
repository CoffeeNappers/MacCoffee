.class public final Lru/mail/libverify/accounts/d$a;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lru/mail/libverify/accounts/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lru/mail/libverify/accounts/d$a;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum a:I

.field public static final enum b:I

.field public static final enum c:I

.field private static final synthetic d:[I


# direct methods
.method static constructor <clinit>()V
    .locals 5

    const/4 v0, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    sput v3, Lru/mail/libverify/accounts/d$a;->a:I

    sput v4, Lru/mail/libverify/accounts/d$a;->b:I

    sput v0, Lru/mail/libverify/accounts/d$a;->c:I

    new-array v0, v0, [I

    const/4 v1, 0x0

    sget v2, Lru/mail/libverify/accounts/d$a;->a:I

    aput v2, v0, v1

    sget v1, Lru/mail/libverify/accounts/d$a;->b:I

    aput v1, v0, v3

    sget v1, Lru/mail/libverify/accounts/d$a;->c:I

    aput v1, v0, v4

    sput-object v0, Lru/mail/libverify/accounts/d$a;->d:[I

    return-void
.end method
