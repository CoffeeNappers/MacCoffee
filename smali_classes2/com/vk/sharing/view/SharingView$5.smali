.class Lcom/vk/sharing/view/SharingView$5;
.super Ljava/lang/Object;
.source "SharingView.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/sharing/view/SharingView;->hide()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/sharing/view/SharingView;


# direct methods
.method constructor <init>(Lcom/vk/sharing/view/SharingView;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/sharing/view/SharingView;

    .prologue
    .line 437
    iput-object p1, p0, Lcom/vk/sharing/view/SharingView$5;->this$0:Lcom/vk/sharing/view/SharingView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreDraw()Z
    .locals 1

    .prologue
    .line 440
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView$5;->this$0:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 441
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView$5;->this$0:Lcom/vk/sharing/view/SharingView;

    invoke-static {v0}, Lcom/vk/sharing/view/SharingView;->access$300(Lcom/vk/sharing/view/SharingView;)V

    .line 442
    const/4 v0, 0x0

    return v0
.end method
