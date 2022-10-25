.class final enum Lcom/wmspanel/libstream/m$a;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/wmspanel/libstream/m;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/wmspanel/libstream/m$a;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum cN:Lcom/wmspanel/libstream/m$a;

.field public static final enum cO:Lcom/wmspanel/libstream/m$a;

.field public static final enum cP:Lcom/wmspanel/libstream/m$a;

.field public static final enum cQ:Lcom/wmspanel/libstream/m$a;

.field public static final enum cR:Lcom/wmspanel/libstream/m$a;

.field public static final enum cS:Lcom/wmspanel/libstream/m$a;

.field public static final enum cT:Lcom/wmspanel/libstream/m$a;

.field public static final enum cU:Lcom/wmspanel/libstream/m$a;

.field public static final enum cV:Lcom/wmspanel/libstream/m$a;

.field public static final enum cW:Lcom/wmspanel/libstream/m$a;

.field public static final enum cX:Lcom/wmspanel/libstream/m$a;

.field public static final enum cY:Lcom/wmspanel/libstream/m$a;

.field private static final synthetic cZ:[Lcom/wmspanel/libstream/m$a;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 15
    new-instance v0, Lcom/wmspanel/libstream/m$a;

    const-string/jumbo v1, "INITIAL"

    invoke-direct {v0, v1, v3}, Lcom/wmspanel/libstream/m$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/wmspanel/libstream/m$a;->cN:Lcom/wmspanel/libstream/m$a;

    .line 16
    new-instance v0, Lcom/wmspanel/libstream/m$a;

    const-string/jumbo v1, "OPTIONS"

    invoke-direct {v0, v1, v4}, Lcom/wmspanel/libstream/m$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/wmspanel/libstream/m$a;->cO:Lcom/wmspanel/libstream/m$a;

    .line 17
    new-instance v0, Lcom/wmspanel/libstream/m$a;

    const-string/jumbo v1, "OPTIONS_AUTH"

    invoke-direct {v0, v1, v5}, Lcom/wmspanel/libstream/m$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/wmspanel/libstream/m$a;->cP:Lcom/wmspanel/libstream/m$a;

    .line 18
    new-instance v0, Lcom/wmspanel/libstream/m$a;

    const-string/jumbo v1, "ANNOUNCE_WAIT"

    invoke-direct {v0, v1, v6}, Lcom/wmspanel/libstream/m$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/wmspanel/libstream/m$a;->cQ:Lcom/wmspanel/libstream/m$a;

    .line 19
    new-instance v0, Lcom/wmspanel/libstream/m$a;

    const-string/jumbo v1, "ANNOUNCE"

    invoke-direct {v0, v1, v7}, Lcom/wmspanel/libstream/m$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/wmspanel/libstream/m$a;->cR:Lcom/wmspanel/libstream/m$a;

    .line 20
    new-instance v0, Lcom/wmspanel/libstream/m$a;

    const-string/jumbo v1, "ANNOUNCE_AUTH"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/wmspanel/libstream/m$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/wmspanel/libstream/m$a;->cS:Lcom/wmspanel/libstream/m$a;

    .line 21
    new-instance v0, Lcom/wmspanel/libstream/m$a;

    const-string/jumbo v1, "SETUP_VIDEO"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/wmspanel/libstream/m$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/wmspanel/libstream/m$a;->cT:Lcom/wmspanel/libstream/m$a;

    .line 22
    new-instance v0, Lcom/wmspanel/libstream/m$a;

    const-string/jumbo v1, "SETUP_AUDIO"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/wmspanel/libstream/m$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/wmspanel/libstream/m$a;->cU:Lcom/wmspanel/libstream/m$a;

    .line 23
    new-instance v0, Lcom/wmspanel/libstream/m$a;

    const-string/jumbo v1, "RECORD"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/wmspanel/libstream/m$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/wmspanel/libstream/m$a;->cV:Lcom/wmspanel/libstream/m$a;

    .line 24
    new-instance v0, Lcom/wmspanel/libstream/m$a;

    const-string/jumbo v1, "SEND_NEW_ITEM"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lcom/wmspanel/libstream/m$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/wmspanel/libstream/m$a;->cW:Lcom/wmspanel/libstream/m$a;

    .line 25
    new-instance v0, Lcom/wmspanel/libstream/m$a;

    const-string/jumbo v1, "SEND_VIDEO_PART"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Lcom/wmspanel/libstream/m$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/wmspanel/libstream/m$a;->cX:Lcom/wmspanel/libstream/m$a;

    .line 26
    new-instance v0, Lcom/wmspanel/libstream/m$a;

    const-string/jumbo v1, "CLOSED"

    const/16 v2, 0xb

    invoke-direct {v0, v1, v2}, Lcom/wmspanel/libstream/m$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/wmspanel/libstream/m$a;->cY:Lcom/wmspanel/libstream/m$a;

    .line 14
    const/16 v0, 0xc

    new-array v0, v0, [Lcom/wmspanel/libstream/m$a;

    sget-object v1, Lcom/wmspanel/libstream/m$a;->cN:Lcom/wmspanel/libstream/m$a;

    aput-object v1, v0, v3

    sget-object v1, Lcom/wmspanel/libstream/m$a;->cO:Lcom/wmspanel/libstream/m$a;

    aput-object v1, v0, v4

    sget-object v1, Lcom/wmspanel/libstream/m$a;->cP:Lcom/wmspanel/libstream/m$a;

    aput-object v1, v0, v5

    sget-object v1, Lcom/wmspanel/libstream/m$a;->cQ:Lcom/wmspanel/libstream/m$a;

    aput-object v1, v0, v6

    sget-object v1, Lcom/wmspanel/libstream/m$a;->cR:Lcom/wmspanel/libstream/m$a;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/wmspanel/libstream/m$a;->cS:Lcom/wmspanel/libstream/m$a;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/wmspanel/libstream/m$a;->cT:Lcom/wmspanel/libstream/m$a;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/wmspanel/libstream/m$a;->cU:Lcom/wmspanel/libstream/m$a;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/wmspanel/libstream/m$a;->cV:Lcom/wmspanel/libstream/m$a;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/wmspanel/libstream/m$a;->cW:Lcom/wmspanel/libstream/m$a;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lcom/wmspanel/libstream/m$a;->cX:Lcom/wmspanel/libstream/m$a;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lcom/wmspanel/libstream/m$a;->cY:Lcom/wmspanel/libstream/m$a;

    aput-object v2, v0, v1

    sput-object v0, Lcom/wmspanel/libstream/m$a;->cZ:[Lcom/wmspanel/libstream/m$a;

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
    .line 14
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/wmspanel/libstream/m$a;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 14
    const-class v0, Lcom/wmspanel/libstream/m$a;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/wmspanel/libstream/m$a;

    return-object v0
.end method

.method public static values()[Lcom/wmspanel/libstream/m$a;
    .locals 1

    .prologue
    .line 14
    sget-object v0, Lcom/wmspanel/libstream/m$a;->cZ:[Lcom/wmspanel/libstream/m$a;

    invoke-virtual {v0}, [Lcom/wmspanel/libstream/m$a;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/wmspanel/libstream/m$a;

    return-object v0
.end method
