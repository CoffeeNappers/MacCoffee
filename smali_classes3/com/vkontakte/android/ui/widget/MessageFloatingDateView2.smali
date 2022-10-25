.class public Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;
.super Landroid/view/View;
.source "MessageFloatingDateView2.java"


# instance fields
.field private mBgDrawable:Landroid/graphics/drawable/Drawable;

.field private mBgLayout:Landroid/graphics/Rect;

.field private mBgPadding:Landroid/graphics/Rect;

.field private mFontMetricsInt:Landroid/graphics/Paint$FontMetricsInt;

.field private mInvalidateText:Z

.field private mText:Ljava/lang/CharSequence;

.field private mTextLayout:Landroid/graphics/Rect;

.field private mTextMeasuredWidth:I

.field private mTextPaint:Landroid/text/TextPaint;

.field private mTextPrepared:Ljava/lang/CharSequence;

.field private mUseClip:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 29
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 30
    invoke-direct {p0}, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->init()V

    .line 31
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 34
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 35
    invoke-direct {p0}, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->init()V

    .line 36
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 39
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 40
    invoke-direct {p0}, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->init()V

    .line 41
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 45
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 46
    invoke-direct {p0}, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->init()V

    .line 47
    return-void
.end method

.method private drawInner(Landroid/graphics/Canvas;)V
    .locals 7
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 230
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mBgDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 231
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mTextPrepared:Ljava/lang/CharSequence;

    if-eqz v0, :cond_0

    .line 232
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mTextPrepared:Ljava/lang/CharSequence;

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mTextPrepared:Ljava/lang/CharSequence;

    .line 234
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v3

    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mTextLayout:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->left:I

    int-to-float v4, v0

    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mTextLayout:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    iget-object v5, p0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mFontMetricsInt:Landroid/graphics/Paint$FontMetricsInt;

    iget v5, v5, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    sub-int/2addr v0, v5

    int-to-float v5, v0

    iget-object v6, p0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mTextPaint:Landroid/text/TextPaint;

    move-object v0, p1

    .line 232
    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Canvas;->drawText(Ljava/lang/CharSequence;IIFFLandroid/graphics/Paint;)V

    .line 239
    :cond_0
    return-void
.end method

.method private getTextHeight()I
    .locals 2

    .prologue
    .line 242
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mFontMetricsInt:Landroid/graphics/Paint$FontMetricsInt;

    iget v0, v0, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mFontMetricsInt:Landroid/graphics/Paint$FontMetricsInt;

    iget v1, v1, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    sub-int/2addr v0, v1

    return v0
.end method

.method private init()V
    .locals 10

    .prologue
    const/4 v9, 0x0

    const/4 v8, 0x1

    const/4 v7, 0x0

    const/high16 v5, 0x41800000    # 16.0f

    .line 64
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 65
    .local v0, "context":Landroid/content/Context;
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 67
    .local v1, "r":Landroid/content/res/Resources;
    new-instance v2, Landroid/text/TextPaint;

    invoke-direct {v2}, Landroid/text/TextPaint;-><init>()V

    iput-object v2, p0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mTextPaint:Landroid/text/TextPaint;

    .line 68
    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mTextPaint:Landroid/text/TextPaint;

    invoke-virtual {v2, v8}, Landroid/text/TextPaint;->setAntiAlias(Z)V

    .line 69
    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mTextPaint:Landroid/text/TextPaint;

    const/high16 v3, 0x41500000    # 13.0f

    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v2, v3}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 70
    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mTextPaint:Landroid/text/TextPaint;

    sget-object v3, Lcom/vkontakte/android/ui/Font;->Medium:Lcom/vkontakte/android/ui/Font;

    iget-object v3, v3, Lcom/vkontakte/android/ui/Font;->typeface:Landroid/graphics/Typeface;

    invoke-virtual {v2, v3}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 71
    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mTextPaint:Landroid/text/TextPaint;

    const-string/jumbo v3, "#78838F"

    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/text/TextPaint;->setColor(I)V

    .line 73
    new-instance v2, Landroid/graphics/Paint$FontMetricsInt;

    invoke-direct {v2}, Landroid/graphics/Paint$FontMetricsInt;-><init>()V

    iput-object v2, p0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mFontMetricsInt:Landroid/graphics/Paint$FontMetricsInt;

    .line 74
    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mTextPaint:Landroid/text/TextPaint;

    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mFontMetricsInt:Landroid/graphics/Paint$FontMetricsInt;

    invoke-virtual {v2, v3}, Landroid/text/TextPaint;->getFontMetricsInt(Landroid/graphics/Paint$FontMetricsInt;)I

    .line 76
    const v2, 0x7f020079

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mBgDrawable:Landroid/graphics/drawable/Drawable;

    .line 77
    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mBgDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2, p0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 78
    new-instance v2, Landroid/graphics/Rect;

    .line 79
    invoke-static {v5}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    const/high16 v4, 0x41300000    # 11.0f

    .line 80
    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    .line 81
    invoke-static {v5}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v5

    const/high16 v6, 0x41400000    # 12.0f

    .line 82
    invoke-static {v6}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v6

    invoke-direct {v2, v3, v4, v5, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object v2, p0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mBgPadding:Landroid/graphics/Rect;

    .line 84
    iput-object v9, p0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mTextPrepared:Ljava/lang/CharSequence;

    .line 85
    iput-boolean v8, p0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mInvalidateText:Z

    .line 86
    iput v7, p0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mTextMeasuredWidth:I

    .line 87
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    iput-object v2, p0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mTextLayout:Landroid/graphics/Rect;

    .line 88
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    iput-object v2, p0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mBgLayout:Landroid/graphics/Rect;

    .line 89
    iput-boolean v7, p0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mUseClip:Z

    .line 91
    iput-object v9, p0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mText:Ljava/lang/CharSequence;

    .line 92
    return-void
.end method

.method private invalidateInnerMeasureLayout()V
    .locals 17

    .prologue
    .line 178
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->getMeasuredWidth()I

    move-result v1

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->getPaddingLeft()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->getPaddingRight()I

    move-result v2

    sub-int v8, v1, v2

    .line 179
    .local v8, "availWidth":I
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->getMeasuredHeight()I

    move-result v1

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->getPaddingTop()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->getPaddingBottom()I

    move-result v2

    sub-int v7, v1, v2

    .line 180
    .local v7, "availHeight":I
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->getPaddingLeft()I

    move-result v10

    .line 181
    .local v10, "childLeft":I
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->getPaddingTop()I

    move-result v12

    .line 182
    .local v12, "childTop":I
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->getMeasuredWidth()I

    move-result v1

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->getPaddingRight()I

    move-result v2

    sub-int v11, v1, v2

    .line 183
    .local v11, "childRight":I
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->getMeasuredHeight()I

    move-result v1

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->getPaddingBottom()I

    move-result v2

    sub-int v9, v1, v2

    .line 185
    .local v9, "childBottom":I
    const/4 v1, 0x0

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mBgPadding:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->left:I

    sub-int v2, v8, v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mBgPadding:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->right:I

    sub-int/2addr v2, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v16

    .line 188
    .local v16, "textAvailWidth":I
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mText:Ljava/lang/CharSequence;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 189
    const/4 v1, 0x0

    move-object/from16 v0, p0

    iput v1, v0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mTextMeasuredWidth:I

    .line 206
    :goto_0
    move-object/from16 v0, p0

    iget v1, v0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mTextMeasuredWidth:I

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mBgPadding:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->left:I

    add-int/2addr v1, v2

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mBgPadding:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->right:I

    add-int v13, v1, v2

    .line 211
    .local v13, "drWidth":I
    sub-int v1, v11, v10

    div-int/lit8 v1, v1, 0x2

    add-int/2addr v1, v10

    div-int/lit8 v2, v13, 0x2

    sub-int v14, v1, v2

    .line 212
    .local v14, "itemLeft":I
    move v15, v12

    .line 213
    .local v15, "itemTop":I
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mBgLayout:Landroid/graphics/Rect;

    add-int v2, v14, v13

    invoke-virtual {v1, v14, v15, v2, v9}, Landroid/graphics/Rect;->set(IIII)V

    .line 218
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mBgDrawable:Landroid/graphics/drawable/Drawable;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mBgLayout:Landroid/graphics/Rect;

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 220
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mBgLayout:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->left:I

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mBgPadding:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->left:I

    add-int v14, v1, v2

    .line 221
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mBgLayout:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->top:I

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mBgPadding:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->top:I

    add-int v15, v1, v2

    .line 222
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mTextLayout:Landroid/graphics/Rect;

    move-object/from16 v0, p0

    iget v2, v0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mTextMeasuredWidth:I

    add-int/2addr v2, v14

    .line 226
    invoke-direct/range {p0 .. p0}, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->getTextHeight()I

    move-result v3

    add-int/2addr v3, v15

    .line 222
    invoke-virtual {v1, v14, v15, v2, v3}, Landroid/graphics/Rect;->set(IIII)V

    .line 227
    return-void

    .line 191
    .end local v13    # "drWidth":I
    .end local v14    # "itemLeft":I
    .end local v15    # "itemTop":I
    :cond_0
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mTextPaint:Landroid/text/TextPaint;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mText:Ljava/lang/CharSequence;

    const/4 v3, 0x0

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mText:Ljava/lang/CharSequence;

    invoke-interface {v4}, Ljava/lang/CharSequence;->length()I

    move-result v4

    invoke-virtual {v1, v2, v3, v4}, Landroid/text/TextPaint;->measureText(Ljava/lang/CharSequence;II)F

    move-result v1

    float-to-int v1, v1

    move-object/from16 v0, p0

    iput v1, v0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mTextMeasuredWidth:I

    .line 192
    move-object/from16 v0, p0

    iget v1, v0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mTextMeasuredWidth:I

    move/from16 v0, v16

    if-gt v1, v0, :cond_1

    .line 193
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mText:Ljava/lang/CharSequence;

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mTextPrepared:Ljava/lang/CharSequence;

    goto/16 :goto_0

    .line 195
    :cond_1
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mText:Ljava/lang/CharSequence;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mTextPaint:Landroid/text/TextPaint;

    move/from16 v0, v16

    int-to-float v3, v0

    sget-object v4, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-static/range {v1 .. v6}, Landroid/text/TextUtils;->ellipsize(Ljava/lang/CharSequence;Landroid/text/TextPaint;FLandroid/text/TextUtils$TruncateAt;ZLandroid/text/TextUtils$EllipsizeCallback;)Ljava/lang/CharSequence;

    move-result-object v1

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mTextPrepared:Ljava/lang/CharSequence;

    .line 202
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mTextPaint:Landroid/text/TextPaint;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mTextPrepared:Ljava/lang/CharSequence;

    const/4 v3, 0x0

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mTextPrepared:Ljava/lang/CharSequence;

    invoke-interface {v4}, Ljava/lang/CharSequence;->length()I

    move-result v4

    invoke-virtual {v1, v2, v3, v4}, Landroid/text/TextPaint;->measureText(Ljava/lang/CharSequence;II)F

    move-result v1

    float-to-int v1, v1

    move-object/from16 v0, p0

    iput v1, v0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mTextMeasuredWidth:I

    goto/16 :goto_0
.end method


# virtual methods
.method public getText()Ljava/lang/CharSequence;
    .locals 1

    .prologue
    .line 109
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mText:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getTextLocationFromBottom()I
    .locals 2

    .prologue
    .line 117
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->getPaddingBottom()I

    move-result v0

    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mBgPadding:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v0, v1

    return v0
.end method

.method public getTextLocationFromTop()I
    .locals 2

    .prologue
    .line 113
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->getPaddingTop()I

    move-result v0

    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mBgPadding:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->top:I

    add-int/2addr v0, v1

    return v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 4
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 162
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 163
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mInvalidateText:Z

    if-eqz v0, :cond_0

    .line 164
    invoke-direct {p0}, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->invalidateInnerMeasureLayout()V

    .line 165
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mInvalidateText:Z

    .line 167
    :cond_0
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mUseClip:Z

    if-eqz v0, :cond_1

    .line 168
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 169
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->getLeft()I

    move-result v0

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->getTop()I

    move-result v1

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->getRight()I

    move-result v2

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->getBottom()I

    move-result v3

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->clipRect(IIII)Z

    .line 171
    :cond_1
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->drawInner(Landroid/graphics/Canvas;)V

    .line 172
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mUseClip:Z

    if-eqz v0, :cond_2

    .line 173
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 175
    :cond_2
    return-void
.end method

.method protected onMeasure(II)V
    .locals 15
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 122
    const/4 v13, 0x1

    iput-boolean v13, p0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mInvalidateText:Z

    .line 124
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->getPaddingLeft()I

    move-result v13

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->getPaddingRight()I

    move-result v14

    add-int v12, v13, v14

    .line 125
    .local v12, "usedWidth":I
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->getPaddingTop()I

    move-result v13

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->getPaddingBottom()I

    move-result v14

    add-int v11, v13, v14

    .line 126
    .local v11, "usedHeight":I
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->getSuggestedMinimumWidth()I

    move-result v8

    .line 127
    .local v8, "minWidth":I
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->getSuggestedMinimumHeight()I

    move-result v7

    .line 128
    .local v7, "minHeight":I
    const v6, 0x7fffffff

    .line 129
    .local v6, "maxWidth":I
    const v5, 0x7fffffff

    .line 131
    .local v5, "maxHeight":I
    const v13, 0x7fffffff

    move/from16 v0, p1

    invoke-static {v0, v8, v13, v12}, Lcom/vkontakte/android/ViewUtils;->getSuggestedAvailableSizeFromSpec(IIII)I

    move-result v2

    .line 136
    .local v2, "availWidth":I
    const v13, 0x7fffffff

    move/from16 v0, p2

    invoke-static {v0, v7, v13, v11}, Lcom/vkontakte/android/ViewUtils;->getSuggestedAvailableSizeFromSpec(IIII)I

    move-result v1

    .line 142
    .local v1, "availHeight":I
    add-int v10, v12, v2

    .line 143
    .local v10, "rWidth":I
    iget-object v13, p0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mBgPadding:Landroid/graphics/Rect;

    iget v13, v13, Landroid/graphics/Rect;->top:I

    add-int/2addr v13, v11

    iget-object v14, p0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mBgPadding:Landroid/graphics/Rect;

    iget v14, v14, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v13, v14

    invoke-direct {p0}, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->getTextHeight()I

    move-result v14

    add-int v9, v13, v14

    .line 145
    .local v9, "rHeight":I
    const v13, 0x7fffffff

    move/from16 v0, p1

    invoke-static {v0, v8, v13, v10}, Lcom/vkontakte/android/ViewUtils;->getMeasurement(IIII)I

    move-result v4

    .line 150
    .local v4, "finalWidth":I
    const v13, 0x7fffffff

    move/from16 v0, p2

    invoke-static {v0, v7, v13, v9}, Lcom/vkontakte/android/ViewUtils;->getMeasurement(IIII)I

    move-result v3

    .line 155
    .local v3, "finalHeight":I
    if-gt v10, v4, :cond_0

    if-le v9, v3, :cond_1

    :cond_0
    const/4 v13, 0x1

    :goto_0
    iput-boolean v13, p0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mUseClip:Z

    .line 157
    invoke-virtual {p0, v4, v3}, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->setMeasuredDimension(II)V

    .line 158
    return-void

    .line 155
    :cond_1
    const/4 v13, 0x0

    goto :goto_0
.end method

.method public setText(Ljava/lang/CharSequence;)V
    .locals 1
    .param p1, "text"    # Ljava/lang/CharSequence;

    .prologue
    .line 101
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mText:Ljava/lang/CharSequence;

    if-nez v0, :cond_0

    if-eqz p1, :cond_1

    .line 102
    :cond_0
    iput-object p1, p0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mText:Ljava/lang/CharSequence;

    .line 103
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mInvalidateText:Z

    .line 104
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->invalidate()V

    .line 106
    :cond_1
    return-void
.end method

.method protected verifyDrawable(Landroid/graphics/drawable/Drawable;)Z
    .locals 1
    .param p1, "who"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 96
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MessageFloatingDateView2;->mBgDrawable:Landroid/graphics/drawable/Drawable;

    if-eq p1, v0, :cond_0

    .line 97
    invoke-super {p0, p1}, Landroid/view/View;->verifyDrawable(Landroid/graphics/drawable/Drawable;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
