.class public final Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;
.super Landroid/widget/FrameLayout;
.source "SimpleExoPlayerView.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x10
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView$ComponentListener;
    }
.end annotation


# static fields
.field private static final SURFACE_TYPE_NONE:I = 0x0

.field private static final SURFACE_TYPE_SURFACE_VIEW:I = 0x1

.field private static final SURFACE_TYPE_TEXTURE_VIEW:I = 0x2


# instance fields
.field private final artworkView:Landroid/widget/ImageView;

.field private final componentListener:Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView$ComponentListener;

.field private final contentFrame:Lcom/google/android/exoplayer2/ui/AspectRatioFrameLayout;

.field private final controller:Lcom/google/android/exoplayer2/ui/PlaybackControlView;

.field private controllerShowTimeoutMs:I

.field private defaultArtwork:Landroid/graphics/Bitmap;

.field private final overlayFrameLayout:Landroid/widget/FrameLayout;

.field private player:Lcom/google/android/exoplayer2/SimpleExoPlayer;

.field private final shutterView:Landroid/view/View;

.field private final subtitleView:Lcom/google/android/exoplayer2/ui/SubtitleView;

.field private final surfaceView:Landroid/view/View;

.field private useArtwork:Z

.field private useController:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 193
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 194
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 197
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 198
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 21
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 201
    invoke-direct/range {p0 .. p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 203
    sget v12, Lcom/google/android/exoplayer2/R$layout;->exo_simple_player_view:I

    .line 204
    .local v12, "playerLayoutId":I
    const/4 v15, 0x1

    .line 205
    .local v15, "useArtwork":Z
    const/4 v9, 0x0

    .line 206
    .local v9, "defaultArtworkId":I
    const/16 v16, 0x1

    .line 207
    .local v16, "useController":Z
    const/4 v14, 0x1

    .line 208
    .local v14, "surfaceType":I
    const/4 v13, 0x0

    .line 209
    .local v13, "resizeMode":I
    const/16 v8, 0x1388

    .line 210
    .local v8, "controllerShowTimeoutMs":I
    if-eqz p2, :cond_0

    .line 211
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v17

    sget-object v18, Lcom/google/android/exoplayer2/R$styleable;->SimpleExoPlayerView:[I

    const/16 v19, 0x0

    const/16 v20, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, p2

    move-object/from16 v2, v18

    move/from16 v3, v19

    move/from16 v4, v20

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v5

    .line 214
    .local v5, "a":Landroid/content/res/TypedArray;
    :try_start_0
    sget v17, Lcom/google/android/exoplayer2/R$styleable;->SimpleExoPlayerView_player_layout_id:I

    move/from16 v0, v17

    invoke-virtual {v5, v0, v12}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v12

    .line 216
    sget v17, Lcom/google/android/exoplayer2/R$styleable;->SimpleExoPlayerView_use_artwork:I

    move/from16 v0, v17

    invoke-virtual {v5, v0, v15}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v15

    .line 217
    sget v17, Lcom/google/android/exoplayer2/R$styleable;->SimpleExoPlayerView_default_artwork:I

    move/from16 v0, v17

    invoke-virtual {v5, v0, v9}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v9

    .line 219
    sget v17, Lcom/google/android/exoplayer2/R$styleable;->SimpleExoPlayerView_use_controller:I

    move/from16 v0, v17

    move/from16 v1, v16

    invoke-virtual {v5, v0, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v16

    .line 220
    sget v17, Lcom/google/android/exoplayer2/R$styleable;->SimpleExoPlayerView_surface_type:I

    move/from16 v0, v17

    invoke-virtual {v5, v0, v14}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v14

    .line 221
    sget v17, Lcom/google/android/exoplayer2/R$styleable;->SimpleExoPlayerView_resize_mode:I

    move/from16 v0, v17

    invoke-virtual {v5, v0, v13}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v13

    .line 222
    sget v17, Lcom/google/android/exoplayer2/R$styleable;->SimpleExoPlayerView_show_timeout:I

    move/from16 v0, v17

    invoke-virtual {v5, v0, v8}, Landroid/content/res/TypedArray;->getInt(II)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v8

    .line 225
    invoke-virtual {v5}, Landroid/content/res/TypedArray;->recycle()V

    .line 229
    .end local v5    # "a":Landroid/content/res/TypedArray;
    :cond_0
    invoke-static/range {p1 .. p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-virtual {v0, v12, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 230
    new-instance v17, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView$ComponentListener;

    const/16 v18, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    move-object/from16 v2, v18

    invoke-direct {v0, v1, v2}, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView$ComponentListener;-><init>(Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView$1;)V

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->componentListener:Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView$ComponentListener;

    .line 231
    const/high16 v17, 0x40000

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->setDescendantFocusability(I)V

    .line 234
    sget v17, Lcom/google/android/exoplayer2/R$id;->exo_content_frame:I

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->findViewById(I)Landroid/view/View;

    move-result-object v17

    check-cast v17, Lcom/google/android/exoplayer2/ui/AspectRatioFrameLayout;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->contentFrame:Lcom/google/android/exoplayer2/ui/AspectRatioFrameLayout;

    .line 235
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->contentFrame:Lcom/google/android/exoplayer2/ui/AspectRatioFrameLayout;

    move-object/from16 v17, v0

    if-eqz v17, :cond_1

    .line 236
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->contentFrame:Lcom/google/android/exoplayer2/ui/AspectRatioFrameLayout;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-static {v0, v13}, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->setResizeModeRaw(Lcom/google/android/exoplayer2/ui/AspectRatioFrameLayout;I)V

    .line 240
    :cond_1
    sget v17, Lcom/google/android/exoplayer2/R$id;->exo_shutter:I

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->findViewById(I)Landroid/view/View;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->shutterView:Landroid/view/View;

    .line 243
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->contentFrame:Lcom/google/android/exoplayer2/ui/AspectRatioFrameLayout;

    move-object/from16 v17, v0

    if-eqz v17, :cond_5

    if-eqz v14, :cond_5

    .line 244
    new-instance v10, Landroid/view/ViewGroup$LayoutParams;

    const/16 v17, -0x1

    const/16 v18, -0x1

    move/from16 v0, v17

    move/from16 v1, v18

    invoke-direct {v10, v0, v1}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 246
    .local v10, "params":Landroid/view/ViewGroup$LayoutParams;
    const/16 v17, 0x2

    move/from16 v0, v17

    if-ne v14, v0, :cond_4

    new-instance v17, Landroid/view/TextureView;

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Landroid/view/TextureView;-><init>(Landroid/content/Context;)V

    :goto_0
    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->surfaceView:Landroid/view/View;

    .line 248
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->surfaceView:Landroid/view/View;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v10}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 249
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->contentFrame:Lcom/google/android/exoplayer2/ui/AspectRatioFrameLayout;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->surfaceView:Landroid/view/View;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    invoke-virtual/range {v17 .. v19}, Lcom/google/android/exoplayer2/ui/AspectRatioFrameLayout;->addView(Landroid/view/View;I)V

    .line 255
    .end local v10    # "params":Landroid/view/ViewGroup$LayoutParams;
    :goto_1
    sget v17, Lcom/google/android/exoplayer2/R$id;->exo_overlay:I

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->findViewById(I)Landroid/view/View;

    move-result-object v17

    check-cast v17, Landroid/widget/FrameLayout;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->overlayFrameLayout:Landroid/widget/FrameLayout;

    .line 258
    sget v17, Lcom/google/android/exoplayer2/R$id;->exo_artwork:I

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->findViewById(I)Landroid/view/View;

    move-result-object v17

    check-cast v17, Landroid/widget/ImageView;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->artworkView:Landroid/widget/ImageView;

    .line 259
    if-eqz v15, :cond_6

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->artworkView:Landroid/widget/ImageView;

    move-object/from16 v17, v0

    if-eqz v17, :cond_6

    const/16 v17, 0x1

    :goto_2
    move/from16 v0, v17

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->useArtwork:Z

    .line 260
    if-eqz v9, :cond_2

    .line 261
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-static {v0, v9}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->defaultArtwork:Landroid/graphics/Bitmap;

    .line 265
    :cond_2
    sget v17, Lcom/google/android/exoplayer2/R$id;->exo_subtitles:I

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->findViewById(I)Landroid/view/View;

    move-result-object v17

    check-cast v17, Lcom/google/android/exoplayer2/ui/SubtitleView;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->subtitleView:Lcom/google/android/exoplayer2/ui/SubtitleView;

    .line 266
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->subtitleView:Lcom/google/android/exoplayer2/ui/SubtitleView;

    move-object/from16 v17, v0

    if-eqz v17, :cond_3

    .line 267
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->subtitleView:Lcom/google/android/exoplayer2/ui/SubtitleView;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/google/android/exoplayer2/ui/SubtitleView;->setUserDefaultStyle()V

    .line 268
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->subtitleView:Lcom/google/android/exoplayer2/ui/SubtitleView;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/google/android/exoplayer2/ui/SubtitleView;->setUserDefaultTextSize()V

    .line 272
    :cond_3
    sget v17, Lcom/google/android/exoplayer2/R$id;->exo_controller_placeholder:I

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->findViewById(I)Landroid/view/View;

    move-result-object v7

    .line 273
    .local v7, "controllerPlaceholder":Landroid/view/View;
    if-eqz v7, :cond_7

    .line 276
    new-instance v17, Lcom/google/android/exoplayer2/ui/PlaybackControlView;

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-direct {v0, v1, v2}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->controller:Lcom/google/android/exoplayer2/ui/PlaybackControlView;

    .line 277
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->controller:Lcom/google/android/exoplayer2/ui/PlaybackControlView;

    move-object/from16 v17, v0

    invoke-virtual {v7}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 278
    invoke-virtual {v7}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v11

    check-cast v11, Landroid/view/ViewGroup;

    .line 279
    .local v11, "parent":Landroid/view/ViewGroup;
    invoke-virtual {v11, v7}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v6

    .line 280
    .local v6, "controllerIndex":I
    invoke-virtual {v11, v7}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 281
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->controller:Lcom/google/android/exoplayer2/ui/PlaybackControlView;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v11, v0, v6}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 285
    .end local v6    # "controllerIndex":I
    .end local v11    # "parent":Landroid/view/ViewGroup;
    :goto_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->controller:Lcom/google/android/exoplayer2/ui/PlaybackControlView;

    move-object/from16 v17, v0

    if-eqz v17, :cond_8

    .end local v8    # "controllerShowTimeoutMs":I
    :goto_4
    move-object/from16 v0, p0

    iput v8, v0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->controllerShowTimeoutMs:I

    .line 286
    if-eqz v16, :cond_9

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->controller:Lcom/google/android/exoplayer2/ui/PlaybackControlView;

    move-object/from16 v17, v0

    if-eqz v17, :cond_9

    const/16 v17, 0x1

    :goto_5
    move/from16 v0, v17

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->useController:Z

    .line 287
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->hideController()V

    .line 288
    return-void

    .line 225
    .end local v7    # "controllerPlaceholder":Landroid/view/View;
    .restart local v5    # "a":Landroid/content/res/TypedArray;
    .restart local v8    # "controllerShowTimeoutMs":I
    :catchall_0
    move-exception v17

    invoke-virtual {v5}, Landroid/content/res/TypedArray;->recycle()V

    throw v17

    .line 246
    .end local v5    # "a":Landroid/content/res/TypedArray;
    .restart local v10    # "params":Landroid/view/ViewGroup$LayoutParams;
    :cond_4
    new-instance v17, Landroid/view/SurfaceView;

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    goto/16 :goto_0

    .line 251
    .end local v10    # "params":Landroid/view/ViewGroup$LayoutParams;
    :cond_5
    const/16 v17, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->surfaceView:Landroid/view/View;

    goto/16 :goto_1

    .line 259
    :cond_6
    const/16 v17, 0x0

    goto/16 :goto_2

    .line 283
    .restart local v7    # "controllerPlaceholder":Landroid/view/View;
    :cond_7
    const/16 v17, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->controller:Lcom/google/android/exoplayer2/ui/PlaybackControlView;

    goto :goto_3

    .line 285
    :cond_8
    const/4 v8, 0x0

    goto :goto_4

    .line 286
    .end local v8    # "controllerShowTimeoutMs":I
    :cond_9
    const/16 v17, 0x0

    goto :goto_5
.end method

.method static synthetic access$100(Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;)Lcom/google/android/exoplayer2/ui/SubtitleView;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;

    .prologue
    .line 171
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->subtitleView:Lcom/google/android/exoplayer2/ui/SubtitleView;

    return-object v0
.end method

.method static synthetic access$200(Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;)Lcom/google/android/exoplayer2/ui/AspectRatioFrameLayout;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;

    .prologue
    .line 171
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->contentFrame:Lcom/google/android/exoplayer2/ui/AspectRatioFrameLayout;

    return-object v0
.end method

.method static synthetic access$300(Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;

    .prologue
    .line 171
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->shutterView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$400(Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;

    .prologue
    .line 171
    invoke-direct {p0}, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->updateForCurrentTrackSelections()V

    return-void
.end method

.method static synthetic access$500(Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;
    .param p1, "x1"    # Z

    .prologue
    .line 171
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->maybeShowController(Z)V

    return-void
.end method

.method private hideArtwork()V
    .locals 2

    .prologue
    .line 643
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->artworkView:Landroid/widget/ImageView;

    if-eqz v0, :cond_0

    .line 644
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->artworkView:Landroid/widget/ImageView;

    const v1, 0x106000d

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 645
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->artworkView:Landroid/widget/ImageView;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 647
    :cond_0
    return-void
.end method

.method private maybeShowController(Z)V
    .locals 6
    .param p1, "isForced"    # Z

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 563
    iget-boolean v5, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->useController:Z

    if-eqz v5, :cond_0

    iget-object v5, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->player:Lcom/google/android/exoplayer2/SimpleExoPlayer;

    if-nez v5, :cond_1

    .line 574
    :cond_0
    :goto_0
    return-void

    .line 566
    :cond_1
    iget-object v5, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->player:Lcom/google/android/exoplayer2/SimpleExoPlayer;

    invoke-virtual {v5}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->getPlaybackState()I

    move-result v0

    .line 567
    .local v0, "playbackState":I
    if-eq v0, v4, :cond_2

    const/4 v5, 0x4

    if-eq v0, v5, :cond_2

    iget-object v5, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->player:Lcom/google/android/exoplayer2/SimpleExoPlayer;

    .line 568
    invoke-virtual {v5}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->getPlayWhenReady()Z

    move-result v5

    if-nez v5, :cond_4

    :cond_2
    move v1, v4

    .line 569
    .local v1, "showIndefinitely":Z
    :goto_1
    iget-object v5, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->controller:Lcom/google/android/exoplayer2/ui/PlaybackControlView;

    invoke-virtual {v5}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->isVisible()Z

    move-result v5

    if-eqz v5, :cond_5

    iget-object v5, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->controller:Lcom/google/android/exoplayer2/ui/PlaybackControlView;

    invoke-virtual {v5}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->getShowTimeoutMs()I

    move-result v5

    if-gtz v5, :cond_5

    move v2, v4

    .line 570
    .local v2, "wasShowingIndefinitely":Z
    :goto_2
    iget-object v4, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->controller:Lcom/google/android/exoplayer2/ui/PlaybackControlView;

    if-eqz v1, :cond_6

    :goto_3
    invoke-virtual {v4, v3}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->setShowTimeoutMs(I)V

    .line 571
    if-nez p1, :cond_3

    if-nez v1, :cond_3

    if-eqz v2, :cond_0

    .line 572
    :cond_3
    iget-object v3, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->controller:Lcom/google/android/exoplayer2/ui/PlaybackControlView;

    invoke-virtual {v3}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->show()V

    goto :goto_0

    .end local v1    # "showIndefinitely":Z
    .end local v2    # "wasShowingIndefinitely":Z
    :cond_4
    move v1, v3

    .line 568
    goto :goto_1

    .restart local v1    # "showIndefinitely":Z
    :cond_5
    move v2, v3

    .line 569
    goto :goto_2

    .line 570
    .restart local v2    # "wasShowingIndefinitely":Z
    :cond_6
    iget v3, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->controllerShowTimeoutMs:I

    goto :goto_3
.end method

.method private setArtworkFromBitmap(Landroid/graphics/Bitmap;)Z
    .locals 6
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    const/4 v2, 0x0

    .line 627
    if-eqz p1, :cond_1

    .line 628
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    .line 629
    .local v1, "bitmapWidth":I
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    .line 630
    .local v0, "bitmapHeight":I
    if-lez v1, :cond_1

    if-lez v0, :cond_1

    .line 631
    iget-object v3, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->contentFrame:Lcom/google/android/exoplayer2/ui/AspectRatioFrameLayout;

    if-eqz v3, :cond_0

    .line 632
    iget-object v3, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->contentFrame:Lcom/google/android/exoplayer2/ui/AspectRatioFrameLayout;

    int-to-float v4, v1

    int-to-float v5, v0

    div-float/2addr v4, v5

    invoke-virtual {v3, v4}, Lcom/google/android/exoplayer2/ui/AspectRatioFrameLayout;->setAspectRatio(F)V

    .line 634
    :cond_0
    iget-object v3, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->artworkView:Landroid/widget/ImageView;

    invoke-virtual {v3, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 635
    iget-object v3, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->artworkView:Landroid/widget/ImageView;

    invoke-virtual {v3, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 636
    const/4 v2, 0x1

    .line 639
    .end local v0    # "bitmapHeight":I
    .end local v1    # "bitmapWidth":I
    :cond_1
    return v2
.end method

.method private setArtworkFromMetadata(Lcom/google/android/exoplayer2/metadata/Metadata;)Z
    .locals 6
    .param p1, "metadata"    # Lcom/google/android/exoplayer2/metadata/Metadata;

    .prologue
    const/4 v4, 0x0

    .line 615
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/metadata/Metadata;->length()I

    move-result v5

    if-ge v2, v5, :cond_0

    .line 616
    invoke-virtual {p1, v2}, Lcom/google/android/exoplayer2/metadata/Metadata;->get(I)Lcom/google/android/exoplayer2/metadata/Metadata$Entry;

    move-result-object v3

    .line 617
    .local v3, "metadataEntry":Lcom/google/android/exoplayer2/metadata/Metadata$Entry;
    instance-of v5, v3, Lcom/google/android/exoplayer2/metadata/id3/ApicFrame;

    if-eqz v5, :cond_1

    .line 618
    check-cast v3, Lcom/google/android/exoplayer2/metadata/id3/ApicFrame;

    .end local v3    # "metadataEntry":Lcom/google/android/exoplayer2/metadata/Metadata$Entry;
    iget-object v1, v3, Lcom/google/android/exoplayer2/metadata/id3/ApicFrame;->pictureData:[B

    .line 619
    .local v1, "bitmapData":[B
    array-length v5, v1

    invoke-static {v1, v4, v5}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 620
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    invoke-direct {p0, v0}, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->setArtworkFromBitmap(Landroid/graphics/Bitmap;)Z

    move-result v4

    .line 623
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v1    # "bitmapData":[B
    :cond_0
    return v4

    .line 615
    .restart local v3    # "metadataEntry":Lcom/google/android/exoplayer2/metadata/Metadata$Entry;
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method private static setResizeModeRaw(Lcom/google/android/exoplayer2/ui/AspectRatioFrameLayout;I)V
    .locals 0
    .param p0, "aspectRatioFrame"    # Lcom/google/android/exoplayer2/ui/AspectRatioFrameLayout;
    .param p1, "resizeMode"    # I

    .prologue
    .line 651
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/ui/AspectRatioFrameLayout;->setResizeMode(I)V

    .line 652
    return-void
.end method

.method private updateForCurrentTrackSelections()V
    .locals 7

    .prologue
    .line 577
    iget-object v5, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->player:Lcom/google/android/exoplayer2/SimpleExoPlayer;

    if-nez v5, :cond_1

    .line 612
    :cond_0
    :goto_0
    return-void

    .line 580
    :cond_1
    iget-object v5, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->player:Lcom/google/android/exoplayer2/SimpleExoPlayer;

    invoke-virtual {v5}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->getCurrentTrackSelections()Lcom/google/android/exoplayer2/trackselection/TrackSelectionArray;

    move-result-object v4

    .line 581
    .local v4, "selections":Lcom/google/android/exoplayer2/trackselection/TrackSelectionArray;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget v5, v4, Lcom/google/android/exoplayer2/trackselection/TrackSelectionArray;->length:I

    if-ge v0, v5, :cond_3

    .line 582
    iget-object v5, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->player:Lcom/google/android/exoplayer2/SimpleExoPlayer;

    invoke-virtual {v5, v0}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->getRendererType(I)I

    move-result v5

    const/4 v6, 0x2

    if-ne v5, v6, :cond_2

    invoke-virtual {v4, v0}, Lcom/google/android/exoplayer2/trackselection/TrackSelectionArray;->get(I)Lcom/google/android/exoplayer2/trackselection/TrackSelection;

    move-result-object v5

    if-eqz v5, :cond_2

    .line 585
    invoke-direct {p0}, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->hideArtwork()V

    goto :goto_0

    .line 581
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 590
    :cond_3
    iget-object v5, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->shutterView:Landroid/view/View;

    if-eqz v5, :cond_4

    .line 591
    iget-object v5, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->shutterView:Landroid/view/View;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Landroid/view/View;->setVisibility(I)V

    .line 594
    :cond_4
    iget-boolean v5, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->useArtwork:Z

    if-eqz v5, :cond_8

    .line 595
    const/4 v0, 0x0

    :goto_2
    iget v5, v4, Lcom/google/android/exoplayer2/trackselection/TrackSelectionArray;->length:I

    if-ge v0, v5, :cond_7

    .line 596
    invoke-virtual {v4, v0}, Lcom/google/android/exoplayer2/trackselection/TrackSelectionArray;->get(I)Lcom/google/android/exoplayer2/trackselection/TrackSelection;

    move-result-object v3

    .line 597
    .local v3, "selection":Lcom/google/android/exoplayer2/trackselection/TrackSelection;
    if-eqz v3, :cond_6

    .line 598
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_3
    invoke-interface {v3}, Lcom/google/android/exoplayer2/trackselection/TrackSelection;->length()I

    move-result v5

    if-ge v1, v5, :cond_6

    .line 599
    invoke-interface {v3, v1}, Lcom/google/android/exoplayer2/trackselection/TrackSelection;->getFormat(I)Lcom/google/android/exoplayer2/Format;

    move-result-object v5

    iget-object v2, v5, Lcom/google/android/exoplayer2/Format;->metadata:Lcom/google/android/exoplayer2/metadata/Metadata;

    .line 600
    .local v2, "metadata":Lcom/google/android/exoplayer2/metadata/Metadata;
    if-eqz v2, :cond_5

    invoke-direct {p0, v2}, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->setArtworkFromMetadata(Lcom/google/android/exoplayer2/metadata/Metadata;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 598
    :cond_5
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 595
    .end local v1    # "j":I
    .end local v2    # "metadata":Lcom/google/android/exoplayer2/metadata/Metadata;
    :cond_6
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 606
    .end local v3    # "selection":Lcom/google/android/exoplayer2/trackselection/TrackSelection;
    :cond_7
    iget-object v5, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->defaultArtwork:Landroid/graphics/Bitmap;

    invoke-direct {p0, v5}, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->setArtworkFromBitmap(Landroid/graphics/Bitmap;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 611
    :cond_8
    invoke-direct {p0}, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->hideArtwork()V

    goto :goto_0
.end method


# virtual methods
.method public dispatchMediaKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 423
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->useController:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->controller:Lcom/google/android/exoplayer2/ui/PlaybackControlView;

    invoke-virtual {v0, p1}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->dispatchMediaKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getControllerShowTimeoutMs()I
    .locals 1

    .prologue
    .line 453
    iget v0, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->controllerShowTimeoutMs:I

    return v0
.end method

.method public getDefaultArtwork()Landroid/graphics/Bitmap;
    .locals 1

    .prologue
    .line 372
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->defaultArtwork:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public getOverlayFrameLayout()Landroid/widget/FrameLayout;
    .locals 1

    .prologue
    .line 527
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->overlayFrameLayout:Landroid/widget/FrameLayout;

    return-object v0
.end method

.method public getPlayer()Lcom/google/android/exoplayer2/SimpleExoPlayer;
    .locals 1

    .prologue
    .line 294
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->player:Lcom/google/android/exoplayer2/SimpleExoPlayer;

    return-object v0
.end method

.method public getSubtitleView()Lcom/google/android/exoplayer2/ui/SubtitleView;
    .locals 1

    .prologue
    .line 537
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->subtitleView:Lcom/google/android/exoplayer2/ui/SubtitleView;

    return-object v0
.end method

.method public getUseArtwork()Z
    .locals 1

    .prologue
    .line 352
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->useArtwork:Z

    return v0
.end method

.method public getUseController()Z
    .locals 1

    .prologue
    .line 392
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->useController:Z

    return v0
.end method

.method public getVideoSurfaceView()Landroid/view/View;
    .locals 1

    .prologue
    .line 516
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->surfaceView:Landroid/view/View;

    return-object v0
.end method

.method public hideController()V
    .locals 1

    .prologue
    .line 439
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->controller:Lcom/google/android/exoplayer2/ui/PlaybackControlView;

    if-eqz v0, :cond_0

    .line 440
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->controller:Lcom/google/android/exoplayer2/ui/PlaybackControlView;

    invoke-virtual {v0}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->hide()V

    .line 442
    :cond_0
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v0, 0x1

    .line 542
    iget-boolean v1, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->useController:Z

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->player:Lcom/google/android/exoplayer2/SimpleExoPlayer;

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v1

    if-eqz v1, :cond_1

    .line 543
    :cond_0
    const/4 v0, 0x0

    .line 550
    :goto_0
    return v0

    .line 545
    :cond_1
    iget-object v1, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->controller:Lcom/google/android/exoplayer2/ui/PlaybackControlView;

    invoke-virtual {v1}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->isVisible()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 546
    iget-object v1, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->controller:Lcom/google/android/exoplayer2/ui/PlaybackControlView;

    invoke-virtual {v1}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->hide()V

    goto :goto_0

    .line 548
    :cond_2
    invoke-direct {p0, v0}, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->maybeShowController(Z)V

    goto :goto_0
.end method

.method public onTrackballEvent(Landroid/view/MotionEvent;)Z
    .locals 2
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v0, 0x1

    .line 555
    iget-boolean v1, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->useController:Z

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->player:Lcom/google/android/exoplayer2/SimpleExoPlayer;

    if-nez v1, :cond_1

    .line 556
    :cond_0
    const/4 v0, 0x0

    .line 559
    :goto_0
    return v0

    .line 558
    :cond_1
    invoke-direct {p0, v0}, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->maybeShowController(Z)V

    goto :goto_0
.end method

.method public setControllerShowTimeoutMs(I)V
    .locals 1
    .param p1, "controllerShowTimeoutMs"    # I

    .prologue
    .line 464
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->controller:Lcom/google/android/exoplayer2/ui/PlaybackControlView;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Lcom/google/android/exoplayer2/util/Assertions;->checkState(Z)V

    .line 465
    iput p1, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->controllerShowTimeoutMs:I

    .line 466
    return-void

    .line 464
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setControllerVisibilityListener(Lcom/google/android/exoplayer2/ui/PlaybackControlView$VisibilityListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/google/android/exoplayer2/ui/PlaybackControlView$VisibilityListener;

    .prologue
    .line 474
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->controller:Lcom/google/android/exoplayer2/ui/PlaybackControlView;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Lcom/google/android/exoplayer2/util/Assertions;->checkState(Z)V

    .line 475
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->controller:Lcom/google/android/exoplayer2/ui/PlaybackControlView;

    invoke-virtual {v0, p1}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->setVisibilityListener(Lcom/google/android/exoplayer2/ui/PlaybackControlView$VisibilityListener;)V

    .line 476
    return-void

    .line 474
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setDefaultArtwork(Landroid/graphics/Bitmap;)V
    .locals 1
    .param p1, "defaultArtwork"    # Landroid/graphics/Bitmap;

    .prologue
    .line 382
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->defaultArtwork:Landroid/graphics/Bitmap;

    if-eq v0, p1, :cond_0

    .line 383
    iput-object p1, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->defaultArtwork:Landroid/graphics/Bitmap;

    .line 384
    invoke-direct {p0}, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->updateForCurrentTrackSelections()V

    .line 386
    :cond_0
    return-void
.end method

.method public setFastForwardIncrementMs(I)V
    .locals 1
    .param p1, "fastForwardMs"    # I

    .prologue
    .line 505
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->controller:Lcom/google/android/exoplayer2/ui/PlaybackControlView;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Lcom/google/android/exoplayer2/util/Assertions;->checkState(Z)V

    .line 506
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->controller:Lcom/google/android/exoplayer2/ui/PlaybackControlView;

    invoke-virtual {v0, p1}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->setFastForwardIncrementMs(I)V

    .line 507
    return-void

    .line 505
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setPlayer(Lcom/google/android/exoplayer2/SimpleExoPlayer;)V
    .locals 4
    .param p1, "player"    # Lcom/google/android/exoplayer2/SimpleExoPlayer;

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 305
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->player:Lcom/google/android/exoplayer2/SimpleExoPlayer;

    if-ne v0, p1, :cond_0

    .line 336
    :goto_0
    return-void

    .line 308
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->player:Lcom/google/android/exoplayer2/SimpleExoPlayer;

    if-eqz v0, :cond_1

    .line 309
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->player:Lcom/google/android/exoplayer2/SimpleExoPlayer;

    invoke-virtual {v0, v2}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->setTextOutput(Lcom/google/android/exoplayer2/text/TextRenderer$Output;)V

    .line 310
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->player:Lcom/google/android/exoplayer2/SimpleExoPlayer;

    invoke-virtual {v0, v2}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->setVideoListener(Lcom/google/android/exoplayer2/SimpleExoPlayer$VideoListener;)V

    .line 311
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->player:Lcom/google/android/exoplayer2/SimpleExoPlayer;

    iget-object v1, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->componentListener:Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView$ComponentListener;

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->removeListener(Lcom/google/android/exoplayer2/ExoPlayer$EventListener;)V

    .line 312
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->player:Lcom/google/android/exoplayer2/SimpleExoPlayer;

    invoke-virtual {v0, v2}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->setVideoSurface(Landroid/view/Surface;)V

    .line 314
    :cond_1
    iput-object p1, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->player:Lcom/google/android/exoplayer2/SimpleExoPlayer;

    .line 315
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->useController:Z

    if-eqz v0, :cond_2

    .line 316
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->controller:Lcom/google/android/exoplayer2/ui/PlaybackControlView;

    invoke-virtual {v0, p1}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->setPlayer(Lcom/google/android/exoplayer2/ExoPlayer;)V

    .line 318
    :cond_2
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->shutterView:Landroid/view/View;

    if-eqz v0, :cond_3

    .line 319
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->shutterView:Landroid/view/View;

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 321
    :cond_3
    if-eqz p1, :cond_6

    .line 322
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->surfaceView:Landroid/view/View;

    instance-of v0, v0, Landroid/view/TextureView;

    if-eqz v0, :cond_5

    .line 323
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->surfaceView:Landroid/view/View;

    check-cast v0, Landroid/view/TextureView;

    invoke-virtual {p1, v0}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->setVideoTextureView(Landroid/view/TextureView;)V

    .line 327
    :cond_4
    :goto_1
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->componentListener:Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView$ComponentListener;

    invoke-virtual {p1, v0}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->setVideoListener(Lcom/google/android/exoplayer2/SimpleExoPlayer$VideoListener;)V

    .line 328
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->componentListener:Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView$ComponentListener;

    invoke-virtual {p1, v0}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->addListener(Lcom/google/android/exoplayer2/ExoPlayer$EventListener;)V

    .line 329
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->componentListener:Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView$ComponentListener;

    invoke-virtual {p1, v0}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->setTextOutput(Lcom/google/android/exoplayer2/text/TextRenderer$Output;)V

    .line 330
    invoke-direct {p0, v3}, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->maybeShowController(Z)V

    .line 331
    invoke-direct {p0}, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->updateForCurrentTrackSelections()V

    goto :goto_0

    .line 324
    :cond_5
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->surfaceView:Landroid/view/View;

    instance-of v0, v0, Landroid/view/SurfaceView;

    if-eqz v0, :cond_4

    .line 325
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->surfaceView:Landroid/view/View;

    check-cast v0, Landroid/view/SurfaceView;

    invoke-virtual {p1, v0}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->setVideoSurfaceView(Landroid/view/SurfaceView;)V

    goto :goto_1

    .line 333
    :cond_6
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->hideController()V

    .line 334
    invoke-direct {p0}, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->hideArtwork()V

    goto :goto_0
.end method

.method public setResizeMode(I)V
    .locals 1
    .param p1, "resizeMode"    # I

    .prologue
    .line 344
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->contentFrame:Lcom/google/android/exoplayer2/ui/AspectRatioFrameLayout;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Lcom/google/android/exoplayer2/util/Assertions;->checkState(Z)V

    .line 345
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->contentFrame:Lcom/google/android/exoplayer2/ui/AspectRatioFrameLayout;

    invoke-virtual {v0, p1}, Lcom/google/android/exoplayer2/ui/AspectRatioFrameLayout;->setResizeMode(I)V

    .line 346
    return-void

    .line 344
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setRewindIncrementMs(I)V
    .locals 1
    .param p1, "rewindMs"    # I

    .prologue
    .line 495
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->controller:Lcom/google/android/exoplayer2/ui/PlaybackControlView;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Lcom/google/android/exoplayer2/util/Assertions;->checkState(Z)V

    .line 496
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->controller:Lcom/google/android/exoplayer2/ui/PlaybackControlView;

    invoke-virtual {v0, p1}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->setRewindIncrementMs(I)V

    .line 497
    return-void

    .line 495
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setSeekDispatcher(Lcom/google/android/exoplayer2/ui/PlaybackControlView$SeekDispatcher;)V
    .locals 1
    .param p1, "seekDispatcher"    # Lcom/google/android/exoplayer2/ui/PlaybackControlView$SeekDispatcher;

    .prologue
    .line 485
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->controller:Lcom/google/android/exoplayer2/ui/PlaybackControlView;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Lcom/google/android/exoplayer2/util/Assertions;->checkState(Z)V

    .line 486
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->controller:Lcom/google/android/exoplayer2/ui/PlaybackControlView;

    invoke-virtual {v0, p1}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->setSeekDispatcher(Lcom/google/android/exoplayer2/ui/PlaybackControlView$SeekDispatcher;)V

    .line 487
    return-void

    .line 485
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setUseArtwork(Z)V
    .locals 1
    .param p1, "useArtwork"    # Z

    .prologue
    .line 361
    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->artworkView:Landroid/widget/ImageView;

    if-eqz v0, :cond_2

    :cond_0
    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Lcom/google/android/exoplayer2/util/Assertions;->checkState(Z)V

    .line 362
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->useArtwork:Z

    if-eq v0, p1, :cond_1

    .line 363
    iput-boolean p1, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->useArtwork:Z

    .line 364
    invoke-direct {p0}, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->updateForCurrentTrackSelections()V

    .line 366
    :cond_1
    return-void

    .line 361
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setUseController(Z)V
    .locals 2
    .param p1, "useController"    # Z

    .prologue
    .line 402
    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->controller:Lcom/google/android/exoplayer2/ui/PlaybackControlView;

    if-eqz v0, :cond_2

    :cond_0
    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Lcom/google/android/exoplayer2/util/Assertions;->checkState(Z)V

    .line 403
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->useController:Z

    if-ne v0, p1, :cond_3

    .line 413
    :cond_1
    :goto_1
    return-void

    .line 402
    :cond_2
    const/4 v0, 0x0

    goto :goto_0

    .line 406
    :cond_3
    iput-boolean p1, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->useController:Z

    .line 407
    if-eqz p1, :cond_4

    .line 408
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->controller:Lcom/google/android/exoplayer2/ui/PlaybackControlView;

    iget-object v1, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->player:Lcom/google/android/exoplayer2/SimpleExoPlayer;

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->setPlayer(Lcom/google/android/exoplayer2/ExoPlayer;)V

    goto :goto_1

    .line 409
    :cond_4
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->controller:Lcom/google/android/exoplayer2/ui/PlaybackControlView;

    if-eqz v0, :cond_1

    .line 410
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->controller:Lcom/google/android/exoplayer2/ui/PlaybackControlView;

    invoke-virtual {v0}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->hide()V

    .line 411
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->controller:Lcom/google/android/exoplayer2/ui/PlaybackControlView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->setPlayer(Lcom/google/android/exoplayer2/ExoPlayer;)V

    goto :goto_1
.end method

.method public showController()V
    .locals 1

    .prologue
    .line 430
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->useController:Z

    if-eqz v0, :cond_0

    .line 431
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;->maybeShowController(Z)V

    .line 433
    :cond_0
    return-void
.end method
