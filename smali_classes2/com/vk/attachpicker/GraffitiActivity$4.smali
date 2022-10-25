.class Lcom/vk/attachpicker/GraffitiActivity$4;
.super Ljava/lang/Object;
.source "GraffitiActivity.java"

# interfaces
.implements Lcom/vk/attachpicker/drawing/DrawingView$OnMotionEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/attachpicker/GraffitiActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/attachpicker/GraffitiActivity;


# direct methods
.method constructor <init>(Lcom/vk/attachpicker/GraffitiActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/attachpicker/GraffitiActivity;

    .prologue
    .line 152
    iput-object p1, p0, Lcom/vk/attachpicker/GraffitiActivity$4;->this$0:Lcom/vk/attachpicker/GraffitiActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDown()V
    .locals 4

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 155
    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity$4;->this$0:Lcom/vk/attachpicker/GraffitiActivity;

    invoke-static {v0}, Lcom/vk/attachpicker/GraffitiActivity;->access$300(Lcom/vk/attachpicker/GraffitiActivity;)Landroid/view/View;

    move-result-object v3

    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity$4;->this$0:Lcom/vk/attachpicker/GraffitiActivity;

    invoke-static {v0}, Lcom/vk/attachpicker/GraffitiActivity;->access$100(Lcom/vk/attachpicker/GraffitiActivity;)Lcom/vk/attachpicker/drawing/DrawingView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/attachpicker/drawing/DrawingView;->getHistorySize()I

    move-result v0

    if-lez v0, :cond_0

    move v0, v1

    :goto_0
    invoke-virtual {v3, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 156
    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity$4;->this$0:Lcom/vk/attachpicker/GraffitiActivity;

    invoke-static {v0}, Lcom/vk/attachpicker/GraffitiActivity;->access$400(Lcom/vk/attachpicker/GraffitiActivity;)Landroid/view/View;

    move-result-object v0

    iget-object v3, p0, Lcom/vk/attachpicker/GraffitiActivity$4;->this$0:Lcom/vk/attachpicker/GraffitiActivity;

    invoke-static {v3}, Lcom/vk/attachpicker/GraffitiActivity;->access$100(Lcom/vk/attachpicker/GraffitiActivity;)Lcom/vk/attachpicker/drawing/DrawingView;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vk/attachpicker/drawing/DrawingView;->getHistorySize()I

    move-result v3

    if-lez v3, :cond_1

    :goto_1
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 157
    return-void

    :cond_0
    move v0, v2

    .line 155
    goto :goto_0

    :cond_1
    move v1, v2

    .line 156
    goto :goto_1
.end method

.method public onUp()V
    .locals 0

    .prologue
    .line 162
    return-void
.end method
