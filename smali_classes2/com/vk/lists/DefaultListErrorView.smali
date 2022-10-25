.class public Lcom/vk/lists/DefaultListErrorView;
.super Lcom/vk/lists/AbstractErrorView;
.source "DefaultListErrorView.java"


# instance fields
.field private errorButton:Landroid/widget/TextView;

.field private errorText:Landroid/widget/TextView;

.field private lastClickTime:J


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 20
    invoke-direct {p0, p1}, Lcom/vk/lists/AbstractErrorView;-><init>(Landroid/content/Context;)V

    .line 14
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/vk/lists/DefaultListErrorView;->lastClickTime:J

    .line 21
    invoke-direct {p0, p1}, Lcom/vk/lists/DefaultListErrorView;->init(Landroid/content/Context;)V

    .line 22
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 25
    invoke-direct {p0, p1, p2}, Lcom/vk/lists/AbstractErrorView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 14
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/vk/lists/DefaultListErrorView;->lastClickTime:J

    .line 26
    invoke-direct {p0, p1}, Lcom/vk/lists/DefaultListErrorView;->init(Landroid/content/Context;)V

    .line 27
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 30
    invoke-direct {p0, p1, p2, p3}, Lcom/vk/lists/AbstractErrorView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 14
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/vk/lists/DefaultListErrorView;->lastClickTime:J

    .line 31
    invoke-direct {p0, p1}, Lcom/vk/lists/DefaultListErrorView;->init(Landroid/content/Context;)V

    .line 32
    return-void
.end method

.method static synthetic access$000(Lcom/vk/lists/DefaultListErrorView;)J
    .locals 2
    .param p0, "x0"    # Lcom/vk/lists/DefaultListErrorView;

    .prologue
    .line 12
    iget-wide v0, p0, Lcom/vk/lists/DefaultListErrorView;->lastClickTime:J

    return-wide v0
.end method

.method static synthetic access$002(Lcom/vk/lists/DefaultListErrorView;J)J
    .locals 1
    .param p0, "x0"    # Lcom/vk/lists/DefaultListErrorView;
    .param p1, "x1"    # J

    .prologue
    .line 12
    iput-wide p1, p0, Lcom/vk/lists/DefaultListErrorView;->lastClickTime:J

    return-wide p1
.end method

.method private init(Landroid/content/Context;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 35
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    sget v2, Lcom/vk/lists/R$layout;->view_default_list_error_view:I

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 36
    .local v0, "ll":Landroid/widget/LinearLayout;
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v2, -0x1

    .line 37
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    sget v4, Lcom/vk/lists/R$dimen;->footer_height:I

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v3

    float-to-int v3, v3

    invoke-direct {v1, v2, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 36
    invoke-virtual {p0, v0, v1}, Lcom/vk/lists/DefaultListErrorView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 38
    sget v1, Lcom/vk/lists/R$id;->error_text:I

    invoke-virtual {p0, v1}, Lcom/vk/lists/DefaultListErrorView;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vk/lists/DefaultListErrorView;->errorText:Landroid/widget/TextView;

    .line 39
    sget v1, Lcom/vk/lists/R$id;->error_button:I

    invoke-virtual {p0, v1}, Lcom/vk/lists/DefaultListErrorView;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vk/lists/DefaultListErrorView;->errorButton:Landroid/widget/TextView;

    .line 40
    iget-object v1, p0, Lcom/vk/lists/DefaultListErrorView;->errorButton:Landroid/widget/TextView;

    new-instance v2, Lcom/vk/lists/DefaultListErrorView$1;

    invoke-direct {v2, p0}, Lcom/vk/lists/DefaultListErrorView$1;-><init>(Lcom/vk/lists/DefaultListErrorView;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 50
    return-void
.end method


# virtual methods
.method public setMessage(Ljava/lang/String;)V
    .locals 1
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 53
    iget-object v0, p0, Lcom/vk/lists/DefaultListErrorView;->errorText:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 54
    return-void
.end method
