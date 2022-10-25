.class public final enum Lcom/wmspanel/libstream/Streamer$STATUS;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/wmspanel/libstream/Streamer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "STATUS"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/wmspanel/libstream/Streamer$STATUS;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum AUTH_FAIL:Lcom/wmspanel/libstream/Streamer$STATUS;

.field public static final enum CONN_FAIL:Lcom/wmspanel/libstream/Streamer$STATUS;

.field public static final enum SUCCESS:Lcom/wmspanel/libstream/Streamer$STATUS;

.field public static final enum UNKNOWN_FAIL:Lcom/wmspanel/libstream/Streamer$STATUS;

.field private static final synthetic dH:[Lcom/wmspanel/libstream/Streamer$STATUS;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 35
    new-instance v0, Lcom/wmspanel/libstream/Streamer$STATUS;

    const-string/jumbo v1, "SUCCESS"

    invoke-direct {v0, v1, v2}, Lcom/wmspanel/libstream/Streamer$STATUS;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/wmspanel/libstream/Streamer$STATUS;->SUCCESS:Lcom/wmspanel/libstream/Streamer$STATUS;

    .line 36
    new-instance v0, Lcom/wmspanel/libstream/Streamer$STATUS;

    const-string/jumbo v1, "CONN_FAIL"

    invoke-direct {v0, v1, v3}, Lcom/wmspanel/libstream/Streamer$STATUS;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/wmspanel/libstream/Streamer$STATUS;->CONN_FAIL:Lcom/wmspanel/libstream/Streamer$STATUS;

    .line 37
    new-instance v0, Lcom/wmspanel/libstream/Streamer$STATUS;

    const-string/jumbo v1, "AUTH_FAIL"

    invoke-direct {v0, v1, v4}, Lcom/wmspanel/libstream/Streamer$STATUS;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/wmspanel/libstream/Streamer$STATUS;->AUTH_FAIL:Lcom/wmspanel/libstream/Streamer$STATUS;

    .line 38
    new-instance v0, Lcom/wmspanel/libstream/Streamer$STATUS;

    const-string/jumbo v1, "UNKNOWN_FAIL"

    invoke-direct {v0, v1, v5}, Lcom/wmspanel/libstream/Streamer$STATUS;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/wmspanel/libstream/Streamer$STATUS;->UNKNOWN_FAIL:Lcom/wmspanel/libstream/Streamer$STATUS;

    .line 34
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/wmspanel/libstream/Streamer$STATUS;

    sget-object v1, Lcom/wmspanel/libstream/Streamer$STATUS;->SUCCESS:Lcom/wmspanel/libstream/Streamer$STATUS;

    aput-object v1, v0, v2

    sget-object v1, Lcom/wmspanel/libstream/Streamer$STATUS;->CONN_FAIL:Lcom/wmspanel/libstream/Streamer$STATUS;

    aput-object v1, v0, v3

    sget-object v1, Lcom/wmspanel/libstream/Streamer$STATUS;->AUTH_FAIL:Lcom/wmspanel/libstream/Streamer$STATUS;

    aput-object v1, v0, v4

    sget-object v1, Lcom/wmspanel/libstream/Streamer$STATUS;->UNKNOWN_FAIL:Lcom/wmspanel/libstream/Streamer$STATUS;

    aput-object v1, v0, v5

    sput-object v0, Lcom/wmspanel/libstream/Streamer$STATUS;->dH:[Lcom/wmspanel/libstream/Streamer$STATUS;

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
    .line 34
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/wmspanel/libstream/Streamer$STATUS;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 34
    const-class v0, Lcom/wmspanel/libstream/Streamer$STATUS;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/wmspanel/libstream/Streamer$STATUS;

    return-object v0
.end method

.method public static values()[Lcom/wmspanel/libstream/Streamer$STATUS;
    .locals 1

    .prologue
    .line 34
    sget-object v0, Lcom/wmspanel/libstream/Streamer$STATUS;->dH:[Lcom/wmspanel/libstream/Streamer$STATUS;

    invoke-virtual {v0}, [Lcom/wmspanel/libstream/Streamer$STATUS;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/wmspanel/libstream/Streamer$STATUS;

    return-object v0
.end method
