.class Lcom/vk/lists/DefaultErrorView$1;
.super Ljava/lang/Object;
.source "DefaultErrorView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/lists/DefaultErrorView;->init(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/lists/DefaultErrorView;


# direct methods
.method constructor <init>(Lcom/vk/lists/DefaultErrorView;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/lists/DefaultErrorView;

    .prologue
    .line 40
    iput-object p1, p0, Lcom/vk/lists/DefaultErrorView$1;->this$0:Lcom/vk/lists/DefaultErrorView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 43
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lcom/vk/lists/DefaultErrorView$1;->this$0:Lcom/vk/lists/DefaultErrorView;

    invoke-static {v2}, Lcom/vk/lists/DefaultErrorView;->access$000(Lcom/vk/lists/DefaultErrorView;)J

    move-result-wide v2

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x190

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    .line 48
    :goto_0
    return-void

    .line 46
    :cond_0
    iget-object v0, p0, Lcom/vk/lists/DefaultErrorView$1;->this$0:Lcom/vk/lists/DefaultErrorView;

    invoke-virtual {v0}, Lcom/vk/lists/DefaultErrorView;->retry()V

    .line 47
    iget-object v0, p0, Lcom/vk/lists/DefaultErrorView$1;->this$0:Lcom/vk/lists/DefaultErrorView;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v0, v2, v3}, Lcom/vk/lists/DefaultErrorView;->access$002(Lcom/vk/lists/DefaultErrorView;J)J

    goto :goto_0
.end method
