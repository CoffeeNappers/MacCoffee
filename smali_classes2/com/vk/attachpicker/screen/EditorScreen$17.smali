.class Lcom/vk/attachpicker/screen/EditorScreen$17;
.super Landroid/animation/AnimatorListenerAdapter;
.source "EditorScreen.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/attachpicker/screen/EditorScreen;->bottomPanelOpenAnimation(Landroid/view/View;[Ljava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/attachpicker/screen/EditorScreen;

.field final synthetic val$h:I

.field final synthetic val$panel:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/vk/attachpicker/screen/EditorScreen;Landroid/view/View;I)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/attachpicker/screen/EditorScreen;

    .prologue
    .line 1276
    iput-object p1, p0, Lcom/vk/attachpicker/screen/EditorScreen$17;->this$0:Lcom/vk/attachpicker/screen/EditorScreen;

    iput-object p2, p0, Lcom/vk/attachpicker/screen/EditorScreen$17;->val$panel:Landroid/view/View;

    iput p3, p0, Lcom/vk/attachpicker/screen/EditorScreen$17;->val$h:I

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    const/16 v1, 0x8

    .line 1279
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen$17;->this$0:Lcom/vk/attachpicker/screen/EditorScreen;

    invoke-static {v0}, Lcom/vk/attachpicker/screen/EditorScreen;->access$2700(Lcom/vk/attachpicker/screen/EditorScreen;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 1280
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen$17;->this$0:Lcom/vk/attachpicker/screen/EditorScreen;

    invoke-static {v0}, Lcom/vk/attachpicker/screen/EditorScreen;->access$2800(Lcom/vk/attachpicker/screen/EditorScreen;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 1281
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen$17;->val$panel:Landroid/view/View;

    iget v1, p0, Lcom/vk/attachpicker/screen/EditorScreen$17;->val$h:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 1282
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen$17;->val$panel:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 1283
    return-void
.end method
