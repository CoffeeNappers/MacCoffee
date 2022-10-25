.class final Lcom/vk/sharing/view/TargetView;
.super Landroid/widget/FrameLayout;
.source "TargetView.java"


# instance fields
.field iconView:Lcom/vk/sharing/view/TargetImageView;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field labelView:Landroid/widget/TextView;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private target:Lcom/vk/sharing/target/Target;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 27
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/vk/sharing/view/TargetView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 28
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "attrs"    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 31
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/vk/sharing/view/TargetView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 32
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "attrs"    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 35
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 37
    const v0, 0x7f0203b0

    invoke-virtual {p0, v0}, Lcom/vk/sharing/view/TargetView;->setBackgroundResource(I)V

    .line 38
    const v0, 0x7f0300e3

    invoke-static {p1, v0, p0}, Lcom/vk/sharing/view/TargetView;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 40
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vk/sharing/view/TargetView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/sharing/view/TargetImageView;

    iput-object v0, p0, Lcom/vk/sharing/view/TargetView;->iconView:Lcom/vk/sharing/view/TargetImageView;

    .line 41
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vk/sharing/view/TargetView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vk/sharing/view/TargetView;->labelView:Landroid/widget/TextView;

    .line 42
    return-void
.end method


# virtual methods
.method public getTarget()Lcom/vk/sharing/target/Target;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 70
    iget-object v0, p0, Lcom/vk/sharing/view/TargetView;->target:Lcom/vk/sharing/target/Target;

    return-object v0
.end method

.method protected onMeasure(II)V
    .locals 4
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    const/high16 v3, 0x40000000    # 2.0f

    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/vk/sharing/view/TargetView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f090143

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    invoke-static {v0, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    .line 48
    invoke-virtual {p0}, Lcom/vk/sharing/view/TargetView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f090141

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    invoke-static {v1, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    .line 46
    invoke-super {p0, v0, v1}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 50
    return-void
.end method

.method setTarget(Lcom/vk/sharing/target/Target;)V
    .locals 3
    .param p1, "target"    # Lcom/vk/sharing/target/Target;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 53
    iput-object p1, p0, Lcom/vk/sharing/view/TargetView;->target:Lcom/vk/sharing/target/Target;

    .line 55
    if-eqz p1, :cond_0

    .line 56
    iget-object v0, p0, Lcom/vk/sharing/view/TargetView;->iconView:Lcom/vk/sharing/view/TargetImageView;

    iget-object v1, p1, Lcom/vk/sharing/target/Target;->photoUrl:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/vk/sharing/view/TargetImageView;->load(Ljava/lang/String;)V

    .line 57
    iget-object v0, p0, Lcom/vk/sharing/view/TargetView;->labelView:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/vk/sharing/target/Target;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 58
    iget-object v0, p0, Lcom/vk/sharing/view/TargetView;->iconView:Lcom/vk/sharing/view/TargetImageView;

    iget-boolean v1, p1, Lcom/vk/sharing/target/Target;->selected:Z

    invoke-virtual {v0, v1}, Lcom/vk/sharing/view/TargetImageView;->setSelected(Z)V

    .line 59
    iget-object v0, p0, Lcom/vk/sharing/view/TargetView;->labelView:Landroid/widget/TextView;

    iget-boolean v1, p1, Lcom/vk/sharing/target/Target;->selected:Z

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setSelected(Z)V

    .line 66
    :goto_0
    return-void

    .line 61
    :cond_0
    iget-object v0, p0, Lcom/vk/sharing/view/TargetView;->iconView:Lcom/vk/sharing/view/TargetImageView;

    invoke-virtual {v0, v2}, Lcom/vk/sharing/view/TargetImageView;->load(Ljava/lang/String;)V

    .line 62
    iget-object v0, p0, Lcom/vk/sharing/view/TargetView;->labelView:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 63
    iget-object v0, p0, Lcom/vk/sharing/view/TargetView;->iconView:Lcom/vk/sharing/view/TargetImageView;

    invoke-virtual {v0, v1}, Lcom/vk/sharing/view/TargetImageView;->setSelected(Z)V

    .line 64
    iget-object v0, p0, Lcom/vk/sharing/view/TargetView;->labelView:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setSelected(Z)V

    goto :goto_0
.end method
