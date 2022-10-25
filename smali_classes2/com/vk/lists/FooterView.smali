.class public Lcom/vk/lists/FooterView;
.super Landroid/widget/FrameLayout;
.source "FooterView.java"


# instance fields
.field private errorView:Lcom/vk/lists/AbstractErrorView;

.field private loadingView:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 14
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 15
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 18
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 19
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 22
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 23
    return-void
.end method


# virtual methods
.method public setErrorRetryClickListener(Lcom/vk/lists/OnRetryClickListener;)V
    .locals 1
    .param p1, "clickListener"    # Lcom/vk/lists/OnRetryClickListener;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/vk/lists/FooterView;->errorView:Lcom/vk/lists/AbstractErrorView;

    invoke-virtual {v0, p1}, Lcom/vk/lists/AbstractErrorView;->setRetryClickListener(Lcom/vk/lists/OnRetryClickListener;)V

    .line 43
    return-void
.end method

.method public setErrorView(Lcom/vk/lists/AbstractErrorView;)V
    .locals 1
    .param p1, "errorView"    # Lcom/vk/lists/AbstractErrorView;

    .prologue
    .line 34
    iget-object v0, p0, Lcom/vk/lists/FooterView;->errorView:Lcom/vk/lists/AbstractErrorView;

    if-eqz v0, :cond_0

    .line 35
    iget-object v0, p0, Lcom/vk/lists/FooterView;->errorView:Lcom/vk/lists/AbstractErrorView;

    invoke-virtual {p0, v0}, Lcom/vk/lists/FooterView;->removeView(Landroid/view/View;)V

    .line 37
    :cond_0
    iput-object p1, p0, Lcom/vk/lists/FooterView;->errorView:Lcom/vk/lists/AbstractErrorView;

    .line 38
    iget-object v0, p0, Lcom/vk/lists/FooterView;->errorView:Lcom/vk/lists/AbstractErrorView;

    invoke-virtual {p0, v0}, Lcom/vk/lists/FooterView;->addView(Landroid/view/View;)V

    .line 39
    return-void
.end method

.method public setLoadingView(Landroid/view/View;)V
    .locals 1
    .param p1, "loadingView"    # Landroid/view/View;

    .prologue
    .line 26
    iget-object v0, p0, Lcom/vk/lists/FooterView;->loadingView:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 27
    iget-object v0, p0, Lcom/vk/lists/FooterView;->loadingView:Landroid/view/View;

    invoke-virtual {p0, v0}, Lcom/vk/lists/FooterView;->removeView(Landroid/view/View;)V

    .line 29
    :cond_0
    iput-object p1, p0, Lcom/vk/lists/FooterView;->loadingView:Landroid/view/View;

    .line 30
    iget-object v0, p0, Lcom/vk/lists/FooterView;->loadingView:Landroid/view/View;

    invoke-virtual {p0, v0}, Lcom/vk/lists/FooterView;->addView(Landroid/view/View;)V

    .line 31
    return-void
.end method

.method public showError()V
    .locals 2

    .prologue
    .line 51
    iget-object v0, p0, Lcom/vk/lists/FooterView;->errorView:Lcom/vk/lists/AbstractErrorView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vk/lists/AbstractErrorView;->setVisibility(I)V

    .line 52
    iget-object v0, p0, Lcom/vk/lists/FooterView;->loadingView:Landroid/view/View;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 53
    return-void
.end method

.method public showLoading()V
    .locals 2

    .prologue
    .line 46
    iget-object v0, p0, Lcom/vk/lists/FooterView;->loadingView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 47
    iget-object v0, p0, Lcom/vk/lists/FooterView;->errorView:Lcom/vk/lists/AbstractErrorView;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/vk/lists/AbstractErrorView;->setVisibility(I)V

    .line 48
    return-void
.end method
