.class Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment$Adapter;
.super Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;
.source "GroupMembersListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;
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


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;)V
    .locals 0

    .prologue
    .line 182
    iput-object p1, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;

    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;-><init>(Lcom/vkontakte/android/fragments/base/SegmenterFragment;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;
    .param p2, "x1"    # Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment$1;

    .prologue
    .line 182
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment$Adapter;-><init>(Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;)V

    return-void
.end method


# virtual methods
.method public bindHeaderHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;Lcom/tonicartos/superslim/GridSLM$LayoutParams;I)V
    .locals 0
    .param p1, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p2, "params"    # Lcom/tonicartos/superslim/GridSLM$LayoutParams;
    .param p3, "position"    # I

    .prologue
    .line 218
    return-void
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
    .line 201
    .local p1, "holder":Lcom/vkontakte/android/ui/holder/RecyclerHolder;, "Lcom/vkontakte/android/ui/holder/RecyclerHolder<Lcom/vkontakte/android/UserProfile;>;"
    invoke-super {p0, p1, p2, p3}, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->bindViewHolder(Lcom/vkontakte/android/ui/holder/RecyclerHolder;Lcom/tonicartos/superslim/GridSLM$LayoutParams;I)V

    .line 202
    invoke-virtual {p0, p2}, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment$Adapter;->adjustMultiColumn(Lcom/tonicartos/superslim/GridSLM$LayoutParams;)V

    .line 203
    return-void
.end method

.method public createHeaderHolder(Landroid/view/ViewGroup;)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 3
    .param p1, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 207
    new-instance v0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment$Adapter$1;

    new-instance v1, Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment$Adapter$1;-><init>(Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment$Adapter;Landroid/view/View;)V

    return-object v0
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
    .line 186
    invoke-static {p1}, Lcom/vkontakte/android/ui/holder/UserHolder;->simple(Landroid/view/ViewGroup;)Lcom/vkontakte/android/ui/holder/UserHolder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->access$600(Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;)Lcom/vkontakte/android/functions/VoidF1;

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
    .line 196
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment$Adapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    return-object v0
.end method

.method public getImagesCountForItem(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 191
    const/4 v0, 0x0

    return v0
.end method
