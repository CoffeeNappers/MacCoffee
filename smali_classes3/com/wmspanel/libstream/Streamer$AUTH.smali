.class public final enum Lcom/wmspanel/libstream/Streamer$AUTH;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/wmspanel/libstream/Streamer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "AUTH"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/wmspanel/libstream/Streamer$AUTH;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum DEFAULT:Lcom/wmspanel/libstream/Streamer$AUTH;

.field public static final enum LLNW:Lcom/wmspanel/libstream/Streamer$AUTH;

.field private static final synthetic dA:[Lcom/wmspanel/libstream/Streamer$AUTH;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 30
    new-instance v0, Lcom/wmspanel/libstream/Streamer$AUTH;

    const-string/jumbo v1, "DEFAULT"

    invoke-direct {v0, v1, v2}, Lcom/wmspanel/libstream/Streamer$AUTH;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/wmspanel/libstream/Streamer$AUTH;->DEFAULT:Lcom/wmspanel/libstream/Streamer$AUTH;

    .line 31
    new-instance v0, Lcom/wmspanel/libstream/Streamer$AUTH;

    const-string/jumbo v1, "LLNW"

    invoke-direct {v0, v1, v3}, Lcom/wmspanel/libstream/Streamer$AUTH;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/wmspanel/libstream/Streamer$AUTH;->LLNW:Lcom/wmspanel/libstream/Streamer$AUTH;

    .line 29
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/wmspanel/libstream/Streamer$AUTH;

    sget-object v1, Lcom/wmspanel/libstream/Streamer$AUTH;->DEFAULT:Lcom/wmspanel/libstream/Streamer$AUTH;

    aput-object v1, v0, v2

    sget-object v1, Lcom/wmspanel/libstream/Streamer$AUTH;->LLNW:Lcom/wmspanel/libstream/Streamer$AUTH;

    aput-object v1, v0, v3

    sput-object v0, Lcom/wmspanel/libstream/Streamer$AUTH;->dA:[Lcom/wmspanel/libstream/Streamer$AUTH;

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
    .line 29
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/wmspanel/libstream/Streamer$AUTH;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 29
    const-class v0, Lcom/wmspanel/libstream/Streamer$AUTH;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/wmspanel/libstream/Streamer$AUTH;

    return-object v0
.end method

.method public static values()[Lcom/wmspanel/libstream/Streamer$AUTH;
    .locals 1

    .prologue
    .line 29
    sget-object v0, Lcom/wmspanel/libstream/Streamer$AUTH;->dA:[Lcom/wmspanel/libstream/Streamer$AUTH;

    invoke-virtual {v0}, [Lcom/wmspanel/libstream/Streamer$AUTH;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/wmspanel/libstream/Streamer$AUTH;

    return-object v0
.end method
