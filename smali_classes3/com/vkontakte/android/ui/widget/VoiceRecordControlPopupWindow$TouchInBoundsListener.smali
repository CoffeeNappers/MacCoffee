.class abstract Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$TouchInBoundsListener;
.super Ljava/lang/Object;
.source "VoiceRecordControlPopupWindow.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "TouchInBoundsListener"
.end annotation


# instance fields
.field private location:[I

.field private outRect:Landroid/graphics/Rect;

.field final synthetic this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)V
    .locals 1

    .prologue
    .line 439
    iput-object p1, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$TouchInBoundsListener;->this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 440
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$TouchInBoundsListener;->outRect:Landroid/graphics/Rect;

    .line 441
    const/4 v0, 0x2

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$TouchInBoundsListener;->location:[I

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;
    .param p2, "x1"    # Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$1;

    .prologue
    .line 439
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$TouchInBoundsListener;-><init>(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)V

    return-void
.end method


# virtual methods
.method protected isViewInActionBounds(Landroid/view/View;Landroid/view/MotionEvent;I)Z
    .locals 3
    .param p1, "view"    # Landroid/view/View;
    .param p2, "motionEvent"    # Landroid/view/MotionEvent;
    .param p3, "margin"    # I

    .prologue
    const/4 v0, 0x1

    .line 451
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$TouchInBoundsListener;->location:[I

    invoke-virtual {p1, v1}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 452
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$TouchInBoundsListener;->location:[I

    aget v1, v1, v0

    sub-int/2addr v1, p3

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result v2

    float-to-int v2, v2

    if-gt v1, v2, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$TouchInBoundsListener;->location:[I

    aget v1, v1, v0

    .line 453
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v2

    add-int/2addr v1, v2

    add-int/2addr v1, p3

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result v2

    float-to-int v2, v2

    if-lt v1, v2, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected isViewInBounds(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 4
    .param p1, "view"    # Landroid/view/View;
    .param p2, "motionEvent"    # Landroid/view/MotionEvent;

    .prologue
    .line 444
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$TouchInBoundsListener;->outRect:Landroid/graphics/Rect;

    invoke-virtual {p1, v0}, Landroid/view/View;->getDrawingRect(Landroid/graphics/Rect;)V

    .line 445
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$TouchInBoundsListener;->location:[I

    invoke-virtual {p1, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 446
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$TouchInBoundsListener;->outRect:Landroid/graphics/Rect;

    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$TouchInBoundsListener;->location:[I

    const/4 v2, 0x0

    aget v1, v1, v2

    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$TouchInBoundsListener;->location:[I

    const/4 v3, 0x1

    aget v2, v2, v3

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Rect;->offset(II)V

    .line 447
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$TouchInBoundsListener;->outRect:Landroid/graphics/Rect;

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v1

    float-to-int v1, v1

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result v2

    float-to-int v2, v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Rect;->contains(II)Z

    move-result v0

    return v0
.end method
