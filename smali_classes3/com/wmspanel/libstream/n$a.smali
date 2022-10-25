.class final enum Lcom/wmspanel/libstream/n$a;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/wmspanel/libstream/n;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/wmspanel/libstream/n$a;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum dj:Lcom/wmspanel/libstream/n$a;

.field public static final enum dk:Lcom/wmspanel/libstream/n$a;

.field public static final enum dl:Lcom/wmspanel/libstream/n$a;

.field public static final enum dm:Lcom/wmspanel/libstream/n$a;

.field private static final synthetic dn:[Lcom/wmspanel/libstream/n$a;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 13
    new-instance v0, Lcom/wmspanel/libstream/n$a;

    const-string/jumbo v1, "INTERLEAVED"

    invoke-direct {v0, v1, v2}, Lcom/wmspanel/libstream/n$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/wmspanel/libstream/n$a;->dj:Lcom/wmspanel/libstream/n$a;

    .line 14
    new-instance v0, Lcom/wmspanel/libstream/n$a;

    const-string/jumbo v1, "STATUS_LINE"

    invoke-direct {v0, v1, v3}, Lcom/wmspanel/libstream/n$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/wmspanel/libstream/n$a;->dk:Lcom/wmspanel/libstream/n$a;

    .line 15
    new-instance v0, Lcom/wmspanel/libstream/n$a;

    const-string/jumbo v1, "HDR_LINE"

    invoke-direct {v0, v1, v4}, Lcom/wmspanel/libstream/n$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/wmspanel/libstream/n$a;->dl:Lcom/wmspanel/libstream/n$a;

    .line 16
    new-instance v0, Lcom/wmspanel/libstream/n$a;

    const-string/jumbo v1, "BODY"

    invoke-direct {v0, v1, v5}, Lcom/wmspanel/libstream/n$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/wmspanel/libstream/n$a;->dm:Lcom/wmspanel/libstream/n$a;

    .line 12
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/wmspanel/libstream/n$a;

    sget-object v1, Lcom/wmspanel/libstream/n$a;->dj:Lcom/wmspanel/libstream/n$a;

    aput-object v1, v0, v2

    sget-object v1, Lcom/wmspanel/libstream/n$a;->dk:Lcom/wmspanel/libstream/n$a;

    aput-object v1, v0, v3

    sget-object v1, Lcom/wmspanel/libstream/n$a;->dl:Lcom/wmspanel/libstream/n$a;

    aput-object v1, v0, v4

    sget-object v1, Lcom/wmspanel/libstream/n$a;->dm:Lcom/wmspanel/libstream/n$a;

    aput-object v1, v0, v5

    sput-object v0, Lcom/wmspanel/libstream/n$a;->dn:[Lcom/wmspanel/libstream/n$a;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 12
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/wmspanel/libstream/n$a;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 12
    const-class v0, Lcom/wmspanel/libstream/n$a;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/wmspanel/libstream/n$a;

    return-object v0
.end method

.method public static values()[Lcom/wmspanel/libstream/n$a;
    .locals 1

    .prologue
    .line 12
    sget-object v0, Lcom/wmspanel/libstream/n$a;->dn:[Lcom/wmspanel/libstream/n$a;

    invoke-virtual {v0}, [Lcom/wmspanel/libstream/n$a;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/wmspanel/libstream/n$a;

    return-object v0
.end method
