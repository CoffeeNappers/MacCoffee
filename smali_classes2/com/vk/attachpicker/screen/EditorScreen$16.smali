.class Lcom/vk/attachpicker/screen/EditorScreen$16;
.super Landroid/animation/AnimatorListenerAdapter;
.source "EditorScreen.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/attachpicker/screen/EditorScreen;->closeAnimation()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/attachpicker/screen/EditorScreen;


# direct methods
.method constructor <init>(Lcom/vk/attachpicker/screen/EditorScreen;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/attachpicker/screen/EditorScreen;

    .prologue
    .line 1240
    iput-object p1, p0, Lcom/vk/attachpicker/screen/EditorScreen$16;->this$0:Lcom/vk/attachpicker/screen/EditorScreen;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 1243
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen$16;->this$0:Lcom/vk/attachpicker/screen/EditorScreen;

    invoke-static {v0}, Lcom/vk/attachpicker/screen/EditorScreen;->access$2501(Lcom/vk/attachpicker/screen/EditorScreen;)V

    .line 1244
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen$16;->this$0:Lcom/vk/attachpicker/screen/EditorScreen;

    invoke-static {v0}, Lcom/vk/attachpicker/screen/EditorScreen;->access$2600(Lcom/vk/attachpicker/screen/EditorScreen;)Lcom/vk/attachpicker/screen/EditorScreen$Delegate;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1245
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen$16;->this$0:Lcom/vk/attachpicker/screen/EditorScreen;

    invoke-static {v0}, Lcom/vk/attachpicker/screen/EditorScreen;->access$2600(Lcom/vk/attachpicker/screen/EditorScreen;)Lcom/vk/attachpicker/screen/EditorScreen$Delegate;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/attachpicker/screen/EditorScreen$Delegate;->startEditorCloseAnimation()V

    .line 1247
    :cond_0
    return-void
.end method
