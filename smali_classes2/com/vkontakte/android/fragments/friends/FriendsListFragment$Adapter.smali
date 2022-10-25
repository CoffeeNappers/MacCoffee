.class Lcom/vkontakte/android/fragments/friends/FriendsListFragment$Adapter;
.super Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;
.source "FriendsListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/friends/FriendsListFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Adapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/fragments/base/SegmenterFragment",
        "<",
        "Lcom/vkontakte/android/UserProfile;",
        ">.GridAdapter<",
        "Lcom/vkontakte/android/UserProfile;",
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/UserProfile;",
        ">;>;"
    }
.end annotation


# static fields
.field private static final TYPE_CUSTOM_HEADER:I = 0x4

.field private static final TYPE_CUSTOM_ITEM:I = 0x3


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)V
    .locals 0

    .prologue
    .line 648
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment$Adapter;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment<TT;>.Adapter;"
    iput-object p1, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;-><init>(Lcom/vkontakte/android/fragments/base/SegmenterFragment;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;Lcom/vkontakte/android/fragments/friends/FriendsListFragment$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsListFragment;
    .param p2, "x1"    # Lcom/vkontakte/android/fragments/friends/FriendsListFragment$1;

    .prologue
    .line 648
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment$Adapter;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment<TT;>.Adapter;"
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$Adapter;-><init>(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)V

    return-void
.end method

.method private getFirstHeaderTitle()Ljava/lang/String;
    .locals 2

    .prologue
    .line 749
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment$Adapter;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment<TT;>.Adapter;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->access$2500(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    const v1, 0x7f080318

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    const v1, 0x7f08023b

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method


# virtual methods
.method protected adjustCustomColumn(Lcom/tonicartos/superslim/GridSLM$LayoutParams;)V
    .locals 2
    .param p1, "params"    # Lcom/tonicartos/superslim/GridSLM$LayoutParams;

    .prologue
    .line 767
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment$Adapter;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment<TT;>.Adapter;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->access$2700(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)I

    move-result v0

    const/16 v1, 0x320

    if-lt v0, v1, :cond_0

    .line 768
    const/high16 v0, 0x43870000    # 270.0f

    invoke-static {v0}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/tonicartos/superslim/GridSLM$LayoutParams;->setColumnWidth(I)V

    .line 769
    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Lcom/tonicartos/superslim/GridSLM$LayoutParams;->setNumColumns(I)V

    .line 773
    :goto_0
    return-void

    .line 771
    :cond_0
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/tonicartos/superslim/GridSLM$LayoutParams;->setNumColumns(I)V

    goto :goto_0
.end method

.method public bindCustomViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;Lcom/tonicartos/superslim/GridSLM$LayoutParams;I)V
    .locals 5
    .param p1, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p2, "params"    # Lcom/tonicartos/superslim/GridSLM$LayoutParams;
    .param p3, "position"    # I

    .prologue
    .line 710
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment$Adapter;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment<TT;>.Adapter;"
    invoke-virtual {p0, p3}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$Adapter;->getItemViewType(I)I

    move-result v2

    .line 711
    .local v2, "type":I
    const/4 v3, 0x3

    if-ne v2, v3, :cond_1

    .line 712
    instance-of v3, p1, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;

    if-eqz v3, :cond_0

    .line 713
    check-cast p1, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;

    .end local p1    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    invoke-virtual {p0, p3}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$Adapter;->getItem(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/RequestUserProfile;

    invoke-virtual {p1, v3}, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->bind(Ljava/lang/Object;)V

    .line 728
    :cond_0
    :goto_0
    return-void

    .line 715
    .restart local p1    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    :cond_1
    const/4 v3, 0x4

    if-ne v2, v3, :cond_0

    .line 716
    instance-of v3, p1, Lcom/vkontakte/android/fragments/friends/RequestHeaderHolder;

    if-eqz v3, :cond_2

    move-object v0, p1

    .line 717
    check-cast v0, Lcom/vkontakte/android/fragments/friends/RequestHeaderHolder;

    .line 718
    .local v0, "headerHolder":Lcom/vkontakte/android/fragments/friends/RequestHeaderHolder;
    iget-object v3, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->access$1100(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    .line 719
    .local v1, "suggestions":Z
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/friends/RequestHeaderHolder;->setShowSuggestions(Z)V

    .line 720
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    if-eqz v1, :cond_3

    const v3, 0x7f08023a

    :goto_1
    invoke-virtual {v4, v3}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/vkontakte/android/fragments/friends/RequestHeaderHolder;->bind(Ljava/lang/Object;)V

    .line 721
    iget-object v3, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->access$1200(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)I

    move-result v3

    invoke-virtual {v0, v3}, Lcom/vkontakte/android/fragments/friends/RequestHeaderHolder;->setRequestsCount(I)V

    .line 723
    .end local v0    # "headerHolder":Lcom/vkontakte/android/fragments/friends/RequestHeaderHolder;
    .end local v1    # "suggestions":Z
    :cond_2
    iget-object v3, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    const/4 v4, -0x1

    invoke-virtual {v3, v4}, Landroid/view/View;->setBackgroundColor(I)V

    .line 724
    const/4 v3, 0x1

    iput-boolean v3, p2, Lcom/tonicartos/superslim/GridSLM$LayoutParams;->isHeader:Z

    .line 725
    const/16 v3, 0x11

    iput v3, p2, Lcom/tonicartos/superslim/GridSLM$LayoutParams;->headerDisplay:I

    .line 726
    invoke-virtual {p0, p2}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$Adapter;->adjustCustomColumn(Lcom/tonicartos/superslim/GridSLM$LayoutParams;)V

    goto :goto_0

    .line 720
    .restart local v0    # "headerHolder":Lcom/vkontakte/android/fragments/friends/RequestHeaderHolder;
    .restart local v1    # "suggestions":Z
    :cond_3
    const v3, 0x7f080627

    goto :goto_1
.end method

.method public bindHeaderHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;Lcom/tonicartos/superslim/GridSLM$LayoutParams;I)V
    .locals 5
    .param p1, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p2, "params"    # Lcom/tonicartos/superslim/GridSLM$LayoutParams;
    .param p3, "position"    # I

    .prologue
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment$Adapter;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment<TT;>.Adapter;"
    const/4 v4, 0x1

    .line 732
    move-object v0, p1

    check-cast v0, Lcom/vkontakte/android/fragments/friends/HeaderHolder;

    .line 733
    .local v0, "headerHolder":Lcom/vkontakte/android/fragments/friends/HeaderHolder;
    iget-object v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->access$1900(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Z

    move-result v2

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->access$2400(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 734
    :cond_0
    invoke-virtual {p0, p3}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$Adapter;->getPopupText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/vkontakte/android/fragments/friends/HeaderHolder;->bind(Ljava/lang/Object;)V

    .line 741
    :goto_0
    iget-object v2, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    const/4 v3, -0x1

    invoke-virtual {v2, v3}, Landroid/view/View;->setBackgroundColor(I)V

    .line 742
    iput-boolean v4, p2, Lcom/tonicartos/superslim/GridSLM$LayoutParams;->isHeader:Z

    .line 743
    const/16 v2, 0x11

    iput v2, p2, Lcom/tonicartos/superslim/GridSLM$LayoutParams;->headerDisplay:I

    .line 745
    invoke-virtual {p0, p2}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$Adapter;->adjustMultiColumn(Lcom/tonicartos/superslim/GridSLM$LayoutParams;)V

    .line 746
    return-void

    .line 735
    :cond_1
    iget-object v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->access$1000(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 736
    if-nez p3, :cond_2

    invoke-direct {p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$Adapter;->getFirstHeaderTitle()Ljava/lang/String;

    move-result-object v2

    :goto_1
    invoke-virtual {v0, v2}, Lcom/vkontakte/android/fragments/friends/HeaderHolder;->bind(Ljava/lang/Object;)V

    goto :goto_0

    :cond_2
    invoke-virtual {p0, p3}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$Adapter;->getPopupText(I)Ljava/lang/CharSequence;

    move-result-object v2

    goto :goto_1

    .line 738
    :cond_3
    iget-object v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$Adapter;->mSegmenter:Lcom/vkontakte/android/ui/util/Segmenter;

    invoke-interface {v2, p3}, Lcom/vkontakte/android/ui/util/Segmenter;->getSegmentForPosition(I)I

    move-result v1

    .line 739
    .local v1, "segmentIndex":I
    if-ne v1, v4, :cond_4

    invoke-direct {p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$Adapter;->getFirstHeaderTitle()Ljava/lang/String;

    move-result-object v2

    :goto_2
    invoke-virtual {v0, v2}, Lcom/vkontakte/android/fragments/friends/HeaderHolder;->bind(Ljava/lang/Object;)V

    goto :goto_0

    :cond_4
    invoke-virtual {p0, p3}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$Adapter;->getPopupText(I)Ljava/lang/CharSequence;

    move-result-object v2

    goto :goto_2
.end method

.method public bindViewHolder(Lcom/vkontakte/android/ui/holder/RecyclerHolder;Lcom/tonicartos/superslim/GridSLM$LayoutParams;I)V
    .locals 0
    .param p2, "params"    # Lcom/tonicartos/superslim/GridSLM$LayoutParams;
    .param p3, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;",
            "Lcom/tonicartos/superslim/GridSLM$LayoutParams;",
            "I)V"
        }
    .end annotation

    .prologue
    .line 704
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment$Adapter;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment<TT;>.Adapter;"
    .local p1, "holder":Lcom/vkontakte/android/ui/holder/RecyclerHolder;, "Lcom/vkontakte/android/ui/holder/RecyclerHolder<Lcom/vkontakte/android/UserProfile;>;"
    invoke-super {p0, p1, p2, p3}, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->bindViewHolder(Lcom/vkontakte/android/ui/holder/RecyclerHolder;Lcom/tonicartos/superslim/GridSLM$LayoutParams;I)V

    .line 705
    invoke-virtual {p0, p2}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$Adapter;->adjustMultiColumn(Lcom/tonicartos/superslim/GridSLM$LayoutParams;)V

    .line 706
    return-void
.end method

.method public createViewHolder(Landroid/view/ViewGroup;)Lcom/vkontakte/android/ui/holder/RecyclerHolder;
    .locals 2
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/ViewGroup;",
            ")",
            "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation

    .prologue
    .line 677
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment$Adapter;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment<TT;>.Adapter;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->access$400(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Lcom/vkontakte/android/functions/VoidF1;

    move-result-object v0

    if-nez v0, :cond_0

    .line 678
    invoke-static {p1}, Lcom/vkontakte/android/ui/holder/UserHolder;->simple(Landroid/view/ViewGroup;)Lcom/vkontakte/android/ui/holder/UserHolder;

    move-result-object v0

    .line 679
    :goto_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->access$2300(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Lcom/vkontakte/android/functions/VoidF1;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/holder/UserHolder;->onClick(Lcom/vkontakte/android/functions/VoidF1;)Lcom/vkontakte/android/ui/holder/UserHolder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->access$2200(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Lcom/vkontakte/android/functions/VoidF1Bool;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/holder/UserHolder;->onCheck(Lcom/vkontakte/android/functions/VoidF1Bool;)Lcom/vkontakte/android/ui/holder/UserHolder;

    move-result-object v0

    return-object v0

    :cond_0
    invoke-static {p1}, Lcom/vkontakte/android/ui/holder/UserHolder;->checkable(Landroid/view/ViewGroup;)Lcom/vkontakte/android/ui/holder/UserHolder;

    move-result-object v0

    goto :goto_0
.end method

.method public getBlockType(I)I
    .locals 4
    .param p1, "position"    # I

    .prologue
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment$Adapter;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment<TT;>.Adapter;"
    const/4 v2, 0x4

    const/4 v1, 0x1

    .line 754
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$Adapter;->getItemViewType(I)I

    move-result v0

    .line 755
    .local v0, "type":I
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$Adapter;->getItemCount()I

    move-result v3

    if-ge p1, v3, :cond_0

    if-gez p1, :cond_1

    .line 762
    :cond_0
    :goto_0
    return v1

    .line 757
    :cond_1
    iget-object v3, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->access$2600(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Z

    move-result v3

    if-nez v3, :cond_2

    if-nez p1, :cond_2

    .line 758
    if-ne v0, v2, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    .line 759
    :cond_2
    const/4 v1, 0x3

    if-ne v0, v1, :cond_3

    add-int/lit8 v1, p1, 0x1

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$Adapter;->getItemViewType(I)I

    move-result v1

    if-nez v1, :cond_3

    move v1, v2

    .line 760
    goto :goto_0

    .line 762
    :cond_3
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->getBlockType(I)I

    move-result v1

    goto :goto_0
.end method

.method public getImageCountForItem(I)I
    .locals 3
    .param p1, "position"    # I

    .prologue
    .line 684
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment$Adapter;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment<TT;>.Adapter;"
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$Adapter;->getItemViewType(I)I

    move-result v1

    const/4 v2, 0x3

    if-ne v1, v2, :cond_1

    .line 685
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$Adapter;->getItem(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/RequestUserProfile;

    iget-object v0, v1, Lcom/vkontakte/android/RequestUserProfile;->mutualFriends:[Lcom/vkontakte/android/UserProfile;

    .line 686
    .local v0, "mutual":[Lcom/vkontakte/android/UserProfile;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    :goto_0
    add-int/lit8 v1, v1, 0x1

    .line 688
    .end local v0    # "mutual":[Lcom/vkontakte/android/UserProfile;
    :goto_1
    return v1

    .line 686
    .restart local v0    # "mutual":[Lcom/vkontakte/android/UserProfile;
    :cond_0
    array-length v1, v0

    goto :goto_0

    .line 688
    .end local v0    # "mutual":[Lcom/vkontakte/android/UserProfile;
    :cond_1
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->getImageCountForItem(I)I

    move-result v1

    goto :goto_1
.end method

.method public getImageUrl(II)Ljava/lang/String;
    .locals 3
    .param p1, "position"    # I
    .param p2, "image"    # I

    .prologue
    .line 694
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment$Adapter;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment<TT;>.Adapter;"
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$Adapter;->getItemViewType(I)I

    move-result v1

    const/4 v2, 0x3

    if-ne v1, v2, :cond_1

    .line 695
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$Adapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/RequestUserProfile;

    .line 696
    .local v0, "profile":Lcom/vkontakte/android/RequestUserProfile;
    if-nez p2, :cond_0

    iget-object v1, v0, Lcom/vkontakte/android/RequestUserProfile;->photo:Ljava/lang/String;

    .line 698
    .end local v0    # "profile":Lcom/vkontakte/android/RequestUserProfile;
    :goto_0
    return-object v1

    .line 696
    .restart local v0    # "profile":Lcom/vkontakte/android/RequestUserProfile;
    :cond_0
    iget-object v1, v0, Lcom/vkontakte/android/RequestUserProfile;->mutualFriends:[Lcom/vkontakte/android/UserProfile;

    add-int/lit8 p2, p2, -0x1

    aget-object v1, v1, p2

    iget-object v1, v1, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    goto :goto_0

    .line 698
    .end local v0    # "profile":Lcom/vkontakte/android/RequestUserProfile;
    :cond_1
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$Adapter;->getItem(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/UserProfile;

    iget-object v1, v1, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    goto :goto_0
.end method

.method public getItemViewType(I)I
    .locals 3
    .param p1, "position"    # I

    .prologue
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment$Adapter;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment<TT;>.Adapter;"
    const/4 v2, 0x1

    .line 654
    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->access$1000(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Z

    move-result v1

    if-eqz v1, :cond_0

    if-gt p1, v2, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->access$1900(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 655
    :cond_0
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->getItemViewType(I)I

    move-result v0

    .line 658
    :cond_1
    :goto_0
    return v0

    .line 657
    :cond_2
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->getItemViewType(I)I

    move-result v0

    .line 658
    .local v0, "type":I
    if-nez v0, :cond_3

    if-nez p1, :cond_3

    const/4 v0, 0x4

    goto :goto_0

    :cond_3
    if-ne v0, v2, :cond_1

    const/4 v0, 0x3

    goto :goto_0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 3
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 666
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment$Adapter;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment<TT;>.Adapter;"
    const/4 v0, 0x3

    if-ne p2, v0, :cond_0

    .line 667
    new-instance v0, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;-><init>(Landroid/view/ViewGroup;)V

    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->access$2000(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Lcom/vkontakte/android/functions/VoidF1;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->access$2100(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Lcom/vkontakte/android/functions/VoidF2Int;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->attach(Lcom/vkontakte/android/functions/VoidF1;Lcom/vkontakte/android/functions/VoidF2Int;)Lcom/vkontakte/android/ui/holder/FriendRequestHolder;

    move-result-object v0

    .line 671
    :goto_0
    return-object v0

    .line 668
    :cond_0
    const/4 v0, 0x4

    if-ne p2, v0, :cond_1

    .line 669
    new-instance v0, Lcom/vkontakte/android/fragments/friends/RequestHeaderHolder;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/fragments/friends/RequestHeaderHolder;-><init>(Landroid/view/ViewGroup;)V

    goto :goto_0

    .line 671
    :cond_1
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v0

    goto :goto_0
.end method
