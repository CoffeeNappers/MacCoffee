.class Lcom/vkontakte/android/fragments/stickers/StoreTabFragment$3;
.super Landroid/support/v7/widget/RecyclerView$OnScrollListener;
.source "StoreTabFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;

    .prologue
    .line 121
    iput-object p1, p0, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment$3;->this$0:Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$OnScrollListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onScrollStateChanged(Landroid/support/v7/widget/RecyclerView;I)V
    .locals 0
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "newState"    # I

    .prologue
    .line 124
    invoke-super {p0, p1, p2}, Landroid/support/v7/widget/RecyclerView$OnScrollListener;->onScrollStateChanged(Landroid/support/v7/widget/RecyclerView;I)V

    .line 125
    return-void
.end method

.method public onScrolled(Landroid/support/v7/widget/RecyclerView;II)V
    .locals 4
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "dx"    # I
    .param p3, "dy"    # I

    .prologue
    .line 129
    invoke-super {p0, p1, p2, p3}, Landroid/support/v7/widget/RecyclerView$OnScrollListener;->onScrolled(Landroid/support/v7/widget/RecyclerView;II)V

    .line 130
    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Landroid/support/v7/widget/RecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 131
    .local v0, "child":Landroid/view/View;
    if-eqz v0, :cond_0

    .line 132
    iget-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment$3;->this$0:Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;

    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment$3;->this$0:Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;->access$300(Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;)I

    move-result v3

    sub-int/2addr v2, v3

    invoke-static {v1, v2}, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;->access$202(Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;I)I

    .line 133
    iget-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment$3;->this$0:Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;->getTargetFragment()Landroid/app/Fragment;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/fragments/stickers/StickerStoreFragment;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment$3;->this$0:Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment$3;->this$0:Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;->access$200(Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;)I

    move-result v3

    invoke-virtual {v1, v2, v3}, Lcom/vkontakte/android/fragments/stickers/StickerStoreFragment;->moveHeader(Landroid/app/Fragment;I)V

    .line 135
    :cond_0
    return-void
.end method
