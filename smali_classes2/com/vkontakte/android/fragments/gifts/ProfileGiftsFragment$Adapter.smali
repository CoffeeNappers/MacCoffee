.class Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Adapter;
.super Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;
.source "ProfileGiftsFragment.java"

# interfaces
.implements Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration$Provider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Adapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/fragments/base/GridFragment",
        "<",
        "Lcom/vkontakte/android/api/models/GiftItem;",
        ">.GridAdapter<",
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/api/models/GiftItem;",
        ">;>;",
        "Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration$Provider;"
    }
.end annotation


# static fields
.field static final TYPE_FOOTER:I = 0x1

.field static final TYPE_ITEM:I


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;)V
    .locals 0

    .prologue
    .line 189
    iput-object p1, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;

    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;-><init>(Lcom/vkontakte/android/fragments/base/GridFragment;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;
    .param p2, "x1"    # Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$1;

    .prologue
    .line 189
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Adapter;-><init>(Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;)V

    return-void
.end method


# virtual methods
.method public drawAfter(I)Z
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 254
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Adapter;->split()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Adapter;->getItemViewType(I)I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getBlockType(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 228
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Adapter;->split()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 229
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Adapter;->getItemViewType(I)I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x2

    :goto_0
    or-int/lit8 v0, v0, 0x18

    .line 231
    :goto_1
    return v0

    .line 229
    :cond_0
    const/4 v0, 0x4

    goto :goto_0

    .line 231
    :cond_1
    const/16 v0, 0x1e

    goto :goto_1
.end method

.method public getImageCountForItem(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 217
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Adapter;->getItemViewType(I)I

    move-result v0

    if-nez v0, :cond_2

    .line 218
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Adapter;->split()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 219
    shr-int/lit8 p1, p1, 0x1

    .line 221
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->access$200(Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/models/GiftItem;

    iget-object v0, v0, Lcom/vkontakte/android/api/models/GiftItem;->from:Lcom/vkontakte/android/api/gifts/GiftsGet$UserProfile;

    if-eqz v0, :cond_1

    const/4 v0, 0x2

    .line 223
    :goto_0
    return v0

    .line 221
    :cond_1
    const/4 v0, 0x1

    goto :goto_0

    .line 223
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getImageURL(II)Ljava/lang/String;
    .locals 2
    .param p1, "position"    # I
    .param p2, "image"    # I

    .prologue
    .line 205
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Adapter;->getItemViewType(I)I

    move-result v1

    if-nez v1, :cond_2

    .line 206
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Adapter;->split()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 207
    shr-int/lit8 p1, p1, 0x1

    .line 209
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->access$100(Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/models/GiftItem;

    .line 210
    .local v0, "giftItem":Lcom/vkontakte/android/api/models/GiftItem;
    if-nez p2, :cond_1

    iget-object v1, v0, Lcom/vkontakte/android/api/models/GiftItem;->gift:Lcom/vkontakte/android/api/models/Gift;

    iget-object v1, v1, Lcom/vkontakte/android/api/models/Gift;->thumb_256:Ljava/lang/String;

    .line 212
    .end local v0    # "giftItem":Lcom/vkontakte/android/api/models/GiftItem;
    :goto_0
    return-object v1

    .line 210
    .restart local v0    # "giftItem":Lcom/vkontakte/android/api/models/GiftItem;
    :cond_1
    iget-object v1, v0, Lcom/vkontakte/android/api/models/GiftItem;->from:Lcom/vkontakte/android/api/gifts/GiftsGet$UserProfile;

    iget-object v1, v1, Lcom/vkontakte/android/api/gifts/GiftsGet$UserProfile;->photo:Ljava/lang/String;

    goto :goto_0

    .line 212
    .end local v0    # "giftItem":Lcom/vkontakte/android/api/models/GiftItem;
    :cond_2
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getItemCount()I
    .locals 2

    .prologue
    .line 236
    invoke-super {p0}, Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;->getItemCount()I

    move-result v1

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Adapter;->split()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    shl-int v0, v1, v0

    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getItemViewType(I)I
    .locals 2
    .param p1, "position"    # I

    .prologue
    const/4 v0, 0x1

    .line 241
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Adapter;->split()Z

    move-result v1

    if-eqz v1, :cond_0

    rem-int/lit8 v1, p1, 0x2

    if-ne v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .prologue
    .line 189
    check-cast p1, Lcom/vkontakte/android/ui/holder/RecyclerHolder;

    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Adapter;->onBindViewHolder(Lcom/vkontakte/android/ui/holder/RecyclerHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/vkontakte/android/ui/holder/RecyclerHolder;I)V
    .locals 1
    .param p2, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
            "<",
            "Lcom/vkontakte/android/api/models/GiftItem;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 246
    .local p1, "holder":Lcom/vkontakte/android/ui/holder/RecyclerHolder;, "Lcom/vkontakte/android/ui/holder/RecyclerHolder<Lcom/vkontakte/android/api/models/GiftItem;>;"
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Adapter;->split()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 247
    shr-int/lit8 p2, p2, 0x1

    .line 249
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;->onBindViewHolder(Lcom/vkontakte/android/ui/holder/RecyclerHolder;I)V

    .line 250
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 189
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Adapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/RecyclerHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/RecyclerHolder;
    .locals 2
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/ViewGroup;",
            "I)",
            "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
            "<",
            "Lcom/vkontakte/android/api/models/GiftItem;",
            ">;"
        }
    .end annotation

    .prologue
    .line 200
    if-nez p2, :cond_0

    new-instance v0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Holder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;

    invoke-direct {v0, v1, p1}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Holder;-><init>(Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;Landroid/view/ViewGroup;)V

    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$FooterHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;

    invoke-direct {v0, v1, p1}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$FooterHolder;-><init>(Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;Landroid/view/ViewGroup;)V

    goto :goto_0
.end method

.method split()Z
    .locals 1

    .prologue
    .line 195
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->mProfile:Lcom/vkontakte/android/UserProfile;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->mProfile:Lcom/vkontakte/android/UserProfile;

    iget v0, v0, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-static {v0}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->isReal()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
