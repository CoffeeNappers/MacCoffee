.class final enum Lcom/wmspanel/libstream/i$a;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/wmspanel/libstream/i;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/wmspanel/libstream/i$a;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum bB:Lcom/wmspanel/libstream/i$a;

.field public static final enum bC:Lcom/wmspanel/libstream/i$a;

.field public static final enum bD:Lcom/wmspanel/libstream/i$a;

.field public static final enum bE:Lcom/wmspanel/libstream/i$a;

.field private static final synthetic bF:[Lcom/wmspanel/libstream/i$a;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 170
    new-instance v0, Lcom/wmspanel/libstream/i$a;

    const-string/jumbo v1, "RTMP_COMMAND_RESPONSE_UNKNOWN"

    invoke-direct {v0, v1, v2}, Lcom/wmspanel/libstream/i$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/wmspanel/libstream/i$a;->bB:Lcom/wmspanel/libstream/i$a;

    .line 171
    new-instance v0, Lcom/wmspanel/libstream/i$a;

    const-string/jumbo v1, "RTMP_COMMAND_RESPONSE_CONNECT"

    invoke-direct {v0, v1, v3}, Lcom/wmspanel/libstream/i$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/wmspanel/libstream/i$a;->bC:Lcom/wmspanel/libstream/i$a;

    .line 172
    new-instance v0, Lcom/wmspanel/libstream/i$a;

    const-string/jumbo v1, "RTMP_COMMAND_RESPONSE_CREATE_STREAM"

    invoke-direct {v0, v1, v4}, Lcom/wmspanel/libstream/i$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/wmspanel/libstream/i$a;->bD:Lcom/wmspanel/libstream/i$a;

    .line 173
    new-instance v0, Lcom/wmspanel/libstream/i$a;

    const-string/jumbo v1, "RTMP_COMMAND_RESPONSE_PUBLISH"

    invoke-direct {v0, v1, v5}, Lcom/wmspanel/libstream/i$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/wmspanel/libstream/i$a;->bE:Lcom/wmspanel/libstream/i$a;

    .line 169
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/wmspanel/libstream/i$a;

    sget-object v1, Lcom/wmspanel/libstream/i$a;->bB:Lcom/wmspanel/libstream/i$a;

    aput-object v1, v0, v2

    sget-object v1, Lcom/wmspanel/libstream/i$a;->bC:Lcom/wmspanel/libstream/i$a;

    aput-object v1, v0, v3

    sget-object v1, Lcom/wmspanel/libstream/i$a;->bD:Lcom/wmspanel/libstream/i$a;

    aput-object v1, v0, v4

    sget-object v1, Lcom/wmspanel/libstream/i$a;->bE:Lcom/wmspanel/libstream/i$a;

    aput-object v1, v0, v5

    sput-object v0, Lcom/wmspanel/libstream/i$a;->bF:[Lcom/wmspanel/libstream/i$a;

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
    .line 169
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/wmspanel/libstream/i$a;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 169
    const-class v0, Lcom/wmspanel/libstream/i$a;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/wmspanel/libstream/i$a;

    return-object v0
.end method

.method public static values()[Lcom/wmspanel/libstream/i$a;
    .locals 1

    .prologue
    .line 169
    sget-object v0, Lcom/wmspanel/libstream/i$a;->bF:[Lcom/wmspanel/libstream/i$a;

    invoke-virtual {v0}, [Lcom/wmspanel/libstream/i$a;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/wmspanel/libstream/i$a;

    return-object v0
.end method
