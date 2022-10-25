.class Lcom/vkontakte/android/fragments/FilterListFragment$Adapter;
.super Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;
.source "FilterListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/FilterListFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Adapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/fragments/base/SegmenterFragment",
        "<",
        "Lcom/vkontakte/android/UserProfile;",
        ">.GridAdapter<",
        "Lcom/vkontakte/android/UserProfile;",
        "Lcom/vkontakte/android/ui/holder/UserHolder",
        "<",
        "Lcom/vkontakte/android/UserProfile;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/FilterListFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/FilterListFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/FilterListFragment;

    .prologue
    .line 141
    iput-object p1, p0, Lcom/vkontakte/android/fragments/FilterListFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/FilterListFragment;

    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;-><init>(Lcom/vkontakte/android/fragments/base/SegmenterFragment;)V

    return-void
.end method


# virtual methods
.method public bindHeaderHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;Lcom/tonicartos/superslim/GridSLM$LayoutParams;I)V
    .locals 0
    .param p1, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p2, "params"    # Lcom/tonicartos/superslim/GridSLM$LayoutParams;
    .param p3, "position"    # I

    .prologue
    .line 156
    invoke-super {p0, p1, p2, p3}, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->bindHeaderHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;Lcom/tonicartos/superslim/GridSLM$LayoutParams;I)V

    .line 157
    invoke-virtual {p0, p2}, Lcom/vkontakte/android/fragments/FilterListFragment$Adapter;->adjustMultiColumn(Lcom/tonicartos/superslim/GridSLM$LayoutParams;)V

    .line 158
    return-void
.end method

.method public bridge synthetic bindViewHolder(Lcom/vkontakte/android/ui/holder/RecyclerHolder;Lcom/tonicartos/superslim/GridSLM$LayoutParams;I)V
    .locals 0

    .prologue
    .line 141
    check-cast p1, Lcom/vkontakte/android/ui/holder/UserHolder;

    invoke-virtual {p0, p1, p2, p3}, Lcom/vkontakte/android/fragments/FilterListFragment$Adapter;->bindViewHolder(Lcom/vkontakte/android/ui/holder/UserHolder;Lcom/tonicartos/superslim/GridSLM$LayoutParams;I)V

    return-void
.end method

.method public bindViewHolder(Lcom/vkontakte/android/ui/holder/UserHolder;Lcom/tonicartos/superslim/GridSLM$LayoutParams;I)V
    .locals 0
    .param p2, "params"    # Lcom/tonicartos/superslim/GridSLM$LayoutParams;
    .param p3, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/ui/holder/UserHolder",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;",
            "Lcom/tonicartos/superslim/GridSLM$LayoutParams;",
            "I)V"
        }
    .end annotation

    .prologue
    .line 150
    .local p1, "holder":Lcom/vkontakte/android/ui/holder/UserHolder;, "Lcom/vkontakte/android/ui/holder/UserHolder<Lcom/vkontakte/android/UserProfile;>;"
    invoke-super {p0, p1, p2, p3}, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->bindViewHolder(Lcom/vkontakte/android/ui/holder/RecyclerHolder;Lcom/tonicartos/superslim/GridSLM$LayoutParams;I)V

    .line 151
    invoke-virtual {p0, p2}, Lcom/vkontakte/android/fragments/FilterListFragment$Adapter;->adjustMultiColumn(Lcom/tonicartos/superslim/GridSLM$LayoutParams;)V

    .line 152
    return-void
.end method

.method public bridge synthetic createViewHolder(Landroid/view/ViewGroup;)Lcom/vkontakte/android/ui/holder/RecyclerHolder;
    .locals 1

    .prologue
    .line 141
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/FilterListFragment$Adapter;->createViewHolder(Landroid/view/ViewGroup;)Lcom/vkontakte/android/ui/holder/UserHolder;

    move-result-object v0

    return-object v0
.end method

.method public createViewHolder(Landroid/view/ViewGroup;)Lcom/vkontakte/android/ui/holder/UserHolder;
    .locals 2
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/ViewGroup;",
            ")",
            "Lcom/vkontakte/android/ui/holder/UserHolder",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation

    .prologue
    .line 145
    const v0, 0x7f030220

    invoke-static {p1, v0}, Lcom/vkontakte/android/ui/holder/UserHolder;->actionable(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/UserHolder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/FilterListFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/FilterListFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/FilterListFragment;->access$300(Lcom/vkontakte/android/fragments/FilterListFragment;)Lcom/vkontakte/android/functions/VoidF1;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/holder/UserHolder;->onAction(Lcom/vkontakte/android/functions/VoidF1;)Lcom/vkontakte/android/ui/holder/UserHolder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/FilterListFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/FilterListFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/FilterListFragment;->access$200(Lcom/vkontakte/android/fragments/FilterListFragment;)Lcom/vkontakte/android/functions/VoidF1;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/holder/UserHolder;->onClick(Lcom/vkontakte/android/functions/VoidF1;)Lcom/vkontakte/android/ui/holder/UserHolder;

    move-result-object v0

    return-object v0
.end method

.method public getImageUrl(II)Ljava/lang/String;
    .locals 1
    .param p1, "position"    # I
    .param p2, "image"    # I

    .prologue
    .line 162
    const/4 v0, 0x0

    return-object v0
.end method

.method public getImagesCountForItem(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 167
    const/4 v0, 0x0

    return v0
.end method
