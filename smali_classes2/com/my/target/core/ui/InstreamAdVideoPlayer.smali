.class public Lcom/my/target/core/ui/InstreamAdVideoPlayer;
.super Landroid/widget/RelativeLayout;
.source "InstreamAdVideoPlayer.java"

# interfaces
.implements Lcom/my/target/ads/instream/InstreamAdPlayer;


# instance fields
.field private adPlayerListener:Lcom/my/target/ads/instream/InstreamAdPlayer$AdPlayerListener;

.field private final afChangeListener:Landroid/media/AudioManager$OnAudioFocusChangeListener;

.field private pauseCalled:Z

.field private placeholderHeight:I

.field private placeholderWidth:I

.field private startCalled:Z

.field private final textureVideoListener:Lcom/my/target/core/ui/views/video/VideoTextureView$a;

.field private videoData:Lcom/my/target/nativeads/models/VideoData;

.field private final videoTextureView:Lcom/my/target/core/ui/views/video/VideoTextureView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .prologue
    .line 225
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/my/target/core/ui/InstreamAdVideoPlayer;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 226
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .prologue
    .line 230
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/my/target/core/ui/InstreamAdVideoPlayer;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 231
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 4

    .prologue
    .line 235
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 20
    new-instance v0, Lcom/my/target/core/ui/InstreamAdVideoPlayer$1;

    invoke-direct {v0, p0}, Lcom/my/target/core/ui/InstreamAdVideoPlayer$1;-><init>(Lcom/my/target/core/ui/InstreamAdVideoPlayer;)V

    iput-object v0, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->afChangeListener:Landroid/media/AudioManager$OnAudioFocusChangeListener;

    .line 50
    new-instance v0, Lcom/my/target/core/ui/InstreamAdVideoPlayer$2;

    invoke-direct {v0, p0}, Lcom/my/target/core/ui/InstreamAdVideoPlayer$2;-><init>(Lcom/my/target/core/ui/InstreamAdVideoPlayer;)V

    iput-object v0, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->textureVideoListener:Lcom/my/target/core/ui/views/video/VideoTextureView$a;

    .line 236
    new-instance v0, Lcom/my/target/core/ui/views/video/VideoTextureView;

    invoke-direct {v0, p1}, Lcom/my/target/core/ui/views/video/VideoTextureView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->videoTextureView:Lcom/my/target/core/ui/views/video/VideoTextureView;

    .line 237
    iget-object v0, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->videoTextureView:Lcom/my/target/core/ui/views/video/VideoTextureView;

    iget-object v1, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->textureVideoListener:Lcom/my/target/core/ui/views/video/VideoTextureView$a;

    invoke-virtual {v0, v1}, Lcom/my/target/core/ui/views/video/VideoTextureView;->setVideoListener(Lcom/my/target/core/ui/views/video/VideoTextureView$a;)V

    .line 238
    iget-object v0, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->videoTextureView:Lcom/my/target/core/ui/views/video/VideoTextureView;

    invoke-virtual {v0}, Lcom/my/target/core/ui/views/video/VideoTextureView;->k()V

    .line 239
    iget-object v0, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->videoTextureView:Lcom/my/target/core/ui/views/video/VideoTextureView;

    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v2, -0x1

    const/4 v3, -0x2

    invoke-direct {v1, v2, v3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v0, v1}, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 241
    return-void
.end method

.method private abandonAudioFocus(Landroid/content/Context;)V
    .locals 2

    .prologue
    .line 205
    const-string/jumbo v0, "audio"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    iget-object v1, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->afChangeListener:Landroid/media/AudioManager$OnAudioFocusChangeListener;

    .line 206
    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->abandonAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;)I

    .line 207
    return-void
.end method

.method static synthetic access$000(Lcom/my/target/core/ui/InstreamAdVideoPlayer;)Lcom/my/target/core/ui/views/video/VideoTextureView;
    .locals 1

    .prologue
    .line 16
    iget-object v0, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->videoTextureView:Lcom/my/target/core/ui/views/video/VideoTextureView;

    return-object v0
.end method

.method static synthetic access$100(Lcom/my/target/core/ui/InstreamAdVideoPlayer;)Z
    .locals 1

    .prologue
    .line 16
    iget-boolean v0, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->pauseCalled:Z

    return v0
.end method

.method static synthetic access$102(Lcom/my/target/core/ui/InstreamAdVideoPlayer;Z)Z
    .locals 0

    .prologue
    .line 16
    iput-boolean p1, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->pauseCalled:Z

    return p1
.end method

.method static synthetic access$200(Lcom/my/target/core/ui/InstreamAdVideoPlayer;)Lcom/my/target/ads/instream/InstreamAdPlayer$AdPlayerListener;
    .locals 1

    .prologue
    .line 16
    iget-object v0, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->adPlayerListener:Lcom/my/target/ads/instream/InstreamAdPlayer$AdPlayerListener;

    return-object v0
.end method

.method static synthetic access$300(Lcom/my/target/core/ui/InstreamAdVideoPlayer;)Z
    .locals 1

    .prologue
    .line 16
    iget-boolean v0, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->startCalled:Z

    return v0
.end method

.method static synthetic access$302(Lcom/my/target/core/ui/InstreamAdVideoPlayer;Z)Z
    .locals 0

    .prologue
    .line 16
    iput-boolean p1, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->startCalled:Z

    return p1
.end method

.method private requestAudioFocus(Landroid/content/Context;)V
    .locals 4

    .prologue
    .line 217
    const-string/jumbo v0, "audio"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    iget-object v1, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->afChangeListener:Landroid/media/AudioManager$OnAudioFocusChangeListener;

    const/4 v2, 0x3

    const/4 v3, 0x2

    .line 218
    invoke-virtual {v0, v1, v2, v3}, Landroid/media/AudioManager;->requestAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;II)I

    .line 221
    return-void
.end method

.method private setPlaceHolderDimension(II)V
    .locals 0

    .prologue
    .line 211
    iput p1, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->placeholderWidth:I

    .line 212
    iput p2, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->placeholderHeight:I

    .line 213
    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 1

    .prologue
    .line 194
    iget-object v0, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->videoTextureView:Lcom/my/target/core/ui/views/video/VideoTextureView;

    invoke-virtual {v0}, Lcom/my/target/core/ui/views/video/VideoTextureView;->a()V

    .line 195
    return-void
.end method

.method public getAdPlayerListener()Lcom/my/target/ads/instream/InstreamAdPlayer$AdPlayerListener;
    .locals 1

    .prologue
    .line 130
    iget-object v0, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->adPlayerListener:Lcom/my/target/ads/instream/InstreamAdPlayer$AdPlayerListener;

    return-object v0
.end method

.method public getAdVideoDuration()F
    .locals 1

    .prologue
    .line 136
    iget-object v0, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->videoTextureView:Lcom/my/target/core/ui/views/video/VideoTextureView;

    invoke-virtual {v0}, Lcom/my/target/core/ui/views/video/VideoTextureView;->d()F

    move-result v0

    return v0
.end method

.method public getAdVideoTimeElapsed()F
    .locals 1

    .prologue
    .line 142
    iget-object v0, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->videoTextureView:Lcom/my/target/core/ui/views/video/VideoTextureView;

    invoke-virtual {v0}, Lcom/my/target/core/ui/views/video/VideoTextureView;->c()F

    move-result v0

    return v0
.end method

.method public getView()Landroid/view/View;
    .locals 0

    .prologue
    .line 148
    return-object p0
.end method

.method protected onMeasure(II)V
    .locals 10

    .prologue
    const/4 v3, 0x0

    const/high16 v9, 0x40000000    # 2.0f

    const/high16 v1, -0x80000000

    .line 246
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v5

    .line 247
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v2

    .line 248
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    .line 249
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v4

    .line 251
    if-nez v5, :cond_d

    move v6, v1

    .line 254
    :goto_0
    if-nez v0, :cond_0

    move v0, v1

    .line 257
    :cond_0
    iget v5, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->placeholderHeight:I

    if-eqz v5, :cond_1

    iget v5, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->placeholderWidth:I

    if-nez v5, :cond_2

    .line 259
    :cond_1
    invoke-super {p0, p1, p2}, Landroid/widget/RelativeLayout;->onMeasure(II)V

    .line 336
    :goto_1
    return-void

    .line 263
    :cond_2
    iget v5, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->placeholderWidth:I

    int-to-float v5, v5

    iget v7, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->placeholderHeight:I

    int-to-float v7, v7

    div-float v7, v5, v7

    .line 265
    const/4 v5, 0x0

    .line 266
    if-eqz v4, :cond_3

    .line 267
    int-to-float v5, v2

    int-to-float v8, v4

    div-float/2addr v5, v8

    .line 272
    :cond_3
    if-ne v6, v9, :cond_4

    if-ne v0, v9, :cond_4

    move v0, v2

    move v3, v4

    .line 333
    :goto_2
    invoke-static {v0, v9}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    .line 334
    invoke-static {v3, v9}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    .line 335
    invoke-super {p0, v0, v1}, Landroid/widget/RelativeLayout;->onMeasure(II)V

    goto :goto_1

    .line 276
    :cond_4
    if-ne v6, v1, :cond_8

    if-ne v0, v1, :cond_8

    .line 278
    cmpg-float v0, v7, v5

    if-gez v0, :cond_6

    .line 280
    int-to-float v0, v4

    mul-float/2addr v0, v7

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    .line 282
    if-lez v2, :cond_5

    if-le v0, v2, :cond_5

    .line 284
    int-to-float v0, v2

    div-float/2addr v0, v7

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v3

    move v0, v2

    .line 285
    goto :goto_2

    :cond_5
    move v3, v4

    .line 291
    goto :goto_2

    .line 293
    :cond_6
    int-to-float v0, v2

    div-float/2addr v0, v7

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v3

    .line 295
    if-lez v4, :cond_7

    if-le v3, v4, :cond_7

    .line 297
    int-to-float v0, v4

    mul-float/2addr v0, v7

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    move v3, v4

    .line 298
    goto :goto_2

    :cond_7
    move v0, v2

    .line 304
    goto :goto_2

    .line 305
    :cond_8
    if-ne v6, v1, :cond_a

    if-ne v0, v9, :cond_a

    .line 307
    int-to-float v0, v4

    mul-float/2addr v0, v7

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    .line 309
    if-lez v2, :cond_9

    if-le v0, v2, :cond_9

    .line 311
    int-to-float v0, v2

    div-float/2addr v0, v7

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v3

    move v0, v2

    .line 312
    goto :goto_2

    :cond_9
    move v3, v4

    .line 318
    goto :goto_2

    :cond_a
    if-ne v6, v9, :cond_c

    if-ne v0, v1, :cond_c

    .line 320
    int-to-float v0, v2

    div-float/2addr v0, v7

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v3

    .line 322
    if-lez v4, :cond_b

    if-le v3, v4, :cond_b

    .line 324
    int-to-float v0, v4

    mul-float/2addr v0, v7

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    move v3, v4

    .line 325
    goto :goto_2

    :cond_b
    move v0, v2

    .line 329
    goto :goto_2

    :cond_c
    move v0, v3

    goto :goto_2

    :cond_d
    move v6, v5

    goto/16 :goto_0
.end method

.method public pauseAdVideo()V
    .locals 2

    .prologue
    .line 171
    invoke-virtual {p0}, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->abandonAudioFocus(Landroid/content/Context;)V

    .line 172
    iget-object v0, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->videoTextureView:Lcom/my/target/core/ui/views/video/VideoTextureView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/my/target/core/ui/views/video/VideoTextureView;->a(Z)V

    .line 173
    return-void
.end method

.method public playAdVideo(Landroid/net/Uri;II)V
    .locals 3

    .prologue
    .line 160
    invoke-direct {p0, p2, p3}, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->setPlaceHolderDimension(II)V

    .line 161
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->startCalled:Z

    .line 162
    invoke-virtual {p0}, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->requestLayout()V

    .line 163
    new-instance v0, Lcom/my/target/nativeads/models/VideoData;

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/my/target/nativeads/models/VideoData;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->videoData:Lcom/my/target/nativeads/models/VideoData;

    .line 164
    invoke-virtual {p0}, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->requestAudioFocus(Landroid/content/Context;)V

    .line 165
    iget-object v0, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->videoTextureView:Lcom/my/target/core/ui/views/video/VideoTextureView;

    iget-object v1, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->videoData:Lcom/my/target/nativeads/models/VideoData;

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/my/target/core/ui/views/video/VideoTextureView;->a(Lcom/my/target/nativeads/models/VideoData;Z)V

    .line 166
    return-void
.end method

.method public resumeAdVideo()V
    .locals 3

    .prologue
    .line 178
    invoke-virtual {p0}, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->requestAudioFocus(Landroid/content/Context;)V

    .line 179
    iget-object v0, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->videoTextureView:Lcom/my/target/core/ui/views/video/VideoTextureView;

    iget-object v1, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->videoData:Lcom/my/target/nativeads/models/VideoData;

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/my/target/core/ui/views/video/VideoTextureView;->a(Lcom/my/target/nativeads/models/VideoData;Z)V

    .line 180
    return-void
.end method

.method public setAdPlayerListener(Lcom/my/target/ads/instream/InstreamAdPlayer$AdPlayerListener;)V
    .locals 0

    .prologue
    .line 154
    iput-object p1, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->adPlayerListener:Lcom/my/target/ads/instream/InstreamAdPlayer$AdPlayerListener;

    .line 155
    return-void
.end method

.method public setVolume(F)V
    .locals 1

    .prologue
    .line 200
    iget-object v0, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->videoTextureView:Lcom/my/target/core/ui/views/video/VideoTextureView;

    invoke-virtual {v0, p1}, Lcom/my/target/core/ui/views/video/VideoTextureView;->setVolume(F)V

    .line 201
    return-void
.end method

.method public stopAdVideo()V
    .locals 1

    .prologue
    .line 185
    invoke-virtual {p0}, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->abandonAudioFocus(Landroid/content/Context;)V

    .line 186
    iget-object v0, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->adPlayerListener:Lcom/my/target/ads/instream/InstreamAdPlayer$AdPlayerListener;

    if-eqz v0, :cond_0

    .line 187
    iget-object v0, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->adPlayerListener:Lcom/my/target/ads/instream/InstreamAdPlayer$AdPlayerListener;

    invoke-interface {v0}, Lcom/my/target/ads/instream/InstreamAdPlayer$AdPlayerListener;->onAdVideoStopped()V

    .line 188
    :cond_0
    invoke-virtual {p0}, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->destroy()V

    .line 189
    return-void
.end method
