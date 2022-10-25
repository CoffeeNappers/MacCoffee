.class public Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;
.super Lme/grishka/appkit/fragments/AppKitFragment;
.source "StickersDetailsFragment.java"

# interfaces
.implements Lcom/vkontakte/android/ui/ActivityResulter;
.implements Landroid/view/View$OnClickListener;
.implements Landroid/support/v4/view/ViewPager$OnPageChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment$PagerDotsView;,
        Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment$SlidePagerAdapter;
    }
.end annotation


# static fields
.field private static final EXTRA_DATA:Ljava/lang/String; = "data"


# instance fields
.field mCloseAfterDownload:Z

.field mData:Lcom/vkontakte/android/data/orm/StickerStockItem;

.field mDots:Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment$PagerDotsView;

.field mError:Landroid/view/View;

.field mInfo:Landroid/widget/TextView;

.field mManager:Lcom/vkontakte/android/data/PurchasesManager;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/data/PurchasesManager",
            "<",
            "Lcom/vkontakte/android/data/orm/StickerStockItem;",
            ">;"
        }
    .end annotation
.end field

.field mOkButton:Landroid/view/View;

.field mPager:Lcom/vkontakte/android/ui/widget/ViewPagerInfinite;

.field mParallaxBackground:Lcom/vk/imageloader/view/VKHorizontalParallaxImageView;

.field mProgress:Landroid/widget/ProgressBar;

.field mReceiver:Landroid/content/BroadcastReceiver;

.field mStickerButton:Landroid/widget/TextView;

.field mSubtitle:Landroid/widget/TextView;

.field mTitle:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 48
    invoke-direct {p0}, Lme/grishka/appkit/fragments/AppKitFragment;-><init>()V

    .line 102
    new-instance v0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment$3;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment$3;-><init>(Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 133
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mCloseAfterDownload:Z

    return-void
.end method

.method static synthetic lambda$onClick$0(Landroid/view/View;)V
    .locals 1
    .param p0, "v"    # Landroid/view/View;

    .prologue
    .line 247
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/view/View;->setEnabled(Z)V

    return-void
.end method

.method public static show(ILjava/lang/String;Landroid/content/Context;)V
    .locals 2
    .param p0, "stickerPackId"    # I
    .param p1, "referrer"    # Ljava/lang/String;
    .param p2, "activity"    # Landroid/content/Context;

    .prologue
    .line 66
    new-instance v0, Lcom/vkontakte/android/api/store/GetStickerStockItemById;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/api/store/GetStickerStockItemById;-><init>(I)V

    new-instance v1, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment$1;

    invoke-direct {v1, p2, p1, p2}, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment$1;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/content/Context;)V

    .line 67
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/store/GetStickerStockItemById;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 74
    invoke-virtual {v0, p2}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 75
    invoke-virtual {v0, p2}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 76
    return-void
.end method

.method public static show(Lcom/vkontakte/android/data/orm/StickerStockItem;Landroid/content/Context;)V
    .locals 5
    .param p0, "item"    # Lcom/vkontakte/android/data/orm/StickerStockItem;
    .param p1, "activity"    # Landroid/content/Context;

    .prologue
    .line 53
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 54
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v1, "data"

    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 56
    new-instance v1, Lcom/vkontakte/android/navigation/Navigator;

    const-class v2, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;

    new-instance v3, Lcom/vkontakte/android/TabletDialogActivity$Builder;

    const-class v4, Lcom/vkontakte/android/FragmentDialogActivity;

    invoke-direct {v3, v4}, Lcom/vkontakte/android/TabletDialogActivity$Builder;-><init>(Ljava/lang/Class;)V

    const/high16 v4, 0x43b40000    # 360.0f

    .line 57
    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->setMaxWidth(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v3

    const/high16 v4, 0x42000000    # 32.0f

    .line 58
    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->setMinSpacing(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v3

    const/16 v4, 0x11

    .line 59
    invoke-virtual {v3, v4}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->setGravity(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v3

    const v4, 0x106000b

    .line 60
    invoke-virtual {v3, v4}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->windowBackgroundResource(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v3

    const v4, 0x7f0b0192

    .line 61
    invoke-virtual {v3, v4}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->windowAnimationResource(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v3

    invoke-direct {v1, v2, v3, v0}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;Lcom/vkontakte/android/navigation/Navigator$ActivityNavigator;Landroid/os/Bundle;)V

    .line 62
    invoke-virtual {v1, p1}, Lcom/vkontakte/android/navigation/Navigator;->go(Landroid/content/Context;)Z

    .line 63
    return-void
.end method

.method public static showByStickerId(ILjava/lang/String;Landroid/app/Activity;Z)V
    .locals 2
    .param p0, "stickerId"    # I
    .param p1, "referrer"    # Ljava/lang/String;
    .param p2, "activity"    # Landroid/app/Activity;
    .param p3, "reloadIfPurchased"    # Z

    .prologue
    .line 79
    new-instance v0, Lcom/vkontakte/android/api/store/GetStickerStockItemByStickerId;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/api/store/GetStickerStockItemByStickerId;-><init>(I)V

    new-instance v1, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment$2;

    invoke-direct {v1, p2, p1, p3, p2}, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment$2;-><init>(Landroid/content/Context;Ljava/lang/String;ZLandroid/app/Activity;)V

    .line 80
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/store/GetStickerStockItemByStickerId;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 97
    invoke-virtual {v0, p2}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 98
    invoke-virtual {v0, p2}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 99
    return-void
.end method


# virtual methods
.method bindData(Lcom/vkontakte/android/data/orm/StickerStockItem;)V
    .locals 4
    .param p1, "data"    # Lcom/vkontakte/android/data/orm/StickerStockItem;

    .prologue
    .line 287
    iget-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mTitle:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/vkontakte/android/data/orm/StickerStockItem;->title:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 288
    iget-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mSubtitle:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/vkontakte/android/data/orm/StickerStockItem;->author:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 289
    iget-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mInfo:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/vkontakte/android/data/orm/StickerStockItem;->description:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 291
    iget-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mStickerButton:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mOkButton:Landroid/view/View;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mProgress:Landroid/widget/ProgressBar;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mError:Landroid/view/View;

    invoke-static {p1, v0, v1, v2, v3}, Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;->bindButtons(Lcom/vkontakte/android/data/orm/StickerStockItem;Landroid/widget/TextView;Landroid/view/View;Landroid/widget/ProgressBar;Landroid/view/View;)V

    .line 293
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mCloseAfterDownload:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p1, Lcom/vkontakte/android/data/orm/StickerStockItem;->downloaded:Z

    if-eqz v0, :cond_0

    .line 294
    new-instance v0, Landroid/os/Handler;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    invoke-static {p0}, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment$$Lambda$3;->lambdaFactory$(Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;)Ljava/lang/Runnable;

    move-result-object v1

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 300
    :cond_0
    return-void
.end method

.method synthetic lambda$bindData$2()V
    .locals 1

    .prologue
    .line 295
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->isVisible()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 296
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 298
    :cond_0
    return-void
.end method

.method synthetic lambda$onClick$1(Lcom/vkontakte/android/data/orm/StickerStockItem;)V
    .locals 1
    .param p1, "item"    # Lcom/vkontakte/android/data/orm/StickerStockItem;

    .prologue
    .line 254
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mCloseAfterDownload:Z

    .line 255
    return-void
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 194
    invoke-super {p0, p1}, Lme/grishka/appkit/fragments/AppKitFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 195
    iget-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mData:Lcom/vkontakte/android/data/orm/StickerStockItem;

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->bindData(Lcom/vkontakte/android/data/orm/StickerStockItem;)V

    .line 196
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .param p1, "reqCode"    # I
    .param p2, "resCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 238
    invoke-super {p0, p1, p2, p3}, Lme/grishka/appkit/fragments/AppKitFragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 239
    iget-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mManager:Lcom/vkontakte/android/data/PurchasesManager;

    if-eqz v0, :cond_0

    .line 240
    iget-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mManager:Lcom/vkontakte/android/data/PurchasesManager;

    invoke-virtual {v0, p1, p2, p3}, Lcom/vkontakte/android/data/PurchasesManager;->onActivityResult(IILandroid/content/Intent;)V

    .line 242
    :cond_0
    return-void
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 137
    invoke-super {p0, p1}, Lme/grishka/appkit/fragments/AppKitFragment;->onAttach(Landroid/app/Activity;)V

    .line 138
    check-cast p1, Lcom/vkontakte/android/ui/ResulterProvider;

    .end local p1    # "activity":Landroid/app/Activity;
    invoke-interface {p1, p0}, Lcom/vkontakte/android/ui/ResulterProvider;->registerActivityResult(Lcom/vkontakte/android/ui/ActivityResulter;)V

    .line 139
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 246
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 247
    invoke-static {p1}, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment$$Lambda$1;->lambdaFactory$(Landroid/view/View;)Ljava/lang/Runnable;

    move-result-object v0

    const-wide/16 v2, 0x12c

    invoke-virtual {p1, v0, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 249
    iget-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mData:Lcom/vkontakte/android/data/orm/StickerStockItem;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;->getIsPurchaseNotAllowedWithReason(Lcom/vkontakte/android/data/orm/StickerStockItem;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 250
    iget-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mData:Lcom/vkontakte/android/data/orm/StickerStockItem;

    iget-object v0, v0, Lcom/vkontakte/android/data/orm/StickerStockItem;->no_purchase_reason:Ljava/lang/String;

    invoke-static {v0}, Lcom/vk/core/util/ToastUtils;->showToast(Ljava/lang/String;)V

    .line 257
    :cond_0
    :goto_0
    return-void

    .line 252
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mData:Lcom/vkontakte/android/data/orm/StickerStockItem;

    iget-boolean v0, v0, Lcom/vkontakte/android/data/orm/StickerStockItem;->purchased:Z

    if-nez v0, :cond_0

    .line 253
    iget-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mManager:Lcom/vkontakte/android/data/PurchasesManager;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mData:Lcom/vkontakte/android/data/orm/StickerStockItem;

    invoke-static {p0}, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;)Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/data/PurchasesManager;->purchase(Lcom/vkontakte/android/data/PurchasesManager$Product;Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;)V

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 143
    invoke-super {p0, p1}, Lme/grishka/appkit/fragments/AppKitFragment;->onCreate(Landroid/os/Bundle;)V

    .line 144
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "data"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/orm/StickerStockItem;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mData:Lcom/vkontakte/android/data/orm/StickerStockItem;

    .line 145
    new-instance v0, Lcom/vkontakte/android/data/PurchasesManager;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/data/PurchasesManager;-><init>(Landroid/app/Fragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mManager:Lcom/vkontakte/android/data/PurchasesManager;

    .line 146
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 150
    const v0, 0x7f030200

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public onDestroyView()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 218
    invoke-super {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->onDestroyView()V

    .line 219
    iput-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mStickerButton:Landroid/widget/TextView;

    .line 220
    iput-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mOkButton:Landroid/view/View;

    .line 221
    iput-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mProgress:Landroid/widget/ProgressBar;

    .line 222
    iput-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mError:Landroid/view/View;

    .line 223
    iput-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mPager:Lcom/vkontakte/android/ui/widget/ViewPagerInfinite;

    .line 224
    iput-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mTitle:Landroid/widget/TextView;

    .line 225
    iput-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mSubtitle:Landroid/widget/TextView;

    .line 226
    iput-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mInfo:Landroid/widget/TextView;

    .line 227
    iput-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mDots:Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment$PagerDotsView;

    .line 228
    return-void
.end method

.method public onDetach()V
    .locals 1

    .prologue
    .line 232
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/ResulterProvider;

    invoke-interface {v0, p0}, Lcom/vkontakte/android/ui/ResulterProvider;->unregisterActivityResult(Lcom/vkontakte/android/ui/ActivityResulter;)V

    .line 233
    invoke-super {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->onDetach()V

    .line 234
    return-void
.end method

.method public onPageScrollStateChanged(I)V
    .locals 1
    .param p1, "state"    # I

    .prologue
    .line 273
    iget-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mPager:Lcom/vkontakte/android/ui/widget/ViewPagerInfinite;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/widget/ViewPagerInfinite;->onPause()V

    .line 274
    if-nez p1, :cond_0

    .line 275
    iget-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mPager:Lcom/vkontakte/android/ui/widget/ViewPagerInfinite;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/widget/ViewPagerInfinite;->onResume()V

    .line 277
    :cond_0
    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 5
    .param p1, "pos"    # I
    .param p2, "offset"    # F
    .param p3, "offsetPixels"    # I

    .prologue
    .line 266
    iget-object v2, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mPager:Lcom/vkontakte/android/ui/widget/ViewPagerInfinite;

    invoke-virtual {v2}, Lcom/vkontakte/android/ui/widget/ViewPagerInfinite;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/ui/infiniteviewpager/InfinitePagerAdapter;

    invoke-virtual {v2}, Lcom/vkontakte/android/ui/infiniteviewpager/InfinitePagerAdapter;->getRealCount()I

    move-result v2

    int-to-float v1, v2

    .line 267
    .local v1, "realCount":F
    int-to-float v2, p1

    add-float v0, v2, p2

    .line 268
    .local v0, "position":F
    iget-object v2, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mParallaxBackground:Lcom/vk/imageloader/view/VKHorizontalParallaxImageView;

    neg-float v3, v0

    const/high16 v4, 0x3f800000    # 1.0f

    sub-float v4, v1, v4

    div-float/2addr v3, v4

    invoke-virtual {v2, v3}, Lcom/vk/imageloader/view/VKHorizontalParallaxImageView;->setOffset(F)V

    .line 269
    return-void
.end method

.method public onPageSelected(I)V
    .locals 1
    .param p1, "pos"    # I

    .prologue
    .line 261
    iget-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mDots:Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment$PagerDotsView;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment$PagerDotsView;->setSelection(I)V

    .line 262
    return-void
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 206
    invoke-super {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->onPause()V

    .line 207
    iget-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mPager:Lcom/vkontakte/android/ui/widget/ViewPagerInfinite;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/widget/ViewPagerInfinite;->onPause()V

    .line 208
    return-void
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 200
    invoke-super {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->onResume()V

    .line 201
    iget-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mPager:Lcom/vkontakte/android/ui/widget/ViewPagerInfinite;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/widget/ViewPagerInfinite;->onResume()V

    .line 202
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 281
    if-eqz p1, :cond_0

    .line 282
    invoke-super {p0, p1}, Lme/grishka/appkit/fragments/AppKitFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 284
    :cond_0
    return-void
.end method

.method public onStart()V
    .locals 5

    .prologue
    .line 185
    invoke-super {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->onStart()V

    .line 186
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 187
    .local v0, "filter":Landroid/content/IntentFilter;
    const-string/jumbo v1, "com.vkontakte.android.STICKERS_UPDATED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 188
    const-string/jumbo v1, "com.vkontakte.android.STICKERS_DOWNLOAD_PROGRESS"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 189
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mReceiver:Landroid/content/BroadcastReceiver;

    const-string/jumbo v3, "com.vkontakte.android.permission.ACCESS_DATA"

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v0, v3, v4}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 190
    return-void
.end method

.method public onStop()V
    .locals 2

    .prologue
    .line 212
    invoke-super {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->onStop()V

    .line 213
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/app/Activity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 214
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 6
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v5, 0x0

    .line 155
    invoke-super {p0, p1, p2}, Lme/grishka/appkit/fragments/AppKitFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 156
    const v1, 0x7f100544

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mStickerButton:Landroid/widget/TextView;

    .line 157
    const v1, 0x7f100546

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mOkButton:Landroid/view/View;

    .line 158
    const v1, 0x7f100545

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ProgressBar;

    iput-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mProgress:Landroid/widget/ProgressBar;

    .line 159
    const v1, 0x7f100547

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mError:Landroid/view/View;

    .line 160
    const v1, 0x7f10018c

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/ui/widget/ViewPagerInfinite;

    iput-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mPager:Lcom/vkontakte/android/ui/widget/ViewPagerInfinite;

    .line 161
    const v1, 0x7f100541

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vk/imageloader/view/VKHorizontalParallaxImageView;

    iput-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mParallaxBackground:Lcom/vk/imageloader/view/VKHorizontalParallaxImageView;

    .line 162
    const v1, 0x7f100128

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mTitle:Landroid/widget/TextView;

    .line 163
    const v1, 0x7f10019c

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mSubtitle:Landroid/widget/TextView;

    .line 164
    const v1, 0x7f1002b1

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mInfo:Landroid/widget/TextView;

    .line 165
    const v1, 0x7f100542

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment$PagerDotsView;

    iput-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mDots:Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment$PagerDotsView;

    .line 167
    iget-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mStickerButton:Landroid/widget/TextView;

    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 168
    iget-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mError:Landroid/view/View;

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 169
    iget-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mPager:Lcom/vkontakte/android/ui/widget/ViewPagerInfinite;

    new-instance v2, Lcom/vkontakte/android/ui/infiniteviewpager/InfinitePagerAdapter;

    new-instance v3, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment$SlidePagerAdapter;

    const/4 v4, 0x0

    invoke-direct {v3, p0, v4}, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment$SlidePagerAdapter;-><init>(Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment$1;)V

    invoke-direct {v2, v3}, Lcom/vkontakte/android/ui/infiniteviewpager/InfinitePagerAdapter;-><init>(Landroid/support/v4/view/PagerAdapter;)V

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/ui/widget/ViewPagerInfinite;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    .line 170
    iget-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mPager:Lcom/vkontakte/android/ui/widget/ViewPagerInfinite;

    invoke-virtual {v1, p0}, Lcom/vkontakte/android/ui/widget/ViewPagerInfinite;->addOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    .line 171
    iget-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mDots:Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment$PagerDotsView;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mPager:Lcom/vkontakte/android/ui/widget/ViewPagerInfinite;

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment$PagerDotsView;->setViewPager(Landroid/support/v4/view/ViewPager;)V

    .line 173
    new-instance v0, Lcom/vkontakte/android/ui/CircularProgressDrawable;

    invoke-direct {v0, v5}, Lcom/vkontakte/android/ui/CircularProgressDrawable;-><init>(Z)V

    .line 174
    .local v0, "pd":Lcom/vkontakte/android/ui/CircularProgressDrawable;
    const v1, -0xf0f10

    const v2, -0x404041

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/ui/CircularProgressDrawable;->setColors(II)V

    .line 175
    const/high16 v1, 0x40000000    # 2.0f

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/CircularProgressDrawable;->setThickness(F)V

    .line 176
    invoke-virtual {v0, v5}, Lcom/vkontakte/android/ui/CircularProgressDrawable;->setPad(Z)V

    .line 177
    invoke-virtual {v0, v5}, Lcom/vkontakte/android/ui/CircularProgressDrawable;->setDimBackground(Z)V

    .line 178
    iget-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v1, v0}, Landroid/widget/ProgressBar;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 180
    iget-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mParallaxBackground:Lcom/vk/imageloader/view/VKHorizontalParallaxImageView;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mData:Lcom/vkontakte/android/data/orm/StickerStockItem;

    invoke-virtual {v2}, Lcom/vkontakte/android/data/orm/StickerStockItem;->getServerBackgroundURL()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vk/imageloader/view/VKHorizontalParallaxImageView;->load(Ljava/lang/String;)V

    .line 181
    return-void
.end method
