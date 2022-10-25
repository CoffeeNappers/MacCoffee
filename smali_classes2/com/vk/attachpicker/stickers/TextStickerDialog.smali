.class public Lcom/vk/attachpicker/stickers/TextStickerDialog;
.super Landroid/app/Dialog;
.source "TextStickerDialog.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/attachpicker/stickers/TextStickerDialog$TextStickerDialogCallback;
    }
.end annotation


# instance fields
.field private androidBug5497Workaround:Lcom/vk/core/util/AndroidBug5497Workaround2;

.field private final callback:Lcom/vk/attachpicker/stickers/TextStickerDialog$TextStickerDialogCallback;

.field private clickHandler:Landroid/view/View;

.field private colorSelectorView:Lcom/vk/attachpicker/widget/ColorSelectorView;

.field private customDissmissListener:Landroid/content/DialogInterface$OnDismissListener;

.field private doneButton:Landroid/widget/ImageView;

.field private editText:Lcom/vk/attachpicker/widget/BackPressEditText;

.field private fontChange:Landroid/widget/ImageView;

.field private stickerStyle:Lcom/vk/attachpicker/stickers/StickerStyle;


# direct methods
.method public constructor <init>(ZZLandroid/content/Context;Lcom/vk/attachpicker/stickers/TextStickerDialog$TextStickerDialogCallback;)V
    .locals 8
    .param p1, "noStatusBar"    # Z
    .param p2, "enabledFixedTextStyle"    # Z
    .param p3, "context"    # Landroid/content/Context;
    .param p4, "callback"    # Lcom/vk/attachpicker/stickers/TextStickerDialog$TextStickerDialogCallback;

    .prologue
    .line 36
    const-string/jumbo v4, ""

    sget-object v0, Lcom/vk/attachpicker/drawing/DrawingColors;->COLORS:[I

    const/4 v1, 0x7

    aget v5, v0, v1

    sget-object v6, Lcom/vk/attachpicker/stickers/StickerStyle;->ROBOTO_BOLD:Lcom/vk/attachpicker/stickers/StickerStyle;

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v3, p3

    move-object v7, p4

    invoke-direct/range {v0 .. v7}, Lcom/vk/attachpicker/stickers/TextStickerDialog;-><init>(ZZLandroid/content/Context;Ljava/lang/String;ILcom/vk/attachpicker/stickers/StickerStyle;Lcom/vk/attachpicker/stickers/TextStickerDialog$TextStickerDialogCallback;)V

    .line 37
    return-void
.end method

.method public constructor <init>(ZZLandroid/content/Context;Ljava/lang/String;ILcom/vk/attachpicker/stickers/StickerStyle;Lcom/vk/attachpicker/stickers/TextStickerDialog$TextStickerDialogCallback;)V
    .locals 5
    .param p1, "noStatusBar"    # Z
    .param p2, "enabledFixedTextStyle"    # Z
    .param p3, "context"    # Landroid/content/Context;
    .param p4, "text"    # Ljava/lang/String;
    .param p5, "initialColor"    # I
    .param p6, "initialStickerStyle"    # Lcom/vk/attachpicker/stickers/StickerStyle;
    .param p7, "callback"    # Lcom/vk/attachpicker/stickers/TextStickerDialog$TextStickerDialogCallback;

    .prologue
    const/4 v4, 0x0

    .line 40
    if-eqz p1, :cond_1

    const v1, 0x7f0b00a7

    :goto_0
    invoke-direct {p0, p3, v1}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 24
    sget-object v1, Lcom/vk/attachpicker/stickers/StickerStyle;->ROBOTO_BOLD:Lcom/vk/attachpicker/stickers/StickerStyle;

    iput-object v1, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog;->stickerStyle:Lcom/vk/attachpicker/stickers/StickerStyle;

    .line 41
    iput-object p7, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog;->callback:Lcom/vk/attachpicker/stickers/TextStickerDialog$TextStickerDialogCallback;

    .line 42
    iput-object p6, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog;->stickerStyle:Lcom/vk/attachpicker/stickers/StickerStyle;

    .line 45
    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/TextStickerDialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-static {v1}, Lcom/vk/core/util/KeyboardUtils;->setSoftInputModeAdjustResize(Landroid/view/Window;)V

    .line 46
    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/TextStickerDialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    const v2, 0x7f0b0166

    invoke-virtual {v1, v2}, Landroid/view/Window;->setWindowAnimations(I)V

    .line 49
    invoke-static {p3}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f0301a3

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 50
    .local v0, "view":Landroid/view/View;
    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/stickers/TextStickerDialog;->setContentView(Landroid/view/View;)V

    .line 53
    if-eqz p1, :cond_0

    .line 54
    new-instance v1, Lcom/vk/core/util/AndroidBug5497Workaround2;

    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/TextStickerDialog;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lcom/vk/core/util/AndroidBug5497Workaround2;-><init>(Landroid/view/Window;Landroid/view/View;)V

    iput-object v1, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog;->androidBug5497Workaround:Lcom/vk/core/util/AndroidBug5497Workaround2;

    .line 58
    :cond_0
    const v1, 0x7f10047d

    invoke-virtual {p0, v1}, Lcom/vk/attachpicker/stickers/TextStickerDialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vk/attachpicker/widget/BackPressEditText;

    iput-object v1, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog;->editText:Lcom/vk/attachpicker/widget/BackPressEditText;

    .line 59
    const v1, 0x7f100480

    invoke-virtual {p0, v1}, Lcom/vk/attachpicker/stickers/TextStickerDialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vk/attachpicker/widget/ColorSelectorView;

    iput-object v1, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog;->colorSelectorView:Lcom/vk/attachpicker/widget/ColorSelectorView;

    .line 60
    const v1, 0x7f10047e

    invoke-virtual {p0, v1}, Lcom/vk/attachpicker/stickers/TextStickerDialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog;->fontChange:Landroid/widget/ImageView;

    .line 61
    const v1, 0x7f10047f

    invoke-virtual {p0, v1}, Lcom/vk/attachpicker/stickers/TextStickerDialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog;->doneButton:Landroid/widget/ImageView;

    .line 62
    const v1, 0x7f100335

    invoke-virtual {p0, v1}, Lcom/vk/attachpicker/stickers/TextStickerDialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog;->clickHandler:Landroid/view/View;

    .line 65
    iget-object v1, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog;->doneButton:Landroid/widget/ImageView;

    invoke-static {p0}, Lcom/vk/attachpicker/stickers/TextStickerDialog$$Lambda$1;->lambdaFactory$(Lcom/vk/attachpicker/stickers/TextStickerDialog;)Landroid/view/View$OnClickListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 70
    iget-object v1, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog;->editText:Lcom/vk/attachpicker/widget/BackPressEditText;

    invoke-virtual {v1, v4}, Lcom/vk/attachpicker/widget/BackPressEditText;->setAlpha(F)V

    .line 71
    iget-object v1, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog;->editText:Lcom/vk/attachpicker/widget/BackPressEditText;

    sget-object v2, Lcom/vk/attachpicker/widget/EmptyLineTextWatcher;->INSTANCE:Lcom/vk/attachpicker/widget/EmptyLineTextWatcher;

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/widget/BackPressEditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 72
    iget-object v1, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog;->editText:Lcom/vk/attachpicker/widget/BackPressEditText;

    const v2, 0xa4001

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/widget/BackPressEditText;->setInputType(I)V

    .line 73
    iget-object v1, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog;->editText:Lcom/vk/attachpicker/widget/BackPressEditText;

    invoke-virtual {v1, p4}, Lcom/vk/attachpicker/widget/BackPressEditText;->setText(Ljava/lang/CharSequence;)V

    .line 74
    iget-object v1, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog;->editText:Lcom/vk/attachpicker/widget/BackPressEditText;

    invoke-virtual {v1, p5}, Lcom/vk/attachpicker/widget/BackPressEditText;->setTextColor(I)V

    .line 75
    iget-object v1, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog;->editText:Lcom/vk/attachpicker/widget/BackPressEditText;

    invoke-virtual {v1}, Lcom/vk/attachpicker/widget/BackPressEditText;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v1

    new-instance v2, Lcom/vk/attachpicker/stickers/TextStickerDialog$1;

    invoke-direct {v2, p0}, Lcom/vk/attachpicker/stickers/TextStickerDialog$1;-><init>(Lcom/vk/attachpicker/stickers/TextStickerDialog;)V

    invoke-virtual {v1, v2}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 90
    iget-object v1, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog;->editText:Lcom/vk/attachpicker/widget/BackPressEditText;

    invoke-static {p0}, Lcom/vk/attachpicker/stickers/TextStickerDialog$$Lambda$2;->lambdaFactory$(Lcom/vk/attachpicker/stickers/TextStickerDialog;)Lcom/vk/attachpicker/widget/BackPressEditText$OnBackPressedCallback;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/widget/BackPressEditText;->setCallback(Lcom/vk/attachpicker/widget/BackPressEditText$OnBackPressedCallback;)V

    .line 95
    iget-object v1, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog;->colorSelectorView:Lcom/vk/attachpicker/widget/ColorSelectorView;

    invoke-virtual {v1, v4}, Lcom/vk/attachpicker/widget/ColorSelectorView;->setAlpha(F)V

    .line 96
    iget-object v1, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog;->colorSelectorView:Lcom/vk/attachpicker/widget/ColorSelectorView;

    invoke-virtual {v1, p5}, Lcom/vk/attachpicker/widget/ColorSelectorView;->setSelectedColor(I)V

    .line 97
    iget-object v1, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog;->colorSelectorView:Lcom/vk/attachpicker/widget/ColorSelectorView;

    new-instance v2, Lcom/vk/attachpicker/stickers/TextStickerDialog$2;

    invoke-direct {v2, p0}, Lcom/vk/attachpicker/stickers/TextStickerDialog$2;-><init>(Lcom/vk/attachpicker/stickers/TextStickerDialog;)V

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/widget/ColorSelectorView;->setOnColorSelectedListener(Lcom/vk/attachpicker/widget/ColorSelectorView$OnColorSelectedListener;)V

    .line 110
    iget-object v1, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog;->fontChange:Landroid/widget/ImageView;

    invoke-static {p0, p2}, Lcom/vk/attachpicker/stickers/TextStickerDialog$$Lambda$3;->lambdaFactory$(Lcom/vk/attachpicker/stickers/TextStickerDialog;Z)Landroid/view/View$OnClickListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 131
    iget-object v1, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog;->clickHandler:Landroid/view/View;

    invoke-static {p0}, Lcom/vk/attachpicker/stickers/TextStickerDialog$$Lambda$4;->lambdaFactory$(Lcom/vk/attachpicker/stickers/TextStickerDialog;)Landroid/view/View$OnClickListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 136
    invoke-direct {p0}, Lcom/vk/attachpicker/stickers/TextStickerDialog;->setStickerFont()V

    .line 139
    invoke-super {p0, p0}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 140
    return-void

    .line 40
    .end local v0    # "view":Landroid/view/View;
    :cond_1
    const v1, 0x7f0b00a6

    goto/16 :goto_0
.end method

.method static synthetic access$000(Lcom/vk/attachpicker/stickers/TextStickerDialog;)Lcom/vk/attachpicker/widget/BackPressEditText;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/stickers/TextStickerDialog;

    .prologue
    .line 21
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog;->editText:Lcom/vk/attachpicker/widget/BackPressEditText;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vk/attachpicker/stickers/TextStickerDialog;)Lcom/vk/attachpicker/widget/ColorSelectorView;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/stickers/TextStickerDialog;

    .prologue
    .line 21
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog;->colorSelectorView:Lcom/vk/attachpicker/widget/ColorSelectorView;

    return-object v0
.end method

.method private saveText()V
    .locals 4

    .prologue
    .line 166
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog;->callback:Lcom/vk/attachpicker/stickers/TextStickerDialog$TextStickerDialogCallback;

    iget-object v1, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog;->editText:Lcom/vk/attachpicker/widget/BackPressEditText;

    invoke-virtual {v1}, Lcom/vk/attachpicker/widget/BackPressEditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog;->colorSelectorView:Lcom/vk/attachpicker/widget/ColorSelectorView;

    .line 167
    invoke-virtual {v2}, Lcom/vk/attachpicker/widget/ColorSelectorView;->getSelectedColor()I

    move-result v2

    iget-object v3, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog;->stickerStyle:Lcom/vk/attachpicker/stickers/StickerStyle;

    .line 166
    invoke-interface {v0, v1, v2, v3}, Lcom/vk/attachpicker/stickers/TextStickerDialog$TextStickerDialogCallback;->onApply(Ljava/lang/String;ILcom/vk/attachpicker/stickers/StickerStyle;)V

    .line 169
    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/TextStickerDialog;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/core/util/KeyboardUtils;->hideKeyboard(Landroid/content/Context;)V

    .line 170
    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/TextStickerDialog;->dismiss()V

    .line 171
    return-void
.end method

.method private setStickerFont()V
    .locals 3

    .prologue
    .line 174
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog;->stickerStyle:Lcom/vk/attachpicker/stickers/StickerStyle;

    if-eqz v0, :cond_0

    .line 175
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog;->editText:Lcom/vk/attachpicker/widget/BackPressEditText;

    iget-object v1, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog;->stickerStyle:Lcom/vk/attachpicker/stickers/StickerStyle;

    iget-object v1, v1, Lcom/vk/attachpicker/stickers/StickerStyle;->typeface:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/BackPressEditText;->setTypeface(Landroid/graphics/Typeface;)V

    .line 176
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog;->fontChange:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog;->stickerStyle:Lcom/vk/attachpicker/stickers/StickerStyle;

    iget v1, v1, Lcom/vk/attachpicker/stickers/StickerStyle;->iconResId:I

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 178
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog;->stickerStyle:Lcom/vk/attachpicker/stickers/StickerStyle;

    iget-boolean v0, v0, Lcom/vk/attachpicker/stickers/StickerStyle;->fullWidth:Z

    if-eqz v0, :cond_1

    .line 179
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog;->editText:Lcom/vk/attachpicker/widget/BackPressEditText;

    invoke-virtual {v0}, Lcom/vk/attachpicker/widget/BackPressEditText;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    const/4 v1, -0x1

    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 183
    :goto_0
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog;->editText:Lcom/vk/attachpicker/widget/BackPressEditText;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog;->stickerStyle:Lcom/vk/attachpicker/stickers/StickerStyle;

    iget v2, v2, Lcom/vk/attachpicker/stickers/StickerStyle;->fontSize:I

    int-to-float v2, v2

    invoke-virtual {v0, v1, v2}, Lcom/vk/attachpicker/widget/BackPressEditText;->setTextSize(IF)V

    .line 184
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog;->editText:Lcom/vk/attachpicker/widget/BackPressEditText;

    iget-object v1, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog;->stickerStyle:Lcom/vk/attachpicker/stickers/StickerStyle;

    iget v1, v1, Lcom/vk/attachpicker/stickers/StickerStyle;->background:I

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/BackPressEditText;->setBackgroundColor(I)V

    .line 185
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog;->editText:Lcom/vk/attachpicker/widget/BackPressEditText;

    invoke-virtual {v0}, Lcom/vk/attachpicker/widget/BackPressEditText;->requestLayout()V

    .line 187
    :cond_0
    return-void

    .line 181
    :cond_1
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog;->editText:Lcom/vk/attachpicker/widget/BackPressEditText;

    invoke-virtual {v0}, Lcom/vk/attachpicker/widget/BackPressEditText;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    const/4 v1, -0x2

    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    goto :goto_0
.end method


# virtual methods
.method synthetic lambda$new$0(Landroid/view/View;)V
    .locals 0
    .param p1, "view1"    # Landroid/view/View;

    .prologue
    .line 66
    invoke-direct {p0}, Lcom/vk/attachpicker/stickers/TextStickerDialog;->saveText()V

    .line 67
    return-void
.end method

.method synthetic lambda$new$1()V
    .locals 0

    .prologue
    .line 91
    invoke-direct {p0}, Lcom/vk/attachpicker/stickers/TextStickerDialog;->saveText()V

    .line 92
    return-void
.end method

.method synthetic lambda$new$2(ZLandroid/view/View;)V
    .locals 2
    .param p1, "enabledFixedTextStyle"    # Z
    .param p2, "v"    # Landroid/view/View;

    .prologue
    .line 111
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog;->stickerStyle:Lcom/vk/attachpicker/stickers/StickerStyle;

    if-nez v0, :cond_0

    .line 112
    sget-object v0, Lcom/vk/attachpicker/stickers/StickerStyle;->ROBOTO_BOLD:Lcom/vk/attachpicker/stickers/StickerStyle;

    iput-object v0, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog;->stickerStyle:Lcom/vk/attachpicker/stickers/StickerStyle;

    .line 127
    :goto_0
    invoke-direct {p0}, Lcom/vk/attachpicker/stickers/TextStickerDialog;->setStickerFont()V

    .line 128
    return-void

    .line 114
    :cond_0
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog;->stickerStyle:Lcom/vk/attachpicker/stickers/StickerStyle;

    sget-object v1, Lcom/vk/attachpicker/stickers/StickerStyle;->ROBOTO_BOLD:Lcom/vk/attachpicker/stickers/StickerStyle;

    if-ne v0, v1, :cond_1

    .line 115
    sget-object v0, Lcom/vk/attachpicker/stickers/StickerStyle;->LOBSTER_REGULAR:Lcom/vk/attachpicker/stickers/StickerStyle;

    iput-object v0, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog;->stickerStyle:Lcom/vk/attachpicker/stickers/StickerStyle;

    goto :goto_0

    .line 117
    :cond_1
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog;->stickerStyle:Lcom/vk/attachpicker/stickers/StickerStyle;

    sget-object v1, Lcom/vk/attachpicker/stickers/StickerStyle;->LOBSTER_REGULAR:Lcom/vk/attachpicker/stickers/StickerStyle;

    if-ne v0, v1, :cond_2

    .line 118
    sget-object v0, Lcom/vk/attachpicker/stickers/StickerStyle;->IMPACT:Lcom/vk/attachpicker/stickers/StickerStyle;

    iput-object v0, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog;->stickerStyle:Lcom/vk/attachpicker/stickers/StickerStyle;

    goto :goto_0

    .line 120
    :cond_2
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog;->stickerStyle:Lcom/vk/attachpicker/stickers/StickerStyle;

    sget-object v1, Lcom/vk/attachpicker/stickers/StickerStyle;->IMPACT:Lcom/vk/attachpicker/stickers/StickerStyle;

    if-ne v0, v1, :cond_3

    if-eqz p1, :cond_3

    .line 121
    sget-object v0, Lcom/vk/attachpicker/stickers/StickerStyle;->ROBOTO_FIXED:Lcom/vk/attachpicker/stickers/StickerStyle;

    iput-object v0, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog;->stickerStyle:Lcom/vk/attachpicker/stickers/StickerStyle;

    goto :goto_0

    .line 124
    :cond_3
    sget-object v0, Lcom/vk/attachpicker/stickers/StickerStyle;->ROBOTO_BOLD:Lcom/vk/attachpicker/stickers/StickerStyle;

    iput-object v0, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog;->stickerStyle:Lcom/vk/attachpicker/stickers/StickerStyle;

    goto :goto_0
.end method

.method synthetic lambda$new$3(Landroid/view/View;)V
    .locals 0
    .param p1, "view1"    # Landroid/view/View;

    .prologue
    .line 132
    invoke-direct {p0}, Lcom/vk/attachpicker/stickers/TextStickerDialog;->saveText()V

    .line 133
    return-void
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 1
    .param p1, "dialogInterface"    # Landroid/content/DialogInterface;

    .prologue
    .line 157
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog;->androidBug5497Workaround:Lcom/vk/core/util/AndroidBug5497Workaround2;

    if-eqz v0, :cond_0

    .line 158
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog;->androidBug5497Workaround:Lcom/vk/core/util/AndroidBug5497Workaround2;

    invoke-virtual {v0}, Lcom/vk/core/util/AndroidBug5497Workaround2;->disable()V

    .line 160
    :cond_0
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog;->customDissmissListener:Landroid/content/DialogInterface$OnDismissListener;

    if-eqz v0, :cond_1

    .line 161
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog;->customDissmissListener:Landroid/content/DialogInterface$OnDismissListener;

    invoke-interface {v0, p1}, Landroid/content/DialogInterface$OnDismissListener;->onDismiss(Landroid/content/DialogInterface;)V

    .line 163
    :cond_1
    return-void
.end method

.method public setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V
    .locals 0
    .param p1, "listener"    # Landroid/content/DialogInterface$OnDismissListener;

    .prologue
    .line 144
    iput-object p1, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog;->customDissmissListener:Landroid/content/DialogInterface$OnDismissListener;

    .line 145
    return-void
.end method

.method public show()V
    .locals 1

    .prologue
    .line 149
    invoke-super {p0}, Landroid/app/Dialog;->show()V

    .line 150
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog;->androidBug5497Workaround:Lcom/vk/core/util/AndroidBug5497Workaround2;

    if-eqz v0, :cond_0

    .line 151
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog;->androidBug5497Workaround:Lcom/vk/core/util/AndroidBug5497Workaround2;

    invoke-virtual {v0}, Lcom/vk/core/util/AndroidBug5497Workaround2;->enable()V

    .line 153
    :cond_0
    return-void
.end method
