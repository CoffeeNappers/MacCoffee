.class public final enum Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/wmspanel/libstream/Streamer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "CONNECTION_STATE"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum CONNECTED:Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;

.field public static final enum DISCONNECTED:Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;

.field public static final enum INITIALIZED:Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;

.field public static final enum RECORD:Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;

.field public static final enum SETUP:Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;

.field private static final synthetic dE:[Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 42
    new-instance v0, Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;

    const-string/jumbo v1, "INITIALIZED"

    invoke-direct {v0, v1, v2}, Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;->INITIALIZED:Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;

    .line 43
    new-instance v0, Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;

    const-string/jumbo v1, "CONNECTED"

    invoke-direct {v0, v1, v3}, Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;->CONNECTED:Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;

    .line 44
    new-instance v0, Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;

    const-string/jumbo v1, "SETUP"

    invoke-direct {v0, v1, v4}, Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;->SETUP:Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;

    .line 45
    new-instance v0, Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;

    const-string/jumbo v1, "RECORD"

    invoke-direct {v0, v1, v5}, Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;->RECORD:Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;

    .line 46
    new-instance v0, Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;

    const-string/jumbo v1, "DISCONNECTED"

    invoke-direct {v0, v1, v6}, Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;->DISCONNECTED:Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;

    .line 41
    const/4 v0, 0x5

    new-array v0, v0, [Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;

    sget-object v1, Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;->INITIALIZED:Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;

    aput-object v1, v0, v2

    sget-object v1, Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;->CONNECTED:Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;

    aput-object v1, v0, v3

    sget-object v1, Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;->SETUP:Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;

    aput-object v1, v0, v4

    sget-object v1, Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;->RECORD:Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;

    aput-object v1, v0, v5

    sget-object v1, Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;->DISCONNECTED:Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;

    aput-object v1, v0, v6

    sput-object v0, Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;->dE:[Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;

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
    .line 41
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 41
    const-class v0, Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;

    return-object v0
.end method

.method public static values()[Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;
    .locals 1

    .prologue
    .line 41
    sget-object v0, Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;->dE:[Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;

    invoke-virtual {v0}, [Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;

    return-object v0
.end method
