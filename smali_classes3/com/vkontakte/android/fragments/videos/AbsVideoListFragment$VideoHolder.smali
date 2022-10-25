.class Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$VideoHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "AbsVideoListFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/support/v7/widget/PopupMenu$OnMenuItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "VideoHolder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/api/VideoFile;",
        ">;",
        "Landroid/view/View$OnClickListener;",
        "Landroid/support/v7/widget/PopupMenu$OnMenuItemClickListener;"
    }
.end annotation


# instance fields
.field private final mDuration:Landroid/widget/TextView;

.field private final mInfo:Landroid/widget/TextView;

.field private final mOptions:Landroid/view/View;

.field private final mPhoto:Lcom/vk/imageloader/view/VKImageView;

.field private final mSubtitle:Landroid/widget/TextView;

.field private final mTitle:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;Landroid/view/ViewGroup;)V
    .locals 1
    .param p1    # Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 344
    iput-object p1, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$VideoHolder;->this$0:Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;

    .line 345
    const v0, 0x7f030226

    invoke-direct {p0, v0, p2}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/view/ViewGroup;)V

    .line 346
    const v0, 0x7f100128

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$VideoHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$VideoHolder;->mTitle:Landroid/widget/TextView;

    .line 347
    const v0, 0x7f10019c

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$VideoHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$VideoHolder;->mSubtitle:Landroid/widget/TextView;

    .line 348
    const v0, 0x7f1002b1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$VideoHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$VideoHolder;->mInfo:Landroid/widget/TextView;

    .line 349
    const v0, 0x7f10057f

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$VideoHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$VideoHolder;->mDuration:Landroid/widget/TextView;

    .line 350
    const v0, 0x7f1001e8

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$VideoHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$VideoHolder;->mPhoto:Lcom/vk/imageloader/view/VKImageView;

    .line 351
    const v0, 0x7f10057b

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$VideoHolder;->$(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$VideoHolder;->mOptions:Landroid/view/View;

    .line 352
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$VideoHolder;->mOptions:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 353
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$VideoHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 354
    return-void
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/api/VideoFile;)V
    .locals 8
    .param p1, "item"    # Lcom/vkontakte/android/api/VideoFile;

    .prologue
    const/16 v1, 0x8

    const/4 v2, 0x0

    .line 358
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$VideoHolder;->mPhoto:Lcom/vk/imageloader/view/VKImageView;

    iget-object v3, p1, Lcom/vkontakte/android/api/VideoFile;->urlBigThumb:Ljava/lang/String;

    invoke-virtual {v0, v3}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 359
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$VideoHolder;->mTitle:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/vkontakte/android/api/VideoFile;->getTitle()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 360
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$VideoHolder;->mSubtitle:Landroid/widget/TextView;

    iget-object v3, p1, Lcom/vkontakte/android/api/VideoFile;->ownerName:Ljava/lang/String;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 361
    iget-object v3, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$VideoHolder;->mInfo:Landroid/widget/TextView;

    iget v0, p1, Lcom/vkontakte/android/api/VideoFile;->views:I

    if-lez v0, :cond_0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$VideoHolder;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v4, 0x7f0d0060

    iget v5, p1, Lcom/vkontakte/android/api/VideoFile;->views:I

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    iget v7, p1, Lcom/vkontakte/android/api/VideoFile;->views:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v2

    invoke-virtual {v0, v4, v5, v6}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 362
    iget-object v3, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$VideoHolder;->mDuration:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/vkontakte/android/api/VideoFile;->isLiveUpcoming()Z

    move-result v0

    if-eqz v0, :cond_1

    const v0, 0x7f08075c

    .line 363
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$VideoHolder;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 362
    :goto_1
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 369
    iget-object v3, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$VideoHolder;->mDuration:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$VideoHolder;->mDuration:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_4

    move v0, v1

    :goto_2
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 370
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$VideoHolder;->mOptions:Landroid/view/View;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$VideoHolder;->this$0:Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;

    iget-boolean v3, v3, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->mSelectMode:Z

    if-nez v3, :cond_5

    :goto_3
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 371
    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$VideoHolder;->mDuration:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/vkontakte/android/api/VideoFile;->isLive()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-virtual {p1}, Lcom/vkontakte/android/api/VideoFile;->isLiveUpcoming()Z

    move-result v0

    if-nez v0, :cond_6

    const v0, 0x7f0200c5

    :goto_4
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 373
    return-void

    .line 361
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$VideoHolder;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v4, 0x7f080459

    invoke-virtual {v0, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 364
    :cond_1
    invoke-virtual {p1}, Lcom/vkontakte/android/api/VideoFile;->isLive()Z

    move-result v0

    if-eqz v0, :cond_2

    const v0, 0x7f0807f3

    .line 365
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$VideoHolder;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :cond_2
    iget v0, p1, Lcom/vkontakte/android/api/VideoFile;->duration:I

    if-lez v0, :cond_3

    iget v0, p1, Lcom/vkontakte/android/api/VideoFile;->duration:I

    .line 367
    invoke-static {v0}, Lcom/vkontakte/android/cache/Videos;->formatDuration(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :cond_3
    const-string/jumbo v0, ""

    goto :goto_1

    :cond_4
    move v0, v2

    .line 369
    goto :goto_2

    :cond_5
    move v2, v1

    .line 370
    goto :goto_3

    .line 371
    :cond_6
    const v0, 0x7f02007b

    goto :goto_4
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 335
    check-cast p1, Lcom/vkontakte/android/api/VideoFile;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$VideoHolder;->onBind(Lcom/vkontakte/android/api/VideoFile;)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 377
    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$VideoHolder;->itemView:Landroid/view/View;

    if-ne p1, v1, :cond_1

    .line 378
    iget-object v2, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$VideoHolder;->this$0:Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$VideoHolder;->getItem()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/api/VideoFile;

    invoke-virtual {v2, v1}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->onItemClick(Lcom/vkontakte/android/api/VideoFile;)V

    .line 385
    :cond_0
    :goto_0
    return-void

    .line 379
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$VideoHolder;->mOptions:Landroid/view/View;

    if-ne p1, v1, :cond_0

    .line 380
    new-instance v0, Landroid/support/v7/widget/PopupMenu;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$VideoHolder;->this$0:Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Landroid/support/v7/widget/PopupMenu;-><init>(Landroid/content/Context;Landroid/view/View;)V

    .line 381
    .local v0, "pm":Landroid/support/v7/widget/PopupMenu;
    iget-object v2, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$VideoHolder;->this$0:Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$VideoHolder;->getItem()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/api/VideoFile;

    invoke-virtual {v0}, Landroid/support/v7/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v3

    invoke-virtual {v2, v1, v3}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->onCreatePopupMenu(Lcom/vkontakte/android/api/VideoFile;Landroid/view/Menu;)V

    .line 382
    invoke-virtual {v0, p0}, Landroid/support/v7/widget/PopupMenu;->setOnMenuItemClickListener(Landroid/support/v7/widget/PopupMenu$OnMenuItemClickListener;)V

    .line 383
    invoke-virtual {v0}, Landroid/support/v7/widget/PopupMenu;->show()V

    goto :goto_0
.end method

.method public onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 2
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 389
    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$VideoHolder;->this$0:Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$VideoHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/VideoFile;

    invoke-virtual {v1, v0, p1}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->onPopupItemSelected(Lcom/vkontakte/android/api/VideoFile;Landroid/view/MenuItem;)Z

    move-result v0

    return v0
.end method
