.class Lcom/vk/attachpicker/AttachActivity$8;
.super Ljava/lang/Object;
.source "AttachActivity.java"

# interfaces
.implements Lcom/vk/attachpicker/events/NotificationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/attachpicker/AttachActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vk/attachpicker/events/NotificationListener",
        "<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/attachpicker/AttachActivity;


# direct methods
.method constructor <init>(Lcom/vk/attachpicker/AttachActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/attachpicker/AttachActivity;

    .prologue
    .line 625
    iput-object p1, p0, Lcom/vk/attachpicker/AttachActivity$8;->this$0:Lcom/vk/attachpicker/AttachActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onNotification(IILjava/lang/Object;)V
    .locals 0

    .prologue
    .line 625
    check-cast p3, Ljava/lang/Void;

    invoke-virtual {p0, p1, p2, p3}, Lcom/vk/attachpicker/AttachActivity$8;->onNotification(IILjava/lang/Void;)V

    return-void
.end method

.method public onNotification(IILjava/lang/Void;)V
    .locals 2
    .param p1, "eventType"    # I
    .param p2, "eventId"    # I
    .param p3, "eventArgs"    # Ljava/lang/Void;

    .prologue
    .line 628
    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity$8;->this$0:Lcom/vk/attachpicker/AttachActivity;

    invoke-static {v0}, Lcom/vk/attachpicker/AttachActivity;->access$400(Lcom/vk/attachpicker/AttachActivity;)Lcom/vk/attachpicker/SelectionContext;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/attachpicker/SelectionContext;->selectionCount()I

    move-result v0

    if-lez v0, :cond_0

    .line 629
    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity$8;->this$0:Lcom/vk/attachpicker/AttachActivity;

    invoke-static {v0}, Lcom/vk/attachpicker/AttachActivity;->access$2000(Lcom/vk/attachpicker/AttachActivity;)Lcom/vk/attachpicker/widget/AttachCounterView;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/attachpicker/AttachActivity$8;->this$0:Lcom/vk/attachpicker/AttachActivity;

    invoke-static {v1}, Lcom/vk/attachpicker/AttachActivity;->access$400(Lcom/vk/attachpicker/AttachActivity;)Lcom/vk/attachpicker/SelectionContext;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/attachpicker/SelectionContext;->selectionCount()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/AttachCounterView;->setCount(I)V

    .line 633
    :goto_0
    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity$8;->this$0:Lcom/vk/attachpicker/AttachActivity;

    invoke-static {v0}, Lcom/vk/attachpicker/AttachActivity;->access$400(Lcom/vk/attachpicker/AttachActivity;)Lcom/vk/attachpicker/SelectionContext;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/attachpicker/SelectionContext;->selectionCount()I

    move-result v0

    if-lez v0, :cond_1

    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity$8;->this$0:Lcom/vk/attachpicker/AttachActivity;

    invoke-static {v0}, Lcom/vk/attachpicker/AttachActivity;->access$500(Lcom/vk/attachpicker/AttachActivity;)Lcom/vk/attachpicker/widget/ContentViewPager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/attachpicker/widget/ContentViewPager;->getCurrentItem()I

    move-result v0

    if-nez v0, :cond_1

    .line 634
    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity$8;->this$0:Lcom/vk/attachpicker/AttachActivity;

    invoke-static {v0}, Lcom/vk/attachpicker/AttachActivity;->access$600(Lcom/vk/attachpicker/AttachActivity;)V

    .line 638
    :goto_1
    return-void

    .line 631
    :cond_0
    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity$8;->this$0:Lcom/vk/attachpicker/AttachActivity;

    invoke-static {v0}, Lcom/vk/attachpicker/AttachActivity;->access$2000(Lcom/vk/attachpicker/AttachActivity;)Lcom/vk/attachpicker/widget/AttachCounterView;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/AttachCounterView;->setCount(I)V

    goto :goto_0

    .line 636
    :cond_1
    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity$8;->this$0:Lcom/vk/attachpicker/AttachActivity;

    invoke-static {v0}, Lcom/vk/attachpicker/AttachActivity;->access$700(Lcom/vk/attachpicker/AttachActivity;)V

    goto :goto_1
.end method
