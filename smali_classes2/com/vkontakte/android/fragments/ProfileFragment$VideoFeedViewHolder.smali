.class Lcom/vkontakte/android/fragments/ProfileFragment$VideoFeedViewHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "ProfileFragment.java"

# interfaces
.implements Lme/grishka/appkit/views/UsableRecyclerView$Clickable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/ProfileFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "VideoFeedViewHolder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/api/VideoFile;",
        ">;",
        "Lme/grishka/appkit/views/UsableRecyclerView$Clickable;"
    }
.end annotation


# instance fields
.field private duration:Landroid/widget/TextView;

.field private image:Lcom/vk/imageloader/view/VKImageView;

.field final synthetic this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

.field private title:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment;)V
    .locals 4

    .prologue
    .line 4372
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$VideoFeedViewHolder;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    .line 4373
    const v0, 0x7f0301dd

    invoke-virtual {p1}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/content/Context;)V

    .line 4374
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$VideoFeedViewHolder;->itemView:Landroid/view/View;

    const v1, 0x7f1001e8

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$VideoFeedViewHolder;->image:Lcom/vk/imageloader/view/VKImageView;

    .line 4375
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$VideoFeedViewHolder;->itemView:Landroid/view/View;

    const v1, 0x7f100128

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$VideoFeedViewHolder;->title:Landroid/widget/TextView;

    .line 4376
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$VideoFeedViewHolder;->itemView:Landroid/view/View;

    const v1, 0x7f1001de

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$VideoFeedViewHolder;->duration:Landroid/widget/TextView;

    .line 4377
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$VideoFeedViewHolder;->itemView:Landroid/view/View;

    new-instance v1, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    const/high16 v2, 0x43480000    # 200.0f

    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    const/high16 v3, 0x43180000    # 152.0f

    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    invoke-direct {v1, v2, v3}, Landroid/support/v7/widget/RecyclerView$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 4378
    return-void
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/api/VideoFile;)V
    .locals 5
    .param p1, "item"    # Lcom/vkontakte/android/api/VideoFile;

    .prologue
    const/4 v3, 0x0

    .line 4382
    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$VideoFeedViewHolder;->title:Landroid/widget/TextView;

    iget-object v4, p1, Lcom/vkontakte/android/api/VideoFile;->title:Ljava/lang/String;

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4383
    invoke-virtual {p1}, Lcom/vkontakte/android/api/VideoFile;->isLive()Z

    move-result v0

    .line 4384
    .local v0, "live":Z
    invoke-virtual {p1}, Lcom/vkontakte/android/api/VideoFile;->isLiveUpcoming()Z

    move-result v1

    .line 4385
    .local v1, "upcoming":Z
    iget-object v4, p0, Lcom/vkontakte/android/fragments/ProfileFragment$VideoFeedViewHolder;->duration:Landroid/widget/TextView;

    if-eqz v1, :cond_1

    const v2, 0x7f08075c

    .line 4386
    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/ProfileFragment$VideoFeedViewHolder;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 4385
    :goto_0
    invoke-virtual {v4, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4390
    iget-object v4, p0, Lcom/vkontakte/android/fragments/ProfileFragment$VideoFeedViewHolder;->duration:Landroid/widget/TextView;

    if-eqz v0, :cond_3

    if-nez v1, :cond_3

    const v2, 0x7f02006d

    :goto_1
    invoke-virtual {v4, v2, v3, v3, v3}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 4391
    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$VideoFeedViewHolder;->duration:Landroid/widget/TextView;

    if-nez v0, :cond_0

    if-nez v1, :cond_0

    iget v4, p1, Lcom/vkontakte/android/api/VideoFile;->duration:I

    if-nez v4, :cond_0

    const/4 v3, 0x4

    :cond_0
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 4392
    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$VideoFeedViewHolder;->image:Lcom/vk/imageloader/view/VKImageView;

    iget-object v3, p1, Lcom/vkontakte/android/api/VideoFile;->urlBigThumb:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 4393
    return-void

    .line 4386
    :cond_1
    if-eqz v0, :cond_2

    const v2, 0x7f0807f3

    .line 4388
    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/ProfileFragment$VideoFeedViewHolder;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    :cond_2
    iget v2, p1, Lcom/vkontakte/android/api/VideoFile;->duration:I

    .line 4389
    invoke-static {v2}, Lcom/vkontakte/android/cache/Videos;->formatDuration(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    :cond_3
    move v2, v3

    .line 4390
    goto :goto_1
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 4367
    check-cast p1, Lcom/vkontakte/android/api/VideoFile;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/ProfileFragment$VideoFeedViewHolder;->onBind(Lcom/vkontakte/android/api/VideoFile;)V

    return-void
.end method

.method public onClick()V
    .locals 2

    .prologue
    .line 4397
    new-instance v1, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$VideoFeedViewHolder;->item:Ljava/lang/Object;

    check-cast v0, Lcom/vkontakte/android/api/VideoFile;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/VideoFile;->convertToPost()Lcom/vkontakte/android/NewsEntry;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;-><init>(Lcom/vkontakte/android/NewsEntry;)V

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$VideoFeedViewHolder;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getListReferrer()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;->setRefer(Ljava/lang/String;)Lcom/vkontakte/android/fragments/PostViewFragment$Builder;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;->resetScroll(Z)Lcom/vkontakte/android/fragments/PostViewFragment$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$VideoFeedViewHolder;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;->go(Landroid/content/Context;)Z

    .line 4398
    return-void
.end method
