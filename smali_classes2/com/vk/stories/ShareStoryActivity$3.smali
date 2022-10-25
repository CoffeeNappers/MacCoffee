.class Lcom/vk/stories/ShareStoryActivity$3;
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
    .line 118
    iput-object p1, p0, Lcom/vk/stories/ShareStoryActivity$3;->this$0:Lcom/vk/stories/ShareStoryActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 121
    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity$3;->this$0:Lcom/vk/stories/ShareStoryActivity;

    invoke-virtual {v0}, Lcom/vk/stories/ShareStoryActivity;->finish()V

    .line 122
    return-void
.end method
