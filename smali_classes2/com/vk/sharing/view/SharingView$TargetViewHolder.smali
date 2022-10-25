.class final Lcom/vk/sharing/view/SharingView$TargetViewHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "SharingView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/sharing/view/SharingView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "TargetViewHolder"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/sharing/view/SharingView;

.field view:Lcom/vk/sharing/view/TargetView;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/vk/sharing/view/SharingView;Lcom/vk/sharing/view/TargetView;)V
    .locals 1
    .param p1    # Lcom/vk/sharing/view/SharingView;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "itemView"    # Lcom/vk/sharing/view/TargetView;

    .prologue
    .line 794
    iput-object p1, p0, Lcom/vk/sharing/view/SharingView$TargetViewHolder;->this$0:Lcom/vk/sharing/view/SharingView;

    .line 795
    invoke-direct {p0, p2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 796
    iput-object p2, p0, Lcom/vk/sharing/view/SharingView$TargetViewHolder;->view:Lcom/vk/sharing/view/TargetView;

    .line 797
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView$TargetViewHolder;->view:Lcom/vk/sharing/view/TargetView;

    invoke-virtual {v0, p0}, Lcom/vk/sharing/view/TargetView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 798
    return-void
.end method


# virtual methods
.method bind(Lcom/vk/sharing/target/Target;)V
    .locals 1
    .param p1, "target"    # Lcom/vk/sharing/target/Target;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 801
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView$TargetViewHolder;->view:Lcom/vk/sharing/view/TargetView;

    invoke-virtual {v0, p1}, Lcom/vk/sharing/view/TargetView;->setTarget(Lcom/vk/sharing/target/Target;)V

    .line 802
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 806
    iget-object v2, p0, Lcom/vk/sharing/view/SharingView$TargetViewHolder;->view:Lcom/vk/sharing/view/TargetView;

    invoke-virtual {v2}, Lcom/vk/sharing/view/TargetView;->getTarget()Lcom/vk/sharing/target/Target;

    move-result-object v1

    .line 807
    .local v1, "target":Lcom/vk/sharing/target/Target;
    invoke-virtual {p0}, Lcom/vk/sharing/view/SharingView$TargetViewHolder;->getAdapterPosition()I

    move-result v0

    .line 808
    .local v0, "position":I
    if-eqz v1, :cond_0

    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    iget-object v2, p0, Lcom/vk/sharing/view/SharingView$TargetViewHolder;->this$0:Lcom/vk/sharing/view/SharingView;

    iget-object v2, v2, Lcom/vk/sharing/view/SharingView;->presenter:Lcom/vk/sharing/view/SharingView$Presenter;

    if-eqz v2, :cond_0

    .line 809
    iget-object v2, p0, Lcom/vk/sharing/view/SharingView$TargetViewHolder;->this$0:Lcom/vk/sharing/view/SharingView;

    iget-object v2, v2, Lcom/vk/sharing/view/SharingView;->presenter:Lcom/vk/sharing/view/SharingView$Presenter;

    invoke-interface {v2, v1, v0}, Lcom/vk/sharing/view/SharingView$Presenter;->onListItemClick(Lcom/vk/sharing/target/Target;I)V

    .line 811
    :cond_0
    return-void
.end method
