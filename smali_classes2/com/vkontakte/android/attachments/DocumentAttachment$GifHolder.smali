.class Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;
.super Lcom/vkontakte/android/attachments/AttachmentViewHolder;
.source "DocumentAttachment.java"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/attachments/DocumentAttachment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "GifHolder"
.end annotation


# instance fields
.field attached:Z

.field listView:Lme/grishka/appkit/views/UsableRecyclerView;

.field mAttachment:Lcom/vkontakte/android/attachments/DocumentAttachment;

.field final mBackground:Landroid/view/View;

.field final mError:Landroid/view/View;

.field final mImageView:Lcom/vk/imageloader/view/VKImageView;

.field final mPlayButton:Landroid/view/View;

.field final mProgress:Landroid/widget/ProgressBar;

.field final mProgressDrawable:Lcom/vkontakte/android/ui/RadialProgressDrawable;

.field final mSize:Landroid/widget/TextView;

.field mTask:Lcom/vkontakte/android/background/AsyncTask;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/background/AsyncTask",
            "<***>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/view/View;Ljava/lang/String;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;
    .param p2, "tag"    # Ljava/lang/String;

    .prologue
    .line 503
    invoke-direct {p0, p2}, Lcom/vkontakte/android/attachments/AttachmentViewHolder;-><init>(Ljava/lang/String;)V

    .line 488
    new-instance v0, Lcom/vkontakte/android/ui/RadialProgressDrawable;

    invoke-direct {v0}, Lcom/vkontakte/android/ui/RadialProgressDrawable;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mProgressDrawable:Lcom/vkontakte/android/ui/RadialProgressDrawable;

    .line 498
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->attached:Z

    .line 504
    const v0, 0x7f1001df

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    iput-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mImageView:Lcom/vk/imageloader/view/VKImageView;

    .line 505
    const v0, 0x7f1001e2

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mSize:Landroid/widget/TextView;

    .line 506
    const v0, 0x7f100184

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mProgress:Landroid/widget/ProgressBar;

    .line 507
    const v0, 0x7f1001e1

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mPlayButton:Landroid/view/View;

    .line 508
    const v0, 0x7f1001e0

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mBackground:Landroid/view/View;

    .line 509
    const v0, 0x7f10001b

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mError:Landroid/view/View;

    .line 511
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mProgressDrawable:Lcom/vkontakte/android/ui/RadialProgressDrawable;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/RadialProgressDrawable;->setProgressColor(I)V

    .line 512
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mProgress:Landroid/widget/ProgressBar;

    iget-object v1, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mProgressDrawable:Lcom/vkontakte/android/ui/RadialProgressDrawable;

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 514
    invoke-virtual {p1, p0}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 515
    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 516
    return-void
.end method


# virtual methods
.method bind(Lcom/vkontakte/android/attachments/DocumentAttachment;)V
    .locals 4
    .param p1, "item"    # Lcom/vkontakte/android/attachments/DocumentAttachment;

    .prologue
    const/high16 v3, 0x3f400000    # 0.75f

    .line 519
    iput-object p1, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mAttachment:Lcom/vkontakte/android/attachments/DocumentAttachment;

    .line 520
    invoke-static {p1}, Lcom/vkontakte/android/attachments/DocumentAttachment;->access$400(Lcom/vkontakte/android/attachments/DocumentAttachment;)Lcom/vkontakte/android/ui/animation/MovieDrawable;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-static {p1}, Lcom/vkontakte/android/attachments/DocumentAttachment;->access$400(Lcom/vkontakte/android/attachments/DocumentAttachment;)Lcom/vkontakte/android/ui/animation/MovieDrawable;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/ui/animation/MovieDrawable;->isReady()Z

    move-result v1

    if-nez v1, :cond_2

    .line 521
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mImageView:Lcom/vk/imageloader/view/VKImageView;

    iget-object v2, p1, Lcom/vkontakte/android/attachments/DocumentAttachment;->thumb:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 526
    :goto_0
    iget v1, p1, Lcom/vkontakte/android/attachments/DocumentAttachment;->width:I

    int-to-float v1, v1

    iget v2, p1, Lcom/vkontakte/android/attachments/DocumentAttachment;->height:I

    int-to-float v2, v2

    div-float v0, v1, v2

    .line 527
    .local v0, "ratio":F
    iget-object v1, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mImageView:Lcom/vk/imageloader/view/VKImageView;

    invoke-static {v3, v0}, Ljava/lang/Math;->max(FF)F

    move-result v2

    invoke-virtual {v1, v2}, Lcom/vk/imageloader/view/VKImageView;->setAspectRatio(F)V

    .line 528
    cmpg-float v1, v0, v3

    if-gez v1, :cond_1

    .line 529
    iget-object v1, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mImageView:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v1}, Lcom/vk/imageloader/view/VKImageView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v1

    new-instance v2, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$1;

    invoke-direct {v2, p0, p1}, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$1;-><init>(Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;Lcom/vkontakte/android/attachments/DocumentAttachment;)V

    invoke-virtual {v1, v2}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 541
    :cond_1
    invoke-virtual {p0}, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->showInitialLayout()V

    .line 542
    return-void

    .line 523
    .end local v0    # "ratio":F
    :cond_2
    iget-object v1, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mImageView:Lcom/vk/imageloader/view/VKImageView;

    invoke-static {p1}, Lcom/vkontakte/android/attachments/DocumentAttachment;->access$400(Lcom/vkontakte/android/attachments/DocumentAttachment;)Lcom/vkontakte/android/ui/animation/MovieDrawable;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vk/imageloader/view/VKImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0
.end method

.method getPercentageOnScreen()F
    .locals 9

    .prologue
    const/4 v8, 0x1

    .line 659
    iget-object v7, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->listView:Lme/grishka/appkit/views/UsableRecyclerView;

    if-eqz v7, :cond_0

    iget-object v7, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mImageView:Lcom/vk/imageloader/view/VKImageView;

    if-nez v7, :cond_1

    .line 660
    :cond_0
    const/4 v7, 0x0

    .line 679
    :goto_0
    return v7

    .line 662
    :cond_1
    const/4 v7, 0x2

    new-array v4, v7, [I

    .line 663
    .local v4, "location":[I
    iget-object v7, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->listView:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v7, v4}, Lme/grishka/appkit/views/UsableRecyclerView;->getLocationOnScreen([I)V

    .line 664
    aget v6, v4, v8

    .line 665
    .local v6, "parentTop":I
    iget-object v7, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->listView:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v7}, Lme/grishka/appkit/views/UsableRecyclerView;->getHeight()I

    move-result v7

    add-int v5, v6, v7

    .line 667
    .local v5, "parentBottom":I
    iget-object v7, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mImageView:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v7, v4}, Lcom/vk/imageloader/view/VKImageView;->getLocationOnScreen([I)V

    .line 668
    aget v2, v4, v8

    .line 669
    .local v2, "childTop":I
    iget-object v7, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mImageView:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v7}, Lcom/vk/imageloader/view/VKImageView;->getHeight()I

    move-result v1

    .line 670
    .local v1, "childHeight":I
    add-int v0, v2, v1

    .line 673
    .local v0, "childBottom":I
    if-ge v2, v6, :cond_2

    .line 674
    sub-int v7, v6, v0

    invoke-static {v7}, Ljava/lang/Math;->abs(I)I

    move-result v7

    int-to-float v3, v7

    .line 679
    .local v3, "diff":F
    :goto_1
    const/high16 v7, 0x3f800000    # 1.0f

    int-to-float v8, v1

    div-float v8, v3, v8

    invoke-static {v7, v8}, Ljava/lang/Math;->min(FF)F

    move-result v7

    goto :goto_0

    .line 676
    .end local v3    # "diff":F
    :cond_2
    sub-int v7, v2, v5

    invoke-static {v7}, Ljava/lang/Math;->abs(I)I

    move-result v7

    int-to-float v3, v7

    .restart local v3    # "diff":F
    goto :goto_1
.end method

.method getScreenCenterDistance()I
    .locals 10

    .prologue
    const/4 v9, 0x1

    .line 638
    iget-object v8, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->listView:Lme/grishka/appkit/views/UsableRecyclerView;

    if-eqz v8, :cond_0

    iget-object v8, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mImageView:Lcom/vk/imageloader/view/VKImageView;

    if-nez v8, :cond_1

    .line 639
    :cond_0
    const/4 v8, -0x1

    .line 654
    :goto_0
    return v8

    .line 641
    :cond_1
    const/4 v8, 0x2

    new-array v4, v8, [I

    .line 642
    .local v4, "location":[I
    iget-object v8, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->listView:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v8, v4}, Lme/grishka/appkit/views/UsableRecyclerView;->getLocationOnScreen([I)V

    .line 643
    aget v7, v4, v9

    .line 644
    .local v7, "parentTop":I
    iget-object v8, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->listView:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v8}, Lme/grishka/appkit/views/UsableRecyclerView;->getHeight()I

    move-result v8

    add-int v5, v7, v8

    .line 646
    .local v5, "parentBottom":I
    iget-object v8, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mImageView:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v8, v4}, Lcom/vk/imageloader/view/VKImageView;->getLocationOnScreen([I)V

    .line 647
    aget v3, v4, v9

    .line 648
    .local v3, "childTop":I
    iget-object v8, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mImageView:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v8}, Lcom/vk/imageloader/view/VKImageView;->getHeight()I

    move-result v2

    .line 649
    .local v2, "childHeight":I
    add-int v0, v3, v2

    .line 651
    .local v0, "childBottom":I
    sub-int v8, v5, v7

    div-int/lit8 v8, v8, 0x2

    add-int v6, v7, v8

    .line 652
    .local v6, "parentCenter":I
    sub-int v8, v0, v3

    div-int/lit8 v8, v8, 0x2

    add-int v1, v3, v8

    .line 654
    .local v1, "childCenter":I
    sub-int v8, v1, v6

    invoke-static {v8}, Ljava/lang/Math;->abs(I)I

    move-result v8

    goto :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 7
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const/4 v2, 0x0

    .line 546
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v0

    .line 547
    .local v0, "activity":Landroid/app/Activity;
    iget-object v3, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mAttachment:Lcom/vkontakte/android/attachments/DocumentAttachment;

    invoke-static {v3}, Lcom/vkontakte/android/attachments/DocumentAttachment;->access$800(Lcom/vkontakte/android/attachments/DocumentAttachment;)Lcom/vk/core/widget/LifecycleHandler;

    move-result-object v3

    if-nez v3, :cond_0

    .line 548
    iget-object v3, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mAttachment:Lcom/vkontakte/android/attachments/DocumentAttachment;

    invoke-static {v0}, Lcom/vk/core/widget/LifecycleHandler;->install(Landroid/app/Activity;)Lcom/vk/core/widget/LifecycleHandler;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/vkontakte/android/attachments/DocumentAttachment;->access$802(Lcom/vkontakte/android/attachments/DocumentAttachment;Lcom/vk/core/widget/LifecycleHandler;)Lcom/vk/core/widget/LifecycleHandler;

    .line 549
    iget-object v3, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mAttachment:Lcom/vkontakte/android/attachments/DocumentAttachment;

    invoke-static {v3}, Lcom/vkontakte/android/attachments/DocumentAttachment;->access$800(Lcom/vkontakte/android/attachments/DocumentAttachment;)Lcom/vk/core/widget/LifecycleHandler;

    move-result-object v3

    new-instance v4, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$2;

    invoke-direct {v4, p0}, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$2;-><init>(Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;)V

    invoke-virtual {v3, v4}, Lcom/vk/core/widget/LifecycleHandler;->setLifecycleListener(Lcom/vk/core/widget/LifecycleListener;)V

    .line 566
    :cond_0
    iget-object v3, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mAttachment:Lcom/vkontakte/android/attachments/DocumentAttachment;

    invoke-static {v3}, Lcom/vkontakte/android/attachments/DocumentAttachment;->access$900(Lcom/vkontakte/android/attachments/DocumentAttachment;)Z

    move-result v3

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mAttachment:Lcom/vkontakte/android/attachments/DocumentAttachment;

    invoke-static {v3}, Lcom/vkontakte/android/attachments/DocumentAttachment;->access$200(Lcom/vkontakte/android/attachments/DocumentAttachment;)Z

    move-result v3

    if-nez v3, :cond_2

    iget-object v3, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mAttachment:Lcom/vkontakte/android/attachments/DocumentAttachment;

    invoke-virtual {v3}, Lcom/vkontakte/android/attachments/DocumentAttachment;->isPlaying()Z

    move-result v3

    if-nez v3, :cond_2

    .line 567
    :cond_1
    iget-object v3, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mAttachment:Lcom/vkontakte/android/attachments/DocumentAttachment;

    invoke-virtual {v3, v2}, Lcom/vkontakte/android/attachments/DocumentAttachment;->start(Z)V

    .line 635
    :goto_0
    return-void

    .line 569
    :cond_2
    const/4 v3, 0x2

    new-array v1, v3, [I

    .line 570
    .local v1, "locationInWindow":[I
    iget-object v3, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mAttachment:Lcom/vkontakte/android/attachments/DocumentAttachment;

    iget-object v4, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mAttachment:Lcom/vkontakte/android/attachments/DocumentAttachment;

    new-instance v5, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$3;

    invoke-direct {v5, p0, p1, v1}, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$3;-><init>(Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;Landroid/view/View;[I)V

    iget-object v6, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mTask:Lcom/vkontakte/android/background/AsyncTask;

    if-eqz v6, :cond_3

    iget-object v6, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mTask:Lcom/vkontakte/android/background/AsyncTask;

    .line 629
    invoke-virtual {v6}, Lcom/vkontakte/android/background/AsyncTask;->isRunning()Z

    move-result v6

    if-eqz v6, :cond_3

    const/4 v2, 0x1

    .line 570
    :cond_3
    invoke-static {v0, v4, v5, v2}, Lcom/vkontakte/android/gifs/GifViewer;->create(Landroid/app/Activity;Lcom/vkontakte/android/attachments/DocumentAttachment;Lcom/vkontakte/android/gifs/GifViewer$Provider;Z)Lcom/vkontakte/android/gifs/GifViewer;

    move-result-object v2

    invoke-static {v3, v2}, Lcom/vkontakte/android/attachments/DocumentAttachment;->access$1002(Lcom/vkontakte/android/attachments/DocumentAttachment;Lcom/vkontakte/android/gifs/GifViewer;)Lcom/vkontakte/android/gifs/GifViewer;

    .line 632
    iget-object v2, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mAttachment:Lcom/vkontakte/android/attachments/DocumentAttachment;

    invoke-virtual {v2}, Lcom/vkontakte/android/attachments/DocumentAttachment;->pause()V

    .line 633
    iget-object v2, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mAttachment:Lcom/vkontakte/android/attachments/DocumentAttachment;

    invoke-static {v2}, Lcom/vkontakte/android/attachments/DocumentAttachment;->access$1000(Lcom/vkontakte/android/attachments/DocumentAttachment;)Lcom/vkontakte/android/gifs/GifViewer;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/gifs/GifViewer;->show()V

    goto :goto_0
.end method

.method public onViewAttachedToWindow(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 686
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->attached:Z

    .line 687
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->listView:Lme/grishka/appkit/views/UsableRecyclerView;

    if-nez v0, :cond_0

    .line 688
    invoke-virtual {p1}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object v0

    const v1, 0x7f10018a

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lme/grishka/appkit/views/UsableRecyclerView;

    iput-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->listView:Lme/grishka/appkit/views/UsableRecyclerView;

    .line 690
    :cond_0
    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 694
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->attached:Z

    .line 695
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mAttachment:Lcom/vkontakte/android/attachments/DocumentAttachment;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/DocumentAttachment;->access$500(Lcom/vkontakte/android/attachments/DocumentAttachment;)Lcom/vkontakte/android/media/AutoPlay$Listener;

    move-result-object v0

    if-nez v0, :cond_0

    .line 696
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mAttachment:Lcom/vkontakte/android/attachments/DocumentAttachment;

    invoke-virtual {v0}, Lcom/vkontakte/android/attachments/DocumentAttachment;->stop()V

    .line 698
    :cond_0
    return-void
.end method

.method setProgress(I)V
    .locals 1
    .param p1, "progress"    # I

    .prologue
    .line 731
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v0, p1}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 732
    return-void
.end method

.method showDone()V
    .locals 2

    .prologue
    const/16 v1, 0x8

    .line 735
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 736
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mPlayButton:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 737
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mBackground:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 738
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mError:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 739
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->updateSubtitle(Z)V

    .line 740
    return-void
.end method

.method showError()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 743
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 744
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mProgressDrawable:Lcom/vkontakte/android/ui/RadialProgressDrawable;

    const/high16 v1, 0x3fc00000    # 1.5f

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/RadialProgressDrawable;->setThickness(F)V

    .line 745
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mProgress:Landroid/widget/ProgressBar;

    const/16 v1, 0x64

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 746
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mProgressDrawable:Lcom/vkontakte/android/ui/RadialProgressDrawable;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/ui/RadialProgressDrawable;->setProgress(FZ)V

    .line 747
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mPlayButton:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 748
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mBackground:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 749
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mError:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 750
    invoke-virtual {p0}, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->updateSubtitle()V

    .line 751
    return-void
.end method

.method showInitialLayout()V
    .locals 2

    .prologue
    .line 701
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mAttachment:Lcom/vkontakte/android/attachments/DocumentAttachment;

    iget-boolean v0, v0, Lcom/vkontakte/android/attachments/DocumentAttachment;->wasPlayed:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mAttachment:Lcom/vkontakte/android/attachments/DocumentAttachment;

    invoke-virtual {v0}, Lcom/vkontakte/android/attachments/DocumentAttachment;->isPrepared()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mAttachment:Lcom/vkontakte/android/attachments/DocumentAttachment;

    iget-boolean v0, v0, Lcom/vkontakte/android/attachments/DocumentAttachment;->wasPlayed:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mAttachment:Lcom/vkontakte/android/attachments/DocumentAttachment;

    .line 702
    invoke-static {v0}, Lcom/vkontakte/android/attachments/DocumentAttachment;->access$600(Lcom/vkontakte/android/attachments/DocumentAttachment;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 703
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mError:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 704
    invoke-virtual {p0}, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->showPlayButton()V

    .line 705
    invoke-virtual {p0}, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->updateSubtitle()V

    .line 706
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mImageView:Lcom/vk/imageloader/view/VKImageView;

    iget-object v1, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mAttachment:Lcom/vkontakte/android/attachments/DocumentAttachment;

    iget-object v1, v1, Lcom/vkontakte/android/attachments/DocumentAttachment;->thumb:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 710
    :goto_0
    return-void

    .line 708
    :cond_2
    invoke-virtual {p0}, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->showDone()V

    goto :goto_0
.end method

.method showPlayButton()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 713
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 714
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mPlayButton:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 715
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mBackground:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 716
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mProgressDrawable:Lcom/vkontakte/android/ui/RadialProgressDrawable;

    const/high16 v1, 0x3fc00000    # 1.5f

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/RadialProgressDrawable;->setThickness(F)V

    .line 717
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mProgress:Landroid/widget/ProgressBar;

    const/16 v1, 0x64

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 718
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mProgressDrawable:Lcom/vkontakte/android/ui/RadialProgressDrawable;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/ui/RadialProgressDrawable;->setProgress(FZ)V

    .line 719
    return-void
.end method

.method showProgress()V
    .locals 3

    .prologue
    const/16 v1, 0x8

    const/4 v2, 0x0

    .line 722
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 723
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mPlayButton:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 724
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mBackground:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 725
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mError:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 726
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mProgressDrawable:Lcom/vkontakte/android/ui/RadialProgressDrawable;

    const/high16 v1, 0x40400000    # 3.0f

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/RadialProgressDrawable;->setThickness(F)V

    .line 727
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mProgressDrawable:Lcom/vkontakte/android/ui/RadialProgressDrawable;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/ui/RadialProgressDrawable;->setProgress(FZ)V

    .line 728
    return-void
.end method

.method updateSubtitle()V
    .locals 2

    .prologue
    .line 754
    invoke-static {}, Lcom/vkontakte/android/attachments/DocumentAttachment;->access$100()Lcom/vkontakte/android/cache/Gifs;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mAttachment:Lcom/vkontakte/android/attachments/DocumentAttachment;

    invoke-virtual {v1}, Lcom/vkontakte/android/attachments/DocumentAttachment;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/cache/Gifs;->contains(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mAttachment:Lcom/vkontakte/android/attachments/DocumentAttachment;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/DocumentAttachment;->access$600(Lcom/vkontakte/android/attachments/DocumentAttachment;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->updateSubtitle(Z)V

    .line 755
    return-void

    .line 754
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method updateSubtitle(Z)V
    .locals 5
    .param p1, "compact"    # Z

    .prologue
    .line 758
    if-eqz p1, :cond_0

    .line 759
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mSize:Landroid/widget/TextView;

    const-string/jumbo v1, "GIF"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 763
    :goto_0
    return-void

    .line 761
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mSize:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "GIF, "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mAttachment:Lcom/vkontakte/android/attachments/DocumentAttachment;

    iget v2, v2, Lcom/vkontakte/android/attachments/DocumentAttachment;->size:I

    int-to-long v2, v2

    iget-object v4, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mImageView:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v4}, Lcom/vk/imageloader/view/VKImageView;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/vkontakte/android/Global;->langFileSize(JLandroid/content/res/Resources;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method
