.class public final enum Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;
.super Ljava/lang/Enum;
.source "TextureVideoView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/attachpicker/widget/TextureVideoView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ScaleType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;

.field public static final enum CENTER:Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;

.field public static final enum CENTER_CROP:Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;

.field public static final enum CENTER_INSIDE:Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;

.field public static final enum FIT_CENTER:Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;

.field public static final enum FIT_END:Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;

.field public static final enum FIT_START:Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;

.field public static final enum FIT_XY:Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;

.field public static final enum MATRIX:Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;


# instance fields
.field final nativeInt:I


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 72
    new-instance v0, Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;

    const-string/jumbo v1, "MATRIX"

    invoke-direct {v0, v1, v4, v4}, Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;->MATRIX:Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;

    .line 73
    new-instance v0, Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;

    const-string/jumbo v1, "FIT_XY"

    invoke-direct {v0, v1, v5, v5}, Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;->FIT_XY:Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;

    .line 74
    new-instance v0, Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;

    const-string/jumbo v1, "FIT_START"

    invoke-direct {v0, v1, v6, v6}, Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;->FIT_START:Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;

    .line 75
    new-instance v0, Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;

    const-string/jumbo v1, "FIT_CENTER"

    invoke-direct {v0, v1, v7, v7}, Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;->FIT_CENTER:Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;

    .line 76
    new-instance v0, Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;

    const-string/jumbo v1, "FIT_END"

    invoke-direct {v0, v1, v8, v8}, Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;->FIT_END:Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;

    .line 77
    new-instance v0, Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;

    const-string/jumbo v1, "CENTER"

    const/4 v2, 0x5

    const/4 v3, 0x5

    invoke-direct {v0, v1, v2, v3}, Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;->CENTER:Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;

    .line 78
    new-instance v0, Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;

    const-string/jumbo v1, "CENTER_CROP"

    const/4 v2, 0x6

    const/4 v3, 0x6

    invoke-direct {v0, v1, v2, v3}, Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;->CENTER_CROP:Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;

    .line 79
    new-instance v0, Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;

    const-string/jumbo v1, "CENTER_INSIDE"

    const/4 v2, 0x7

    const/4 v3, 0x7

    invoke-direct {v0, v1, v2, v3}, Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;->CENTER_INSIDE:Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;

    .line 71
    const/16 v0, 0x8

    new-array v0, v0, [Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;

    sget-object v1, Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;->MATRIX:Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;->FIT_XY:Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;->FIT_START:Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;

    aput-object v1, v0, v6

    sget-object v1, Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;->FIT_CENTER:Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;

    aput-object v1, v0, v7

    sget-object v1, Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;->FIT_END:Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;

    aput-object v1, v0, v8

    const/4 v1, 0x5

    sget-object v2, Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;->CENTER:Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;->CENTER_CROP:Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;->CENTER_INSIDE:Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;

    aput-object v2, v0, v1

    sput-object v0, Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;->$VALUES:[Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .param p3, "ni"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .prologue
    .line 81
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 82
    iput p3, p0, Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;->nativeInt:I

    .line 83
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 71
    const-class v0, Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;

    return-object v0
.end method

.method public static values()[Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;
    .locals 1

    .prologue
    .line 71
    sget-object v0, Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;->$VALUES:[Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;

    invoke-virtual {v0}, [Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;

    return-object v0
.end method
