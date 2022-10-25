.class public Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;
.super Lcom/vkontakte/android/fragments/base/GridFragment;
.source "ProfileGiftsFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$FooterHolder;,
        Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Holder;,
        Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Adapter;,
        Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Extra;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/fragments/base/GridFragment",
        "<",
        "Lcom/vkontakte/android/api/models/GiftItem;",
        ">;",
        "Landroid/view/View$OnClickListener;"
    }
.end annotation


# instance fields
.field final bottomDividerDecoration:Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration;

.field mLoadingPlaceholder:Landroid/graphics/drawable/Drawable;

.field mProfile:Lcom/vkontakte/android/UserProfile;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field mUserId:I


# direct methods
.method public constructor <init>()V
    .locals 5

    .prologue
    .line 52
    const/16 v0, 0x19

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/base/GridFragment;-><init>(I)V

    .line 44
    new-instance v1, Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->getAdapter()Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration$Provider;

    const/4 v2, 0x1

    const/high16 v3, 0x3f000000    # 0.5f

    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v2

    const/high16 v3, 0x26000000

    const/4 v4, 0x0

    invoke-direct {v1, v0, v2, v3, v4}, Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration;-><init>(Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration$Provider;III)V

    iput-object v1, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->bottomDividerDecoration:Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration;

    .line 53
    const v0, 0x7f03009d

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->setLayout(I)V

    .line 54
    return-void
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$200(Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$300(Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$400(Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$500(Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$600(Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method


# virtual methods
.method protected bridge synthetic createAdapter()Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;
    .locals 1

    .prologue
    .line 42
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->createAdapter()Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Adapter;

    move-result-object v0

    return-object v0
.end method

.method protected createAdapter()Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Adapter;
    .locals 2

    .prologue
    .line 115
    new-instance v0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Adapter;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Adapter;-><init>(Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$1;)V

    return-object v0
.end method

.method protected doLoadData(II)V
    .locals 2
    .param p1, "offset"    # I
    .param p2, "count"    # I

    .prologue
    .line 133
    new-instance v0, Lcom/vkontakte/android/api/gifts/GiftsGet;

    iget v1, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->mUserId:I

    invoke-direct {v0, v1, p1, p2}, Lcom/vkontakte/android/api/gifts/GiftsGet;-><init>(III)V

    new-instance v1, Lcom/vkontakte/android/api/SimpleListCallback;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/api/SimpleListCallback;-><init>(Lme/grishka/appkit/fragments/BaseRecyclerFragment;)V

    .line 134
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/gifts/GiftsGet;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 135
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    .line 136
    return-void
.end method

.method protected getColumnsCount()I
    .locals 1

    .prologue
    .line 120
    const/4 v0, 0x1

    return v0
.end method

.method synthetic lambda$onViewCreated$0(Landroid/view/View;Landroid/graphics/Rect;)V
    .locals 6
    .param p1, "child"    # Landroid/view/View;
    .param p2, "outRect"    # Landroid/graphics/Rect;

    .prologue
    .line 79
    iget-object v5, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v5, p1}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildViewHolder(Landroid/view/View;)Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    move-result-object v3

    .line 80
    .local v3, "rawHolder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v5

    iput v5, p2, Landroid/graphics/Rect;->left:I

    .line 81
    invoke-virtual {p1}, Landroid/view/View;->getRight()I

    move-result v5

    iput v5, p2, Landroid/graphics/Rect;->right:I

    .line 83
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v5

    iput v5, p2, Landroid/graphics/Rect;->top:I

    .line 84
    invoke-virtual {p1}, Landroid/view/View;->getBottom()I

    move-result v5

    iput v5, p2, Landroid/graphics/Rect;->bottom:I

    .line 86
    instance-of v5, v3, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Holder;

    if-eqz v5, :cond_0

    .line 87
    iget-object v5, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v5}, Lme/grishka/appkit/views/UsableRecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v1

    .line 88
    .local v1, "layoutManager":Landroid/support/v7/widget/RecyclerView$LayoutManager;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getChildCount()I

    move-result v5

    if-ge v0, v5, :cond_0

    .line 89
    invoke-virtual {v1, v0}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 90
    .local v4, "v":Landroid/view/View;
    if-ne v4, p1, :cond_1

    .line 91
    add-int/lit8 v5, v0, 0x1

    invoke-virtual {v1, v5}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 92
    .local v2, "nextChild":Landroid/view/View;
    if-eqz v2, :cond_1

    iget-object v5, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v5, v2}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildViewHolder(Landroid/view/View;)Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    move-result-object v5

    instance-of v5, v5, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$FooterHolder;

    if-eqz v5, :cond_1

    .line 93
    invoke-virtual {v2}, Landroid/view/View;->getBottom()I

    move-result v5

    iput v5, p2, Landroid/graphics/Rect;->bottom:I

    .line 99
    .end local v0    # "i":I
    .end local v1    # "layoutManager":Landroid/support/v7/widget/RecyclerView$LayoutManager;
    .end local v2    # "nextChild":Landroid/view/View;
    .end local v4    # "v":Landroid/view/View;
    :cond_0
    return-void

    .line 88
    .restart local v0    # "i":I
    .restart local v1    # "layoutManager":Landroid/support/v7/widget/RecyclerView$LayoutManager;
    .restart local v4    # "v":Landroid/view/View;
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method synthetic lambda$showGiftDeleteDialog$1(Lcom/vkontakte/android/api/models/GiftItem;Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "giftItem"    # Lcom/vkontakte/android/api/models/GiftItem;
    .param p2, "dialog"    # Landroid/content/DialogInterface;
    .param p3, "which"    # I

    .prologue
    .line 158
    new-instance v0, Lcom/vkontakte/android/api/gifts/GiftsDelete;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/api/gifts/GiftsDelete;-><init>(Lcom/vkontakte/android/api/models/GiftItem;)V

    new-instance v1, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$1;

    invoke-direct {v1, p0, p1}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$1;-><init>(Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;Lcom/vkontakte/android/api/models/GiftItem;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/gifts/GiftsDelete;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 167
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 168
    return-void
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "state"    # Landroid/os/Bundle;

    .prologue
    .line 125
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/base/GridFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 126
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->data:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 127
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->loadData()V

    .line 129
    :cond_1
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 173
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->mProfile:Lcom/vkontakte/android/UserProfile;

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->sendGiftTo(Lcom/vkontakte/android/UserProfile;)V

    .line 174
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 58
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/base/GridFragment;->onCreate(Landroid/os/Bundle;)V

    .line 59
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "user"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->mProfile:Lcom/vkontakte/android/UserProfile;

    .line 60
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->mProfile:Lcom/vkontakte/android/UserProfile;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v0

    :goto_0
    iput v0, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->mUserId:I

    .line 61
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f020139

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->mLoadingPlaceholder:Landroid/graphics/drawable/Drawable;

    .line 62
    return-void

    .line 60
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->mProfile:Lcom/vkontakte/android/UserProfile;

    iget v0, v0, Lcom/vkontakte/android/UserProfile;->uid:I

    goto :goto_0
.end method

.method protected onCreateCardDecorator()Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;
    .locals 7

    .prologue
    const/4 v5, 0x0

    .line 104
    new-instance v0, Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->getAdapter()Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;

    move-result-object v6

    iget-boolean v4, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->isTablet:Z

    if-nez v4, :cond_0

    const/4 v4, 0x1

    :goto_0
    invoke-direct {v0, v6, v4}, Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;-><init>(Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration$Provider;Z)V

    .line 105
    .local v0, "decorator":Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;
    const/high16 v4, 0x41000000    # 8.0f

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    .line 106
    .local v3, "paddingTop":I
    iget v4, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->scrW:I

    const/16 v6, 0x39c

    if-lt v4, v6, :cond_1

    const/16 v4, 0x10

    iget v6, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->scrW:I

    add-int/lit16 v6, v6, -0x348

    add-int/lit8 v6, v6, -0x54

    div-int/lit8 v6, v6, 0x2

    invoke-static {v4, v6}, Ljava/lang/Math;->max(II)I

    move-result v4

    int-to-float v4, v4

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    .line 107
    .local v2, "margin":I
    :goto_1
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v6, 0x7f090027

    invoke-virtual {v4, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    add-int v1, v2, v4

    .line 108
    .local v1, "dividerMargin":I
    iget-object v4, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v4, v2, v3, v2, v5}, Lme/grishka/appkit/views/UsableRecyclerView;->setPadding(IIII)V

    .line 109
    iget-object v4, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    iget-object v5, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->bottomDividerDecoration:Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration;

    invoke-virtual {v5, v1, v1}, Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration;->setPadding(II)Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration;

    move-result-object v5

    invoke-virtual {v4, v5}, Lme/grishka/appkit/views/UsableRecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 110
    invoke-virtual {v0, v3}, Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;->setCardsSpacing(I)Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;

    move-result-object v4

    return-object v4

    .end local v0    # "decorator":Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;
    .end local v1    # "dividerMargin":I
    .end local v2    # "margin":I
    .end local v3    # "paddingTop":I
    :cond_0
    move v4, v5

    .line 104
    goto :goto_0

    .restart local v0    # "decorator":Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;
    .restart local v3    # "paddingTop":I
    :cond_1
    move v2, v5

    .line 106
    goto :goto_1
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 4
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 66
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/base/GridFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 67
    iget v1, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->mUserId:I

    invoke-static {v1}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v1

    if-eqz v1, :cond_0

    const v1, 0x7f080291

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    :goto_0
    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->setTitle(Ljava/lang/CharSequence;)V

    .line 69
    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->contentView:Landroid/view/ViewGroup;

    const v2, 0x7f1001af

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 70
    .local v0, "fab":Landroid/widget/ImageView;
    iget v1, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->mUserId:I

    invoke-static {v1}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v1

    if-nez v1, :cond_1

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/VKAccount;->isReal()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 71
    new-instance v1, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f020155

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    const/4 v3, -0x1

    invoke-direct {v1, v2, v3}, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;-><init>(Landroid/graphics/drawable/Drawable;I)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 72
    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 77
    :goto_1
    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lme/grishka/appkit/views/UsableRecyclerView;->setDrawSelectorOnTop(Z)V

    .line 78
    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-static {p0}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;)Lme/grishka/appkit/views/UsableRecyclerView$SelectorBoundsProvider;

    move-result-object v2

    invoke-virtual {v1, v2}, Lme/grishka/appkit/views/UsableRecyclerView;->setSelectorBoundsProvider(Lme/grishka/appkit/views/UsableRecyclerView$SelectorBoundsProvider;)V

    .line 100
    return-void

    .line 67
    .end local v0    # "fab":Landroid/widget/ImageView;
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "title"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 74
    .restart local v0    # "fab":Landroid/widget/ImageView;
    :cond_1
    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 75
    invoke-virtual {v0}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->setBehavior(Landroid/support/design/widget/CoordinatorLayout$Behavior;)V

    goto :goto_1
.end method

.method openProfile(I)V
    .locals 2
    .param p1, "user_id"    # I

    .prologue
    .line 139
    new-instance v0, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;-><init>(I)V

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;->go(Landroid/content/Context;)Z

    .line 140
    return-void
.end method

.method sendGiftTo(Lcom/vkontakte/android/UserProfile;)V
    .locals 1
    .param p1, "profile"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    .line 143
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->start(Landroid/app/Activity;Lcom/vkontakte/android/UserProfile;)V

    .line 144
    return-void
.end method

.method showGiftDeleteDialog(Lcom/vkontakte/android/api/models/GiftItem;)V
    .locals 3
    .param p1, "giftItem"    # Lcom/vkontakte/android/api/models/GiftItem;

    .prologue
    .line 154
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f080176

    .line 155
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080285

    .line 156
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080798

    invoke-static {p0, p1}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;Lcom/vkontakte/android/api/models/GiftItem;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v2

    .line 157
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080433

    const/4 v2, 0x0

    .line 168
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 169
    return-void
.end method

.method showUsersGifts(Lcom/vkontakte/android/api/models/GiftItem;)V
    .locals 6
    .param p1, "giftItem"    # Lcom/vkontakte/android/api/models/GiftItem;

    .prologue
    .line 147
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 148
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v1, "user"

    iget-object v2, p1, Lcom/vkontakte/android/api/models/GiftItem;->from:Lcom/vkontakte/android/api/gifts/GiftsGet$UserProfile;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 149
    const-string/jumbo v1, "title"

    const v2, 0x7f080292

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v5, p1, Lcom/vkontakte/android/api/models/GiftItem;->from:Lcom/vkontakte/android/api/gifts/GiftsGet$UserProfile;

    iget-object v5, v5, Lcom/vkontakte/android/api/gifts/GiftsGet$UserProfile;->first_name_gen:Ljava/lang/String;

    aput-object v5, v3, v4

    invoke-virtual {p0, v2, v3}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 150
    const-class v1, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v1, v0, v2}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    .line 151
    return-void
.end method
