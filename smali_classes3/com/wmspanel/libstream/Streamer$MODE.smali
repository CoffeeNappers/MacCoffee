.class public final enum Lcom/wmspanel/libstream/Streamer$MODE;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/wmspanel/libstream/Streamer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "MODE"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/wmspanel/libstream/Streamer$MODE;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum AUDIO_ONLY:Lcom/wmspanel/libstream/Streamer$MODE;

.field public static final enum AUDIO_VIDEO:Lcom/wmspanel/libstream/Streamer$MODE;

.field public static final enum VIDEO_ONLY:Lcom/wmspanel/libstream/Streamer$MODE;

.field private static final synthetic dF:[Lcom/wmspanel/libstream/Streamer$MODE;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 24
    new-instance v0, Lcom/wmspanel/libstream/Streamer$MODE;

    const-string/jumbo v1, "AUDIO_VIDEO"

    invoke-direct {v0, v1, v2}, Lcom/wmspanel/libstream/Streamer$MODE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/wmspanel/libstream/Streamer$MODE;->AUDIO_VIDEO:Lcom/wmspanel/libstream/Streamer$MODE;

    .line 25
    new-instance v0, Lcom/wmspanel/libstream/Streamer$MODE;

    const-string/jumbo v1, "VIDEO_ONLY"

    invoke-direct {v0, v1, v3}, Lcom/wmspanel/libstream/Streamer$MODE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/wmspanel/libstream/Streamer$MODE;->VIDEO_ONLY:Lcom/wmspanel/libstream/Streamer$MODE;

    .line 26
    new-instance v0, Lcom/wmspanel/libstream/Streamer$MODE;

    const-string/jumbo v1, "AUDIO_ONLY"

    invoke-direct {v0, v1, v4}, Lcom/wmspanel/libstream/Streamer$MODE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/wmspanel/libstream/Streamer$MODE;->AUDIO_ONLY:Lcom/wmspanel/libstream/Streamer$MODE;

    .line 23
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/wmspanel/libstream/Streamer$MODE;

    sget-object v1, Lcom/wmspanel/libstream/Streamer$MODE;->AUDIO_VIDEO:Lcom/wmspanel/libstream/Streamer$MODE;

    aput-object v1, v0, v2

    sget-object v1, Lcom/wmspanel/libstream/Streamer$MODE;->VIDEO_ONLY:Lcom/wmspanel/libstream/Streamer$MODE;

    aput-object v1, v0, v3

    sget-object v1, Lcom/wmspanel/libstream/Streamer$MODE;->AUDIO_ONLY:Lcom/wmspanel/libstream/Streamer$MODE;

    aput-object v1, v0, v4

    sput-object v0, Lcom/wmspanel/libstream/Streamer$MODE;->dF:[Lcom/wmspanel/libstream/Streamer$MODE;

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
    .line 23
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/wmspanel/libstream/Streamer$MODE;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 23
    const-class v0, Lcom/wmspanel/libstream/Streamer$MODE;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/wmspanel/libstream/Streamer$MODE;

    return-object v0
.end method

.method public static values()[Lcom/wmspanel/libstream/Streamer$MODE;
    .locals 1

    .prologue
    .line 23
    sget-object v0, Lcom/wmspanel/libstream/Streamer$MODE;->dF:[Lcom/wmspanel/libstream/Streamer$MODE;

    invoke-virtual {v0}, [Lcom/wmspanel/libstream/Streamer$MODE;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/wmspanel/libstream/Streamer$MODE;

    return-object v0
.end method
