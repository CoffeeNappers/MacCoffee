.class final enum Lcom/wmspanel/libstream/MediaCodecState$a;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/wmspanel/libstream/MediaCodecState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/wmspanel/libstream/MediaCodecState$a;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum Y:Lcom/wmspanel/libstream/MediaCodecState$a;

.field public static final enum Z:Lcom/wmspanel/libstream/MediaCodecState$a;

.field public static final enum aa:Lcom/wmspanel/libstream/MediaCodecState$a;

.field public static final enum ab:Lcom/wmspanel/libstream/MediaCodecState$a;

.field private static final synthetic ac:[Lcom/wmspanel/libstream/MediaCodecState$a;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 17
    new-instance v0, Lcom/wmspanel/libstream/MediaCodecState$a;

    const-string/jumbo v1, "Uninitialized"

    invoke-direct {v0, v1, v2}, Lcom/wmspanel/libstream/MediaCodecState$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/wmspanel/libstream/MediaCodecState$a;->Y:Lcom/wmspanel/libstream/MediaCodecState$a;

    .line 18
    new-instance v0, Lcom/wmspanel/libstream/MediaCodecState$a;

    const-string/jumbo v1, "Configured"

    invoke-direct {v0, v1, v3}, Lcom/wmspanel/libstream/MediaCodecState$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/wmspanel/libstream/MediaCodecState$a;->Z:Lcom/wmspanel/libstream/MediaCodecState$a;

    .line 19
    new-instance v0, Lcom/wmspanel/libstream/MediaCodecState$a;

    const-string/jumbo v1, "Executing"

    invoke-direct {v0, v1, v4}, Lcom/wmspanel/libstream/MediaCodecState$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/wmspanel/libstream/MediaCodecState$a;->aa:Lcom/wmspanel/libstream/MediaCodecState$a;

    .line 20
    new-instance v0, Lcom/wmspanel/libstream/MediaCodecState$a;

    const-string/jumbo v1, "Released"

    invoke-direct {v0, v1, v5}, Lcom/wmspanel/libstream/MediaCodecState$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/wmspanel/libstream/MediaCodecState$a;->ab:Lcom/wmspanel/libstream/MediaCodecState$a;

    .line 16
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/wmspanel/libstream/MediaCodecState$a;

    sget-object v1, Lcom/wmspanel/libstream/MediaCodecState$a;->Y:Lcom/wmspanel/libstream/MediaCodecState$a;

    aput-object v1, v0, v2

    sget-object v1, Lcom/wmspanel/libstream/MediaCodecState$a;->Z:Lcom/wmspanel/libstream/MediaCodecState$a;

    aput-object v1, v0, v3

    sget-object v1, Lcom/wmspanel/libstream/MediaCodecState$a;->aa:Lcom/wmspanel/libstream/MediaCodecState$a;

    aput-object v1, v0, v4

    sget-object v1, Lcom/wmspanel/libstream/MediaCodecState$a;->ab:Lcom/wmspanel/libstream/MediaCodecState$a;

    aput-object v1, v0, v5

    sput-object v0, Lcom/wmspanel/libstream/MediaCodecState$a;->ac:[Lcom/wmspanel/libstream/MediaCodecState$a;

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
    .line 16
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/wmspanel/libstream/MediaCodecState$a;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 16
    const-class v0, Lcom/wmspanel/libstream/MediaCodecState$a;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/wmspanel/libstream/MediaCodecState$a;

    return-object v0
.end method

.method public static values()[Lcom/wmspanel/libstream/MediaCodecState$a;
    .locals 1

    .prologue
    .line 16
    sget-object v0, Lcom/wmspanel/libstream/MediaCodecState$a;->ac:[Lcom/wmspanel/libstream/MediaCodecState$a;

    invoke-virtual {v0}, [Lcom/wmspanel/libstream/MediaCodecState$a;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/wmspanel/libstream/MediaCodecState$a;

    return-object v0
.end method
