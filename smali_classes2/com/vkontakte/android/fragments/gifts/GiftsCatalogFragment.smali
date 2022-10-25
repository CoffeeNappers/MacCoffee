.class public Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;
.super Lcom/vkontakte/android/fragments/base/GridFragment;
.source "GiftsCatalogFragment.java"

# interfaces
.implements Lcom/vk/attachpicker/SupportExternalToolbarContainer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$FooterHolder;,
        Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder;,
        Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$HeaderHolder;,
        Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$Adapter;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/fragments/base/GridFragment",
        "<",
        "Lcom/vkontakte/android/api/models/GiftCategory;",
        ">;",
        "Lcom/vk/attachpicker/SupportExternalToolbarContainer;"
    }
.end annotation


# static fields
.field public static final ExtraUsers:Ljava/lang/String; = "users"

.field private static final GIFTS_DECORATION:Lcom/vkontakte/android/ui/recyclerview/SpaceItemDecoration;

.field private static final GIFTS_SPACING:I


# instance fields
.field private mBalance:Landroid/widget/TextView;

.field private final mDecoration:Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration;

.field private final mGiftCardPadding:Landroid/graphics/Rect;

.field private mGiftMinSize:I

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

.field private mGiftsWidth:I

.field private mListHeight:I

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

.field private mVotes:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 60
    const/high16 v0, 0x41000000    # 8.0f

    invoke-static {v0}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v0

    sput v0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->GIFTS_SPACING:I

    .line 61
    new-instance v0, Lcom/vkontakte/android/ui/recyclerview/SpaceItemDecoration;

    sget v1, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->GIFTS_SPACING:I

    invoke-direct {v0, v2, v2, v1, v2}, Lcom/vkontakte/android/ui/recyclerview/SpaceItemDecoration;-><init>(IIII)V

    sput-object v0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->GIFTS_DECORATION:Lcom/vkontakte/android/ui/recyclerview/SpaceItemDecoration;

    return-void
.end method

.method public constructor <init>()V
    .locals 5

    .prologue
    .line 114
    const/16 v0, 0x1e

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/base/GridFragment;-><init>(I)V

    .line 63
    invoke-static {p0}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;)Lcom/vkontakte/android/functions/VoidF1;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->mGiftSender:Lcom/vkontakte/android/functions/VoidF1;

    .line 64
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->mGiftCardPadding:Landroid/graphics/Rect;

    .line 65
    new-instance v1, Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->getAdapter()Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration$Provider;

    const/high16 v2, 0x3f000000    # 0.5f

    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    const/4 v3, 0x1

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v2

    const v3, -0x282727

    const/high16 v4, 0x41000000    # 8.0f

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    invoke-direct {v1, v0, v2, v3, v4}, Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration;-><init>(Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration$Provider;III)V

    iput-object v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->mDecoration:Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration;

    .line 67
    new-instance v0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$1;-><init>(Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->mGiftsReceiver:Landroid/content/BroadcastReceiver;

    .line 115
    const v0, 0x7f03023c

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->setLayout(I)V

    .line 116
    const v0, 0x7f0300b6

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->setListLayoutId(I)V

    .line 117
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;

    .prologue
    .line 57
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;

    .prologue
    .line 57
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;

    .prologue
    .line 57
    iget v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->mListHeight:I

    return v0
.end method

.method static synthetic access$1100(Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;

    .prologue
    .line 57
    iget v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->mGiftsWidth:I

    return v0
.end method

.method static synthetic access$1200(Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;)Lcom/vkontakte/android/functions/VoidF1;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;

    .prologue
    .line 57
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->mGiftSender:Lcom/vkontakte/android/functions/VoidF1;

    return-object v0
.end method

.method static synthetic access$1400(Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;

    .prologue
    .line 57
    iget v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->mGiftMinSize:I

    return v0
.end method

.method static synthetic access$200(Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;)Lcom/vkontakte/android/UserProfile;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;

    .prologue
    .line 57
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->mTo:Lcom/vkontakte/android/UserProfile;

    return-object v0
.end method

.method static synthetic access$302(Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;
    .param p1, "x1"    # I

    .prologue
    .line 57
    iput p1, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->mVotes:I

    return p1
.end method

.method static synthetic access$500(Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;

    .prologue
    .line 57
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$600(Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;

    .prologue
    .line 57
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$700(Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;

    .prologue
    .line 57
    iget v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->mListPadding:I

    return v0
.end method

.method static synthetic access$900()Lcom/vkontakte/android/ui/recyclerview/SpaceItemDecoration;
    .locals 1

    .prologue
    .line 57
    sget-object v0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->GIFTS_DECORATION:Lcom/vkontakte/android/ui/recyclerview/SpaceItemDecoration;

    return-object v0
.end method

.method private isInContextOfAttachActivity()Z
    .locals 1

    .prologue
    .line 110
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    instance-of v0, v0, Lcom/vk/attachpicker/AttachActivity;

    return v0
.end method

.method public static start(Landroid/app/Activity;Lcom/vkontakte/android/UserProfile;)V
    .locals 6
    .param p0, "activity"    # Landroid/app/Activity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "to"    # Lcom/vkontakte/android/UserProfile;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 120
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 121
    .local v1, "users":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    if-eqz p1, :cond_0

    .line 122
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 125
    :cond_0
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 126
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v2, "users"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 127
    new-instance v2, Lcom/vkontakte/android/navigation/Navigator;

    const-class v3, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;

    new-instance v4, Lcom/vkontakte/android/TabletDialogActivity$Builder;

    invoke-direct {v4}, Lcom/vkontakte/android/TabletDialogActivity$Builder;-><init>()V

    const v5, 0x7f0f005e

    .line 129
    invoke-virtual {v4, v5}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->windowBackgroundResource(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v4

    invoke-direct {v2, v3, v4, v0}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;Lcom/vkontakte/android/navigation/Navigator$ActivityNavigator;Landroid/os/Bundle;)V

    .line 131
    invoke-virtual {v2, p0}, Lcom/vkontakte/android/navigation/Navigator;->go(Landroid/content/Context;)Z

    .line 133
    return-void
.end method


# virtual methods
.method buildTitle()V
    .locals 6

    .prologue
    .line 268
    iget v2, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->mVotes:I

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    .line 270
    .local v1, "votes":Ljava/lang/String;
    new-instance v0, Landroid/text/SpannableStringBuilder;

    const v2, 0x7f08079b

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 271
    .local v0, "sb":Landroid/text/SpannableStringBuilder;
    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 272
    new-instance v2, Lcom/vkontakte/android/ui/Font$TypefaceSpan;

    sget-object v3, Lcom/vkontakte/android/ui/Font;->Medium:Lcom/vkontakte/android/ui/Font;

    invoke-direct {v2, v3}, Lcom/vkontakte/android/ui/Font$TypefaceSpan;-><init>(Lcom/vkontakte/android/ui/Font;)V

    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v3

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    sub-int/2addr v3, v4

    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v4

    const/4 v5, 0x0

    invoke-virtual {v0, v2, v3, v4, v5}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 273
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0d0004

    iget v4, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->mVotes:I

    invoke-virtual {v2, v3, v4}, Landroid/content/res/Resources;->getQuantityString(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 275
    iget-object v2, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->mBalance:Landroid/widget/TextView;

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 276
    return-void
.end method

.method protected canGoBack()Z
    .locals 1

    .prologue
    .line 242
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->isInContextOfAttachActivity()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 243
    const/4 v0, 0x0

    .line 245
    :goto_0
    return v0

    :cond_0
    invoke-super {p0}, Lcom/vkontakte/android/fragments/base/GridFragment;->canGoBack()Z

    move-result v0

    goto :goto_0
.end method

.method protected createAdapter()Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vkontakte/android/fragments/base/GridFragment",
            "<",
            "Lcom/vkontakte/android/api/models/GiftCategory;",
            ">.GridAdapter<",
            "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
            "<",
            "Lcom/vkontakte/android/api/models/GiftCategory;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 237
    new-instance v0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$Adapter;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$Adapter;-><init>(Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$1;)V

    return-object v0
.end method

.method public doLoadData(II)V
    .locals 3
    .param p1, "offset"    # I
    .param p2, "count"    # I

    .prologue
    .line 194
    new-instance v1, Lcom/vkontakte/android/api/gifts/GiftsGetCatalog;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->mTo:Lcom/vkontakte/android/UserProfile;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->mTo:Lcom/vkontakte/android/UserProfile;

    iget v0, v0, Lcom/vkontakte/android/UserProfile;->uid:I

    :goto_0
    invoke-direct {v1, v2, v0}, Lcom/vkontakte/android/api/gifts/GiftsGetCatalog;-><init>(Landroid/content/Context;I)V

    new-instance v0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$2;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$2;-><init>(Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;)V

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/api/gifts/GiftsGetCatalog;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 200
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    .line 201
    return-void

    .line 194
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected getColumnsCount()I
    .locals 8

    .prologue
    const/high16 v7, 0x3f400000    # 0.75f

    .line 211
    iget-object v4, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v4}, Lme/grishka/appkit/views/UsableRecyclerView;->getWidth()I

    move-result v4

    iget v5, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->mListPadding:I

    sub-int v3, v4, v5

    .line 212
    .local v3, "screenWidth":I
    iget v4, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->mGiftMinSize:I

    iget-object v5, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->mGiftCardPadding:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->left:I

    add-int/2addr v4, v5

    iget-object v5, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->mGiftCardPadding:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->right:I

    add-int v0, v4, v5

    .line 214
    .local v0, "giftMinWidth":I
    sget v4, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->GIFTS_SPACING:I

    add-int/2addr v4, v3

    int-to-float v4, v4

    int-to-float v5, v0

    sget v6, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->GIFTS_SPACING:I

    int-to-float v6, v6

    add-float/2addr v5, v6

    div-float v1, v4, v5

    .line 215
    .local v1, "initialCount":F
    float-to-int v4, v1

    int-to-float v4, v4

    sub-float v2, v1, v4

    .line 217
    .local v2, "remains":F
    iget v4, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->mGiftMinSize:I

    iput v4, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->mGiftsWidth:I

    .line 219
    const/high16 v4, 0x3e800000    # 0.25f

    cmpg-float v4, v2, v4

    if-lez v4, :cond_0

    cmpl-float v4, v2, v7

    if-lez v4, :cond_1

    .line 220
    :cond_0
    const/high16 v4, 0x3f000000    # 0.5f

    sub-float v4, v1, v4

    float-to-int v4, v4

    int-to-float v4, v4

    add-float v1, v4, v7

    .line 221
    sget v4, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->GIFTS_SPACING:I

    add-int/2addr v4, v3

    int-to-float v4, v4

    div-float/2addr v4, v1

    sget v5, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->GIFTS_SPACING:I

    int-to-float v5, v5

    sub-float/2addr v4, v5

    float-to-int v4, v4

    iput v4, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->mGiftsWidth:I

    .line 223
    :cond_1
    iget-object v4, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->mGiftCardPadding:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->top:I

    iget v5, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->mGiftsWidth:I

    add-int/2addr v4, v5

    const/high16 v5, 0x42200000    # 40.0f

    invoke-static {v5}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v5

    add-int/2addr v4, v5

    iput v4, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->mListHeight:I

    .line 224
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->getAdapter()Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;->notifyDataSetChanged()V

    .line 225
    const/4 v4, 0x1

    return v4
.end method

.method public hasNavigationDrawer()Z
    .locals 1

    .prologue
    .line 250
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->isInContextOfAttachActivity()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 251
    const/4 v0, 0x0

    .line 252
    :goto_0
    return v0

    :cond_0
    invoke-super {p0}, Lcom/vkontakte/android/fragments/base/GridFragment;->hasNavigationDrawer()Z

    move-result v0

    goto :goto_0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "state"    # Landroid/os/Bundle;

    .prologue
    .line 184
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/base/GridFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 185
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->loaded:Z

    if-nez v0, :cond_0

    .line 186
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->loadData()V

    .line 190
    :goto_0
    return-void

    .line 188
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->buildTitle()V

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 6
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v3, 0x0

    .line 138
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/base/GridFragment;->onCreate(Landroid/os/Bundle;)V

    .line 140
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f020080

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 141
    .local v0, "drawable":Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_0

    .line 142
    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->mGiftCardPadding:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    .line 144
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0900f2

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->mGiftCardPadding:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->left:I

    sub-int/2addr v1, v2

    const/high16 v2, 0x40800000    # 4.0f

    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    sub-int/2addr v1, v2

    iput v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->mListPadding:I

    .line 145
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f09001e

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    iput v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->mGiftMinSize:I

    .line 146
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->isInContextOfAttachActivity()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 147
    const/high16 v1, 0x42c00000    # 96.0f

    invoke-static {v1}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v1

    iput v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->mGiftMinSize:I

    .line 150
    :cond_1
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "users"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->mUsersTo:Ljava/util/ArrayList;

    .line 152
    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->mUsersTo:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_2

    .line 153
    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->mUsersTo:Ljava/util/ArrayList;

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/UserProfile;

    iput-object v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->mTo:Lcom/vkontakte/android/UserProfile;

    .line 155
    :cond_2
    invoke-virtual {p0, v3}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->setRefreshEnabled(Z)V

    .line 156
    const v1, 0x7f0805f0

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->setTitle(I)V

    .line 157
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->mGiftsReceiver:Landroid/content/BroadcastReceiver;

    new-instance v3, Landroid/content/IntentFilter;

    const-string/jumbo v4, "com.vkontakte.android.ACTION_GIFT_SENT"

    invoke-direct {v3, v4}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const-string/jumbo v4, "com.vkontakte.android.permission.ACCESS_DATA"

    const/4 v5, 0x0

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 158
    return-void
.end method

.method protected onCreateCardDecorator()Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;
    .locals 4

    .prologue
    .line 230
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->mDecoration:Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration;

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->removeItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 231
    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->mDecoration:Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration;

    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->isTablet:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->mListPadding:I

    :goto_0
    const/4 v3, 0x0

    invoke-virtual {v2, v0, v3}, Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration;->setPadding(II)Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration;

    move-result-object v0

    invoke-virtual {v1, v0}, Lme/grishka/appkit/views/UsableRecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 232
    const/4 v0, 0x0

    return-object v0

    .line 231
    :cond_0
    const/high16 v0, 0x41800000    # 16.0f

    invoke-static {v0}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v0

    goto :goto_0
.end method

.method protected onDataLoaded(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/api/models/GiftCategory;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 205
    .local p1, "d":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/api/models/GiftCategory;>;"
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/base/GridFragment;->onDataLoaded(Ljava/util/List;)V

    .line 206
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->buildTitle()V

    .line 207
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 162
    invoke-super {p0}, Lcom/vkontakte/android/fragments/base/GridFragment;->onDestroy()V

    .line 163
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->mGiftsReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/app/Activity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 164
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 169
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/base/GridFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 170
    const v1, 0x7f1002cd

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->mBalance:Landroid/widget/TextView;

    .line 172
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 174
    .local v0, "activity":Landroid/app/Activity;
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->isInContextOfAttachActivity()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 175
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0f005e

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {p1, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 176
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v1

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/Toolbar;->setVisibility(I)V

    .line 180
    :cond_0
    return-void
.end method

.method public provideToolbar(Landroid/content/Context;)Landroid/view/ViewGroup;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 280
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v0

    return-object v0
.end method

.method sendGift(Lcom/vkontakte/android/api/models/CatalogedGift;)V
    .locals 3
    .param p1, "gift"    # Lcom/vkontakte/android/api/models/CatalogedGift;

    .prologue
    .line 260
    iget-boolean v0, p1, Lcom/vkontakte/android/api/models/CatalogedGift;->disabled:Z

    if-nez v0, :cond_0

    .line 261
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->mUsersTo:Ljava/util/ArrayList;

    iget v2, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->mVotes:I

    invoke-static {v0, v1, p1, v2}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->start(Landroid/app/Activity;Ljava/util/ArrayList;Lcom/vkontakte/android/api/models/CatalogedGift;I)V

    .line 265
    :goto_0
    return-void

    .line 263
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->getActivity()Landroid/app/Activity;

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

.method showCategory(Lcom/vkontakte/android/api/models/GiftCategory;)V
    .locals 3
    .param p1, "category"    # Lcom/vkontakte/android/api/models/GiftCategory;

    .prologue
    .line 256
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->mUsersTo:Ljava/util/ArrayList;

    iget v2, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->mVotes:I

    invoke-static {v0, v1, p1, v2}, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->start(Landroid/app/Activity;Ljava/util/ArrayList;Lcom/vkontakte/android/api/models/GiftCategory;I)V

    .line 257
    return-void
.end method
