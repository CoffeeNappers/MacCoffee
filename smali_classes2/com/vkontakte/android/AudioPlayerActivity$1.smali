.class Lcom/vkontakte/android/AudioPlayerActivity$1;
.super Landroid/animation/AnimatorListenerAdapter;
.source "AudioPlayerActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/AudioPlayerActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/AudioPlayerActivity;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/AudioPlayerActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/AudioPlayerActivity;

    .prologue
    .line 115
    iput-object p1, p0, Lcom/vkontakte/android/AudioPlayerActivity$1;->this$0:Lcom/vkontakte/android/AudioPlayerActivity;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    const/high16 v1, 0x3f800000    # 1.0f

    .line 118
    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity$1;->this$0:Lcom/vkontakte/android/AudioPlayerActivity;

    invoke-static {v0}, Lcom/vkontakte/android/AudioPlayerActivity;->access$000(Lcom/vkontakte/android/AudioPlayerActivity;)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setAlpha(F)V

    .line 119
    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity$1;->this$0:Lcom/vkontakte/android/AudioPlayerActivity;

    invoke-static {v0}, Lcom/vkontakte/android/AudioPlayerActivity;->access$100(Lcom/vkontakte/android/AudioPlayerActivity;)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setAlpha(F)V

    .line 120
    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity$1;->this$0:Lcom/vkontakte/android/AudioPlayerActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/AudioPlayerActivity;->access$202(Lcom/vkontakte/android/AudioPlayerActivity;Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 121
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 2
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 124
    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity$1;->this$0:Lcom/vkontakte/android/AudioPlayerActivity;

    invoke-static {v0}, Lcom/vkontakte/android/AudioPlayerActivity;->access$000(Lcom/vkontakte/android/AudioPlayerActivity;)Landroid/widget/TextView;

    move-result-object v1

    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity$1;->this$0:Lcom/vkontakte/android/AudioPlayerActivity;

    invoke-static {v0}, Lcom/vkontakte/android/AudioPlayerActivity;->access$000(Lcom/vkontakte/android/AudioPlayerActivity;)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 125
    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity$1;->this$0:Lcom/vkontakte/android/AudioPlayerActivity;

    invoke-static {v0}, Lcom/vkontakte/android/AudioPlayerActivity;->access$100(Lcom/vkontakte/android/AudioPlayerActivity;)Landroid/widget/TextView;

    move-result-object v1

    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity$1;->this$0:Lcom/vkontakte/android/AudioPlayerActivity;

    invoke-static {v0}, Lcom/vkontakte/android/AudioPlayerActivity;->access$100(Lcom/vkontakte/android/AudioPlayerActivity;)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 126
    return-void
.end method
