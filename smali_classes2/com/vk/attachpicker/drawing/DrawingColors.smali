.class public Lcom/vk/attachpicker/drawing/DrawingColors;
.super Ljava/lang/Object;
.source "DrawingColors.java"


# static fields
.field public static final COLORS:[I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 6
    const/16 v0, 0x18

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/vk/attachpicker/drawing/DrawingColors;->COLORS:[I

    return-void

    :array_0
    .array-data 4
        -0x19b9ba
        -0x6d00
        -0x3500
        -0x9d25c9
        -0xff5107
        -0x338b1f
        -0x1000000
        -0x1
        -0x12ffed
        -0xa4642
        -0x2d2d
        -0x3c7e
        -0x2d70ba
        -0x669bc7
        -0xbcdcdc
        -0xe3b5d7
        -0xc9c9ca
        -0xaaaaab
        -0x8c8c8d
        -0x666667
        -0x4d4d4e
        -0x383839
        -0x242425
        -0x101011
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
