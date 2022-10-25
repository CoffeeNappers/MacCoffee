.class Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "VideoAttachment.java"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/attachments/VideoAttachment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AutoPlayHolder"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder$ShowProgressRunnable;,
        Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder$State;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/attachments/VideoAttachment;",
        ">;",
        "Landroid/view/View$OnAttachStateChangeListener;",
        "Landroid/view/View$OnClickListener;"
    }
.end annotation


# static fields
.field static final DEFAULT_IMAGE_RATIO:F = 0.5625f

.field static final STATE_DONE:I = 0x3

.field static final STATE_ERROR:I = 0x4

.field static final STATE_INITIAL:I = 0x1

.field static final STATE_NONE:I = 0x0

.field static final STATE_PAUSE:I = 0x6

.field static final STATE_PROGRESS:I = 0x2

.field static final STATE_REPLAY:I = 0x5


# instance fields
.field listView:Lme/grishka/appkit/views/UsableRecyclerView;

.field private mAttachedToWindow:Z

.field final mAudioDrawable:Lcom/vkontakte/android/ui/drawable/AudioVisualizerDrawable;

.field final mDuration:Landroid/widget/TextView;

.field final mDurationIcon:Landroid/widget/ImageView;

.field final mDurationWrap:Landroid/view/View;

.field final mError:Landroid/view/View;

.field final mErrorText:Landroid/widget/TextView;

.field final mIconWrap:Landroid/view/View;

.field final mOverlay:Landroid/view/View;

.field final mPlayButton:Landroid/view/View;

.field final mPreview:Landroid/widget/ImageView;

.field final mProgress:Landroid/widget/ProgressBar;

.field final mReplayButton:Landroid/view/View;

.field mState:I

.field final mVideoWrap:Lcom/vkontakte/android/ui/widget/RatioFrameLayout;

.field resize:Landroid/view/animation/Animation;

.field showProgressRunnable:Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder$ShowProgressRunnable;

.field final videoDisplay:Lcom/vkontakte/android/ui/widget/VideoTextureView;

.field final viewBounds:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const v1, 0x7f100204

    const/4 v2, -0x1

    .line 848
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(Landroid/view/View;)V

    .line 823
    new-instance v0, Lcom/vkontakte/android/ui/drawable/AudioVisualizerDrawable;

    invoke-direct {v0}, Lcom/vkontakte/android/ui/drawable/AudioVisualizerDrawable;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mAudioDrawable:Lcom/vkontakte/android/ui/drawable/AudioVisualizerDrawable;

    .line 824
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->viewBounds:Landroid/graphics/Rect;

    .line 843
    const/4 v0, 0x0

    iput v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mState:I

    .line 849
    const v0, 0x7f1001fd

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mPreview:Landroid/widget/ImageView;

    .line 850
    const v0, 0x7f100184

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mProgress:Landroid/widget/ProgressBar;

    .line 851
    const v0, 0x7f1001e1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->$(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mPlayButton:Landroid/view/View;

    .line 852
    const v0, 0x7f100202

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->$(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mIconWrap:Landroid/view/View;

    .line 853
    const v0, 0x7f1001de

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mDuration:Landroid/widget/TextView;

    .line 854
    const v0, 0x7f1001ff

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->$(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mDurationWrap:Landroid/view/View;

    .line 855
    const v0, 0x7f100203

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mDurationIcon:Landroid/widget/ImageView;

    .line 856
    const v0, 0x7f100201

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/widget/VideoTextureView;

    iput-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->videoDisplay:Lcom/vkontakte/android/ui/widget/VideoTextureView;

    .line 857
    const v0, 0x7f100200

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/widget/RatioFrameLayout;

    iput-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mVideoWrap:Lcom/vkontakte/android/ui/widget/RatioFrameLayout;

    .line 858
    const v0, 0x7f100117

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->$(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mOverlay:Landroid/view/View;

    .line 859
    const v0, 0x7f100205

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->$(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mError:Landroid/view/View;

    .line 860
    const v0, 0x7f100206

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mErrorText:Landroid/widget/TextView;

    .line 861
    invoke-virtual {p0, v1}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->$(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mReplayButton:Landroid/view/View;

    .line 863
    const v0, 0x7f100207

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->$(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 864
    invoke-virtual {p0, v1}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->$(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 866
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 867
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 868
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mVideoWrap:Lcom/vkontakte/android/ui/widget/RatioFrameLayout;

    invoke-virtual {v0, p0}, Lcom/vkontakte/android/ui/widget/RatioFrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 870
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mAudioDrawable:Lcom/vkontakte/android/ui/drawable/AudioVisualizerDrawable;

    invoke-virtual {v0, v2}, Lcom/vkontakte/android/ui/drawable/AudioVisualizerDrawable;->setColor(I)Lcom/vkontakte/android/ui/drawable/AudioVisualizerDrawable;

    .line 871
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mDurationIcon:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mAudioDrawable:Lcom/vkontakte/android/ui/drawable/AudioVisualizerDrawable;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 872
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getIndeterminateDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    sget-object v1, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v0, v2, v1}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 873
    return-void
.end method

.method static synthetic access$100(Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;ZZ)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;
    .param p1, "x1"    # Z
    .param p2, "x2"    # Z

    .prologue
    .line 807
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->animateWrap(ZZ)V

    return-void
.end method

.method static synthetic access$1000(Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;

    .prologue
    .line 807
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->showProgressDelayed()V

    return-void
.end method

.method static synthetic access$1100(Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;

    .prologue
    .line 807
    iget-boolean v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mAttachedToWindow:Z

    return v0
.end method

.method static synthetic access$1800(Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;I)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;
    .param p1, "x1"    # I

    .prologue
    .line 807
    invoke-direct {p0, p1}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->setIconWrapWidth(I)V

    return-void
.end method

.method static synthetic access$900(Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;

    .prologue
    .line 807
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->cancelProgressDelayed()V

    return-void
.end method

.method private animateWrap(ZZ)V
    .locals 12
    .param p1, "showProgress"    # Z
    .param p2, "showPlay"    # Z

    .prologue
    const/16 v11, 0x12c

    const/16 v10, 0x8

    const/4 v4, 0x0

    const/4 v9, 0x0

    .line 1122
    if-nez p1, :cond_0

    .line 1123
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->cancelProgressDelayed()V

    .line 1125
    :cond_0
    const/high16 v1, 0x41600000    # 14.0f

    invoke-static {v1}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v8

    .line 1126
    .local v8, "size":I
    new-instance v6, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder$1;

    invoke-direct {v6, p0, p2, p1, v8}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder$1;-><init>(Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;ZZI)V

    .line 1147
    .local v6, "listener":Landroid/view/animation/Animation$AnimationListener;
    if-nez p1, :cond_1

    if-eqz p2, :cond_5

    :cond_1
    const/4 v7, 0x1

    .line 1148
    .local v7, "show":Z
    :goto_0
    new-instance v0, Lcom/vkontakte/android/ui/animation/ResizeAnimation;

    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mIconWrap:Landroid/view/View;

    if-eqz v7, :cond_6

    move v2, v4

    :goto_1
    int-to-float v3, v8

    if-eqz v7, :cond_2

    int-to-float v4, v8

    :cond_2
    int-to-float v5, v8

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/ui/animation/ResizeAnimation;-><init>(Landroid/view/View;FFFF)V

    .line 1149
    .local v0, "resize":Landroid/view/animation/Animation;
    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->resize:Landroid/view/animation/Animation;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 1150
    invoke-virtual {v0, v6}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 1151
    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mIconWrap:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->clearAnimation()V

    .line 1152
    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mIconWrap:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 1153
    iput-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->resize:Landroid/view/animation/Animation;

    .line 1155
    :cond_3
    iget-object v2, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mDurationIcon:Landroid/widget/ImageView;

    if-eqz p2, :cond_7

    move v1, v9

    :goto_2
    invoke-static {v2, v1, v9, v11}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;IZI)V

    .line 1156
    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mProgress:Landroid/widget/ProgressBar;

    if-eqz p1, :cond_4

    move v10, v9

    :cond_4
    invoke-static {v1, v10, v9, v11}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;IZI)V

    .line 1157
    return-void

    .end local v0    # "resize":Landroid/view/animation/Animation;
    .end local v7    # "show":Z
    :cond_5
    move v7, v9

    .line 1147
    goto :goto_0

    .line 1148
    .restart local v7    # "show":Z
    :cond_6
    int-to-float v2, v8

    goto :goto_1

    .restart local v0    # "resize":Landroid/view/animation/Animation;
    :cond_7
    move v1, v10

    .line 1155
    goto :goto_2
.end method

.method private cancelProgressDelayed()V
    .locals 1

    .prologue
    .line 1109
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->showProgressRunnable:Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder$ShowProgressRunnable;

    if-eqz v0, :cond_0

    .line 1110
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->showProgressRunnable:Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder$ShowProgressRunnable;

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 1111
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->showProgressRunnable:Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder$ShowProgressRunnable;

    .line 1113
    :cond_0
    return-void
.end method

.method private setIconWrapWidth(I)V
    .locals 2
    .param p1, "width"    # I

    .prologue
    .line 1116
    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mIconWrap:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 1117
    .local v0, "params":Landroid/view/ViewGroup$LayoutParams;
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 1118
    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mIconWrap:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1119
    return-void
.end method

.method private setInitDurationView()V
    .locals 3

    .prologue
    .line 933
    invoke-virtual {p0}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->getItem()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/attachments/VideoAttachment;

    iget-object v0, v1, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    .line 934
    .local v0, "video":Lcom/vkontakte/android/api/VideoFile;
    iget-object v2, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mDuration:Landroid/widget/TextView;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/VideoFile;->isLiveUpcoming()Z

    move-result v1

    if-eqz v1, :cond_0

    const v1, 0x7f08075c

    .line 935
    invoke-virtual {p0, v1}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 934
    :goto_0
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 939
    return-void

    .line 936
    :cond_0
    invoke-virtual {v0}, Lcom/vkontakte/android/api/VideoFile;->isLive()Z

    move-result v1

    if-eqz v1, :cond_1

    const v1, 0x7f0807f3

    .line 937
    invoke-virtual {p0, v1}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_1
    iget v1, v0, Lcom/vkontakte/android/api/VideoFile;->duration:I

    .line 938
    invoke-static {v1}, Lcom/vkontakte/android/cache/Videos;->formatDuration(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method private showProgressDelayed()V
    .locals 4

    .prologue
    .line 1103
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->cancelProgressDelayed()V

    .line 1104
    new-instance v1, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder$ShowProgressRunnable;

    invoke-virtual {p0}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/VideoAttachment;

    iget-object v0, v0, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    invoke-direct {v1, p0, v0}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder$ShowProgressRunnable;-><init>(Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;Lcom/vkontakte/android/api/VideoFile;)V

    iput-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->showProgressRunnable:Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder$ShowProgressRunnable;

    .line 1105
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->showProgressRunnable:Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder$ShowProgressRunnable;

    const-wide/16 v2, 0x1f4

    invoke-static {v0, v2, v3}, Lcom/vkontakte/android/ViewUtils;->postDelayed(Ljava/lang/Runnable;J)V

    .line 1106
    return-void
.end method


# virtual methods
.method public getPercentageOnScreen()F
    .locals 7

    .prologue
    const/high16 v6, 0x42c80000    # 100.0f

    const/4 v3, 0x0

    .line 963
    iget-object v4, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->listView:Lme/grishka/appkit/views/UsableRecyclerView;

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mVideoWrap:Lcom/vkontakte/android/ui/widget/RatioFrameLayout;

    if-nez v4, :cond_1

    .line 975
    :cond_0
    :goto_0
    return v3

    .line 966
    :cond_1
    iget-object v4, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mVideoWrap:Lcom/vkontakte/android/ui/widget/RatioFrameLayout;

    iget-object v5, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->viewBounds:Landroid/graphics/Rect;

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/ui/widget/RatioFrameLayout;->getLocalVisibleRect(Landroid/graphics/Rect;)Z

    .line 967
    iget-object v4, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->viewBounds:Landroid/graphics/Rect;

    iget v2, v4, Landroid/graphics/Rect;->top:I

    .line 968
    .local v2, "top":I
    iget-object v4, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->viewBounds:Landroid/graphics/Rect;

    iget v0, v4, Landroid/graphics/Rect;->bottom:I

    .line 969
    .local v0, "bottom":I
    if-gez v2, :cond_2

    if-gez v0, :cond_2

    if-lt v2, v0, :cond_0

    .line 971
    :cond_2
    iget-object v4, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->viewBounds:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->top:I

    iget-object v5, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->listView:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v5}, Lme/grishka/appkit/views/UsableRecyclerView;->getBottom()I

    move-result v5

    if-ge v4, v5, :cond_0

    .line 974
    sub-int v3, v2, v0

    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    move-result v3

    int-to-float v1, v3

    .line 975
    .local v1, "height":F
    const/high16 v3, 0x3f800000    # 1.0f

    iget-object v4, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mVideoWrap:Lcom/vkontakte/android/ui/widget/RatioFrameLayout;

    invoke-virtual {v4}, Lcom/vkontakte/android/ui/widget/RatioFrameLayout;->getHeight()I

    move-result v4

    int-to-float v4, v4

    div-float v4, v1, v4

    mul-float/2addr v4, v6

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v4

    int-to-float v4, v4

    div-float/2addr v4, v6

    invoke-static {v3, v4}, Ljava/lang/Math;->min(FF)F

    move-result v3

    goto :goto_0
.end method

.method public getScreenCenterDistance()I
    .locals 10

    .prologue
    const/4 v9, 0x1

    .line 942
    iget-object v8, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->listView:Lme/grishka/appkit/views/UsableRecyclerView;

    if-eqz v8, :cond_0

    iget-object v8, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mVideoWrap:Lcom/vkontakte/android/ui/widget/RatioFrameLayout;

    if-nez v8, :cond_1

    .line 943
    :cond_0
    const/4 v8, -0x1

    .line 958
    :goto_0
    return v8

    .line 945
    :cond_1
    const/4 v8, 0x2

    new-array v4, v8, [I

    .line 946
    .local v4, "location":[I
    iget-object v8, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->listView:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v8, v4}, Lme/grishka/appkit/views/UsableRecyclerView;->getLocationOnScreen([I)V

    .line 947
    aget v7, v4, v9

    .line 948
    .local v7, "parentTop":I
    iget-object v8, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->listView:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v8}, Lme/grishka/appkit/views/UsableRecyclerView;->getHeight()I

    move-result v8

    add-int v5, v7, v8

    .line 950
    .local v5, "parentBottom":I
    iget-object v8, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mVideoWrap:Lcom/vkontakte/android/ui/widget/RatioFrameLayout;

    invoke-virtual {v8, v4}, Lcom/vkontakte/android/ui/widget/RatioFrameLayout;->getLocationOnScreen([I)V

    .line 951
    aget v3, v4, v9

    .line 952
    .local v3, "childTop":I
    iget-object v8, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mVideoWrap:Lcom/vkontakte/android/ui/widget/RatioFrameLayout;

    invoke-virtual {v8}, Lcom/vkontakte/android/ui/widget/RatioFrameLayout;->getHeight()I

    move-result v2

    .line 953
    .local v2, "childHeight":I
    add-int v0, v3, v2

    .line 955
    .local v0, "childBottom":I
    sub-int v8, v5, v7

    div-int/lit8 v8, v8, 0x2

    add-int v6, v7, v8

    .line 956
    .local v6, "parentCenter":I
    sub-int v8, v0, v3

    div-int/lit8 v8, v8, 0x2

    add-int v1, v3, v8

    .line 958
    .local v1, "childCenter":I
    sub-int v8, v1, v6

    invoke-static {v8}, Ljava/lang/Math;->abs(I)I

    move-result v8

    goto :goto_0
.end method

.method synthetic lambda$onViewAttachedToWindow$0()V
    .locals 2

    .prologue
    .line 1007
    iget-boolean v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mAttachedToWindow:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/VideoAttachment;

    invoke-virtual {v0}, Lcom/vkontakte/android/attachments/VideoAttachment;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1008
    invoke-virtual {p0}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/VideoAttachment;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment;->access$1500(Lcom/vkontakte/android/attachments/VideoAttachment;)Lcom/vkontakte/android/media/AbsVideoPlayer;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->videoDisplay:Lcom/vkontakte/android/ui/widget/VideoTextureView;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/media/AbsVideoPlayer;->setView(Lcom/vkontakte/android/ui/widget/VideoTextureView;)V

    .line 1010
    :cond_0
    return-void
.end method

.method public onBind(Lcom/vkontakte/android/attachments/VideoAttachment;)V
    .locals 6
    .param p1, "item"    # Lcom/vkontakte/android/attachments/VideoAttachment;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 877
    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const-string/jumbo v4, "AUTOPLAY"

    aput-object v4, v1, v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Bind "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p1, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "is playing "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p1}, Lcom/vkontakte/android/attachments/VideoAttachment;->isPlaying()Z

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v1, v2

    invoke-static {v1}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 878
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->setInitDurationView()V

    .line 879
    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mPreview:Landroid/widget/ImageView;

    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 880
    iget-object v4, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mDurationWrap:Landroid/view/View;

    iget-object v1, p1, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    invoke-virtual {v1}, Lcom/vkontakte/android/api/VideoFile;->isLive()Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p1, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    invoke-virtual {v1}, Lcom/vkontakte/android/api/VideoFile;->isLiveUpcoming()Z

    move-result v1

    if-nez v1, :cond_2

    const v1, 0x7f0200c5

    :goto_0
    invoke-virtual {v4, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 883
    iget-boolean v1, p1, Lcom/vkontakte/android/attachments/VideoAttachment;->autoplay:Z

    if-eqz v1, :cond_0

    invoke-static {p1}, Lcom/vkontakte/android/attachments/VideoAttachment;->access$1400(Lcom/vkontakte/android/attachments/VideoAttachment;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 884
    :cond_0
    iput v3, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mState:I

    .line 886
    :cond_1
    invoke-virtual {p1}, Lcom/vkontakte/android/attachments/VideoAttachment;->isComplete()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 887
    invoke-virtual {p0}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->showReplay()V

    .line 892
    :goto_1
    return-void

    .line 880
    :cond_2
    const v1, 0x7f02007b

    goto :goto_0

    .line 889
    :cond_3
    invoke-static {p1}, Lcom/vkontakte/android/attachments/VideoAttachment;->access$1200(Lcom/vkontakte/android/attachments/VideoAttachment;)Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    move-result-object v1

    if-eqz v1, :cond_5

    invoke-static {p1}, Lcom/vkontakte/android/attachments/VideoAttachment;->access$1200(Lcom/vkontakte/android/attachments/VideoAttachment;)Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->isNewsScreen()Z

    move-result v1

    if-eqz v1, :cond_5

    move v0, v2

    .line 890
    .local v0, "newsScreen":Z
    :goto_2
    iget-object v1, p1, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    invoke-virtual {v1}, Lcom/vkontakte/android/api/VideoFile;->isLiveUpcoming()Z

    move-result v1

    if-nez v1, :cond_6

    iget-boolean v1, p1, Lcom/vkontakte/android/attachments/VideoAttachment;->autoplay:Z

    if-eqz v1, :cond_4

    invoke-static {p1}, Lcom/vkontakte/android/attachments/VideoAttachment;->access$1400(Lcom/vkontakte/android/attachments/VideoAttachment;)Z

    move-result v1

    if-eqz v1, :cond_4

    if-nez v0, :cond_6

    :cond_4
    :goto_3
    invoke-virtual {p0, v2}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->showInitialLayout(Z)V

    goto :goto_1

    .end local v0    # "newsScreen":Z
    :cond_5
    move v0, v3

    .line 889
    goto :goto_2

    .restart local v0    # "newsScreen":Z
    :cond_6
    move v2, v3

    .line 890
    goto :goto_3
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 807
    check-cast p1, Lcom/vkontakte/android/attachments/VideoAttachment;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->onBind(Lcom/vkontakte/android/attachments/VideoAttachment;)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 5
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const/4 v2, 0x0

    .line 896
    invoke-virtual {p0}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->getItem()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/attachments/VideoAttachment;

    .line 897
    .local v1, "item":Lcom/vkontakte/android/attachments/VideoAttachment;
    iget-object v3, v1, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    invoke-virtual {v3}, Lcom/vkontakte/android/api/VideoFile;->isLiveUpcoming()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 930
    :cond_0
    :goto_0
    return-void

    .line 900
    :cond_1
    iget v3, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mState:I

    const/4 v4, 0x5

    if-ne v3, v4, :cond_2

    .line 901
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v2

    const v3, 0x7f100204

    if-ne v2, v3, :cond_0

    .line 902
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->setInitDurationView()V

    .line 903
    invoke-static {v1}, Lcom/vkontakte/android/attachments/VideoAttachment;->access$1500(Lcom/vkontakte/android/attachments/VideoAttachment;)Lcom/vkontakte/android/media/AbsVideoPlayer;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 904
    invoke-static {v1}, Lcom/vkontakte/android/attachments/VideoAttachment;->access$1500(Lcom/vkontakte/android/attachments/VideoAttachment;)Lcom/vkontakte/android/media/AbsVideoPlayer;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vkontakte/android/attachments/VideoAttachment;->access$1600(Lcom/vkontakte/android/attachments/VideoAttachment;Lcom/vkontakte/android/media/AbsVideoPlayer;)V

    .line 905
    invoke-static {v1}, Lcom/vkontakte/android/attachments/VideoAttachment;->access$1700(Lcom/vkontakte/android/attachments/VideoAttachment;)Lcom/vkontakte/android/media/AutoPlay$Listener;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 906
    invoke-static {v1}, Lcom/vkontakte/android/attachments/VideoAttachment;->access$1700(Lcom/vkontakte/android/attachments/VideoAttachment;)Lcom/vkontakte/android/media/AutoPlay$Listener;

    move-result-object v2

    invoke-interface {v2, v1}, Lcom/vkontakte/android/media/AutoPlay$Listener;->playPrepared(Lcom/vkontakte/android/media/AutoPlay;)V

    goto :goto_0

    .line 912
    :cond_2
    iget v3, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mState:I

    const/4 v4, 0x4

    if-ne v3, v4, :cond_3

    .line 913
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v3

    const v4, 0x7f100207

    if-ne v3, v4, :cond_0

    .line 914
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->setInitDurationView()V

    .line 915
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/attachments/VideoAttachment;->start(Z)V

    goto :goto_0

    .line 920
    :cond_3
    invoke-static {v1}, Lcom/vkontakte/android/attachments/VideoAttachment;->access$1200(Lcom/vkontakte/android/attachments/VideoAttachment;)Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    move-result-object v3

    if-eqz v3, :cond_4

    invoke-static {v1}, Lcom/vkontakte/android/attachments/VideoAttachment;->access$1200(Lcom/vkontakte/android/attachments/VideoAttachment;)Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    move-result-object v3

    invoke-static {v3}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$200(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_5

    .line 921
    :cond_4
    invoke-virtual {p0}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->getPercentageOnScreen()F

    move-result v3

    const/high16 v4, 0x3f000000    # 0.5f

    cmpg-float v3, v3, v4

    if-ltz v3, :cond_5

    .line 922
    invoke-virtual {v1}, Lcom/vkontakte/android/attachments/VideoAttachment;->canAutoPlay()Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-static {v1}, Lcom/vkontakte/android/attachments/VideoAttachment;->access$1400(Lcom/vkontakte/android/attachments/VideoAttachment;)Z

    move-result v3

    if-nez v3, :cond_7

    :cond_5
    const/4 v0, 0x1

    .line 923
    .local v0, "cantPlay":Z
    :goto_1
    if-nez v0, :cond_6

    iget-boolean v3, v1, Lcom/vkontakte/android/attachments/VideoAttachment;->mPlaying:Z

    if-nez v3, :cond_6

    iget-boolean v3, v1, Lcom/vkontakte/android/attachments/VideoAttachment;->mBuffering:Z

    if-eqz v3, :cond_8

    .line 924
    :cond_6
    invoke-static {v1}, Lcom/vkontakte/android/attachments/VideoAttachment;->access$1300(Lcom/vkontakte/android/attachments/VideoAttachment;)Z

    move-result v2

    iget v3, v1, Lcom/vkontakte/android/attachments/VideoAttachment;->mQuality:I

    invoke-virtual {v1, p1, v2, v3}, Lcom/vkontakte/android/attachments/VideoAttachment;->openVideo(Landroid/view/View;ZI)V

    goto :goto_0

    .end local v0    # "cantPlay":Z
    :cond_7
    move v0, v2

    .line 922
    goto :goto_1

    .line 925
    .restart local v0    # "cantPlay":Z
    :cond_8
    invoke-virtual {v1}, Lcom/vkontakte/android/attachments/VideoAttachment;->isPrepared()Z

    move-result v3

    if-eqz v3, :cond_9

    invoke-static {v1}, Lcom/vkontakte/android/attachments/VideoAttachment;->access$1700(Lcom/vkontakte/android/attachments/VideoAttachment;)Lcom/vkontakte/android/media/AutoPlay$Listener;

    move-result-object v3

    if-eqz v3, :cond_9

    .line 926
    invoke-static {v1}, Lcom/vkontakte/android/attachments/VideoAttachment;->access$1700(Lcom/vkontakte/android/attachments/VideoAttachment;)Lcom/vkontakte/android/media/AutoPlay$Listener;

    move-result-object v2

    invoke-interface {v2, v1}, Lcom/vkontakte/android/media/AutoPlay$Listener;->playPrepared(Lcom/vkontakte/android/media/AutoPlay;)V

    goto/16 :goto_0

    .line 928
    :cond_9
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/attachments/VideoAttachment;->start(Z)V

    goto/16 :goto_0
.end method

.method public onViewAttachedToWindow(Landroid/view/View;)V
    .locals 10
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const/4 v8, 0x1

    .line 982
    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string/jumbo v7, "AUTOPLAY"

    aput-object v7, v5, v6

    const-string/jumbo v6, "onViewAttachedToWindow"

    aput-object v6, v5, v8

    invoke-static {v5}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 983
    iput-boolean v8, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mAttachedToWindow:Z

    .line 985
    iget-object v5, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->listView:Lme/grishka/appkit/views/UsableRecyclerView;

    if-nez v5, :cond_0

    .line 986
    invoke-virtual {p1}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object v5

    const v6, 0x7f10018a

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lme/grishka/appkit/views/UsableRecyclerView;

    iput-object v5, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->listView:Lme/grishka/appkit/views/UsableRecyclerView;

    .line 989
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->getItem()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/vkontakte/android/attachments/VideoAttachment;

    iget-object v3, v5, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    .line 990
    .local v3, "video":Lcom/vkontakte/android/api/VideoFile;
    iget-object v5, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->videoDisplay:Lcom/vkontakte/android/ui/widget/VideoTextureView;

    iget v6, v3, Lcom/vkontakte/android/api/VideoFile;->width:I

    iget v7, v3, Lcom/vkontakte/android/api/VideoFile;->height:I

    invoke-virtual {v5, v6, v7}, Lcom/vkontakte/android/ui/widget/VideoTextureView;->setVideoSize(II)V

    .line 992
    iget v5, v3, Lcom/vkontakte/android/api/VideoFile;->width:I

    if-lez v5, :cond_2

    iget v5, v3, Lcom/vkontakte/android/api/VideoFile;->height:I

    if-lez v5, :cond_2

    invoke-virtual {p0}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->getItem()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/vkontakte/android/attachments/VideoAttachment;

    invoke-static {v5}, Lcom/vkontakte/android/attachments/VideoAttachment;->access$1200(Lcom/vkontakte/android/attachments/VideoAttachment;)Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    move-result-object v5

    if-eqz v5, :cond_2

    invoke-virtual {p0}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->getItem()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/vkontakte/android/attachments/VideoAttachment;

    invoke-static {v5}, Lcom/vkontakte/android/attachments/VideoAttachment;->access$1200(Lcom/vkontakte/android/attachments/VideoAttachment;)Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    move-result-object v5

    invoke-virtual {v5}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->isNewsScreen()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 993
    iget-object v5, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->listView:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v5}, Lme/grishka/appkit/views/UsableRecyclerView;->getWidth()I

    move-result v5

    iget-object v6, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->listView:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v6}, Lme/grishka/appkit/views/UsableRecyclerView;->getHeight()I

    move-result v6

    invoke-static {v5, v6}, Ljava/lang/Math;->min(II)I

    move-result v5

    int-to-float v1, v5

    .line 994
    .local v1, "listWidth":F
    iget-object v5, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->listView:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v5}, Lme/grishka/appkit/views/UsableRecyclerView;->getWidth()I

    move-result v5

    iget-object v6, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->listView:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v6}, Lme/grishka/appkit/views/UsableRecyclerView;->getHeight()I

    move-result v6

    invoke-static {v5, v6}, Ljava/lang/Math;->max(II)I

    move-result v5

    int-to-float v0, v5

    .line 995
    .local v0, "listHeight":F
    const v5, 0x3f2aaaab

    mul-float/2addr v5, v0

    div-float v2, v5, v1

    .line 996
    .local v2, "maxRatio":F
    iget v5, v3, Lcom/vkontakte/android/api/VideoFile;->height:I

    int-to-float v5, v5

    iget v6, v3, Lcom/vkontakte/android/api/VideoFile;->width:I

    int-to-float v6, v6

    div-float v4, v5, v6

    .line 997
    .local v4, "videoRatio":F
    iget-object v5, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mVideoWrap:Lcom/vkontakte/android/ui/widget/RatioFrameLayout;

    invoke-static {v4, v2}, Ljava/lang/Math;->min(FF)F

    move-result v6

    invoke-virtual {v5, v6}, Lcom/vkontakte/android/ui/widget/RatioFrameLayout;->setImageRatio(F)V

    .line 1002
    .end local v0    # "listHeight":F
    .end local v1    # "listWidth":F
    .end local v2    # "maxRatio":F
    .end local v4    # "videoRatio":F
    :goto_0
    invoke-virtual {p0}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->getItem()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/vkontakte/android/attachments/VideoAttachment;

    invoke-virtual {v5}, Lcom/vkontakte/android/attachments/VideoAttachment;->isPlaying()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 1003
    invoke-virtual {p0}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->showPlayer()V

    .line 1006
    :cond_1
    sget-object v5, Lcom/vkontakte/android/media/VideoPools;->handler:Landroid/os/Handler;

    invoke-static {p0}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;)Ljava/lang/Runnable;

    move-result-object v6

    const-wide/16 v8, 0xfa

    invoke-virtual {v5, v6, v8, v9}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1011
    return-void

    .line 999
    :cond_2
    iget-object v5, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mVideoWrap:Lcom/vkontakte/android/ui/widget/RatioFrameLayout;

    const/high16 v6, 0x3f100000    # 0.5625f

    invoke-virtual {v5, v6}, Lcom/vkontakte/android/ui/widget/RatioFrameLayout;->setImageRatio(F)V

    goto :goto_0
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .locals 5
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const/4 v4, 0x0

    .line 1015
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const-string/jumbo v1, "AUTOPLAY"

    aput-object v1, v0, v4

    const/4 v1, 0x1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "onViewDetachedFromWindow "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 1016
    invoke-virtual {p0}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/VideoAttachment;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment;->access$1500(Lcom/vkontakte/android/attachments/VideoAttachment;)Lcom/vkontakte/android/media/AbsVideoPlayer;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1017
    invoke-virtual {p0}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/VideoAttachment;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment;->access$1500(Lcom/vkontakte/android/attachments/VideoAttachment;)Lcom/vkontakte/android/media/AbsVideoPlayer;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/media/AbsVideoPlayer;->setView(Lcom/vkontakte/android/ui/widget/VideoTextureView;)V

    .line 1019
    :cond_0
    iput-boolean v4, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mAttachedToWindow:Z

    .line 1020
    invoke-virtual {p0}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->getPercentageOnScreen()F

    move-result v0

    const v1, 0x3dcccccd    # 0.1f

    cmpg-float v0, v0, v1

    if-gez v0, :cond_1

    .line 1021
    invoke-virtual {p0}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/VideoAttachment;

    iput-boolean v4, v0, Lcom/vkontakte/android/attachments/VideoAttachment;->mPlaybackCompleted:Z

    .line 1022
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mIconWrap:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 1024
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mPreview:Landroid/widget/ImageView;

    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1025
    return-void
.end method

.method showError(I)V
    .locals 3
    .param p1, "stringResId"    # I

    .prologue
    const/4 v2, 0x4

    const/4 v1, 0x0

    .line 1075
    iget v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mState:I

    if-eq v0, v2, :cond_0

    .line 1076
    iput v2, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mState:I

    .line 1078
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mPreview:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1079
    invoke-direct {p0, v1, v1}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->animateWrap(ZZ)V

    .line 1080
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mReplayButton:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 1081
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mOverlay:Landroid/view/View;

    invoke-static {v0, v1}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 1082
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mError:Landroid/view/View;

    invoke-static {v0, v1}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 1083
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mPlayButton:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 1084
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mDurationWrap:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 1085
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mErrorText:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 1087
    :cond_0
    return-void
.end method

.method showInitialLayout(Z)V
    .locals 6
    .param p1, "showPlayButton"    # Z

    .prologue
    const/16 v4, 0x8

    const/4 v3, 0x4

    const/4 v2, 0x0

    .line 1028
    const/4 v1, 0x1

    iput v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mState:I

    .line 1030
    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mIconWrap:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->clearAnimation()V

    .line 1031
    const/high16 v1, 0x41600000    # 14.0f

    invoke-static {v1}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v1

    invoke-direct {p0, v1}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->setIconWrapWidth(I)V

    .line 1032
    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mIconWrap:Landroid/view/View;

    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 1033
    invoke-direct {p0, v2, v2}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->animateWrap(ZZ)V

    .line 1034
    iget-object v5, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mPlayButton:Landroid/view/View;

    if-eqz p1, :cond_1

    move v1, v2

    :goto_0
    invoke-virtual {v5, v1}, Landroid/view/View;->setVisibility(I)V

    .line 1035
    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mOverlay:Landroid/view/View;

    invoke-static {v1, v3, v2, v2}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;IZI)V

    .line 1036
    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mReplayButton:Landroid/view/View;

    invoke-static {v1, v3, v2, v2}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;IZI)V

    .line 1037
    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mError:Landroid/view/View;

    invoke-static {v1, v3, v2, v2}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;IZI)V

    .line 1039
    invoke-virtual {p0}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->getItem()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/attachments/VideoAttachment;

    iget-object v0, v1, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    .line 1040
    .local v0, "video":Lcom/vkontakte/android/api/VideoFile;
    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mDurationWrap:Landroid/view/View;

    iget v3, v0, Lcom/vkontakte/android/api/VideoFile;->duration:I

    if-gtz v3, :cond_0

    invoke-virtual {v0}, Lcom/vkontakte/android/api/VideoFile;->isLive()Z

    move-result v3

    if-nez v3, :cond_0

    invoke-virtual {v0}, Lcom/vkontakte/android/api/VideoFile;->isLiveUpcoming()Z

    move-result v3

    if-eqz v3, :cond_2

    :cond_0
    :goto_1
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 1042
    return-void

    .end local v0    # "video":Lcom/vkontakte/android/api/VideoFile;
    :cond_1
    move v1, v3

    .line 1034
    goto :goto_0

    .restart local v0    # "video":Lcom/vkontakte/android/api/VideoFile;
    :cond_2
    move v2, v4

    .line 1040
    goto :goto_1
.end method

.method showPlayer()V
    .locals 5

    .prologue
    const/4 v4, 0x3

    const/4 v3, 0x1

    const/4 v2, 0x0

    const/4 v1, 0x4

    .line 1061
    iget v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mState:I

    if-eq v0, v4, :cond_0

    .line 1062
    iput v4, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mState:I

    .line 1064
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mDurationWrap:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 1065
    invoke-direct {p0, v2, v3}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->animateWrap(ZZ)V

    .line 1066
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mPlayButton:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 1067
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mDurationIcon:Landroid/widget/ImageView;

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setSelected(Z)V

    .line 1068
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mOverlay:Landroid/view/View;

    invoke-static {v0, v1}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 1069
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mReplayButton:Landroid/view/View;

    invoke-static {v0, v1}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 1070
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mError:Landroid/view/View;

    invoke-static {v0, v1}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 1072
    :cond_0
    return-void
.end method

.method showProgress()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x4

    .line 1045
    iget v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mState:I

    if-eq v1, v4, :cond_1

    .line 1046
    iput v4, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mState:I

    .line 1047
    iget-boolean v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mAttachedToWindow:Z

    if-eqz v1, :cond_1

    .line 1048
    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mOverlay:Landroid/view/View;

    invoke-static {v1, v3}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 1049
    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mReplayButton:Landroid/view/View;

    invoke-static {v1, v3}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 1050
    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mError:Landroid/view/View;

    invoke-static {v1, v3}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 1051
    const/4 v1, 0x1

    invoke-direct {p0, v1, v2}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->animateWrap(ZZ)V

    .line 1052
    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mPlayButton:Landroid/view/View;

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 1053
    invoke-virtual {p0}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->getItem()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/attachments/VideoAttachment;

    iget-object v0, v1, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    .line 1054
    .local v0, "video":Lcom/vkontakte/android/api/VideoFile;
    iget-object v3, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mDurationWrap:Landroid/view/View;

    iget v1, v0, Lcom/vkontakte/android/api/VideoFile;->duration:I

    if-gtz v1, :cond_0

    invoke-virtual {v0}, Lcom/vkontakte/android/api/VideoFile;->isLive()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {v0}, Lcom/vkontakte/android/api/VideoFile;->isLiveUpcoming()Z

    move-result v1

    if-eqz v1, :cond_2

    :cond_0
    move v1, v2

    :goto_0
    invoke-virtual {v3, v1}, Landroid/view/View;->setVisibility(I)V

    .line 1058
    .end local v0    # "video":Lcom/vkontakte/android/api/VideoFile;
    :cond_1
    return-void

    .line 1054
    .restart local v0    # "video":Lcom/vkontakte/android/api/VideoFile;
    :cond_2
    const/16 v1, 0x8

    goto :goto_0
.end method

.method showReplay()V
    .locals 4

    .prologue
    const/4 v3, 0x5

    const/4 v2, 0x4

    const/4 v1, 0x0

    .line 1090
    iget v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mState:I

    if-eq v0, v3, :cond_0

    .line 1091
    iput v3, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mState:I

    .line 1093
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mPreview:Landroid/widget/ImageView;

    invoke-static {v0, v1}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 1094
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mDurationWrap:Landroid/view/View;

    invoke-static {v0, v2}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 1095
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mOverlay:Landroid/view/View;

    invoke-static {v0, v1}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 1096
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mReplayButton:Landroid/view/View;

    invoke-static {v0, v1}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 1097
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mError:Landroid/view/View;

    invoke-static {v0, v2}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 1098
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mPlayButton:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 1100
    :cond_0
    return-void
.end method
