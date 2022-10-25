.class public Lcom/vkontakte/android/AudioPlayerActivity;
.super Lcom/vkontakte/android/VKActivity;
.source "AudioPlayerActivity.java"

# interfaces
.implements Lcom/vkontakte/android/audio/player/PlayerListener;
.implements Landroid/view/View$OnClickListener;
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;
.implements Landroid/support/v4/view/ViewPager$OnPageChangeListener;
.implements Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/AudioPlayerActivity$Holder;,
        Lcom/vkontakte/android/AudioPlayerActivity$CoverPagerAdapter;
    }
.end annotation


# instance fields
.field private addRequest:Lcom/vkontakte/android/api/VKAPIRequest;

.field private animatorArtistTitle:Landroid/animation/Animator;

.field private animatorArtistTitleListener:Landroid/animation/AnimatorListenerAdapter;

.field private boomHelper:Lcom/vk/music/utils/BoomHelper;

.field private buttonAdd:Landroid/widget/ImageView;

.field private buttonAddEnabled:Z

.field private buttonBroadcast:Landroid/widget/ImageView;

.field private buttonMenu:Landroid/view/View;

.field private buttonNext:Landroid/view/View;

.field private buttonPlay:Landroid/widget/ImageView;

.field private buttonPlaylist:Landroid/view/View;

.field private buttonPrev:Landroid/view/View;

.field private buttonRepeat:Landroid/widget/ImageView;

.field private buttonShuffle:Landroid/widget/ImageView;

.field private canUpdateProgress:Z

.field private coverPagerAdapter:Lcom/vkontakte/android/AudioPlayerActivity$CoverPagerAdapter;

.field private deleteRequest:Lcom/vkontakte/android/api/VKAPIRequest;

.field private disableAd:Landroid/view/View;

.field private lastTrackInfo:Lcom/vkontakte/android/audio/player/TrackInfo;

.field private pagerCover:Landroid/support/v4/view/ViewPager;

.field private pagerCoverScrollState:I

.field private pagerCoverScrollStateDragIdle:I

.field private pauseIcon:Landroid/graphics/drawable/Drawable;

.field private playIcon:Landroid/graphics/drawable/Drawable;

.field private seekProgress:Landroid/widget/SeekBar;

.field private textArtist:Landroid/widget/TextView;

.field private textDuration:Landroid/widget/TextView;

.field private textTime:Landroid/widget/TextView;

.field private textTitle:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 80
    invoke-direct {p0}, Lcom/vkontakte/android/VKActivity;-><init>()V

    .line 83
    iput-object v1, p0, Lcom/vkontakte/android/AudioPlayerActivity;->addRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 84
    iput-object v1, p0, Lcom/vkontakte/android/AudioPlayerActivity;->deleteRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 86
    new-instance v0, Lcom/vkontakte/android/AudioPlayerActivity$CoverPagerAdapter;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/AudioPlayerActivity$CoverPagerAdapter;-><init>(Landroid/app/Activity;)V

    iput-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity;->coverPagerAdapter:Lcom/vkontakte/android/AudioPlayerActivity$CoverPagerAdapter;

    .line 110
    new-instance v0, Lcom/vk/music/utils/BoomHelper;

    invoke-direct {v0}, Lcom/vk/music/utils/BoomHelper;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity;->boomHelper:Lcom/vk/music/utils/BoomHelper;

    .line 114
    iput-object v1, p0, Lcom/vkontakte/android/AudioPlayerActivity;->animatorArtistTitle:Landroid/animation/Animator;

    .line 115
    new-instance v0, Lcom/vkontakte/android/AudioPlayerActivity$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/AudioPlayerActivity$1;-><init>(Lcom/vkontakte/android/AudioPlayerActivity;)V

    iput-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity;->animatorArtistTitleListener:Landroid/animation/AnimatorListenerAdapter;

    .line 129
    iput v2, p0, Lcom/vkontakte/android/AudioPlayerActivity;->pagerCoverScrollState:I

    .line 130
    iput v2, p0, Lcom/vkontakte/android/AudioPlayerActivity;->pagerCoverScrollStateDragIdle:I

    .line 131
    iput-boolean v3, p0, Lcom/vkontakte/android/AudioPlayerActivity;->canUpdateProgress:Z

    .line 133
    iput-boolean v3, p0, Lcom/vkontakte/android/AudioPlayerActivity;->buttonAddEnabled:Z

    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/AudioPlayerActivity;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/AudioPlayerActivity;

    .prologue
    .line 80
    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity;->textArtist:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vkontakte/android/AudioPlayerActivity;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/AudioPlayerActivity;

    .prologue
    .line 80
    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity;->textTitle:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$202(Lcom/vkontakte/android/AudioPlayerActivity;Landroid/animation/Animator;)Landroid/animation/Animator;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/AudioPlayerActivity;
    .param p1, "x1"    # Landroid/animation/Animator;

    .prologue
    .line 80
    iput-object p1, p0, Lcom/vkontakte/android/AudioPlayerActivity;->animatorArtistTitle:Landroid/animation/Animator;

    return-object p1
.end method

.method static synthetic access$302(Lcom/vkontakte/android/AudioPlayerActivity;Lcom/vkontakte/android/api/VKAPIRequest;)Lcom/vkontakte/android/api/VKAPIRequest;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/AudioPlayerActivity;
    .param p1, "x1"    # Lcom/vkontakte/android/api/VKAPIRequest;

    .prologue
    .line 80
    iput-object p1, p0, Lcom/vkontakte/android/AudioPlayerActivity;->addRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    return-object p1
.end method

.method static synthetic access$400(Lcom/vkontakte/android/AudioPlayerActivity;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/AudioPlayerActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 80
    invoke-direct {p0, p1}, Lcom/vkontakte/android/AudioPlayerActivity;->setEnabledAddButton(Z)V

    return-void
.end method

.method static synthetic access$502(Lcom/vkontakte/android/AudioPlayerActivity;Lcom/vkontakte/android/api/VKAPIRequest;)Lcom/vkontakte/android/api/VKAPIRequest;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/AudioPlayerActivity;
    .param p1, "x1"    # Lcom/vkontakte/android/api/VKAPIRequest;

    .prologue
    .line 80
    iput-object p1, p0, Lcom/vkontakte/android/AudioPlayerActivity;->deleteRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    return-object p1
.end method

.method private declared-synchronized addCurrent()V
    .locals 5

    .prologue
    .line 408
    monitor-enter p0

    :try_start_0
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getPlayerState()Lcom/vkontakte/android/audio/player/PlayerState;

    move-result-object v1

    sget-object v2, Lcom/vkontakte/android/audio/player/PlayerState;->IDLE:Lcom/vkontakte/android/audio/player/PlayerState;

    if-eq v1, v2, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/AudioPlayerActivity;->addRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    if-nez v1, :cond_0

    .line 409
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getCurrentTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v0

    .line 410
    .local v0, "file":Lcom/vkontakte/android/audio/player/PlayerTrack;
    if-eqz v0, :cond_1

    iget v1, v0, Lcom/vkontakte/android/audio/player/PlayerTrack;->oid:I

    invoke-static {v1}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 411
    invoke-direct {p0, v0}, Lcom/vkontakte/android/AudioPlayerActivity;->deleteFile(Lcom/vkontakte/android/audio/player/PlayerTrack;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 457
    .end local v0    # "file":Lcom/vkontakte/android/audio/player/PlayerTrack;
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 414
    .restart local v0    # "file":Lcom/vkontakte/android/audio/player/PlayerTrack;
    :cond_1
    if-eqz v0, :cond_0

    .line 415
    const/4 v1, 0x0

    :try_start_1
    invoke-direct {p0, v1}, Lcom/vkontakte/android/AudioPlayerActivity;->setEnabledAddButton(Z)V

    .line 417
    new-instance v1, Lcom/vkontakte/android/api/audio/AudioAdd;

    iget v2, v0, Lcom/vkontakte/android/audio/player/PlayerTrack;->oid:I

    iget v3, v0, Lcom/vkontakte/android/audio/player/PlayerTrack;->aid:I

    const/4 v4, 0x0

    invoke-direct {v1, v2, v3, v4}, Lcom/vkontakte/android/api/audio/AudioAdd;-><init>(III)V

    new-instance v2, Lcom/vkontakte/android/AudioPlayerActivity$3;

    invoke-direct {v2, p0, v0}, Lcom/vkontakte/android/AudioPlayerActivity$3;-><init>(Lcom/vkontakte/android/AudioPlayerActivity;Lcom/vkontakte/android/audio/player/PlayerTrack;)V

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/audio/AudioAdd;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    .line 454
    invoke-virtual {v1, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/AudioPlayerActivity;->addRequest:Lcom/vkontakte/android/api/VKAPIRequest;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 408
    .end local v0    # "file":Lcom/vkontakte/android/audio/player/PlayerTrack;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method private animateNewTextArtistAndTitle(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V
    .locals 10
    .param p1, "artist"    # Ljava/lang/CharSequence;
    .param p2, "title"    # Ljava/lang/CharSequence;

    .prologue
    .line 820
    sget v7, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v8, 0x15

    if-lt v7, v8, :cond_1

    const-string/jumbo v7, "power"

    .line 821
    invoke-virtual {p0, v7}, Lcom/vkontakte/android/AudioPlayerActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/os/PowerManager;

    invoke-virtual {v7}, Landroid/os/PowerManager;->isPowerSaveMode()Z

    move-result v7

    if-eqz v7, :cond_1

    const/4 v4, 0x1

    .line 822
    .local v4, "isSaveMode":Z
    :goto_0
    if-eqz v4, :cond_2

    .line 823
    iget-object v7, p0, Lcom/vkontakte/android/AudioPlayerActivity;->textArtist:Landroid/widget/TextView;

    invoke-virtual {v7, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 824
    iget-object v7, p0, Lcom/vkontakte/android/AudioPlayerActivity;->textTitle:Landroid/widget/TextView;

    invoke-virtual {v7, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 859
    :cond_0
    :goto_1
    return-void

    .line 821
    .end local v4    # "isSaveMode":Z
    :cond_1
    const/4 v4, 0x0

    goto :goto_0

    .line 825
    .restart local v4    # "isSaveMode":Z
    :cond_2
    iget-object v7, p0, Lcom/vkontakte/android/AudioPlayerActivity;->animatorArtistTitle:Landroid/animation/Animator;

    if-eqz v7, :cond_3

    iget-object v7, p0, Lcom/vkontakte/android/AudioPlayerActivity;->textArtist:Landroid/widget/TextView;

    .line 826
    invoke-virtual {v7}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/CharSequence;

    invoke-static {p1, v7}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_3

    iget-object v7, p0, Lcom/vkontakte/android/AudioPlayerActivity;->textTitle:Landroid/widget/TextView;

    .line 827
    invoke-virtual {v7}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/CharSequence;

    invoke-static {p2, v7}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 829
    :cond_3
    iget-object v7, p0, Lcom/vkontakte/android/AudioPlayerActivity;->textArtist:Landroid/widget/TextView;

    invoke-virtual {v7, p1}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 830
    iget-object v7, p0, Lcom/vkontakte/android/AudioPlayerActivity;->textTitle:Landroid/widget/TextView;

    invoke-virtual {v7, p2}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 831
    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity;->animatorArtistTitle:Landroid/animation/Animator;

    .line 832
    .local v0, "animator":Landroid/animation/Animator;
    if-eqz v0, :cond_4

    .line 833
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 835
    :cond_4
    iget-object v7, p0, Lcom/vkontakte/android/AudioPlayerActivity;->textArtist:Landroid/widget/TextView;

    invoke-virtual {v7}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    .line 836
    .local v2, "curArtist":Ljava/lang/CharSequence;
    iget-object v7, p0, Lcom/vkontakte/android/AudioPlayerActivity;->textTitle:Landroid/widget/TextView;

    invoke-virtual {v7}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    .line 837
    .local v3, "curTitle":Ljava/lang/CharSequence;
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 838
    .local v1, "animators":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/animation/Animator;>;"
    invoke-static {v2, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_5

    .line 839
    iget-object v7, p0, Lcom/vkontakte/android/AudioPlayerActivity;->textArtist:Landroid/widget/TextView;

    const-string/jumbo v8, "alpha"

    const/4 v9, 0x2

    new-array v9, v9, [F

    fill-array-data v9, :array_0

    invoke-static {v7, v8, v9}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v7

    const-wide/16 v8, 0xc8

    invoke-virtual {v7, v8, v9}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v5

    .line 840
    .local v5, "oa":Landroid/animation/ObjectAnimator;
    const/4 v7, 0x2

    invoke-virtual {v5, v7}, Landroid/animation/ObjectAnimator;->setRepeatMode(I)V

    .line 841
    const/4 v7, 0x1

    invoke-virtual {v5, v7}, Landroid/animation/ObjectAnimator;->setRepeatCount(I)V

    .line 842
    iget-object v7, p0, Lcom/vkontakte/android/AudioPlayerActivity;->animatorArtistTitleListener:Landroid/animation/AnimatorListenerAdapter;

    invoke-virtual {v5, v7}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 843
    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 845
    .end local v5    # "oa":Landroid/animation/ObjectAnimator;
    :cond_5
    invoke-static {v3, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_7

    .line 846
    iget-object v7, p0, Lcom/vkontakte/android/AudioPlayerActivity;->textTitle:Landroid/widget/TextView;

    const-string/jumbo v8, "alpha"

    const/4 v9, 0x2

    new-array v9, v9, [F

    fill-array-data v9, :array_1

    invoke-static {v7, v8, v9}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v7

    const-wide/16 v8, 0xc8

    invoke-virtual {v7, v8, v9}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v5

    .line 847
    .restart local v5    # "oa":Landroid/animation/ObjectAnimator;
    const/4 v7, 0x2

    invoke-virtual {v5, v7}, Landroid/animation/ObjectAnimator;->setRepeatMode(I)V

    .line 848
    const/4 v7, 0x1

    invoke-virtual {v5, v7}, Landroid/animation/ObjectAnimator;->setRepeatCount(I)V

    .line 849
    invoke-static {v2, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_6

    .line 850
    iget-object v7, p0, Lcom/vkontakte/android/AudioPlayerActivity;->animatorArtistTitleListener:Landroid/animation/AnimatorListenerAdapter;

    invoke-virtual {v5, v7}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 852
    :cond_6
    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 854
    .end local v5    # "oa":Landroid/animation/ObjectAnimator;
    :cond_7
    new-instance v6, Landroid/animation/AnimatorSet;

    invoke-direct {v6}, Landroid/animation/AnimatorSet;-><init>()V

    .line 855
    .local v6, "set":Landroid/animation/AnimatorSet;
    iput-object v6, p0, Lcom/vkontakte/android/AudioPlayerActivity;->animatorArtistTitle:Landroid/animation/Animator;

    .line 856
    invoke-virtual {v6, v1}, Landroid/animation/AnimatorSet;->playTogether(Ljava/util/Collection;)V

    .line 857
    invoke-virtual {v6}, Landroid/animation/AnimatorSet;->start()V

    goto/16 :goto_1

    .line 839
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 846
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method private confirmAndDelete()V
    .locals 4

    .prologue
    .line 492
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getCurrentTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v0

    .line 493
    .local v0, "playerTrack":Lcom/vkontakte/android/audio/player/PlayerTrack;
    if-eqz v0, :cond_0

    .line 494
    new-instance v1, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x7f080176

    .line 495
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f0801a0

    .line 496
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f080798

    invoke-static {p0, v0}, Lcom/vkontakte/android/AudioPlayerActivity$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/AudioPlayerActivity;Lcom/vkontakte/android/audio/player/PlayerTrack;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v3

    .line 497
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f080433

    const/4 v3, 0x0

    .line 500
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 501
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 503
    :cond_0
    return-void
.end method

.method private deleteFile(Lcom/vkontakte/android/audio/player/PlayerTrack;)V
    .locals 2
    .param p1, "playerTrack"    # Lcom/vkontakte/android/audio/player/PlayerTrack;

    .prologue
    .line 460
    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity;->deleteRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    if-eqz v0, :cond_0

    .line 489
    :goto_0
    return-void

    .line 464
    :cond_0
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/AudioPlayerActivity;->setEnabledAddButton(Z)V

    .line 466
    new-instance v0, Lcom/vkontakte/android/api/audio/AudioDelete;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/api/audio/AudioDelete;-><init>(Lcom/vkontakte/android/audio/MusicTrack;)V

    new-instance v1, Lcom/vkontakte/android/AudioPlayerActivity$4;

    invoke-direct {v1, p0, p0, p1}, Lcom/vkontakte/android/AudioPlayerActivity$4;-><init>(Lcom/vkontakte/android/AudioPlayerActivity;Landroid/content/Context;Lcom/vkontakte/android/audio/player/PlayerTrack;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/audio/AudioDelete;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 488
    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity;->deleteRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0
.end method

.method static synthetic lambda$showBroadcastDialog$2([ZLandroid/content/DialogInterface;IZ)V
    .locals 0
    .param p0, "checked"    # [Z
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I
    .param p3, "isChecked"    # Z

    .prologue
    .line 571
    aput-boolean p3, p0, p2

    .line 572
    return-void
.end method

.method private searchArtist()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 506
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getCurrentTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v0

    .line 507
    .local v0, "musicTrack":Lcom/vkontakte/android/audio/MusicTrack;
    if-eqz v0, :cond_0

    .line 508
    new-instance v1, Lcom/vk/music/fragment/SearchFragment$Builder;

    invoke-direct {v1}, Lcom/vk/music/fragment/SearchFragment$Builder;-><init>()V

    iget-object v2, v0, Lcom/vkontakte/android/audio/MusicTrack;->artist:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/vk/music/fragment/SearchFragment$Builder;->query(Ljava/lang/String;)Lcom/vk/music/fragment/SearchFragment$Builder;

    move-result-object v1

    invoke-virtual {v1, v3}, Lcom/vk/music/fragment/SearchFragment$Builder;->openResults(Z)Lcom/vk/music/fragment/SearchFragment$Builder;

    move-result-object v1

    invoke-virtual {v1, v3}, Lcom/vk/music/fragment/SearchFragment$Builder;->openArtistPage(Z)Lcom/vk/music/fragment/SearchFragment$Builder;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/vk/music/fragment/SearchFragment$Builder;->go(Landroid/content/Context;)Z

    .line 510
    :cond_0
    return-void
.end method

.method private static setEnabled(Landroid/view/View;Z)V
    .locals 1
    .param p0, "view"    # Landroid/view/View;
    .param p1, "enabled"    # Z

    .prologue
    .line 178
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/view/View;->isEnabled()Z

    move-result v0

    if-eq v0, p1, :cond_0

    .line 179
    invoke-virtual {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 180
    if-eqz p1, :cond_1

    const/high16 v0, 0x3f800000    # 1.0f

    :goto_0
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 182
    :cond_0
    return-void

    .line 180
    :cond_1
    const v0, 0x3e99999a    # 0.3f

    goto :goto_0
.end method

.method private static setEnabled(Lcom/vkontakte/android/audio/player/TrackInfo;Landroid/widget/SeekBar;Z)V
    .locals 3
    .param p0, "trackInfo"    # Lcom/vkontakte/android/audio/player/TrackInfo;
    .param p1, "seekProgress"    # Landroid/widget/SeekBar;
    .param p2, "enabled"    # Z

    .prologue
    .line 162
    if-eqz p1, :cond_0

    .line 163
    invoke-virtual {p1, p2}, Landroid/widget/SeekBar;->setEnabled(Z)V

    .line 165
    invoke-virtual {p1}, Landroid/widget/SeekBar;->getThumbOffset()I

    move-result v0

    .line 166
    .local v0, "thumbOffset":I
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/player/TrackInfo;->isContentMode()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 167
    invoke-virtual {p1}, Landroid/widget/SeekBar;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f020212

    invoke-static {v1, v2}, Lcom/vkontakte/android/ViewUtils;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/widget/SeekBar;->setThumb(Landroid/graphics/drawable/Drawable;)V

    .line 173
    :goto_0
    invoke-virtual {p1, v0}, Landroid/widget/SeekBar;->setThumbOffset(I)V

    .line 175
    .end local v0    # "thumbOffset":I
    :cond_0
    return-void

    .line 168
    .restart local v0    # "thumbOffset":I
    :cond_1
    if-nez p2, :cond_2

    .line 169
    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {p1, v1}, Landroid/widget/SeekBar;->setThumb(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 171
    :cond_2
    invoke-virtual {p1}, Landroid/widget/SeekBar;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f020213

    invoke-static {v1, v2}, Lcom/vkontakte/android/ViewUtils;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/widget/SeekBar;->setThumb(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0
.end method

.method private setEnabledAddButton(Z)V
    .locals 6
    .param p1, "enable"    # Z

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 136
    iput-boolean p1, p0, Lcom/vkontakte/android/AudioPlayerActivity;->buttonAddEnabled:Z

    .line 137
    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity;->lastTrackInfo:Lcom/vkontakte/android/audio/player/TrackInfo;

    .line 138
    .local v0, "trackInfo":Lcom/vkontakte/android/audio/player/TrackInfo;
    iget-object v3, p0, Lcom/vkontakte/android/AudioPlayerActivity;->buttonAdd:Landroid/widget/ImageView;

    if-nez v0, :cond_0

    .end local p1    # "enable":Z
    :goto_0
    invoke-static {v3, p1}, Lcom/vkontakte/android/ViewUtils;->setEnabled(Landroid/view/View;Z)V

    .line 139
    return-void

    .line 138
    .restart local p1    # "enable":Z
    :cond_0
    if-eqz p1, :cond_1

    new-array v4, v1, [Lcom/vkontakte/android/audio/PlayerAction;

    sget-object v5, Lcom/vkontakte/android/audio/PlayerAction;->other:Lcom/vkontakte/android/audio/PlayerAction;

    aput-object v5, v4, v2

    invoke-virtual {v0, v4}, Lcom/vkontakte/android/audio/player/TrackInfo;->hasAction([Lcom/vkontakte/android/audio/PlayerAction;)Z

    move-result v4

    if-eqz v4, :cond_1

    move p1, v1

    goto :goto_0

    :cond_1
    move p1, v2

    goto :goto_0
.end method

.method private setOnClickListener(I)Landroid/view/View;
    .locals 1
    .param p1, "id"    # I
        .annotation build Landroid/support/annotation/IdRes;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/view/View;",
            ">(I)TT;"
        }
    .end annotation

    .prologue
    .line 863
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/AudioPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 864
    .local v0, "view":Landroid/view/View;
    if-eqz v0, :cond_0

    .line 865
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 867
    :cond_0
    return-object v0
.end method

.method private showBroadcastDialog()V
    .locals 10

    .prologue
    .line 551
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 552
    .local v2, "grps":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/api/Group;>;"
    invoke-static {v2}, Lcom/vkontakte/android/data/Groups;->getAdminedGroups(Ljava/util/ArrayList;)V

    .line 553
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 554
    .local v5, "items":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 555
    .local v4, "ids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getBroadcastTargets()Ljava/util/ArrayList;

    move-result-object v6

    .line 556
    .local v6, "targets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    invoke-virtual {p0}, Lcom/vkontakte/android/AudioPlayerActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f080410

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 557
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_0

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/api/Group;

    .line 558
    .local v1, "g":Lcom/vkontakte/android/api/Group;
    iget-object v8, v1, Lcom/vkontakte/android/api/Group;->name:Ljava/lang/String;

    invoke-virtual {v5, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 560
    .end local v1    # "g":Lcom/vkontakte/android/api/Group;
    :cond_0
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v7

    new-array v0, v7, [Z

    .line 561
    .local v0, "checked":[Z
    const/4 v7, 0x0

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v8

    invoke-virtual {v8}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v8

    aput-boolean v8, v0, v7

    .line 562
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v7

    invoke-virtual {v7}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 563
    const/4 v3, 0x1

    .line 564
    .local v3, "i":I
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/api/Group;

    .line 565
    .restart local v1    # "g":Lcom/vkontakte/android/api/Group;
    iget v8, v1, Lcom/vkontakte/android/api/Group;->id:I

    neg-int v8, v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v8

    aput-boolean v8, v0, v3

    .line 566
    iget v8, v1, Lcom/vkontakte/android/api/Group;->id:I

    neg-int v8, v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v4, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 567
    add-int/lit8 v3, v3, 0x1

    .line 568
    goto :goto_1

    .line 569
    .end local v1    # "g":Lcom/vkontakte/android/api/Group;
    :cond_1
    new-instance v7, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-direct {v7, p0}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v8, 0x7f0800e7

    invoke-virtual {v7, v8}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v8

    .line 570
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v7

    new-array v7, v7, [Ljava/lang/String;

    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Ljava/lang/CharSequence;

    invoke-static {v0}, Lcom/vkontakte/android/AudioPlayerActivity$$Lambda$3;->lambdaFactory$([Z)Landroid/content/DialogInterface$OnMultiChoiceClickListener;

    move-result-object v9

    .line 569
    invoke-virtual {v8, v7, v0, v9}, Landroid/app/AlertDialog$Builder;->setMultiChoiceItems([Ljava/lang/CharSequence;[ZLandroid/content/DialogInterface$OnMultiChoiceClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    const v8, 0x7f080479

    invoke-static {p0, v0, v4}, Lcom/vkontakte/android/AudioPlayerActivity$$Lambda$4;->lambdaFactory$(Lcom/vkontakte/android/AudioPlayerActivity;[ZLjava/util/ArrayList;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v9

    .line 572
    invoke-virtual {v7, v8, v9}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    const v8, 0x7f08011f

    const/4 v9, 0x0

    .line 581
    invoke-virtual {v7, v8, v9}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    invoke-virtual {v7}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 582
    return-void
.end method

.method private syncEnabled(Lcom/vkontakte/android/audio/player/TrackInfo;)V
    .locals 5
    .param p1, "trackInfo"    # Lcom/vkontakte/android/audio/player/TrackInfo;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 142
    if-eqz p1, :cond_2

    .line 143
    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity;->buttonPlay:Landroid/widget/ImageView;

    new-array v3, v1, [Lcom/vkontakte/android/audio/PlayerAction;

    sget-object v4, Lcom/vkontakte/android/audio/PlayerAction;->playPause:Lcom/vkontakte/android/audio/PlayerAction;

    aput-object v4, v3, v2

    invoke-virtual {p1, v3}, Lcom/vkontakte/android/audio/player/TrackInfo;->hasAction([Lcom/vkontakte/android/audio/PlayerAction;)Z

    move-result v3

    invoke-static {v0, v3}, Lcom/vkontakte/android/AudioPlayerActivity;->setEnabled(Landroid/view/View;Z)V

    .line 144
    iget-object v3, p0, Lcom/vkontakte/android/AudioPlayerActivity;->buttonAdd:Landroid/widget/ImageView;

    new-array v0, v1, [Lcom/vkontakte/android/audio/PlayerAction;

    sget-object v4, Lcom/vkontakte/android/audio/PlayerAction;->other:Lcom/vkontakte/android/audio/PlayerAction;

    aput-object v4, v0, v2

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/audio/player/TrackInfo;->hasAction([Lcom/vkontakte/android/audio/PlayerAction;)Z

    move-result v0

    if-eqz v0, :cond_3

    iget-boolean v0, p0, Lcom/vkontakte/android/AudioPlayerActivity;->buttonAddEnabled:Z

    if-eqz v0, :cond_3

    move v0, v1

    :goto_0
    invoke-static {v3, v0}, Lcom/vkontakte/android/AudioPlayerActivity;->setEnabled(Landroid/view/View;Z)V

    .line 145
    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity;->buttonBroadcast:Landroid/widget/ImageView;

    new-array v3, v1, [Lcom/vkontakte/android/audio/PlayerAction;

    sget-object v4, Lcom/vkontakte/android/audio/PlayerAction;->other:Lcom/vkontakte/android/audio/PlayerAction;

    aput-object v4, v3, v2

    invoke-virtual {p1, v3}, Lcom/vkontakte/android/audio/player/TrackInfo;->hasAction([Lcom/vkontakte/android/audio/PlayerAction;)Z

    move-result v3

    invoke-static {v0, v3}, Lcom/vkontakte/android/AudioPlayerActivity;->setEnabled(Landroid/view/View;Z)V

    .line 146
    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity;->pagerCover:Landroid/support/v4/view/ViewPager;

    new-array v3, v1, [Lcom/vkontakte/android/audio/PlayerAction;

    sget-object v4, Lcom/vkontakte/android/audio/PlayerAction;->changeTrack:Lcom/vkontakte/android/audio/PlayerAction;

    aput-object v4, v3, v2

    invoke-virtual {p1, v3}, Lcom/vkontakte/android/audio/player/TrackInfo;->hasAction([Lcom/vkontakte/android/audio/PlayerAction;)Z

    move-result v3

    invoke-static {v0, v3}, Lcom/vkontakte/android/AudioPlayerActivity;->setEnabled(Landroid/view/View;Z)V

    .line 147
    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity;->seekProgress:Landroid/widget/SeekBar;

    new-array v3, v1, [Lcom/vkontakte/android/audio/PlayerAction;

    sget-object v4, Lcom/vkontakte/android/audio/PlayerAction;->seek:Lcom/vkontakte/android/audio/PlayerAction;

    aput-object v4, v3, v2

    invoke-virtual {p1, v3}, Lcom/vkontakte/android/audio/player/TrackInfo;->hasAction([Lcom/vkontakte/android/audio/PlayerAction;)Z

    move-result v3

    invoke-static {p1, v0, v3}, Lcom/vkontakte/android/AudioPlayerActivity;->setEnabled(Lcom/vkontakte/android/audio/player/TrackInfo;Landroid/widget/SeekBar;Z)V

    .line 149
    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity;->buttonPrev:Landroid/view/View;

    new-array v3, v1, [Lcom/vkontakte/android/audio/PlayerAction;

    sget-object v4, Lcom/vkontakte/android/audio/PlayerAction;->changeTrack:Lcom/vkontakte/android/audio/PlayerAction;

    aput-object v4, v3, v2

    invoke-virtual {p1, v3}, Lcom/vkontakte/android/audio/player/TrackInfo;->hasAction([Lcom/vkontakte/android/audio/PlayerAction;)Z

    move-result v3

    invoke-static {v0, v3}, Lcom/vkontakte/android/AudioPlayerActivity;->setEnabled(Landroid/view/View;Z)V

    .line 150
    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity;->buttonNext:Landroid/view/View;

    const/4 v3, 0x2

    new-array v3, v3, [Lcom/vkontakte/android/audio/PlayerAction;

    sget-object v4, Lcom/vkontakte/android/audio/PlayerAction;->changeTrack:Lcom/vkontakte/android/audio/PlayerAction;

    aput-object v4, v3, v2

    sget-object v4, Lcom/vkontakte/android/audio/PlayerAction;->skipAd:Lcom/vkontakte/android/audio/PlayerAction;

    aput-object v4, v3, v1

    invoke-virtual {p1, v3}, Lcom/vkontakte/android/audio/player/TrackInfo;->hasAction([Lcom/vkontakte/android/audio/PlayerAction;)Z

    move-result v3

    invoke-static {v0, v3}, Lcom/vkontakte/android/AudioPlayerActivity;->setEnabled(Landroid/view/View;Z)V

    .line 151
    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity;->buttonShuffle:Landroid/widget/ImageView;

    new-array v3, v1, [Lcom/vkontakte/android/audio/PlayerAction;

    sget-object v4, Lcom/vkontakte/android/audio/PlayerAction;->shuffle:Lcom/vkontakte/android/audio/PlayerAction;

    aput-object v4, v3, v2

    invoke-virtual {p1, v3}, Lcom/vkontakte/android/audio/player/TrackInfo;->hasAction([Lcom/vkontakte/android/audio/PlayerAction;)Z

    move-result v3

    invoke-static {v0, v3}, Lcom/vkontakte/android/AudioPlayerActivity;->setEnabled(Landroid/view/View;Z)V

    .line 152
    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity;->buttonRepeat:Landroid/widget/ImageView;

    new-array v3, v1, [Lcom/vkontakte/android/audio/PlayerAction;

    sget-object v4, Lcom/vkontakte/android/audio/PlayerAction;->repeat:Lcom/vkontakte/android/audio/PlayerAction;

    aput-object v4, v3, v2

    invoke-virtual {p1, v3}, Lcom/vkontakte/android/audio/player/TrackInfo;->hasAction([Lcom/vkontakte/android/audio/PlayerAction;)Z

    move-result v3

    invoke-static {v0, v3}, Lcom/vkontakte/android/AudioPlayerActivity;->setEnabled(Landroid/view/View;Z)V

    .line 153
    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity;->buttonMenu:Landroid/view/View;

    new-array v3, v1, [Lcom/vkontakte/android/audio/PlayerAction;

    sget-object v4, Lcom/vkontakte/android/audio/PlayerAction;->other:Lcom/vkontakte/android/audio/PlayerAction;

    aput-object v4, v3, v2

    invoke-virtual {p1, v3}, Lcom/vkontakte/android/audio/player/TrackInfo;->hasAction([Lcom/vkontakte/android/audio/PlayerAction;)Z

    move-result v3

    invoke-static {v0, v3}, Lcom/vkontakte/android/AudioPlayerActivity;->setEnabled(Landroid/view/View;Z)V

    .line 154
    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity;->buttonPlaylist:Landroid/view/View;

    new-array v1, v1, [Lcom/vkontakte/android/audio/PlayerAction;

    sget-object v3, Lcom/vkontakte/android/audio/PlayerAction;->other:Lcom/vkontakte/android/audio/PlayerAction;

    aput-object v3, v1, v2

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/audio/player/TrackInfo;->hasAction([Lcom/vkontakte/android/audio/PlayerAction;)Z

    move-result v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/AudioPlayerActivity;->setEnabled(Landroid/view/View;Z)V

    .line 156
    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity;->disableAd:Landroid/view/View;

    invoke-virtual {p1}, Lcom/vkontakte/android/audio/player/TrackInfo;->isContentMode()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/VKAccount;->isMusicRestricted()Z

    move-result v1

    if-nez v1, :cond_1

    :cond_0
    const/16 v2, 0x8

    :cond_1
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 159
    :cond_2
    return-void

    :cond_3
    move v0, v2

    .line 144
    goto/16 :goto_0
.end method

.method private toggleCachedState()V
    .locals 1

    .prologue
    .line 402
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->toggleCurrentCachedState()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 403
    invoke-virtual {p0}, Lcom/vkontakte/android/AudioPlayerActivity;->invalidateOptionsMenu()V

    .line 405
    :cond_0
    return-void
.end method

.method private updateAddButton(Lcom/vkontakte/android/audio/player/PlayerTrack;)V
    .locals 6
    .param p1, "track"    # Lcom/vkontakte/android/audio/player/PlayerTrack;

    .prologue
    const v5, 0x7f0f0117

    const/4 v4, 0x1

    .line 376
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getPlayerState()Lcom/vkontakte/android/audio/player/PlayerState;

    move-result-object v0

    sget-object v1, Lcom/vkontakte/android/audio/player/PlayerState;->IDLE:Lcom/vkontakte/android/audio/player/PlayerState;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity;->buttonAdd:Landroid/widget/ImageView;

    if-nez v0, :cond_1

    .line 388
    :cond_0
    :goto_0
    return-void

    .line 379
    :cond_1
    if-eqz p1, :cond_2

    iget v0, p1, Lcom/vkontakte/android/audio/player/PlayerTrack;->oid:I

    invoke-static {v0}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 380
    invoke-direct {p0, v4}, Lcom/vkontakte/android/AudioPlayerActivity;->setEnabledAddButton(Z)V

    .line 381
    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity;->buttonAdd:Landroid/widget/ImageView;

    new-instance v1, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;

    const v2, 0x7f020184

    invoke-static {p0, v2}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {p0}, Lcom/vkontakte/android/AudioPlayerActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;-><init>(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 382
    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity;->buttonAdd:Landroid/widget/ImageView;

    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setSelected(Z)V

    goto :goto_0

    .line 384
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity;->buttonAdd:Landroid/widget/ImageView;

    new-instance v1, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;

    const v2, 0x7f02015f

    invoke-static {p0, v2}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {p0}, Lcom/vkontakte/android/AudioPlayerActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;-><init>(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 385
    invoke-direct {p0, v4}, Lcom/vkontakte/android/AudioPlayerActivity;->setEnabledAddButton(Z)V

    .line 386
    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity;->buttonAdd:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setSelected(Z)V

    goto :goto_0
.end method


# virtual methods
.method public displayInfo(Lcom/vkontakte/android/audio/player/TrackInfo;)V
    .locals 13
    .param p1, "trackInfo"    # Lcom/vkontakte/android/audio/player/TrackInfo;

    .prologue
    const/4 v12, 0x2

    const/4 v9, 0x0

    const-wide/16 v10, 0x3c

    const/4 v8, 0x1

    .line 513
    iget-object v1, p0, Lcom/vkontakte/android/AudioPlayerActivity;->seekProgress:Landroid/widget/SeekBar;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/AudioPlayerActivity;->textTime:Landroid/widget/TextView;

    if-eqz v1, :cond_0

    .line 514
    invoke-virtual {p1}, Lcom/vkontakte/android/audio/player/TrackInfo;->isContentMode()Z

    move-result v0

    .line 516
    .local v0, "isContentMode":Z
    invoke-static {p0, v0}, Lcom/vkontakte/android/AudioPlayerActivity$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/AudioPlayerActivity;Z)Ljava/lang/Runnable;

    move-result-object v1

    invoke-static {v1}, Lcom/vkontakte/android/ViewUtils;->post(Ljava/lang/Runnable;)V

    .line 524
    iget-object v1, p0, Lcom/vkontakte/android/AudioPlayerActivity;->seekProgress:Landroid/widget/SeekBar;

    invoke-virtual {p1}, Lcom/vkontakte/android/audio/player/TrackInfo;->getPositionPercent()I

    move-result v4

    invoke-virtual {v1, v4}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 526
    invoke-virtual {p1}, Lcom/vkontakte/android/audio/player/TrackInfo;->getPosition()I

    move-result v1

    div-int/lit16 v1, v1, 0x3e8

    int-to-long v2, v1

    .line 527
    .local v2, "s":J
    iget-object v1, p0, Lcom/vkontakte/android/AudioPlayerActivity;->textTime:Landroid/widget/TextView;

    const-string/jumbo v4, "%d:%02d"

    new-array v5, v12, [Ljava/lang/Object;

    div-long v6, v2, v10

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v5, v9

    rem-long v6, v2, v10

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v5, v8

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 529
    iget-object v1, p0, Lcom/vkontakte/android/AudioPlayerActivity;->seekProgress:Landroid/widget/SeekBar;

    invoke-virtual {p1}, Lcom/vkontakte/android/audio/player/TrackInfo;->getBufferingPercent()I

    move-result v4

    invoke-virtual {v1, v4}, Landroid/widget/SeekBar;->setSecondaryProgress(I)V

    .line 532
    .end local v0    # "isContentMode":Z
    .end local v2    # "s":J
    :cond_0
    iput-object p1, p0, Lcom/vkontakte/android/AudioPlayerActivity;->lastTrackInfo:Lcom/vkontakte/android/audio/player/TrackInfo;

    .line 534
    invoke-direct {p0, p1}, Lcom/vkontakte/android/AudioPlayerActivity;->syncEnabled(Lcom/vkontakte/android/audio/player/TrackInfo;)V

    .line 536
    iget-object v1, p0, Lcom/vkontakte/android/AudioPlayerActivity;->textArtist:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/vkontakte/android/AudioPlayerActivity;->textTitle:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 537
    iget-object v1, p0, Lcom/vkontakte/android/AudioPlayerActivity;->textArtist:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/vkontakte/android/audio/player/TrackInfo;->getSubTitle()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 538
    iget-object v1, p0, Lcom/vkontakte/android/AudioPlayerActivity;->textTitle:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/vkontakte/android/audio/player/TrackInfo;->getTitle()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 542
    :goto_0
    invoke-virtual {p1}, Lcom/vkontakte/android/audio/player/TrackInfo;->getTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/vkontakte/android/AudioPlayerActivity;->updateAddButton(Lcom/vkontakte/android/audio/player/PlayerTrack;)V

    .line 543
    invoke-virtual {p1}, Lcom/vkontakte/android/audio/player/TrackInfo;->getDuration()I

    move-result v1

    div-int/lit16 v1, v1, 0x3e8

    int-to-long v2, v1

    .line 544
    .restart local v2    # "s":J
    iget-object v1, p0, Lcom/vkontakte/android/AudioPlayerActivity;->textDuration:Landroid/widget/TextView;

    const-string/jumbo v4, "%d:%02d"

    new-array v5, v12, [Ljava/lang/Object;

    div-long v6, v2, v10

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v5, v9

    rem-long v6, v2, v10

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v5, v8

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 545
    iget-object v1, p0, Lcom/vkontakte/android/AudioPlayerActivity;->textArtist:Landroid/widget/TextView;

    invoke-virtual {v1, v8}, Landroid/widget/TextView;->setSelected(Z)V

    .line 546
    iget-object v1, p0, Lcom/vkontakte/android/AudioPlayerActivity;->textTitle:Landroid/widget/TextView;

    invoke-virtual {v1, v8}, Landroid/widget/TextView;->setSelected(Z)V

    .line 547
    return-void

    .line 540
    .end local v2    # "s":J
    :cond_1
    invoke-virtual {p1}, Lcom/vkontakte/android/audio/player/TrackInfo;->getSubTitle()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/vkontakte/android/audio/player/TrackInfo;->getTitle()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v1, v4}, Lcom/vkontakte/android/AudioPlayerActivity;->animateNewTextArtistAndTitle(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method public haveLyrics(Lcom/vkontakte/android/audio/player/PlayerTrack;)Z
    .locals 1
    .param p1, "track"    # Lcom/vkontakte/android/audio/player/PlayerTrack;

    .prologue
    .line 586
    iget-object v0, p1, Lcom/vkontakte/android/audio/player/PlayerTrack;->lyricsText:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public invalidateOptionsMenu()V
    .locals 1

    .prologue
    .line 392
    invoke-super {p0}, Lcom/vkontakte/android/VKActivity;->invalidateOptionsMenu()V

    .line 393
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getCurrentTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/AudioPlayerActivity;->updateAddButton(Lcom/vkontakte/android/audio/player/PlayerTrack;)V

    .line 394
    return-void
.end method

.method synthetic lambda$confirmAndDelete$0(Lcom/vkontakte/android/audio/player/PlayerTrack;Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "playerTrack"    # Lcom/vkontakte/android/audio/player/PlayerTrack;
    .param p2, "dialog"    # Landroid/content/DialogInterface;
    .param p3, "which"    # I

    .prologue
    .line 498
    invoke-direct {p0, p1}, Lcom/vkontakte/android/AudioPlayerActivity;->deleteFile(Lcom/vkontakte/android/audio/player/PlayerTrack;)V

    .line 499
    return-void
.end method

.method synthetic lambda$displayInfo$1(Z)V
    .locals 3
    .param p1, "isContentMode"    # Z

    .prologue
    .line 517
    if-eqz p1, :cond_0

    .line 518
    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity;->seekProgress:Landroid/widget/SeekBar;

    iget-object v1, p0, Lcom/vkontakte/android/AudioPlayerActivity;->seekProgress:Landroid/widget/SeekBar;

    invoke-virtual {v1}, Landroid/widget/SeekBar;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0203a7

    invoke-static {v1, v2}, Lcom/vkontakte/android/ViewUtils;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 522
    :goto_0
    return-void

    .line 520
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity;->seekProgress:Landroid/widget/SeekBar;

    iget-object v1, p0, Lcom/vkontakte/android/AudioPlayerActivity;->seekProgress:Landroid/widget/SeekBar;

    invoke-virtual {v1}, Landroid/widget/SeekBar;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0203a8

    invoke-static {v1, v2}, Lcom/vkontakte/android/ViewUtils;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0
.end method

.method synthetic lambda$onClick$4(Landroid/view/View;Landroid/widget/PopupMenu;)V
    .locals 1
    .param p1, "anchor"    # Landroid/view/View;
    .param p2, "menu"    # Landroid/widget/PopupMenu;

    .prologue
    .line 731
    invoke-virtual {p0}, Lcom/vkontakte/android/AudioPlayerActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    return-void
.end method

.method synthetic lambda$showBroadcastDialog$3([ZLjava/util/ArrayList;Landroid/content/DialogInterface;I)V
    .locals 4
    .param p1, "checked"    # [Z
    .param p2, "ids"    # Ljava/util/ArrayList;
    .param p3, "dialog"    # Landroid/content/DialogInterface;
    .param p4, "which"    # I

    .prologue
    .line 573
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 574
    .local v1, "newTargets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    const/4 v0, 0x0

    .local v0, "i1":I
    :goto_0
    array-length v2, p1

    if-ge v0, v2, :cond_1

    .line 575
    aget-boolean v2, p1, v0

    if-eqz v2, :cond_0

    .line 576
    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 574
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 579
    :cond_1
    invoke-static {v1}, Lcom/vkontakte/android/audio/AudioFacade;->setBroadcast(Ljava/util/ArrayList;)V

    .line 580
    iget-object v3, p0, Lcom/vkontakte/android/AudioPlayerActivity;->buttonBroadcast:Landroid/widget/ImageView;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_2

    const/4 v2, 0x1

    :goto_1
    invoke-virtual {v3, v2}, Landroid/widget/ImageView;->setSelected(Z)V

    .line 581
    return-void

    .line 580
    :cond_2
    const/4 v2, 0x0

    goto :goto_1
.end method

.method public onBufferingProgress(Lcom/vkontakte/android/audio/player/TrackInfo;)V
    .locals 2
    .param p1, "trackInfo"    # Lcom/vkontakte/android/audio/player/TrackInfo;

    .prologue
    .line 790
    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity;->seekProgress:Landroid/widget/SeekBar;

    invoke-virtual {p1}, Lcom/vkontakte/android/audio/player/TrackInfo;->getBufferingPercent()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setSecondaryProgress(I)V

    .line 791
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 11
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 671
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v8

    packed-switch v8, :pswitch_data_0

    .line 742
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 673
    :pswitch_1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6}, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->show(Landroid/content/Context;)V

    goto :goto_0

    .line 676
    :pswitch_2
    iget v6, p0, Lcom/vkontakte/android/AudioPlayerActivity;->pagerCoverScrollState:I

    if-nez v6, :cond_0

    .line 677
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->prev()V

    goto :goto_0

    .line 681
    :pswitch_3
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->toggleResumePause()V

    goto :goto_0

    .line 684
    :pswitch_4
    iget v6, p0, Lcom/vkontakte/android/AudioPlayerActivity;->pagerCoverScrollState:I

    if-nez v6, :cond_0

    .line 685
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->next()V

    goto :goto_0

    .line 689
    :pswitch_5
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getPlayerState()Lcom/vkontakte/android/audio/player/PlayerState;

    move-result-object v8

    sget-object v9, Lcom/vkontakte/android/audio/player/PlayerState;->IDLE:Lcom/vkontakte/android/audio/player/PlayerState;

    if-eq v8, v9, :cond_0

    .line 690
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getLoopMode()Lcom/vkontakte/android/audio/player/LoopMode;

    move-result-object v3

    .line 691
    .local v3, "loopMode":Lcom/vkontakte/android/audio/player/LoopMode;
    sget-object v8, Lcom/vkontakte/android/audio/player/LoopMode;->TRACK:Lcom/vkontakte/android/audio/player/LoopMode;

    if-eq v3, v8, :cond_1

    .line 692
    sget-object v8, Lcom/vkontakte/android/audio/player/LoopMode;->TRACK:Lcom/vkontakte/android/audio/player/LoopMode;

    invoke-static {v8}, Lcom/vkontakte/android/audio/AudioFacade;->setRepeatMode(Lcom/vkontakte/android/audio/player/LoopMode;)V

    .line 696
    :goto_1
    sget-object v8, Lcom/vkontakte/android/audio/player/LoopMode;->TRACK:Lcom/vkontakte/android/audio/player/LoopMode;

    if-eq v3, v8, :cond_2

    :goto_2
    invoke-virtual {p1, v6}, Landroid/view/View;->setSelected(Z)V

    goto :goto_0

    .line 694
    :cond_1
    sget-object v8, Lcom/vkontakte/android/audio/player/LoopMode;->NONE:Lcom/vkontakte/android/audio/player/LoopMode;

    invoke-static {v8}, Lcom/vkontakte/android/audio/AudioFacade;->setRepeatMode(Lcom/vkontakte/android/audio/player/LoopMode;)V

    goto :goto_1

    :cond_2
    move v6, v7

    .line 696
    goto :goto_2

    .line 700
    .end local v3    # "loopMode":Lcom/vkontakte/android/audio/player/LoopMode;
    :pswitch_6
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->isShuffle()Z

    move-result v2

    .line 701
    .local v2, "isRandom":Z
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->toggleShuffle()V

    .line 702
    if-nez v2, :cond_3

    :goto_3
    invoke-virtual {p1, v6}, Landroid/view/View;->setSelected(Z)V

    goto :goto_0

    :cond_3
    move v6, v7

    goto :goto_3

    .line 705
    .end local v2    # "isRandom":Z
    :pswitch_7
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getPlayerState()Lcom/vkontakte/android/audio/player/PlayerState;

    move-result-object v6

    sget-object v7, Lcom/vkontakte/android/audio/player/PlayerState;->IDLE:Lcom/vkontakte/android/audio/player/PlayerState;

    if-eq v6, v7, :cond_0

    .line 706
    invoke-direct {p0}, Lcom/vkontakte/android/AudioPlayerActivity;->showBroadcastDialog()V

    goto :goto_0

    .line 710
    :pswitch_8
    new-instance v6, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;

    invoke-direct {v6}, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;-><init>()V

    invoke-virtual {p0}, Lcom/vkontakte/android/AudioPlayerActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v7

    invoke-virtual {v7}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v7

    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Landroid/app/FragmentTransaction;->addToBackStack(Ljava/lang/String;)Landroid/app/FragmentTransaction;

    move-result-object v7

    const-string/jumbo v8, "dialog"

    invoke-virtual {v6, v7, v8}, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->show(Landroid/app/FragmentTransaction;Ljava/lang/String;)I

    goto :goto_0

    .line 714
    :pswitch_9
    iget-boolean v8, p0, Lcom/vkontakte/android/AudioPlayerActivity;->isTablet:Z

    if-eqz v8, :cond_5

    .line 715
    new-instance v1, Landroid/view/View;

    invoke-direct {v1, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 716
    .local v1, "fakeView":Landroid/view/View;
    new-instance v8, Landroid/widget/FrameLayout$LayoutParams;

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v9

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v10

    invoke-direct {v8, v9, v10}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v8}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 717
    const/4 v8, 0x2

    new-array v5, v8, [I

    fill-array-data v5, :array_0

    .line 718
    .local v5, "pos":[I
    invoke-virtual {p1, v5}, Landroid/view/View;->getLocationInWindow([I)V

    .line 719
    aget v7, v5, v7

    const/high16 v8, 0x42a00000    # 80.0f

    invoke-static {v8}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v8

    sub-int/2addr v7, v8

    int-to-float v7, v7

    invoke-virtual {v1, v7}, Landroid/view/View;->setTranslationX(F)V

    .line 720
    aget v6, v5, v6

    int-to-float v6, v6

    invoke-virtual {v1, v6}, Landroid/view/View;->setTranslationY(F)V

    .line 721
    invoke-virtual {p0}, Lcom/vkontakte/android/AudioPlayerActivity;->getWindow()Landroid/view/Window;

    move-result-object v6

    invoke-virtual {v6}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    invoke-virtual {v6, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 722
    move-object v0, v1

    .line 726
    .end local v1    # "fakeView":Landroid/view/View;
    .end local v5    # "pos":[I
    .local v0, "anchor":Landroid/view/View;
    :goto_4
    new-instance v4, Landroid/widget/PopupMenu;

    invoke-direct {v4, p0, v0}, Landroid/widget/PopupMenu;-><init>(Landroid/content/Context;Landroid/view/View;)V

    .line 727
    .local v4, "pm":Landroid/widget/PopupMenu;
    invoke-virtual {v4}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/vkontakte/android/AudioPlayerActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    .line 728
    invoke-virtual {v4}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/vkontakte/android/AudioPlayerActivity;->onPrepareOptionsMenu(Landroid/view/Menu;)Z

    .line 729
    invoke-static {p0}, Lcom/vkontakte/android/AudioPlayerActivity$$Lambda$5;->lambdaFactory$(Lcom/vkontakte/android/AudioPlayerActivity;)Landroid/widget/PopupMenu$OnMenuItemClickListener;

    move-result-object v6

    invoke-virtual {v4, v6}, Landroid/widget/PopupMenu;->setOnMenuItemClickListener(Landroid/widget/PopupMenu$OnMenuItemClickListener;)V

    .line 730
    iget-boolean v6, p0, Lcom/vkontakte/android/AudioPlayerActivity;->isTablet:Z

    if-eqz v6, :cond_4

    .line 731
    invoke-static {p0, v0}, Lcom/vkontakte/android/AudioPlayerActivity$$Lambda$6;->lambdaFactory$(Lcom/vkontakte/android/AudioPlayerActivity;Landroid/view/View;)Landroid/widget/PopupMenu$OnDismissListener;

    move-result-object v6

    invoke-virtual {v4, v6}, Landroid/widget/PopupMenu;->setOnDismissListener(Landroid/widget/PopupMenu$OnDismissListener;)V

    .line 733
    :cond_4
    invoke-virtual {v4}, Landroid/widget/PopupMenu;->show()V

    goto/16 :goto_0

    .line 724
    .end local v0    # "anchor":Landroid/view/View;
    .end local v4    # "pm":Landroid/widget/PopupMenu;
    :cond_5
    move-object v0, p1

    .restart local v0    # "anchor":Landroid/view/View;
    goto :goto_4

    .line 736
    .end local v0    # "anchor":Landroid/view/View;
    :pswitch_a
    invoke-virtual {p0}, Lcom/vkontakte/android/AudioPlayerActivity;->finish()V

    goto/16 :goto_0

    .line 739
    :pswitch_b
    invoke-direct {p0}, Lcom/vkontakte/android/AudioPlayerActivity;->addCurrent()V

    goto/16 :goto_0

    .line 671
    :pswitch_data_0
    .packed-switch 0x7f100225
        :pswitch_a
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_b
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_9
    .end packed-switch

    .line 717
    :array_0
    .array-data 4
        0x0
        0x0
    .end array-data
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 11
    .param p1, "b"    # Landroid/os/Bundle;

    .prologue
    const/4 v9, -0x1

    const/high16 v8, 0x43b40000    # 360.0f

    const v10, 0x7f0f0117

    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 185
    invoke-super {p0, p1}, Lcom/vkontakte/android/VKActivity;->onCreate(Landroid/os/Bundle;)V

    .line 186
    const v4, 0x7f080469

    invoke-virtual {p0, v4}, Lcom/vkontakte/android/AudioPlayerActivity;->setTitle(I)V

    .line 188
    const v4, 0x7f03005f

    const/4 v7, 0x0

    invoke-static {p0, v4, v7}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 189
    .local v0, "contentView":Landroid/view/ViewGroup;
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v4, v9, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 190
    invoke-virtual {v0, v6}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 191
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/AudioPlayerActivity;->setContentView(Landroid/view/View;)V

    .line 193
    invoke-virtual {p0}, Lcom/vkontakte/android/AudioPlayerActivity;->getWindow()Landroid/view/Window;

    move-result-object v3

    .line 194
    .local v3, "w":Landroid/view/Window;
    iget-boolean v4, p0, Lcom/vkontakte/android/AudioPlayerActivity;->isTablet:Z

    if-eqz v4, :cond_1

    .line 196
    invoke-virtual {v3}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v4

    const v7, 0x7f100128

    invoke-virtual {v4, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    .line 197
    .local v2, "textView":Landroid/view/View;
    if-eqz v2, :cond_0

    .line 198
    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    check-cast v4, Landroid/view/ViewGroup;

    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 201
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/AudioPlayerActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v4

    iget v4, v4, Landroid/content/res/Configuration;->screenWidthDp:I

    invoke-virtual {p0}, Lcom/vkontakte/android/AudioPlayerActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v7

    iget v7, v7, Landroid/content/res/Configuration;->screenHeightDp:I

    if-le v4, v7, :cond_6

    .line 202
    const/16 v4, 0x340

    invoke-virtual {p0}, Lcom/vkontakte/android/AudioPlayerActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v7

    iget v7, v7, Landroid/content/res/Configuration;->screenWidthDp:I

    add-int/lit8 v7, v7, -0x20

    invoke-static {v4, v7}, Ljava/lang/Math;->min(II)I

    move-result v4

    int-to-float v4, v4

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    invoke-static {v8}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v7

    invoke-virtual {v3, v4, v7}, Landroid/view/Window;->setLayout(II)V

    .line 206
    :goto_0
    const/16 v4, 0x11

    invoke-virtual {v3, v4}, Landroid/view/Window;->setGravity(I)V

    .line 207
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v7, 0x15

    if-lt v4, v7, :cond_1

    .line 208
    invoke-virtual {v3}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v4

    new-instance v7, Lcom/vkontakte/android/AudioPlayerActivity$2;

    invoke-direct {v7, p0, v3}, Lcom/vkontakte/android/AudioPlayerActivity$2;-><init>(Lcom/vkontakte/android/AudioPlayerActivity;Landroid/view/Window;)V

    invoke-virtual {v4, v7}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 216
    invoke-virtual {v3}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4, v5}, Landroid/view/View;->setClipToOutline(Z)V

    .line 219
    .end local v2    # "textView":Landroid/view/View;
    :cond_1
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v7, 0x13

    if-lt v4, v7, :cond_2

    .line 220
    invoke-virtual {v3}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v4

    const/16 v7, 0x400

    invoke-virtual {v4, v7}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 221
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v7, 0x15

    if-lt v4, v7, :cond_7

    .line 222
    const/high16 v4, -0x80000000

    invoke-virtual {v3, v4}, Landroid/view/Window;->addFlags(I)V

    .line 223
    const/high16 v4, 0x44000000    # 512.0f

    invoke-virtual {v3, v4}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 229
    :cond_2
    :goto_1
    const v4, 0x7f10022e

    invoke-direct {p0, v4}, Lcom/vkontakte/android/AudioPlayerActivity;->setOnClickListener(I)Landroid/view/View;

    move-result-object v4

    iput-object v4, p0, Lcom/vkontakte/android/AudioPlayerActivity;->buttonPrev:Landroid/view/View;

    .line 230
    const v4, 0x7f10022f

    invoke-direct {p0, v4}, Lcom/vkontakte/android/AudioPlayerActivity;->setOnClickListener(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageView;

    iput-object v4, p0, Lcom/vkontakte/android/AudioPlayerActivity;->buttonPlay:Landroid/widget/ImageView;

    .line 231
    const v4, 0x7f100230

    invoke-direct {p0, v4}, Lcom/vkontakte/android/AudioPlayerActivity;->setOnClickListener(I)Landroid/view/View;

    move-result-object v4

    iput-object v4, p0, Lcom/vkontakte/android/AudioPlayerActivity;->buttonNext:Landroid/view/View;

    .line 233
    const v4, 0x7f100226

    invoke-direct {p0, v4}, Lcom/vkontakte/android/AudioPlayerActivity;->setOnClickListener(I)Landroid/view/View;

    move-result-object v4

    iput-object v4, p0, Lcom/vkontakte/android/AudioPlayerActivity;->disableAd:Landroid/view/View;

    .line 235
    const v4, 0x7f100228

    invoke-virtual {p0, v4}, Lcom/vkontakte/android/AudioPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/SeekBar;

    iput-object v4, p0, Lcom/vkontakte/android/AudioPlayerActivity;->seekProgress:Landroid/widget/SeekBar;

    .line 236
    iget-object v4, p0, Lcom/vkontakte/android/AudioPlayerActivity;->seekProgress:Landroid/widget/SeekBar;

    invoke-virtual {v4, p0}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 238
    const v4, 0x7f10022b

    invoke-virtual {p0, v4}, Lcom/vkontakte/android/AudioPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, p0, Lcom/vkontakte/android/AudioPlayerActivity;->textArtist:Landroid/widget/TextView;

    .line 239
    const v4, 0x7f100224

    invoke-virtual {p0, v4}, Lcom/vkontakte/android/AudioPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, p0, Lcom/vkontakte/android/AudioPlayerActivity;->textTitle:Landroid/widget/TextView;

    .line 240
    const v4, 0x7f10022a

    invoke-virtual {p0, v4}, Lcom/vkontakte/android/AudioPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, p0, Lcom/vkontakte/android/AudioPlayerActivity;->textTime:Landroid/widget/TextView;

    .line 241
    const v4, 0x7f100229

    invoke-virtual {p0, v4}, Lcom/vkontakte/android/AudioPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, p0, Lcom/vkontakte/android/AudioPlayerActivity;->textDuration:Landroid/widget/TextView;

    .line 243
    new-instance v4, Ljava/io/File;

    const-string/jumbo v7, "/system/app/SecLauncher2.apk"

    invoke-direct {v4, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_3

    new-instance v4, Ljava/io/File;

    const-string/jumbo v7, "/system/app/SecLauncher3.apk"

    invoke-direct {v4, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_8

    :cond_3
    move v1, v5

    .line 244
    .local v1, "isTouchWiz":Z
    :goto_2
    if-eqz v1, :cond_9

    .line 245
    iget-object v4, p0, Lcom/vkontakte/android/AudioPlayerActivity;->textArtist:Landroid/widget/TextView;

    new-instance v7, Landroid/text/method/ScrollingMovementMethod;

    invoke-direct {v7}, Landroid/text/method/ScrollingMovementMethod;-><init>()V

    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 246
    iget-object v4, p0, Lcom/vkontakte/android/AudioPlayerActivity;->textTitle:Landroid/widget/TextView;

    new-instance v7, Landroid/text/method/ScrollingMovementMethod;

    invoke-direct {v7}, Landroid/text/method/ScrollingMovementMethod;-><init>()V

    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 252
    :goto_3
    const v4, 0x7f100234

    invoke-direct {p0, v4}, Lcom/vkontakte/android/AudioPlayerActivity;->setOnClickListener(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageView;

    iput-object v4, p0, Lcom/vkontakte/android/AudioPlayerActivity;->buttonRepeat:Landroid/widget/ImageView;

    .line 253
    iget-object v7, p0, Lcom/vkontakte/android/AudioPlayerActivity;->buttonRepeat:Landroid/widget/ImageView;

    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getLoopMode()Lcom/vkontakte/android/audio/player/LoopMode;

    move-result-object v4

    sget-object v8, Lcom/vkontakte/android/audio/player/LoopMode;->TRACK:Lcom/vkontakte/android/audio/player/LoopMode;

    if-ne v4, v8, :cond_a

    move v4, v5

    :goto_4
    invoke-virtual {v7, v4}, Landroid/widget/ImageView;->setSelected(Z)V

    .line 254
    iget-object v4, p0, Lcom/vkontakte/android/AudioPlayerActivity;->buttonRepeat:Landroid/widget/ImageView;

    new-instance v7, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;

    const v8, 0x7f020271

    invoke-static {p0, v8}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v8

    invoke-virtual {p0}, Lcom/vkontakte/android/AudioPlayerActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v9

    invoke-direct {v7, v8, v9}, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;-><init>(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    invoke-virtual {v4, v7}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 256
    const v4, 0x7f100233

    invoke-direct {p0, v4}, Lcom/vkontakte/android/AudioPlayerActivity;->setOnClickListener(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageView;

    iput-object v4, p0, Lcom/vkontakte/android/AudioPlayerActivity;->buttonShuffle:Landroid/widget/ImageView;

    .line 257
    iget-object v4, p0, Lcom/vkontakte/android/AudioPlayerActivity;->buttonShuffle:Landroid/widget/ImageView;

    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->isShuffle()Z

    move-result v7

    invoke-virtual {v4, v7}, Landroid/widget/ImageView;->setSelected(Z)V

    .line 258
    iget-object v4, p0, Lcom/vkontakte/android/AudioPlayerActivity;->buttonShuffle:Landroid/widget/ImageView;

    new-instance v7, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;

    const v8, 0x7f02028f

    invoke-static {p0, v8}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v8

    invoke-virtual {p0}, Lcom/vkontakte/android/AudioPlayerActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v9

    invoke-direct {v7, v8, v9}, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;-><init>(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    invoke-virtual {v4, v7}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 260
    const v4, 0x7f100232

    invoke-direct {p0, v4}, Lcom/vkontakte/android/AudioPlayerActivity;->setOnClickListener(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageView;

    iput-object v4, p0, Lcom/vkontakte/android/AudioPlayerActivity;->buttonBroadcast:Landroid/widget/ImageView;

    .line 261
    iget-object v4, p0, Lcom/vkontakte/android/AudioPlayerActivity;->buttonBroadcast:Landroid/widget/ImageView;

    new-instance v7, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;

    const v8, 0x7f020288

    invoke-static {p0, v8}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v8

    invoke-virtual {p0}, Lcom/vkontakte/android/AudioPlayerActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v9

    invoke-direct {v7, v8, v9}, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;-><init>(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    invoke-virtual {v4, v7}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 262
    iget-object v4, p0, Lcom/vkontakte/android/AudioPlayerActivity;->buttonBroadcast:Landroid/widget/ImageView;

    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->isBroadcast()Z

    move-result v7

    invoke-virtual {v4, v7}, Landroid/widget/ImageView;->setSelected(Z)V

    .line 264
    const v4, 0x7f100231

    invoke-direct {p0, v4}, Lcom/vkontakte/android/AudioPlayerActivity;->setOnClickListener(I)Landroid/view/View;

    move-result-object v4

    iput-object v4, p0, Lcom/vkontakte/android/AudioPlayerActivity;->buttonPlaylist:Landroid/view/View;

    .line 265
    const v4, 0x7f100235

    invoke-direct {p0, v4}, Lcom/vkontakte/android/AudioPlayerActivity;->setOnClickListener(I)Landroid/view/View;

    move-result-object v4

    iput-object v4, p0, Lcom/vkontakte/android/AudioPlayerActivity;->buttonMenu:Landroid/view/View;

    .line 266
    const v4, 0x7f100225

    invoke-direct {p0, v4}, Lcom/vkontakte/android/AudioPlayerActivity;->setOnClickListener(I)Landroid/view/View;

    .line 267
    const v4, 0x7f10022d

    invoke-direct {p0, v4}, Lcom/vkontakte/android/AudioPlayerActivity;->setOnClickListener(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageView;

    iput-object v4, p0, Lcom/vkontakte/android/AudioPlayerActivity;->buttonAdd:Landroid/widget/ImageView;

    .line 269
    const v4, 0x7f02023f

    invoke-static {p0, v4}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    iput-object v4, p0, Lcom/vkontakte/android/AudioPlayerActivity;->playIcon:Landroid/graphics/drawable/Drawable;

    .line 270
    const v4, 0x7f020230

    invoke-static {p0, v4}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    iput-object v4, p0, Lcom/vkontakte/android/AudioPlayerActivity;->pauseIcon:Landroid/graphics/drawable/Drawable;

    .line 272
    const v4, 0x7f100223

    invoke-virtual {p0, v4}, Lcom/vkontakte/android/AudioPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/support/v4/view/ViewPager;

    iput-object v4, p0, Lcom/vkontakte/android/AudioPlayerActivity;->pagerCover:Landroid/support/v4/view/ViewPager;

    .line 273
    iget-object v4, p0, Lcom/vkontakte/android/AudioPlayerActivity;->pagerCover:Landroid/support/v4/view/ViewPager;

    if-eqz v4, :cond_5

    .line 274
    iget-object v4, p0, Lcom/vkontakte/android/AudioPlayerActivity;->coverPagerAdapter:Lcom/vkontakte/android/AudioPlayerActivity$CoverPagerAdapter;

    invoke-virtual {v4}, Lcom/vkontakte/android/AudioPlayerActivity$CoverPagerAdapter;->notifyDataSetChanged()V

    .line 275
    iget-object v4, p0, Lcom/vkontakte/android/AudioPlayerActivity;->pagerCover:Landroid/support/v4/view/ViewPager;

    iget-object v7, p0, Lcom/vkontakte/android/AudioPlayerActivity;->coverPagerAdapter:Lcom/vkontakte/android/AudioPlayerActivity$CoverPagerAdapter;

    invoke-virtual {v4, v7}, Landroid/support/v4/view/ViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    .line 276
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getPlayerState()Lcom/vkontakte/android/audio/player/PlayerState;

    move-result-object v4

    sget-object v7, Lcom/vkontakte/android/audio/player/PlayerState;->IDLE:Lcom/vkontakte/android/audio/player/PlayerState;

    if-eq v4, v7, :cond_4

    .line 277
    iget-object v4, p0, Lcom/vkontakte/android/AudioPlayerActivity;->pagerCover:Landroid/support/v4/view/ViewPager;

    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getActualTrackIndex()I

    move-result v7

    add-int/lit8 v7, v7, 0x1

    invoke-virtual {v4, v7, v6}, Landroid/support/v4/view/ViewPager;->setCurrentItem(IZ)V

    .line 279
    :cond_4
    iget-object v4, p0, Lcom/vkontakte/android/AudioPlayerActivity;->pagerCover:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v4, p0}, Landroid/support/v4/view/ViewPager;->addOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    .line 280
    iget-object v4, p0, Lcom/vkontakte/android/AudioPlayerActivity;->pagerCover:Landroid/support/v4/view/ViewPager;

    new-instance v6, Lcom/vkontakte/android/ui/DepthPageTransformer;

    invoke-direct {v6}, Lcom/vkontakte/android/ui/DepthPageTransformer;-><init>()V

    invoke-virtual {v4, v5, v6}, Landroid/support/v4/view/ViewPager;->setPageTransformer(ZLandroid/support/v4/view/ViewPager$PageTransformer;)V

    .line 283
    :cond_5
    iget-object v4, p0, Lcom/vkontakte/android/AudioPlayerActivity;->lastTrackInfo:Lcom/vkontakte/android/audio/player/TrackInfo;

    invoke-direct {p0, v4}, Lcom/vkontakte/android/AudioPlayerActivity;->syncEnabled(Lcom/vkontakte/android/audio/player/TrackInfo;)V

    .line 284
    return-void

    .line 204
    .end local v1    # "isTouchWiz":Z
    .restart local v2    # "textView":Landroid/view/View;
    :cond_6
    invoke-static {v8}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    const/16 v7, 0x258

    invoke-virtual {p0}, Lcom/vkontakte/android/AudioPlayerActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v8

    iget v8, v8, Landroid/content/res/Configuration;->screenHeightDp:I

    add-int/lit8 v8, v8, -0x20

    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v7

    int-to-float v7, v7

    invoke-static {v7}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v7

    invoke-virtual {v3, v4, v7}, Landroid/view/Window;->setLayout(II)V

    goto/16 :goto_0

    .line 225
    .end local v2    # "textView":Landroid/view/View;
    :cond_7
    const/high16 v4, 0x4000000

    invoke-virtual {v3, v4}, Landroid/view/Window;->addFlags(I)V

    goto/16 :goto_1

    :cond_8
    move v1, v6

    .line 243
    goto/16 :goto_2

    .line 248
    .restart local v1    # "isTouchWiz":Z
    :cond_9
    iget-object v4, p0, Lcom/vkontakte/android/AudioPlayerActivity;->textArtist:Landroid/widget/TextView;

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setSelected(Z)V

    .line 249
    iget-object v4, p0, Lcom/vkontakte/android/AudioPlayerActivity;->textTitle:Landroid/widget/TextView;

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setSelected(Z)V

    goto/16 :goto_3

    :cond_a
    move v4, v6

    .line 253
    goto/16 :goto_4
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 305
    invoke-virtual {p0}, Lcom/vkontakte/android/AudioPlayerActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const v1, 0x7f110001

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 306
    const/4 v0, 0x1

    return v0
.end method

.method public onDownloadFinished(Z)V
    .locals 0
    .param p1, "completed"    # Z

    .prologue
    .line 815
    return-void
.end method

.method public onDownloadStarted()V
    .locals 0

    .prologue
    .line 811
    return-void
.end method

.method public onNavigateUp()Z
    .locals 1

    .prologue
    .line 397
    invoke-virtual {p0}, Lcom/vkontakte/android/AudioPlayerActivity;->finish()V

    .line 398
    const/4 v0, 0x1

    return v0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 5
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v1, 0x1

    .line 339
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v2

    sparse-switch v2, :sswitch_data_0

    .line 372
    :cond_0
    invoke-super {p0, p1}, Lcom/vkontakte/android/VKActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    :goto_0
    return v1

    .line 341
    :sswitch_0
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/auth/VKAccount;->isMusicRestricted()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 342
    iget-object v2, p0, Lcom/vkontakte/android/AudioPlayerActivity;->boomHelper:Lcom/vk/music/utils/BoomHelper;

    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getCurrentTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v3

    sget-object v4, Lcom/vk/music/utils/BoomHelper$From;->player:Lcom/vk/music/utils/BoomHelper$From;

    invoke-virtual {v2, p0, v3, v4}, Lcom/vk/music/utils/BoomHelper;->loadTrack(Landroid/content/Context;Lcom/vkontakte/android/audio/MusicTrack;Lcom/vk/music/utils/BoomHelper$From;)V

    goto :goto_0

    .line 344
    :cond_1
    invoke-direct {p0}, Lcom/vkontakte/android/AudioPlayerActivity;->toggleCachedState()V

    goto :goto_0

    .line 348
    :sswitch_1
    invoke-virtual {p0}, Lcom/vkontakte/android/AudioPlayerActivity;->showLyrics()V

    goto :goto_0

    .line 351
    :sswitch_2
    invoke-direct {p0}, Lcom/vkontakte/android/AudioPlayerActivity;->confirmAndDelete()V

    goto :goto_0

    .line 354
    :sswitch_3
    invoke-direct {p0}, Lcom/vkontakte/android/AudioPlayerActivity;->searchArtist()V

    goto :goto_0

    .line 357
    :sswitch_4
    new-instance v0, Lcom/vkontakte/android/NewsEntry;

    invoke-direct {v0}, Lcom/vkontakte/android/NewsEntry;-><init>()V

    .line 358
    .local v0, "e":Lcom/vkontakte/android/NewsEntry;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    .line 359
    iget-object v2, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    new-instance v3, Lcom/vkontakte/android/attachments/AudioAttachment;

    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getCurrentTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/vkontakte/android/attachments/AudioAttachment;-><init>(Lcom/vkontakte/android/audio/MusicTrack;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 360
    const/4 v2, -0x1

    iput v2, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    .line 361
    new-instance v2, Landroid/content/Intent;

    const-class v3, Lcom/vkontakte/android/RepostActivity;

    invoke-direct {v2, p0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string/jumbo v3, "post"

    invoke-virtual {v2, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    move-result-object v2

    const-string/jumbo v3, "msg"

    invoke-virtual {v2, v3, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/AudioPlayerActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 364
    .end local v0    # "e":Lcom/vkontakte/android/NewsEntry;
    :sswitch_5
    invoke-virtual {p0}, Lcom/vkontakte/android/AudioPlayerActivity;->isTaskRoot()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 365
    new-instance v2, Lcom/vk/music/fragment/MusicFragment$Builder;

    invoke-direct {v2}, Lcom/vk/music/fragment/MusicFragment$Builder;-><init>()V

    invoke-virtual {v2, p0}, Lcom/vk/music/fragment/MusicFragment$Builder;->intent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v2

    const/high16 v3, 0x4000000

    .line 366
    invoke-virtual {v2, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    move-result-object v2

    .line 365
    invoke-virtual {p0, v2}, Lcom/vkontakte/android/AudioPlayerActivity;->startActivity(Landroid/content/Intent;)V

    .line 367
    invoke-virtual {p0}, Lcom/vkontakte/android/AudioPlayerActivity;->finish()V

    goto :goto_0

    .line 339
    nop

    :sswitch_data_0
    .sparse-switch
        0x102002c -> :sswitch_5
        0x7f1005da -> :sswitch_0
        0x7f1005db -> :sswitch_1
        0x7f1005dc -> :sswitch_2
        0x7f1005dd -> :sswitch_3
        0x7f1005de -> :sswitch_4
    .end sparse-switch
.end method

.method public onPageScrollStateChanged(I)V
    .locals 9
    .param p1, "state"    # I

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 618
    new-array v4, v8, [Ljava/lang/Object;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "state changed "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v7

    invoke-static {v4}, Lcom/vkontakte/android/utils/L;->i([Ljava/lang/Object;)V

    .line 619
    iput p1, p0, Lcom/vkontakte/android/AudioPlayerActivity;->pagerCoverScrollState:I

    .line 620
    if-nez p1, :cond_2

    .line 621
    iget-object v4, p0, Lcom/vkontakte/android/AudioPlayerActivity;->pagerCover:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v4}, Landroid/support/v4/view/ViewPager;->getCurrentItem()I

    move-result v1

    .line 622
    .local v1, "pos":I
    if-nez v1, :cond_0

    .line 623
    iget-object v4, p0, Lcom/vkontakte/android/AudioPlayerActivity;->pagerCover:Landroid/support/v4/view/ViewPager;

    iget-object v5, p0, Lcom/vkontakte/android/AudioPlayerActivity;->pagerCover:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v5}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v5

    invoke-virtual {v5}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v5

    add-int/lit8 v5, v5, -0x2

    invoke-virtual {v4, v5, v7}, Landroid/support/v4/view/ViewPager;->setCurrentItem(IZ)V

    .line 625
    :cond_0
    iget-object v4, p0, Lcom/vkontakte/android/AudioPlayerActivity;->pagerCover:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v4}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v4

    invoke-virtual {v4}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    if-lt v1, v4, :cond_1

    .line 626
    iget-object v4, p0, Lcom/vkontakte/android/AudioPlayerActivity;->pagerCover:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v4, v8, v7}, Landroid/support/v4/view/ViewPager;->setCurrentItem(IZ)V

    .line 628
    :cond_1
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getCurrentTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v3

    .line 629
    .local v3, "realCurrentTrack":Lcom/vkontakte/android/audio/player/PlayerTrack;
    iget-object v4, p0, Lcom/vkontakte/android/AudioPlayerActivity;->coverPagerAdapter:Lcom/vkontakte/android/AudioPlayerActivity$CoverPagerAdapter;

    invoke-virtual {v4, v1}, Lcom/vkontakte/android/AudioPlayerActivity$CoverPagerAdapter;->getByPosition(I)Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v0

    .line 630
    .local v0, "currentTrack":Lcom/vkontakte/android/audio/player/PlayerTrack;
    iget v4, p0, Lcom/vkontakte/android/AudioPlayerActivity;->pagerCoverScrollStateDragIdle:I

    if-ne v4, v8, :cond_5

    if-eqz v0, :cond_5

    if-nez v3, :cond_4

    const/4 v4, 0x0

    :goto_0
    iget-object v5, v0, Lcom/vkontakte/android/audio/player/PlayerTrack;->uuid:Ljava/lang/String;

    .line 632
    invoke-static {v4, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_5

    .line 633
    iget-object v4, v0, Lcom/vkontakte/android/audio/player/PlayerTrack;->uuid:Ljava/lang/String;

    invoke-static {v4}, Lcom/vkontakte/android/audio/AudioFacade;->playTrack(Ljava/lang/String;)V

    .line 643
    .end local v0    # "currentTrack":Lcom/vkontakte/android/audio/player/PlayerTrack;
    .end local v1    # "pos":I
    .end local v3    # "realCurrentTrack":Lcom/vkontakte/android/audio/player/PlayerTrack;
    :cond_2
    :goto_1
    if-ne p1, v8, :cond_6

    .line 644
    iput v8, p0, Lcom/vkontakte/android/AudioPlayerActivity;->pagerCoverScrollStateDragIdle:I

    .line 648
    :cond_3
    :goto_2
    return-void

    .line 630
    .restart local v0    # "currentTrack":Lcom/vkontakte/android/audio/player/PlayerTrack;
    .restart local v1    # "pos":I
    .restart local v3    # "realCurrentTrack":Lcom/vkontakte/android/audio/player/PlayerTrack;
    :cond_4
    iget-object v4, v3, Lcom/vkontakte/android/audio/player/PlayerTrack;->uuid:Ljava/lang/String;

    goto :goto_0

    .line 635
    :cond_5
    iget-object v4, p0, Lcom/vkontakte/android/AudioPlayerActivity;->coverPagerAdapter:Lcom/vkontakte/android/AudioPlayerActivity$CoverPagerAdapter;

    invoke-virtual {v4}, Lcom/vkontakte/android/AudioPlayerActivity$CoverPagerAdapter;->notifyDataSetChanged()V

    .line 636
    iget-object v4, p0, Lcom/vkontakte/android/AudioPlayerActivity;->coverPagerAdapter:Lcom/vkontakte/android/AudioPlayerActivity$CoverPagerAdapter;

    invoke-virtual {v4, v3}, Lcom/vkontakte/android/AudioPlayerActivity$CoverPagerAdapter;->getPositionForTrack(Lcom/vkontakte/android/audio/player/PlayerTrack;)I

    move-result v2

    .line 637
    .local v2, "position":I
    iget-object v4, p0, Lcom/vkontakte/android/AudioPlayerActivity;->pagerCover:Landroid/support/v4/view/ViewPager;

    iget-object v5, p0, Lcom/vkontakte/android/AudioPlayerActivity;->coverPagerAdapter:Lcom/vkontakte/android/AudioPlayerActivity$CoverPagerAdapter;

    invoke-virtual {v4, v5}, Landroid/support/v4/view/ViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    .line 638
    if-ltz v2, :cond_2

    .line 639
    iget-object v4, p0, Lcom/vkontakte/android/AudioPlayerActivity;->pagerCover:Landroid/support/v4/view/ViewPager;

    add-int/lit8 v5, v2, 0x1

    invoke-virtual {v4, v5, v7}, Landroid/support/v4/view/ViewPager;->setCurrentItem(IZ)V

    goto :goto_1

    .line 645
    .end local v0    # "currentTrack":Lcom/vkontakte/android/audio/player/PlayerTrack;
    .end local v1    # "pos":I
    .end local v2    # "position":I
    .end local v3    # "realCurrentTrack":Lcom/vkontakte/android/audio/player/PlayerTrack;
    :cond_6
    if-nez p1, :cond_3

    .line 646
    iput v7, p0, Lcom/vkontakte/android/AudioPlayerActivity;->pagerCoverScrollStateDragIdle:I

    goto :goto_2
.end method

.method public onPageScrolled(IFI)V
    .locals 0
    .param p1, "page"    # I
    .param p2, "offset"    # F
    .param p3, "offsetPx"    # I

    .prologue
    .line 614
    return-void
.end method

.method public onPageSelected(I)V
    .locals 0
    .param p1, "pos"    # I

    .prologue
    .line 610
    return-void
.end method

.method public onParametersChanged(Lcom/vkontakte/android/audio/player/Player;)V
    .locals 1
    .param p1, "player"    # Lcom/vkontakte/android/audio/player/Player;

    .prologue
    .line 795
    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity;->coverPagerAdapter:Lcom/vkontakte/android/AudioPlayerActivity$CoverPagerAdapter;

    invoke-virtual {v0}, Lcom/vkontakte/android/AudioPlayerActivity$CoverPagerAdapter;->notifyDataSetChanged()V

    .line 796
    return-void
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 298
    invoke-super {p0}, Lcom/vkontakte/android/VKActivity;->onPause()V

    .line 299
    const/high16 v0, -0x80000000

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/AudioPlayerActivity;->setVolumeControlStream(I)V

    .line 300
    invoke-static {p0}, Lcom/vkontakte/android/audio/AudioFacade;->removePlayerListener(Lcom/vkontakte/android/audio/player/PlayerListener;)V

    .line 301
    invoke-static {p0}, Lcom/vkontakte/android/audio/AudioFacade;->removeSavedTracksListener(Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;)V

    .line 302
    return-void
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)Z
    .locals 10
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    const v9, 0x7f1005dc

    const v8, 0x7f1005da

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 310
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getCurrentTrackInfo()Lcom/vkontakte/android/audio/player/TrackInfo;

    move-result-object v3

    .line 311
    .local v3, "ti":Lcom/vkontakte/android/audio/player/TrackInfo;
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getCurrentTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v1

    .line 312
    .local v1, "f":Lcom/vkontakte/android/audio/player/PlayerTrack;
    if-eqz v1, :cond_1

    .line 313
    invoke-virtual {v1}, Lcom/vkontakte/android/audio/player/PlayerTrack;->getMid()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/vkontakte/android/audio/AudioFacade;->isCached(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_0

    invoke-virtual {v1}, Lcom/vkontakte/android/audio/player/PlayerTrack;->getMid()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/vkontakte/android/audio/AudioFacade;->isDownloading(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_2

    :cond_0
    move v0, v5

    .line 314
    .local v0, "cached":Z
    :goto_0
    invoke-interface {p1, v8}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v7

    if-eqz v0, :cond_3

    const v6, 0x7f020162

    :goto_1
    invoke-interface {v7, v6}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 315
    invoke-interface {p1, v8}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v6

    invoke-interface {v6, v0}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    .line 316
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v6

    invoke-virtual {v6}, Lcom/vkontakte/android/auth/VKAccount;->isMusicRestricted()Z

    move-result v6

    if-eqz v6, :cond_4

    .line 317
    invoke-interface {p1, v8}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v6

    invoke-interface {v6, v5}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 318
    invoke-interface {p1, v8}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v6

    invoke-interface {v6, v4}, Landroid/view/MenuItem;->setCheckable(Z)Landroid/view/MenuItem;

    .line 323
    :goto_2
    iget v6, v1, Lcom/vkontakte/android/audio/player/PlayerTrack;->oid:I

    invoke-static {v6}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v6

    if-eqz v6, :cond_8

    .line 324
    invoke-interface {p1, v9}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v7

    iget-boolean v6, v1, Lcom/vkontakte/android/audio/player/PlayerTrack;->fromAttachment:Z

    if-nez v6, :cond_7

    move v6, v5

    :goto_3
    invoke-interface {v7, v6}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 328
    :goto_4
    const v6, 0x7f1005db

    invoke-interface {p1, v6}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v6

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/AudioPlayerActivity;->haveLyrics(Lcom/vkontakte/android/audio/player/PlayerTrack;)Z

    move-result v7

    invoke-interface {v6, v7}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 330
    .end local v0    # "cached":Z
    :cond_1
    if-eqz v3, :cond_9

    invoke-virtual {v3}, Lcom/vkontakte/android/audio/player/TrackInfo;->isContentMode()Z

    move-result v6

    if-nez v6, :cond_9

    .line 331
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_5
    invoke-interface {p1}, Landroid/view/Menu;->size()I

    move-result v6

    if-ge v2, v6, :cond_9

    .line 332
    invoke-interface {p1, v2}, Landroid/view/Menu;->getItem(I)Landroid/view/MenuItem;

    move-result-object v6

    invoke-interface {v6, v4}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 331
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    .end local v2    # "i":I
    :cond_2
    move v0, v4

    .line 313
    goto :goto_0

    .line 314
    .restart local v0    # "cached":Z
    :cond_3
    const v6, 0x7f020163

    goto :goto_1

    .line 320
    :cond_4
    invoke-interface {p1, v8}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v7

    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->isAudioCacheEnable()Z

    move-result v6

    if-nez v6, :cond_5

    if-eqz v0, :cond_6

    :cond_5
    move v6, v5

    :goto_6
    invoke-interface {v7, v6}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 321
    invoke-interface {p1, v8}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v6

    invoke-interface {v6, v5}, Landroid/view/MenuItem;->setCheckable(Z)Landroid/view/MenuItem;

    goto :goto_2

    :cond_6
    move v6, v4

    .line 320
    goto :goto_6

    :cond_7
    move v6, v4

    .line 324
    goto :goto_3

    .line 326
    :cond_8
    invoke-interface {p1, v9}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v6

    invoke-interface {v6, v4}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto :goto_4

    .line 335
    .end local v0    # "cached":Z
    :cond_9
    return v5
.end method

.method public onProgress(Lcom/vkontakte/android/audio/player/TrackInfo;)V
    .locals 12
    .param p1, "trackInfo"    # Lcom/vkontakte/android/audio/player/TrackInfo;

    .prologue
    const-wide/16 v10, 0x3c

    .line 780
    iget-boolean v3, p0, Lcom/vkontakte/android/AudioPlayerActivity;->canUpdateProgress:Z

    if-eqz v3, :cond_0

    .line 781
    invoke-virtual {p1}, Lcom/vkontakte/android/audio/player/TrackInfo;->getPositionPercent()I

    move-result v2

    .line 782
    .local v2, "progress":I
    invoke-virtual {p1}, Lcom/vkontakte/android/audio/player/TrackInfo;->getPosition()I

    move-result v3

    div-int/lit16 v3, v3, 0x3e8

    int-to-long v0, v3

    .line 783
    .local v0, "ms":J
    iget-object v3, p0, Lcom/vkontakte/android/AudioPlayerActivity;->seekProgress:Landroid/widget/SeekBar;

    invoke-virtual {v3, v2}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 784
    iget-object v3, p0, Lcom/vkontakte/android/AudioPlayerActivity;->textTime:Landroid/widget/TextView;

    const-string/jumbo v4, "%d:%02d"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    div-long v8, v0, v10

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    rem-long v8, v0, v10

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 786
    .end local v0    # "ms":J
    .end local v2    # "progress":I
    :cond_0
    return-void
.end method

.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 0
    .param p1, "seekBar"    # Landroid/widget/SeekBar;
    .param p2, "progress"    # I
    .param p3, "fromUser"    # Z

    .prologue
    .line 665
    return-void
.end method

.method public onResume()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 287
    invoke-super {p0}, Lcom/vkontakte/android/VKActivity;->onResume()V

    .line 288
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/AudioPlayerActivity;->setVolumeControlStream(I)V

    .line 289
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getCurrentTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v0

    if-nez v0, :cond_0

    .line 290
    invoke-virtual {p0}, Lcom/vkontakte/android/AudioPlayerActivity;->finish()V

    .line 295
    :goto_0
    return-void

    .line 293
    :cond_0
    invoke-static {p0, v1}, Lcom/vkontakte/android/audio/AudioFacade;->addPlayerListener(Lcom/vkontakte/android/audio/player/PlayerListener;Z)V

    .line 294
    invoke-static {p0, v1}, Lcom/vkontakte/android/audio/AudioFacade;->addSavedTracksListener(Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;Z)V

    goto :goto_0
.end method

.method public onSavedTracksChanged()V
    .locals 0

    .prologue
    .line 802
    invoke-virtual {p0}, Lcom/vkontakte/android/AudioPlayerActivity;->invalidateOptionsMenu()V

    .line 803
    return-void
.end method

.method public onSavedTracksSaved()V
    .locals 0

    .prologue
    .line 807
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 1
    .param p1, "seekBar"    # Landroid/widget/SeekBar;

    .prologue
    .line 660
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/AudioPlayerActivity;->canUpdateProgress:Z

    .line 661
    return-void
.end method

.method public onStateChanged(Lcom/vkontakte/android/audio/player/PlayerState;Lcom/vkontakte/android/audio/player/TrackInfo;)V
    .locals 8
    .param p1, "state"    # Lcom/vkontakte/android/audio/player/PlayerState;
    .param p2, "trackInfo"    # Lcom/vkontakte/android/audio/player/TrackInfo;

    .prologue
    const/4 v7, 0x1

    const/4 v4, -0x1

    .line 748
    if-eqz p2, :cond_2

    .line 749
    iget-object v5, p0, Lcom/vkontakte/android/AudioPlayerActivity;->lastTrackInfo:Lcom/vkontakte/android/audio/player/TrackInfo;

    if-nez v5, :cond_3

    const/4 v3, 0x0

    .line 750
    .local v3, "lastTrack":Lcom/vkontakte/android/audio/player/PlayerTrack;
    :goto_0
    if-nez v3, :cond_4

    move v2, v4

    .line 751
    .local v2, "lastIndex":I
    :goto_1
    iget-object v5, p0, Lcom/vkontakte/android/AudioPlayerActivity;->coverPagerAdapter:Lcom/vkontakte/android/AudioPlayerActivity$CoverPagerAdapter;

    invoke-virtual {p2}, Lcom/vkontakte/android/audio/player/TrackInfo;->getTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/vkontakte/android/AudioPlayerActivity$CoverPagerAdapter;->indexOf(Lcom/vkontakte/android/audio/player/PlayerTrack;)I

    move-result v5

    add-int/lit8 v0, v5, 0x1

    .line 752
    .local v0, "index":I
    iget-object v5, p0, Lcom/vkontakte/android/AudioPlayerActivity;->coverPagerAdapter:Lcom/vkontakte/android/AudioPlayerActivity$CoverPagerAdapter;

    invoke-virtual {v5}, Lcom/vkontakte/android/AudioPlayerActivity$CoverPagerAdapter;->getCount()I

    move-result v5

    const/4 v6, 0x3

    if-lt v5, v6, :cond_0

    if-eq v2, v4, :cond_0

    .line 753
    iget-object v4, p0, Lcom/vkontakte/android/AudioPlayerActivity;->coverPagerAdapter:Lcom/vkontakte/android/AudioPlayerActivity$CoverPagerAdapter;

    invoke-virtual {v4}, Lcom/vkontakte/android/AudioPlayerActivity$CoverPagerAdapter;->getCount()I

    move-result v4

    add-int/lit8 v4, v4, -0x2

    if-ne v0, v4, :cond_5

    .line 754
    const/4 v1, 0x0

    .line 755
    .local v1, "indexAlternative":I
    sub-int v4, v2, v1

    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    move-result v4

    sub-int v5, v0, v2

    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    move-result v5

    if-ge v4, v5, :cond_0

    .line 756
    move v0, v1

    .line 765
    .end local v1    # "indexAlternative":I
    :cond_0
    :goto_2
    invoke-virtual {p0, p2}, Lcom/vkontakte/android/AudioPlayerActivity;->displayInfo(Lcom/vkontakte/android/audio/player/TrackInfo;)V

    .line 766
    iget-object v4, p0, Lcom/vkontakte/android/AudioPlayerActivity;->coverPagerAdapter:Lcom/vkontakte/android/AudioPlayerActivity$CoverPagerAdapter;

    invoke-virtual {v4}, Lcom/vkontakte/android/AudioPlayerActivity$CoverPagerAdapter;->notifyDataSetChanged()V

    .line 767
    iget-object v4, p0, Lcom/vkontakte/android/AudioPlayerActivity;->pagerCover:Landroid/support/v4/view/ViewPager;

    if-eqz v4, :cond_1

    .line 768
    iget-object v4, p0, Lcom/vkontakte/android/AudioPlayerActivity;->pagerCover:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v4, v0, v7}, Landroid/support/v4/view/ViewPager;->setCurrentItem(IZ)V

    .line 770
    :cond_1
    iget-object v5, p0, Lcom/vkontakte/android/AudioPlayerActivity;->buttonPlay:Landroid/widget/ImageView;

    invoke-virtual {p1}, Lcom/vkontakte/android/audio/player/PlayerState;->isPlayState()Z

    move-result v4

    if-eqz v4, :cond_6

    iget-object v4, p0, Lcom/vkontakte/android/AudioPlayerActivity;->pauseIcon:Landroid/graphics/drawable/Drawable;

    :goto_3
    invoke-virtual {v5, v4}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 772
    .end local v0    # "index":I
    .end local v2    # "lastIndex":I
    .end local v3    # "lastTrack":Lcom/vkontakte/android/audio/player/PlayerTrack;
    :cond_2
    return-void

    .line 749
    :cond_3
    iget-object v5, p0, Lcom/vkontakte/android/AudioPlayerActivity;->lastTrackInfo:Lcom/vkontakte/android/audio/player/TrackInfo;

    invoke-virtual {v5}, Lcom/vkontakte/android/audio/player/TrackInfo;->getTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v3

    goto :goto_0

    .line 750
    .restart local v3    # "lastTrack":Lcom/vkontakte/android/audio/player/PlayerTrack;
    :cond_4
    iget-object v5, p0, Lcom/vkontakte/android/AudioPlayerActivity;->coverPagerAdapter:Lcom/vkontakte/android/AudioPlayerActivity$CoverPagerAdapter;

    invoke-virtual {v5, v3}, Lcom/vkontakte/android/AudioPlayerActivity$CoverPagerAdapter;->indexOf(Lcom/vkontakte/android/audio/player/PlayerTrack;)I

    move-result v5

    add-int/lit8 v2, v5, 0x1

    goto :goto_1

    .line 758
    .restart local v0    # "index":I
    .restart local v2    # "lastIndex":I
    :cond_5
    if-ne v0, v7, :cond_0

    .line 759
    iget-object v4, p0, Lcom/vkontakte/android/AudioPlayerActivity;->coverPagerAdapter:Lcom/vkontakte/android/AudioPlayerActivity$CoverPagerAdapter;

    invoke-virtual {v4}, Lcom/vkontakte/android/AudioPlayerActivity$CoverPagerAdapter;->getCount()I

    move-result v4

    add-int/lit8 v1, v4, -0x1

    .line 760
    .restart local v1    # "indexAlternative":I
    sub-int v4, v2, v1

    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    move-result v4

    sub-int v5, v0, v2

    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    move-result v5

    if-ge v4, v5, :cond_0

    .line 761
    move v0, v1

    goto :goto_2

    .line 770
    .end local v1    # "indexAlternative":I
    :cond_6
    iget-object v4, p0, Lcom/vkontakte/android/AudioPlayerActivity;->playIcon:Landroid/graphics/drawable/Drawable;

    goto :goto_3
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 1
    .param p1, "seekBar"    # Landroid/widget/SeekBar;

    .prologue
    .line 654
    invoke-virtual {p1}, Landroid/widget/SeekBar;->getProgress()I

    move-result v0

    invoke-static {v0}, Lcom/vkontakte/android/audio/AudioFacade;->seekTo(I)V

    .line 655
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/AudioPlayerActivity;->canUpdateProgress:Z

    .line 656
    return-void
.end method

.method public onTrackListChanged(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/player/PlayerTrack;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 776
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/player/PlayerTrack;>;"
    return-void
.end method

.method public showLyrics()V
    .locals 7

    .prologue
    .line 590
    iget-object v3, p0, Lcom/vkontakte/android/AudioPlayerActivity;->pagerCover:Landroid/support/v4/view/ViewPager;

    .line 591
    .local v3, "pagerCover":Landroid/support/v4/view/ViewPager;
    if-eqz v3, :cond_0

    .line 592
    invoke-virtual {v3}, Landroid/support/v4/view/ViewPager;->getChildCount()I

    move-result v5

    add-int/lit8 v1, v5, -0x1

    .local v1, "i":I
    :goto_0
    if-ltz v1, :cond_0

    .line 593
    invoke-virtual {v3, v1}, Landroid/support/v4/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/AudioPlayerActivity$Holder;

    .line 594
    .local v0, "holder":Lcom/vkontakte/android/AudioPlayerActivity$Holder;
    iget-object v5, p0, Lcom/vkontakte/android/AudioPlayerActivity;->lastTrackInfo:Lcom/vkontakte/android/audio/player/TrackInfo;

    if-nez v5, :cond_1

    const/4 v2, 0x0

    .line 595
    .local v2, "lastTrack":Lcom/vkontakte/android/audio/player/PlayerTrack;
    :goto_1
    if-eqz v2, :cond_2

    if-eqz v0, :cond_2

    iget-object v5, v0, Lcom/vkontakte/android/AudioPlayerActivity$Holder;->lastTrack:Lcom/vkontakte/android/audio/player/PlayerTrack;

    invoke-virtual {v2, v5}, Lcom/vkontakte/android/audio/player/PlayerTrack;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 596
    iget-object v4, v0, Lcom/vkontakte/android/AudioPlayerActivity$Holder;->itemView:Landroid/view/View;

    check-cast v4, Landroid/widget/ScrollView;

    .line 597
    .local v4, "sv":Landroid/widget/ScrollView;
    invoke-virtual {v4}, Landroid/widget/ScrollView;->getScrollY()I

    move-result v5

    invoke-virtual {v4}, Landroid/widget/ScrollView;->getHeight()I

    move-result v6

    div-int/lit8 v6, v6, 0x2

    if-ge v5, v6, :cond_0

    .line 598
    const/4 v5, 0x0

    invoke-virtual {v4}, Landroid/widget/ScrollView;->getHeight()I

    move-result v6

    div-int/lit8 v6, v6, 0x2

    invoke-virtual {v4, v5, v6}, Landroid/widget/ScrollView;->smoothScrollTo(II)V

    .line 604
    .end local v0    # "holder":Lcom/vkontakte/android/AudioPlayerActivity$Holder;
    .end local v1    # "i":I
    .end local v2    # "lastTrack":Lcom/vkontakte/android/audio/player/PlayerTrack;
    .end local v4    # "sv":Landroid/widget/ScrollView;
    :cond_0
    return-void

    .line 594
    .restart local v0    # "holder":Lcom/vkontakte/android/AudioPlayerActivity$Holder;
    .restart local v1    # "i":I
    :cond_1
    iget-object v5, p0, Lcom/vkontakte/android/AudioPlayerActivity;->lastTrackInfo:Lcom/vkontakte/android/audio/player/TrackInfo;

    invoke-virtual {v5}, Lcom/vkontakte/android/audio/player/TrackInfo;->getTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v2

    goto :goto_1

    .line 592
    .restart local v2    # "lastTrack":Lcom/vkontakte/android/audio/player/PlayerTrack;
    :cond_2
    add-int/lit8 v1, v1, -0x1

    goto :goto_0
.end method
