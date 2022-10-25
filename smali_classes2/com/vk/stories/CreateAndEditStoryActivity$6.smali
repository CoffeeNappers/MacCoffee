.class Lcom/vk/stories/CreateAndEditStoryActivity$6;
.super Ljava/lang/Object;
.source "CreateAndEditStoryActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/CreateAndEditStoryActivity;->onBackPressed()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/stories/CreateAndEditStoryActivity;


# direct methods
.method constructor <init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 443
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$6;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 446
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$6;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$6$1;

    invoke-direct {v1, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$6$1;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity$6;)V

    invoke-static {v0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$1000(Lcom/vk/stories/CreateAndEditStoryActivity;Ljava/lang/Runnable;)V

    .line 453
    return-void
.end method
