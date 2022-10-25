.class Lcom/vkontakte/android/ui/WriteBar$VoiceRecordControlEventListener;
.super Ljava/lang/Object;
.source "WriteBar.java"

# interfaces
.implements Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$EventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/WriteBar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "VoiceRecordControlEventListener"
.end annotation


# instance fields
.field private distance:I

.field private final minDistance:I

.field final synthetic this$0:Lcom/vkontakte/android/ui/WriteBar;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/ui/WriteBar;)V
    .locals 1

    .prologue
    .line 1174
    iput-object p1, p0, Lcom/vkontakte/android/ui/WriteBar$VoiceRecordControlEventListener;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1175
    const/high16 v0, 0x428c0000    # 70.0f

    invoke-static {v0}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/ui/WriteBar$VoiceRecordControlEventListener;->minDistance:I

    .line 1176
    const/high16 v0, -0x80000000

    iput v0, p0, Lcom/vkontakte/android/ui/WriteBar$VoiceRecordControlEventListener;->distance:I

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/ui/WriteBar;Lcom/vkontakte/android/ui/WriteBar$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/ui/WriteBar;
    .param p2, "x1"    # Lcom/vkontakte/android/ui/WriteBar$1;

    .prologue
    .line 1174
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/WriteBar$VoiceRecordControlEventListener;-><init>(Lcom/vkontakte/android/ui/WriteBar;)V

    return-void
.end method


# virtual methods
.method public onCancel()V
    .locals 1

    .prologue
    .line 1190
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar$VoiceRecordControlEventListener;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v0}, Lcom/vkontakte/android/ui/WriteBar;->access$4500(Lcom/vkontakte/android/ui/WriteBar;)V

    .line 1191
    return-void
.end method

.method public onMove(FI)V
    .locals 7
    .param p1, "translateX"    # F
    .param p2, "duration"    # I

    .prologue
    const/4 v5, 0x0

    const/high16 v6, 0x437f0000    # 255.0f

    .line 1201
    iget v3, p0, Lcom/vkontakte/android/ui/WriteBar$VoiceRecordControlEventListener;->distance:I

    const/high16 v4, -0x80000000

    if-ne v3, v4, :cond_0

    .line 1202
    const/4 v3, 0x2

    new-array v0, v3, [I

    .line 1203
    .local v0, "location":[I
    iget-object v3, p0, Lcom/vkontakte/android/ui/WriteBar$VoiceRecordControlEventListener;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v3}, Lcom/vkontakte/android/ui/WriteBar;->access$4700(Lcom/vkontakte/android/ui/WriteBar;)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 1204
    iget-object v3, p0, Lcom/vkontakte/android/ui/WriteBar$VoiceRecordControlEventListener;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v3}, Lcom/vkontakte/android/ui/WriteBar;->access$4700(Lcom/vkontakte/android/ui/WriteBar;)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    move-result v3

    aget v4, v0, v5

    add-int v2, v3, v4

    .line 1205
    .local v2, "slideRight":I
    iget-object v3, p0, Lcom/vkontakte/android/ui/WriteBar$VoiceRecordControlEventListener;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v3}, Lcom/vkontakte/android/ui/WriteBar;->access$4800(Lcom/vkontakte/android/ui/WriteBar;)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 1206
    aget v3, v0, v5

    sub-int/2addr v3, v2

    iput v3, p0, Lcom/vkontakte/android/ui/WriteBar$VoiceRecordControlEventListener;->distance:I

    .line 1208
    .end local v0    # "location":[I
    .end local v2    # "slideRight":I
    :cond_0
    iget v3, p0, Lcom/vkontakte/android/ui/WriteBar$VoiceRecordControlEventListener;->distance:I

    iget v4, p0, Lcom/vkontakte/android/ui/WriteBar$VoiceRecordControlEventListener;->minDistance:I

    if-ge v3, v4, :cond_1

    const/4 v1, 0x1

    .line 1209
    .local v1, "slideFactor":I
    :goto_0
    iget-object v3, p0, Lcom/vkontakte/android/ui/WriteBar$VoiceRecordControlEventListener;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v3}, Lcom/vkontakte/android/ui/WriteBar;->access$4800(Lcom/vkontakte/android/ui/WriteBar;)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v3

    invoke-virtual {v3, p1}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v3

    int-to-long v4, p2

    invoke-virtual {v3, v4, v5}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 1210
    iget-object v3, p0, Lcom/vkontakte/android/ui/WriteBar$VoiceRecordControlEventListener;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v3}, Lcom/vkontakte/android/ui/WriteBar;->access$4700(Lcom/vkontakte/android/ui/WriteBar;)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v3

    int-to-float v4, v1

    div-float v4, p1, v4

    invoke-virtual {v3, v4}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v3

    int-to-long v4, p2

    invoke-virtual {v3, v4, v5}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 1211
    iget-object v3, p0, Lcom/vkontakte/android/ui/WriteBar$VoiceRecordControlEventListener;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v3}, Lcom/vkontakte/android/ui/WriteBar;->access$4700(Lcom/vkontakte/android/ui/WriteBar;)Landroid/view/View;

    move-result-object v3

    const/4 v4, 0x0

    const/high16 v5, 0x3fc00000    # 1.5f

    div-float v5, p1, v5

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    invoke-static {v6, v5}, Ljava/lang/Math;->min(FF)F

    move-result v5

    sub-float v5, v6, v5

    invoke-static {v4, v5}, Ljava/lang/Math;->max(FF)F

    move-result v4

    div-float/2addr v4, v6

    invoke-virtual {v3, v4}, Landroid/view/View;->setAlpha(F)V

    .line 1212
    return-void

    .line 1208
    .end local v1    # "slideFactor":I
    :cond_1
    const/4 v1, 0x3

    goto :goto_0
.end method

.method public onRelease()V
    .locals 2

    .prologue
    .line 1195
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar$VoiceRecordControlEventListener;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v0}, Lcom/vkontakte/android/ui/WriteBar;->access$4600(Lcom/vkontakte/android/ui/WriteBar;)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 1196
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar$VoiceRecordControlEventListener;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v0}, Lcom/vkontakte/android/ui/WriteBar;->access$4700(Lcom/vkontakte/android/ui/WriteBar;)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x4

    invoke-static {v0, v1}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 1197
    return-void
.end method

.method public onSendClick()V
    .locals 1

    .prologue
    .line 1180
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar$VoiceRecordControlEventListener;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v0}, Lcom/vkontakte/android/ui/WriteBar;->access$600(Lcom/vkontakte/android/ui/WriteBar;)Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->isRecording()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1181
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar$VoiceRecordControlEventListener;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v0}, Lcom/vkontakte/android/ui/WriteBar;->access$600(Lcom/vkontakte/android/ui/WriteBar;)Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->stopAndSendRecord()V

    .line 1186
    :goto_0
    return-void

    .line 1183
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar$VoiceRecordControlEventListener;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v0}, Lcom/vkontakte/android/ui/WriteBar;->access$900(Lcom/vkontakte/android/ui/WriteBar;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->performClick()Z

    .line 1184
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar$VoiceRecordControlEventListener;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v0}, Lcom/vkontakte/android/ui/WriteBar;->access$500(Lcom/vkontakte/android/ui/WriteBar;)V

    goto :goto_0
.end method

.method public resetDistance()V
    .locals 1

    .prologue
    .line 1215
    const/high16 v0, -0x80000000

    iput v0, p0, Lcom/vkontakte/android/ui/WriteBar$VoiceRecordControlEventListener;->distance:I

    .line 1216
    return-void
.end method
