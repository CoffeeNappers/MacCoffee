.class Lcom/vk/stories/CreateAndEditStoryActivity$92;
.super Ljava/lang/Object;
.source "CreateAndEditStoryActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/CreateAndEditStoryActivity;->onTextClick()V
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
    .line 2993
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$92;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 2996
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$92;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$7600(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    .line 2997
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$92;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$7502(Lcom/vk/stories/CreateAndEditStoryActivity;Lcom/vk/attachpicker/stickers/TextStickerDialog;)Lcom/vk/attachpicker/stickers/TextStickerDialog;

    .line 2998
    return-void
.end method
