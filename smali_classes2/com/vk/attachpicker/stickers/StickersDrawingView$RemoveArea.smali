.class public Lcom/vk/attachpicker/stickers/StickersDrawingView$RemoveArea;
.super Ljava/lang/Object;
.source "StickersDrawingView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/attachpicker/stickers/StickersDrawingView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "RemoveArea"
.end annotation


# instance fields
.field final gravity:I

.field final heigth:I

.field final synthetic this$0:Lcom/vk/attachpicker/stickers/StickersDrawingView;

.field final width:I


# direct methods
.method public constructor <init>(Lcom/vk/attachpicker/stickers/StickersDrawingView;III)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/attachpicker/stickers/StickersDrawingView;
    .param p2, "gravity"    # I
    .param p3, "width"    # I
    .param p4, "heigth"    # I

    .prologue
    .line 357
    iput-object p1, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView$RemoveArea;->this$0:Lcom/vk/attachpicker/stickers/StickersDrawingView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 358
    iput p2, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView$RemoveArea;->gravity:I

    .line 359
    iput p3, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView$RemoveArea;->width:I

    .line 360
    iput p4, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView$RemoveArea;->heigth:I

    .line 361
    return-void
.end method


# virtual methods
.method public get(Landroid/graphics/Rect;Landroid/graphics/Rect;)V
    .locals 3
    .param p1, "parent"    # Landroid/graphics/Rect;
    .param p2, "output"    # Landroid/graphics/Rect;

    .prologue
    .line 364
    iget v0, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView$RemoveArea;->gravity:I

    iget v1, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView$RemoveArea;->width:I

    iget v2, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView$RemoveArea;->heigth:I

    invoke-static {v0, v1, v2, p1, p2}, Landroid/view/Gravity;->apply(IIILandroid/graphics/Rect;Landroid/graphics/Rect;)V

    .line 365
    return-void
.end method
