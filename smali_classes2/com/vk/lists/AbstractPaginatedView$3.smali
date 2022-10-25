.class Lcom/vk/lists/AbstractPaginatedView$3;
.super Ljava/lang/Object;
.source "AbstractPaginatedView.java"

# interfaces
.implements Lcom/vk/lists/OnRetryClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/lists/AbstractPaginatedView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/lists/AbstractPaginatedView;


# direct methods
.method constructor <init>(Lcom/vk/lists/AbstractPaginatedView;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/lists/AbstractPaginatedView;

    .prologue
    .line 218
    iput-object p1, p0, Lcom/vk/lists/AbstractPaginatedView$3;->this$0:Lcom/vk/lists/AbstractPaginatedView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onRetryClick()V
    .locals 1

    .prologue
    .line 221
    iget-object v0, p0, Lcom/vk/lists/AbstractPaginatedView$3;->this$0:Lcom/vk/lists/AbstractPaginatedView;

    invoke-static {v0}, Lcom/vk/lists/AbstractPaginatedView;->access$100(Lcom/vk/lists/AbstractPaginatedView;)Lcom/vk/lists/OnRetryClickListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 222
    iget-object v0, p0, Lcom/vk/lists/AbstractPaginatedView$3;->this$0:Lcom/vk/lists/AbstractPaginatedView;

    invoke-static {v0}, Lcom/vk/lists/AbstractPaginatedView;->access$100(Lcom/vk/lists/AbstractPaginatedView;)Lcom/vk/lists/OnRetryClickListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/lists/OnRetryClickListener;->onRetryClick()V

    .line 224
    :cond_0
    return-void
.end method
