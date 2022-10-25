.class Lcom/vk/attachpicker/AttachActivity$FragmentAdapter;
.super Landroid/support/v13/app/FragmentPagerAdapter;
.source "AttachActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/attachpicker/AttachActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FragmentAdapter"
.end annotation


# instance fields
.field private currentToolbar:Landroid/view/ViewGroup;

.field final synthetic this$0:Lcom/vk/attachpicker/AttachActivity;


# direct methods
.method public constructor <init>(Lcom/vk/attachpicker/AttachActivity;Landroid/app/FragmentManager;)V
    .locals 0
    .param p2, "fm"    # Landroid/app/FragmentManager;

    .prologue
    .line 579
    iput-object p1, p0, Lcom/vk/attachpicker/AttachActivity$FragmentAdapter;->this$0:Lcom/vk/attachpicker/AttachActivity;

    .line 580
    invoke-direct {p0, p2}, Landroid/support/v13/app/FragmentPagerAdapter;-><init>(Landroid/app/FragmentManager;)V

    .line 581
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 600
    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity$FragmentAdapter;->this$0:Lcom/vk/attachpicker/AttachActivity;

    invoke-static {v0}, Lcom/vk/attachpicker/AttachActivity;->access$900(Lcom/vk/attachpicker/AttachActivity;)Lcom/vk/attachpicker/adapter/TabsAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/attachpicker/adapter/TabsAdapter;->getItemCount()I

    move-result v0

    return v0
.end method

.method public getItem(I)Landroid/app/Fragment;
    .locals 3
    .param p1, "position"    # I

    .prologue
    .line 587
    const/4 v1, 0x0

    .line 590
    .local v1, "fragment":Landroid/app/Fragment;
    :try_start_0
    iget-object v2, p0, Lcom/vk/attachpicker/AttachActivity$FragmentAdapter;->this$0:Lcom/vk/attachpicker/AttachActivity;

    invoke-static {v2}, Lcom/vk/attachpicker/AttachActivity;->access$900(Lcom/vk/attachpicker/AttachActivity;)Lcom/vk/attachpicker/adapter/TabsAdapter;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vk/attachpicker/adapter/TabsAdapter;->getItems()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vk/attachpicker/adapter/TabsAdapter$TabInfo;

    iget-object v2, v2, Lcom/vk/attachpicker/adapter/TabsAdapter$TabInfo;->fragmentFactoryMethod:Lcom/vkontakte/android/functions/F0;

    invoke-interface {v2}, Lcom/vkontakte/android/functions/F0;->f()Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "fragment":Landroid/app/Fragment;
    check-cast v1, Landroid/app/Fragment;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 595
    .restart local v1    # "fragment":Landroid/app/Fragment;
    return-object v1

    .line 591
    .end local v1    # "fragment":Landroid/app/Fragment;
    :catch_0
    move-exception v0

    .line 592
    .local v0, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public setPrimaryItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 3
    .param p1, "container"    # Landroid/view/ViewGroup;
    .param p2, "position"    # I
    .param p3, "object"    # Ljava/lang/Object;

    .prologue
    .line 605
    invoke-super {p0, p1, p2, p3}, Landroid/support/v13/app/FragmentPagerAdapter;->setPrimaryItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V

    move-object v0, p3

    .line 607
    check-cast v0, Landroid/app/Fragment;

    .line 608
    .local v0, "fragment":Landroid/app/Fragment;
    instance-of v2, v0, Lcom/vk/attachpicker/SupportExternalToolbarContainer;

    if-eqz v2, :cond_1

    .line 610
    check-cast v0, Lcom/vk/attachpicker/SupportExternalToolbarContainer;

    .end local v0    # "fragment":Landroid/app/Fragment;
    iget-object v2, p0, Lcom/vk/attachpicker/AttachActivity$FragmentAdapter;->this$0:Lcom/vk/attachpicker/AttachActivity;

    invoke-interface {v0, v2}, Lcom/vk/attachpicker/SupportExternalToolbarContainer;->provideToolbar(Landroid/content/Context;)Landroid/view/ViewGroup;

    move-result-object v1

    .line 612
    .local v1, "toolbar":Landroid/view/ViewGroup;
    if-eqz v1, :cond_1

    iget-object v2, p0, Lcom/vk/attachpicker/AttachActivity$FragmentAdapter;->currentToolbar:Landroid/view/ViewGroup;

    if-eq v2, v1, :cond_1

    .line 613
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 614
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 616
    :cond_0
    iget-object v2, p0, Lcom/vk/attachpicker/AttachActivity$FragmentAdapter;->this$0:Lcom/vk/attachpicker/AttachActivity;

    invoke-static {v2}, Lcom/vk/attachpicker/AttachActivity;->access$1500(Lcom/vk/attachpicker/AttachActivity;)Lcom/vk/attachpicker/widget/ToolbarContainer;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vk/attachpicker/widget/ToolbarContainer;->removeAllViews()V

    .line 617
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 618
    iget-object v2, p0, Lcom/vk/attachpicker/AttachActivity$FragmentAdapter;->this$0:Lcom/vk/attachpicker/AttachActivity;

    invoke-static {v2}, Lcom/vk/attachpicker/AttachActivity;->access$1500(Lcom/vk/attachpicker/AttachActivity;)Lcom/vk/attachpicker/widget/ToolbarContainer;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/vk/attachpicker/widget/ToolbarContainer;->addView(Landroid/view/View;)V

    .line 619
    iput-object v1, p0, Lcom/vk/attachpicker/AttachActivity$FragmentAdapter;->currentToolbar:Landroid/view/ViewGroup;

    .line 622
    .end local v1    # "toolbar":Landroid/view/ViewGroup;
    :cond_1
    return-void
.end method
