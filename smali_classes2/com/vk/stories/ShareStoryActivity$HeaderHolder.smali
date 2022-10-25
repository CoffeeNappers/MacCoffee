.class Lcom/vk/stories/ShareStoryActivity$HeaderHolder;
.super Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
.source "ShareStoryActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/stories/ShareStoryActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "HeaderHolder"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/stories/ShareStoryActivity;


# direct methods
.method public constructor <init>(Lcom/vk/stories/ShareStoryActivity;)V
    .locals 1

    .prologue
    .line 358
    iput-object p1, p0, Lcom/vk/stories/ShareStoryActivity$HeaderHolder;->this$0:Lcom/vk/stories/ShareStoryActivity;

    .line 359
    invoke-static {p1}, Lcom/vk/stories/ShareStoryActivity;->access$1200(Lcom/vk/stories/ShareStoryActivity;)Landroid/view/View;

    move-result-object v0

    invoke-direct {p0, v0}, Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 360
    return-void
.end method


# virtual methods
.method public setIsEmpty(Z)V
    .locals 3
    .param p1, "isEmpty"    # Z

    .prologue
    const/16 v2, 0x8

    const/4 v1, 0x0

    .line 363
    if-eqz p1, :cond_0

    .line 364
    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity$HeaderHolder;->this$0:Lcom/vk/stories/ShareStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/ShareStoryActivity;->access$1300(Lcom/vk/stories/ShareStoryActivity;)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 365
    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity$HeaderHolder;->this$0:Lcom/vk/stories/ShareStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/ShareStoryActivity;->access$100(Lcom/vk/stories/ShareStoryActivity;)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 370
    :goto_0
    return-void

    .line 367
    :cond_0
    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity$HeaderHolder;->this$0:Lcom/vk/stories/ShareStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/ShareStoryActivity;->access$1300(Lcom/vk/stories/ShareStoryActivity;)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 368
    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity$HeaderHolder;->this$0:Lcom/vk/stories/ShareStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/ShareStoryActivity;->access$100(Lcom/vk/stories/ShareStoryActivity;)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0
.end method
