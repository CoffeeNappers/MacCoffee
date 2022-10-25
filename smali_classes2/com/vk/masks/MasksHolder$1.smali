.class Lcom/vk/masks/MasksHolder$1;
.super Ljava/lang/Object;
.source "MasksHolder.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/masks/MasksHolder;-><init>(Landroid/content/Context;Lcom/vk/masks/MasksAdapter;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/masks/MasksHolder;

.field final synthetic val$adapter:Lcom/vk/masks/MasksAdapter;


# direct methods
.method constructor <init>(Lcom/vk/masks/MasksHolder;Lcom/vk/masks/MasksAdapter;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/masks/MasksHolder;

    .prologue
    .line 28
    iput-object p1, p0, Lcom/vk/masks/MasksHolder$1;->this$0:Lcom/vk/masks/MasksHolder;

    iput-object p2, p0, Lcom/vk/masks/MasksHolder$1;->val$adapter:Lcom/vk/masks/MasksAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 31
    invoke-static {}, Lcom/vk/masks/MasksHolder;->access$000()Lcom/vk/core/util/TimeoutLock;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/core/util/TimeoutLock;->checkAndMaybeLock()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vk/masks/MasksHolder$1;->this$0:Lcom/vk/masks/MasksHolder;

    invoke-static {v0}, Lcom/vk/masks/MasksHolder;->access$100(Lcom/vk/masks/MasksHolder;)Lcom/vk/masks/model/Mask;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/masks/model/Mask;->isSupported()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 32
    iget-object v0, p0, Lcom/vk/masks/MasksHolder$1;->val$adapter:Lcom/vk/masks/MasksAdapter;

    invoke-virtual {v0}, Lcom/vk/masks/MasksAdapter;->getOnMaskSelectedListener()Lcom/vk/masks/MasksView$OnMaskSelectedListener;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/masks/MasksHolder$1;->val$adapter:Lcom/vk/masks/MasksAdapter;

    invoke-virtual {v1}, Lcom/vk/masks/MasksAdapter;->getSectionId()I

    move-result v1

    iget-object v2, p0, Lcom/vk/masks/MasksHolder$1;->this$0:Lcom/vk/masks/MasksHolder;

    invoke-static {v2}, Lcom/vk/masks/MasksHolder;->access$100(Lcom/vk/masks/MasksHolder;)Lcom/vk/masks/model/Mask;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/vk/masks/MasksView$OnMaskSelectedListener;->onMaskSelected(ILcom/vk/masks/model/Mask;)V

    .line 34
    :cond_0
    return-void
.end method
