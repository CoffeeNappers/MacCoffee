.class Lcom/vk/sharing/view/SharingActionsView$ItemView;
.super Landroid/view/View;
.source "SharingActionsView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/sharing/view/SharingActionsView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ItemView"
.end annotation


# static fields
.field static final DECOR_RECT:Landroid/graphics/Rect;

.field static final ICON_RECT:Landroid/graphics/Rect;

.field static final TEXT_MAX_WIDTH:I

.field static final TEXT_X_OFFSET:I

.field static final TEXT_Y_OFFSET:I


# instance fields
.field final action:I

.field final decorDrawable:Landroid/graphics/drawable/Drawable;

.field icon:Landroid/graphics/drawable/Drawable;

.field final iconColor:I
    .annotation build Landroid/support/annotation/ColorInt;
    .end annotation
.end field

.field labelLayout:Landroid/text/Layout;

.field final labelPaint:Landroid/text/TextPaint;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    .line 108
    new-instance v0, Landroid/graphics/Rect;

    const/16 v1, 0x1c

    invoke-static {v1}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v1

    const/16 v2, 0x18

    invoke-static {v2}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v2

    const/16 v3, 0x34

    invoke-static {v3}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v3

    const/16 v4, 0x30

    invoke-static {v4}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v4

    invoke-direct {v0, v1, v2, v3, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    sput-object v0, Lcom/vk/sharing/view/SharingActionsView$ItemView;->ICON_RECT:Landroid/graphics/Rect;

    .line 109
    new-instance v0, Landroid/graphics/Rect;

    const/16 v1, 0x8

    invoke-static {v1}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v1

    const/4 v2, 0x4

    invoke-static {v2}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v2

    const/16 v3, 0x48

    invoke-static {v3}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v3

    const/16 v4, 0x44

    invoke-static {v4}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v4

    invoke-direct {v0, v1, v2, v3, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    sput-object v0, Lcom/vk/sharing/view/SharingActionsView$ItemView;->DECOR_RECT:Landroid/graphics/Rect;

    .line 111
    const/16 v0, 0x4c

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    sput v0, Lcom/vk/sharing/view/SharingActionsView$ItemView;->TEXT_MAX_WIDTH:I

    .line 112
    const/4 v0, 0x2

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    sput v0, Lcom/vk/sharing/view/SharingActionsView$ItemView;->TEXT_X_OFFSET:I

    .line 113
    const/16 v0, 0x46

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    sput v0, Lcom/vk/sharing/view/SharingActionsView$ItemView;->TEXT_Y_OFFSET:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 125
    const/4 v0, 0x4

    invoke-direct {p0, p1, v0, v1, v1}, Lcom/vk/sharing/view/SharingActionsView$ItemView;-><init>(Landroid/content/Context;ILandroid/graphics/drawable/Drawable;Ljava/lang/String;)V

    .line 126
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;ILandroid/graphics/drawable/Drawable;Ljava/lang/String;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "action"    # I
    .param p3, "icon"    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p4, "label"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 129
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 131
    const v0, 0x7f0f003d

    invoke-static {p1, v0}, Landroid/support/v4/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v0

    iput v0, p0, Lcom/vk/sharing/view/SharingActionsView$ItemView;->iconColor:I

    .line 133
    new-instance v0, Landroid/text/TextPaint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/text/TextPaint;-><init>(I)V

    iput-object v0, p0, Lcom/vk/sharing/view/SharingActionsView$ItemView;->labelPaint:Landroid/text/TextPaint;

    .line 134
    iget-object v0, p0, Lcom/vk/sharing/view/SharingActionsView$ItemView;->labelPaint:Landroid/text/TextPaint;

    sget-object v1, Landroid/graphics/Typeface;->SANS_SERIF:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 135
    iget-object v0, p0, Lcom/vk/sharing/view/SharingActionsView$ItemView;->labelPaint:Landroid/text/TextPaint;

    const/16 v1, 0xc

    invoke-static {v1}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 136
    iget-object v0, p0, Lcom/vk/sharing/view/SharingActionsView$ItemView;->labelPaint:Landroid/text/TextPaint;

    const v1, 0x7f0f0042

    invoke-static {p1, v1}, Landroid/support/v4/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->setColor(I)V

    .line 138
    const v0, 0x7f0200b4

    invoke-static {p1, v0}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/sharing/view/SharingActionsView$ItemView;->decorDrawable:Landroid/graphics/drawable/Drawable;

    .line 139
    iget-object v0, p0, Lcom/vk/sharing/view/SharingActionsView$ItemView;->decorDrawable:Landroid/graphics/drawable/Drawable;

    sget-object v1, Lcom/vk/sharing/view/SharingActionsView$ItemView;->DECOR_RECT:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 141
    iput p2, p0, Lcom/vk/sharing/view/SharingActionsView$ItemView;->action:I

    .line 142
    invoke-virtual {p0, p3}, Lcom/vk/sharing/view/SharingActionsView$ItemView;->setIcon(Landroid/graphics/drawable/Drawable;)V

    .line 143
    invoke-virtual {p0, p4}, Lcom/vk/sharing/view/SharingActionsView$ItemView;->setLabel(Ljava/lang/String;)V

    .line 144
    const v0, 0x7f0203b0

    invoke-virtual {p0, v0}, Lcom/vk/sharing/view/SharingActionsView$ItemView;->setBackgroundResource(I)V

    .line 145
    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 2
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 154
    iget-object v0, p0, Lcom/vk/sharing/view/SharingActionsView$ItemView;->decorDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 156
    iget-object v0, p0, Lcom/vk/sharing/view/SharingActionsView$ItemView;->icon:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_0

    .line 157
    iget-object v0, p0, Lcom/vk/sharing/view/SharingActionsView$ItemView;->icon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 159
    :cond_0
    iget-object v0, p0, Lcom/vk/sharing/view/SharingActionsView$ItemView;->labelLayout:Landroid/text/Layout;

    if-eqz v0, :cond_1

    .line 160
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 161
    sget v0, Lcom/vk/sharing/view/SharingActionsView$ItemView;->TEXT_X_OFFSET:I

    int-to-float v0, v0

    sget v1, Lcom/vk/sharing/view/SharingActionsView$ItemView;->TEXT_Y_OFFSET:I

    int-to-float v1, v1

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 162
    iget-object v0, p0, Lcom/vk/sharing/view/SharingActionsView$ItemView;->labelLayout:Landroid/text/Layout;

    invoke-virtual {v0, p1}, Landroid/text/Layout;->draw(Landroid/graphics/Canvas;)V

    .line 163
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 165
    :cond_1
    return-void
.end method

.method protected onMeasure(II)V
    .locals 2
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 149
    const/16 v0, 0x50

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    const/16 v1, 0x68

    invoke-static {v1}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/vk/sharing/view/SharingActionsView$ItemView;->setMeasuredDimension(II)V

    .line 150
    return-void
.end method

.method public setIcon(Landroid/graphics/drawable/Drawable;)V
    .locals 1
    .param p1, "icon"    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 168
    if-eqz p1, :cond_0

    .line 169
    invoke-static {p1}, Landroid/support/v4/graphics/drawable/DrawableCompat;->wrap(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    .line 170
    sget-object v0, Lcom/vk/sharing/view/SharingActionsView$ItemView;->ICON_RECT:Landroid/graphics/Rect;

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 171
    iget v0, p0, Lcom/vk/sharing/view/SharingActionsView$ItemView;->iconColor:I

    invoke-static {p1, v0}, Landroid/support/v4/graphics/drawable/DrawableCompat;->setTint(Landroid/graphics/drawable/Drawable;I)V

    .line 172
    iput-object p1, p0, Lcom/vk/sharing/view/SharingActionsView$ItemView;->icon:Landroid/graphics/drawable/Drawable;

    .line 176
    :goto_0
    invoke-virtual {p0}, Lcom/vk/sharing/view/SharingActionsView$ItemView;->invalidate()V

    .line 177
    return-void

    .line 174
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/sharing/view/SharingActionsView$ItemView;->icon:Landroid/graphics/drawable/Drawable;

    goto :goto_0
.end method

.method public setLabel(Ljava/lang/String;)V
    .locals 8
    .param p1, "label"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 180
    if-eqz p1, :cond_0

    .line 181
    new-instance v0, Landroid/text/StaticLayout;

    iget-object v2, p0, Lcom/vk/sharing/view/SharingActionsView$ItemView;->labelPaint:Landroid/text/TextPaint;

    sget v3, Lcom/vk/sharing/view/SharingActionsView$ItemView;->TEXT_MAX_WIDTH:I

    sget-object v4, Landroid/text/Layout$Alignment;->ALIGN_CENTER:Landroid/text/Layout$Alignment;

    const/high16 v5, 0x3f800000    # 1.0f

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v1, p1

    invoke-direct/range {v0 .. v7}, Landroid/text/StaticLayout;-><init>(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZ)V

    iput-object v0, p0, Lcom/vk/sharing/view/SharingActionsView$ItemView;->labelLayout:Landroid/text/Layout;

    .line 183
    :cond_0
    invoke-virtual {p0}, Lcom/vk/sharing/view/SharingActionsView$ItemView;->invalidate()V

    .line 184
    return-void
.end method
