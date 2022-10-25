.class public final enum Lcom/vk/imageloader/ImageSize;
.super Ljava/lang/Enum;
.source "ImageSize.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/vk/imageloader/ImageSize;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/vk/imageloader/ImageSize;

.field public static final enum BIG:Lcom/vk/imageloader/ImageSize;

.field private static final BIG_IMAGE_SIZE:I

.field public static final enum MID:Lcom/vk/imageloader/ImageSize;

.field private static final MID_IMAGE_SIZE:I

.field public static final enum SMALL:Lcom/vk/imageloader/ImageSize;

.field private static final SMALL_IMAGE_SIZE:I

.field public static final enum VERY_BIG:Lcom/vk/imageloader/ImageSize;

.field private static final VERY_BIG_IMAGE_SIZE:I

.field public static final enum VERY_SMALL:Lcom/vk/imageloader/ImageSize;

.field private static final VERY_SMALL_IMAGE_SIZE:I


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 7
    new-instance v0, Lcom/vk/imageloader/ImageSize;

    const-string/jumbo v1, "VERY_SMALL"

    invoke-direct {v0, v1, v2}, Lcom/vk/imageloader/ImageSize;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vk/imageloader/ImageSize;->VERY_SMALL:Lcom/vk/imageloader/ImageSize;

    new-instance v0, Lcom/vk/imageloader/ImageSize;

    const-string/jumbo v1, "SMALL"

    invoke-direct {v0, v1, v3}, Lcom/vk/imageloader/ImageSize;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vk/imageloader/ImageSize;->SMALL:Lcom/vk/imageloader/ImageSize;

    new-instance v0, Lcom/vk/imageloader/ImageSize;

    const-string/jumbo v1, "MID"

    invoke-direct {v0, v1, v4}, Lcom/vk/imageloader/ImageSize;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vk/imageloader/ImageSize;->MID:Lcom/vk/imageloader/ImageSize;

    new-instance v0, Lcom/vk/imageloader/ImageSize;

    const-string/jumbo v1, "BIG"

    invoke-direct {v0, v1, v5}, Lcom/vk/imageloader/ImageSize;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vk/imageloader/ImageSize;->BIG:Lcom/vk/imageloader/ImageSize;

    new-instance v0, Lcom/vk/imageloader/ImageSize;

    const-string/jumbo v1, "VERY_BIG"

    invoke-direct {v0, v1, v6}, Lcom/vk/imageloader/ImageSize;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vk/imageloader/ImageSize;->VERY_BIG:Lcom/vk/imageloader/ImageSize;

    .line 5
    const/4 v0, 0x5

    new-array v0, v0, [Lcom/vk/imageloader/ImageSize;

    sget-object v1, Lcom/vk/imageloader/ImageSize;->VERY_SMALL:Lcom/vk/imageloader/ImageSize;

    aput-object v1, v0, v2

    sget-object v1, Lcom/vk/imageloader/ImageSize;->SMALL:Lcom/vk/imageloader/ImageSize;

    aput-object v1, v0, v3

    sget-object v1, Lcom/vk/imageloader/ImageSize;->MID:Lcom/vk/imageloader/ImageSize;

    aput-object v1, v0, v4

    sget-object v1, Lcom/vk/imageloader/ImageSize;->BIG:Lcom/vk/imageloader/ImageSize;

    aput-object v1, v0, v5

    sget-object v1, Lcom/vk/imageloader/ImageSize;->VERY_BIG:Lcom/vk/imageloader/ImageSize;

    aput-object v1, v0, v6

    sput-object v0, Lcom/vk/imageloader/ImageSize;->$VALUES:[Lcom/vk/imageloader/ImageSize;

    .line 9
    const/16 v0, 0x438

    invoke-static {}, Lcom/vk/core/util/Screen;->realHeight()I

    move-result v1

    const/16 v2, 0x5a0

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    sput v0, Lcom/vk/imageloader/ImageSize;->VERY_BIG_IMAGE_SIZE:I

    .line 10
    invoke-static {}, Lcom/vk/core/util/Screen;->width()I

    move-result v0

    sput v0, Lcom/vk/imageloader/ImageSize;->BIG_IMAGE_SIZE:I

    .line 11
    invoke-static {}, Lcom/vk/core/util/Screen;->width()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    float-to-int v0, v0

    sput v0, Lcom/vk/imageloader/ImageSize;->MID_IMAGE_SIZE:I

    .line 12
    invoke-static {}, Lcom/vk/core/util/Screen;->width()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x40800000    # 4.0f

    div-float/2addr v0, v1

    float-to-int v0, v0

    sput v0, Lcom/vk/imageloader/ImageSize;->SMALL_IMAGE_SIZE:I

    .line 13
    invoke-static {}, Lcom/vk/core/util/Screen;->width()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x40c00000    # 6.0f

    div-float/2addr v0, v1

    float-to-int v0, v0

    sput v0, Lcom/vk/imageloader/ImageSize;->VERY_SMALL_IMAGE_SIZE:I

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
    .line 5
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/vk/imageloader/ImageSize;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 5
    const-class v0, Lcom/vk/imageloader/ImageSize;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/ImageSize;

    return-object v0
.end method

.method public static values()[Lcom/vk/imageloader/ImageSize;
    .locals 1

    .prologue
    .line 5
    sget-object v0, Lcom/vk/imageloader/ImageSize;->$VALUES:[Lcom/vk/imageloader/ImageSize;

    invoke-virtual {v0}, [Lcom/vk/imageloader/ImageSize;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/vk/imageloader/ImageSize;

    return-object v0
.end method


# virtual methods
.method public getPixelsSize()I
    .locals 1

    .prologue
    .line 16
    sget-object v0, Lcom/vk/imageloader/ImageSize;->VERY_SMALL:Lcom/vk/imageloader/ImageSize;

    invoke-virtual {p0, v0}, Lcom/vk/imageloader/ImageSize;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 17
    sget v0, Lcom/vk/imageloader/ImageSize;->VERY_SMALL_IMAGE_SIZE:I

    .line 30
    :goto_0
    return v0

    .line 19
    :cond_0
    sget-object v0, Lcom/vk/imageloader/ImageSize;->SMALL:Lcom/vk/imageloader/ImageSize;

    invoke-virtual {p0, v0}, Lcom/vk/imageloader/ImageSize;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 20
    sget v0, Lcom/vk/imageloader/ImageSize;->SMALL_IMAGE_SIZE:I

    goto :goto_0

    .line 22
    :cond_1
    sget-object v0, Lcom/vk/imageloader/ImageSize;->MID:Lcom/vk/imageloader/ImageSize;

    invoke-virtual {p0, v0}, Lcom/vk/imageloader/ImageSize;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 23
    sget v0, Lcom/vk/imageloader/ImageSize;->MID_IMAGE_SIZE:I

    goto :goto_0

    .line 25
    :cond_2
    sget-object v0, Lcom/vk/imageloader/ImageSize;->BIG:Lcom/vk/imageloader/ImageSize;

    invoke-virtual {p0, v0}, Lcom/vk/imageloader/ImageSize;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 26
    sget v0, Lcom/vk/imageloader/ImageSize;->BIG_IMAGE_SIZE:I

    goto :goto_0

    .line 30
    :cond_3
    sget v0, Lcom/vk/imageloader/ImageSize;->VERY_BIG_IMAGE_SIZE:I

    goto :goto_0
.end method
