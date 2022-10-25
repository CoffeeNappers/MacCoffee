.class public Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;
.super Lcom/vkontakte/android/fragments/base/GridFragment;
.source "GiftCategoryFragment.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/fragments/base/GridFragment",
        "<",
        "Lcom/vkontakte/android/api/models/CatalogedGift;",
        ">;"
    }
.end annotation


# static fields
.field private static final ExtraBalance:Ljava/lang/String; = "balance"

.field private static final ExtraData:Ljava/lang/String; = "data"

.field private static final ExtraUsers:Ljava/lang/String; = "uids"


# instance fields
.field private mBalance:I

.field private mData:Lcom/vkontakte/android/api/models/GiftCategory;

.field private final mDecoration:Lcom/vkontakte/android/ui/recyclerview/FitGridItemDecoration;

.field private final mGiftCardPadding:Landroid/graphics/Rect;

.field private final mGiftSender:Lcom/vkontakte/android/functions/VoidF1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/functions/VoidF1",
            "<",
            "Lcom/vkontakte/android/api/models/CatalogedGift;",
            ">;"
        }
    .end annotation
.end field

.field private final mGiftsReceiver:Landroid/content/BroadcastReceiver;

.field private mItemMinSize:I

.field private mItemWidth:I

.field private mListPadding:I

.field private mTo:Lcom/vkontakte/android/UserProfile;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private mUsersTo:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 82
    const v0, 0x7fffffff

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/base/GridFragment;-><init>(I)V

    .line 43
    invoke-static {p0}, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;)Lcom/vkontakte/android/functions/VoidF1;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->mGiftSender:Lcom/vkontakte/android/functions/VoidF1;

    .line 44
    new-instance v0, Lcom/vkontakte/android/ui/recyclerview/FitGridItemDecoration;

    invoke-direct {v0}, Lcom/vkontakte/android/ui/recyclerview/FitGridItemDecoration;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->mDecoration:Lcom/vkontakte/android/ui/recyclerview/FitGridItemDecoration;

    .line 45
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->mGiftCardPadding:Landroid/graphics/Rect;

    .line 46
    new-instance v0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment$1;-><init>(Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->mGiftsReceiver:Landroid/content/BroadcastReceiver;

    .line 83
    const v0, 0x7f03023c

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->setLayout(I)V

    .line 84
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;)Lcom/vkontakte/android/api/models/GiftCategory;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->mData:Lcom/vkontakte/android/api/models/GiftCategory;

    return-object v0
.end method

.method static synthetic access$002(Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;Lcom/vkontakte/android/api/models/GiftCategory;)Lcom/vkontakte/android/api/models/GiftCategory;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;
    .param p1, "x1"    # Lcom/vkontakte/android/api/models/GiftCategory;

    .prologue
    .line 37
    iput-object p1, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->mData:Lcom/vkontakte/android/api/models/GiftCategory;

    return-object p1
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;)Lcom/vkontakte/android/UserProfile;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->mTo:Lcom/vkontakte/android/UserProfile;

    return-object v0
.end method

.method static synthetic access$200(Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;)Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;

    .prologue
    .line 37
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->getAdapter()Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;)Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;

    .prologue
    .line 37
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->getAdapter()Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400(Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;Ljava/lang/CharSequence;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;
    .param p1, "x1"    # Ljava/lang/CharSequence;

    .prologue
    .line 37
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->setTitle(Ljava/lang/CharSequence;)V

    return-void
.end method

.method static synthetic access$500(Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;Ljava/util/List;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;
    .param p1, "x1"    # Ljava/util/List;

    .prologue
    .line 37
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->onDataLoaded(Ljava/util/List;)V

    return-void
.end method

.method static synthetic access$600(Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;

    .prologue
    .line 37
    iget v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->mItemWidth:I

    return v0
.end method

.method static synthetic access$700(Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;)Lcom/vkontakte/android/functions/VoidF1;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->mGiftSender:Lcom/vkontakte/android/functions/VoidF1;

    return-object v0
.end method

.method static synthetic access$800(Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;

    .prologue
    .line 37
    iget v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->mItemMinSize:I

    return v0
.end method

.method static synthetic access$900(Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method public static start(Landroid/app/Activity;Lcom/vkontakte/android/UserProfile;Lcom/vkontakte/android/api/models/GiftCategory;I)V
    .locals 1
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "to"    # Lcom/vkontakte/android/UserProfile;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "category"    # Lcom/vkontakte/android/api/models/GiftCategory;
    .param p3, "balance"    # I

    .prologue
    .line 87
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 88
    .local v0, "users":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    if-eqz p1, :cond_0

    .line 89
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 91
    :cond_0
    invoke-static {p0, v0, p2, p3}, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->start(Landroid/app/Activity;Ljava/util/ArrayList;Lcom/vkontakte/android/api/models/GiftCategory;I)V

    .line 92
    return-void
.end method

.method public static start(Landroid/app/Activity;Ljava/util/ArrayList;Lcom/vkontakte/android/api/models/GiftCategory;I)V
    .locals 5
    .param p0, "activity"    # Landroid/app/Activity;
    .param p2, "category"    # Lcom/vkontakte/android/api/models/GiftCategory;
    .param p3, "balance"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;",
            "Lcom/vkontakte/android/api/models/GiftCategory;",
            "I)V"
        }
    .end annotation

    .prologue
    .line 95
    .local p1, "toUsers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 96
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v1, "uids"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 97
    const-string/jumbo v1, "data"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 98
    const-string/jumbo v1, "balance"

    invoke-virtual {v0, v1, p3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 99
    instance-of v1, p0, Lcom/vkontakte/android/TabletDialogActivity;

    if-eqz v1, :cond_0

    .line 100
    check-cast p0, Lcom/vkontakte/android/TabletDialogActivity;

    .end local p0    # "activity":Landroid/app/Activity;
    const-class v1, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;

    invoke-virtual {p0, v1, v0}, Lcom/vkontakte/android/TabletDialogActivity;->start(Ljava/lang/Class;Landroid/os/Bundle;)V

    .line 108
    :goto_0
    return-void

    .line 103
    .restart local p0    # "activity":Landroid/app/Activity;
    :cond_0
    new-instance v1, Lcom/vkontakte/android/navigation/Navigator;

    const-class v2, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;

    new-instance v3, Lcom/vkontakte/android/TabletDialogActivity$Builder;

    invoke-direct {v3}, Lcom/vkontakte/android/TabletDialogActivity$Builder;-><init>()V

    const v4, 0x7f0f005e

    .line 104
    invoke-virtual {v3, v4}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->windowBackgroundResource(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v3

    invoke-direct {v1, v2, v3, v0}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;Lcom/vkontakte/android/navigation/Navigator$ActivityNavigator;Landroid/os/Bundle;)V

    .line 106
    invoke-virtual {v1, p0}, Lcom/vkontakte/android/navigation/Navigator;->go(Landroid/content/Context;)Z

    goto :goto_0
.end method


# virtual methods
.method protected createAdapter()Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vkontakte/android/fragments/base/GridFragment",
            "<",
            "Lcom/vkontakte/android/api/models/CatalogedGift;",
            ">.GridAdapter<*>;"
        }
    .end annotation

    .prologue
    .line 175
    new-instance v0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment$3;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment$3;-><init>(Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;)V

    return-object v0
.end method

.method protected doLoadData(II)V
    .locals 2
    .param p1, "offset"    # I
    .param p2, "count"    # I

    .prologue
    .line 157
    new-instance v0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment$2;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment$2;-><init>(Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    .line 170
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment$2;->execPool([Ljava/lang/Object;)Lcom/vkontakte/android/background/AsyncTask;

    .line 171
    return-void
.end method

.method protected getColumnsCount()I
    .locals 12

    .prologue
    const v11, 0x3f19999a    # 0.6f

    .line 200
    iget-object v9, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v9}, Lme/grishka/appkit/views/UsableRecyclerView;->getHeight()I

    move-result v9

    iget v10, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->mListPadding:I

    sub-int v7, v9, v10

    .line 201
    .local v7, "screenHeight":I
    iget-object v9, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->mGiftCardPadding:Landroid/graphics/Rect;

    iget v9, v9, Landroid/graphics/Rect;->top:I

    const/high16 v10, 0x42200000    # 40.0f

    invoke-static {v10}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v10

    add-int v2, v9, v10

    .line 202
    .local v2, "heightExtra":I
    iget v9, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->mItemMinSize:I

    add-int v0, v9, v2

    .line 204
    .local v0, "giftMinHeight":I
    int-to-float v9, v7

    int-to-float v10, v0

    div-float v3, v9, v10

    .line 205
    .local v3, "initialCount":F
    float-to-int v9, v3

    int-to-float v9, v9

    sub-float v6, v3, v9

    .line 207
    .local v6, "remains":F
    iget v9, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->mItemMinSize:I

    iput v9, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->mItemWidth:I

    .line 209
    const/high16 v9, 0x3e800000    # 0.25f

    cmpg-float v9, v6, v9

    if-lez v9, :cond_0

    cmpl-float v9, v6, v11

    if-lez v9, :cond_1

    .line 210
    :cond_0
    const/high16 v9, 0x3f000000    # 0.5f

    sub-float v9, v3, v9

    float-to-int v9, v9

    int-to-float v9, v9

    add-float v3, v9, v11

    .line 211
    int-to-float v9, v7

    div-float/2addr v9, v3

    int-to-float v10, v2

    sub-float/2addr v9, v10

    float-to-int v9, v9

    iput v9, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->mItemWidth:I

    .line 214
    :cond_1
    iget-object v9, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v9}, Lme/grishka/appkit/views/UsableRecyclerView;->getWidth()I

    move-result v9

    iget v10, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->mListPadding:I

    sub-int/2addr v9, v10

    iget v10, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->mListPadding:I

    sub-int v4, v9, v10

    .line 215
    .local v4, "listWidth":I
    iget v9, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->mItemWidth:I

    iget-object v10, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->mGiftCardPadding:Landroid/graphics/Rect;

    iget v10, v10, Landroid/graphics/Rect;->left:I

    add-int/2addr v9, v10

    iget-object v10, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->mGiftCardPadding:Landroid/graphics/Rect;

    iget v10, v10, Landroid/graphics/Rect;->right:I

    add-int v1, v9, v10

    .line 216
    .local v1, "giftMinWidth":I
    div-int v5, v4, v1

    .line 217
    .local v5, "numColumns":I
    mul-int v9, v1, v5

    sub-int v9, v4, v9

    add-int/lit8 v10, v5, -0x1

    div-int v8, v9, v10

    .line 219
    .local v8, "space":I
    iget-object v9, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->mDecoration:Lcom/vkontakte/android/ui/recyclerview/FitGridItemDecoration;

    invoke-virtual {v9, v5, v8}, Lcom/vkontakte/android/ui/recyclerview/FitGridItemDecoration;->set(II)Lcom/vkontakte/android/ui/recyclerview/FitGridItemDecoration;

    .line 220
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->getAdapter()Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;

    move-result-object v9

    invoke-virtual {v9}, Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;->notifyDataSetChanged()V

    .line 221
    return v5
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "state"    # Landroid/os/Bundle;

    .prologue
    .line 149
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/base/GridFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 150
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->loaded:Z

    if-nez v0, :cond_0

    .line 151
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->loadData()V

    .line 153
    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 6
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v3, 0x0

    .line 112
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/base/GridFragment;->onCreate(Landroid/os/Bundle;)V

    .line 114
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f020080

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 115
    .local v0, "drawable":Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_0

    .line 116
    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->mGiftCardPadding:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    .line 118
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f090057

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->mGiftCardPadding:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->left:I

    sub-int/2addr v1, v2

    iput v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->mListPadding:I

    .line 119
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f09001d

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    iput v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->mItemMinSize:I

    .line 120
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "balance"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->mBalance:I

    .line 122
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "uids"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->mUsersTo:Ljava/util/ArrayList;

    .line 124
    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->mUsersTo:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_1

    .line 125
    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->mUsersTo:Ljava/util/ArrayList;

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/UserProfile;

    iput-object v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->mTo:Lcom/vkontakte/android/UserProfile;

    .line 128
    :cond_1
    invoke-virtual {p0, v3}, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->setRefreshEnabled(Z)V

    .line 129
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->mGiftsReceiver:Landroid/content/BroadcastReceiver;

    new-instance v3, Landroid/content/IntentFilter;

    const-string/jumbo v4, "com.vkontakte.android.ACTION_GIFT_SENT"

    invoke-direct {v3, v4}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const-string/jumbo v4, "com.vkontakte.android.permission.ACCESS_DATA"

    const/4 v5, 0x0

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 130
    return-void
.end method

.method protected onCreateCardDecorator()Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;
    .locals 2

    .prologue
    .line 134
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->mDecoration:Lcom/vkontakte/android/ui/recyclerview/FitGridItemDecoration;

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->removeItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 135
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->mDecoration:Lcom/vkontakte/android/ui/recyclerview/FitGridItemDecoration;

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 136
    const/4 v0, 0x0

    return-object v0
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 226
    invoke-super {p0}, Lcom/vkontakte/android/fragments/base/GridFragment;->onDestroy()V

    .line 227
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->mGiftsReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/app/Activity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 228
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 5
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 141
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/base/GridFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 142
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    iget v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->mListPadding:I

    iget v2, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->mListPadding:I

    iget v3, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->mListPadding:I

    iget v4, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->mListPadding:I

    invoke-virtual {v0, v1, v2, v3, v4}, Lme/grishka/appkit/views/UsableRecyclerView;->setPadding(IIII)V

    .line 143
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v0

    const v1, 0x7f02014f

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setNavigationIcon(I)V

    .line 144
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v0}, Landroid/support/v7/widget/Toolbar;->setNavigationOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 145
    return-void
.end method

.method sendGift(Lcom/vkontakte/android/api/models/CatalogedGift;)V
    .locals 3
    .param p1, "gift"    # Lcom/vkontakte/android/api/models/CatalogedGift;

    .prologue
    .line 231
    iget-boolean v0, p1, Lcom/vkontakte/android/api/models/CatalogedGift;->disabled:Z

    if-nez v0, :cond_0

    .line 232
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/TabletDialogActivity;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->mUsersTo:Ljava/util/ArrayList;

    iget v2, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->mBalance:I

    invoke-static {v0, v1, p1, v2}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->start(Landroid/app/Activity;Ljava/util/ArrayList;Lcom/vkontakte/android/api/models/CatalogedGift;I)V

    .line 236
    :goto_0
    return-void

    .line 234
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    iget-object v0, p1, Lcom/vkontakte/android/api/models/CatalogedGift;->gift:Lcom/vkontakte/android/api/models/Gift;

    iget-object v0, v0, Lcom/vkontakte/android/api/models/Gift;->stickers_product_id:Ljava/lang/Integer;

    if-nez v0, :cond_1

    const v0, 0x7f080287

    :goto_1
    const/4 v2, 0x0

    invoke-static {v1, v0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    :cond_1
    const v0, 0x7f08028b

    goto :goto_1
.end method
