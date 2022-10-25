.class Lcom/vk/stories/CreateAndEditStoryActivity$1$1;
.super Ljava/lang/Object;
.source "CreateAndEditStoryActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/CreateAndEditStoryActivity$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vk/stories/CreateAndEditStoryActivity$1;


# direct methods
.method constructor <init>(Lcom/vk/stories/CreateAndEditStoryActivity$1;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vk/stories/CreateAndEditStoryActivity$1;

    .prologue
    .line 178
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$1$1;->this$1:Lcom/vk/stories/CreateAndEditStoryActivity$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 181
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$1$1;->this$1:Lcom/vk/stories/CreateAndEditStoryActivity$1;

    iget-object v0, v0, Lcom/vk/stories/CreateAndEditStoryActivity$1;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$002(Lcom/vk/stories/CreateAndEditStoryActivity;Landroid/app/Dialog;)Landroid/app/Dialog;

    .line 182
    return-void
.end method
