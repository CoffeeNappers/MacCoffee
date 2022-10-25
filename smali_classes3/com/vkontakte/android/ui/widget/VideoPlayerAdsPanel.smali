.class public Lcom/vkontakte/android/ui/widget/VideoPlayerAdsPanel;
.super Landroid/widget/LinearLayout;
.source "VideoPlayerAdsPanel.java"


# instance fields
.field private adsButton:Landroid/widget/TextView;

.field private adsTitle:Landroid/widget/TextView;

.field private attachment:Lcom/vkontakte/android/attachments/ShitAttachment;

.field private lastOrientation:I

.field private title:Ljava/lang/CharSequence;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 29
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/vkontakte/android/ui/widget/VideoPlayerAdsPanel;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 30
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 33
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/vkontakte/android/ui/widget/VideoPlayerAdsPanel;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 34
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 37
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 38
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/VideoPlayerAdsPanel;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    iput v0, p0, Lcom/vkontakte/android/ui/widget/VideoPlayerAdsPanel;->lastOrientation:I

    .line 39
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/widget/VideoPlayerAdsPanel;->initView(Landroid/content/Context;)V

    .line 40
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/ui/widget/VideoPlayerAdsPanel;)Lcom/vkontakte/android/attachments/ShitAttachment;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/VideoPlayerAdsPanel;

    .prologue
    .line 18
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VideoPlayerAdsPanel;->attachment:Lcom/vkontakte/android/attachments/ShitAttachment;

    return-object v0
.end method

.method private bind()V
    .locals 2

    .prologue
    .line 49
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VideoPlayerAdsPanel;->attachment:Lcom/vkontakte/android/attachments/ShitAttachment;

    if-eqz v0, :cond_0

    .line 50
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VideoPlayerAdsPanel;->adsTitle:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/VideoPlayerAdsPanel;->title:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 51
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/VideoPlayerAdsPanel;->adsButton:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VideoPlayerAdsPanel;->attachment:Lcom/vkontakte/android/attachments/ShitAttachment;

    iget-boolean v0, v0, Lcom/vkontakte/android/attachments/ShitAttachment;->installed:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VideoPlayerAdsPanel;->attachment:Lcom/vkontakte/android/attachments/ShitAttachment;

    iget-object v0, v0, Lcom/vkontakte/android/attachments/ShitAttachment;->buttonTextInstalled:Ljava/lang/String;

    :goto_0
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 53
    :cond_0
    return-void

    .line 51
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VideoPlayerAdsPanel;->attachment:Lcom/vkontakte/android/attachments/ShitAttachment;

    iget-object v0, v0, Lcom/vkontakte/android/attachments/ShitAttachment;->buttonText:Ljava/lang/String;

    goto :goto_0
.end method

.method private initView(Landroid/content/Context;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 65
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/VideoPlayerAdsPanel;->removeAllViews()V

    .line 66
    const v1, 0x7f030228

    const/4 v2, 0x0

    invoke-static {p1, v1, v2}, Lcom/vkontakte/android/ui/widget/VideoPlayerAdsPanel;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 67
    .local v0, "view":Landroid/view/View;
    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    const/4 v2, -0x1

    const/4 v3, -0x2

    invoke-direct {v1, v2, v3}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 71
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/widget/VideoPlayerAdsPanel;->addView(Landroid/view/View;)V

    .line 73
    const v1, 0x7f10040c

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/widget/VideoPlayerAdsPanel;->adsTitle:Landroid/widget/TextView;

    .line 74
    const v1, 0x7f1001f8

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/widget/VideoPlayerAdsPanel;->adsButton:Landroid/widget/TextView;

    .line 75
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/VideoPlayerAdsPanel;->adsButton:Landroid/widget/TextView;

    new-instance v2, Lcom/vkontakte/android/ui/widget/VideoPlayerAdsPanel$1;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/ui/widget/VideoPlayerAdsPanel$1;-><init>(Lcom/vkontakte/android/ui/widget/VideoPlayerAdsPanel;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 88
    invoke-direct {p0}, Lcom/vkontakte/android/ui/widget/VideoPlayerAdsPanel;->bind()V

    .line 89
    return-void
.end method


# virtual methods
.method public bind(Lcom/vkontakte/android/attachments/ShitAttachment;Ljava/lang/CharSequence;)V
    .locals 0
    .param p1, "attachment"    # Lcom/vkontakte/android/attachments/ShitAttachment;
    .param p2, "title"    # Ljava/lang/CharSequence;

    .prologue
    .line 43
    iput-object p1, p0, Lcom/vkontakte/android/ui/widget/VideoPlayerAdsPanel;->attachment:Lcom/vkontakte/android/attachments/ShitAttachment;

    .line 44
    iput-object p2, p0, Lcom/vkontakte/android/ui/widget/VideoPlayerAdsPanel;->title:Ljava/lang/CharSequence;

    .line 45
    invoke-direct {p0}, Lcom/vkontakte/android/ui/widget/VideoPlayerAdsPanel;->bind()V

    .line 46
    return-void
.end method

.method protected onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 2
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 57
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 58
    iget v0, p0, Lcom/vkontakte/android/ui/widget/VideoPlayerAdsPanel;->lastOrientation:I

    iget v1, p1, Landroid/content/res/Configuration;->orientation:I

    if-eq v0, v1, :cond_0

    .line 59
    iget v0, p1, Landroid/content/res/Configuration;->orientation:I

    iput v0, p0, Lcom/vkontakte/android/ui/widget/VideoPlayerAdsPanel;->lastOrientation:I

    .line 60
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/VideoPlayerAdsPanel;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/ui/widget/VideoPlayerAdsPanel;->initView(Landroid/content/Context;)V

    .line 62
    :cond_0
    return-void
.end method
