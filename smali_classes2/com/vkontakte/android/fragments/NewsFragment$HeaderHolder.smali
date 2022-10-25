.class Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "NewsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/NewsFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "HeaderHolder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field private final clickLock:Lcom/vk/core/util/TimeoutLock;

.field final imageButton:Landroid/widget/ImageButton;

.field final imageView:Lcom/vk/imageloader/view/VKImageView;

.field private newHeader:Landroid/view/View;

.field private oldHeader:Landroid/view/View;

.field private storyButton:Landroid/view/View;

.field private streamButton:Landroid/view/View;

.field final synthetic this$0:Lcom/vkontakte/android/fragments/NewsFragment;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/fragments/NewsFragment;Landroid/view/ViewGroup;)V
    .locals 4
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/NewsFragment;
    .param p2, "container"    # Landroid/view/ViewGroup;

    .prologue
    .line 1446
    iput-object p1, p0, Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    .line 1447
    const v0, 0x7f03016b

    invoke-direct {p0, v0, p2}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/view/ViewGroup;)V

    .line 1434
    new-instance v0, Lcom/vk/core/util/TimeoutLock;

    const-wide/16 v2, 0x12c

    invoke-direct {v0, v2, v3}, Lcom/vk/core/util/TimeoutLock;-><init>(J)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;->clickLock:Lcom/vk/core/util/TimeoutLock;

    .line 1449
    const v0, 0x7f100419

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;->$(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;->oldHeader:Landroid/view/View;

    .line 1450
    const v0, 0x7f10041a

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;->$(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;->newHeader:Landroid/view/View;

    .line 1453
    const v0, 0x1020006

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    .line 1454
    const v0, 0x1020019

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;->imageButton:Landroid/widget/ImageButton;

    .line 1455
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;->imageButton:Landroid/widget/ImageButton;

    new-instance v1, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;

    invoke-virtual {p2}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f0201f5

    invoke-static {v2, v3}, Lcom/vkontakte/android/ViewUtils;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    const v3, -0x55514d

    invoke-direct {v1, v2, v3}, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;-><init>(Landroid/graphics/drawable/Drawable;I)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1456
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;->imageButton:Landroid/widget/ImageButton;

    invoke-static {p0}, Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1459
    invoke-static {p1}, Lcom/vkontakte/android/fragments/NewsFragment;->access$4500(Lcom/vkontakte/android/fragments/NewsFragment;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1460
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;->itemView:Landroid/view/View;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 1462
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;->oldHeader:Landroid/view/View;

    invoke-static {p0}, Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1465
    const v0, 0x7f10041b

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;->$(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;->storyButton:Landroid/view/View;

    .line 1466
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;->storyButton:Landroid/view/View;

    invoke-static {p0}, Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder$$Lambda$3;->lambdaFactory$(Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1474
    const v0, 0x7f10041c

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;->$(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;->streamButton:Landroid/view/View;

    .line 1475
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;->streamButton:Landroid/view/View;

    invoke-static {p0}, Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder$$Lambda$4;->lambdaFactory$(Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1482
    const v0, 0x7f10041d

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;->$(I)Landroid/view/View;

    move-result-object v0

    invoke-static {p0}, Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder$$Lambda$5;->lambdaFactory$(Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1489
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;->onBind(Ljava/lang/String;)V

    .line 1490
    return-void
.end method


# virtual methods
.method synthetic lambda$new$0(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1457
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/NewsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const-class v3, Lcom/vkontakte/android/PostPhotoActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string/jumbo v2, "uid"

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/NewsFragment;->startActivity(Landroid/content/Intent;)V

    .line 1458
    return-void
.end method

.method synthetic lambda$new$1(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1462
    new-instance v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;

    invoke-direct {v0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;-><init>()V

    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/NewsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->go(Landroid/content/Context;)Z

    return-void
.end method

.method synthetic lambda$new$2(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1467
    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;->clickLock:Lcom/vk/core/util/TimeoutLock;

    invoke-virtual {v1}, Lcom/vk/core/util/TimeoutLock;->isLocked()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1473
    :goto_0
    return-void

    .line 1470
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;->clickLock:Lcom/vk/core/util/TimeoutLock;

    invoke-virtual {v1}, Lcom/vk/core/util/TimeoutLock;->lock()V

    .line 1471
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/NewsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-class v2, Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1472
    .local v0, "intent":Landroid/content/Intent;
    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/NewsFragment;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method

.method synthetic lambda$new$3(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1476
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;->clickLock:Lcom/vk/core/util/TimeoutLock;

    invoke-virtual {v0}, Lcom/vk/core/util/TimeoutLock;->isLocked()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1481
    :goto_0
    return-void

    .line 1479
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;->clickLock:Lcom/vk/core/util/TimeoutLock;

    invoke-virtual {v0}, Lcom/vk/core/util/TimeoutLock;->lock()V

    .line 1480
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/utils/VKLiveUtils;->startStream(Landroid/content/Context;)V

    goto :goto_0
.end method

.method synthetic lambda$new$4(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1483
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;->clickLock:Lcom/vk/core/util/TimeoutLock;

    invoke-virtual {v0}, Lcom/vk/core/util/TimeoutLock;->isLocked()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1488
    :goto_0
    return-void

    .line 1486
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;->clickLock:Lcom/vk/core/util/TimeoutLock;

    invoke-virtual {v0}, Lcom/vk/core/util/TimeoutLock;->lock()V

    .line 1487
    new-instance v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;

    invoke-direct {v0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;-><init>()V

    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/NewsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->go(Landroid/content/Context;)Z

    goto :goto_0
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1432
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;->onBind(Ljava/lang/String;)V

    return-void
.end method

.method public onBind(Ljava/lang/String;)V
    .locals 6
    .param p1, "item"    # Ljava/lang/String;

    .prologue
    const/16 v4, 0x8

    const/4 v3, 0x0

    .line 1494
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/auth/VKAccount;->isVkLiveStreamAvailable()Z

    move-result v1

    .line 1495
    .local v1, "stream":Z
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/auth/VKAccount;->isStoriesAvailable()Z

    move-result v0

    .line 1496
    .local v0, "stories":Z
    if-nez v0, :cond_0

    if-eqz v1, :cond_3

    .line 1497
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;->oldHeader:Landroid/view/View;

    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    .line 1498
    iget-object v2, p0, Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;->newHeader:Landroid/view/View;

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 1499
    iget-object v5, p0, Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;->storyButton:Landroid/view/View;

    if-eqz v0, :cond_1

    move v2, v3

    :goto_0
    invoke-virtual {v5, v2}, Landroid/view/View;->setVisibility(I)V

    .line 1500
    iget-object v2, p0, Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;->streamButton:Landroid/view/View;

    if-eqz v1, :cond_2

    :goto_1
    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 1506
    :goto_2
    return-void

    :cond_1
    move v2, v4

    .line 1499
    goto :goto_0

    :cond_2
    move v3, v4

    .line 1500
    goto :goto_1

    .line 1502
    :cond_3
    iget-object v2, p0, Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;->oldHeader:Landroid/view/View;

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 1503
    iget-object v2, p0, Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;->newHeader:Landroid/view/View;

    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    .line 1504
    iget-object v2, p0, Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v2, p1}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    goto :goto_2
.end method
