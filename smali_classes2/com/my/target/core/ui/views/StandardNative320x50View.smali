.class public Lcom/my/target/core/ui/views/StandardNative320x50View;
.super Landroid/widget/RelativeLayout;
.source "StandardNative320x50View.java"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "ViewConstructor"
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/my/target/core/ui/views/StandardNative320x50View$a;
    }
.end annotation


# instance fields
.field private final a:Lcom/my/target/core/ui/views/BorderedTextView;

.field private final b:Landroid/widget/TextView;

.field private final c:Landroid/widget/TextView;

.field private final d:Landroid/widget/TextView;

.field private final e:Landroid/widget/LinearLayout;

.field private final f:Landroid/widget/Button;

.field private final g:Lcom/my/target/nativeads/views/StarsRatingView;

.field private final h:Lcom/my/target/core/ui/views/CacheImageView;

.field private final i:Landroid/widget/RelativeLayout;

.field private final j:Landroid/widget/RelativeLayout;

.field private final k:Landroid/widget/ViewFlipper;

.field private final l:Lcom/my/target/core/utils/l;

.field private final m:I

.field private final n:Landroid/widget/FrameLayout;

.field private final o:Ljava/lang/Runnable;

.field private final p:Ljava/lang/Runnable;

.field private final q:Landroid/view/View$OnClickListener;

.field private final r:Ljava/lang/Runnable;

.field private s:Lcom/my/target/core/ui/views/StandardNative320x50View$a;

.field private t:Lcom/my/target/core/engines/h;

.field private u:Ljava/lang/String;

.field private v:Lcom/my/target/core/models/banners/j;

.field private w:I

.field private x:I

.field private y:Lcom/my/target/core/models/j;


# direct methods
.method public constructor <init>(Landroid/content/Context;I)V
    .locals 1

    .prologue
    .line 253
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/my/target/core/ui/views/StandardNative320x50View;-><init>(Landroid/content/Context;IB)V

    .line 254
    return-void
.end method

.method private constructor <init>(Landroid/content/Context;IB)V
    .locals 11

    .prologue
    const/4 v10, -0x1

    const/4 v9, 0x4

    const/4 v8, 0x2

    const/4 v7, 0x1

    const/4 v6, -0x2

    .line 258
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 57
    new-instance v0, Lcom/my/target/core/ui/views/StandardNative320x50View$1;

    invoke-direct {v0, p0}, Lcom/my/target/core/ui/views/StandardNative320x50View$1;-><init>(Lcom/my/target/core/ui/views/StandardNative320x50View;)V

    iput-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->o:Ljava/lang/Runnable;

    .line 73
    new-instance v0, Lcom/my/target/core/ui/views/StandardNative320x50View$2;

    invoke-direct {v0, p0}, Lcom/my/target/core/ui/views/StandardNative320x50View$2;-><init>(Lcom/my/target/core/ui/views/StandardNative320x50View;)V

    iput-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->p:Ljava/lang/Runnable;

    .line 91
    new-instance v0, Lcom/my/target/core/ui/views/StandardNative320x50View$3;

    invoke-direct {v0, p0}, Lcom/my/target/core/ui/views/StandardNative320x50View$3;-><init>(Lcom/my/target/core/ui/views/StandardNative320x50View;)V

    iput-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->q:Landroid/view/View$OnClickListener;

    .line 102
    new-instance v0, Lcom/my/target/core/ui/views/StandardNative320x50View$4;

    invoke-direct {v0, p0}, Lcom/my/target/core/ui/views/StandardNative320x50View$4;-><init>(Lcom/my/target/core/ui/views/StandardNative320x50View;)V

    iput-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->r:Ljava/lang/Runnable;

    .line 122
    const/4 v0, 0x3

    iput v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->w:I

    .line 259
    iput p2, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->m:I

    .line 260
    new-instance v0, Lcom/my/target/core/utils/l;

    invoke-direct {v0, p1}, Lcom/my/target/core/utils/l;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->l:Lcom/my/target/core/utils/l;

    .line 262
    new-instance v0, Lcom/my/target/core/ui/views/CacheImageView;

    invoke-direct {v0, p1}, Lcom/my/target/core/ui/views/CacheImageView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->h:Lcom/my/target/core/ui/views/CacheImageView;

    .line 263
    new-instance v0, Landroid/widget/FrameLayout;

    invoke-direct {v0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->n:Landroid/widget/FrameLayout;

    .line 264
    new-instance v0, Landroid/widget/ViewFlipper;

    invoke-direct {v0, p1}, Landroid/widget/ViewFlipper;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->k:Landroid/widget/ViewFlipper;

    .line 265
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->e:Landroid/widget/LinearLayout;

    .line 266
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->f:Landroid/widget/Button;

    .line 267
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->b:Landroid/widget/TextView;

    .line 268
    new-instance v0, Lcom/my/target/core/ui/views/BorderedTextView;

    invoke-direct {v0, p1}, Lcom/my/target/core/ui/views/BorderedTextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->a:Lcom/my/target/core/ui/views/BorderedTextView;

    .line 269
    new-instance v0, Lcom/my/target/nativeads/views/StarsRatingView;

    invoke-direct {v0, p1}, Lcom/my/target/nativeads/views/StarsRatingView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->g:Lcom/my/target/nativeads/views/StarsRatingView;

    .line 270
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->c:Landroid/widget/TextView;

    .line 271
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->d:Landroid/widget/TextView;

    .line 272
    new-instance v0, Landroid/widget/RelativeLayout;

    invoke-direct {v0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->i:Landroid/widget/RelativeLayout;

    .line 273
    new-instance v0, Landroid/widget/RelativeLayout;

    invoke-direct {v0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->j:Landroid/widget/RelativeLayout;

    .line 2462
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->h:Lcom/my/target/core/ui/views/CacheImageView;

    const/16 v1, 0x191

    invoke-virtual {v0, v1}, Lcom/my/target/core/ui/views/CacheImageView;->setId(I)V

    .line 2463
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->n:Landroid/widget/FrameLayout;

    iget-object v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->q:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2465
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->f:Landroid/widget/Button;

    const/16 v1, 0x193

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setId(I)V

    .line 2466
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->f:Landroid/widget/Button;

    iget-object v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->l:Lcom/my/target/core/utils/l;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v1

    iget-object v2, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->l:Lcom/my/target/core/utils/l;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v2

    iget-object v3, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->l:Lcom/my/target/core/utils/l;

    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v3

    iget-object v4, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->l:Lcom/my/target/core/utils/l;

    const/16 v5, 0x8

    invoke-virtual {v4, v5}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/Button;->setPadding(IIII)V

    .line 2469
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->f:Landroid/widget/Button;

    iget v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->m:I

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setMinimumWidth(I)V

    .line 2470
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->f:Landroid/widget/Button;

    const/high16 v1, 0x41a00000    # 20.0f

    invoke-virtual {v0, v8, v1}, Landroid/widget/Button;->setTextSize(IF)V

    .line 2471
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->f:Landroid/widget/Button;

    iget v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->m:I

    mul-int/lit8 v1, v1, 0x2

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setMaxWidth(I)V

    .line 2472
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->f:Landroid/widget/Button;

    iget-object v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->q:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2473
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v6, v10}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 2474
    const/16 v1, 0xb

    invoke-virtual {v0, v1, v10}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 2475
    iget-object v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->f:Landroid/widget/Button;

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 2477
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v10, v6}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 2479
    const/4 v1, 0x0

    const/16 v2, 0x193

    invoke-virtual {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 2480
    const/16 v1, 0x191

    invoke-virtual {v0, v7, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 2481
    iget-object v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->k:Landroid/widget/ViewFlipper;

    invoke-virtual {v1, v0}, Landroid/widget/ViewFlipper;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 2482
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->k:Landroid/widget/ViewFlipper;

    invoke-static {}, Lcom/my/target/core/utils/b;->a()Landroid/view/animation/Animation;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->setInAnimation(Landroid/view/animation/Animation;)V

    .line 2483
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->k:Landroid/widget/ViewFlipper;

    invoke-static {}, Lcom/my/target/core/utils/b;->b()Landroid/view/animation/Animation;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->setOutAnimation(Landroid/view/animation/Animation;)V

    .line 2485
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->k:Landroid/widget/ViewFlipper;

    iget-object v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->q:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2487
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->e:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v7}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 2489
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    iget v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->m:I

    div-int/lit8 v1, v1, 0x2

    invoke-direct {v0, v10, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 2492
    iget-object v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->i:Landroid/widget/RelativeLayout;

    invoke-virtual {v1, v0}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 2493
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->i:Landroid/widget/RelativeLayout;

    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setGravity(I)V

    .line 2495
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->b:Landroid/widget/TextView;

    const/16 v1, 0x192

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setId(I)V

    .line 2496
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->b:Landroid/widget/TextView;

    invoke-virtual {v0, v7}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 2497
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->b:Landroid/widget/TextView;

    invoke-virtual {v0, v7}, Landroid/widget/TextView;->setHorizontallyScrolling(Z)V

    .line 2498
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->b:Landroid/widget/TextView;

    invoke-virtual {v0, v7}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 2499
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->b:Landroid/widget/TextView;

    const/16 v1, 0x19

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMaxEms(I)V

    .line 2500
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->b:Landroid/widget/TextView;

    const/high16 v1, 0x41800000    # 16.0f

    invoke-virtual {v0, v8, v1}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 2501
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->b:Landroid/widget/TextView;

    sget-object v1, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 2503
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v6, v6}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 2505
    iget-object v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->l:Lcom/my/target/core/utils/l;

    invoke-virtual {v1, v9}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v1

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->rightMargin:I

    .line 2506
    iget-object v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->l:Lcom/my/target/core/utils/l;

    invoke-virtual {v1, v9}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v1

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    .line 2507
    iget-object v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->l:Lcom/my/target/core/utils/l;

    invoke-virtual {v1, v8}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v1

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 2508
    const/16 v1, 0xf

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 2510
    iget-object v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->b:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 2512
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->a:Lcom/my/target/core/ui/views/BorderedTextView;

    const/16 v1, 0x190

    invoke-virtual {v0, v1}, Lcom/my/target/core/ui/views/BorderedTextView;->setId(I)V

    .line 2513
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->a:Lcom/my/target/core/ui/views/BorderedTextView;

    const v1, -0x777778

    invoke-virtual {v0, v7, v1}, Lcom/my/target/core/ui/views/BorderedTextView;->setBorder(II)V

    .line 2514
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->a:Lcom/my/target/core/ui/views/BorderedTextView;

    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Lcom/my/target/core/ui/views/BorderedTextView;->setGravity(I)V

    .line 2515
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->a:Lcom/my/target/core/ui/views/BorderedTextView;

    const/high16 v1, 0x41200000    # 10.0f

    invoke-virtual {v0, v8, v1}, Lcom/my/target/core/ui/views/BorderedTextView;->setTextSize(IF)V

    .line 2516
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->a:Lcom/my/target/core/ui/views/BorderedTextView;

    iget-object v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->l:Lcom/my/target/core/utils/l;

    invoke-virtual {v1, v8}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v1

    iget-object v2, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->l:Lcom/my/target/core/utils/l;

    invoke-virtual {v2, v9}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/my/target/core/ui/views/BorderedTextView;->setPadding(IIII)V

    .line 2517
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->a:Lcom/my/target/core/ui/views/BorderedTextView;

    invoke-virtual {v0, v7}, Lcom/my/target/core/ui/views/BorderedTextView;->setLines(I)V

    .line 2518
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v6, v6}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 2520
    const/16 v1, 0xf

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 2521
    iget-object v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->l:Lcom/my/target/core/utils/l;

    invoke-virtual {v1, v8}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v1

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 2522
    const/16 v1, 0x192

    invoke-virtual {v0, v7, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 2523
    iget-object v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->a:Lcom/my/target/core/ui/views/BorderedTextView;

    invoke-virtual {v1, v0}, Lcom/my/target/core/ui/views/BorderedTextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 2525
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    iget v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->m:I

    div-int/lit8 v1, v1, 0x2

    invoke-direct {v0, v10, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 2527
    iget-object v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->j:Landroid/widget/RelativeLayout;

    invoke-virtual {v1, v0}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 2529
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->g:Lcom/my/target/nativeads/views/StarsRatingView;

    const/16 v1, 0x194

    invoke-virtual {v0, v1}, Lcom/my/target/nativeads/views/StarsRatingView;->setId(I)V

    .line 2530
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    iget-object v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->l:Lcom/my/target/core/utils/l;

    const/16 v2, 0x49

    invoke-virtual {v1, v2}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v1

    iget-object v2, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->l:Lcom/my/target/core/utils/l;

    const/16 v3, 0xc

    .line 2531
    invoke-virtual {v2, v3}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v2

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 2532
    iget-object v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->l:Lcom/my/target/core/utils/l;

    invoke-virtual {v1, v9}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v1

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    .line 2533
    iget-object v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->l:Lcom/my/target/core/utils/l;

    invoke-virtual {v1, v9}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v1

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 2534
    iget-object v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->l:Lcom/my/target/core/utils/l;

    invoke-virtual {v1, v8}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v1

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->bottomMargin:I

    .line 2535
    const/16 v1, 0xf

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 2536
    iget-object v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->g:Lcom/my/target/nativeads/views/StarsRatingView;

    invoke-virtual {v1, v0}, Lcom/my/target/nativeads/views/StarsRatingView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 2538
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v6, v6}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 2540
    const/16 v1, 0x194

    invoke-virtual {v0, v7, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 2541
    const/16 v1, 0xf

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 2542
    iget-object v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->c:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 2544
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v6, v6}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 2547
    iget-object v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->l:Lcom/my/target/core/utils/l;

    invoke-virtual {v1, v9}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v1

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    .line 2548
    iget-object v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->d:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 2550
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v6, v6}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 2552
    const/16 v1, 0xf

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 2554
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->f:Landroid/widget/Button;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    .line 2556
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->h:Lcom/my/target/core/ui/views/CacheImageView;

    invoke-virtual {p0, v0}, Lcom/my/target/core/ui/views/StandardNative320x50View;->addView(Landroid/view/View;)V

    .line 2557
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->n:Landroid/widget/FrameLayout;

    invoke-virtual {p0, v0}, Lcom/my/target/core/ui/views/StandardNative320x50View;->addView(Landroid/view/View;)V

    .line 2558
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->f:Landroid/widget/Button;

    invoke-virtual {p0, v0}, Lcom/my/target/core/ui/views/StandardNative320x50View;->addView(Landroid/view/View;)V

    .line 2560
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->j:Landroid/widget/RelativeLayout;

    iget-object v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->g:Lcom/my/target/nativeads/views/StarsRatingView;

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 2561
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->j:Landroid/widget/RelativeLayout;

    iget-object v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->c:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 2562
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->j:Landroid/widget/RelativeLayout;

    iget-object v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->d:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 2564
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->i:Landroid/widget/RelativeLayout;

    iget-object v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->b:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 2565
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->i:Landroid/widget/RelativeLayout;

    iget-object v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->a:Lcom/my/target/core/ui/views/BorderedTextView;

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 2566
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->e:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->i:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 2567
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->e:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->j:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 2569
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->k:Landroid/widget/ViewFlipper;

    iget-object v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->e:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->addView(Landroid/view/View;)V

    .line 2571
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->k:Landroid/widget/ViewFlipper;

    invoke-virtual {p0, v0}, Lcom/my/target/core/ui/views/StandardNative320x50View;->addView(Landroid/view/View;)V

    .line 276
    return-void
.end method

.method static synthetic a(Lcom/my/target/core/ui/views/StandardNative320x50View;)Landroid/widget/ViewFlipper;
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->k:Landroid/widget/ViewFlipper;

    return-object v0
.end method

.method private static a(Ljava/lang/String;FLandroid/graphics/Paint;)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "F",
            "Landroid/graphics/Paint;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 430
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 432
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 434
    const-string/jumbo v0, "\\s"

    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 435
    array-length v5, v4

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    if-ge v1, v5, :cond_2

    aget-object v0, v4, v1

    .line 437
    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v6

    cmpg-float v6, v6, p1

    if-gez v6, :cond_1

    .line 439
    invoke-static {p1, p2, v2, v3, v0}, Lcom/my/target/core/ui/views/StandardNative320x50View;->a(FLandroid/graphics/Paint;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 435
    :cond_0
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    .line 443
    :cond_1
    invoke-static {v0, p1, p2}, Lcom/my/target/core/ui/views/StandardNative320x50View;->b(Ljava/lang/String;FLandroid/graphics/Paint;)Ljava/util/List;

    move-result-object v0

    .line 444
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 446
    invoke-static {p1, p2, v2, v3, v0}, Lcom/my/target/core/ui/views/StandardNative320x50View;->a(FLandroid/graphics/Paint;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;)V

    goto :goto_1

    .line 451
    :cond_2
    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3

    .line 453
    const-string/jumbo v0, " "

    invoke-static {v0, v3}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 455
    :cond_3
    return-object v2
.end method

.method private static a(FLandroid/graphics/Paint;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F",
            "Landroid/graphics/Paint;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 616
    invoke-virtual {p3, p4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 617
    const-string/jumbo v0, " "

    invoke-static {v0, p3}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v0

    .line 618
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v0

    cmpl-float v0, v0, p0

    if-ltz v0, :cond_0

    .line 621
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p3, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 622
    const-string/jumbo v0, " "

    invoke-static {v0, p3}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 623
    invoke-virtual {p3}, Ljava/util/ArrayList;->clear()V

    .line 625
    invoke-virtual {p3, p4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 627
    :cond_0
    return-void
.end method

.method private a(I)V
    .locals 10

    .prologue
    const v9, 0x3f99999a    # 1.2f

    const/4 v8, 0x0

    const/16 v7, 0x10

    const/4 v2, 0x0

    const/4 v6, 0x1

    .line 321
    if-nez p1, :cond_2

    .line 323
    iget v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->w:I

    if-lez v0, :cond_1

    .line 325
    iget v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->w:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->w:I

    .line 326
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->r:Ljava/lang/Runnable;

    const-wide/16 v2, 0x64

    invoke-virtual {p0, v0, v2, v3}, Lcom/my/target/core/ui/views/StandardNative320x50View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 426
    :cond_0
    :goto_0
    return-void

    .line 329
    :cond_1
    const-string/jumbo v0, "failed to get banner width, unable to draw description and disclaimer properly"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    goto :goto_0

    .line 337
    :cond_2
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->v:Lcom/my/target/core/models/banners/j;

    if-nez v0, :cond_3

    .line 339
    const-string/jumbo v0, "unable to draw description and disclaimer: no current banner"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    goto :goto_0

    .line 343
    :cond_3
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->v:Lcom/my/target/core/models/banners/j;

    invoke-virtual {v0}, Lcom/my/target/core/models/banners/j;->c()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_9

    .line 345
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 346
    iget-object v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->l:Lcom/my/target/core/utils/l;

    const/16 v3, 0xf

    invoke-virtual {v1, v3}, Lcom/my/target/core/utils/l;->b(I)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 348
    iget-object v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->y:Lcom/my/target/core/models/j;

    if-eqz v1, :cond_7

    iget-object v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->y:Lcom/my/target/core/models/j;

    invoke-virtual {v1}, Lcom/my/target/core/models/j;->c()Z

    move-result v1

    if-eqz v1, :cond_7

    .line 349
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 352
    :goto_1
    iget-object v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->v:Lcom/my/target/core/models/banners/j;

    .line 353
    invoke-virtual {v1}, Lcom/my/target/core/models/banners/j;->c()Ljava/lang/String;

    move-result-object v1

    int-to-float v3, p1

    invoke-static {v1, v3, v0}, Lcom/my/target/core/ui/views/StandardNative320x50View;->a(Ljava/lang/String;FLandroid/graphics/Paint;)Ljava/util/List;

    move-result-object v0

    .line 357
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    move-object v1, v2

    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_a

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 359
    if-eqz v1, :cond_4

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v4

    if-le v4, v6, :cond_5

    .line 361
    :cond_4
    new-instance v4, Landroid/view/ViewGroup$LayoutParams;

    const/4 v1, -0x1

    iget v5, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->m:I

    invoke-direct {v4, v1, v5}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 363
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Lcom/my/target/core/ui/views/StandardNative320x50View;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v1, v5}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 364
    invoke-virtual {v1, v7}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 365
    invoke-virtual {v1, v6}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 366
    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 367
    iget-object v4, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->k:Landroid/widget/ViewFlipper;

    invoke-virtual {v4, v1}, Landroid/widget/ViewFlipper;->addView(Landroid/view/View;)V

    .line 370
    :cond_5
    new-instance v4, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/my/target/core/ui/views/StandardNative320x50View;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v4, v5}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 371
    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setGravity(I)V

    .line 372
    invoke-virtual {v4, v8, v9}, Landroid/widget/TextView;->setLineSpacing(FF)V

    .line 373
    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setLines(I)V

    .line 375
    iget-object v5, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->y:Lcom/my/target/core/models/j;

    if-eqz v5, :cond_6

    .line 376
    iget-object v5, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->y:Lcom/my/target/core/models/j;

    invoke-virtual {v5}, Lcom/my/target/core/models/j;->n()I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 377
    :cond_6
    iget-object v5, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->y:Lcom/my/target/core/models/j;

    if-eqz v5, :cond_8

    iget-object v5, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->y:Lcom/my/target/core/models/j;

    invoke-virtual {v5}, Lcom/my/target/core/models/j;->c()Z

    move-result v5

    if-eqz v5, :cond_8

    .line 378
    invoke-virtual {v4, v2, v6}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 380
    :goto_3
    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 381
    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    goto :goto_2

    .line 350
    :cond_7
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    goto :goto_1

    .line 379
    :cond_8
    const/4 v5, 0x0

    invoke-virtual {v4, v2, v5}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    goto :goto_3

    :cond_9
    move-object v1, v2

    .line 385
    :cond_a
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->v:Lcom/my/target/core/models/banners/j;

    invoke-virtual {v0}, Lcom/my/target/core/models/banners/j;->d()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 387
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 388
    iget-object v3, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->l:Lcom/my/target/core/utils/l;

    const/16 v4, 0xe

    invoke-virtual {v3, v4}, Lcom/my/target/core/utils/l;->b(I)I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 390
    iget-object v3, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->y:Lcom/my/target/core/models/j;

    if-eqz v3, :cond_e

    iget-object v3, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->y:Lcom/my/target/core/models/j;

    invoke-virtual {v3}, Lcom/my/target/core/models/j;->f()Z

    move-result v3

    if-eqz v3, :cond_e

    .line 391
    sget-object v3, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 394
    :goto_4
    iget-object v3, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->v:Lcom/my/target/core/models/banners/j;

    .line 395
    invoke-virtual {v3}, Lcom/my/target/core/models/banners/j;->d()Ljava/lang/String;

    move-result-object v3

    int-to-float v4, p1

    invoke-static {v3, v4, v0}, Lcom/my/target/core/ui/views/StandardNative320x50View;->a(Ljava/lang/String;FLandroid/graphics/Paint;)Ljava/util/List;

    move-result-object v0

    .line 399
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_5
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 401
    if-eqz v1, :cond_b

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v4

    if-le v4, v6, :cond_c

    .line 403
    :cond_b
    new-instance v4, Landroid/view/ViewGroup$LayoutParams;

    const/4 v1, -0x1

    iget v5, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->m:I

    invoke-direct {v4, v1, v5}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 405
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Lcom/my/target/core/ui/views/StandardNative320x50View;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v1, v5}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 406
    invoke-virtual {v1, v7}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 407
    invoke-virtual {v1, v6}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 408
    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 409
    iget-object v4, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->k:Landroid/widget/ViewFlipper;

    invoke-virtual {v4, v1}, Landroid/widget/ViewFlipper;->addView(Landroid/view/View;)V

    .line 412
    :cond_c
    new-instance v4, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/my/target/core/ui/views/StandardNative320x50View;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v4, v5}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 413
    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setGravity(I)V

    .line 414
    invoke-virtual {v4, v8, v9}, Landroid/widget/TextView;->setLineSpacing(FF)V

    .line 415
    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setLines(I)V

    .line 417
    iget-object v5, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->y:Lcom/my/target/core/models/j;

    if-eqz v5, :cond_d

    .line 418
    iget-object v5, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->y:Lcom/my/target/core/models/j;

    invoke-virtual {v5}, Lcom/my/target/core/models/j;->q()I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 419
    :cond_d
    iget-object v5, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->y:Lcom/my/target/core/models/j;

    if-eqz v5, :cond_f

    iget-object v5, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->y:Lcom/my/target/core/models/j;

    invoke-virtual {v5}, Lcom/my/target/core/models/j;->f()Z

    move-result v5

    if-eqz v5, :cond_f

    .line 420
    invoke-virtual {v4, v2, v6}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 422
    :goto_6
    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 423
    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    goto :goto_5

    .line 392
    :cond_e
    sget-object v3, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    goto :goto_4

    .line 421
    :cond_f
    const/4 v5, 0x0

    invoke-virtual {v4, v2, v5}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    goto :goto_6
.end method

.method static synthetic a(Lcom/my/target/core/ui/views/StandardNative320x50View;I)V
    .locals 0

    .prologue
    .line 38
    invoke-direct {p0, p1}, Lcom/my/target/core/ui/views/StandardNative320x50View;->a(I)V

    return-void
.end method

.method static synthetic b(Lcom/my/target/core/ui/views/StandardNative320x50View;)Lcom/my/target/core/ui/views/BorderedTextView;
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->a:Lcom/my/target/core/ui/views/BorderedTextView;

    return-object v0
.end method

.method private static b(Ljava/lang/String;FLandroid/graphics/Paint;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "F",
            "Landroid/graphics/Paint;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 580
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p2, p0}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v0

    cmpg-float v0, v0, p1

    if-gtz v0, :cond_1

    .line 582
    :cond_0
    invoke-static {p0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 604
    :goto_0
    return-object v0

    .line 585
    :cond_1
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 586
    const/4 v1, 0x0

    .line 587
    const/4 v0, 0x1

    :goto_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-gt v0, v3, :cond_4

    .line 589
    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 590
    invoke-virtual {p2, v3}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v3

    cmpl-float v3, v3, p1

    if-ltz v3, :cond_2

    .line 593
    add-int/lit8 v3, v0, -0x1

    invoke-virtual {p0, v1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 594
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 595
    add-int/lit8 v1, v0, -0x1

    .line 597
    :cond_2
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-ne v0, v3, :cond_3

    .line 599
    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 600
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 587
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_4
    move-object v0, v2

    .line 604
    goto :goto_0
.end method

.method private b()V
    .locals 4

    .prologue
    .line 631
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->p:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/my/target/core/ui/views/StandardNative320x50View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 632
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->p:Ljava/lang/Runnable;

    const-wide/16 v2, 0xfa0

    invoke-virtual {p0, v0, v2, v3}, Lcom/my/target/core/ui/views/StandardNative320x50View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 633
    return-void
.end method

.method static synthetic c(Lcom/my/target/core/ui/views/StandardNative320x50View;)Lcom/my/target/core/utils/l;
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->l:Lcom/my/target/core/utils/l;

    return-object v0
.end method

.method static synthetic d(Lcom/my/target/core/ui/views/StandardNative320x50View;)Landroid/widget/TextView;
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->b:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic e(Lcom/my/target/core/ui/views/StandardNative320x50View;)Lcom/my/target/core/ui/views/StandardNative320x50View$a;
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->s:Lcom/my/target/core/ui/views/StandardNative320x50View$a;

    return-object v0
.end method

.method static synthetic f(Lcom/my/target/core/ui/views/StandardNative320x50View;)Ljava/lang/Runnable;
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->p:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic g(Lcom/my/target/core/ui/views/StandardNative320x50View;)Lcom/my/target/core/engines/h;
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->t:Lcom/my/target/core/engines/h;

    return-object v0
.end method

.method static synthetic h(Lcom/my/target/core/ui/views/StandardNative320x50View;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->u:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public final a()V
    .locals 1

    .prologue
    .line 280
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->k:Landroid/widget/ViewFlipper;

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->stopFlipping()V

    .line 281
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->p:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/my/target/core/ui/views/StandardNative320x50View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 282
    return-void
.end method

.method public final a(Z)V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 286
    if-eqz p1, :cond_0

    .line 288
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->k:Landroid/widget/ViewFlipper;

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->getDisplayedChild()I

    move-result v0

    if-eqz v0, :cond_0

    .line 293
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->k:Landroid/widget/ViewFlipper;

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->getInAnimation()Landroid/view/animation/Animation;

    move-result-object v0

    .line 294
    iget-object v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->k:Landroid/widget/ViewFlipper;

    invoke-virtual {v1}, Landroid/widget/ViewFlipper;->getOutAnimation()Landroid/view/animation/Animation;

    move-result-object v1

    .line 296
    iget-object v2, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->k:Landroid/widget/ViewFlipper;

    invoke-virtual {v2, v3}, Landroid/widget/ViewFlipper;->setInAnimation(Landroid/view/animation/Animation;)V

    .line 297
    iget-object v2, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->k:Landroid/widget/ViewFlipper;

    invoke-virtual {v2, v3}, Landroid/widget/ViewFlipper;->setOutAnimation(Landroid/view/animation/Animation;)V

    .line 299
    iget-object v2, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->k:Landroid/widget/ViewFlipper;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/ViewFlipper;->setDisplayedChild(I)V

    .line 301
    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    .line 303
    iget-object v2, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->k:Landroid/widget/ViewFlipper;

    invoke-virtual {v2, v0}, Landroid/widget/ViewFlipper;->setInAnimation(Landroid/view/animation/Animation;)V

    .line 304
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->k:Landroid/widget/ViewFlipper;

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->setOutAnimation(Landroid/view/animation/Animation;)V

    .line 309
    :cond_0
    invoke-direct {p0}, Lcom/my/target/core/ui/views/StandardNative320x50View;->b()V

    .line 310
    return-void
.end method

.method protected onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 2

    .prologue
    .line 315
    invoke-super {p0, p1}, Landroid/widget/RelativeLayout;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 2637
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->o:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/my/target/core/ui/views/StandardNative320x50View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 2639
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->k:Landroid/widget/ViewFlipper;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->setDisplayedChild(I)V

    .line 2641
    :goto_0
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->k:Landroid/widget/ViewFlipper;

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->getChildCount()I

    move-result v0

    const/4 v1, 0x2

    if-le v0, v1, :cond_0

    .line 2643
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->k:Landroid/widget/ViewFlipper;

    iget-object v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->k:Landroid/widget/ViewFlipper;

    invoke-virtual {v1}, Landroid/widget/ViewFlipper;->getChildCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->removeViewAt(I)V

    goto :goto_0

    .line 2646
    :cond_0
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->v:Lcom/my/target/core/models/banners/j;

    iget v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->x:I

    invoke-virtual {p0, v0, v1}, Lcom/my/target/core/ui/views/StandardNative320x50View;->setBanner(Lcom/my/target/core/models/banners/j;I)V

    .line 2647
    invoke-direct {p0}, Lcom/my/target/core/ui/views/StandardNative320x50View;->b()V

    .line 317
    return-void
.end method

.method public setBanner(Lcom/my/target/core/models/banners/j;I)V
    .locals 9

    .prologue
    const/4 v8, -0x1

    const/4 v1, -0x2

    const/4 v7, 0x2

    const/16 v6, 0x8

    const/4 v5, 0x0

    .line 128
    iput p2, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->x:I

    .line 130
    invoke-virtual {p1}, Lcom/my/target/core/models/banners/j;->getId()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->u:Ljava/lang/String;

    .line 132
    iput-object p1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->v:Lcom/my/target/core/models/banners/j;

    .line 134
    invoke-virtual {p1}, Lcom/my/target/core/models/banners/j;->getNavigationType()Ljava/lang/String;

    move-result-object v0

    .line 1190
    const-string/jumbo v2, "store"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1192
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->d:Landroid/widget/TextView;

    invoke-virtual {v0, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1193
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->g:Lcom/my/target/nativeads/views/StarsRatingView;

    invoke-virtual {v0, v5}, Lcom/my/target/nativeads/views/StarsRatingView;->setVisibility(I)V

    .line 1194
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->c:Landroid/widget/TextView;

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 136
    :goto_0
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->p:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/my/target/core/ui/views/StandardNative320x50View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 137
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->o:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/my/target/core/ui/views/StandardNative320x50View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 139
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->b:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/my/target/core/models/banners/j;->b()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 141
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->d:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/my/target/core/models/banners/j;->e()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 142
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->g:Lcom/my/target/nativeads/views/StarsRatingView;

    invoke-virtual {p1}, Lcom/my/target/core/models/banners/j;->g()F

    move-result v2

    invoke-virtual {v0, v2}, Lcom/my/target/nativeads/views/StarsRatingView;->setRating(F)V

    .line 143
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->c:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/my/target/core/models/banners/j;->h()I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 144
    iget-object v2, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->f:Landroid/widget/Button;

    .line 145
    invoke-virtual {p1}, Lcom/my/target/core/models/banners/j;->getCtaText()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string/jumbo v0, "\u279c"

    .line 144
    :goto_1
    invoke-virtual {v2, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 148
    invoke-virtual {p1}, Lcom/my/target/core/models/banners/j;->getAgeRestrictions()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 150
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->a:Lcom/my/target/core/ui/views/BorderedTextView;

    invoke-virtual {v0, v5}, Lcom/my/target/core/ui/views/BorderedTextView;->setVisibility(I)V

    .line 151
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->a:Lcom/my/target/core/ui/views/BorderedTextView;

    invoke-virtual {p1}, Lcom/my/target/core/models/banners/j;->getAgeRestrictions()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/my/target/core/ui/views/BorderedTextView;->setText(Ljava/lang/CharSequence;)V

    .line 157
    :goto_2
    invoke-virtual {p1}, Lcom/my/target/core/models/banners/j;->f()Lcom/my/target/nativeads/models/ImageData;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/my/target/core/models/banners/j;->f()Lcom/my/target/nativeads/models/ImageData;

    move-result-object v0

    invoke-virtual {v0}, Lcom/my/target/nativeads/models/ImageData;->getData()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 159
    invoke-virtual {p1}, Lcom/my/target/core/models/banners/j;->f()Lcom/my/target/nativeads/models/ImageData;

    move-result-object v0

    invoke-virtual {v0}, Lcom/my/target/nativeads/models/ImageData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    .line 160
    iget-object v2, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->h:Lcom/my/target/core/ui/views/CacheImageView;

    invoke-virtual {v2, v0}, Lcom/my/target/core/ui/views/CacheImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 162
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    .line 163
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    .line 164
    invoke-virtual {p1}, Lcom/my/target/core/models/banners/j;->getType()Ljava/lang/String;

    move-result-object v3

    .line 1653
    const-string/jumbo v4, "teaser"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 1655
    iget-object v3, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->f:Landroid/widget/Button;

    invoke-virtual {v3, v5}, Landroid/widget/Button;->setVisibility(I)V

    .line 1656
    iget-object v3, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->k:Landroid/widget/ViewFlipper;

    invoke-virtual {v3, v5}, Landroid/widget/ViewFlipper;->setVisibility(I)V

    .line 1658
    if-eqz v2, :cond_5

    if-eqz v0, :cond_5

    .line 1660
    int-to-float v0, v0

    int-to-float v1, v2

    div-float v1, v0, v1

    .line 1661
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    iget v2, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->m:I

    int-to-float v2, v2

    div-float v1, v2, v1

    float-to-int v1, v1

    iget v2, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->m:I

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 1666
    :goto_3
    iget-object v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->h:Lcom/my/target/core/ui/views/CacheImageView;

    iget-object v2, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->l:Lcom/my/target/core/utils/l;

    invoke-virtual {v2, v7}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v2

    iget-object v3, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->l:Lcom/my/target/core/utils/l;

    invoke-virtual {v3, v7}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v3

    iget-object v4, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->l:Lcom/my/target/core/utils/l;

    invoke-virtual {v4, v7}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v4

    iget-object v5, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->l:Lcom/my/target/core/utils/l;

    invoke-virtual {v5, v7}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v5

    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/my/target/core/ui/views/CacheImageView;->setPadding(IIII)V

    .line 1667
    iget-object v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->h:Lcom/my/target/core/ui/views/CacheImageView;

    invoke-virtual {v1, v0}, Lcom/my/target/core/ui/views/CacheImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1669
    iget-object v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->n:Landroid/widget/FrameLayout;

    invoke-virtual {v1, v0}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1671
    const/16 v1, 0x9

    invoke-virtual {v0, v1, v8}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 1672
    const/16 v1, 0xf

    invoke-virtual {v0, v1, v8}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 1673
    iget-object v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->h:Lcom/my/target/core/ui/views/CacheImageView;

    invoke-virtual {v1, v0}, Lcom/my/target/core/ui/views/CacheImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 169
    :cond_0
    :goto_4
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->a:Lcom/my/target/core/ui/views/BorderedTextView;

    invoke-virtual {v0}, Lcom/my/target/core/ui/views/BorderedTextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 171
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->o:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/my/target/core/ui/views/StandardNative320x50View;->post(Ljava/lang/Runnable;)Z

    .line 174
    :cond_1
    if-nez p2, :cond_7

    .line 176
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->r:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/my/target/core/ui/views/StandardNative320x50View;->post(Ljava/lang/Runnable;)Z

    .line 181
    :goto_5
    return-void

    .line 1197
    :cond_2
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->d:Landroid/widget/TextView;

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1198
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->g:Lcom/my/target/nativeads/views/StarsRatingView;

    invoke-virtual {v0, v6}, Lcom/my/target/nativeads/views/StarsRatingView;->setVisibility(I)V

    .line 1199
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->c:Landroid/widget/TextView;

    invoke-virtual {v0, v6}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_0

    .line 146
    :cond_3
    invoke-virtual {p1}, Lcom/my/target/core/models/banners/j;->getCtaText()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_1

    .line 154
    :cond_4
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->a:Lcom/my/target/core/ui/views/BorderedTextView;

    invoke-virtual {v0, v6}, Lcom/my/target/core/ui/views/BorderedTextView;->setVisibility(I)V

    goto/16 :goto_2

    .line 1664
    :cond_5
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    iget v2, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->m:I

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    goto :goto_3

    .line 1674
    :cond_6
    const-string/jumbo v4, "banner"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1677
    if-eqz v0, :cond_8

    .line 1678
    iget v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->m:I

    mul-int/2addr v1, v2

    div-int v0, v1, v0

    .line 1680
    :goto_6
    iget-object v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->f:Landroid/widget/Button;

    invoke-virtual {v1, v6}, Landroid/widget/Button;->setVisibility(I)V

    .line 1681
    iget-object v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->k:Landroid/widget/ViewFlipper;

    invoke-virtual {v1, v6}, Landroid/widget/ViewFlipper;->setVisibility(I)V

    .line 1683
    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    iget v2, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->m:I

    invoke-direct {v1, v0, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 1685
    const/16 v0, 0xe

    invoke-virtual {v1, v0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 1686
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->h:Lcom/my/target/core/ui/views/CacheImageView;

    invoke-virtual {v0, v1}, Lcom/my/target/core/ui/views/CacheImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1687
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->n:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_4

    .line 179
    :cond_7
    invoke-direct {p0, p2}, Lcom/my/target/core/ui/views/StandardNative320x50View;->a(I)V

    goto :goto_5

    :cond_8
    move v0, v1

    goto :goto_6
.end method

.method public setEngineListener(Lcom/my/target/core/ui/views/StandardNative320x50View$a;)V
    .locals 0

    .prologue
    .line 185
    iput-object p1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->s:Lcom/my/target/core/ui/views/StandardNative320x50View$a;

    .line 186
    return-void
.end method

.method public setMyTargetClickListener(Lcom/my/target/core/engines/h;)V
    .locals 0

    .prologue
    .line 205
    iput-object p1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->t:Lcom/my/target/core/engines/h;

    .line 206
    return-void
.end method

.method public setViewSettings(Lcom/my/target/core/models/j;Z)V
    .locals 6

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 210
    iput-object p1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->y:Lcom/my/target/core/models/j;

    .line 212
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->b:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/my/target/core/models/j;->j()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 213
    invoke-virtual {p1}, Lcom/my/target/core/models/j;->b()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->b:Landroid/widget/TextView;

    invoke-virtual {v0, v3, v5}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 216
    :goto_0
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->a:Lcom/my/target/core/ui/views/BorderedTextView;

    invoke-virtual {p1}, Lcom/my/target/core/models/j;->l()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/my/target/core/ui/views/BorderedTextView;->setTextColor(I)V

    .line 217
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->a:Lcom/my/target/core/ui/views/BorderedTextView;

    const/4 v1, 0x2

    invoke-virtual {p1}, Lcom/my/target/core/models/j;->m()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/my/target/core/ui/views/BorderedTextView;->setBorder(II)V

    .line 218
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->a:Lcom/my/target/core/ui/views/BorderedTextView;

    invoke-virtual {p1}, Lcom/my/target/core/models/j;->k()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/my/target/core/ui/views/BorderedTextView;->setBackgroundColor(I)V

    .line 220
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->d:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/my/target/core/models/j;->o()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 221
    invoke-virtual {p1}, Lcom/my/target/core/models/j;->d()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->d:Landroid/widget/TextView;

    invoke-virtual {v0, v3, v5}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 224
    :goto_1
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->c:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/my/target/core/models/j;->p()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 225
    invoke-virtual {p1}, Lcom/my/target/core/models/j;->e()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->c:Landroid/widget/TextView;

    invoke-virtual {v0, v3, v5}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 228
    :goto_2
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->h:Lcom/my/target/core/ui/views/CacheImageView;

    invoke-virtual {p1}, Lcom/my/target/core/models/j;->h()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/my/target/core/ui/views/CacheImageView;->setBackgroundColor(I)V

    .line 229
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->n:Landroid/widget/FrameLayout;

    .line 230
    invoke-virtual {p1}, Lcom/my/target/core/models/j;->i()I

    move-result v1

    invoke-static {v1}, Lcom/my/target/core/utils/l;->d(I)I

    move-result v1

    .line 229
    invoke-static {v0, v4, v1}, Lcom/my/target/core/utils/l;->a(Landroid/view/View;II)V

    .line 232
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->k:Landroid/widget/ViewFlipper;

    .line 233
    invoke-virtual {p1}, Lcom/my/target/core/models/j;->h()I

    move-result v1

    .line 234
    invoke-virtual {p1}, Lcom/my/target/core/models/j;->i()I

    move-result v2

    .line 232
    invoke-static {v0, v1, v2}, Lcom/my/target/core/utils/l;->a(Landroid/view/View;II)V

    .line 236
    if-eqz p2, :cond_3

    .line 237
    invoke-virtual {p0, v4}, Lcom/my/target/core/ui/views/StandardNative320x50View;->setBackgroundColor(I)V

    .line 243
    :goto_3
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->f:Landroid/widget/Button;

    .line 244
    invoke-virtual {p1}, Lcom/my/target/core/models/j;->r()I

    move-result v1

    .line 245
    invoke-virtual {p1}, Lcom/my/target/core/models/j;->s()I

    move-result v2

    .line 243
    invoke-static {v0, v1, v2}, Lcom/my/target/core/utils/l;->a(Landroid/view/View;II)V

    .line 246
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->f:Landroid/widget/Button;

    invoke-virtual {p1}, Lcom/my/target/core/models/j;->t()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextColor(I)V

    .line 247
    invoke-virtual {p1}, Lcom/my/target/core/models/j;->g()Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->f:Landroid/widget/Button;

    invoke-virtual {v0, v3, v5}, Landroid/widget/Button;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 249
    :goto_4
    return-void

    .line 214
    :cond_0
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->b:Landroid/widget/TextView;

    invoke-virtual {v0, v3, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    goto/16 :goto_0

    .line 222
    :cond_1
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->d:Landroid/widget/TextView;

    invoke-virtual {v0, v3, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    goto :goto_1

    .line 226
    :cond_2
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->c:Landroid/widget/TextView;

    invoke-virtual {v0, v3, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    goto :goto_2

    .line 240
    :cond_3
    invoke-virtual {p1}, Lcom/my/target/core/models/j;->h()I

    move-result v0

    .line 241
    invoke-virtual {p1}, Lcom/my/target/core/models/j;->i()I

    move-result v1

    .line 239
    invoke-static {p0, v0, v1}, Lcom/my/target/core/utils/l;->a(Landroid/view/View;II)V

    goto :goto_3

    .line 248
    :cond_4
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View;->f:Landroid/widget/Button;

    invoke-virtual {v0, v3, v4}, Landroid/widget/Button;->setTypeface(Landroid/graphics/Typeface;I)V

    goto :goto_4
.end method
