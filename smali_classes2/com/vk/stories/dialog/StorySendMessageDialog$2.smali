.class Lcom/vk/stories/dialog/StorySendMessageDialog$2;
.super Ljava/lang/Object;
.source "StorySendMessageDialog.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/dialog/StorySendMessageDialog;-><init>(Landroid/content/Context;ILcom/vk/stories/model/StoryEntry;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/stories/dialog/StorySendMessageDialog;


# direct methods
.method constructor <init>(Lcom/vk/stories/dialog/StorySendMessageDialog;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/stories/dialog/StorySendMessageDialog;

    .prologue
    .line 84
    iput-object p1, p0, Lcom/vk/stories/dialog/StorySendMessageDialog$2;->this$0:Lcom/vk/stories/dialog/StorySendMessageDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method synthetic lambda$onPreDraw$0()V
    .locals 4

    .prologue
    const-wide/16 v2, 0xc8

    .line 91
    iget-object v0, p0, Lcom/vk/stories/dialog/StorySendMessageDialog$2;->this$0:Lcom/vk/stories/dialog/StorySendMessageDialog;

    invoke-static {v0}, Lcom/vk/stories/dialog/StorySendMessageDialog;->access$100(Lcom/vk/stories/dialog/StorySendMessageDialog;)Lcom/vk/attachpicker/widget/BackPressEditText;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/attachpicker/widget/BackPressEditText;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 92
    iget-object v0, p0, Lcom/vk/stories/dialog/StorySendMessageDialog$2;->this$0:Lcom/vk/stories/dialog/StorySendMessageDialog;

    invoke-static {v0}, Lcom/vk/stories/dialog/StorySendMessageDialog;->access$000(Lcom/vk/stories/dialog/StorySendMessageDialog;)Landroid/widget/ImageView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ImageView;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const v1, 0x3ecccccd    # 0.4f

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 93
    return-void
.end method

.method public onPreDraw()Z
    .locals 4

    .prologue
    .line 87
    iget-object v0, p0, Lcom/vk/stories/dialog/StorySendMessageDialog$2;->this$0:Lcom/vk/stories/dialog/StorySendMessageDialog;

    invoke-static {v0}, Lcom/vk/stories/dialog/StorySendMessageDialog;->access$100(Lcom/vk/stories/dialog/StorySendMessageDialog;)Lcom/vk/attachpicker/widget/BackPressEditText;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/attachpicker/widget/BackPressEditText;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 88
    iget-object v0, p0, Lcom/vk/stories/dialog/StorySendMessageDialog$2;->this$0:Lcom/vk/stories/dialog/StorySendMessageDialog;

    invoke-static {v0}, Lcom/vk/stories/dialog/StorySendMessageDialog;->access$100(Lcom/vk/stories/dialog/StorySendMessageDialog;)Lcom/vk/attachpicker/widget/BackPressEditText;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/core/util/KeyboardUtils;->showKeyboard(Landroid/view/View;)V

    .line 90
    invoke-static {p0}, Lcom/vk/stories/dialog/StorySendMessageDialog$2$$Lambda$1;->lambdaFactory$(Lcom/vk/stories/dialog/StorySendMessageDialog$2;)Ljava/lang/Runnable;

    move-result-object v0

    const-wide/16 v2, 0x12c

    invoke-static {v0, v2, v3}, Lcom/vk/attachpicker/Picker;->runDelayed(Ljava/lang/Runnable;J)V

    .line 94
    const/4 v0, 0x1

    return v0
.end method
