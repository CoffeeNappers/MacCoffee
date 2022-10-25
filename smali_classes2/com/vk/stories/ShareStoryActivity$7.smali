.class Lcom/vk/stories/ShareStoryActivity$7;
.super Ljava/lang/Object;
.source "ShareStoryActivity.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


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
    .line 173
    iput-object p1, p0, Lcom/vk/stories/ShareStoryActivity$7;->this$0:Lcom/vk/stories/ShareStoryActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 1
    .param p1, "compoundButton"    # Landroid/widget/CompoundButton;
    .param p2, "b"    # Z

    .prologue
    .line 176
    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity$7;->this$0:Lcom/vk/stories/ShareStoryActivity;

    invoke-static {v0, p2}, Lcom/vk/stories/ShareStoryActivity;->access$502(Lcom/vk/stories/ShareStoryActivity;Z)Z

    .line 177
    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity$7;->this$0:Lcom/vk/stories/ShareStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/ShareStoryActivity;->access$700(Lcom/vk/stories/ShareStoryActivity;)V

    .line 178
    return-void
.end method
