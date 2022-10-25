.class final Lcom/vk/sharing/view/SharingView$TargetsAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "SharingView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/sharing/view/SharingView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "TargetsAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v7/widget/RecyclerView$Adapter",
        "<",
        "Lcom/vk/sharing/view/SharingView$TargetViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/sharing/view/SharingView;


# direct methods
.method private constructor <init>(Lcom/vk/sharing/view/SharingView;)V
    .locals 0

    .prologue
    .line 771
    iput-object p1, p0, Lcom/vk/sharing/view/SharingView$TargetsAdapter;->this$0:Lcom/vk/sharing/view/SharingView;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vk/sharing/view/SharingView;Lcom/vk/sharing/view/SharingView$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vk/sharing/view/SharingView;
    .param p2, "x1"    # Lcom/vk/sharing/view/SharingView$1;

    .prologue
    .line 771
    invoke-direct {p0, p1}, Lcom/vk/sharing/view/SharingView$TargetsAdapter;-><init>(Lcom/vk/sharing/view/SharingView;)V

    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    .prologue
    .line 785
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView$TargetsAdapter;->this$0:Lcom/vk/sharing/view/SharingView;

    invoke-static {v0}, Lcom/vk/sharing/view/SharingView;->access$100(Lcom/vk/sharing/view/SharingView;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0
    .param p1    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 771
    check-cast p1, Lcom/vk/sharing/view/SharingView$TargetViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/vk/sharing/view/SharingView$TargetsAdapter;->onBindViewHolder(Lcom/vk/sharing/view/SharingView$TargetViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/vk/sharing/view/SharingView$TargetViewHolder;I)V
    .locals 1
    .param p1, "holder"    # Lcom/vk/sharing/view/SharingView$TargetViewHolder;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "position"    # I

    .prologue
    .line 780
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView$TargetsAdapter;->this$0:Lcom/vk/sharing/view/SharingView;

    invoke-static {v0}, Lcom/vk/sharing/view/SharingView;->access$100(Lcom/vk/sharing/view/SharingView;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/sharing/target/Target;

    invoke-virtual {p1, v0}, Lcom/vk/sharing/view/SharingView$TargetViewHolder;->bind(Lcom/vk/sharing/target/Target;)V

    .line 781
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 771
    invoke-virtual {p0, p1, p2}, Lcom/vk/sharing/view/SharingView$TargetsAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vk/sharing/view/SharingView$TargetViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vk/sharing/view/SharingView$TargetViewHolder;
    .locals 4
    .param p1, "parent"    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "viewType"    # I

    .prologue
    .line 775
    new-instance v0, Lcom/vk/sharing/view/SharingView$TargetViewHolder;

    iget-object v1, p0, Lcom/vk/sharing/view/SharingView$TargetsAdapter;->this$0:Lcom/vk/sharing/view/SharingView;

    new-instance v2, Lcom/vk/sharing/view/TargetView;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/vk/sharing/view/TargetView;-><init>(Landroid/content/Context;)V

    invoke-direct {v0, v1, v2}, Lcom/vk/sharing/view/SharingView$TargetViewHolder;-><init>(Lcom/vk/sharing/view/SharingView;Lcom/vk/sharing/view/TargetView;)V

    return-object v0
.end method
