.class public Lcom/vk/attachpicker/GraffitiConfirmDialog;
.super Landroid/app/Dialog;
.source "GraffitiConfirmDialog.java"


# instance fields
.field private graffitiContainer:Landroid/view/View;

.field private imagePreview:Lcom/vk/imageloader/view/VKImageView;

.field private preview:Landroid/view/View;

.field private resultContainer:Lcom/vk/attachpicker/widget/RotateLayout;

.field private sendButton:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Lcom/vkontakte/android/api/Document;)V
    .locals 6
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "document"    # Lcom/vkontakte/android/api/Document;

    .prologue
    const/4 v4, -0x1

    .line 26
    const v3, 0x7f0b0131

    invoke-direct {p0, p1, v3}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 28
    const/4 v3, 0x1

    invoke-virtual {p0, v3}, Lcom/vk/attachpicker/GraffitiConfirmDialog;->setCancelable(Z)V

    .line 29
    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Lcom/vk/attachpicker/GraffitiConfirmDialog;->setCanceledOnTouchOutside(Z)V

    .line 31
    new-instance v2, Landroid/view/WindowManager$LayoutParams;

    invoke-direct {v2}, Landroid/view/WindowManager$LayoutParams;-><init>()V

    .line 32
    .local v2, "lp":Landroid/view/WindowManager$LayoutParams;
    invoke-virtual {p0}, Lcom/vk/attachpicker/GraffitiConfirmDialog;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/view/WindowManager$LayoutParams;->copyFrom(Landroid/view/WindowManager$LayoutParams;)I

    .line 33
    iput v4, v2, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 34
    iput v4, v2, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 35
    const/16 v3, 0x30

    iput v3, v2, Landroid/view/WindowManager$LayoutParams;->softInputMode:I

    .line 36
    invoke-virtual {p0}, Lcom/vk/attachpicker/GraffitiConfirmDialog;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 37
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0e0004

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 38
    invoke-virtual {p0}, Lcom/vk/attachpicker/GraffitiConfirmDialog;->getWindow()Landroid/view/Window;

    move-result-object v3

    const/high16 v4, 0x4000000

    invoke-virtual {v3, v4}, Landroid/view/Window;->addFlags(I)V

    .line 41
    :cond_0
    invoke-virtual {p1}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v3

    const v4, 0x7f0301a0

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 42
    .local v1, "contentView":Landroid/view/View;
    invoke-virtual {p0, v1}, Lcom/vk/attachpicker/GraffitiConfirmDialog;->setContentView(Landroid/view/View;)V

    .line 44
    const v3, 0x7f10045e

    invoke-virtual {p0, v3}, Lcom/vk/attachpicker/GraffitiConfirmDialog;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/vk/attachpicker/widget/RotateLayout;

    iput-object v3, p0, Lcom/vk/attachpicker/GraffitiConfirmDialog;->resultContainer:Lcom/vk/attachpicker/widget/RotateLayout;

    .line 45
    const v3, 0x7f100474

    invoke-virtual {p0, v3}, Lcom/vk/attachpicker/GraffitiConfirmDialog;->findViewById(I)Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lcom/vk/attachpicker/GraffitiConfirmDialog;->preview:Landroid/view/View;

    .line 46
    const v3, 0x7f100475

    invoke-virtual {p0, v3}, Lcom/vk/attachpicker/GraffitiConfirmDialog;->findViewById(I)Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lcom/vk/attachpicker/GraffitiConfirmDialog;->graffitiContainer:Landroid/view/View;

    .line 47
    const v3, 0x7f100476

    invoke-virtual {p0, v3}, Lcom/vk/attachpicker/GraffitiConfirmDialog;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/vk/imageloader/view/VKImageView;

    iput-object v3, p0, Lcom/vk/attachpicker/GraffitiConfirmDialog;->imagePreview:Lcom/vk/imageloader/view/VKImageView;

    .line 48
    const v3, 0x7f100477

    invoke-virtual {p0, v3}, Lcom/vk/attachpicker/GraffitiConfirmDialog;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/vk/attachpicker/GraffitiConfirmDialog;->sendButton:Landroid/widget/TextView;

    .line 50
    iget v3, p2, Lcom/vkontakte/android/api/Document;->width:I

    int-to-float v3, v3

    iget v4, p2, Lcom/vkontakte/android/api/Document;->height:I

    int-to-float v4, v4

    div-float v0, v3, v4

    .line 51
    .local v0, "ar":F
    iget-object v3, p0, Lcom/vk/attachpicker/GraffitiConfirmDialog;->imagePreview:Lcom/vk/imageloader/view/VKImageView;

    const/high16 v4, 0x40000000    # 2.0f

    const v5, 0x3f19999a    # 0.6f

    invoke-static {v5, v0}, Ljava/lang/Math;->max(FF)F

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->min(FF)F

    move-result v4

    invoke-virtual {v3, v4}, Lcom/vk/imageloader/view/VKImageView;->setAspectRatio(F)V

    .line 52
    iget-object v3, p0, Lcom/vk/attachpicker/GraffitiConfirmDialog;->imagePreview:Lcom/vk/imageloader/view/VKImageView;

    iget-object v4, p2, Lcom/vkontakte/android/api/Document;->url:Ljava/lang/String;

    sget-object v5, Lcom/vk/imageloader/ImageSize;->MID:Lcom/vk/imageloader/ImageSize;

    invoke-virtual {v3, v4, v5}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;Lcom/vk/imageloader/ImageSize;)V

    .line 54
    iget-object v3, p0, Lcom/vk/attachpicker/GraffitiConfirmDialog;->imagePreview:Lcom/vk/imageloader/view/VKImageView;

    invoke-static {}, Lcom/vk/core/util/Screen;->realWidth()I

    move-result v4

    const/16 v5, 0x80

    invoke-static {v5}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v5

    sub-int/2addr v4, v5

    invoke-virtual {v3, v4}, Lcom/vk/imageloader/view/VKImageView;->setMaxHeight(I)V

    .line 55
    iget-object v3, p0, Lcom/vk/attachpicker/GraffitiConfirmDialog;->imagePreview:Lcom/vk/imageloader/view/VKImageView;

    invoke-static {}, Lcom/vk/core/util/Screen;->realWidth()I

    move-result v4

    const/16 v5, 0x20

    invoke-static {v5}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v5

    sub-int/2addr v4, v5

    invoke-virtual {v3, v4}, Lcom/vk/imageloader/view/VKImageView;->setMaxWidth(I)V

    .line 56
    iget-object v3, p0, Lcom/vk/attachpicker/GraffitiConfirmDialog;->imagePreview:Lcom/vk/imageloader/view/VKImageView;

    invoke-static {}, Lcom/vk/attachpicker/GraffitiConfirmDialog$$Lambda$1;->lambdaFactory$()Landroid/view/View$OnClickListener;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/vk/imageloader/view/VKImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 57
    iget-object v3, p0, Lcom/vk/attachpicker/GraffitiConfirmDialog;->preview:Landroid/view/View;

    invoke-static {p0}, Lcom/vk/attachpicker/GraffitiConfirmDialog$$Lambda$2;->lambdaFactory$(Lcom/vk/attachpicker/GraffitiConfirmDialog;)Landroid/view/View$OnClickListener;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 58
    iget-object v3, p0, Lcom/vk/attachpicker/GraffitiConfirmDialog;->sendButton:Landroid/widget/TextView;

    invoke-static {p2, p1}, Lcom/vk/attachpicker/GraffitiConfirmDialog$$Lambda$3;->lambdaFactory$(Lcom/vkontakte/android/api/Document;Landroid/app/Activity;)Landroid/view/View$OnClickListener;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 68
    return-void
.end method

.method static synthetic lambda$new$0(Landroid/view/View;)V
    .locals 0
    .param p0, "v"    # Landroid/view/View;

    .prologue
    .line 56
    return-void
.end method

.method static synthetic lambda$new$2(Lcom/vkontakte/android/api/Document;Landroid/app/Activity;Landroid/view/View;)V
    .locals 3
    .param p0, "document"    # Lcom/vkontakte/android/api/Document;
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "v"    # Landroid/view/View;

    .prologue
    .line 59
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 60
    .local v0, "result":Landroid/content/Intent;
    const-string/jumbo v1, "result_graffiti"

    new-instance v2, Lcom/vkontakte/android/attachments/GraffitiAttachment;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/attachments/GraffitiAttachment;-><init>(Lcom/vkontakte/android/api/Document;)V

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 61
    const/4 v1, -0x1

    invoke-virtual {p1, v1, v0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 62
    instance-of v1, p1, Lcom/vk/attachpicker/AttachActivity;

    if-eqz v1, :cond_0

    .line 63
    check-cast p1, Lcom/vk/attachpicker/AttachActivity;

    .end local p1    # "activity":Landroid/app/Activity;
    invoke-virtual {p1}, Lcom/vk/attachpicker/AttachActivity;->superFinish()V

    .line 67
    :goto_0
    return-void

    .line 65
    .restart local p1    # "activity":Landroid/app/Activity;
    :cond_0
    invoke-virtual {p1}, Landroid/app/Activity;->finish()V

    goto :goto_0
.end method


# virtual methods
.method synthetic lambda$new$1(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 57
    invoke-virtual {p0}, Lcom/vk/attachpicker/GraffitiConfirmDialog;->dismiss()V

    return-void
.end method
