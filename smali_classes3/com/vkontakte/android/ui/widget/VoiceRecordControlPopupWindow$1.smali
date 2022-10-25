.class Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$1;
.super Landroid/animation/AnimatorListenerAdapter;
.source "VoiceRecordControlPopupWindow.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->animate(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

.field final synthetic val$show:Z


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;Z)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    .prologue
    .line 196
    iput-object p1, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$1;->this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    iput-boolean p2, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$1;->val$show:Z

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 4
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 207
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$1;->this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->access$500(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)Landroid/animation/AnimatorSet;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 208
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$1;->this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->access$702(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;Z)Z

    .line 209
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$1;->this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    const-wide/16 v2, 0x0

    invoke-static {v0, v2, v3}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->access$602(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;J)J

    .line 210
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$1;->val$show:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$1;->this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->access$800(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$AnimatedPopupWindow;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 211
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$1;->this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->access$800(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$AnimatedPopupWindow;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$AnimatedPopupWindow;->dismissSuper()V

    .line 214
    :cond_0
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 4
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 199
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$1;->this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->access$500(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)Landroid/animation/AnimatorSet;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 200
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$1;->this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v0, v2, v3}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->access$602(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;J)J

    .line 201
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$1;->this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->access$702(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;Z)Z

    .line 203
    :cond_0
    return-void
.end method
