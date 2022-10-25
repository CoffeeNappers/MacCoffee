.class public Lcom/vk/stories/StoryViewDialog;
.super Landroid/app/Dialog;
.source "StoryViewDialog.java"

# interfaces
.implements Lcom/vk/stories/view/StoryViewContainer$ControlCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/stories/StoryViewDialog$FrameLayoutTouchListener;,
        Lcom/vk/stories/StoryViewDialog$AnimationDataProvider;
    }
.end annotation


# instance fields
.field private final activity:Landroid/app/Activity;

.field private final animationDataProvider:Lcom/vk/stories/StoryViewDialog$AnimationDataProvider;

.field private animationInProgress:Z

.field private final backgroundDrawable:Landroid/graphics/drawable/ColorDrawable;

.field private currentAnimationTargetView:Landroid/view/View;

.field private dragY:F

.field private draggingContainer:Lcom/vk/stories/StoryViewDialog$FrameLayoutTouchListener;

.field private draggingDown:Z

.field private final handler:Landroid/os/Handler;

.field private final lifecycleHandler:Lcom/vk/core/widget/LifecycleHandler;

.field private final lifecycleListener:Lcom/vk/core/widget/LifecycleListener;

.field private final maximumVelocity:I

.field private final minimumVelocity:I

.field private moveStartX:F

.field private final openStoryUid:I

.field private final storiesContainers:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/stories/model/StoriesContainer;",
            ">;"
        }
    .end annotation
.end field

.field private storyViewContainer:Lcom/vk/stories/view/StoryViewContainer;

.field private stubInstance:Lcom/vk/stories/view/StoryView;

.field private translationY:F

.field private velocityTracker:Landroid/view/VelocityTracker;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Ljava/util/ArrayList;ILcom/vk/stories/StoryViewDialog$AnimationDataProvider;)V
    .locals 9
    .param p1, "context"    # Landroid/app/Activity;
    .param p3, "openStoryUid"    # I
    .param p4, "animationDataProvider"    # Lcom/vk/stories/StoryViewDialog$AnimationDataProvider;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/stories/model/StoriesContainer;",
            ">;I",
            "Lcom/vk/stories/StoryViewDialog$AnimationDataProvider;",
            ")V"
        }
    .end annotation

    .prologue
    .local p2, "storiesContainers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/stories/model/StoriesContainer;>;"
    const/4 v5, 0x0

    const/4 v4, 0x0

    .line 68
    const v0, 0x7f0b00a7

    invoke-direct {p0, p1, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 43
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/vk/stories/StoryViewDialog;->handler:Landroid/os/Handler;

    .line 50
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    const/high16 v1, -0x1000000

    invoke-direct {v0, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    iput-object v0, p0, Lcom/vk/stories/StoryViewDialog;->backgroundDrawable:Landroid/graphics/drawable/ColorDrawable;

    .line 62
    iput-boolean v4, p0, Lcom/vk/stories/StoryViewDialog;->draggingDown:Z

    .line 63
    const/4 v0, 0x0

    iput v0, p0, Lcom/vk/stories/StoryViewDialog;->translationY:F

    .line 274
    new-instance v0, Lcom/vk/stories/StoryViewDialog$4;

    invoke-direct {v0, p0}, Lcom/vk/stories/StoryViewDialog$4;-><init>(Lcom/vk/stories/StoryViewDialog;)V

    iput-object v0, p0, Lcom/vk/stories/StoryViewDialog;->lifecycleListener:Lcom/vk/core/widget/LifecycleListener;

    .line 69
    invoke-virtual {p0}, Lcom/vk/stories/StoryViewDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    const v1, 0x7f0b0167

    invoke-virtual {v0, v1}, Landroid/view/Window;->setWindowAnimations(I)V

    .line 71
    iput-object p1, p0, Lcom/vk/stories/StoryViewDialog;->activity:Landroid/app/Activity;

    .line 72
    iput-object p4, p0, Lcom/vk/stories/StoryViewDialog;->animationDataProvider:Lcom/vk/stories/StoryViewDialog$AnimationDataProvider;

    .line 73
    iput-object p2, p0, Lcom/vk/stories/StoryViewDialog;->storiesContainers:Ljava/util/ArrayList;

    .line 74
    iput p3, p0, Lcom/vk/stories/StoryViewDialog;->openStoryUid:I

    .line 76
    new-instance v0, Lcom/vk/stories/view/StoryView;

    const/4 v2, 0x1

    sget-object v3, Lcom/vk/stories/StoriesController$SourceType;->LIST:Lcom/vk/stories/StoriesController$SourceType;

    .line 77
    invoke-static {p2, p3}, Lcom/vk/stories/util/StoriesUtil;->findStoryByAuthorId(Ljava/util/ArrayList;I)Lcom/vk/stories/model/StoriesContainer;

    move-result-object v6

    move-object v1, p1

    move-object v7, v5

    invoke-direct/range {v0 .. v7}, Lcom/vk/stories/view/StoryView;-><init>(Landroid/content/Context;ZLcom/vk/stories/StoriesController$SourceType;ILandroid/view/View$OnTouchListener;Lcom/vk/stories/model/StoriesContainer;Lcom/vk/stories/view/StoryView$StoryViewCallback;)V

    iput-object v0, p0, Lcom/vk/stories/StoryViewDialog;->stubInstance:Lcom/vk/stories/view/StoryView;

    .line 79
    new-instance v0, Lcom/vk/stories/StoryViewDialog$FrameLayoutTouchListener;

    iget-object v1, p0, Lcom/vk/stories/StoryViewDialog;->activity:Landroid/app/Activity;

    invoke-direct {v0, p0, v1}, Lcom/vk/stories/StoryViewDialog$FrameLayoutTouchListener;-><init>(Lcom/vk/stories/StoryViewDialog;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/vk/stories/StoryViewDialog;->draggingContainer:Lcom/vk/stories/StoryViewDialog$FrameLayoutTouchListener;

    .line 80
    iget-object v0, p0, Lcom/vk/stories/StoryViewDialog;->draggingContainer:Lcom/vk/stories/StoryViewDialog$FrameLayoutTouchListener;

    iget-object v1, p0, Lcom/vk/stories/StoryViewDialog;->backgroundDrawable:Landroid/graphics/drawable/ColorDrawable;

    invoke-static {v0, v1}, Lcom/vk/core/util/CompatUtils;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 81
    iget-object v0, p0, Lcom/vk/stories/StoryViewDialog;->draggingContainer:Lcom/vk/stories/StoryViewDialog$FrameLayoutTouchListener;

    iget-object v1, p0, Lcom/vk/stories/StoryViewDialog;->stubInstance:Lcom/vk/stories/view/StoryView;

    invoke-virtual {v0, v1}, Lcom/vk/stories/StoryViewDialog$FrameLayoutTouchListener;->addView(Landroid/view/View;)V

    .line 82
    iget-object v0, p0, Lcom/vk/stories/StoryViewDialog;->draggingContainer:Lcom/vk/stories/StoryViewDialog$FrameLayoutTouchListener;

    invoke-virtual {p0, v0}, Lcom/vk/stories/StoryViewDialog;->setContentView(Landroid/view/View;)V

    .line 84
    invoke-static {p1}, Lcom/vk/core/widget/LifecycleHandler;->install(Landroid/app/Activity;)Lcom/vk/core/widget/LifecycleHandler;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/stories/StoryViewDialog;->lifecycleHandler:Lcom/vk/core/widget/LifecycleHandler;

    .line 85
    iget-object v0, p0, Lcom/vk/stories/StoryViewDialog;->lifecycleHandler:Lcom/vk/core/widget/LifecycleHandler;

    iget-object v1, p0, Lcom/vk/stories/StoryViewDialog;->lifecycleListener:Lcom/vk/core/widget/LifecycleListener;

    invoke-virtual {v0, v1}, Lcom/vk/core/widget/LifecycleHandler;->setLifecycleListener(Lcom/vk/core/widget/LifecycleListener;)V

    .line 87
    invoke-static {p0, p1}, Lcom/vk/stories/StoryViewDialog$$Lambda$1;->lambdaFactory$(Lcom/vk/stories/StoryViewDialog;Landroid/app/Activity;)Landroid/content/DialogInterface$OnDismissListener;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vk/stories/StoryViewDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 99
    iget-object v0, p0, Lcom/vk/stories/StoryViewDialog;->activity:Landroid/app/Activity;

    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v8

    .line 100
    .local v8, "configuration":Landroid/view/ViewConfiguration;
    invoke-virtual {v8}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    move-result v0

    mul-int/lit8 v0, v0, 0x10

    iput v0, p0, Lcom/vk/stories/StoryViewDialog;->minimumVelocity:I

    .line 101
    invoke-virtual {v8}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    move-result v0

    iput v0, p0, Lcom/vk/stories/StoryViewDialog;->maximumVelocity:I

    .line 102
    return-void
.end method

.method private _internalOnTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 14
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    const/high16 v13, 0x3f800000    # 1.0f

    const/4 v12, 0x0

    const/high16 v11, 0x3f000000    # 0.5f

    const/4 v8, 0x0

    const/4 v7, 0x1

    .line 342
    iget-boolean v9, p0, Lcom/vk/stories/StoryViewDialog;->animationInProgress:Z

    if-nez v9, :cond_0

    iget-object v9, p0, Lcom/vk/stories/StoryViewDialog;->storyViewContainer:Lcom/vk/stories/view/StoryViewContainer;

    if-nez v9, :cond_1

    .line 427
    :cond_0
    :goto_0
    return v8

    .line 346
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v9

    if-eqz v9, :cond_2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v9

    const/4 v10, 0x5

    if-ne v9, v10, :cond_3

    .line 347
    :cond_2
    iget-boolean v9, p0, Lcom/vk/stories/StoryViewDialog;->draggingDown:Z

    if-nez v9, :cond_0

    .line 348
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v9

    if-ne v9, v7, :cond_0

    .line 349
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v7

    iput v7, p0, Lcom/vk/stories/StoryViewDialog;->moveStartX:F

    .line 350
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v7

    iput v7, p0, Lcom/vk/stories/StoryViewDialog;->dragY:F

    .line 351
    iput-boolean v8, p0, Lcom/vk/stories/StoryViewDialog;->draggingDown:Z

    .line 353
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v7

    iput-object v7, p0, Lcom/vk/stories/StoryViewDialog;->velocityTracker:Landroid/view/VelocityTracker;

    .line 354
    iget-object v7, p0, Lcom/vk/stories/StoryViewDialog;->velocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v7, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    goto :goto_0

    .line 357
    :cond_3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v9

    const/4 v10, 0x2

    if-ne v9, v10, :cond_9

    .line 358
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v9

    if-ne v9, v7, :cond_0

    .line 359
    iget-object v9, p0, Lcom/vk/stories/StoryViewDialog;->velocityTracker:Landroid/view/VelocityTracker;

    if-eqz v9, :cond_4

    .line 360
    iget-object v9, p0, Lcom/vk/stories/StoryViewDialog;->velocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v9, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 363
    :cond_4
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v9

    iget v10, p0, Lcom/vk/stories/StoryViewDialog;->moveStartX:F

    sub-float/2addr v9, v10

    invoke-static {v9}, Ljava/lang/Math;->abs(F)F

    move-result v1

    .line 364
    .local v1, "dx":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v9

    iget v10, p0, Lcom/vk/stories/StoryViewDialog;->dragY:F

    sub-float/2addr v9, v10

    invoke-static {v9}, Ljava/lang/Math;->abs(F)F

    move-result v2

    .line 365
    .local v2, "dy":F
    iget-boolean v9, p0, Lcom/vk/stories/StoryViewDialog;->draggingDown:Z

    if-nez v9, :cond_6

    const/16 v9, 0x1e

    invoke-static {v9}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v9

    int-to-float v9, v9

    cmpl-float v9, v2, v9

    if-ltz v9, :cond_6

    const/high16 v9, 0x40000000    # 2.0f

    div-float v9, v2, v9

    cmpl-float v9, v9, v1

    if-lez v9, :cond_6

    .line 366
    iput-boolean v7, p0, Lcom/vk/stories/StoryViewDialog;->draggingDown:Z

    .line 367
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v8

    iput v8, p0, Lcom/vk/stories/StoryViewDialog;->dragY:F

    .line 369
    iget-object v8, p0, Lcom/vk/stories/StoryViewDialog;->animationDataProvider:Lcom/vk/stories/StoryViewDialog$AnimationDataProvider;

    iget-object v9, p0, Lcom/vk/stories/StoryViewDialog;->storyViewContainer:Lcom/vk/stories/view/StoryViewContainer;

    invoke-virtual {v9}, Lcom/vk/stories/view/StoryViewContainer;->getCurrentStoryAuthorUid()I

    move-result v9

    invoke-interface {v8, v9}, Lcom/vk/stories/StoryViewDialog$AnimationDataProvider;->getAnimationTargetView(I)Landroid/view/View;

    move-result-object v8

    iput-object v8, p0, Lcom/vk/stories/StoryViewDialog;->currentAnimationTargetView:Landroid/view/View;

    .line 370
    iget-object v8, p0, Lcom/vk/stories/StoryViewDialog;->currentAnimationTargetView:Landroid/view/View;

    if-eqz v8, :cond_5

    .line 371
    iget-object v8, p0, Lcom/vk/stories/StoryViewDialog;->currentAnimationTargetView:Landroid/view/View;

    invoke-virtual {v8, v12}, Landroid/view/View;->setScaleX(F)V

    .line 372
    iget-object v8, p0, Lcom/vk/stories/StoryViewDialog;->currentAnimationTargetView:Landroid/view/View;

    invoke-virtual {v8, v12}, Landroid/view/View;->setScaleY(F)V

    .line 374
    :cond_5
    iget-object v8, p0, Lcom/vk/stories/StoryViewDialog;->storyViewContainer:Lcom/vk/stories/view/StoryViewContainer;

    invoke-virtual {v8}, Lcom/vk/stories/view/StoryViewContainer;->pauseStory()V

    move v8, v7

    .line 376
    goto/16 :goto_0

    .line 377
    :cond_6
    iget-boolean v7, p0, Lcom/vk/stories/StoryViewDialog;->draggingDown:Z

    if-eqz v7, :cond_8

    .line 378
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v7

    iget v9, p0, Lcom/vk/stories/StoryViewDialog;->dragY:F

    sub-float/2addr v7, v9

    iput v7, p0, Lcom/vk/stories/StoryViewDialog;->translationY:F

    .line 379
    iget-object v7, p0, Lcom/vk/stories/StoryViewDialog;->draggingContainer:Lcom/vk/stories/StoryViewDialog$FrameLayoutTouchListener;

    invoke-virtual {v7}, Lcom/vk/stories/StoryViewDialog$FrameLayoutTouchListener;->getHeight()I

    move-result v7

    int-to-float v7, v7

    const/high16 v9, 0x40000000    # 2.0f

    div-float v3, v7, v9

    .line 380
    .local v3, "maxValue":F
    iget v7, p0, Lcom/vk/stories/StoryViewDialog;->translationY:F

    invoke-static {v7}, Ljava/lang/Math;->abs(F)F

    move-result v7

    invoke-static {v7, v3}, Ljava/lang/Math;->min(FF)F

    move-result v7

    div-float/2addr v7, v3

    sub-float v0, v13, v7

    .line 382
    .local v0, "dragScale":F
    iget-object v7, p0, Lcom/vk/stories/StoryViewDialog;->backgroundDrawable:Landroid/graphics/drawable/ColorDrawable;

    const/high16 v9, 0x42fe0000    # 127.0f

    const/high16 v10, 0x437f0000    # 255.0f

    mul-float/2addr v10, v0

    invoke-static {v9, v10}, Ljava/lang/Math;->max(FF)F

    move-result v9

    float-to-int v9, v9

    invoke-virtual {v7, v9}, Landroid/graphics/drawable/ColorDrawable;->setAlpha(I)V

    .line 383
    iget-object v7, p0, Lcom/vk/stories/StoryViewDialog;->storyViewContainer:Lcom/vk/stories/view/StoryViewContainer;

    iget v9, p0, Lcom/vk/stories/StoryViewDialog;->translationY:F

    invoke-virtual {v7, v9}, Lcom/vk/stories/view/StoryViewContainer;->setTranslationY(F)V

    .line 385
    const v4, 0x3f666666    # 0.9f

    .line 387
    .local v4, "minScale":F
    cmpl-float v7, v0, v11

    if-ltz v7, :cond_7

    cmpg-float v7, v0, v13

    if-gtz v7, :cond_7

    .line 388
    const v7, 0x3f666666    # 0.9f

    const v9, 0x3dccccd0    # 0.100000024f

    sub-float v10, v0, v11

    div-float/2addr v10, v11

    mul-float/2addr v9, v10

    add-float v5, v7, v9

    .line 392
    .local v5, "targetScale":F
    :goto_1
    iget-object v7, p0, Lcom/vk/stories/StoryViewDialog;->storyViewContainer:Lcom/vk/stories/view/StoryViewContainer;

    invoke-virtual {v7, v5}, Lcom/vk/stories/view/StoryViewContainer;->setScaleX(F)V

    .line 393
    iget-object v7, p0, Lcom/vk/stories/StoryViewDialog;->storyViewContainer:Lcom/vk/stories/view/StoryViewContainer;

    invoke-virtual {v7, v5}, Lcom/vk/stories/view/StoryViewContainer;->setScaleY(F)V

    .line 395
    iget-object v7, p0, Lcom/vk/stories/StoryViewDialog;->storyViewContainer:Lcom/vk/stories/view/StoryViewContainer;

    invoke-virtual {v7}, Lcom/vk/stories/view/StoryViewContainer;->pauseStory()V

    goto/16 :goto_0

    .line 390
    .end local v5    # "targetScale":F
    :cond_7
    const v5, 0x3f666666    # 0.9f

    .restart local v5    # "targetScale":F
    goto :goto_1

    .line 397
    .end local v0    # "dragScale":F
    .end local v3    # "maxValue":F
    .end local v4    # "minScale":F
    .end local v5    # "targetScale":F
    :cond_8
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v7

    iput v7, p0, Lcom/vk/stories/StoryViewDialog;->moveStartX:F

    goto/16 :goto_0

    .line 400
    .end local v1    # "dx":F
    .end local v2    # "dy":F
    :cond_9
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v9

    const/4 v10, 0x3

    if-eq v9, v10, :cond_a

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v9

    if-eq v9, v7, :cond_a

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v9

    const/4 v10, 0x6

    if-ne v9, v10, :cond_0

    .line 402
    :cond_a
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v9

    if-eq v9, v7, :cond_b

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v9

    const/4 v10, 0x6

    if-ne v9, v10, :cond_c

    .line 403
    :cond_b
    iget-object v9, p0, Lcom/vk/stories/StoryViewDialog;->velocityTracker:Landroid/view/VelocityTracker;

    if-eqz v9, :cond_c

    .line 404
    iget-object v9, p0, Lcom/vk/stories/StoryViewDialog;->velocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v9, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 405
    iget-object v9, p0, Lcom/vk/stories/StoryViewDialog;->velocityTracker:Landroid/view/VelocityTracker;

    const/16 v10, 0x3e8

    invoke-virtual {v9, v10}, Landroid/view/VelocityTracker;->computeCurrentVelocity(I)V

    .line 409
    :cond_c
    iget-boolean v9, p0, Lcom/vk/stories/StoryViewDialog;->draggingDown:Z

    if-eqz v9, :cond_f

    .line 410
    const/4 v6, 0x1

    .line 411
    .local v6, "validVelocity":Z
    iget-object v9, p0, Lcom/vk/stories/StoryViewDialog;->velocityTracker:Landroid/view/VelocityTracker;

    if-eqz v9, :cond_d

    .line 412
    iget-object v9, p0, Lcom/vk/stories/StoryViewDialog;->velocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v9}, Landroid/view/VelocityTracker;->getYVelocity()F

    move-result v9

    invoke-static {v9}, Ljava/lang/Math;->abs(F)F

    move-result v9

    iget v10, p0, Lcom/vk/stories/StoryViewDialog;->minimumVelocity:I

    int-to-float v10, v10

    cmpl-float v9, v9, v10

    if-lez v9, :cond_10

    iget-object v9, p0, Lcom/vk/stories/StoryViewDialog;->velocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v9}, Landroid/view/VelocityTracker;->getYVelocity()F

    move-result v9

    invoke-static {v9}, Ljava/lang/Math;->abs(F)F

    move-result v9

    iget v10, p0, Lcom/vk/stories/StoryViewDialog;->maximumVelocity:I

    int-to-float v10, v10

    cmpg-float v9, v9, v10

    if-gez v9, :cond_10

    move v6, v7

    .line 414
    :cond_d
    :goto_2
    iget v7, p0, Lcom/vk/stories/StoryViewDialog;->dragY:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v9

    sub-float/2addr v7, v9

    invoke-static {v7}, Ljava/lang/Math;->abs(F)F

    move-result v7

    iget-object v9, p0, Lcom/vk/stories/StoryViewDialog;->draggingContainer:Lcom/vk/stories/StoryViewDialog$FrameLayoutTouchListener;

    invoke-virtual {v9}, Lcom/vk/stories/StoryViewDialog$FrameLayoutTouchListener;->getHeight()I

    move-result v9

    int-to-float v9, v9

    const/high16 v10, 0x40c00000    # 6.0f

    div-float/2addr v9, v10

    cmpl-float v7, v7, v9

    if-gtz v7, :cond_e

    if-eqz v6, :cond_11

    .line 415
    :cond_e
    invoke-virtual {p0}, Lcom/vk/stories/StoryViewDialog;->dismiss()V

    .line 419
    :goto_3
    iput-boolean v8, p0, Lcom/vk/stories/StoryViewDialog;->draggingDown:Z

    .line 422
    .end local v6    # "validVelocity":Z
    :cond_f
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v7

    const/4 v9, 0x3

    if-ne v7, v9, :cond_0

    iget-object v7, p0, Lcom/vk/stories/StoryViewDialog;->velocityTracker:Landroid/view/VelocityTracker;

    if-eqz v7, :cond_0

    .line 423
    iget-object v7, p0, Lcom/vk/stories/StoryViewDialog;->velocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v7}, Landroid/view/VelocityTracker;->recycle()V

    .line 424
    const/4 v7, 0x0

    iput-object v7, p0, Lcom/vk/stories/StoryViewDialog;->velocityTracker:Landroid/view/VelocityTracker;

    goto/16 :goto_0

    .restart local v6    # "validVelocity":Z
    :cond_10
    move v6, v8

    .line 412
    goto :goto_2

    .line 417
    :cond_11
    invoke-direct {p0}, Lcom/vk/stories/StoryViewDialog;->animateToDefaultPosition()V

    goto :goto_3
.end method

.method static synthetic access$002(Lcom/vk/stories/StoryViewDialog;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/StoryViewDialog;
    .param p1, "x1"    # Z

    .prologue
    .line 41
    iput-boolean p1, p0, Lcom/vk/stories/StoryViewDialog;->animationInProgress:Z

    return p1
.end method

.method static synthetic access$100(Lcom/vk/stories/StoryViewDialog;)Lcom/vk/stories/view/StoryViewContainer;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/StoryViewDialog;

    .prologue
    .line 41
    iget-object v0, p0, Lcom/vk/stories/StoryViewDialog;->storyViewContainer:Lcom/vk/stories/view/StoryViewContainer;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/vk/stories/StoryViewDialog;Landroid/view/MotionEvent;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/StoryViewDialog;
    .param p1, "x1"    # Landroid/view/MotionEvent;

    .prologue
    .line 41
    invoke-direct {p0, p1}, Lcom/vk/stories/StoryViewDialog;->_internalOnTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$102(Lcom/vk/stories/StoryViewDialog;Lcom/vk/stories/view/StoryViewContainer;)Lcom/vk/stories/view/StoryViewContainer;
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/StoryViewDialog;
    .param p1, "x1"    # Lcom/vk/stories/view/StoryViewContainer;

    .prologue
    .line 41
    iput-object p1, p0, Lcom/vk/stories/StoryViewDialog;->storyViewContainer:Lcom/vk/stories/view/StoryViewContainer;

    return-object p1
.end method

.method static synthetic access$200(Lcom/vk/stories/StoryViewDialog;)Landroid/app/Activity;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/StoryViewDialog;

    .prologue
    .line 41
    iget-object v0, p0, Lcom/vk/stories/StoryViewDialog;->activity:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$300(Lcom/vk/stories/StoryViewDialog;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/StoryViewDialog;

    .prologue
    .line 41
    iget-object v0, p0, Lcom/vk/stories/StoryViewDialog;->storiesContainers:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$400(Lcom/vk/stories/StoryViewDialog;)I
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/StoryViewDialog;

    .prologue
    .line 41
    iget v0, p0, Lcom/vk/stories/StoryViewDialog;->openStoryUid:I

    return v0
.end method

.method static synthetic access$500(Lcom/vk/stories/StoryViewDialog;)Lcom/vk/stories/StoryViewDialog$FrameLayoutTouchListener;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/StoryViewDialog;

    .prologue
    .line 41
    iget-object v0, p0, Lcom/vk/stories/StoryViewDialog;->draggingContainer:Lcom/vk/stories/StoryViewDialog$FrameLayoutTouchListener;

    return-object v0
.end method

.method static synthetic access$602(Lcom/vk/stories/StoryViewDialog;Lcom/vk/stories/view/StoryView;)Lcom/vk/stories/view/StoryView;
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/StoryViewDialog;
    .param p1, "x1"    # Lcom/vk/stories/view/StoryView;

    .prologue
    .line 41
    iput-object p1, p0, Lcom/vk/stories/StoryViewDialog;->stubInstance:Lcom/vk/stories/view/StoryView;

    return-object p1
.end method

.method static synthetic access$701(Lcom/vk/stories/StoryViewDialog;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/StoryViewDialog;

    .prologue
    .line 41
    invoke-super {p0}, Landroid/app/Dialog;->dismiss()V

    return-void
.end method

.method static synthetic access$802(Lcom/vk/stories/StoryViewDialog;F)F
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/StoryViewDialog;
    .param p1, "x1"    # F

    .prologue
    .line 41
    iput p1, p0, Lcom/vk/stories/StoryViewDialog;->translationY:F

    return p1
.end method

.method static synthetic access$900(Lcom/vk/stories/StoryViewDialog;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/StoryViewDialog;

    .prologue
    .line 41
    iget-object v0, p0, Lcom/vk/stories/StoryViewDialog;->currentAnimationTargetView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$902(Lcom/vk/stories/StoryViewDialog;Landroid/view/View;)Landroid/view/View;
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/StoryViewDialog;
    .param p1, "x1"    # Landroid/view/View;

    .prologue
    .line 41
    iput-object p1, p0, Lcom/vk/stories/StoryViewDialog;->currentAnimationTargetView:Landroid/view/View;

    return-object p1
.end method

.method private animateToDefaultPosition()V
    .locals 10

    .prologue
    const/4 v9, 0x2

    const/high16 v6, 0x3f800000    # 1.0f

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 222
    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 223
    .local v0, "animatorSet":Landroid/animation/AnimatorSet;
    const/4 v1, 0x4

    new-array v1, v1, [Landroid/animation/Animator;

    iget-object v2, p0, Lcom/vk/stories/StoryViewDialog;->storyViewContainer:Lcom/vk/stories/view/StoryViewContainer;

    const-string/jumbo v3, "translationY"

    new-array v4, v8, [F

    const/4 v5, 0x0

    aput v5, v4, v7

    .line 224
    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    aput-object v2, v1, v7

    iget-object v2, p0, Lcom/vk/stories/StoryViewDialog;->storyViewContainer:Lcom/vk/stories/view/StoryViewContainer;

    const-string/jumbo v3, "scaleY"

    new-array v4, v8, [F

    aput v6, v4, v7

    .line 225
    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    aput-object v2, v1, v8

    iget-object v2, p0, Lcom/vk/stories/StoryViewDialog;->storyViewContainer:Lcom/vk/stories/view/StoryViewContainer;

    const-string/jumbo v3, "scaleX"

    new-array v4, v8, [F

    aput v6, v4, v7

    .line 226
    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    aput-object v2, v1, v9

    const/4 v2, 0x3

    iget-object v3, p0, Lcom/vk/stories/StoryViewDialog;->backgroundDrawable:Landroid/graphics/drawable/ColorDrawable;

    const-string/jumbo v4, "alpha"

    new-array v5, v9, [I

    iget-object v6, p0, Lcom/vk/stories/StoryViewDialog;->backgroundDrawable:Landroid/graphics/drawable/ColorDrawable;

    .line 227
    invoke-virtual {v6}, Landroid/graphics/drawable/ColorDrawable;->getAlpha()I

    move-result v6

    aput v6, v5, v7

    const/16 v6, 0xff

    aput v6, v5, v8

    invoke-static {v3, v4, v5}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object v3

    aput-object v3, v1, v2

    .line 223
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 229
    const-wide/16 v2, 0xe1

    invoke-virtual {v0, v2, v3}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 231
    new-instance v1, Lcom/vk/stories/StoryViewDialog$3;

    invoke-direct {v1, p0}, Lcom/vk/stories/StoryViewDialog$3;-><init>(Lcom/vk/stories/StoryViewDialog;)V

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 243
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 244
    return-void
.end method

.method private getViewCenterX(Landroid/view/View;)I
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 247
    invoke-virtual {p1}, Landroid/view/View;->getScaleX()F

    move-result v0

    const v1, 0x3f666666    # 0.9f

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    .line 248
    invoke-static {p1}, Lcom/vk/attachpicker/util/Utils;->getXOnScreen(Landroid/view/View;)I

    move-result v0

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    add-int/2addr v0, v1

    .line 250
    :goto_0
    return v0

    :cond_0
    invoke-static {p1}, Lcom/vk/attachpicker/util/Utils;->getXOnScreen(Landroid/view/View;)I

    move-result v0

    goto :goto_0
.end method

.method private getViewCenterY(Landroid/view/View;)I
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 255
    invoke-virtual {p1}, Landroid/view/View;->getScaleX()F

    move-result v0

    const v1, 0x3f666666    # 0.9f

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    .line 256
    invoke-static {p1}, Lcom/vk/attachpicker/util/Utils;->getYOnScreen(Landroid/view/View;)I

    move-result v0

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    add-int/2addr v0, v1

    .line 258
    :goto_0
    return v0

    :cond_0
    invoke-static {p1}, Lcom/vk/attachpicker/util/Utils;->getYOnScreen(Landroid/view/View;)I

    move-result v0

    goto :goto_0
.end method

.method private isViewValid(Landroid/view/View;)Z
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 263
    if-nez p1, :cond_0

    .line 264
    const/4 v0, 0x0

    .line 268
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method static synthetic lambda$startOpenAnimation$1(Landroid/animation/AnimatorSet;)V
    .locals 0
    .param p0, "set"    # Landroid/animation/AnimatorSet;

    .prologue
    .line 176
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 177
    return-void
.end method

.method private startCloseAnimation(Landroid/view/View;)V
    .locals 17
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 184
    invoke-direct/range {p0 .. p1}, Lcom/vk/stories/StoryViewDialog;->isViewValid(Landroid/view/View;)Z

    move-result v6

    .line 185
    .local v6, "isViewValid":Z
    new-instance v7, Landroid/animation/AnimatorSet;

    invoke-direct {v7}, Landroid/animation/AnimatorSet;-><init>()V

    .line 186
    .local v7, "set":Landroid/animation/AnimatorSet;
    if-eqz v6, :cond_0

    .line 187
    invoke-direct/range {p0 .. p1}, Lcom/vk/stories/StoryViewDialog;->getViewCenterX(Landroid/view/View;)I

    move-result v8

    .line 188
    .local v8, "viewCenterX":I
    invoke-direct/range {p0 .. p1}, Lcom/vk/stories/StoryViewDialog;->getViewCenterY(Landroid/view/View;)I

    move-result v9

    .line 190
    .local v9, "viewCenterY":I
    invoke-static {}, Lcom/vk/core/util/Screen;->realWidth()I

    move-result v5

    .line 191
    .local v5, "finalW":I
    invoke-static {}, Lcom/vk/core/util/Screen;->realHeight()I

    move-result v4

    .line 192
    .local v4, "finalH":I
    div-int/lit8 v2, v5, 0x2

    .line 193
    .local v2, "finalCenterX":I
    div-int/lit8 v3, v4, 0x2

    .line 195
    .local v3, "finalCenterY":I
    const/4 v10, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v10}, Landroid/view/View;->setScaleX(F)V

    .line 196
    const/4 v10, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v10}, Landroid/view/View;->setScaleY(F)V

    .line 198
    const/4 v10, 0x7

    new-array v10, v10, [Landroid/animation/Animator;

    const/4 v11, 0x0

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/vk/stories/StoryViewDialog;->storyViewContainer:Lcom/vk/stories/view/StoryViewContainer;

    sget-object v13, Landroid/view/View;->TRANSLATION_X:Landroid/util/Property;

    const/4 v14, 0x1

    new-array v14, v14, [F

    const/4 v15, 0x0

    sub-int v16, v8, v2

    move/from16 v0, v16

    int-to-float v0, v0

    move/from16 v16, v0

    aput v16, v14, v15

    .line 199
    invoke-static {v12, v13, v14}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v12

    invoke-static {v12}, Lcom/vk/core/util/AnimationUtils;->decelerate(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v12

    aput-object v12, v10, v11

    const/4 v11, 0x1

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/vk/stories/StoryViewDialog;->storyViewContainer:Lcom/vk/stories/view/StoryViewContainer;

    sget-object v13, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    const/4 v14, 0x1

    new-array v14, v14, [F

    const/4 v15, 0x0

    sub-int v16, v9, v3

    move/from16 v0, v16

    int-to-float v0, v0

    move/from16 v16, v0

    aput v16, v14, v15

    .line 200
    invoke-static {v12, v13, v14}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v12

    invoke-static {v12}, Lcom/vk/core/util/AnimationUtils;->decelerate(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v12

    aput-object v12, v10, v11

    const/4 v11, 0x2

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/vk/stories/StoryViewDialog;->storyViewContainer:Lcom/vk/stories/view/StoryViewContainer;

    sget-object v13, Landroid/view/View;->SCALE_X:Landroid/util/Property;

    const/4 v14, 0x1

    new-array v14, v14, [F

    const/4 v15, 0x0

    const/16 v16, 0x0

    aput v16, v14, v15

    .line 201
    invoke-static {v12, v13, v14}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v12

    invoke-static {v12}, Lcom/vk/core/util/AnimationUtils;->decelerate(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v12

    aput-object v12, v10, v11

    const/4 v11, 0x3

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/vk/stories/StoryViewDialog;->storyViewContainer:Lcom/vk/stories/view/StoryViewContainer;

    sget-object v13, Landroid/view/View;->SCALE_Y:Landroid/util/Property;

    const/4 v14, 0x1

    new-array v14, v14, [F

    const/4 v15, 0x0

    const/16 v16, 0x0

    aput v16, v14, v15

    .line 202
    invoke-static {v12, v13, v14}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v12

    invoke-static {v12}, Lcom/vk/core/util/AnimationUtils;->decelerate(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v12

    aput-object v12, v10, v11

    const/4 v11, 0x4

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/vk/stories/StoryViewDialog;->backgroundDrawable:Landroid/graphics/drawable/ColorDrawable;

    const-string/jumbo v13, "alpha"

    const/4 v14, 0x1

    new-array v14, v14, [I

    const/4 v15, 0x0

    const/16 v16, 0x0

    aput v16, v14, v15

    .line 203
    invoke-static {v12, v13, v14}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object v12

    invoke-static {v12}, Lcom/vk/core/util/AnimationUtils;->decelerate(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v12

    aput-object v12, v10, v11

    const/4 v11, 0x5

    sget-object v12, Landroid/view/View;->SCALE_X:Landroid/util/Property;

    const/4 v13, 0x1

    new-array v13, v13, [F

    const/4 v14, 0x0

    const/high16 v15, 0x3f800000    # 1.0f

    aput v15, v13, v14

    .line 204
    move-object/from16 v0, p1

    invoke-static {v0, v12, v13}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v12

    aput-object v12, v10, v11

    const/4 v11, 0x6

    sget-object v12, Landroid/view/View;->SCALE_Y:Landroid/util/Property;

    const/4 v13, 0x1

    new-array v13, v13, [F

    const/4 v14, 0x0

    const/high16 v15, 0x3f800000    # 1.0f

    aput v15, v13, v14

    .line 205
    move-object/from16 v0, p1

    invoke-static {v0, v12, v13}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v12

    aput-object v12, v10, v11

    .line 198
    invoke-virtual {v7, v10}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 208
    .end local v2    # "finalCenterX":I
    .end local v3    # "finalCenterY":I
    .end local v4    # "finalH":I
    .end local v5    # "finalW":I
    .end local v8    # "viewCenterX":I
    .end local v9    # "viewCenterY":I
    :cond_0
    if-eqz v6, :cond_1

    const-wide/16 v10, 0xe1

    :goto_0
    invoke-virtual {v7, v10, v11}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 209
    new-instance v10, Lcom/vk/stories/StoryViewDialog$2;

    move-object/from16 v0, p0

    invoke-direct {v10, v0}, Lcom/vk/stories/StoryViewDialog$2;-><init>(Lcom/vk/stories/StoryViewDialog;)V

    invoke-virtual {v7, v10}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 216
    const/4 v10, 0x1

    move-object/from16 v0, p0

    iput-boolean v10, v0, Lcom/vk/stories/StoryViewDialog;->animationInProgress:Z

    .line 217
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/vk/stories/StoryViewDialog;->storyViewContainer:Lcom/vk/stories/view/StoryViewContainer;

    invoke-virtual {v10}, Lcom/vk/stories/view/StoryViewContainer;->pauseStory()V

    .line 218
    invoke-virtual {v7}, Landroid/animation/AnimatorSet;->start()V

    .line 219
    return-void

    .line 208
    :cond_1
    const-wide/16 v10, 0x0

    goto :goto_0
.end method

.method private startOpenAnimation(Landroid/view/View;)V
    .locals 15
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 135
    invoke-direct/range {p0 .. p1}, Lcom/vk/stories/StoryViewDialog;->isViewValid(Landroid/view/View;)Z

    move-result v4

    .line 136
    .local v4, "isViewValid":Z
    new-instance v5, Landroid/animation/AnimatorSet;

    invoke-direct {v5}, Landroid/animation/AnimatorSet;-><init>()V

    .line 137
    .local v5, "set":Landroid/animation/AnimatorSet;
    if-eqz v4, :cond_0

    .line 138
    invoke-direct/range {p0 .. p1}, Lcom/vk/stories/StoryViewDialog;->getViewCenterX(Landroid/view/View;)I

    move-result v6

    .line 139
    .local v6, "viewCenterX":I
    invoke-direct/range {p0 .. p1}, Lcom/vk/stories/StoryViewDialog;->getViewCenterY(Landroid/view/View;)I

    move-result v7

    .line 141
    .local v7, "viewCenterY":I
    invoke-static {}, Lcom/vk/core/util/Screen;->realWidth()I

    move-result v3

    .line 142
    .local v3, "finalW":I
    invoke-static {}, Lcom/vk/core/util/Screen;->realHeight()I

    move-result v2

    .line 143
    .local v2, "finalH":I
    div-int/lit8 v0, v3, 0x2

    .line 144
    .local v0, "finalCenterX":I
    div-int/lit8 v1, v2, 0x2

    .line 146
    .local v1, "finalCenterY":I
    iget-object v8, p0, Lcom/vk/stories/StoryViewDialog;->stubInstance:Lcom/vk/stories/view/StoryView;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Lcom/vk/stories/view/StoryView;->setScaleX(F)V

    .line 147
    iget-object v8, p0, Lcom/vk/stories/StoryViewDialog;->stubInstance:Lcom/vk/stories/view/StoryView;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Lcom/vk/stories/view/StoryView;->setScaleY(F)V

    .line 148
    iget-object v8, p0, Lcom/vk/stories/StoryViewDialog;->backgroundDrawable:Landroid/graphics/drawable/ColorDrawable;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Landroid/graphics/drawable/ColorDrawable;->setAlpha(I)V

    .line 150
    const/4 v8, 0x5

    new-array v8, v8, [Landroid/animation/Animator;

    const/4 v9, 0x0

    iget-object v10, p0, Lcom/vk/stories/StoryViewDialog;->stubInstance:Lcom/vk/stories/view/StoryView;

    sget-object v11, Landroid/view/View;->TRANSLATION_X:Landroid/util/Property;

    const/4 v12, 0x2

    new-array v12, v12, [F

    const/4 v13, 0x0

    sub-int v14, v6, v0

    int-to-float v14, v14

    aput v14, v12, v13

    const/4 v13, 0x1

    const/4 v14, 0x0

    aput v14, v12, v13

    .line 151
    invoke-static {v10, v11, v12}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v10

    invoke-static {v10}, Lcom/vk/core/util/AnimationUtils;->decelerate(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x1

    iget-object v10, p0, Lcom/vk/stories/StoryViewDialog;->stubInstance:Lcom/vk/stories/view/StoryView;

    sget-object v11, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    const/4 v12, 0x2

    new-array v12, v12, [F

    const/4 v13, 0x0

    sub-int v14, v7, v1

    int-to-float v14, v14

    aput v14, v12, v13

    const/4 v13, 0x1

    const/4 v14, 0x0

    aput v14, v12, v13

    .line 152
    invoke-static {v10, v11, v12}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v10

    invoke-static {v10}, Lcom/vk/core/util/AnimationUtils;->decelerate(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x2

    iget-object v10, p0, Lcom/vk/stories/StoryViewDialog;->stubInstance:Lcom/vk/stories/view/StoryView;

    sget-object v11, Landroid/view/View;->SCALE_X:Landroid/util/Property;

    const/4 v12, 0x2

    new-array v12, v12, [F

    fill-array-data v12, :array_0

    .line 153
    invoke-static {v10, v11, v12}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v10

    invoke-static {v10}, Lcom/vk/core/util/AnimationUtils;->decelerate(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x3

    iget-object v10, p0, Lcom/vk/stories/StoryViewDialog;->stubInstance:Lcom/vk/stories/view/StoryView;

    sget-object v11, Landroid/view/View;->SCALE_Y:Landroid/util/Property;

    const/4 v12, 0x2

    new-array v12, v12, [F

    fill-array-data v12, :array_1

    .line 154
    invoke-static {v10, v11, v12}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v10

    invoke-static {v10}, Lcom/vk/core/util/AnimationUtils;->decelerate(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x4

    iget-object v10, p0, Lcom/vk/stories/StoryViewDialog;->backgroundDrawable:Landroid/graphics/drawable/ColorDrawable;

    const-string/jumbo v11, "alpha"

    const/4 v12, 0x2

    new-array v12, v12, [I

    fill-array-data v12, :array_2

    .line 155
    invoke-static {v10, v11, v12}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object v10

    invoke-static {v10}, Lcom/vk/core/util/AnimationUtils;->decelerate(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v10

    aput-object v10, v8, v9

    .line 150
    invoke-virtual {v5, v8}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 158
    .end local v0    # "finalCenterX":I
    .end local v1    # "finalCenterY":I
    .end local v2    # "finalH":I
    .end local v3    # "finalW":I
    .end local v6    # "viewCenterX":I
    .end local v7    # "viewCenterY":I
    :cond_0
    if-eqz v4, :cond_1

    const-wide/16 v8, 0xe1

    :goto_0
    invoke-virtual {v5, v8, v9}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 159
    new-instance v8, Lcom/vk/stories/StoryViewDialog$1;

    invoke-direct {v8, p0}, Lcom/vk/stories/StoryViewDialog$1;-><init>(Lcom/vk/stories/StoryViewDialog;)V

    invoke-virtual {v5, v8}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 172
    const/4 v8, 0x1

    iput-boolean v8, p0, Lcom/vk/stories/StoryViewDialog;->animationInProgress:Z

    .line 174
    if-eqz v4, :cond_2

    .line 175
    iget-object v8, p0, Lcom/vk/stories/StoryViewDialog;->handler:Landroid/os/Handler;

    invoke-static {v5}, Lcom/vk/stories/StoryViewDialog$$Lambda$2;->lambdaFactory$(Landroid/animation/AnimatorSet;)Ljava/lang/Runnable;

    move-result-object v9

    const-wide/16 v10, 0x78

    invoke-virtual {v8, v9, v10, v11}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 181
    :goto_1
    return-void

    .line 158
    :cond_1
    const-wide/16 v8, 0x0

    goto :goto_0

    .line 179
    :cond_2
    invoke-virtual {v5}, Landroid/animation/AnimatorSet;->start()V

    goto :goto_1

    .line 152
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 153
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 154
    :array_2
    .array-data 4
        0x0
        0xff
    .end array-data
.end method


# virtual methods
.method public cancel()V
    .locals 0

    .prologue
    .line 127
    return-void
.end method

.method public dismiss()V
    .locals 2

    .prologue
    .line 131
    iget-object v0, p0, Lcom/vk/stories/StoryViewDialog;->animationDataProvider:Lcom/vk/stories/StoryViewDialog$AnimationDataProvider;

    iget-object v1, p0, Lcom/vk/stories/StoryViewDialog;->storyViewContainer:Lcom/vk/stories/view/StoryViewContainer;

    invoke-virtual {v1}, Lcom/vk/stories/view/StoryViewContainer;->getCurrentStoryAuthorUid()I

    move-result v1

    invoke-interface {v0, v1}, Lcom/vk/stories/StoryViewDialog$AnimationDataProvider;->getAnimationTargetView(I)Landroid/view/View;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vk/stories/StoryViewDialog;->startCloseAnimation(Landroid/view/View;)V

    .line 132
    return-void
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 306
    iget-object v0, p0, Lcom/vk/stories/StoryViewDialog;->storyViewContainer:Lcom/vk/stories/view/StoryViewContainer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/stories/StoryViewDialog;->storyViewContainer:Lcom/vk/stories/view/StoryViewContainer;

    invoke-virtual {v0, p1}, Lcom/vk/stories/view/StoryViewContainer;->doDispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 307
    const/4 v0, 0x1

    .line 309
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1}, Landroid/app/Dialog;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method public finish()V
    .locals 0

    .prologue
    .line 320
    invoke-virtual {p0}, Lcom/vk/stories/StoryViewDialog;->dismiss()V

    .line 321
    return-void
.end method

.method synthetic lambda$new$0(Landroid/app/Activity;Landroid/content/DialogInterface;)V
    .locals 3
    .param p1, "context"    # Landroid/app/Activity;
    .param p2, "dialogInterface"    # Landroid/content/DialogInterface;

    .prologue
    const/4 v2, 0x0

    .line 88
    iget-object v0, p0, Lcom/vk/stories/StoryViewDialog;->storyViewContainer:Lcom/vk/stories/view/StoryViewContainer;

    if-eqz v0, :cond_0

    .line 89
    iget-object v0, p0, Lcom/vk/stories/StoryViewDialog;->storyViewContainer:Lcom/vk/stories/view/StoryViewContainer;

    invoke-virtual {v0}, Lcom/vk/stories/view/StoryViewContainer;->onPause()V

    .line 90
    iget-object v0, p0, Lcom/vk/stories/StoryViewDialog;->storyViewContainer:Lcom/vk/stories/view/StoryViewContainer;

    invoke-virtual {v0}, Lcom/vk/stories/view/StoryViewContainer;->onDestroy()V

    .line 92
    :cond_0
    iget-object v0, p0, Lcom/vk/stories/StoryViewDialog;->activity:Landroid/app/Activity;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/app/Activity;->setRequestedOrientation(I)V

    .line 93
    invoke-static {v2}, Lcom/vkontakte/android/media/VideoPools;->setOverlayDialogVisible(Z)V

    .line 94
    iget-object v0, p0, Lcom/vk/stories/StoryViewDialog;->activity:Landroid/app/Activity;

    invoke-static {v0}, Lcom/vkontakte/android/media/VideoPools;->onResume(Landroid/app/Activity;)V

    .line 95
    invoke-static {p1, v2}, Lcom/vk/camera/Utils;->keepScreenOn(Landroid/app/Activity;Z)V

    .line 96
    return-void
.end method

.method public noDragGestureInProgress()Z
    .locals 1

    .prologue
    .line 330
    iget-boolean v0, p0, Lcom/vk/stories/StoryViewDialog;->draggingDown:Z

    return v0
.end method

.method public onBackPressed()V
    .locals 1

    .prologue
    .line 119
    iget-boolean v0, p0, Lcom/vk/stories/StoryViewDialog;->animationInProgress:Z

    if-nez v0, :cond_0

    .line 120
    invoke-virtual {p0}, Lcom/vk/stories/StoryViewDialog;->dismiss()V

    .line 122
    :cond_0
    return-void
.end method

.method public scrollStoriesListToAuthorId(I)V
    .locals 1
    .param p1, "uid"    # I

    .prologue
    .line 325
    iget-object v0, p0, Lcom/vk/stories/StoryViewDialog;->animationDataProvider:Lcom/vk/stories/StoryViewDialog$AnimationDataProvider;

    invoke-interface {v0, p1}, Lcom/vk/stories/StoryViewDialog$AnimationDataProvider;->scrollStoriesListToAuthorId(I)V

    .line 326
    return-void
.end method

.method public show()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 106
    invoke-super {p0}, Landroid/app/Dialog;->show()V

    .line 107
    invoke-static {v1}, Lcom/vkontakte/android/media/VideoPools;->setOverlayDialogVisible(Z)V

    .line 108
    iget-object v0, p0, Lcom/vk/stories/StoryViewDialog;->activity:Landroid/app/Activity;

    invoke-static {v0}, Lcom/vkontakte/android/media/VideoPools;->onPause(Landroid/app/Activity;)V

    .line 109
    iget-object v0, p0, Lcom/vk/stories/StoryViewDialog;->activity:Landroid/app/Activity;

    invoke-virtual {v0, v1}, Landroid/app/Activity;->setRequestedOrientation(I)V

    .line 110
    iget-object v0, p0, Lcom/vk/stories/StoryViewDialog;->animationDataProvider:Lcom/vk/stories/StoryViewDialog$AnimationDataProvider;

    iget v1, p0, Lcom/vk/stories/StoryViewDialog;->openStoryUid:I

    invoke-interface {v0, v1}, Lcom/vk/stories/StoryViewDialog$AnimationDataProvider;->getAnimationTargetView(I)Landroid/view/View;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vk/stories/StoryViewDialog;->startOpenAnimation(Landroid/view/View;)V

    .line 111
    return-void
.end method

.method public startForResult(Landroid/content/Intent;I)V
    .locals 2
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "requestCode"    # I

    .prologue
    .line 315
    iget-object v0, p0, Lcom/vk/stories/StoryViewDialog;->lifecycleHandler:Lcom/vk/core/widget/LifecycleHandler;

    iget-object v1, p0, Lcom/vk/stories/StoryViewDialog;->lifecycleListener:Lcom/vk/core/widget/LifecycleListener;

    invoke-virtual {v1}, Lcom/vk/core/widget/LifecycleListener;->getUniqueId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p1, p2}, Lcom/vk/core/widget/LifecycleHandler;->startActivityForResult(Ljava/lang/String;Landroid/content/Intent;I)V

    .line 316
    return-void
.end method
