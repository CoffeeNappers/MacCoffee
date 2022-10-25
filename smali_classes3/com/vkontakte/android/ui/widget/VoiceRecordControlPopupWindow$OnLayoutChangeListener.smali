.class Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnLayoutChangeListener;
.super Ljava/lang/Object;
.source "VoiceRecordControlPopupWindow.java"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "OnLayoutChangeListener"
.end annotation


# instance fields
.field private lastUpdateTime:J

.field final synthetic this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)V
    .locals 0

    .prologue
    .line 304
    iput-object p1, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnLayoutChangeListener;->this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;
    .param p2, "x1"    # Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$1;

    .prologue
    .line 304
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnLayoutChangeListener;-><init>(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)V

    return-void
.end method


# virtual methods
.method public onLayoutChange(Landroid/view/View;IIIIIIII)V
    .locals 10
    .param p1, "view"    # Landroid/view/View;
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I
    .param p6, "oldLeft"    # I
    .param p7, "oldTop"    # I
    .param p8, "oldRight"    # I
    .param p9, "oldBottom"    # I

    .prologue
    .line 310
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 311
    .local v0, "currentTime":J
    iget-wide v6, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnLayoutChangeListener;->lastUpdateTime:J

    sub-long v6, v0, v6

    const-wide/16 v8, 0x64

    cmp-long v5, v6, v8

    if-lez v5, :cond_0

    .line 312
    iput-wide v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnLayoutChangeListener;->lastUpdateTime:J

    .line 313
    iget-object v5, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnLayoutChangeListener;->this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    invoke-static {v5}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->access$900(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)Landroid/graphics/Point;

    move-result-object v4

    .line 314
    .local v4, "position":Landroid/graphics/Point;
    iget-object v5, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnLayoutChangeListener;->this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    invoke-static {v5}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->access$1000(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    .line 315
    .local v2, "parent":Landroid/view/ViewGroup;
    const/4 v5, 0x2

    new-array v3, v5, [I

    .line 316
    .local v3, "parentLocation":[I
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getLocationOnScreen([I)V

    .line 317
    iget-object v5, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnLayoutChangeListener;->this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    invoke-static {v5}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->access$800(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$AnimatedPopupWindow;

    move-result-object v5

    const/4 v6, 0x0

    aget v6, v3, v6

    iget v7, v4, Landroid/graphics/Point;->y:I

    invoke-virtual {v2}, Landroid/view/ViewGroup;->getWidth()I

    move-result v8

    iget-object v9, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnLayoutChangeListener;->this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    invoke-static {v9}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->access$1100(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)I

    move-result v9

    invoke-virtual {v5, v6, v7, v8, v9}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$AnimatedPopupWindow;->update(IIII)V

    .line 319
    .end local v2    # "parent":Landroid/view/ViewGroup;
    .end local v3    # "parentLocation":[I
    .end local v4    # "position":Landroid/graphics/Point;
    :cond_0
    return-void
.end method
