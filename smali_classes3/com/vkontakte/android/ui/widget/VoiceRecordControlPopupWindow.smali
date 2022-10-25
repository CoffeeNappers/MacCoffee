.class public Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;
.super Ljava/lang/Object;
.source "VoiceRecordControlPopupWindow.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$EventListener;,
        Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$AnimatedPopupWindow;,
        Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OutsideTouchListener;,
        Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$TouchInBoundsListener;,
        Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$DismissTouchListener;,
        Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnTouchListener;,
        Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnSendClickListener;,
        Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnLayoutChangeListener;
    }
.end annotation


# static fields
.field private static final DISTANCE_ACTION:I

.field private static final PANEL_NAV_HEIGHT:I


# instance fields
.field private final actionColor:I

.field private final anchorView:Landroid/view/View;

.field private animStartTime:J

.field private cancelButton:Landroid/view/View;

.field private content:Landroid/view/View;

.field private final context:Landroid/content/Context;

.field private final defaultColor:I

.field private dismissArea:Landroid/view/View;

.field private dismissButton:Landroid/view/View;

.field private final height:I

.field private isAnimate:Z

.field private isDragging:Z

.field private final listener:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$EventListener;

.field private paintAnimator:Landroid/animation/ObjectAnimator;

.field private popupWindow:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$AnimatedPopupWindow;

.field private recButton:Landroid/view/View;

.field private scaleAnimator:Landroid/animation/AnimatorSet;

.field private sendButton:Landroid/view/View;

.field private final shiftX:I

.field private final shiftYHor:I

.field private final shiftYVert:I

.field private waveShadowView:Landroid/view/View;

.field private waveformRecordView:Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;

.field private final width:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 34
    const/high16 v0, 0x42400000    # 48.0f

    invoke-static {v0}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v0

    sput v0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->PANEL_NAV_HEIGHT:I

    .line 35
    const/high16 v0, 0x42a00000    # 80.0f

    invoke-static {v0}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v0

    sput v0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->DISTANCE_ACTION:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/view/View;Landroid/view/View;Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$EventListener;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "anchorView"    # Landroid/view/View;
    .param p3, "dismissButton"    # Landroid/view/View;
    .param p4, "listener"    # Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$EventListener;

    .prologue
    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    iput-object p1, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->context:Landroid/content/Context;

    .line 68
    iput-object p4, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->listener:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$EventListener;

    .line 69
    iput-object p2, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->anchorView:Landroid/view/View;

    .line 70
    iput-object p3, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->dismissButton:Landroid/view/View;

    .line 71
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0f00d1

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->actionColor:I

    .line 72
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0f0018

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->defaultColor:I

    .line 73
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f090039

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->width:I

    .line 74
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f090033

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->height:I

    .line 75
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f090035

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->shiftX:I

    .line 76
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f090036

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->shiftYHor:I

    .line 77
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f090037

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->shiftYVert:I

    .line 78
    return-void
.end method

.method static synthetic access$1000(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->anchorView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    .prologue
    .line 32
    iget v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->height:I

    return v0
.end method

.method static synthetic access$1200(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$EventListener;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->listener:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$EventListener;

    return-object v0
.end method

.method static synthetic access$1400(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->content:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$1500(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    .prologue
    .line 32
    iget v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->shiftX:I

    return v0
.end method

.method static synthetic access$1600(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    .prologue
    .line 32
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->isDragging:Z

    return v0
.end method

.method static synthetic access$1602(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;
    .param p1, "x1"    # Z

    .prologue
    .line 32
    iput-boolean p1, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->isDragging:Z

    return p1
.end method

.method static synthetic access$1700(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)Landroid/animation/ObjectAnimator;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->paintAnimator:Landroid/animation/ObjectAnimator;

    return-object v0
.end method

.method static synthetic access$1800()I
    .locals 1

    .prologue
    .line 32
    sget v0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->DISTANCE_ACTION:I

    return v0
.end method

.method static synthetic access$1900(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->cancelButton:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$2000(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->recButton:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$2100(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->dismissButton:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$2200(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->dismissArea:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$2300(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    .prologue
    .line 32
    invoke-direct {p0}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->closeSystemDialogs()V

    return-void
.end method

.method static synthetic access$2400(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    .prologue
    .line 32
    iget v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->defaultColor:I

    return v0
.end method

.method static synthetic access$2500(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->waveformRecordView:Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;

    return-object v0
.end method

.method static synthetic access$500(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)Landroid/animation/AnimatorSet;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->scaleAnimator:Landroid/animation/AnimatorSet;

    return-object v0
.end method

.method static synthetic access$602(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;J)J
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;
    .param p1, "x1"    # J

    .prologue
    .line 32
    iput-wide p1, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->animStartTime:J

    return-wide p1
.end method

.method static synthetic access$702(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;
    .param p1, "x1"    # Z

    .prologue
    .line 32
    iput-boolean p1, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->isAnimate:Z

    return p1
.end method

.method static synthetic access$800(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$AnimatedPopupWindow;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->popupWindow:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$AnimatedPopupWindow;

    return-object v0
.end method

.method static synthetic access$900(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)Landroid/graphics/Point;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    .prologue
    .line 32
    invoke-direct {p0}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->calcPopupPosition()Landroid/graphics/Point;

    move-result-object v0

    return-object v0
.end method

.method private animate(Z)V
    .locals 24
    .param p1, "show"    # Z

    .prologue
    .line 168
    move-object/from16 v0, p0

    iget-boolean v15, v0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->isAnimate:Z

    if-eqz v15, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v18

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->animStartTime:J

    move-wide/from16 v20, v0

    sub-long v16, v18, v20

    .line 169
    .local v16, "time":J
    :goto_0
    if-eqz p1, :cond_1

    const/4 v9, 0x0

    .line 170
    .local v9, "scaleStart":F
    :goto_1
    if-eqz p1, :cond_3

    const/high16 v8, 0x3f800000    # 1.0f

    .line 171
    .local v8, "scaleEnd":F
    :goto_2
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->content:Landroid/view/View;

    move-object/from16 v0, p0

    invoke-direct {v0, v15}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->calcContentShift(Landroid/view/View;)Landroid/graphics/PointF;

    move-result-object v10

    .line 172
    .local v10, "shift":Landroid/graphics/PointF;
    if-eqz p1, :cond_4

    iget v13, v10, Landroid/graphics/PointF;->x:F

    .line 173
    .local v13, "shiftStartX":F
    :goto_3
    if-eqz p1, :cond_6

    iget v14, v10, Landroid/graphics/PointF;->y:F

    .line 174
    .local v14, "shiftStartY":F
    :goto_4
    if-eqz p1, :cond_8

    const/4 v11, 0x0

    .line 175
    .local v11, "shiftEndX":F
    :goto_5
    if-eqz p1, :cond_9

    const/4 v12, 0x0

    .line 177
    .local v12, "shiftEndY":F
    :goto_6
    const-wide/16 v18, 0x0

    cmp-long v15, v16, v18

    if-nez v15, :cond_a

    const-wide/16 v6, 0xc8

    .line 178
    .local v6, "scaleDuration":J
    :goto_7
    if-eqz p1, :cond_b

    const/4 v5, 0x0

    .line 180
    .local v5, "scaleDelay":I
    :goto_8
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->recButton:Landroid/view/View;

    invoke-static {v15}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->isViewVisible(Landroid/view/View;)Z

    move-result v15

    if-eqz v15, :cond_d

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->recButton:Landroid/view/View;

    .line 181
    .local v4, "curBtn":Landroid/view/View;
    :goto_9
    new-instance v15, Landroid/animation/AnimatorSet;

    invoke-direct {v15}, Landroid/animation/AnimatorSet;-><init>()V

    move-object/from16 v0, p0

    iput-object v15, v0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->scaleAnimator:Landroid/animation/AnimatorSet;

    .line 182
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->scaleAnimator:Landroid/animation/AnimatorSet;

    const/16 v18, 0xc

    move/from16 v0, v18

    new-array v0, v0, [Landroid/animation/Animator;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    sget-object v20, Landroid/view/View;->SCALE_X:Landroid/util/Property;

    const/16 v21, 0x2

    move/from16 v0, v21

    new-array v0, v0, [F

    move-object/from16 v21, v0

    const/16 v22, 0x0

    aput v9, v21, v22

    const/16 v22, 0x1

    aput v8, v21, v22

    .line 183
    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-static {v4, v0, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v20

    aput-object v20, v18, v19

    const/16 v19, 0x1

    sget-object v20, Landroid/view/View;->SCALE_Y:Landroid/util/Property;

    const/16 v21, 0x2

    move/from16 v0, v21

    new-array v0, v0, [F

    move-object/from16 v21, v0

    const/16 v22, 0x0

    aput v9, v21, v22

    const/16 v22, 0x1

    aput v8, v21, v22

    .line 184
    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-static {v4, v0, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v20

    aput-object v20, v18, v19

    const/16 v19, 0x2

    sget-object v20, Landroid/view/View;->TRANSLATION_X:Landroid/util/Property;

    const/16 v21, 0x2

    move/from16 v0, v21

    new-array v0, v0, [F

    move-object/from16 v21, v0

    const/16 v22, 0x0

    aput v13, v21, v22

    const/16 v22, 0x1

    aput v11, v21, v22

    .line 185
    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-static {v4, v0, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v20

    aput-object v20, v18, v19

    const/16 v19, 0x3

    sget-object v20, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    const/16 v21, 0x2

    move/from16 v0, v21

    new-array v0, v0, [F

    move-object/from16 v21, v0

    const/16 v22, 0x0

    aput v14, v21, v22

    const/16 v22, 0x1

    aput v12, v21, v22

    .line 186
    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-static {v4, v0, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v20

    aput-object v20, v18, v19

    const/16 v19, 0x4

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->waveShadowView:Landroid/view/View;

    move-object/from16 v20, v0

    sget-object v21, Landroid/view/View;->SCALE_X:Landroid/util/Property;

    const/16 v22, 0x2

    move/from16 v0, v22

    new-array v0, v0, [F

    move-object/from16 v22, v0

    const/16 v23, 0x0

    aput v9, v22, v23

    const/16 v23, 0x1

    aput v8, v22, v23

    .line 187
    invoke-static/range {v20 .. v22}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v20

    aput-object v20, v18, v19

    const/16 v19, 0x5

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->waveShadowView:Landroid/view/View;

    move-object/from16 v20, v0

    sget-object v21, Landroid/view/View;->SCALE_Y:Landroid/util/Property;

    const/16 v22, 0x2

    move/from16 v0, v22

    new-array v0, v0, [F

    move-object/from16 v22, v0

    const/16 v23, 0x0

    aput v9, v22, v23

    const/16 v23, 0x1

    aput v8, v22, v23

    .line 188
    invoke-static/range {v20 .. v22}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v20

    aput-object v20, v18, v19

    const/16 v19, 0x6

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->waveShadowView:Landroid/view/View;

    move-object/from16 v20, v0

    sget-object v21, Landroid/view/View;->TRANSLATION_X:Landroid/util/Property;

    const/16 v22, 0x2

    move/from16 v0, v22

    new-array v0, v0, [F

    move-object/from16 v22, v0

    const/16 v23, 0x0

    aput v13, v22, v23

    const/16 v23, 0x1

    aput v11, v22, v23

    .line 189
    invoke-static/range {v20 .. v22}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v20

    aput-object v20, v18, v19

    const/16 v19, 0x7

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->waveShadowView:Landroid/view/View;

    move-object/from16 v20, v0

    sget-object v21, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    const/16 v22, 0x2

    move/from16 v0, v22

    new-array v0, v0, [F

    move-object/from16 v22, v0

    const/16 v23, 0x0

    aput v14, v22, v23

    const/16 v23, 0x1

    aput v12, v22, v23

    .line 190
    invoke-static/range {v20 .. v22}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v20

    aput-object v20, v18, v19

    const/16 v19, 0x8

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->waveformRecordView:Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;

    move-object/from16 v20, v0

    sget-object v21, Landroid/view/View;->SCALE_X:Landroid/util/Property;

    const/16 v22, 0x2

    move/from16 v0, v22

    new-array v0, v0, [F

    move-object/from16 v22, v0

    const/16 v23, 0x0

    aput v9, v22, v23

    const/16 v23, 0x1

    aput v8, v22, v23

    .line 191
    invoke-static/range {v20 .. v22}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v20

    aput-object v20, v18, v19

    const/16 v19, 0x9

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->waveformRecordView:Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;

    move-object/from16 v20, v0

    sget-object v21, Landroid/view/View;->SCALE_Y:Landroid/util/Property;

    const/16 v22, 0x2

    move/from16 v0, v22

    new-array v0, v0, [F

    move-object/from16 v22, v0

    const/16 v23, 0x0

    aput v9, v22, v23

    const/16 v23, 0x1

    aput v8, v22, v23

    .line 192
    invoke-static/range {v20 .. v22}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v20

    aput-object v20, v18, v19

    const/16 v19, 0xa

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->waveformRecordView:Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;

    move-object/from16 v20, v0

    sget-object v21, Landroid/view/View;->TRANSLATION_X:Landroid/util/Property;

    const/16 v22, 0x2

    move/from16 v0, v22

    new-array v0, v0, [F

    move-object/from16 v22, v0

    const/16 v23, 0x0

    aput v13, v22, v23

    const/16 v23, 0x1

    aput v11, v22, v23

    .line 193
    invoke-static/range {v20 .. v22}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v20

    aput-object v20, v18, v19

    const/16 v19, 0xb

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->waveformRecordView:Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;

    move-object/from16 v20, v0

    sget-object v21, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    const/16 v22, 0x2

    move/from16 v0, v22

    new-array v0, v0, [F

    move-object/from16 v22, v0

    const/16 v23, 0x0

    aput v14, v22, v23

    const/16 v23, 0x1

    aput v12, v22, v23

    .line 194
    invoke-static/range {v20 .. v22}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v20

    aput-object v20, v18, v19

    .line 182
    move-object/from16 v0, v18

    invoke-virtual {v15, v0}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 196
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->scaleAnimator:Landroid/animation/AnimatorSet;

    new-instance v18, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$1;

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    move/from16 v2, p1

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$1;-><init>(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;Z)V

    move-object/from16 v0, v18

    invoke-virtual {v15, v0}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 216
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->scaleAnimator:Landroid/animation/AnimatorSet;

    int-to-long v0, v5

    move-wide/from16 v18, v0

    move-wide/from16 v0, v18

    invoke-virtual {v15, v0, v1}, Landroid/animation/AnimatorSet;->setStartDelay(J)V

    .line 217
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->scaleAnimator:Landroid/animation/AnimatorSet;

    invoke-virtual {v15, v6, v7}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 218
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->scaleAnimator:Landroid/animation/AnimatorSet;

    invoke-virtual {v15}, Landroid/animation/AnimatorSet;->start()V

    .line 219
    return-void

    .line 168
    .end local v4    # "curBtn":Landroid/view/View;
    .end local v5    # "scaleDelay":I
    .end local v6    # "scaleDuration":J
    .end local v8    # "scaleEnd":F
    .end local v9    # "scaleStart":F
    .end local v10    # "shift":Landroid/graphics/PointF;
    .end local v11    # "shiftEndX":F
    .end local v12    # "shiftEndY":F
    .end local v13    # "shiftStartX":F
    .end local v14    # "shiftStartY":F
    .end local v16    # "time":J
    :cond_0
    const-wide/16 v16, 0x0

    goto/16 :goto_0

    .line 169
    .restart local v16    # "time":J
    :cond_1
    move-object/from16 v0, p0

    iget-boolean v15, v0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->isAnimate:Z

    if-eqz v15, :cond_2

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->waveformRecordView:Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;

    invoke-virtual {v15}, Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;->getScaleX()F

    move-result v9

    goto/16 :goto_1

    :cond_2
    const/high16 v9, 0x3f800000    # 1.0f

    goto/16 :goto_1

    .line 170
    .restart local v9    # "scaleStart":F
    :cond_3
    const/4 v8, 0x0

    goto/16 :goto_2

    .line 172
    .restart local v8    # "scaleEnd":F
    .restart local v10    # "shift":Landroid/graphics/PointF;
    :cond_4
    move-object/from16 v0, p0

    iget-boolean v15, v0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->isAnimate:Z

    if-eqz v15, :cond_5

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->waveformRecordView:Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;

    invoke-virtual {v15}, Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;->getTranslationX()F

    move-result v13

    goto/16 :goto_3

    :cond_5
    const/4 v13, 0x0

    goto/16 :goto_3

    .line 173
    .restart local v13    # "shiftStartX":F
    :cond_6
    move-object/from16 v0, p0

    iget-boolean v15, v0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->isAnimate:Z

    if-eqz v15, :cond_7

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->waveformRecordView:Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;

    invoke-virtual {v15}, Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;->getTranslationY()F

    move-result v14

    goto/16 :goto_4

    :cond_7
    const/4 v14, 0x0

    goto/16 :goto_4

    .line 174
    .restart local v14    # "shiftStartY":F
    :cond_8
    iget v11, v10, Landroid/graphics/PointF;->x:F

    goto/16 :goto_5

    .line 175
    .restart local v11    # "shiftEndX":F
    :cond_9
    iget v12, v10, Landroid/graphics/PointF;->y:F

    goto/16 :goto_6

    .restart local v12    # "shiftEndY":F
    :cond_a
    move-wide/from16 v6, v16

    .line 177
    goto/16 :goto_7

    .line 178
    .restart local v6    # "scaleDuration":J
    :cond_b
    const-wide/16 v18, 0x0

    cmp-long v15, v16, v18

    if-nez v15, :cond_c

    const/16 v5, 0x64

    goto/16 :goto_8

    :cond_c
    const/4 v5, 0x0

    goto/16 :goto_8

    .line 180
    .restart local v5    # "scaleDelay":I
    :cond_d
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->sendButton:Landroid/view/View;

    invoke-static {v15}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->isViewVisible(Landroid/view/View;)Z

    move-result v15

    if-eqz v15, :cond_e

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->sendButton:Landroid/view/View;

    goto/16 :goto_9

    :cond_e
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->cancelButton:Landroid/view/View;

    goto/16 :goto_9
.end method

.method private calcContentShift(Landroid/view/View;)Landroid/graphics/PointF;
    .locals 10
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const/4 v6, 0x0

    .line 247
    const/4 v7, 0x2

    new-array v2, v7, [I

    .line 248
    .local v2, "location":[I
    iget-object v7, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->anchorView:Landroid/view/View;

    invoke-virtual {v7, v2}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 249
    aget v7, v2, v6

    iget-object v8, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->anchorView:Landroid/view/View;

    invoke-virtual {v8}, Landroid/view/View;->getWidth()I

    move-result v8

    div-int/lit8 v8, v8, 0x2

    add-int v0, v7, v8

    .line 250
    .local v0, "anchorCenterX":I
    const/4 v7, 0x1

    aget v7, v2, v7

    iget-object v8, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->anchorView:Landroid/view/View;

    invoke-virtual {v8}, Landroid/view/View;->getHeight()I

    move-result v8

    div-int/lit8 v8, v8, 0x2

    add-int v1, v7, v8

    .line 251
    .local v1, "anchorCenterY":I
    invoke-direct {p0}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->calcPopupPosition()Landroid/graphics/Point;

    move-result-object v3

    .line 252
    .local v3, "popup":Landroid/graphics/Point;
    iget v7, v3, Landroid/graphics/Point;->x:I

    iget v8, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->width:I

    div-int/lit8 v8, v8, 0x2

    add-int/2addr v7, v8

    invoke-virtual {p1}, Landroid/view/View;->getTranslationX()F

    move-result v8

    const/4 v9, 0x0

    cmpl-float v8, v8, v9

    if-nez v8, :cond_0

    iget v6, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->shiftX:I

    :cond_0
    sub-int v4, v7, v6

    .line 253
    .local v4, "viewCenterX":I
    iget v6, v3, Landroid/graphics/Point;->y:I

    iget v7, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->height:I

    div-int/lit8 v7, v7, 0x2

    add-int v5, v6, v7

    .line 254
    .local v5, "viewCenterY":I
    new-instance v6, Landroid/graphics/PointF;

    sub-int v7, v0, v4

    int-to-float v7, v7

    sub-int v8, v1, v5

    int-to-float v8, v8

    invoke-direct {v6, v7, v8}, Landroid/graphics/PointF;-><init>(FF)V

    return-object v6
.end method

.method private calcPopupPosition()Landroid/graphics/Point;
    .locals 8

    .prologue
    .line 236
    const/4 v6, 0x2

    new-array v1, v6, [I

    .line 237
    .local v1, "location":[I
    iget-object v6, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->anchorView:Landroid/view/View;

    invoke-virtual {v6, v1}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 238
    iget-object v6, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->context:Landroid/content/Context;

    invoke-static {v6}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->getRealScreenSize(Landroid/content/Context;)Landroid/graphics/Point;

    move-result-object v6

    iget v2, v6, Landroid/graphics/Point;->y:I

    .line 239
    .local v2, "screenHeight":I
    const/4 v6, 0x1

    aget v6, v1, v6

    iget-object v7, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->anchorView:Landroid/view/View;

    invoke-virtual {v7}, Landroid/view/View;->getHeight()I

    move-result v7

    add-int v0, v6, v7

    .line 240
    .local v0, "bottom":I
    sub-int v6, v2, v0

    sget v7, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->PANEL_NAV_HEIGHT:I

    if-lt v6, v7, :cond_0

    iget v3, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->shiftYVert:I

    .line 241
    .local v3, "shift":I
    :goto_0
    iget v6, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->height:I

    sub-int v6, v0, v6

    add-int v5, v6, v3

    .line 242
    .local v5, "y":I
    const/4 v6, 0x0

    aget v6, v1, v6

    iget-object v7, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->anchorView:Landroid/view/View;

    invoke-virtual {v7}, Landroid/view/View;->getWidth()I

    move-result v7

    div-int/lit8 v7, v7, 0x2

    sub-int v4, v6, v7

    .line 243
    .local v4, "x":I
    new-instance v6, Landroid/graphics/Point;

    invoke-direct {v6, v4, v5}, Landroid/graphics/Point;-><init>(II)V

    return-object v6

    .line 240
    .end local v3    # "shift":I
    .end local v4    # "x":I
    .end local v5    # "y":I
    :cond_0
    iget v3, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->shiftYHor:I

    goto :goto_0
.end method

.method private closeSystemDialogs()V
    .locals 3

    .prologue
    .line 258
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->context:Landroid/content/Context;

    if-eqz v0, :cond_0

    .line 259
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->context:Landroid/content/Context;

    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "android.intent.action.CLOSE_SYSTEM_DIALOGS"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 261
    :cond_0
    return-void
.end method

.method private static getRealScreenSize(Landroid/content/Context;)Landroid/graphics/Point;
    .locals 8
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 278
    const-string/jumbo v5, "window"

    invoke-virtual {p0, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/WindowManager;

    .line 279
    .local v4, "windowManager":Landroid/view/WindowManager;
    invoke-interface {v4}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    .line 281
    .local v0, "display":Landroid/view/Display;
    invoke-static {}, Lcom/vkontakte/android/utils/OsUtil;->isAtLeastJB_MR1()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 282
    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->getRealScreenSize(Landroid/view/Display;)Landroid/graphics/Point;

    move-result-object v3

    .line 291
    :goto_0
    return-object v3

    .line 285
    :cond_0
    :try_start_0
    new-instance v3, Landroid/graphics/Point;

    invoke-direct {v3}, Landroid/graphics/Point;-><init>()V

    .line 286
    .local v3, "size":Landroid/graphics/Point;
    const-class v5, Landroid/view/Display;

    const-string/jumbo v6, "getRawWidth"

    const/4 v7, 0x0

    new-array v7, v7, [Ljava/lang/Class;

    invoke-virtual {v5, v6, v7}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    const/4 v6, 0x0

    new-array v6, v6, [Ljava/lang/Object;

    invoke-virtual {v5, v0, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    iput v5, v3, Landroid/graphics/Point;->x:I

    .line 287
    const-class v5, Landroid/view/Display;

    const-string/jumbo v6, "getRawHeight"

    const/4 v7, 0x0

    new-array v7, v7, [Ljava/lang/Class;

    invoke-virtual {v5, v6, v7}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    const/4 v6, 0x0

    new-array v6, v6, [Ljava/lang/Object;

    invoke-virtual {v5, v0, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    iput v5, v3, Landroid/graphics/Point;->y:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 289
    .end local v3    # "size":Landroid/graphics/Point;
    :catch_0
    move-exception v1

    .line 290
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    .line 291
    .local v2, "metrics":Landroid/util/DisplayMetrics;
    new-instance v3, Landroid/graphics/Point;

    iget v5, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    iget v6, v2, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-direct {v3, v5, v6}, Landroid/graphics/Point;-><init>(II)V

    goto :goto_0
.end method

.method private static getRealScreenSize(Landroid/view/Display;)Landroid/graphics/Point;
    .locals 1
    .param p0, "display"    # Landroid/view/Display;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .prologue
    .line 298
    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    .line 299
    .local v0, "size":Landroid/graphics/Point;
    invoke-virtual {p0, v0}, Landroid/view/Display;->getRealSize(Landroid/graphics/Point;)V

    .line 300
    return-object v0
.end method

.method private init()V
    .locals 10

    .prologue
    const/4 v9, 0x2

    const/4 v6, -0x1

    const/4 v5, 0x1

    const/4 v8, 0x0

    const/4 v4, 0x0

    .line 81
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->context:Landroid/content/Context;

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f030236

    invoke-virtual {v0, v1, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    .line 82
    .local v2, "layout":Landroid/view/View;
    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v0, v6, v6}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 83
    new-instance v0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OutsideTouchListener;

    invoke-direct {v0, p0, v4}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OutsideTouchListener;-><init>(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$1;)V

    invoke-virtual {v2, v0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 85
    const v0, 0x7f10000e

    invoke-virtual {v2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->content:Landroid/view/View;

    .line 86
    const v0, 0x7f10059b

    invoke-virtual {v2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->recButton:Landroid/view/View;

    .line 87
    const v0, 0x7f100313

    invoke-virtual {v2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->sendButton:Landroid/view/View;

    .line 88
    const v0, 0x7f10059c

    invoke-virtual {v2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->cancelButton:Landroid/view/View;

    .line 89
    const v0, 0x7f100599

    invoke-virtual {v2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->waveShadowView:Landroid/view/View;

    .line 90
    const v0, 0x7f10059d

    invoke-virtual {v2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->dismissArea:Landroid/view/View;

    .line 91
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->dismissArea:Landroid/view/View;

    new-instance v1, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$DismissTouchListener;

    invoke-direct {v1, p0, v4}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$DismissTouchListener;-><init>(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$1;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 92
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->sendButton:Landroid/view/View;

    new-instance v1, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnSendClickListener;

    invoke-direct {v1, p0, v4}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnSendClickListener;-><init>(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$1;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 93
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->recButton:Landroid/view/View;

    new-instance v1, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnTouchListener;

    invoke-direct {v1, p0, v4}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnTouchListener;-><init>(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$1;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 94
    const v0, 0x7f10059a

    invoke-virtual {v2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->waveformRecordView:Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;

    .line 95
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->anchorView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnLayoutChangeListener;

    invoke-direct {v1, p0, v4}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnLayoutChangeListener;-><init>(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$1;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 97
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->waveformRecordView:Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;

    const-string/jumbo v1, "paintColor"

    new-instance v4, Landroid/animation/ArgbEvaluator;

    invoke-direct {v4}, Landroid/animation/ArgbEvaluator;-><init>()V

    new-array v6, v9, [Ljava/lang/Object;

    iget v7, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->defaultColor:I

    .line 98
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v8

    iget v7, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->actionColor:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v5

    .line 97
    invoke-static {v0, v1, v4, v6}, Landroid/animation/ObjectAnimator;->ofObject(Ljava/lang/Object;Ljava/lang/String;Landroid/animation/TypeEvaluator;[Ljava/lang/Object;)Landroid/animation/ObjectAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->paintAnimator:Landroid/animation/ObjectAnimator;

    .line 100
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->anchorView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getWidth()I

    move-result v3

    .line 101
    .local v3, "width":I
    new-instance v0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$AnimatedPopupWindow;

    iget v4, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->height:I

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$AnimatedPopupWindow;-><init>(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;Landroid/view/View;IIZ)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->popupWindow:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$AnimatedPopupWindow;

    .line 102
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->popupWindow:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$AnimatedPopupWindow;

    invoke-virtual {v0, v9}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$AnimatedPopupWindow;->setInputMethodMode(I)V

    .line 103
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->popupWindow:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$AnimatedPopupWindow;

    new-instance v1, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v1}, Landroid/graphics/drawable/BitmapDrawable;-><init>()V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$AnimatedPopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 104
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->popupWindow:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$AnimatedPopupWindow;

    invoke-virtual {v0, v8}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$AnimatedPopupWindow;->setOutsideTouchable(Z)V

    .line 105
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->popupWindow:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$AnimatedPopupWindow;

    invoke-virtual {v0, v8}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$AnimatedPopupWindow;->setClippingEnabled(Z)V

    .line 106
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->popupWindow:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$AnimatedPopupWindow;

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$AnimatedPopupWindow;->setTouchable(Z)V

    .line 107
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->waveformRecordView:Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;

    const v1, 0x3fe66666    # 1.8f

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;->setScale(F)V

    .line 108
    return-void
.end method

.method private static isViewVisible(Landroid/view/View;)Z
    .locals 1
    .param p0, "view"    # Landroid/view/View;

    .prologue
    .line 265
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static resetButtonView(Landroid/view/View;Z)V
    .locals 3
    .param p0, "view"    # Landroid/view/View;
    .param p1, "show"    # Z

    .prologue
    const v2, 0x3dcccccd    # 0.1f

    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v0, 0x0

    .line 269
    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 270
    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 271
    if-eqz p1, :cond_0

    move v0, v1

    :cond_0
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 272
    if-eqz p1, :cond_1

    move v0, v1

    :goto_0
    invoke-virtual {p0, v0}, Landroid/view/View;->setScaleX(F)V

    .line 273
    if-eqz p1, :cond_2

    :goto_1
    invoke-virtual {p0, v1}, Landroid/view/View;->setScaleY(F)V

    .line 274
    if-eqz p1, :cond_3

    const/4 v0, 0x0

    :goto_2
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 275
    return-void

    :cond_1
    move v0, v2

    .line 272
    goto :goto_0

    :cond_2
    move v1, v2

    .line 273
    goto :goto_1

    .line 274
    :cond_3
    const/16 v0, 0x8

    goto :goto_2
.end method


# virtual methods
.method public dismiss()V
    .locals 1

    .prologue
    .line 154
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->popupWindow:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$AnimatedPopupWindow;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->popupWindow:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$AnimatedPopupWindow;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$AnimatedPopupWindow;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 155
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->popupWindow:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$AnimatedPopupWindow;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$AnimatedPopupWindow;->dismissSuper()V

    .line 157
    :cond_0
    return-void
.end method

.method public getRecButtonView()Landroid/view/View;
    .locals 1

    .prologue
    .line 164
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->recButton:Landroid/view/View;

    return-object v0
.end method

.method public hide()V
    .locals 1

    .prologue
    .line 148
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->popupWindow:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$AnimatedPopupWindow;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->popupWindow:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$AnimatedPopupWindow;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$AnimatedPopupWindow;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 149
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->animate(Z)V

    .line 151
    :cond_0
    return-void
.end method

.method public isShowing()Z
    .locals 1

    .prologue
    .line 160
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->popupWindow:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$AnimatedPopupWindow;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->popupWindow:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$AnimatedPopupWindow;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$AnimatedPopupWindow;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method synthetic lambda$show$0()V
    .locals 4

    .prologue
    .line 116
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->dismissButton:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-nez v1, :cond_0

    .line 117
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->dismissArea:Landroid/view/View;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 118
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->dismissButton:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v1

    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->dismissArea:Landroid/view/View;

    .line 119
    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f090038

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    invoke-direct {v0, v1, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 120
    .local v0, "params":Landroid/widget/FrameLayout$LayoutParams;
    const/16 v1, 0x10

    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 121
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->dismissArea:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 123
    .end local v0    # "params":Landroid/widget/FrameLayout$LayoutParams;
    :cond_0
    return-void
.end method

.method public setAmplitude(Ljava/lang/Double;)V
    .locals 1
    .param p1, "amplitude"    # Ljava/lang/Double;

    .prologue
    .line 222
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->waveformRecordView:Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;

    if-eqz v0, :cond_0

    .line 223
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->waveformRecordView:Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;->setAmplitude(Ljava/lang/Double;)V

    .line 225
    :cond_0
    return-void
.end method

.method public show()V
    .locals 9

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 111
    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->popupWindow:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$AnimatedPopupWindow;

    if-nez v3, :cond_0

    .line 112
    invoke-direct {p0}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->init()V

    .line 115
    :cond_0
    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->dismissButton:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v3

    invoke-static {p0}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 125
    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->recButton:Landroid/view/View;

    invoke-static {v3, v8}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->resetButtonView(Landroid/view/View;Z)V

    .line 126
    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->sendButton:Landroid/view/View;

    invoke-static {v3, v7}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->resetButtonView(Landroid/view/View;Z)V

    .line 127
    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->cancelButton:Landroid/view/View;

    invoke-static {v3, v7}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->resetButtonView(Landroid/view/View;Z)V

    .line 128
    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->waveShadowView:Landroid/view/View;

    invoke-static {v3, v8}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->resetButtonView(Landroid/view/View;Z)V

    .line 129
    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->content:Landroid/view/View;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/view/View;->setTranslationX(F)V

    .line 131
    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->anchorView:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 132
    invoke-direct {p0}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->calcPopupPosition()Landroid/graphics/Point;

    move-result-object v2

    .line 133
    .local v2, "position":Landroid/graphics/Point;
    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->anchorView:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 134
    .local v0, "parent":Landroid/view/ViewGroup;
    const/4 v3, 0x2

    new-array v1, v3, [I

    .line 135
    .local v1, "parentLocation":[I
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getLocationOnScreen([I)V

    .line 137
    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->popupWindow:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$AnimatedPopupWindow;

    invoke-virtual {v3}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$AnimatedPopupWindow;->isShowing()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 138
    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->popupWindow:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$AnimatedPopupWindow;

    aget v4, v1, v7

    iget v5, v2, Landroid/graphics/Point;->y:I

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getWidth()I

    move-result v6

    iget v7, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->height:I

    invoke-virtual {v3, v4, v5, v6, v7}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$AnimatedPopupWindow;->update(IIII)V

    .line 145
    .end local v0    # "parent":Landroid/view/ViewGroup;
    .end local v1    # "parentLocation":[I
    .end local v2    # "position":Landroid/graphics/Point;
    :cond_1
    :goto_0
    return-void

    .line 140
    .restart local v0    # "parent":Landroid/view/ViewGroup;
    .restart local v1    # "parentLocation":[I
    .restart local v2    # "position":Landroid/graphics/Point;
    :cond_2
    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->popupWindow:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$AnimatedPopupWindow;

    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->anchorView:Landroid/view/View;

    aget v5, v1, v7

    iget v6, v2, Landroid/graphics/Point;->y:I

    invoke-virtual {v3, v4, v7, v5, v6}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$AnimatedPopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 141
    iput-boolean v8, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->isDragging:Z

    .line 142
    invoke-direct {p0, v8}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->animate(Z)V

    goto :goto_0
.end method

.method public showSendIcon(Z)V
    .locals 6
    .param p1, "show"    # Z

    .prologue
    const/16 v5, 0x96

    const/16 v4, 0x8

    const/4 v3, 0x1

    .line 228
    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->recButton:Landroid/view/View;

    .line 229
    .local v0, "toHide":Landroid/view/View;
    :goto_0
    if-eqz p1, :cond_1

    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->sendButton:Landroid/view/View;

    .line 230
    .local v1, "toShow":Landroid/view/View;
    :goto_1
    invoke-static {v0, v4, v3, v5}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;IZI)V

    .line 231
    const/4 v2, 0x0

    invoke-static {v1, v2, v3, v5}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;IZI)V

    .line 232
    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->cancelButton:Landroid/view/View;

    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    .line 233
    return-void

    .line 228
    .end local v0    # "toHide":Landroid/view/View;
    .end local v1    # "toShow":Landroid/view/View;
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->sendButton:Landroid/view/View;

    goto :goto_0

    .line 229
    .restart local v0    # "toHide":Landroid/view/View;
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->recButton:Landroid/view/View;

    goto :goto_1
.end method
