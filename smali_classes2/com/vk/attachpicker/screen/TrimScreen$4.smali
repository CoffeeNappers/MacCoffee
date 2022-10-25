.class Lcom/vk/attachpicker/screen/TrimScreen$4;
.super Landroid/animation/AnimatorListenerAdapter;
.source "TrimScreen.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/attachpicker/screen/TrimScreen;->closeAnimation()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/attachpicker/screen/TrimScreen;


# direct methods
.method constructor <init>(Lcom/vk/attachpicker/screen/TrimScreen;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/attachpicker/screen/TrimScreen;

    .prologue
    .line 370
    iput-object p1, p0, Lcom/vk/attachpicker/screen/TrimScreen$4;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method synthetic lambda$onAnimationEnd$0()V
    .locals 1

    .prologue
    .line 374
    iget-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen$4;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-static {v0}, Lcom/vk/attachpicker/screen/TrimScreen;->access$1201(Lcom/vk/attachpicker/screen/TrimScreen;)V

    .line 375
    iget-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen$4;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-static {v0}, Lcom/vk/attachpicker/screen/TrimScreen;->access$1300(Lcom/vk/attachpicker/screen/TrimScreen;)Lcom/vk/attachpicker/screen/TrimScreen$Delegate;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 376
    iget-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen$4;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-static {v0}, Lcom/vk/attachpicker/screen/TrimScreen;->access$1300(Lcom/vk/attachpicker/screen/TrimScreen;)Lcom/vk/attachpicker/screen/TrimScreen$Delegate;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/attachpicker/screen/TrimScreen$Delegate;->startEditorCloseAnimation()V

    .line 378
    :cond_0
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 4
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 373
    invoke-static {p0}, Lcom/vk/attachpicker/screen/TrimScreen$4$$Lambda$1;->lambdaFactory$(Lcom/vk/attachpicker/screen/TrimScreen$4;)Ljava/lang/Runnable;

    move-result-object v0

    const-wide/16 v2, 0x10

    invoke-static {v0, v2, v3}, Lcom/vk/attachpicker/Picker;->runDelayed(Ljava/lang/Runnable;J)V

    .line 380
    return-void
.end method
