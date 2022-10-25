.class Lcom/vk/stories/ShareStoryActivity$6;
.super Ljava/lang/Object;
.source "ShareStoryActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/ShareStoryActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/stories/ShareStoryActivity;


# direct methods
.method constructor <init>(Lcom/vk/stories/ShareStoryActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/stories/ShareStoryActivity;

    .prologue
    .line 163
    iput-object p1, p0, Lcom/vk/stories/ShareStoryActivity$6;->this$0:Lcom/vk/stories/ShareStoryActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 166
    iget-object v1, p0, Lcom/vk/stories/ShareStoryActivity$6;->this$0:Lcom/vk/stories/ShareStoryActivity;

    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity$6;->this$0:Lcom/vk/stories/ShareStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/ShareStoryActivity;->access$500(Lcom/vk/stories/ShareStoryActivity;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v1, v0}, Lcom/vk/stories/ShareStoryActivity;->access$502(Lcom/vk/stories/ShareStoryActivity;Z)Z

    .line 167
    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity$6;->this$0:Lcom/vk/stories/ShareStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/ShareStoryActivity;->access$600(Lcom/vk/stories/ShareStoryActivity;)Landroid/widget/CheckBox;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/stories/ShareStoryActivity$6;->this$0:Lcom/vk/stories/ShareStoryActivity;

    invoke-static {v1}, Lcom/vk/stories/ShareStoryActivity;->access$500(Lcom/vk/stories/ShareStoryActivity;)Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 168
    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity$6;->this$0:Lcom/vk/stories/ShareStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/ShareStoryActivity;->access$700(Lcom/vk/stories/ShareStoryActivity;)V

    .line 169
    return-void

    .line 166
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
