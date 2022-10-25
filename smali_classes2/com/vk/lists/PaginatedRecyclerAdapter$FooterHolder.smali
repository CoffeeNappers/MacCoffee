.class final Lcom/vk/lists/PaginatedRecyclerAdapter$FooterHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "PaginatedRecyclerAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/lists/PaginatedRecyclerAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "FooterHolder"
.end annotation


# instance fields
.field private final footerView:Lcom/vk/lists/FooterView;

.field final synthetic this$0:Lcom/vk/lists/PaginatedRecyclerAdapter;


# direct methods
.method public constructor <init>(Lcom/vk/lists/PaginatedRecyclerAdapter;Landroid/content/Context;Lcom/vk/lists/FooterViewProvider;Lcom/vk/lists/OnRetryClickListener;)V
    .locals 1
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "provider"    # Lcom/vk/lists/FooterViewProvider;
    .param p4, "onRetryClickListener"    # Lcom/vk/lists/OnRetryClickListener;

    .prologue
    .line 165
    iput-object p1, p0, Lcom/vk/lists/PaginatedRecyclerAdapter$FooterHolder;->this$0:Lcom/vk/lists/PaginatedRecyclerAdapter;

    .line 166
    invoke-interface {p3, p2}, Lcom/vk/lists/FooterViewProvider;->createFooterView(Landroid/content/Context;)Lcom/vk/lists/FooterView;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 167
    iget-object v0, p0, Lcom/vk/lists/PaginatedRecyclerAdapter$FooterHolder;->itemView:Landroid/view/View;

    check-cast v0, Lcom/vk/lists/FooterView;

    iput-object v0, p0, Lcom/vk/lists/PaginatedRecyclerAdapter$FooterHolder;->footerView:Lcom/vk/lists/FooterView;

    .line 168
    iget-object v0, p0, Lcom/vk/lists/PaginatedRecyclerAdapter$FooterHolder;->footerView:Lcom/vk/lists/FooterView;

    invoke-virtual {v0, p4}, Lcom/vk/lists/FooterView;->setErrorRetryClickListener(Lcom/vk/lists/OnRetryClickListener;)V

    .line 169
    return-void
.end method


# virtual methods
.method public onBindViewHolder(Z)V
    .locals 1
    .param p1, "showLoading"    # Z

    .prologue
    .line 172
    if-eqz p1, :cond_0

    .line 173
    iget-object v0, p0, Lcom/vk/lists/PaginatedRecyclerAdapter$FooterHolder;->footerView:Lcom/vk/lists/FooterView;

    invoke-virtual {v0}, Lcom/vk/lists/FooterView;->showLoading()V

    .line 177
    :goto_0
    return-void

    .line 175
    :cond_0
    iget-object v0, p0, Lcom/vk/lists/PaginatedRecyclerAdapter$FooterHolder;->footerView:Lcom/vk/lists/FooterView;

    invoke-virtual {v0}, Lcom/vk/lists/FooterView;->showError()V

    goto :goto_0
.end method
