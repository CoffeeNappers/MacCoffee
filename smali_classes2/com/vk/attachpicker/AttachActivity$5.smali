.class Lcom/vk/attachpicker/AttachActivity$5;
.super Ljava/lang/Object;
.source "AttachActivity.java"

# interfaces
.implements Landroid/support/v4/view/ViewPager$OnPageChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/attachpicker/AttachActivity;->initViews()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/attachpicker/AttachActivity;


# direct methods
.method constructor <init>(Lcom/vk/attachpicker/AttachActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/attachpicker/AttachActivity;

    .prologue
    .line 252
    iput-object p1, p0, Lcom/vk/attachpicker/AttachActivity$5;->this$0:Lcom/vk/attachpicker/AttachActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPageScrollStateChanged(I)V
    .locals 0
    .param p1, "state"    # I

    .prologue
    .line 285
    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 1
    .param p1, "position"    # I
    .param p2, "positionOffset"    # F
    .param p3, "positionOffsetPixels"    # I

    .prologue
    .line 255
    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity$5;->this$0:Lcom/vk/attachpicker/AttachActivity;

    invoke-static {v0, p1}, Lcom/vk/attachpicker/AttachActivity;->access$002(Lcom/vk/attachpicker/AttachActivity;I)I

    .line 256
    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity$5;->this$0:Lcom/vk/attachpicker/AttachActivity;

    invoke-static {v0, p2}, Lcom/vk/attachpicker/AttachActivity;->access$102(Lcom/vk/attachpicker/AttachActivity;F)F

    .line 258
    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity$5;->this$0:Lcom/vk/attachpicker/AttachActivity;

    invoke-static {v0}, Lcom/vk/attachpicker/AttachActivity;->access$200(Lcom/vk/attachpicker/AttachActivity;)V

    .line 259
    return-void
.end method

.method public onPageSelected(I)V
    .locals 5
    .param p1, "position"    # I

    .prologue
    const/4 v4, 0x0

    .line 263
    iget-object v1, p0, Lcom/vk/attachpicker/AttachActivity$5;->this$0:Lcom/vk/attachpicker/AttachActivity;

    invoke-static {v1}, Lcom/vk/attachpicker/AttachActivity;->access$300(Lcom/vk/attachpicker/AttachActivity;)Landroid/support/v7/widget/RecyclerView;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/support/v7/widget/RecyclerView;->smoothScrollToPosition(I)V

    .line 265
    iget-object v1, p0, Lcom/vk/attachpicker/AttachActivity$5;->this$0:Lcom/vk/attachpicker/AttachActivity;

    invoke-static {v1}, Lcom/vk/attachpicker/AttachActivity;->access$400(Lcom/vk/attachpicker/AttachActivity;)Lcom/vk/attachpicker/SelectionContext;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/attachpicker/SelectionContext;->selectionCount()I

    move-result v1

    if-lez v1, :cond_1

    iget-object v1, p0, Lcom/vk/attachpicker/AttachActivity$5;->this$0:Lcom/vk/attachpicker/AttachActivity;

    invoke-static {v1}, Lcom/vk/attachpicker/AttachActivity;->access$500(Lcom/vk/attachpicker/AttachActivity;)Lcom/vk/attachpicker/widget/ContentViewPager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/attachpicker/widget/ContentViewPager;->getCurrentItem()I

    move-result v1

    if-nez v1, :cond_1

    .line 266
    iget-object v1, p0, Lcom/vk/attachpicker/AttachActivity$5;->this$0:Lcom/vk/attachpicker/AttachActivity;

    invoke-static {v1}, Lcom/vk/attachpicker/AttachActivity;->access$600(Lcom/vk/attachpicker/AttachActivity;)V

    .line 271
    :goto_0
    iget-object v1, p0, Lcom/vk/attachpicker/AttachActivity$5;->this$0:Lcom/vk/attachpicker/AttachActivity;

    invoke-static {v1}, Lcom/vk/attachpicker/AttachActivity;->access$800(Lcom/vk/attachpicker/AttachActivity;)V

    .line 273
    iget-object v1, p0, Lcom/vk/attachpicker/AttachActivity$5;->this$0:Lcom/vk/attachpicker/AttachActivity;

    invoke-static {v1}, Lcom/vk/attachpicker/AttachActivity;->access$900(Lcom/vk/attachpicker/AttachActivity;)Lcom/vk/attachpicker/adapter/TabsAdapter;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/attachpicker/adapter/TabsAdapter;->getItems()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/attachpicker/adapter/TabsAdapter$TabInfo;

    .line 275
    .local v0, "tabInfo":Lcom/vk/attachpicker/adapter/TabsAdapter$TabInfo;
    iget v1, v0, Lcom/vk/attachpicker/adapter/TabsAdapter$TabInfo;->iconResId:I

    const v2, 0x7f020201

    if-ne v1, v2, :cond_0

    .line 277
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const-string/jumbo v2, "Attach_Prefs"

    invoke-virtual {v1, v2, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string/jumbo v2, "MONEY_ATTACH_BADGE_SEEN"

    const/4 v3, 0x1

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 278
    iput-boolean v4, v0, Lcom/vk/attachpicker/adapter/TabsAdapter$TabInfo;->showBadge:Z

    .line 280
    :cond_0
    iget-object v1, p0, Lcom/vk/attachpicker/AttachActivity$5;->this$0:Lcom/vk/attachpicker/AttachActivity;

    invoke-static {v1}, Lcom/vk/attachpicker/AttachActivity;->access$200(Lcom/vk/attachpicker/AttachActivity;)V

    .line 281
    return-void

    .line 268
    .end local v0    # "tabInfo":Lcom/vk/attachpicker/adapter/TabsAdapter$TabInfo;
    :cond_1
    iget-object v1, p0, Lcom/vk/attachpicker/AttachActivity$5;->this$0:Lcom/vk/attachpicker/AttachActivity;

    invoke-static {v1}, Lcom/vk/attachpicker/AttachActivity;->access$700(Lcom/vk/attachpicker/AttachActivity;)V

    goto :goto_0
.end method
