.class public abstract Lcom/vk/attachpicker/drawing/brushes/Brush;
.super Ljava/lang/Object;
.source "Brush.java"


# static fields
.field public static final BRUSH_ERASER:I = 0x0

.field public static final BRUSH_MARKER:I = 0x2

.field public static final BRUSH_NEON:I = 0x3

.field public static final BRUSH_PEN:I = 0x1


# instance fields
.field private size:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/vk/attachpicker/drawing/brushes/Brush;->size:F

    .line 17
    return-void
.end method


# virtual methods
.method public abstract copy()Lcom/vk/attachpicker/drawing/brushes/Brush;
.end method

.method public abstract draw(Landroid/graphics/Canvas;FF)V
.end method

.method public abstract draw(Landroid/graphics/Canvas;Landroid/graphics/Path;)V
.end method

.method public abstract drawPeriod()F
.end method

.method public abstract getAlpha()I
.end method

.method public abstract getMaxDimension()F
.end method

.method public getSize()F
    .locals 1

    .prologue
    .line 20
    iget v0, p0, Lcom/vk/attachpicker/drawing/brushes/Brush;->size:F

    return v0
.end method

.method public abstract setColor(I)V
.end method

.method public setSize(F)V
    .locals 0
    .param p1, "size"    # F

    .prologue
    .line 24
    iput p1, p0, Lcom/vk/attachpicker/drawing/brushes/Brush;->size:F

    .line 25
    return-void
.end method

.method public abstract shouldBeDrawnInDrawingLayer()Z
.end method

.method public abstract shouldBeDrawnInSessionDrawingLayer()Z
.end method
