.class public Lcom/vkontakte/android/gifs/GifViewer;
.super Lcom/vkontakte/android/gifs/VKWindow;
.source "GifViewer.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/vkontakte/android/gifs/GifRootLayout$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/gifs/GifViewer$Provider;
    }
.end annotation


# static fields
.field static final sGifs:Lcom/vkontakte/android/cache/Gifs;


# instance fields
.field ignoreCache:Z

.field private final lifecycleHandler:Lcom/vk/core/widget/LifecycleHandler;

.field mAccessKey:Ljava/lang/String;

.field mAddButton:Landroid/widget/ImageView;

.field mDocumentId:I

.field mDragView:Landroid/view/View;

.field mDrawable:Lcom/vkontakte/android/ui/animation/MovieDrawable;

.field mErrorLayout:Landroid/view/View;

.field mExtension:Ljava/lang/String;

.field mHeight:I

.field mImageView:Lcom/vkontakte/android/ui/widget/RatioImageView;

.field mOwnerId:I

.field mPosition:I

.field mPreview:Landroid/graphics/Bitmap;

.field mProgress:Lcom/vkontakte/android/ui/CircularProgressBar;

.field mProvider:Lcom/vkontakte/android/gifs/GifViewer$Provider;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field mRootView:Lcom/vkontakte/android/gifs/GifRootLayout;

.field mShareButton:Landroid/view/View;

.field mSize:I

.field mTask:Lcom/vkontakte/android/background/AsyncTask;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/background/AsyncTask",
            "<***>;"
        }
    .end annotation
.end field

.field mThumb:Ljava/lang/String;

.field mTitle:Ljava/lang/String;

.field mToolbar:Landroid/support/v7/widget/Toolbar;

.field mUrl:Ljava/lang/String;

.field mVideo:Ljava/lang/String;

.field mWidth:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 69
    invoke-static {}, Lcom/vkontakte/android/cache/Gifs;->get()Lcom/vkontakte/android/cache/Gifs;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/gifs/GifViewer;->sGifs:Lcom/vkontakte/android/cache/Gifs;

    return-void
.end method

.method constructor <init>(Landroid/app/Activity;)V
    .locals 2
    .param p1, "activity"    # Landroid/app/Activity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 136
    const v0, 0x7f0300b0

    invoke-direct {p0, p1, v0}, Lcom/vkontakte/android/gifs/VKWindow;-><init>(Landroid/app/Activity;I)V

    .line 137
    invoke-static {p1}, Lcom/vk/core/widget/LifecycleHandler;->install(Landroid/app/Activity;)Lcom/vk/core/widget/LifecycleHandler;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer;->lifecycleHandler:Lcom/vk/core/widget/LifecycleHandler;

    .line 138
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer;->lifecycleHandler:Lcom/vk/core/widget/LifecycleHandler;

    new-instance v1, Lcom/vkontakte/android/gifs/GifViewer$1;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/gifs/GifViewer$1;-><init>(Lcom/vkontakte/android/gifs/GifViewer;)V

    invoke-virtual {v0, v1}, Lcom/vk/core/widget/LifecycleHandler;->setLifecycleListener(Lcom/vk/core/widget/LifecycleListener;)V

    .line 153
    return-void
.end method

.method public static create(Landroid/app/Activity;Lcom/vkontakte/android/attachments/DocumentAttachment;Lcom/vkontakte/android/gifs/GifViewer$Provider;Z)Lcom/vkontakte/android/gifs/GifViewer;
    .locals 2
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "attachment"    # Lcom/vkontakte/android/attachments/DocumentAttachment;
    .param p2, "provider"    # Lcom/vkontakte/android/gifs/GifViewer$Provider;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "ignoreCache"    # Z

    .prologue
    .line 100
    new-instance v0, Lcom/vkontakte/android/gifs/GifViewer;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/gifs/GifViewer;-><init>(Landroid/app/Activity;)V

    .line 101
    .local v0, "viewer":Lcom/vkontakte/android/gifs/GifViewer;
    iget-object v1, p1, Lcom/vkontakte/android/attachments/DocumentAttachment;->title:Ljava/lang/String;

    iput-object v1, v0, Lcom/vkontakte/android/gifs/GifViewer;->mTitle:Ljava/lang/String;

    .line 102
    iget-object v1, p1, Lcom/vkontakte/android/attachments/DocumentAttachment;->url:Ljava/lang/String;

    iput-object v1, v0, Lcom/vkontakte/android/gifs/GifViewer;->mUrl:Ljava/lang/String;

    .line 103
    iget-object v1, p1, Lcom/vkontakte/android/attachments/DocumentAttachment;->video:Ljava/lang/String;

    iput-object v1, v0, Lcom/vkontakte/android/gifs/GifViewer;->mVideo:Ljava/lang/String;

    .line 104
    iget v1, p1, Lcom/vkontakte/android/attachments/DocumentAttachment;->width:I

    iput v1, v0, Lcom/vkontakte/android/gifs/GifViewer;->mWidth:I

    .line 105
    iget v1, p1, Lcom/vkontakte/android/attachments/DocumentAttachment;->height:I

    iput v1, v0, Lcom/vkontakte/android/gifs/GifViewer;->mHeight:I

    .line 106
    iget v1, p1, Lcom/vkontakte/android/attachments/DocumentAttachment;->oid:I

    iput v1, v0, Lcom/vkontakte/android/gifs/GifViewer;->mOwnerId:I

    .line 107
    iget v1, p1, Lcom/vkontakte/android/attachments/DocumentAttachment;->did:I

    iput v1, v0, Lcom/vkontakte/android/gifs/GifViewer;->mDocumentId:I

    .line 108
    iget-object v1, p1, Lcom/vkontakte/android/attachments/DocumentAttachment;->access_key:Ljava/lang/String;

    iput-object v1, v0, Lcom/vkontakte/android/gifs/GifViewer;->mAccessKey:Ljava/lang/String;

    .line 109
    iget v1, p1, Lcom/vkontakte/android/attachments/DocumentAttachment;->size:I

    iput v1, v0, Lcom/vkontakte/android/gifs/GifViewer;->mSize:I

    .line 110
    iget-object v1, p1, Lcom/vkontakte/android/attachments/DocumentAttachment;->thumb:Ljava/lang/String;

    iput-object v1, v0, Lcom/vkontakte/android/gifs/GifViewer;->mThumb:Ljava/lang/String;

    .line 111
    iget-object v1, p1, Lcom/vkontakte/android/attachments/DocumentAttachment;->extension:Ljava/lang/String;

    iput-object v1, v0, Lcom/vkontakte/android/gifs/GifViewer;->mExtension:Ljava/lang/String;

    .line 112
    invoke-virtual {p1}, Lcom/vkontakte/android/attachments/DocumentAttachment;->getPosition()I

    move-result v1

    iput v1, v0, Lcom/vkontakte/android/gifs/GifViewer;->mPosition:I

    .line 113
    iput-object p2, v0, Lcom/vkontakte/android/gifs/GifViewer;->mProvider:Lcom/vkontakte/android/gifs/GifViewer$Provider;

    .line 114
    iput-boolean p3, v0, Lcom/vkontakte/android/gifs/GifViewer;->ignoreCache:Z

    .line 115
    return-object v0
.end method

.method public static start(Landroid/app/Activity;Lcom/vkontakte/android/api/Document;)Lcom/vkontakte/android/gifs/GifViewer;
    .locals 2
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "attachment"    # Lcom/vkontakte/android/api/Document;

    .prologue
    .line 119
    new-instance v0, Lcom/vkontakte/android/gifs/GifViewer;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/gifs/GifViewer;-><init>(Landroid/app/Activity;)V

    .line 120
    .local v0, "viewer":Lcom/vkontakte/android/gifs/GifViewer;
    iget-object v1, p1, Lcom/vkontakte/android/api/Document;->title:Ljava/lang/String;

    iput-object v1, v0, Lcom/vkontakte/android/gifs/GifViewer;->mTitle:Ljava/lang/String;

    .line 121
    iget-object v1, p1, Lcom/vkontakte/android/api/Document;->url:Ljava/lang/String;

    iput-object v1, v0, Lcom/vkontakte/android/gifs/GifViewer;->mUrl:Ljava/lang/String;

    .line 122
    iget-object v1, p1, Lcom/vkontakte/android/api/Document;->video:Ljava/lang/String;

    iput-object v1, v0, Lcom/vkontakte/android/gifs/GifViewer;->mVideo:Ljava/lang/String;

    .line 123
    iget v1, p1, Lcom/vkontakte/android/api/Document;->width:I

    iput v1, v0, Lcom/vkontakte/android/gifs/GifViewer;->mWidth:I

    .line 124
    iget v1, p1, Lcom/vkontakte/android/api/Document;->height:I

    iput v1, v0, Lcom/vkontakte/android/gifs/GifViewer;->mHeight:I

    .line 125
    iget v1, p1, Lcom/vkontakte/android/api/Document;->oid:I

    iput v1, v0, Lcom/vkontakte/android/gifs/GifViewer;->mOwnerId:I

    .line 126
    iget v1, p1, Lcom/vkontakte/android/api/Document;->did:I

    iput v1, v0, Lcom/vkontakte/android/gifs/GifViewer;->mDocumentId:I

    .line 127
    iget-object v1, p1, Lcom/vkontakte/android/api/Document;->access_key:Ljava/lang/String;

    iput-object v1, v0, Lcom/vkontakte/android/gifs/GifViewer;->mAccessKey:Ljava/lang/String;

    .line 128
    iget v1, p1, Lcom/vkontakte/android/api/Document;->size:I

    iput v1, v0, Lcom/vkontakte/android/gifs/GifViewer;->mSize:I

    .line 129
    iget-object v1, p1, Lcom/vkontakte/android/api/Document;->thumb:Ljava/lang/String;

    iput-object v1, v0, Lcom/vkontakte/android/gifs/GifViewer;->mThumb:Ljava/lang/String;

    .line 130
    iget-object v1, p1, Lcom/vkontakte/android/api/Document;->ext:Ljava/lang/String;

    iput-object v1, v0, Lcom/vkontakte/android/gifs/GifViewer;->mExtension:Ljava/lang/String;

    .line 131
    invoke-virtual {v0}, Lcom/vkontakte/android/gifs/GifViewer;->show()V

    .line 132
    return-object v0
.end method

.method public static start(Landroid/app/Activity;Lcom/vkontakte/android/attachments/DocumentAttachment;Lcom/vkontakte/android/gifs/GifViewer$Provider;Z)Lcom/vkontakte/android/gifs/GifViewer;
    .locals 1
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "attachment"    # Lcom/vkontakte/android/attachments/DocumentAttachment;
    .param p2, "provider"    # Lcom/vkontakte/android/gifs/GifViewer$Provider;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "ignoreCache"    # Z

    .prologue
    .line 94
    invoke-static {p0, p1, p2, p3}, Lcom/vkontakte/android/gifs/GifViewer;->create(Landroid/app/Activity;Lcom/vkontakte/android/attachments/DocumentAttachment;Lcom/vkontakte/android/gifs/GifViewer$Provider;Z)Lcom/vkontakte/android/gifs/GifViewer;

    move-result-object v0

    .line 95
    .local v0, "viewer":Lcom/vkontakte/android/gifs/GifViewer;
    invoke-virtual {v0}, Lcom/vkontakte/android/gifs/GifViewer;->show()V

    .line 96
    return-object v0
.end method

.method public static start(Landroid/app/Activity;Lcom/vkontakte/android/attachments/DocumentAttachment;)V
    .locals 2
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "attachment"    # Lcom/vkontakte/android/attachments/DocumentAttachment;

    .prologue
    .line 90
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1}, Lcom/vkontakte/android/gifs/GifViewer;->start(Landroid/app/Activity;Lcom/vkontakte/android/attachments/DocumentAttachment;Lcom/vkontakte/android/gifs/GifViewer$Provider;Z)Lcom/vkontakte/android/gifs/GifViewer;

    .line 91
    return-void
.end method


# virtual methods
.method add()V
    .locals 4

    .prologue
    .line 549
    new-instance v0, Lcom/vkontakte/android/api/docs/DocsAdd;

    iget v1, p0, Lcom/vkontakte/android/gifs/GifViewer;->mOwnerId:I

    iget v2, p0, Lcom/vkontakte/android/gifs/GifViewer;->mDocumentId:I

    iget-object v3, p0, Lcom/vkontakte/android/gifs/GifViewer;->mAccessKey:Ljava/lang/String;

    invoke-direct {v0, v1, v2, v3}, Lcom/vkontakte/android/api/docs/DocsAdd;-><init>(IILjava/lang/String;)V

    .line 550
    invoke-virtual {p0}, Lcom/vkontakte/android/gifs/GifViewer;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/docs/DocsAdd;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    new-instance v1, Lcom/vkontakte/android/gifs/GifViewer$5;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/gifs/GifViewer$5;-><init>(Lcom/vkontakte/android/gifs/GifViewer;)V

    .line 551
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 563
    invoke-virtual {p0}, Lcom/vkontakte/android/gifs/GifViewer;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 564
    return-void
.end method

.method animateIn()V
    .locals 2

    .prologue
    .line 312
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer;->mImageView:Lcom/vkontakte/android/ui/widget/RatioImageView;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/widget/RatioImageView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    new-instance v1, Lcom/vkontakte/android/gifs/GifViewer$2;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/gifs/GifViewer$2;-><init>(Lcom/vkontakte/android/gifs/GifViewer;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 367
    return-void
.end method

.method animateOut(Ljava/lang/Runnable;)V
    .locals 2
    .param p1, "after"    # Ljava/lang/Runnable;

    .prologue
    .line 370
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer;->mImageView:Lcom/vkontakte/android/ui/widget/RatioImageView;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/widget/RatioImageView;->clearAnimation()V

    .line 371
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer;->mImageView:Lcom/vkontakte/android/ui/widget/RatioImageView;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/widget/RatioImageView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    new-instance v1, Lcom/vkontakte/android/gifs/GifViewer$3;

    invoke-direct {v1, p0, p1}, Lcom/vkontakte/android/gifs/GifViewer$3;-><init>(Lcom/vkontakte/android/gifs/GifViewer;Ljava/lang/Runnable;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 431
    return-void
.end method

.method public finish()V
    .locals 2

    .prologue
    .line 598
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer;->mProvider:Lcom/vkontakte/android/gifs/GifViewer$Provider;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer;->mPreview:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_1

    .line 599
    iget-object v1, p0, Lcom/vkontakte/android/gifs/GifViewer;->mProvider:Lcom/vkontakte/android/gifs/GifViewer$Provider;

    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer;->mDrawable:Lcom/vkontakte/android/ui/animation/MovieDrawable;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-interface {v1, v0}, Lcom/vkontakte/android/gifs/GifViewer$Provider;->onFinish(I)V

    .line 600
    invoke-static {p0}, Lcom/vkontakte/android/gifs/GifViewer$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/gifs/GifViewer;)Ljava/lang/Runnable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/gifs/GifViewer;->animateOut(Ljava/lang/Runnable;)V

    .line 604
    :goto_1
    return-void

    .line 599
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer;->mDrawable:Lcom/vkontakte/android/ui/animation/MovieDrawable;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/animation/MovieDrawable;->getPosition()I

    move-result v0

    goto :goto_0

    .line 602
    :cond_1
    invoke-super {p0}, Lcom/vkontakte/android/gifs/VKWindow;->finish()V

    goto :goto_1
.end method

.method public finishWithoutAnimation()V
    .locals 0

    .prologue
    .line 624
    invoke-super {p0}, Lcom/vkontakte/android/gifs/VKWindow;->finish()V

    .line 625
    return-void
.end method

.method public getClipTopBottom()[I
    .locals 1

    .prologue
    .line 619
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer;->mProvider:Lcom/vkontakte/android/gifs/GifViewer$Provider;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer;->mProvider:Lcom/vkontakte/android/gifs/GifViewer$Provider;

    invoke-interface {v0}, Lcom/vkontakte/android/gifs/GifViewer$Provider;->getClipTopBottom()[I

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getViewLocation()Landroid/graphics/Rect;
    .locals 1

    .prologue
    .line 613
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer;->mProvider:Lcom/vkontakte/android/gifs/GifViewer$Provider;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer;->mProvider:Lcom/vkontakte/android/gifs/GifViewer$Provider;

    invoke-interface {v0}, Lcom/vkontakte/android/gifs/GifViewer$Provider;->getViewLocation()Landroid/graphics/Rect;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasPreviewLocationData()Z
    .locals 1

    .prologue
    .line 608
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer;->mProvider:Lcom/vkontakte/android/gifs/GifViewer$Provider;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer;->mProvider:Lcom/vkontakte/android/gifs/GifViewer$Provider;

    invoke-interface {v0}, Lcom/vkontakte/android/gifs/GifViewer$Provider;->hasPreviewLocationData()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method invalidateMenu()V
    .locals 2

    .prologue
    .line 301
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0}, Landroid/support/v7/widget/Toolbar;->getMenu()Landroid/view/Menu;

    move-result-object v0

    invoke-interface {v0}, Landroid/view/Menu;->clear()V

    .line 302
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0}, Landroid/support/v7/widget/Toolbar;->getMenu()Landroid/view/Menu;

    move-result-object v0

    invoke-virtual {p0}, Lcom/vkontakte/android/gifs/GifViewer;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/gifs/GifViewer;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    .line 303
    return-void
.end method

.method synthetic lambda$finish$0()V
    .locals 0

    .prologue
    .line 600
    invoke-super {p0}, Lcom/vkontakte/android/gifs/VKWindow;->finish()V

    return-void
.end method

.method obtainData()V
    .locals 4

    .prologue
    .line 440
    new-instance v1, Lcom/vkontakte/android/gifs/GifViewer$4;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/gifs/GifViewer$4;-><init>(Lcom/vkontakte/android/gifs/GifViewer;)V

    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/String;

    const/4 v3, 0x0

    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer;->mVideo:Ljava/lang/String;

    .line 545
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer;->mUrl:Ljava/lang/String;

    :goto_0
    aput-object v0, v2, v3

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/gifs/GifViewer$4;->execPool([Ljava/lang/Object;)Lcom/vkontakte/android/background/AsyncTask;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer;->mTask:Lcom/vkontakte/android/background/AsyncTask;

    .line 546
    return-void

    .line 545
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer;->mVideo:Ljava/lang/String;

    goto :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 204
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    .line 228
    invoke-virtual {p0}, Lcom/vkontakte/android/gifs/GifViewer;->finish()V

    .line 232
    :cond_0
    :goto_0
    return-void

    .line 206
    :sswitch_0
    invoke-virtual {p0}, Lcom/vkontakte/android/gifs/GifViewer;->obtainData()V

    goto :goto_0

    .line 210
    :sswitch_1
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer;->mDrawable:Lcom/vkontakte/android/ui/animation/MovieDrawable;

    if-eqz v0, :cond_0

    .line 211
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer;->mDrawable:Lcom/vkontakte/android/ui/animation/MovieDrawable;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/animation/MovieDrawable;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 212
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer;->mDrawable:Lcom/vkontakte/android/ui/animation/MovieDrawable;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/animation/MovieDrawable;->stop()V

    goto :goto_0

    .line 214
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer;->mDrawable:Lcom/vkontakte/android/ui/animation/MovieDrawable;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/animation/MovieDrawable;->start()V

    goto :goto_0

    .line 220
    :sswitch_2
    invoke-virtual {p0}, Lcom/vkontakte/android/gifs/GifViewer;->add()V

    goto :goto_0

    .line 224
    :sswitch_3
    invoke-virtual {p0}, Lcom/vkontakte/android/gifs/GifViewer;->showShareDialog()V

    goto :goto_0

    .line 204
    nop

    :sswitch_data_0
    .sparse-switch
        0x7f1000b0 -> :sswitch_2
        0x7f100124 -> :sswitch_1
        0x7f1001a2 -> :sswitch_0
        0x7f1002c9 -> :sswitch_3
    .end sparse-switch
.end method

.method onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 3
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "menuInflater"    # Landroid/view/MenuInflater;

    .prologue
    const/4 v2, 0x0

    .line 306
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer;->mDrawable:Lcom/vkontakte/android/ui/animation/MovieDrawable;

    if-eqz v0, :cond_0

    .line 307
    const v0, 0x7f1005f1

    const v1, 0x7f0805d9

    invoke-interface {p1, v2, v0, v2, v1}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v0

    invoke-interface {v0, v2}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 309
    :cond_0
    return-void
.end method

.method public onCreateWindowLayoutParams()Landroid/view/WindowManager$LayoutParams;
    .locals 6

    .prologue
    const/4 v1, -0x1

    .line 157
    const/4 v4, 0x0

    .line 158
    .local v4, "windowFlags":I
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt v0, v2, :cond_1

    .line 159
    const v0, -0x7ffeff00

    or-int/2addr v4, v0

    .line 163
    :cond_0
    :goto_0
    new-instance v0, Landroid/view/WindowManager$LayoutParams;

    const/4 v3, 0x2

    const/4 v5, 0x1

    move v2, v1

    invoke-direct/range {v0 .. v5}, Landroid/view/WindowManager$LayoutParams;-><init>(IIIII)V

    return-object v0

    .line 160
    :cond_1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x13

    if-lt v0, v2, :cond_0

    .line 161
    const v0, 0xc010100

    or-int/2addr v4, v0

    goto :goto_0
.end method

.method onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 294
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f1005f1

    if-ne v0, v1, :cond_0

    .line 295
    invoke-virtual {p0}, Lcom/vkontakte/android/gifs/GifViewer;->saveGif()V

    .line 297
    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method public onViewCreated(Landroid/view/View;)V
    .locals 1
    .param p1, "root"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 184
    invoke-super {p0, p1}, Lcom/vkontakte/android/gifs/VKWindow;->onViewCreated(Landroid/view/View;)V

    .line 185
    invoke-virtual {p0}, Lcom/vkontakte/android/gifs/GifViewer;->setupUI()V

    .line 186
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer;->mDrawable:Lcom/vkontakte/android/ui/animation/MovieDrawable;

    if-nez v0, :cond_0

    .line 187
    invoke-virtual {p0}, Lcom/vkontakte/android/gifs/GifViewer;->obtainData()V

    .line 189
    :cond_0
    return-void
.end method

.method public onViewDestroyed()V
    .locals 1

    .prologue
    .line 193
    invoke-super {p0}, Lcom/vkontakte/android/gifs/VKWindow;->onViewDestroyed()V

    .line 194
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer;->mDrawable:Lcom/vkontakte/android/ui/animation/MovieDrawable;

    if-eqz v0, :cond_0

    .line 195
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer;->mDrawable:Lcom/vkontakte/android/ui/animation/MovieDrawable;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/animation/MovieDrawable;->recycle()V

    .line 197
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer;->mTask:Lcom/vkontakte/android/background/AsyncTask;

    if-eqz v0, :cond_1

    .line 198
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer;->mTask:Lcom/vkontakte/android/background/AsyncTask;

    invoke-virtual {v0}, Lcom/vkontakte/android/background/AsyncTask;->cancel()V

    .line 200
    :cond_1
    return-void
.end method

.method saveGif()V
    .locals 7

    .prologue
    .line 581
    new-instance v0, Ljava/io/File;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v4

    const-string/jumbo v5, "VK"

    invoke-direct {v0, v4, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 582
    .local v0, "dir":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_0

    .line 583
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 585
    :cond_0
    iget-object v4, p0, Lcom/vkontakte/android/gifs/GifViewer;->mVideo:Ljava/lang/String;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_2

    iget-object v4, p0, Lcom/vkontakte/android/gifs/GifViewer;->mUrl:Ljava/lang/String;

    :goto_0
    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    .line 586
    .local v3, "uri":Landroid/net/Uri;
    new-instance v2, Landroid/app/DownloadManager$Request;

    invoke-direct {v2, v3}, Landroid/app/DownloadManager$Request;-><init>(Landroid/net/Uri;)V

    .line 587
    .local v2, "request":Landroid/app/DownloadManager$Request;
    new-instance v5, Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v4, p0, Lcom/vkontakte/android/gifs/GifViewer;->mVideo:Ljava/lang/String;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_3

    const-string/jumbo v4, ".gif"

    :goto_1
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v5, v0, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v5}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/app/DownloadManager$Request;->setDestinationUri(Landroid/net/Uri;)Landroid/app/DownloadManager$Request;

    .line 588
    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Landroid/app/DownloadManager$Request;->setNotificationVisibility(I)Landroid/app/DownloadManager$Request;

    .line 589
    invoke-virtual {v2}, Landroid/app/DownloadManager$Request;->allowScanningByMediaScanner()V

    .line 590
    invoke-virtual {p0}, Lcom/vkontakte/android/gifs/GifViewer;->getActivity()Landroid/app/Activity;

    move-result-object v4

    const-string/jumbo v5, "download"

    invoke-virtual {v4, v5}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/DownloadManager;

    .line 591
    .local v1, "mgr":Landroid/app/DownloadManager;
    if-eqz v1, :cond_1

    .line 592
    invoke-virtual {v1, v2}, Landroid/app/DownloadManager;->enqueue(Landroid/app/DownloadManager$Request;)J

    .line 594
    :cond_1
    return-void

    .line 585
    .end local v1    # "mgr":Landroid/app/DownloadManager;
    .end local v2    # "request":Landroid/app/DownloadManager$Request;
    .end local v3    # "uri":Landroid/net/Uri;
    :cond_2
    iget-object v4, p0, Lcom/vkontakte/android/gifs/GifViewer;->mVideo:Ljava/lang/String;

    goto :goto_0

    .line 587
    .restart local v2    # "request":Landroid/app/DownloadManager$Request;
    .restart local v3    # "uri":Landroid/net/Uri;
    :cond_3
    const-string/jumbo v4, ".mp4"

    goto :goto_1
.end method

.method setAddVisibility(Z)V
    .locals 2
    .param p1, "visible"    # Z

    .prologue
    .line 434
    iget-object v1, p0, Lcom/vkontakte/android/gifs/GifViewer;->mAddButton:Landroid/widget/ImageView;

    if-eqz p1, :cond_0

    const/high16 v0, 0x3f800000    # 1.0f

    :goto_0
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 435
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer;->mAddButton:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setClickable(Z)V

    .line 436
    iget-object v1, p0, Lcom/vkontakte/android/gifs/GifViewer;->mAddButton:Landroid/widget/ImageView;

    if-eqz p1, :cond_1

    const v0, 0x7f020161

    :goto_1
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 437
    return-void

    .line 434
    :cond_0
    const v0, 0x3ecccccd    # 0.4f

    goto :goto_0

    .line 436
    :cond_1
    const v0, 0x7f020152

    goto :goto_1
.end method

.method setupUI()V
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "PrivateResource"
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 236
    const v0, 0x7f100184

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/gifs/GifViewer;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/CircularProgressBar;

    iput-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer;->mProgress:Lcom/vkontakte/android/ui/CircularProgressBar;

    .line 237
    const v0, 0x7f100124

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/gifs/GifViewer;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/widget/RatioImageView;

    iput-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer;->mImageView:Lcom/vkontakte/android/ui/widget/RatioImageView;

    .line 238
    const v0, 0x7f1002c7

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/gifs/GifViewer;->$(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer;->mDragView:Landroid/view/View;

    .line 239
    const v0, 0x7f1001a0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/gifs/GifViewer;->$(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer;->mErrorLayout:Landroid/view/View;

    .line 240
    const v0, 0x7f1000b0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/gifs/GifViewer;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer;->mAddButton:Landroid/widget/ImageView;

    .line 241
    const v0, 0x7f1002c9

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/gifs/GifViewer;->$(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer;->mShareButton:Landroid/view/View;

    .line 242
    const v0, 0x7f1002c6

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/gifs/GifViewer;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/gifs/GifRootLayout;

    iput-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer;->mRootView:Lcom/vkontakte/android/gifs/GifRootLayout;

    .line 244
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer;->mErrorLayout:Landroid/view/View;

    const v2, 0x7f1001a1

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const/4 v2, -0x1

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 245
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer;->mErrorLayout:Landroid/view/View;

    const v2, 0x7f1001a2

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 246
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer;->mImageView:Lcom/vkontakte/android/ui/widget/RatioImageView;

    invoke-virtual {v0, p0}, Lcom/vkontakte/android/ui/widget/RatioImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 247
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer;->mAddButton:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 248
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer;->mShareButton:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 249
    iget v0, p0, Lcom/vkontakte/android/gifs/GifViewer;->mOwnerId:I

    invoke-static {v0}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/gifs/GifViewer;->setAddVisibility(Z)V

    .line 250
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer;->mImageView:Lcom/vkontakte/android/ui/widget/RatioImageView;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/widget/RatioImageView;->setOrientation(I)V

    .line 251
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer;->mRootView:Lcom/vkontakte/android/gifs/GifRootLayout;

    invoke-virtual {v0, p0}, Lcom/vkontakte/android/gifs/GifRootLayout;->setNavigationProvider(Lcom/vkontakte/android/gifs/GifRootLayout$Callback;)V

    .line 253
    const v0, 0x7f1001b0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/gifs/GifViewer;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/Toolbar;

    iput-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer;->mToolbar:Landroid/support/v7/widget/Toolbar;

    .line 256
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer;->mToolbar:Landroid/support/v7/widget/Toolbar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 258
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer;->mToolbar:Landroid/support/v7/widget/Toolbar;

    const v1, 0x7f02014f

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setNavigationIcon(I)V

    .line 259
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0, p0}, Landroid/support/v7/widget/Toolbar;->setNavigationOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 260
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer;->mToolbar:Landroid/support/v7/widget/Toolbar;

    const v1, 0x7f0b01e7

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setPopupTheme(I)V

    .line 261
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-static {p0}, Lcom/vkontakte/android/gifs/GifViewer$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/gifs/GifViewer;)Landroid/support/v7/widget/Toolbar$OnMenuItemClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setOnMenuItemClickListener(Landroid/support/v7/widget/Toolbar$OnMenuItemClickListener;)V

    .line 262
    invoke-virtual {p0}, Lcom/vkontakte/android/gifs/GifViewer;->invalidateMenu()V

    .line 283
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer;->mProvider:Lcom/vkontakte/android/gifs/GifViewer$Provider;

    if-eqz v0, :cond_0

    .line 284
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer;->mProvider:Lcom/vkontakte/android/gifs/GifViewer$Provider;

    invoke-interface {v0}, Lcom/vkontakte/android/gifs/GifViewer$Provider;->getPreview()Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer;->mPreview:Landroid/graphics/Bitmap;

    .line 285
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer;->mPreview:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_0

    .line 286
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer;->mImageView:Lcom/vkontakte/android/ui/widget/RatioImageView;

    iget-object v1, p0, Lcom/vkontakte/android/gifs/GifViewer;->mPreview:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    int-to-float v1, v1

    iget-object v2, p0, Lcom/vkontakte/android/gifs/GifViewer;->mPreview:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v1, v2

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/widget/RatioImageView;->setImageRatio(F)V

    .line 287
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer;->mImageView:Lcom/vkontakte/android/ui/widget/RatioImageView;

    iget-object v1, p0, Lcom/vkontakte/android/gifs/GifViewer;->mPreview:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/widget/RatioImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 288
    invoke-virtual {p0}, Lcom/vkontakte/android/gifs/GifViewer;->animateIn()V

    .line 291
    :cond_0
    return-void

    :cond_1
    move v0, v1

    .line 249
    goto :goto_0
.end method

.method showShareDialog()V
    .locals 3

    .prologue
    .line 567
    new-instance v0, Lcom/vkontakte/android/api/Document;

    invoke-direct {v0}, Lcom/vkontakte/android/api/Document;-><init>()V

    .line 568
    .local v0, "document":Lcom/vkontakte/android/api/Document;
    iget v1, p0, Lcom/vkontakte/android/gifs/GifViewer;->mDocumentId:I

    iput v1, v0, Lcom/vkontakte/android/api/Document;->did:I

    .line 569
    iget v1, p0, Lcom/vkontakte/android/gifs/GifViewer;->mOwnerId:I

    iput v1, v0, Lcom/vkontakte/android/api/Document;->oid:I

    .line 570
    iget-object v1, p0, Lcom/vkontakte/android/gifs/GifViewer;->mExtension:Ljava/lang/String;

    iput-object v1, v0, Lcom/vkontakte/android/api/Document;->ext:Ljava/lang/String;

    .line 571
    iget v1, p0, Lcom/vkontakte/android/gifs/GifViewer;->mSize:I

    iput v1, v0, Lcom/vkontakte/android/api/Document;->size:I

    .line 572
    iget-object v1, p0, Lcom/vkontakte/android/gifs/GifViewer;->mThumb:Ljava/lang/String;

    iput-object v1, v0, Lcom/vkontakte/android/api/Document;->thumb:Ljava/lang/String;

    .line 573
    iget-object v1, p0, Lcom/vkontakte/android/gifs/GifViewer;->mAccessKey:Ljava/lang/String;

    iput-object v1, v0, Lcom/vkontakte/android/api/Document;->access_key:Ljava/lang/String;

    .line 575
    invoke-virtual {p0}, Lcom/vkontakte/android/gifs/GifViewer;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lcom/vk/sharing/Sharing;->from(Landroid/content/Context;)Lcom/vk/sharing/Sharing$Builder;

    move-result-object v1

    const-string/jumbo v2, "gifs"

    .line 576
    invoke-static {v0, v2}, Lcom/vk/sharing/attachment/Attachments;->createInfo(Lcom/vkontakte/android/api/Document;Ljava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vk/sharing/Sharing$Builder;->withAttachment(Lcom/vk/sharing/attachment/AttachmentInfo;)Lcom/vk/sharing/Sharing$Builder;

    move-result-object v1

    .line 577
    invoke-virtual {v1}, Lcom/vk/sharing/Sharing$Builder;->share()V

    .line 578
    return-void
.end method
