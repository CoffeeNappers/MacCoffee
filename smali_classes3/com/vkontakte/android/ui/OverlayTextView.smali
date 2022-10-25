.class public Lcom/vkontakte/android/ui/OverlayTextView;
.super Landroid/widget/TextView;
.source "OverlayTextView.java"


# instance fields
.field private drawableColorStateList:Landroid/content/res/ColorStateList;

.field private imageSpan:Landroid/text/style/ImageSpan;

.field private leftDrawable:Landroid/graphics/drawable/Drawable;

.field private overlay:Landroid/graphics/drawable/Drawable;

.field private padAsBg:Z

.field private padBtm:I

.field private padLeft:I

.field private padOverlay:Z

.field private padRight:I

.field private padTop:I

.field private spannableStringBuilder:Landroid/text/SpannableStringBuilder;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 36
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/vkontakte/android/ui/OverlayTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 37
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 40
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/vkontakte/android/ui/OverlayTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 41
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    const/4 v0, 0x0

    .line 44
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 30
    iput-boolean v0, p0, Lcom/vkontakte/android/ui/OverlayTextView;->padOverlay:Z

    iput-boolean v0, p0, Lcom/vkontakte/android/ui/OverlayTextView;->padAsBg:Z

    .line 45
    invoke-direct {p0, p2, p3}, Lcom/vkontakte/android/ui/OverlayTextView;->init(Landroid/util/AttributeSet;I)V

    .line 46
    return-void
.end method

.method private getSpannedText(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .locals 6
    .param p1, "text"    # Ljava/lang/CharSequence;

    .prologue
    const/16 v5, 0x11

    const/4 v4, 0x1

    .line 188
    iget-object v1, p0, Lcom/vkontakte/android/ui/OverlayTextView;->imageSpan:Landroid/text/style/ImageSpan;

    if-nez v1, :cond_0

    .line 205
    .end local p1    # "text":Ljava/lang/CharSequence;
    :goto_0
    return-object p1

    .line 191
    .restart local p1    # "text":Ljava/lang/CharSequence;
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/ui/OverlayTextView;->spannableStringBuilder:Landroid/text/SpannableStringBuilder;

    if-nez v1, :cond_1

    .line 192
    new-instance v1, Landroid/text/SpannableStringBuilder;

    invoke-direct {v1}, Landroid/text/SpannableStringBuilder;-><init>()V

    iput-object v1, p0, Lcom/vkontakte/android/ui/OverlayTextView;->spannableStringBuilder:Landroid/text/SpannableStringBuilder;

    .line 196
    :goto_1
    if-nez p1, :cond_2

    const-string/jumbo v0, ""

    .line 197
    .local v0, "trimmed":Ljava/lang/CharSequence;
    :goto_2
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 198
    iget-object v1, p0, Lcom/vkontakte/android/ui/OverlayTextView;->spannableStringBuilder:Landroid/text/SpannableStringBuilder;

    const-string/jumbo v2, "  "

    invoke-virtual {v1, v2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 199
    iget-object v1, p0, Lcom/vkontakte/android/ui/OverlayTextView;->spannableStringBuilder:Landroid/text/SpannableStringBuilder;

    iget-object v2, p0, Lcom/vkontakte/android/ui/OverlayTextView;->imageSpan:Landroid/text/style/ImageSpan;

    const/4 v3, 0x2

    invoke-virtual {v1, v2, v4, v3, v5}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 205
    :goto_3
    iget-object p1, p0, Lcom/vkontakte/android/ui/OverlayTextView;->spannableStringBuilder:Landroid/text/SpannableStringBuilder;

    goto :goto_0

    .line 194
    .end local v0    # "trimmed":Ljava/lang/CharSequence;
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/ui/OverlayTextView;->spannableStringBuilder:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v1}, Landroid/text/SpannableStringBuilder;->clear()V

    goto :goto_1

    .line 196
    :cond_2
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    goto :goto_2

    .line 201
    .restart local v0    # "trimmed":Ljava/lang/CharSequence;
    :cond_3
    iget-object v1, p0, Lcom/vkontakte/android/ui/OverlayTextView;->spannableStringBuilder:Landroid/text/SpannableStringBuilder;

    const-string/jumbo v2, "   "

    invoke-virtual {v1, v2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 202
    iget-object v1, p0, Lcom/vkontakte/android/ui/OverlayTextView;->spannableStringBuilder:Landroid/text/SpannableStringBuilder;

    iget-object v2, p0, Lcom/vkontakte/android/ui/OverlayTextView;->imageSpan:Landroid/text/style/ImageSpan;

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 203
    iget-object v1, p0, Lcom/vkontakte/android/ui/OverlayTextView;->spannableStringBuilder:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v1, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    goto :goto_3
.end method

.method private init(Landroid/util/AttributeSet;I)V
    .locals 6
    .param p1, "attrs"    # Landroid/util/AttributeSet;
    .param p2, "defStyle"    # I

    .prologue
    const/4 v5, 0x0

    .line 49
    if-eqz p1, :cond_1

    .line 50
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/OverlayTextView;->getContext()Landroid/content/Context;

    move-result-object v3

    sget-object v4, Lcom/vkontakte/android/R$styleable;->OverlayView:[I

    invoke-virtual {v3, p1, v4, p2, v5}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 51
    .local v0, "a":Landroid/content/res/TypedArray;
    invoke-virtual {v0, v5, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    .line 52
    .local v1, "r":I
    if-eqz v1, :cond_0

    .line 53
    invoke-virtual {p0, v1}, Lcom/vkontakte/android/ui/OverlayTextView;->setOverlay(I)V

    .line 55
    :cond_0
    const/4 v3, 0x2

    invoke-virtual {v0, v3, v5}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v3

    iput-boolean v3, p0, Lcom/vkontakte/android/ui/OverlayTextView;->padOverlay:Z

    .line 56
    const/4 v3, 0x3

    invoke-virtual {v0, v3, v5}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v3

    iput-boolean v3, p0, Lcom/vkontakte/android/ui/OverlayTextView;->padAsBg:Z

    .line 57
    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v3

    iput-object v3, p0, Lcom/vkontakte/android/ui/OverlayTextView;->drawableColorStateList:Landroid/content/res/ColorStateList;

    .line 58
    const/4 v3, 0x4

    invoke-virtual {v0, v3}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 59
    .local v2, "src":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 61
    invoke-virtual {p0, v2}, Lcom/vkontakte/android/ui/OverlayTextView;->setSrc(Landroid/graphics/drawable/Drawable;)V

    .line 63
    .end local v0    # "a":Landroid/content/res/TypedArray;
    .end local v1    # "r":I
    .end local v2    # "src":Landroid/graphics/drawable/Drawable;
    :cond_1
    invoke-virtual {p0, v5}, Lcom/vkontakte/android/ui/OverlayTextView;->setWillNotDraw(Z)V

    .line 64
    return-void
.end method


# virtual methods
.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3
    .param p1, "event"    # Landroid/view/MotionEvent;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 132
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/ui/OverlayTextView;->overlay:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_0

    .line 133
    iget-object v0, p0, Lcom/vkontakte/android/ui/OverlayTextView;->overlay:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/Drawable;->setHotspot(FF)V

    .line 135
    :cond_0
    invoke-super {p0, p1}, Landroid/widget/TextView;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method protected drawableStateChanged()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 174
    invoke-super {p0}, Landroid/widget/TextView;->drawableStateChanged()V

    .line 175
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/OverlayTextView;->getDrawableState()[I

    move-result-object v0

    .line 176
    .local v0, "drawableState":[I
    iget-object v1, p0, Lcom/vkontakte/android/ui/OverlayTextView;->overlay:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/ui/OverlayTextView;->overlay:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 177
    iget-object v1, p0, Lcom/vkontakte/android/ui/OverlayTextView;->overlay:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 178
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/OverlayTextView;->postInvalidate()V

    .line 180
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/ui/OverlayTextView;->leftDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_1

    .line 181
    iget-object v1, p0, Lcom/vkontakte/android/ui/OverlayTextView;->leftDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 182
    iget-object v1, p0, Lcom/vkontakte/android/ui/OverlayTextView;->leftDrawable:Landroid/graphics/drawable/Drawable;

    iget-object v2, p0, Lcom/vkontakte/android/ui/OverlayTextView;->leftDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v2

    iget-object v3, p0, Lcom/vkontakte/android/ui/OverlayTextView;->leftDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v3

    invoke-virtual {v1, v4, v4, v2, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 183
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/OverlayTextView;->postInvalidate()V

    .line 185
    :cond_1
    return-void
.end method

.method public getCompoundDrawables()[Landroid/graphics/drawable/Drawable;
    .locals 3
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 93
    invoke-super {p0}, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 94
    .local v0, "drawables":[Landroid/graphics/drawable/Drawable;
    const/4 v1, 0x0

    iget-object v2, p0, Lcom/vkontakte/android/ui/OverlayTextView;->leftDrawable:Landroid/graphics/drawable/Drawable;

    aput-object v2, v0, v1

    .line 95
    return-object v0
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 9
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v5, 0x0

    .line 139
    invoke-super {p0, p1}, Landroid/widget/TextView;->onDraw(Landroid/graphics/Canvas;)V

    .line 140
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    .line 141
    .local v0, "m":Landroid/graphics/Matrix;
    const/16 v3, 0x9

    new-array v1, v3, [F

    .line 142
    .local v1, "mx":[F
    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->getValues([F)V

    .line 143
    const/4 v3, 0x2

    aget v3, v1, v3

    neg-float v3, v3

    const/4 v4, 0x5

    aget v4, v1, v4

    neg-float v4, v4

    invoke-virtual {p1, v3, v4}, Landroid/graphics/Canvas;->translate(FF)V

    .line 144
    iget-object v3, p0, Lcom/vkontakte/android/ui/OverlayTextView;->overlay:Landroid/graphics/drawable/Drawable;

    if-eqz v3, :cond_0

    .line 145
    iget-boolean v3, p0, Lcom/vkontakte/android/ui/OverlayTextView;->padOverlay:Z

    if-eqz v3, :cond_1

    .line 146
    iget-object v3, p0, Lcom/vkontakte/android/ui/OverlayTextView;->overlay:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/OverlayTextView;->getPaddingLeft()I

    move-result v4

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/OverlayTextView;->getPaddingTop()I

    move-result v5

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v6

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/OverlayTextView;->getPaddingRight()I

    move-result v7

    sub-int/2addr v6, v7

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v7

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/OverlayTextView;->getPaddingBottom()I

    move-result v8

    sub-int/2addr v7, v8

    invoke-virtual {v3, v4, v5, v6, v7}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 158
    :goto_0
    iget-object v3, p0, Lcom/vkontakte/android/ui/OverlayTextView;->overlay:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v3, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 160
    :cond_0
    return-void

    .line 147
    :cond_1
    iget-boolean v3, p0, Lcom/vkontakte/android/ui/OverlayTextView;->padAsBg:Z

    if-eqz v3, :cond_3

    .line 148
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    .line 149
    .local v2, "r":Landroid/graphics/Rect;
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/OverlayTextView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 150
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/OverlayTextView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 151
    invoke-virtual {v2, v5, v5, v5, v5}, Landroid/graphics/Rect;->set(IIII)V

    .line 154
    :cond_2
    iget-object v3, p0, Lcom/vkontakte/android/ui/OverlayTextView;->overlay:Landroid/graphics/drawable/Drawable;

    iget v4, v2, Landroid/graphics/Rect;->left:I

    iget v5, v2, Landroid/graphics/Rect;->top:I

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v6

    iget v7, v2, Landroid/graphics/Rect;->right:I

    sub-int/2addr v6, v7

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v7

    iget v8, v2, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v7, v8

    invoke-virtual {v3, v4, v5, v6, v7}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    goto :goto_0

    .line 156
    .end local v2    # "r":Landroid/graphics/Rect;
    :cond_3
    iget-object v3, p0, Lcom/vkontakte/android/ui/OverlayTextView;->overlay:Landroid/graphics/drawable/Drawable;

    iget v4, p0, Lcom/vkontakte/android/ui/OverlayTextView;->padLeft:I

    iget v5, p0, Lcom/vkontakte/android/ui/OverlayTextView;->padTop:I

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v6

    iget v7, p0, Lcom/vkontakte/android/ui/OverlayTextView;->padRight:I

    sub-int/2addr v6, v7

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v7

    iget v8, p0, Lcom/vkontakte/android/ui/OverlayTextView;->padBtm:I

    sub-int/2addr v7, v8

    invoke-virtual {v3, v4, v5, v6, v7}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    goto :goto_0
.end method

.method public setOverlay(I)V
    .locals 1
    .param p1, "resID"    # I

    .prologue
    .line 82
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/OverlayTextView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/OverlayTextView;->setOverlay(Landroid/graphics/drawable/Drawable;)V

    .line 83
    return-void
.end method

.method public setOverlay(Landroid/graphics/drawable/Drawable;)V
    .locals 2
    .param p1, "d"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 121
    iget-object v0, p0, Lcom/vkontakte/android/ui/OverlayTextView;->overlay:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_0

    .line 122
    iget-object v0, p0, Lcom/vkontakte/android/ui/OverlayTextView;->overlay:Landroid/graphics/drawable/Drawable;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 124
    :cond_0
    iput-object p1, p0, Lcom/vkontakte/android/ui/OverlayTextView;->overlay:Landroid/graphics/drawable/Drawable;

    .line 125
    iget-object v0, p0, Lcom/vkontakte/android/ui/OverlayTextView;->overlay:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 126
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/OverlayTextView;->invalidate()V

    .line 127
    return-void
.end method

.method public setOverlayPadding(IIII)V
    .locals 0
    .param p1, "l"    # I
    .param p2, "t"    # I
    .param p3, "r"    # I
    .param p4, "b"    # I

    .prologue
    .line 114
    iput p1, p0, Lcom/vkontakte/android/ui/OverlayTextView;->padLeft:I

    .line 115
    iput p2, p0, Lcom/vkontakte/android/ui/OverlayTextView;->padTop:I

    .line 116
    iput p3, p0, Lcom/vkontakte/android/ui/OverlayTextView;->padRight:I

    .line 117
    iput p4, p0, Lcom/vkontakte/android/ui/OverlayTextView;->padBtm:I

    .line 118
    return-void
.end method

.method public setPadOverlay(Z)V
    .locals 0
    .param p1, "pad"    # Z

    .prologue
    .line 86
    iput-boolean p1, p0, Lcom/vkontakte/android/ui/OverlayTextView;->padOverlay:Z

    .line 87
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/OverlayTextView;->invalidate()V

    .line 88
    return-void
.end method

.method public setPressed(Z)V
    .locals 3
    .param p1, "pressed"    # Z

    .prologue
    .line 106
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/OverlayTextView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 107
    .local v0, "parent":Landroid/view/View;
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xf

    if-gt v1, v2, :cond_0

    invoke-virtual {v0}, Landroid/view/View;->isPressed()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/OverlayTextView;->isDuplicateParentStateEnabled()Z

    move-result v1

    if-nez v1, :cond_0

    .line 111
    :goto_0
    return-void

    .line 110
    :cond_0
    invoke-super {p0, p1}, Landroid/widget/TextView;->setPressed(Z)V

    goto :goto_0
.end method

.method public setSrc(Landroid/graphics/drawable/Drawable;)V
    .locals 4
    .param p1, "src"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 67
    if-eqz p1, :cond_0

    .line 68
    iget-object v2, p0, Lcom/vkontakte/android/ui/OverlayTextView;->drawableColorStateList:Landroid/content/res/ColorStateList;

    if-nez v2, :cond_1

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/OverlayTextView;->getTextColors()Landroid/content/res/ColorStateList;

    move-result-object v0

    .line 69
    .local v0, "colorsList":Landroid/content/res/ColorStateList;
    :goto_0
    if-nez v0, :cond_2

    .line 70
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/ui/OverlayTextView;->leftDrawable:Landroid/graphics/drawable/Drawable;

    .line 76
    :goto_1
    new-instance v2, Lcom/vkontakte/android/ui/drawables/CenteredImageSpan;

    iget-object v3, p0, Lcom/vkontakte/android/ui/OverlayTextView;->leftDrawable:Landroid/graphics/drawable/Drawable;

    invoke-direct {v2, v3}, Lcom/vkontakte/android/ui/drawables/CenteredImageSpan;-><init>(Landroid/graphics/drawable/Drawable;)V

    iput-object v2, p0, Lcom/vkontakte/android/ui/OverlayTextView;->imageSpan:Landroid/text/style/ImageSpan;

    .line 77
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/OverlayTextView;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/ui/OverlayTextView;->setText(Ljava/lang/CharSequence;)V

    .line 79
    .end local v0    # "colorsList":Landroid/content/res/ColorStateList;
    :cond_0
    return-void

    .line 68
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/ui/OverlayTextView;->drawableColorStateList:Landroid/content/res/ColorStateList;

    goto :goto_0

    .line 72
    .restart local v0    # "colorsList":Landroid/content/res/ColorStateList;
    :cond_2
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-static {v2}, Landroid/support/v4/graphics/drawable/DrawableCompat;->wrap(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 73
    .local v1, "drawable":Landroid/graphics/drawable/Drawable;
    invoke-static {v1, v0}, Landroid/support/v4/graphics/drawable/DrawableCompat;->setTintList(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    .line 74
    iput-object v1, p0, Lcom/vkontakte/android/ui/OverlayTextView;->leftDrawable:Landroid/graphics/drawable/Drawable;

    goto :goto_1
.end method

.method public setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V
    .locals 1
    .param p1, "text"    # Ljava/lang/CharSequence;
    .param p2, "type"    # Landroid/widget/TextView$BufferType;

    .prologue
    .line 169
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/OverlayTextView;->getSpannedText(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-super {p0, v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V

    .line 170
    return-void
.end method

.method public setTextColor(Landroid/content/res/ColorStateList;)V
    .locals 1
    .param p1, "colors"    # Landroid/content/res/ColorStateList;

    .prologue
    .line 100
    invoke-super {p0, p1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 101
    iget-object v0, p0, Lcom/vkontakte/android/ui/OverlayTextView;->leftDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/OverlayTextView;->setSrc(Landroid/graphics/drawable/Drawable;)V

    .line 102
    return-void
.end method

.method protected verifyDrawable(Landroid/graphics/drawable/Drawable;)Z
    .locals 1
    .param p1, "d"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 164
    invoke-super {p0, p1}, Landroid/widget/TextView;->verifyDrawable(Landroid/graphics/drawable/Drawable;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/ui/OverlayTextView;->overlay:Landroid/graphics/drawable/Drawable;

    if-ne p1, v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
