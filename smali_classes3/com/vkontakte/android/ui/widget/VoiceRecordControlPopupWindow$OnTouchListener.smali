.class Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnTouchListener;
.super Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$TouchInBoundsListener;
.source "VoiceRecordControlPopupWindow.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "OnTouchListener"
.end annotation


# instance fields
.field private actionState:Z

.field private dX:F

.field final synthetic this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)V
    .locals 1

    .prologue
    .line 329
    iput-object p1, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnTouchListener;->this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$TouchInBoundsListener;-><init>(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$1;)V

    .line 331
    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnTouchListener;->dX:F

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;
    .param p2, "x1"    # Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$1;

    .prologue
    .line 329
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnTouchListener;-><init>(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)V

    return-void
.end method

.method private changeActionState(ZZ)V
    .locals 5
    .param p1, "action"    # Z
    .param p2, "visibility"    # Z

    .prologue
    const/16 v4, 0x96

    const/4 v3, 0x1

    .line 397
    iget-boolean v2, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnTouchListener;->actionState:Z

    if-eq v2, p1, :cond_1

    .line 398
    iput-boolean p1, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnTouchListener;->actionState:Z

    .line 399
    if-eqz p2, :cond_0

    .line 400
    if-eqz p1, :cond_2

    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnTouchListener;->this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    invoke-static {v2}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->access$1900(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)Landroid/view/View;

    move-result-object v1

    .line 401
    .local v1, "toShow":Landroid/view/View;
    :goto_0
    if-eqz p1, :cond_3

    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnTouchListener;->this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    invoke-static {v2}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->access$2000(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)Landroid/view/View;

    move-result-object v0

    .line 402
    .local v0, "toHide":Landroid/view/View;
    :goto_1
    const/16 v2, 0x8

    invoke-static {v0, v2, v3, v4}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;IZI)V

    .line 403
    const/4 v2, 0x0

    invoke-static {v1, v2, v3, v4}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;IZI)V

    .line 405
    .end local v0    # "toHide":Landroid/view/View;
    .end local v1    # "toShow":Landroid/view/View;
    :cond_0
    if-eqz p1, :cond_4

    .line 406
    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnTouchListener;->this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    invoke-static {v2}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->access$1700(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)Landroid/animation/ObjectAnimator;

    move-result-object v2

    invoke-virtual {v2}, Landroid/animation/ObjectAnimator;->start()V

    .line 411
    :cond_1
    :goto_2
    return-void

    .line 400
    :cond_2
    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnTouchListener;->this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    invoke-static {v2}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->access$2000(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)Landroid/view/View;

    move-result-object v1

    goto :goto_0

    .line 401
    .restart local v1    # "toShow":Landroid/view/View;
    :cond_3
    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnTouchListener;->this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    invoke-static {v2}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->access$1900(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)Landroid/view/View;

    move-result-object v0

    goto :goto_1

    .line 408
    .end local v1    # "toShow":Landroid/view/View;
    :cond_4
    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnTouchListener;->this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    invoke-static {v2}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->access$1700(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)Landroid/animation/ObjectAnimator;

    move-result-object v2

    invoke-virtual {v2}, Landroid/animation/ObjectAnimator;->reverse()V

    goto :goto_2
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 12
    .param p1, "view"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/high16 v11, -0x40800000    # -1.0f

    const/4 v10, 0x0

    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 335
    iget v7, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnTouchListener;->dX:F

    cmpl-float v7, v7, v11

    if-nez v7, :cond_1

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    .line 336
    .local v4, "x":F
    :goto_0
    iget-object v7, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnTouchListener;->this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    invoke-static {v7}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->access$1400(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)Landroid/view/View;

    move-result-object v7

    invoke-virtual {v7}, Landroid/view/View;->getLeft()I

    move-result v7

    iget-object v8, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnTouchListener;->this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    invoke-static {v8}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->access$1500(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)I

    move-result v8

    add-int v2, v7, v8

    .line 337
    .local v2, "sftX":I
    int-to-float v7, v2

    add-float/2addr v7, v4

    cmpl-float v7, v7, v10

    if-lez v7, :cond_2

    move v3, v4

    .line 338
    .local v3, "translateX":F
    :goto_1
    iget-object v7, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnTouchListener;->this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    invoke-static {v7}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->access$1400(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)Landroid/view/View;

    move-result-object v7

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v8

    float-to-int v8, v8

    div-int/lit8 v8, v8, 0x2

    invoke-virtual {p0, v7, p2, v8}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnTouchListener;->isViewInActionBounds(Landroid/view/View;Landroid/view/MotionEvent;I)Z

    move-result v0

    .line 340
    .local v0, "inBounds":Z
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v7

    packed-switch v7, :pswitch_data_0

    .line 391
    invoke-virtual {p1, v6}, Landroid/view/View;->setPressed(Z)V

    move v5, v6

    .line 392
    :cond_0
    :goto_2
    return v5

    .line 335
    .end local v0    # "inBounds":Z
    .end local v2    # "sftX":I
    .end local v3    # "translateX":F
    .end local v4    # "x":F
    :cond_1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v7

    iget v8, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnTouchListener;->dX:F

    sub-float v4, v7, v8

    goto :goto_0

    .line 337
    .restart local v2    # "sftX":I
    .restart local v4    # "x":F
    :cond_2
    neg-int v7, v2

    int-to-float v3, v7

    goto :goto_1

    .line 342
    .restart local v0    # "inBounds":Z
    .restart local v3    # "translateX":F
    :pswitch_0
    iget-object v6, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnTouchListener;->this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    invoke-static {v6}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->access$1400(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)Landroid/view/View;

    move-result-object v6

    invoke-virtual {p0, v6, p2}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnTouchListener;->isViewInBounds(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 343
    iget-object v6, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnTouchListener;->this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    invoke-static {v6}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->access$900(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)Landroid/graphics/Point;

    move-result-object v1

    .line 344
    .local v1, "position":Landroid/graphics/Point;
    iget v6, v1, Landroid/graphics/Point;->x:I

    iget-object v7, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnTouchListener;->this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    invoke-static {v7}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->access$1400(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)Landroid/view/View;

    move-result-object v7

    invoke-virtual {v7}, Landroid/view/View;->getWidth()I

    move-result v7

    div-int/lit8 v7, v7, 0x2

    add-int/2addr v6, v7

    int-to-float v6, v6

    iput v6, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnTouchListener;->dX:F

    .line 346
    .end local v1    # "position":Landroid/graphics/Point;
    :cond_3
    iget-object v6, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnTouchListener;->this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    invoke-static {v6, v5}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->access$1602(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;Z)Z

    goto :goto_2

    .line 351
    :pswitch_1
    if-eqz v0, :cond_9

    .line 352
    iget-boolean v7, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnTouchListener;->actionState:Z

    if-eqz v7, :cond_8

    .line 353
    iget-object v7, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnTouchListener;->this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    invoke-static {v7}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->access$1200(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$EventListener;

    move-result-object v7

    invoke-interface {v7}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$EventListener;->onCancel()V

    .line 362
    :goto_3
    iget-object v7, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnTouchListener;->this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    invoke-static {v7}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->access$1600(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)Z

    move-result v7

    if-eqz v7, :cond_7

    .line 363
    iget-boolean v7, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnTouchListener;->actionState:Z

    if-eqz v7, :cond_4

    if-nez v0, :cond_5

    .line 364
    :cond_4
    iget-object v7, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnTouchListener;->this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    invoke-static {v7}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->access$1400(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)Landroid/view/View;

    move-result-object v7

    invoke-virtual {v7}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v7

    invoke-virtual {v7, v10}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v7

    const-wide/16 v8, 0x64

    invoke-virtual {v7, v8, v9}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v7

    invoke-virtual {v7}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 365
    iget-object v7, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnTouchListener;->this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    invoke-static {v7}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->access$1200(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$EventListener;

    move-result-object v7

    const/16 v8, 0x64

    invoke-interface {v7, v10, v8}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$EventListener;->onMove(FI)V

    .line 367
    :cond_5
    iget-boolean v7, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnTouchListener;->actionState:Z

    if-eqz v7, :cond_6

    if-nez v0, :cond_6

    .line 368
    iget-object v7, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnTouchListener;->this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    invoke-static {v7}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->access$1700(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)Landroid/animation/ObjectAnimator;

    move-result-object v7

    invoke-virtual {v7}, Landroid/animation/ObjectAnimator;->reverse()V

    .line 370
    :cond_6
    iget-object v7, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnTouchListener;->this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    invoke-static {v7, v6}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->access$1602(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;Z)Z

    .line 371
    iput v11, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnTouchListener;->dX:F

    .line 373
    :cond_7
    invoke-virtual {p1, v6}, Landroid/view/View;->setPressed(Z)V

    .line 374
    iput-boolean v6, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnTouchListener;->actionState:Z

    goto/16 :goto_2

    .line 355
    :cond_8
    iget-object v7, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnTouchListener;->this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    invoke-static {v7}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->access$1200(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$EventListener;

    move-result-object v7

    invoke-interface {v7}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$EventListener;->onSendClick()V

    goto :goto_3

    .line 358
    :cond_9
    iget-object v7, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnTouchListener;->this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    invoke-virtual {v7, v5}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->showSendIcon(Z)V

    .line 359
    iget-object v7, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnTouchListener;->this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    invoke-static {v7}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->access$1200(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$EventListener;

    move-result-object v7

    invoke-interface {v7}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$EventListener;->onRelease()V

    goto :goto_3

    .line 378
    :pswitch_2
    iget-object v7, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnTouchListener;->this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    invoke-static {v7}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->access$1600(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)Z

    move-result v7

    if-eqz v7, :cond_0

    cmpg-float v7, v4, v10

    if-gez v7, :cond_0

    .line 379
    iget-object v7, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnTouchListener;->this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    invoke-static {v7}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->access$1400(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)Landroid/view/View;

    move-result-object v7

    invoke-virtual {v7}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v7

    invoke-virtual {v7, v3}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v7

    const-wide/16 v8, 0x0

    invoke-virtual {v7, v8, v9}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v7

    invoke-virtual {v7}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 380
    iget-object v7, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnTouchListener;->this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    invoke-static {v7}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->access$1200(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$EventListener;

    move-result-object v7

    invoke-interface {v7, v3, v6}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$EventListener;->onMove(FI)V

    .line 382
    iget-boolean v7, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnTouchListener;->actionState:Z

    if-nez v7, :cond_a

    if-eqz v0, :cond_a

    invoke-static {}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->access$1800()I

    move-result v7

    int-to-float v7, v7

    add-float/2addr v7, v4

    cmpg-float v7, v7, v10

    if-gtz v7, :cond_a

    .line 383
    invoke-direct {p0, v5, v5}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnTouchListener;->changeActionState(ZZ)V

    goto/16 :goto_2

    .line 384
    :cond_a
    if-eqz v0, :cond_b

    iget-boolean v7, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnTouchListener;->actionState:Z

    if-eqz v7, :cond_0

    invoke-static {}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->access$1800()I

    move-result v7

    int-to-float v7, v7

    add-float/2addr v7, v4

    cmpl-float v7, v7, v10

    if-lez v7, :cond_0

    .line 385
    :cond_b
    invoke-direct {p0, v6, v5}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnTouchListener;->changeActionState(ZZ)V

    goto/16 :goto_2

    .line 340
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method
