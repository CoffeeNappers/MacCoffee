.class public Lcom/vk/attachpicker/widget/ClippingView;
.super Lcom/vk/attachpicker/widget/LocalImageView;
.source "ClippingView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/attachpicker/widget/ClippingView$OnDrawListener;
    }
.end annotation


# static fields
.field public static final CLIP_BOTTOM:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property",
            "<",
            "Lcom/vk/attachpicker/widget/ClippingView;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final CLIP_HORIZONTAL:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property",
            "<",
            "Lcom/vk/attachpicker/widget/ClippingView;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final CLIP_LEFT:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property",
            "<",
            "Lcom/vk/attachpicker/widget/ClippingView;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final CLIP_RIGHT:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property",
            "<",
            "Lcom/vk/attachpicker/widget/ClippingView;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final CLIP_TOP:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property",
            "<",
            "Lcom/vk/attachpicker/widget/ClippingView;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final CLIP_VERTICAL:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property",
            "<",
            "Lcom/vk/attachpicker/widget/ClippingView;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private clipBottom:I

.field private clipLeft:I

.field private clipRight:I

.field private clipTop:I

.field private drawListener:Lcom/vk/attachpicker/widget/ClippingView$OnDrawListener;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 14
    new-instance v0, Lcom/vk/attachpicker/widget/ClippingView$1;

    const-class v1, Ljava/lang/Integer;

    const-string/jumbo v2, "clipLeft"

    invoke-direct {v0, v1, v2}, Lcom/vk/attachpicker/widget/ClippingView$1;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    sput-object v0, Lcom/vk/attachpicker/widget/ClippingView;->CLIP_LEFT:Landroid/util/Property;

    .line 26
    new-instance v0, Lcom/vk/attachpicker/widget/ClippingView$2;

    const-class v1, Ljava/lang/Integer;

    const-string/jumbo v2, "clipTop"

    invoke-direct {v0, v1, v2}, Lcom/vk/attachpicker/widget/ClippingView$2;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    sput-object v0, Lcom/vk/attachpicker/widget/ClippingView;->CLIP_TOP:Landroid/util/Property;

    .line 38
    new-instance v0, Lcom/vk/attachpicker/widget/ClippingView$3;

    const-class v1, Ljava/lang/Integer;

    const-string/jumbo v2, "clipRight"

    invoke-direct {v0, v1, v2}, Lcom/vk/attachpicker/widget/ClippingView$3;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    sput-object v0, Lcom/vk/attachpicker/widget/ClippingView;->CLIP_RIGHT:Landroid/util/Property;

    .line 50
    new-instance v0, Lcom/vk/attachpicker/widget/ClippingView$4;

    const-class v1, Ljava/lang/Integer;

    const-string/jumbo v2, "clipBottom"

    invoke-direct {v0, v1, v2}, Lcom/vk/attachpicker/widget/ClippingView$4;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    sput-object v0, Lcom/vk/attachpicker/widget/ClippingView;->CLIP_BOTTOM:Landroid/util/Property;

    .line 62
    new-instance v0, Lcom/vk/attachpicker/widget/ClippingView$5;

    const-class v1, Ljava/lang/Integer;

    const-string/jumbo v2, "clipBottom"

    invoke-direct {v0, v1, v2}, Lcom/vk/attachpicker/widget/ClippingView$5;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    sput-object v0, Lcom/vk/attachpicker/widget/ClippingView;->CLIP_VERTICAL:Landroid/util/Property;

    .line 76
    new-instance v0, Lcom/vk/attachpicker/widget/ClippingView$6;

    const-class v1, Ljava/lang/Integer;

    const-string/jumbo v2, "clipBottom"

    invoke-direct {v0, v1, v2}, Lcom/vk/attachpicker/widget/ClippingView$6;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    sput-object v0, Lcom/vk/attachpicker/widget/ClippingView;->CLIP_HORIZONTAL:Landroid/util/Property;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 97
    invoke-direct {p0, p1}, Lcom/vk/attachpicker/widget/LocalImageView;-><init>(Landroid/content/Context;)V

    .line 98
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 101
    invoke-direct {p0, p1, p2}, Lcom/vk/attachpicker/widget/LocalImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 102
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 105
    invoke-direct {p0, p1, p2, p3}, Lcom/vk/attachpicker/widget/LocalImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 106
    return-void
.end method

.method static synthetic access$002(Lcom/vk/attachpicker/widget/ClippingView;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/widget/ClippingView;
    .param p1, "x1"    # I

    .prologue
    .line 12
    iput p1, p0, Lcom/vk/attachpicker/widget/ClippingView;->clipBottom:I

    return p1
.end method

.method static synthetic access$102(Lcom/vk/attachpicker/widget/ClippingView;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/widget/ClippingView;
    .param p1, "x1"    # I

    .prologue
    .line 12
    iput p1, p0, Lcom/vk/attachpicker/widget/ClippingView;->clipTop:I

    return p1
.end method

.method static synthetic access$202(Lcom/vk/attachpicker/widget/ClippingView;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/widget/ClippingView;
    .param p1, "x1"    # I

    .prologue
    .line 12
    iput p1, p0, Lcom/vk/attachpicker/widget/ClippingView;->clipLeft:I

    return p1
.end method

.method static synthetic access$302(Lcom/vk/attachpicker/widget/ClippingView;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/widget/ClippingView;
    .param p1, "x1"    # I

    .prologue
    .line 12
    iput p1, p0, Lcom/vk/attachpicker/widget/ClippingView;->clipRight:I

    return p1
.end method


# virtual methods
.method protected buildHierarchy(Lcom/facebook/drawee/generic/GenericDraweeHierarchyBuilder;)V
    .locals 1
    .param p1, "builder"    # Lcom/facebook/drawee/generic/GenericDraweeHierarchyBuilder;

    .prologue
    .line 110
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/facebook/drawee/generic/GenericDraweeHierarchyBuilder;->setFadeDuration(I)Lcom/facebook/drawee/generic/GenericDraweeHierarchyBuilder;

    .line 111
    sget-object v0, Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;->FIT_XY:Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;

    invoke-virtual {p1, v0}, Lcom/facebook/drawee/generic/GenericDraweeHierarchyBuilder;->setActualImageScaleType(Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;)Lcom/facebook/drawee/generic/GenericDraweeHierarchyBuilder;

    .line 112
    return-void
.end method

.method public getClipBottom()I
    .locals 1

    .prologue
    .line 119
    iget v0, p0, Lcom/vk/attachpicker/widget/ClippingView;->clipBottom:I

    return v0
.end method

.method public getClipHorizontal()I
    .locals 1

    .prologue
    .line 123
    iget v0, p0, Lcom/vk/attachpicker/widget/ClippingView;->clipRight:I

    return v0
.end method

.method public getClipLeft()I
    .locals 1

    .prologue
    .line 127
    iget v0, p0, Lcom/vk/attachpicker/widget/ClippingView;->clipLeft:I

    return v0
.end method

.method public getClipRight()I
    .locals 1

    .prologue
    .line 131
    iget v0, p0, Lcom/vk/attachpicker/widget/ClippingView;->clipRight:I

    return v0
.end method

.method public getClipTop()I
    .locals 1

    .prologue
    .line 135
    iget v0, p0, Lcom/vk/attachpicker/widget/ClippingView;->clipTop:I

    return v0
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 6
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 140
    iget-object v0, p0, Lcom/vk/attachpicker/widget/ClippingView;->drawListener:Lcom/vk/attachpicker/widget/ClippingView$OnDrawListener;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/ClippingView;->getScaleY()F

    move-result v0

    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_0

    .line 141
    iget-object v0, p0, Lcom/vk/attachpicker/widget/ClippingView;->drawListener:Lcom/vk/attachpicker/widget/ClippingView$OnDrawListener;

    invoke-interface {v0}, Lcom/vk/attachpicker/widget/ClippingView$OnDrawListener;->onDraw()V

    .line 143
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 144
    iget v0, p0, Lcom/vk/attachpicker/widget/ClippingView;->clipLeft:I

    int-to-float v0, v0

    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/ClippingView;->getScaleY()F

    move-result v1

    div-float/2addr v0, v1

    iget v1, p0, Lcom/vk/attachpicker/widget/ClippingView;->clipTop:I

    int-to-float v1, v1

    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/ClippingView;->getScaleY()F

    move-result v2

    div-float/2addr v1, v2

    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/ClippingView;->getWidth()I

    move-result v2

    int-to-float v2, v2

    iget v3, p0, Lcom/vk/attachpicker/widget/ClippingView;->clipRight:I

    int-to-float v3, v3

    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/ClippingView;->getScaleY()F

    move-result v4

    div-float/2addr v3, v4

    sub-float/2addr v2, v3

    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/ClippingView;->getHeight()I

    move-result v3

    int-to-float v3, v3

    iget v4, p0, Lcom/vk/attachpicker/widget/ClippingView;->clipBottom:I

    int-to-float v4, v4

    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/ClippingView;->getScaleY()F

    move-result v5

    div-float/2addr v4, v5

    sub-float/2addr v3, v4

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->clipRect(FFFF)Z

    .line 146
    invoke-super {p0, p1}, Lcom/vk/attachpicker/widget/LocalImageView;->onDraw(Landroid/graphics/Canvas;)V

    .line 148
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 149
    return-void
.end method

.method public setClipBottom(I)V
    .locals 0
    .param p1, "value"    # I

    .prologue
    .line 152
    iput p1, p0, Lcom/vk/attachpicker/widget/ClippingView;->clipBottom:I

    .line 153
    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/ClippingView;->invalidate()V

    .line 154
    return-void
.end method

.method public setClipHorizontal(I)V
    .locals 0
    .param p1, "value"    # I

    .prologue
    .line 157
    iput p1, p0, Lcom/vk/attachpicker/widget/ClippingView;->clipRight:I

    .line 158
    iput p1, p0, Lcom/vk/attachpicker/widget/ClippingView;->clipLeft:I

    .line 159
    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/ClippingView;->invalidate()V

    .line 160
    return-void
.end method

.method public setClipLeft(I)V
    .locals 0
    .param p1, "value"    # I

    .prologue
    .line 163
    iput p1, p0, Lcom/vk/attachpicker/widget/ClippingView;->clipLeft:I

    .line 164
    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/ClippingView;->invalidate()V

    .line 165
    return-void
.end method

.method public setClipRight(I)V
    .locals 0
    .param p1, "value"    # I

    .prologue
    .line 168
    iput p1, p0, Lcom/vk/attachpicker/widget/ClippingView;->clipRight:I

    .line 169
    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/ClippingView;->invalidate()V

    .line 170
    return-void
.end method

.method public setClipTop(I)V
    .locals 0
    .param p1, "value"    # I

    .prologue
    .line 173
    iput p1, p0, Lcom/vk/attachpicker/widget/ClippingView;->clipTop:I

    .line 174
    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/ClippingView;->invalidate()V

    .line 175
    return-void
.end method

.method public setClipVertical(I)V
    .locals 0
    .param p1, "value"    # I

    .prologue
    .line 178
    iput p1, p0, Lcom/vk/attachpicker/widget/ClippingView;->clipBottom:I

    .line 179
    iput p1, p0, Lcom/vk/attachpicker/widget/ClippingView;->clipTop:I

    .line 180
    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/ClippingView;->invalidate()V

    .line 181
    return-void
.end method

.method public setOnDrawListener(Lcom/vk/attachpicker/widget/ClippingView$OnDrawListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/vk/attachpicker/widget/ClippingView$OnDrawListener;

    .prologue
    .line 184
    iput-object p1, p0, Lcom/vk/attachpicker/widget/ClippingView;->drawListener:Lcom/vk/attachpicker/widget/ClippingView$OnDrawListener;

    .line 185
    return-void
.end method
