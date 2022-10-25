.class public Lcom/vk/lists/AbstractErrorView;
.super Landroid/widget/FrameLayout;
.source "AbstractErrorView.java"


# instance fields
.field private receiver:Landroid/content/BroadcastReceiver;

.field private retryClickListener:Lcom/vk/lists/OnRetryClickListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 38
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 15
    new-instance v0, Lcom/vk/lists/AbstractErrorView$1;

    invoke-direct {v0, p0}, Lcom/vk/lists/AbstractErrorView$1;-><init>(Lcom/vk/lists/AbstractErrorView;)V

    iput-object v0, p0, Lcom/vk/lists/AbstractErrorView;->receiver:Landroid/content/BroadcastReceiver;

    .line 39
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 42
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 15
    new-instance v0, Lcom/vk/lists/AbstractErrorView$1;

    invoke-direct {v0, p0}, Lcom/vk/lists/AbstractErrorView$1;-><init>(Lcom/vk/lists/AbstractErrorView;)V

    iput-object v0, p0, Lcom/vk/lists/AbstractErrorView;->receiver:Landroid/content/BroadcastReceiver;

    .line 43
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 46
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 15
    new-instance v0, Lcom/vk/lists/AbstractErrorView$1;

    invoke-direct {v0, p0}, Lcom/vk/lists/AbstractErrorView$1;-><init>(Lcom/vk/lists/AbstractErrorView;)V

    iput-object v0, p0, Lcom/vk/lists/AbstractErrorView;->receiver:Landroid/content/BroadcastReceiver;

    .line 47
    return-void
.end method


# virtual methods
.method public getRetryClickListener()Lcom/vk/lists/OnRetryClickListener;
    .locals 1

    .prologue
    .line 77
    iget-object v0, p0, Lcom/vk/lists/AbstractErrorView;->retryClickListener:Lcom/vk/lists/OnRetryClickListener;

    return-object v0
.end method

.method public onDetachedFromWindow()V
    .locals 2

    .prologue
    .line 51
    invoke-super {p0}, Landroid/widget/FrameLayout;->onDetachedFromWindow()V

    .line 52
    invoke-virtual {p0}, Lcom/vk/lists/AbstractErrorView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    .line 54
    :try_start_0
    invoke-virtual {p0}, Lcom/vk/lists/AbstractErrorView;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/lists/AbstractErrorView;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 58
    :cond_0
    :goto_0
    return-void

    .line 55
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public retry()V
    .locals 1

    .prologue
    .line 85
    invoke-virtual {p0}, Lcom/vk/lists/AbstractErrorView;->getRetryClickListener()Lcom/vk/lists/OnRetryClickListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 86
    invoke-virtual {p0}, Lcom/vk/lists/AbstractErrorView;->getRetryClickListener()Lcom/vk/lists/OnRetryClickListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/lists/OnRetryClickListener;->onRetryClick()V

    .line 88
    :cond_0
    return-void
.end method

.method public setRetryClickListener(Lcom/vk/lists/OnRetryClickListener;)V
    .locals 0
    .param p1, "retryClickListener"    # Lcom/vk/lists/OnRetryClickListener;

    .prologue
    .line 81
    iput-object p1, p0, Lcom/vk/lists/AbstractErrorView;->retryClickListener:Lcom/vk/lists/OnRetryClickListener;

    .line 82
    return-void
.end method

.method public setVisibility(I)V
    .locals 4
    .param p1, "vis"    # I

    .prologue
    .line 62
    invoke-virtual {p0}, Lcom/vk/lists/AbstractErrorView;->getVisibility()I

    move-result v1

    .line 63
    .local v1, "prev":I
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 64
    if-nez p1, :cond_1

    if-eqz v1, :cond_1

    .line 65
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 66
    .local v0, "filter":Landroid/content/IntentFilter;
    const-string/jumbo v2, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 67
    invoke-virtual {p0}, Lcom/vk/lists/AbstractErrorView;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/vk/lists/AbstractErrorView;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v2, v3, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 74
    .end local v0    # "filter":Landroid/content/IntentFilter;
    :cond_0
    :goto_0
    return-void

    .line 68
    :cond_1
    if-eqz p1, :cond_0

    if-nez v1, :cond_0

    .line 70
    :try_start_0
    invoke-virtual {p0}, Lcom/vk/lists/AbstractErrorView;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/vk/lists/AbstractErrorView;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v2, v3}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 71
    :catch_0
    move-exception v2

    goto :goto_0
.end method
