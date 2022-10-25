.class Lcom/vk/attachpicker/fragment/GalleryFragment$3;
.super Ljava/lang/Object;
.source "GalleryFragment.java"

# interfaces
.implements Lcom/vk/core/util/IntentUtils$ResolveCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/attachpicker/fragment/GalleryFragment;->onActivityResult(IILandroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/attachpicker/fragment/GalleryFragment;

.field final synthetic val$a:Landroid/app/Activity;

.field final synthetic val$requestCode:I


# direct methods
.method constructor <init>(Lcom/vk/attachpicker/fragment/GalleryFragment;ILandroid/app/Activity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/attachpicker/fragment/GalleryFragment;

    .prologue
    .line 411
    iput-object p1, p0, Lcom/vk/attachpicker/fragment/GalleryFragment$3;->this$0:Lcom/vk/attachpicker/fragment/GalleryFragment;

    iput p2, p0, Lcom/vk/attachpicker/fragment/GalleryFragment$3;->val$requestCode:I

    iput-object p3, p0, Lcom/vk/attachpicker/fragment/GalleryFragment$3;->val$a:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError()V
    .locals 3

    .prologue
    .line 449
    iget-object v0, p0, Lcom/vk/attachpicker/fragment/GalleryFragment$3;->val$a:Landroid/app/Activity;

    const v1, 0x7f0804d2

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 450
    return-void
.end method

.method public onResolved(Ljava/io/File;)V
    .locals 10
    .param p1, "file"    # Ljava/io/File;

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    const/4 v9, 0x3

    .line 414
    iget v7, p0, Lcom/vk/attachpicker/fragment/GalleryFragment$3;->val$requestCode:I

    if-ne v7, v9, :cond_3

    move v4, v5

    .line 415
    .local v4, "videoRequest":Z
    :goto_0
    iget v7, p0, Lcom/vk/attachpicker/fragment/GalleryFragment$3;->val$requestCode:I

    const/4 v8, 0x2

    if-ne v7, v8, :cond_4

    move v1, v5

    .line 416
    .local v1, "photoRequest":Z
    :goto_1
    iget-object v5, p0, Lcom/vk/attachpicker/fragment/GalleryFragment$3;->this$0:Lcom/vk/attachpicker/fragment/GalleryFragment;

    invoke-static {v5}, Lcom/vk/attachpicker/fragment/GalleryFragment;->access$500(Lcom/vk/attachpicker/fragment/GalleryFragment;)Z

    move-result v5

    if-nez v5, :cond_1

    if-eqz v1, :cond_0

    iget-object v5, p0, Lcom/vk/attachpicker/fragment/GalleryFragment$3;->this$0:Lcom/vk/attachpicker/fragment/GalleryFragment;

    invoke-static {v5}, Lcom/vk/attachpicker/fragment/GalleryFragment;->access$600(Lcom/vk/attachpicker/fragment/GalleryFragment;)Z

    move-result v5

    if-nez v5, :cond_1

    :cond_0
    if-eqz v4, :cond_6

    iget-object v5, p0, Lcom/vk/attachpicker/fragment/GalleryFragment$3;->this$0:Lcom/vk/attachpicker/fragment/GalleryFragment;

    invoke-static {v5}, Lcom/vk/attachpicker/fragment/GalleryFragment;->access$700(Lcom/vk/attachpicker/fragment/GalleryFragment;)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 418
    :cond_1
    iget v5, p0, Lcom/vk/attachpicker/fragment/GalleryFragment$3;->val$requestCode:I

    if-ne v5, v9, :cond_5

    .line 419
    invoke-static {p1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v5

    invoke-static {v5}, Lcom/vk/attachpicker/SelectionContext;->packSingleVideo(Landroid/net/Uri;)Landroid/content/Intent;

    move-result-object v2

    .line 423
    .local v2, "result":Landroid/content/Intent;
    :goto_2
    iget-object v5, p0, Lcom/vk/attachpicker/fragment/GalleryFragment$3;->val$a:Landroid/app/Activity;

    const/4 v6, -0x1

    invoke-virtual {v5, v6, v2}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 424
    iget-object v5, p0, Lcom/vk/attachpicker/fragment/GalleryFragment$3;->val$a:Landroid/app/Activity;

    invoke-virtual {v5}, Landroid/app/Activity;->finish()V

    .line 445
    .end local v2    # "result":Landroid/content/Intent;
    :cond_2
    :goto_3
    return-void

    .end local v1    # "photoRequest":Z
    .end local v4    # "videoRequest":Z
    :cond_3
    move v4, v6

    .line 414
    goto :goto_0

    .restart local v4    # "videoRequest":Z
    :cond_4
    move v1, v6

    .line 415
    goto :goto_1

    .line 421
    .restart local v1    # "photoRequest":Z
    :cond_5
    invoke-static {p1}, Lcom/vk/attachpicker/SelectionContext;->packSinglePhoto(Ljava/io/File;)Landroid/content/Intent;

    move-result-object v2

    .restart local v2    # "result":Landroid/content/Intent;
    goto :goto_2

    .line 427
    .end local v2    # "result":Landroid/content/Intent;
    :cond_6
    :try_start_0
    iget-object v5, p0, Lcom/vk/attachpicker/fragment/GalleryFragment$3;->this$0:Lcom/vk/attachpicker/fragment/GalleryFragment;

    invoke-static {v5}, Lcom/vk/attachpicker/fragment/GalleryFragment;->access$800(Lcom/vk/attachpicker/fragment/GalleryFragment;)Lcom/vk/core/simplescreen/WindowScreenContainer;

    move-result-object v5

    if-nez v5, :cond_7

    .line 428
    iget-object v5, p0, Lcom/vk/attachpicker/fragment/GalleryFragment$3;->this$0:Lcom/vk/attachpicker/fragment/GalleryFragment;

    new-instance v6, Lcom/vk/core/simplescreen/WindowScreenContainer;

    iget-object v7, p0, Lcom/vk/attachpicker/fragment/GalleryFragment$3;->this$0:Lcom/vk/attachpicker/fragment/GalleryFragment;

    invoke-virtual {v7}, Lcom/vk/attachpicker/fragment/GalleryFragment;->getActivity()Landroid/app/Activity;

    move-result-object v7

    invoke-direct {v6, v7}, Lcom/vk/core/simplescreen/WindowScreenContainer;-><init>(Landroid/app/Activity;)V

    invoke-static {v5, v6}, Lcom/vk/attachpicker/fragment/GalleryFragment;->access$802(Lcom/vk/attachpicker/fragment/GalleryFragment;Lcom/vk/core/simplescreen/WindowScreenContainer;)Lcom/vk/core/simplescreen/WindowScreenContainer;

    .line 430
    :cond_7
    iget-object v5, p0, Lcom/vk/attachpicker/fragment/GalleryFragment$3;->this$0:Lcom/vk/attachpicker/fragment/GalleryFragment;

    invoke-static {v5}, Lcom/vk/attachpicker/fragment/GalleryFragment;->access$800(Lcom/vk/attachpicker/fragment/GalleryFragment;)Lcom/vk/core/simplescreen/WindowScreenContainer;

    move-result-object v5

    invoke-virtual {v5}, Lcom/vk/core/simplescreen/WindowScreenContainer;->isShowing()Z

    move-result v5

    if-nez v5, :cond_2

    .line 431
    iget-object v5, p0, Lcom/vk/attachpicker/fragment/GalleryFragment$3;->this$0:Lcom/vk/attachpicker/fragment/GalleryFragment;

    invoke-static {v5}, Lcom/vk/attachpicker/fragment/GalleryFragment;->access$800(Lcom/vk/attachpicker/fragment/GalleryFragment;)Lcom/vk/core/simplescreen/WindowScreenContainer;

    move-result-object v5

    invoke-virtual {v5}, Lcom/vk/core/simplescreen/WindowScreenContainer;->show()V

    .line 434
    iget v5, p0, Lcom/vk/attachpicker/fragment/GalleryFragment$3;->val$requestCode:I

    if-ne v5, v9, :cond_8

    .line 435
    new-instance v3, Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-static {p1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v5

    iget-object v6, p0, Lcom/vk/attachpicker/fragment/GalleryFragment$3;->this$0:Lcom/vk/attachpicker/fragment/GalleryFragment;

    invoke-static {v6}, Lcom/vk/attachpicker/fragment/GalleryFragment;->access$900(Lcom/vk/attachpicker/fragment/GalleryFragment;)J

    move-result-wide v6

    const/4 v8, 0x0

    invoke-direct {v3, v5, v6, v7, v8}, Lcom/vk/attachpicker/screen/TrimScreen;-><init>(Landroid/net/Uri;JLcom/vk/attachpicker/screen/TrimScreen$Delegate;)V

    .line 439
    .local v3, "screen":Lcom/vk/core/simplescreen/BaseScreen;
    :goto_4
    iget-object v5, p0, Lcom/vk/attachpicker/fragment/GalleryFragment$3;->this$0:Lcom/vk/attachpicker/fragment/GalleryFragment;

    invoke-static {v5}, Lcom/vk/attachpicker/fragment/GalleryFragment;->access$800(Lcom/vk/attachpicker/fragment/GalleryFragment;)Lcom/vk/core/simplescreen/WindowScreenContainer;

    move-result-object v5

    invoke-virtual {v5, v3}, Lcom/vk/core/simplescreen/WindowScreenContainer;->showScreen(Lcom/vk/core/simplescreen/BaseScreen;)V

    goto :goto_3

    .line 441
    .end local v3    # "screen":Lcom/vk/core/simplescreen/BaseScreen;
    :catch_0
    move-exception v0

    .line 442
    .local v0, "e":Ljava/lang/Exception;
    goto :goto_3

    .line 437
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_8
    new-instance v3, Lcom/vk/attachpicker/screen/EditorScreen;

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/vk/attachpicker/fragment/GalleryFragment$3;->this$0:Lcom/vk/attachpicker/fragment/GalleryFragment;

    invoke-static {v6}, Lcom/vk/attachpicker/fragment/GalleryFragment;->access$1000(Lcom/vk/attachpicker/fragment/GalleryFragment;)Z

    move-result v6

    invoke-direct {v3, p1, v5, v6}, Lcom/vk/attachpicker/screen/EditorScreen;-><init>(Ljava/io/File;Lcom/vk/attachpicker/screen/EditorScreen$Delegate;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .restart local v3    # "screen":Lcom/vk/core/simplescreen/BaseScreen;
    goto :goto_4
.end method
