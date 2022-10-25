.class public final Lcom/vk/sharing/view/SharingActionsView;
.super Landroid/widget/LinearLayout;
.source "SharingActionsView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/sharing/view/SharingActionsView$ItemView;,
        Lcom/vk/sharing/view/SharingActionsView$Listener;
    }
.end annotation


# instance fields
.field private internalClickListener:Landroid/view/View$OnClickListener;

.field private listener:Lcom/vk/sharing/view/SharingActionsView$Listener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 53
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 46
    invoke-static {p0}, Lcom/vk/sharing/view/SharingActionsView$$Lambda$1;->lambdaFactory$(Lcom/vk/sharing/view/SharingActionsView;)Landroid/view/View$OnClickListener;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/sharing/view/SharingActionsView;->internalClickListener:Landroid/view/View$OnClickListener;

    .line 54
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 57
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 46
    invoke-static {p0}, Lcom/vk/sharing/view/SharingActionsView$$Lambda$2;->lambdaFactory$(Lcom/vk/sharing/view/SharingActionsView;)Landroid/view/View$OnClickListener;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/sharing/view/SharingActionsView;->internalClickListener:Landroid/view/View$OnClickListener;

    .line 58
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 61
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 46
    invoke-static {p0}, Lcom/vk/sharing/view/SharingActionsView$$Lambda$3;->lambdaFactory$(Lcom/vk/sharing/view/SharingActionsView;)Landroid/view/View$OnClickListener;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/sharing/view/SharingActionsView;->internalClickListener:Landroid/view/View$OnClickListener;

    .line 62
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 66
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 46
    invoke-static {p0}, Lcom/vk/sharing/view/SharingActionsView$$Lambda$4;->lambdaFactory$(Lcom/vk/sharing/view/SharingActionsView;)Landroid/view/View$OnClickListener;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/sharing/view/SharingActionsView;->internalClickListener:Landroid/view/View$OnClickListener;

    .line 67
    return-void
.end method

.method private addItemView(III)V
    .locals 7
    .param p1, "action"    # I
    .param p2, "icon"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param
    .param p3, "label"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param

    .prologue
    const/4 v6, -0x2

    .line 94
    invoke-virtual {p0}, Lcom/vk/sharing/view/SharingActionsView;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 95
    .local v0, "context":Landroid/content/Context;
    new-instance v2, Lcom/vk/sharing/view/SharingActionsView$ItemView;

    invoke-static {v0, p2}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v0, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v0, p1, v4, v5}, Lcom/vk/sharing/view/SharingActionsView$ItemView;-><init>(Landroid/content/Context;ILandroid/graphics/drawable/Drawable;Ljava/lang/String;)V

    .line 96
    .local v2, "itemView":Lcom/vk/sharing/view/SharingActionsView$ItemView;
    iget-object v4, p0, Lcom/vk/sharing/view/SharingActionsView;->internalClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v2, v4}, Lcom/vk/sharing/view/SharingActionsView$ItemView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 98
    new-instance v1, Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Lcom/vk/sharing/view/SharingActionsView;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v1, v4}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 99
    .local v1, "frame":Landroid/widget/FrameLayout;
    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v5, 0x1

    invoke-direct {v4, v6, v6, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v1, v2, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 101
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, 0x0

    const/4 v5, -0x1

    invoke-direct {v3, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 102
    .local v3, "params":Landroid/widget/LinearLayout$LayoutParams;
    const/high16 v4, 0x3f800000    # 1.0f

    iput v4, v3, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 103
    invoke-virtual {p0, v1, v3}, Lcom/vk/sharing/view/SharingActionsView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 104
    return-void
.end method


# virtual methods
.method synthetic lambda$new$0(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 47
    iget-object v0, p0, Lcom/vk/sharing/view/SharingActionsView;->listener:Lcom/vk/sharing/view/SharingActionsView$Listener;

    if-eqz v0, :cond_0

    .line 48
    iget-object v0, p0, Lcom/vk/sharing/view/SharingActionsView;->listener:Lcom/vk/sharing/view/SharingActionsView$Listener;

    check-cast p1, Lcom/vk/sharing/view/SharingActionsView$ItemView;

    .end local p1    # "v":Landroid/view/View;
    iget v1, p1, Lcom/vk/sharing/view/SharingActionsView$ItemView;->action:I

    invoke-interface {v0, v1}, Lcom/vk/sharing/view/SharingActionsView$Listener;->onActionClick(I)V

    .line 50
    :cond_0
    return-void
.end method

.method public setInfo(Lcom/vk/sharing/action/ActionsInfo;)V
    .locals 3
    .param p1, "actionsInfo"    # Lcom/vk/sharing/action/ActionsInfo;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 74
    invoke-virtual {p0}, Lcom/vk/sharing/view/SharingActionsView;->removeAllViews()V

    .line 76
    invoke-virtual {p1}, Lcom/vk/sharing/action/ActionsInfo;->canRepost()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 77
    const/4 v0, 0x1

    const v1, 0x7f020275

    const v2, 0x7f08066b

    invoke-direct {p0, v0, v1, v2}, Lcom/vk/sharing/view/SharingActionsView;->addItemView(III)V

    .line 80
    :cond_0
    invoke-virtual {p1}, Lcom/vk/sharing/action/ActionsInfo;->canPostGroup()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 81
    const/4 v0, 0x2

    const v1, 0x7f0201ec

    const v2, 0x7f08066c

    invoke-direct {p0, v0, v1, v2}, Lcom/vk/sharing/view/SharingActionsView;->addItemView(III)V

    .line 84
    :cond_1
    invoke-virtual {p1}, Lcom/vk/sharing/action/ActionsInfo;->canExtractLink()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 85
    const/4 v0, 0x3

    const v1, 0x7f020193

    const v2, 0x7f08066d

    invoke-direct {p0, v0, v1, v2}, Lcom/vk/sharing/view/SharingActionsView;->addItemView(III)V

    .line 88
    :cond_2
    invoke-virtual {p1}, Lcom/vk/sharing/action/ActionsInfo;->canShareExternal()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 89
    const/4 v0, 0x4

    const v1, 0x7f02028a

    const v2, 0x7f08066e

    invoke-direct {p0, v0, v1, v2}, Lcom/vk/sharing/view/SharingActionsView;->addItemView(III)V

    .line 91
    :cond_3
    return-void
.end method

.method public setListener(Lcom/vk/sharing/view/SharingActionsView$Listener;)V
    .locals 0
    .param p1, "listener"    # Lcom/vk/sharing/view/SharingActionsView$Listener;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 70
    iput-object p1, p0, Lcom/vk/sharing/view/SharingActionsView;->listener:Lcom/vk/sharing/view/SharingActionsView$Listener;

    .line 71
    return-void
.end method
