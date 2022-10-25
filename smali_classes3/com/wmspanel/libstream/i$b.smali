.class final enum Lcom/wmspanel/libstream/i$b;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/wmspanel/libstream/i;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/wmspanel/libstream/i$b;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum bG:Lcom/wmspanel/libstream/i$b;

.field public static final enum bH:Lcom/wmspanel/libstream/i$b;

.field public static final enum bI:Lcom/wmspanel/libstream/i$b;

.field public static final enum bJ:Lcom/wmspanel/libstream/i$b;

.field public static final enum bK:Lcom/wmspanel/libstream/i$b;

.field public static final enum bL:Lcom/wmspanel/libstream/i$b;

.field public static final enum bM:Lcom/wmspanel/libstream/i$b;

.field public static final enum bN:Lcom/wmspanel/libstream/i$b;

.field public static final enum bO:Lcom/wmspanel/libstream/i$b;

.field private static final synthetic bP:[Lcom/wmspanel/libstream/i$b;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 158
    new-instance v0, Lcom/wmspanel/libstream/i$b;

    const-string/jumbo v1, "INITIAL"

    invoke-direct {v0, v1, v3}, Lcom/wmspanel/libstream/i$b;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/wmspanel/libstream/i$b;->bG:Lcom/wmspanel/libstream/i$b;

    .line 159
    new-instance v0, Lcom/wmspanel/libstream/i$b;

    const-string/jumbo v1, "C0C1"

    invoke-direct {v0, v1, v4}, Lcom/wmspanel/libstream/i$b;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/wmspanel/libstream/i$b;->bH:Lcom/wmspanel/libstream/i$b;

    .line 160
    new-instance v0, Lcom/wmspanel/libstream/i$b;

    const-string/jumbo v1, "C2"

    invoke-direct {v0, v1, v5}, Lcom/wmspanel/libstream/i$b;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/wmspanel/libstream/i$b;->bI:Lcom/wmspanel/libstream/i$b;

    .line 161
    new-instance v0, Lcom/wmspanel/libstream/i$b;

    const-string/jumbo v1, "CONNECT"

    invoke-direct {v0, v1, v6}, Lcom/wmspanel/libstream/i$b;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/wmspanel/libstream/i$b;->bJ:Lcom/wmspanel/libstream/i$b;

    .line 162
    new-instance v0, Lcom/wmspanel/libstream/i$b;

    const-string/jumbo v1, "CREATE_STREAM"

    invoke-direct {v0, v1, v7}, Lcom/wmspanel/libstream/i$b;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/wmspanel/libstream/i$b;->bK:Lcom/wmspanel/libstream/i$b;

    .line 163
    new-instance v0, Lcom/wmspanel/libstream/i$b;

    const-string/jumbo v1, "PUBLISH"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/wmspanel/libstream/i$b;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/wmspanel/libstream/i$b;->bL:Lcom/wmspanel/libstream/i$b;

    .line 164
    new-instance v0, Lcom/wmspanel/libstream/i$b;

    const-string/jumbo v1, "SEND_NEXT_ITEM"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/wmspanel/libstream/i$b;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/wmspanel/libstream/i$b;->bM:Lcom/wmspanel/libstream/i$b;

    .line 165
    new-instance v0, Lcom/wmspanel/libstream/i$b;

    const-string/jumbo v1, "SEND_VIDEO_PART"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/wmspanel/libstream/i$b;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/wmspanel/libstream/i$b;->bN:Lcom/wmspanel/libstream/i$b;

    .line 166
    new-instance v0, Lcom/wmspanel/libstream/i$b;

    const-string/jumbo v1, "CLOSED"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/wmspanel/libstream/i$b;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/wmspanel/libstream/i$b;->bO:Lcom/wmspanel/libstream/i$b;

    .line 157
    const/16 v0, 0x9

    new-array v0, v0, [Lcom/wmspanel/libstream/i$b;

    sget-object v1, Lcom/wmspanel/libstream/i$b;->bG:Lcom/wmspanel/libstream/i$b;

    aput-object v1, v0, v3

    sget-object v1, Lcom/wmspanel/libstream/i$b;->bH:Lcom/wmspanel/libstream/i$b;

    aput-object v1, v0, v4

    sget-object v1, Lcom/wmspanel/libstream/i$b;->bI:Lcom/wmspanel/libstream/i$b;

    aput-object v1, v0, v5

    sget-object v1, Lcom/wmspanel/libstream/i$b;->bJ:Lcom/wmspanel/libstream/i$b;

    aput-object v1, v0, v6

    sget-object v1, Lcom/wmspanel/libstream/i$b;->bK:Lcom/wmspanel/libstream/i$b;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/wmspanel/libstream/i$b;->bL:Lcom/wmspanel/libstream/i$b;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/wmspanel/libstream/i$b;->bM:Lcom/wmspanel/libstream/i$b;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/wmspanel/libstream/i$b;->bN:Lcom/wmspanel/libstream/i$b;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/wmspanel/libstream/i$b;->bO:Lcom/wmspanel/libstream/i$b;

    aput-object v2, v0, v1

    sput-object v0, Lcom/wmspanel/libstream/i$b;->bP:[Lcom/wmspanel/libstream/i$b;

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
    .line 157
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/wmspanel/libstream/i$b;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 157
    const-class v0, Lcom/wmspanel/libstream/i$b;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/wmspanel/libstream/i$b;

    return-object v0
.end method

.method public static values()[Lcom/wmspanel/libstream/i$b;
    .locals 1

    .prologue
    .line 157
    sget-object v0, Lcom/wmspanel/libstream/i$b;->bP:[Lcom/wmspanel/libstream/i$b;

    invoke-virtual {v0}, [Lcom/wmspanel/libstream/i$b;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/wmspanel/libstream/i$b;

    return-object v0
.end method
